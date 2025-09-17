-- =====================================================
-- BASE DE DATOS PARA PRÁCTICAS SQL AVANZADO
-- Sistema de Gestión Escolar
-- =====================================================

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS sistema_escolar_avanzado;
USE sistema_escolar_avanzado;

-- =====================================================
-- TABLA: ESTUDIANTES
-- =====================================================
CREATE TABLE estudiantes (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    genero ENUM('M', 'F', 'O'),
    direccion TEXT,
    telefono VARCHAR(20),
    fecha_inscripcion DATE DEFAULT CURRENT_DATE,
    estado ENUM('activo', 'inactivo', 'graduado', 'suspendido') DEFAULT 'activo',
    promedio_general DECIMAL(3,2) DEFAULT 0.00
);

-- =====================================================
-- TABLA: PROFESORES
-- =====================================================
CREATE TABLE profesores (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    especialidad VARCHAR(100),
    fecha_contratacion DATE,
    salario DECIMAL(10,2),
    departamento VARCHAR(100),
    estado ENUM('activo', 'inactivo', 'jubilado') DEFAULT 'activo'
);

-- =====================================================
-- TABLA: CURSOS
-- =====================================================
CREATE TABLE cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    creditos INT DEFAULT 3,
    horas_teoria INT DEFAULT 30,
    horas_practica INT DEFAULT 30,
    nivel ENUM('básico', 'intermedio', 'avanzado') DEFAULT 'básico',
    departamento VARCHAR(100),
    estado ENUM('activo', 'inactivo') DEFAULT 'activo'
);

-- =====================================================
-- TABLA: SECCIONES
-- =====================================================
CREATE TABLE secciones (
    seccion_id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    profesor_id INT,
    codigo_seccion VARCHAR(20) NOT NULL,
    semestre ENUM('2024-1', '2024-2', '2025-1', '2025-2'),
    anio INT DEFAULT 2024,
    cupo_maximo INT DEFAULT 30,
    cupo_actual INT DEFAULT 0,
    horario VARCHAR(100),
    aula VARCHAR(20),
    estado ENUM('abierta', 'cerrada', 'cancelada') DEFAULT 'abierta',
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id),
    FOREIGN KEY (profesor_id) REFERENCES profesores(profesor_id)
);

-- =====================================================
-- TABLA: INSCRIPCIONES
-- =====================================================
CREATE TABLE inscripciones (
    inscripcion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    seccion_id INT,
    fecha_inscripcion DATE DEFAULT CURRENT_DATE,
    calificacion_final DECIMAL(3,2),
    estado ENUM('inscrito', 'aprobado', 'reprobado', 'retirado') DEFAULT 'inscrito',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    FOREIGN KEY (seccion_id) REFERENCES secciones(seccion_id)
);

-- =====================================================
-- TABLA: EVALUACIONES
-- =====================================================
CREATE TABLE evaluaciones (
    evaluacion_id INT PRIMARY KEY AUTO_INCREMENT,
    seccion_id INT,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('examen', 'tarea', 'proyecto', 'participación'),
    peso DECIMAL(3,2) DEFAULT 1.00,
    fecha_evaluacion DATE,
    puntaje_maximo DECIMAL(5,2) DEFAULT 100.00,
    FOREIGN KEY (seccion_id) REFERENCES secciones(seccion_id)
);

-- =====================================================
-- TABLA: CALIFICACIONES
-- =====================================================
CREATE TABLE calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    evaluacion_id INT,
    puntaje_obtenido DECIMAL(5,2),
    fecha_calificacion DATE DEFAULT CURRENT_DATE,
    comentarios TEXT,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    FOREIGN KEY (evaluacion_id) REFERENCES evaluaciones(evaluacion_id)
);

-- =====================================================
-- TABLA: DEPARTAMENTOS
-- =====================================================
CREATE TABLE departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    director_id INT,
    presupuesto DECIMAL(12,2),
    fecha_creacion DATE DEFAULT CURRENT_DATE,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    FOREIGN KEY (director_id) REFERENCES profesores(profesor_id)
);

-- =====================================================
-- TABLA: ASISTENCIA
-- =====================================================
CREATE TABLE asistencia (
    asistencia_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    seccion_id INT,
    fecha DATE,
    estado ENUM('presente', 'ausente', 'tardanza', 'justificada') DEFAULT 'presente',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    FOREIGN KEY (seccion_id) REFERENCES secciones(seccion_id)
);

-- =====================================================
-- TABLA: PAGOS
-- =====================================================
CREATE TABLE pagos (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    monto DECIMAL(10,2) NOT NULL,
    tipo_pago ENUM('matrícula', 'mensualidad', 'laboratorio', 'biblioteca'),
    fecha_pago DATE DEFAULT CURRENT_DATE,
    metodo_pago ENUM('efectivo', 'tarjeta', 'transferencia', 'cheque'),
    estado ENUM('pendiente', 'pagado', 'cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id)
);

-- =====================================================
-- ÍNDICES PARA OPTIMIZACIÓN
-- =====================================================
CREATE INDEX idx_estudiantes_email ON estudiantes(email);
CREATE INDEX idx_estudiantes_estado ON estudiantes(estado);
CREATE INDEX idx_profesores_departamento ON profesores(departamento);
CREATE INDEX idx_cursos_departamento ON cursos(departamento);
CREATE INDEX idx_secciones_semestre ON secciones(semestre, anio);
CREATE INDEX idx_inscripciones_estudiante ON inscripciones(estudiante_id);
CREATE INDEX idx_inscripciones_seccion ON inscripciones(seccion_id);
CREATE INDEX idx_calificaciones_estudiante ON calificaciones(estudiante_id);
CREATE INDEX idx_asistencia_fecha ON asistencia(fecha);
CREATE INDEX idx_pagos_fecha ON pagos(fecha_pago); 