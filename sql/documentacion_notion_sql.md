# 📚 Bloque 3 - Bloque Técnico Reforzado: SQL Avanzado

## 🎯 Objetivo del Módulo
Estudio de SQL avanzado (consultas, joins, subqueries) con práctica en entorno real y documentación completa en Notion.

---

## 📋 Estructura del Curso

### **Módulo 1: Subconsultas (Subqueries)**
### **Módulo 2: JOINs Avanzados**
### **Módulo 3: Funciones de Ventana (Window Functions)**
### **Módulo 4: Consultas Complejas**

---

## 🗄️ Base de Datos: Sistema de Gestión Escolar

### **Estructura de Tablas:**
- **estudiantes** - Información de estudiantes
- **profesores** - Información de profesores
- **cursos** - Catálogo de cursos
- **secciones** - Secciones de cursos
- **inscripciones** - Inscripciones de estudiantes
- **evaluaciones** - Evaluaciones por sección
- **calificaciones** - Calificaciones de estudiantes
- **asistencia** - Control de asistencia
- **pagos** - Información de pagos
- **departamentos** - Departamentos académicos

---

## 📖 MÓDULO 1: SUBCONSULTAS (SUBQUERIES)

### **1.1 Subconsulta en SELECT**
**Objetivo:** Obtener el nombre del estudiante y su calificación final, junto con el promedio de calificaciones de su sección.

```sql
SELECT 
    e.nombre || ' ' || e.apellido as estudiante_completo,
    i.calificacion_final,
    (SELECT AVG(calificacion_final) 
     FROM inscripciones 
     WHERE seccion_id = i.seccion_id) as promedio_seccion
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
WHERE i.estado = 'aprobado';
```

**Explicación:**
- La subconsulta `(SELECT AVG(calificacion_final) FROM inscripciones WHERE seccion_id = i.seccion_id)` calcula el promedio de calificaciones para cada sección
- Se ejecuta una vez por cada fila del resultado principal
- Permite comparar el rendimiento individual vs el promedio del grupo

**Resultado esperado:**
| estudiante_completo | calificacion_final | promedio_seccion |
|-------------------|------------------|------------------|
| Alejandro Vargas | 4.20 | 3.93 |
| Sofía Ramírez | 3.80 | 3.93 |
| Diego Moreno | 3.50 | 3.93 |

---

### **1.2 Subconsulta en WHERE**
**Objetivo:** Encontrar estudiantes que tienen un promedio general mayor al promedio general de todos los estudiantes.

```sql
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
```

**Explicación:**
- La subconsulta en WHERE filtra los resultados basándose en una condición calculada
- Se ejecuta una sola vez y su resultado se usa para filtrar todas las filas
- Útil para encontrar valores que están por encima o debajo del promedio

**Resultado esperado:**
| estudiante_completo | promedio_general |
|-------------------|------------------|
| Valentina Jiménez | 4.25 |
| Daniela Ruiz | 4.20 |
| Mariana Flores | 4.18 |

---

### **1.3 Subconsulta en FROM**
**Objetivo:** Obtener el departamento con mayor número de estudiantes inscritos.

```sql
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
```

**Explicación:**
- La subconsulta en FROM crea una tabla temporal con estadísticas por departamento
- Permite realizar operaciones complejas en múltiples pasos
- Útil para análisis estadísticos y reportes ejecutivos

---

### **1.4 Subconsulta Correlacionada**
**Objetivo:** Encontrar profesores que ganan más que el promedio de salario de su departamento.

```sql
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
```

**Explicación:**
- La subconsulta correlacionada se ejecuta para cada fila de la consulta principal
- Usa valores de la consulta externa (`p.departamento`) en la subconsulta
- Permite comparaciones específicas por grupo

---

## 🔗 MÓDULO 2: JOINs AVANZADOS

### **2.1 INNER JOIN Múltiple**
**Objetivo:** Obtener información completa de inscripciones con datos de estudiante, curso y profesor.

```sql
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
```

**Explicación:**
- Combina múltiples tablas para obtener información completa
- Solo muestra registros que existen en todas las tablas
- Útil para reportes detallados y análisis completos

---

### **2.2 LEFT JOIN**
**Objetivo:** Mostrar todos los cursos y el número de estudiantes inscritos (incluyendo cursos sin estudiantes).

```sql
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
```

**Explicación:**
- LEFT JOIN mantiene todos los registros de la tabla izquierda
- Incluye cursos que no tienen estudiantes inscritos
- COALESCE maneja valores NULL en el promedio

---

### **2.3 SELF JOIN**
**Objetivo:** Encontrar profesores que trabajan en el mismo departamento.

```sql
SELECT 
    p1.nombre || ' ' || p1.apellido as profesor1,
    p2.nombre || ' ' || p2.apellido as profesor2,
    p1.departamento
FROM profesores p1
INNER JOIN profesores p2 ON p1.departamento = p2.departamento
WHERE p1.profesor_id < p2.profesor_id
ORDER BY p1.departamento, p1.apellido;
```

**Explicación:**
- SELF JOIN une una tabla consigo misma
- Útil para encontrar relaciones dentro de la misma entidad
- La condición `p1.profesor_id < p2.profesor_id` evita duplicados

---

### **2.4 CROSS JOIN**
**Objetivo:** Generar todas las combinaciones posibles de estudiantes y cursos.

```sql
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    c.nombre as curso,
    c.departamento
FROM estudiantes e
CROSS JOIN cursos c
WHERE e.estado = 'activo' AND c.estado = 'activo'
LIMIT 50;
```

**Explicación:**
- CROSS JOIN genera el producto cartesiano de dos tablas
- Útil para análisis de combinaciones posibles
- Requiere LIMIT para evitar resultados masivos

---

## 📊 MÓDULO 3: FUNCIONES DE VENTANA (WINDOW FUNCTIONS)

### **3.1 ROW_NUMBER()**
**Objetivo:** Clasificar estudiantes por departamento según su promedio general.

```sql
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
```

**Explicación:**
- ROW_NUMBER() asigna números únicos secuenciales
- PARTITION BY divide los datos en grupos
- Útil para rankings y clasificaciones

---

### **3.2 RANK() y DENSE_RANK()**
**Objetivo:** Comparar RANK() vs DENSE_RANK() para calificaciones.

```sql
SELECT 
    e.nombre || ' ' || e.apellido as estudiante,
    i.calificacion_final,
    RANK() OVER (ORDER BY i.calificacion_final DESC) as rank_general,
    DENSE_RANK() OVER (ORDER BY i.calificacion_final DESC) as dense_rank_general
FROM estudiantes e
JOIN inscripciones i ON e.estudiante_id = i.estudiante_id
WHERE i.estado = 'aprobado'
ORDER BY i.calificacion_final DESC;
```

**Diferencias:**
- **RANK()**: Salta números en caso de empates
- **DENSE_RANK()**: No salta números en caso de empates

---

### **3.3 LAG() y LEAD()**
**Objetivo:** Comparar calificaciones de un estudiante con la anterior y siguiente.

```sql
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
```

**Explicación:**
- **LAG()**: Accede a la fila anterior
- **LEAD()**: Accede a la fila siguiente
- Útil para análisis de tendencias y progresión

---

## 🎯 MÓDULO 4: CONSULTAS COMPLEJAS

### **4.1 Análisis de Rendimiento Académico**
**Objetivo:** Crear un reporte completo de rendimiento por estudiante.

```sql
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
```

**Explicación:**
- Usa Common Table Expression (CTE) para organizar la lógica
- Combina múltiples métricas en un solo reporte
- Incluye clasificación automática basada en criterios

---

### **4.2 Análisis de Asistencia y Rendimiento**
**Objetivo:** Correlacionar asistencia con calificaciones.

```sql
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
```

---

### **4.3 Análisis Financiero**
**Objetivo:** Reporte de pagos y estado financiero por estudiante.

```sql
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
```

---

### **4.4 Dashboard Ejecutivo**
**Objetivo:** Resumen ejecutivo para la dirección.

```sql
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
```

---

## 📝 Actividades Prácticas

### **Ejercicio 1: Análisis de Rendimiento**
1. Ejecuta la consulta de rendimiento académico
2. Identifica los 3 mejores estudiantes
3. Analiza los patrones de rendimiento por departamento

### **Ejercicio 2: Reporte de Asistencia**
1. Ejecuta el análisis de asistencia
2. Identifica estudiantes en riesgo académico
3. Propón estrategias de intervención

### **Ejercicio 3: Dashboard Personalizado**
1. Crea tu propio dashboard ejecutivo
2. Agrega métricas adicionales
3. Visualiza los resultados en una herramienta de BI

---

## 🎓 Evaluación del Módulo

### **Criterios de Evaluación:**
- ✅ Comprensión de subconsultas
- ✅ Dominio de JOINs avanzados
- ✅ Uso correcto de funciones de ventana
- ✅ Capacidad para crear consultas complejas
- ✅ Documentación en Notion

### **Proyecto Final:**
Crear un reporte completo de análisis académico que incluya:
- Rendimiento por departamento
- Análisis de tendencias temporales
- Identificación de estudiantes en riesgo
- Recomendaciones de mejora

---

## 📚 Recursos Adicionales

### **Documentación PostgreSQL:**
- [Window Functions](https://www.postgresql.org/docs/current/tutorial-window.html)
- [Subqueries](https://www.postgresql.org/docs/current/functions-subquery.html)
- [JOINs](https://www.postgresql.org/docs/current/queries-table-expressions.html)

### **Herramientas Recomendadas:**
- **pgAdmin** - Interfaz gráfica para PostgreSQL
- **DBeaver** - Cliente universal de bases de datos
- **Tableau** - Visualización de datos
- **Power BI** - Análisis de datos empresarial

---

## 🏆 Logros del Módulo

Al completar este módulo, serás capaz de:
- ✅ Escribir consultas SQL complejas y optimizadas
- ✅ Utilizar subconsultas en diferentes contextos
- ✅ Dominar todos los tipos de JOINs
- ✅ Implementar funciones de ventana para análisis avanzado
- ✅ Crear reportes ejecutivos completos
- ✅ Documentar soluciones técnicas de manera profesional

---

*¡Felicitaciones por completar el Bloque 3 - SQL Avanzado! 🎉* 