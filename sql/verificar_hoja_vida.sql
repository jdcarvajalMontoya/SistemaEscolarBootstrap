-- Script para verificar hojas de vida existentes
-- Ejecutar en pgAdmin4 para obtener el ID correcto

-- Ver todas las hojas de vida con información del usuario
SELECT 
    hvd.id as hoja_vida_id,
    u.correo,
    u.numero_documento,
    pf.primer_nombre,
    pf.primer_apellido,
    hvd.fecha_nacimiento,
    hvd.telefono_celular
FROM core_hojadevidadocente hvd
JOIN core_usuario u ON hvd.usuario_id = u.id
LEFT JOIN core_perfildeusuario pf ON u.id = pf.usuario_id
ORDER BY hvd.id;

-- Ver solo los IDs de hojas de vida
SELECT 
    id as hoja_vida_id,
    usuario_id
FROM core_hojadevidadocente
ORDER BY id;

-- Ver usuarios que son docentes
SELECT 
    u.id as usuario_id,
    u.correo,
    u.numero_documento,
    r.nombre as rol
FROM core_usuario u
JOIN core_rol r ON u.rol_id = r.id
WHERE r.nombre = 'Docente'
ORDER BY u.id;

-- Verificar si hay educación ya registrada
SELECT 
    COUNT(*) as total_educacion,
    hoja_de_vida_id
FROM core_educaciondocente
GROUP BY hoja_de_vida_id
ORDER BY hoja_de_vida_id; 