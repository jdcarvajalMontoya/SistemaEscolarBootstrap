-- Script SQL para insertar datos de educación docente
-- Ejecutar en pgAdmin4

-- Primero, verificar las hojas de vida existentes
SELECT id, usuario_id FROM core_hojadevidadocente;

-- Insertar datos de educación para diferentes niveles
-- Nota: Reemplaza '1' con el ID real de la hoja de vida del docente

-- EDUCACIÓN PRIMARIA
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Primaria',
    'Institución Educativa San José',
    'Certificado de Educación Primaria',
    '1995-02-01',
    '2000-11-30'
);

-- EDUCACIÓN SECUNDARIA
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Secundaria',
    'Colegio San Francisco de Asís',
    'Bachiller Académico',
    '2001-02-01',
    '2006-11-30'
);

-- EDUCACIÓN SUPERIOR - PREGRADO
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Superior',
    'Universidad de Antioquia',
    'Licenciado en Matemáticas',
    '2007-02-01',
    '2012-11-30'
);

-- EDUCACIÓN SUPERIOR - POSGRADO
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Posgrado',
    'Universidad Nacional de Colombia',
    'Magíster en Educación',
    '2015-02-01',
    '2017-11-30'
);

-- EDUCACIÓN TÉCNICA
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Técnica',
    'SENA',
    'Técnico en Sistemas',
    '2010-02-01',
    '2012-11-30'
);

-- EDUCACIÓN TECNOLÓGICA
INSERT INTO core_educaciondocente (
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
) VALUES (
    1, -- Reemplazar con el ID real de la hoja de vida
    'Tecnológica',
    'Instituto Tecnológico Metropolitano',
    'Tecnólogo en Informática',
    '2013-02-01',
    '2015-11-30'
);

-- Verificar que se insertaron correctamente
SELECT 
    id,
    hoja_de_vida_id,
    nivel,
    institucion,
    titulo_obtenido,
    fecha_inicio,
    fecha_fin
FROM core_educaciondocente
ORDER BY fecha_inicio;

-- Consulta para ver educación por docente
SELECT 
    hvd.id as hoja_vida_id,
    u.correo,
    ed.nivel,
    ed.institucion,
    ed.titulo_obtenido,
    ed.fecha_inicio,
    ed.fecha_fin
FROM core_educaciondocente ed
JOIN core_hojadevidadocente hvd ON ed.hoja_de_vida_id = hvd.id
JOIN core_usuario u ON hvd.usuario_id = u.id
ORDER BY u.correo, ed.fecha_inicio; 