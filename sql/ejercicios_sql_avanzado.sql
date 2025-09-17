-- =====================================================
-- EJERCICIOS SQL AVANZADO - POSTGRESQL
-- Sistema de Gestión Escolar
-- =====================================================

-- =====================================================
-- MÓDULO 1: SUBCONSULTAS (SUBQUERIES)
-- =====================================================

-- Ejercicio 1.1: Subconsulta en SELECT
-- Obtener el nombre del estudiante y su calificación final, junto con el promedio de calificaciones de su sección
SELECT 
    e.nombre || ' ' || e.apellido as estudiante_completo,
    i.calificacion_final,
    (SELECT AVG(calificacion_final) 
     FROM inscripciones 
     WHERE seccion_id = i.seccion_id) as promedio_seccion
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
WHERE i.estado = 'aprobado';

-- Ejercicio 1.2: Subconsulta en WHERE
-- Encontrar estudiantes que tienen un promedio general mayor al promedio general de todos los estudiantes
SELECT 
    nombre || ' ' || apellido as estudiante_completo,
    promedio_general
FROM estudiantes
WHERE promedio_general > (
    SELECT AVG(promedio_general) 
    FROM estudiantes 
    WHERE estado = 'activo'
)
ORDER BY promedio_general DESC;

-- Ejercicio 1.3: Subconsulta en FROM
-- Obtener el departamento con mayor número de estudiantes inscritos
SELECT 
    departamento,
    total_estudiantes
FROM (
    SELECT 
        c.departamento,
        COUNT(DISTINCT i.estudiante_id) as total_estudiantes
    FROM cursos c
    JOIN secciones s ON c.curso_id = s.curso_id
    JOIN inscripciones i ON s.seccion_id = i.seccion_id
    WHERE i.estado = 'aprobado'
    GROUP BY c.departamento
) as dept_stats
WHERE total_estudiantes = (
    SELECT MAX(total_estudiantes)
    FROM (
        SELECT COUNT(DISTINCT i.estudiante_id) as total_estudiantes
        FROM cursos c
        JOIN secciones s ON c.curso_id = s.curso_id
        JOIN inscripciones i ON s.seccion_id = i.seccion_id
        WHERE i.estado = 'aprobado'
        GROUP BY c.departamento
    ) as max_stats
);

-- Ejercicio 1.4: Subconsulta correlacionada
-- Encontrar profesores que ganan más que el promedio de salario de su departamento
SELECT 
    p.nombre || ' ' || p.apellido as profesor_completo,
    p.departamento,
    p.salario,
    (SELECT AVG(salario) 
     FROM profesores 
     WHERE departamento = p.departamento) as promedio_departamento
FROM profesores p
WHERE p.salario > (
    SELECT AVG(salario) 
    FROM profesores 
    WHERE departamento = p.departamento
)
ORDER BY p.departamento, p.salario DESC;

-- =====================================================
-- MÓDULO 2: JOINs AVANZADOS
-- =====================================================

-- Ejercicio 2.1: INNER JOIN múltiple
-- Obtener información completa de inscripciones con datos de estudiante, curso y profesor
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.nombre as curso,
    p.nombre || ' ' || p.apellido as profesor,
    s.codigo_seccion,
    i.calificacion_final,
    i.estado
FROM inscripciones i
INNER JOIN estudiantes e ON i.estudiante_id = e.estudiante_id
INNER JOIN secciones s ON i.seccion_id = s.seccion_id
INNER JOIN cursos c ON s.curso_id = c.curso_id
INNER JOIN profesores p ON s.profesor_id = p.profesor_id
WHERE i.estado = 'aprobado'
ORDER BY e.apellido, c.nombre;

-- Ejercicio 2.2: LEFT JOIN
-- Mostrar todos los cursos y el número de estudiantes inscritos (incluyendo cursos sin estudiantes)
SELECT 
    c.nombre as curso,
    c.departamento,
    COUNT(i.estudiante_id) as total_estudiantes,
    COALESCE(AVG(i.calificacion_final), 0) as promedio_calificaciones
FROM cursos c
LEFT JOIN secciones s ON c.curso_id = s.curso_id
LEFT JOIN inscripciones i ON s.seccion_id = i.seccion_id AND i.estado = 'aprobado'
WHERE c.estado = 'activo'
GROUP BY c.curso_id, c.nombre, c.departamento
ORDER BY total_estudiantes DESC;

-- Ejercicio 2.3: SELF JOIN
-- Encontrar profesores que trabajan en el mismo departamento
SELECT 
    p1.nombre || ' ' || p1.apellido as profesor1,
    p2.nombre || ' ' || p2.apellido as profesor2,
    p1.departamento
FROM profesores p1
INNER JOIN profesores p2 ON p1.departamento = p2.departamento
WHERE p1.profesor_id < p2.profesor_id
ORDER BY p1.departamento, p1.apellido;

-- Ejercicio 2.4: CROSS JOIN
-- Generar todas las combinaciones posibles de estudiantes y cursos (para análisis de inscripciones potenciales)
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.nombre as curso,
    c.departamento
FROM estudiantes e
CROSS JOIN cursos c
WHERE e.estado = 'activo' AND c.estado = 'activo'
LIMIT 50; -- Limitamos para no generar demasiados registros

-- =====================================================
-- MÓDULO 3: FUNCIONES DE VENTANA (WINDOW FUNCTIONS)
-- =====================================================

-- Ejercicio 3.1: ROW_NUMBER()
-- Clasificar estudiantes por departamento según su promedio general
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.departamento,
    i.calificacion_final,
    ROW_NUMBER() OVER (
        PARTITION BY c.departamento 
        ORDER BY i.calificacion_final DESC
    ) as ranking_departamento
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
JOIN secciones s ON i.seccion_id = s.seccion_id
JOIN cursos c ON s.curso_id = c.curso_id
WHERE i.estado = 'aprobado'
ORDER BY c.departamento, ranking_departamento;

-- Ejercicio 3.2: RANK() y DENSE_RANK()
-- Comparar RANK() vs DENSE_RANK() para calificaciones
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    i.calificacion_final,
    RANK() OVER (ORDER BY i.calificacion_final DESC) as rank_general,
    DENSE_RANK() OVER (ORDER BY i.calificacion_final DESC) as dense_rank_general
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
WHERE i.estado = 'aprobado'
ORDER BY i.calificacion_final DESC;

-- Ejercicio 3.3: LAG() y LEAD()
-- Comparar calificaciones de un estudiante con la anterior y siguiente
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.nombre as curso,
    i.calificacion_final,
    LAG(i.calificacion_final) OVER (
        PARTITION BY e.estudiante_id 
        ORDER BY i.fecha_inscripcion
    ) as calificacion_anterior,
    LEAD(i.calificacion_final) OVER (
        PARTITION BY e.estudiante_id 
        ORDER BY i.fecha_inscripcion
    ) as calificacion_siguiente
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
JOIN secciones s ON i.seccion_id = s.seccion_id
JOIN cursos c ON s.curso_id = c.curso_id
WHERE i.estado = 'aprobado'
ORDER BY e.estudiante_id, i.fecha_inscripcion;

-- Ejercicio 3.4: PARTITION BY con agregaciones
-- Calcular estadísticas por departamento con funciones de ventana
SELECT 
    c.departamento,
    c.nombre as curso,
    COUNT(i.estudiante_id) as estudiantes_inscritos,
    AVG(i.calificacion_final) as promedio_calificaciones,
    AVG(i.calificacion_final) OVER (PARTITION BY c.departamento) as promedio_departamento,
    COUNT(i.estudiante_id) OVER (PARTITION BY c.departamento) as total_estudiantes_departamento
FROM cursos c
LEFT JOIN secciones s ON c.curso_id = s.curso_id
LEFT JOIN inscripciones i ON s.seccion_id = i.seccion_id AND i.estado = 'aprobado'
WHERE c.estado = 'activo'
ORDER BY c.departamento, estudiantes_inscritos DESC;

-- =====================================================
-- MÓDULO 4: CONSULTAS COMPLEJAS
-- =====================================================

-- Ejercicio 4.1: Análisis de rendimiento académico
-- Crear un reporte completo de rendimiento por estudiante
WITH rendimiento_estudiante AS (
    SELECT 
        e.estudiante_id,
        e.nombre || ' ' || e.apellido as estudiante_completo,
        COUNT(i.inscripcion_id) as total_cursos,
        AVG(i.calificacion_final) as promedio_general,
        COUNT(CASE WHEN i.calificacion_final >= 4.0 THEN 1 END) as cursos_excelentes,
        COUNT(CASE WHEN i.calificacion_final < 3.0 THEN 1 END) as cursos_bajos
    FROM estudiantes e
    LEFT JOIN inscripciones i ON e.estudiante_id = i.estudiante_id AND i.estado = 'aprobado'
    WHERE e.estado = 'activo'
    GROUP BY e.estudiante_id, e.nombre, e.apellido
)
SELECT 
    estudiante_completo,
    total_cursos,
    ROUND(promedio_general, 2) as promedio_general,
    cursos_excelentes,
    cursos_bajos,
    CASE 
        WHEN promedio_general >= 4.0 THEN 'Excelente'
        WHEN promedio_general >= 3.5 THEN 'Bueno'
        WHEN promedio_general >= 3.0 THEN 'Regular'
        ELSE 'Necesita mejorar'
    END as clasificacion
FROM rendimiento_estudiante
ORDER BY promedio_general DESC;

-- Ejercicio 4.2: Análisis de asistencia y rendimiento
-- Correlacionar asistencia con calificaciones
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.nombre as curso,
    COUNT(a.asistencia_id) as total_clases,
    COUNT(CASE WHEN a.estado = 'presente' THEN 1 END) as clases_presente,
    ROUND(
        COUNT(CASE WHEN a.estado = 'presente' THEN 1 END) * 100.0 / COUNT(a.asistencia_id), 2
    ) as porcentaje_asistencia,
    i.calificacion_final,
    CASE 
        WHEN COUNT(CASE WHEN a.estado = 'presente' THEN 1 END) * 100.0 / COUNT(a.asistencia_id) >= 90 
        AND i.calificacion_final >= 4.0 THEN 'Alto rendimiento'
        WHEN COUNT(CASE WHEN a.estado = 'presente' THEN 1 END) * 100.0 / COUNT(a.asistencia_id) < 80 
        AND i.calificacion_final < 3.0 THEN 'Riesgo académico'
        ELSE 'Rendimiento normal'
    END as estado_academico
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
JOIN secciones s ON i.seccion_id = s.seccion_id
JOIN cursos c ON s.curso_id = c.curso_id
LEFT JOIN asistencia a ON e.estudiante_id = a.estudiante_id AND s.seccion_id = a.seccion_id
WHERE i.estado = 'aprobado'
GROUP BY e.estudiante_id, e.nombre, e.apellido, c.nombre, i.calificacion_final
HAVING COUNT(a.asistencia_id) > 0
ORDER BY porcentaje_asistencia DESC, i.calificacion_final DESC;

-- Ejercicio 4.3: Análisis financiero
-- Reporte de pagos y estado financiero por estudiante
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    COUNT(p.pago_id) as total_pagos,
    SUM(CASE WHEN p.estado = 'pagado' THEN p.monto ELSE 0 END) as total_pagado,
    SUM(CASE WHEN p.estado = 'pendiente' THEN p.monto ELSE 0 END) as total_pendiente,
    SUM(p.monto) as total_debido,
    ROUND(
        SUM(CASE WHEN p.estado = 'pagado' THEN p.monto ELSE 0 END) * 100.0 / SUM(p.monto), 2
    ) as porcentaje_pagado,
    CASE 
        WHEN SUM(CASE WHEN p.estado = 'pendiente' THEN p.monto ELSE 0 END) = 0 THEN 'Al día'
        WHEN SUM(CASE WHEN p.estado = 'pendiente' THEN p.monto ELSE 0 END) <= 200 THEN 'Pago menor pendiente'
        ELSE 'Pago significativo pendiente'
    END as estado_financiero
FROM estudiantes e
LEFT JOIN pagos p ON e.estudiante_id = p.estudiante_id
WHERE e.estado = 'activo'
GROUP BY e.estudiante_id, e.nombre, e.apellido
ORDER BY total_pendiente DESC;

-- Ejercicio 4.4: Dashboard ejecutivo
-- Resumen ejecutivo para la dirección
SELECT 
    'Total Estudiantes' as metric,
    COUNT(*) as valor
FROM estudiantes 
WHERE estado = 'activo'
UNION ALL
SELECT 
    'Total Profesores',
    COUNT(*)
FROM profesores 
WHERE estado = 'activo'
UNION ALL
SELECT 
    'Total Cursos Activos',
    COUNT(*)
FROM cursos 
WHERE estado = 'activo'
UNION ALL
SELECT 
    'Promedio Calificaciones',
    ROUND(AVG(calificacion_final), 2)::TEXT
FROM inscripciones 
WHERE estado = 'aprobado'
UNION ALL
SELECT 
    'Total Ingresos (Pagado)',
    '$' || SUM(monto)::TEXT
FROM pagos 
WHERE estado = 'pagado'
UNION ALL
SELECT 
    'Total Pendiente por Cobrar',
    '$' || SUM(monto)::TEXT
FROM pagos 
WHERE estado = 'pendiente'; 