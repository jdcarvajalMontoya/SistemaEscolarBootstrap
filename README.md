# 🎓 Bloque 3 - Bloque Técnico Reforzado: SQL Avanzado

## 📋 Descripción del Proyecto

Este repositorio contiene un curso completo de **SQL Avanzado** diseñado para PostgreSQL, con enfoque en consultas complejas, subconsultas, JOINs avanzados y funciones de ventana. El proyecto incluye una base de datos completa de un sistema de gestión escolar para prácticas reales.

## 🎯 Objetivos de Aprendizaje

- ✅ **Subconsultas (Subqueries)**: Dominar consultas anidadas en diferentes contextos
- ✅ **JOINs Avanzados**: Comprender INNER, LEFT, RIGHT, FULL OUTER, CROSS y SELF JOINs
- ✅ **Funciones de Ventana**: Utilizar ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD()
- ✅ **Consultas Complejas**: Crear reportes ejecutivos y análisis de datos avanzados
- ✅ **Documentación**: Practicar documentación técnica en Notion

## 📁 Estructura del Proyecto

```
📦 SQL-Avanzado/
├── 📄 database_setup_postgres.sql     # Estructura de la base de datos
├── 📄 datos_ejemplo_postgres.sql      # Datos de ejemplo
├── 📄 ejercicios_sql_avanzado.sql     # Ejercicios prácticos
├── 📄 documentacion_notion_sql.md     # Documentación para Notion
├── 📄 setup_postgres.sh               # Script de instalación
└── 📄 README.md                       # Este archivo
```

## 🗄️ Base de Datos: Sistema de Gestión Escolar

### **Tablas Principales:**

| Tabla | Descripción | Registros |
|-------|-------------|-----------|
| `estudiantes` | Información de estudiantes | 15 |
| `profesores` | Información de profesores | 10 |
| `cursos` | Catálogo de cursos | 13 |
| `secciones` | Secciones de cursos | 15 |
| `inscripciones` | Inscripciones de estudiantes | 25 |
| `evaluaciones` | Evaluaciones por sección | 19 |
| `calificaciones` | Calificaciones de estudiantes | 23 |
| `asistencia` | Control de asistencia | 20 |
| `pagos` | Información de pagos | 19 |
| `departamentos` | Departamentos académicos | 9 |

### **Relaciones Clave:**
- Estudiantes → Inscripciones → Secciones → Cursos
- Profesores → Secciones → Cursos
- Evaluaciones → Secciones
- Calificaciones → Estudiantes + Evaluaciones

## 🚀 Instalación Rápida

### **Prerrequisitos:**
- PostgreSQL 12 o superior
- Acceso de administrador (sudo)

### **Instalación Automática:**
```bash
# Clonar el repositorio
git clone <url-del-repositorio>
cd SQL-Avanzado

# Ejecutar script de instalación
chmod +x setup_postgres.sh
./setup_postgres.sh
```

### **Instalación Manual:**
```bash
# 1. Crear base de datos
sudo -u postgres psql -c "CREATE DATABASE sistema_escolar_avanzado;"

# 2. Crear usuario
sudo -u postgres psql -c "CREATE USER sql_avanzado WITH PASSWORD 'password123';"

# 3. Dar permisos
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sistema_escolar_avanzado TO sql_avanzado;"

# 4. Ejecutar scripts
psql -h localhost -U sql_avanzado -d sistema_escolar_avanzado -f database_setup_postgres.sql
psql -h localhost -U sql_avanzado -d sistema_escolar_avanzado -f datos_ejemplo_postgres.sql
```

## 📚 Módulos de Aprendizaje

### **Módulo 1: Subconsultas (Subqueries)**
- **1.1** Subconsulta en SELECT
- **1.2** Subconsulta en WHERE
- **1.3** Subconsulta en FROM
- **1.4** Subconsulta correlacionada

### **Módulo 2: JOINs Avanzados**
- **2.1** INNER JOIN múltiple
- **2.2** LEFT JOIN
- **2.3** SELF JOIN
- **2.4** CROSS JOIN

### **Módulo 3: Funciones de Ventana**
- **3.1** ROW_NUMBER()
- **3.2** RANK() y DENSE_RANK()
- **3.3** LAG() y LEAD()
- **3.4** PARTITION BY con agregaciones

### **Módulo 4: Consultas Complejas**
- **4.1** Análisis de rendimiento académico
- **4.2** Análisis de asistencia y rendimiento
- **4.3** Análisis financiero
- **4.4** Dashboard ejecutivo

## 💻 Ejecución de Ejercicios

### **Conectar a la Base de Datos:**
```bash
psql -h localhost -U sql_avanzado -d sistema_escolar_avanzado
```

### **Ejecutar Ejercicios:**
```bash
# Ejecutar todos los ejercicios
psql -h localhost -U sql_avanzado -d sistema_escolar_avanzado -f ejercicios_sql_avanzado.sql

# Ejecutar módulo específico
psql -h localhost -U sql_avanzado -d sistema_escolar_avanzado -c "
-- Ejercicio específico aquí
SELECT * FROM estudiantes LIMIT 5;
"
```

### **Comandos Útiles de PostgreSQL:**
```sql
-- Listar tablas
\dt

-- Ver estructura de tabla
\d nombre_tabla

-- Ver vistas
\dv

-- Ver índices
\di

-- Salir
\q
```

## 📊 Ejemplos de Consultas

### **Consulta Básica:**
```sql
-- Estudiantes con mejor rendimiento
SELECT 
    nombre || ' ' || apellido as estudiante_completo,
    promedio_general
FROM estudiantes
WHERE estado = 'activo'
ORDER BY promedio_general DESC
LIMIT 5;
```

### **Consulta Avanzada:**
```sql
-- Análisis de rendimiento por departamento
WITH rendimiento_dept AS (
    SELECT 
        c.departamento,
        COUNT(DISTINCT i.estudiante_id) as total_estudiantes,
        AVG(i.calificacion_final) as promedio_calificaciones
    FROM cursos c
    JOIN secciones s ON c.curso_id = s.curso_id
    JOIN inscripciones i ON s.seccion_id = i.seccion_id
    WHERE i.estado = 'aprobado'
    GROUP BY c.departamento
)
SELECT 
    departamento,
    total_estudiantes,
    ROUND(promedio_calificaciones, 2) as promedio,
    RANK() OVER (ORDER BY promedio_calificaciones DESC) as ranking
FROM rendimiento_dept;
```

## 📝 Documentación en Notion

### **Estructura Recomendada:**

```
📚 SQL Avanzado - Notion
├── 🎯 Objetivos del Módulo
├── 📋 Estructura de la Base de Datos
├── 📖 Módulo 1: Subconsultas
│   ├── Ejercicio 1.1: Subconsulta en SELECT
│   ├── Ejercicio 1.2: Subconsulta en WHERE
│   ├── Ejercicio 1.3: Subconsulta en FROM
│   └── Ejercicio 1.4: Subconsulta correlacionada
├── 🔗 Módulo 2: JOINs Avanzados
│   ├── Ejercicio 2.1: INNER JOIN múltiple
│   ├── Ejercicio 2.2: LEFT JOIN
│   ├── Ejercicio 2.3: SELF JOIN
│   └── Ejercicio 2.4: CROSS JOIN
├── 📊 Módulo 3: Funciones de Ventana
│   ├── Ejercicio 3.1: ROW_NUMBER()
│   ├── Ejercicio 3.2: RANK() y DENSE_RANK()
│   ├── Ejercicio 3.3: LAG() y LEAD()
│   └── Ejercicio 3.4: PARTITION BY
├── 🎯 Módulo 4: Consultas Complejas
│   ├── Ejercicio 4.1: Análisis de rendimiento
│   ├── Ejercicio 4.2: Análisis de asistencia
│   ├── Ejercicio 4.3: Análisis financiero
│   └── Ejercicio 4.4: Dashboard ejecutivo
└── 📈 Proyecto Final
```

### **Elementos a Documentar:**
- ✅ **Objetivo** de cada ejercicio
- ✅ **Consulta SQL** completa
- ✅ **Explicación** del código
- ✅ **Resultados** obtenidos
- ✅ **Aprendizajes** clave
- ✅ **Aplicaciones** prácticas

## 🎓 Evaluación y Proyecto Final

### **Criterios de Evaluación:**
- **Comprensión técnica** (40%): Dominio de conceptos SQL
- **Aplicación práctica** (30%): Capacidad de resolver problemas
- **Documentación** (20%): Calidad de la documentación en Notion
- **Creatividad** (10%): Consultas adicionales y mejoras

### **Proyecto Final:**
Crear un **reporte ejecutivo completo** que incluya:
1. **Dashboard de métricas clave**
2. **Análisis de tendencias temporales**
3. **Identificación de estudiantes en riesgo**
4. **Recomendaciones de mejora académica**
5. **Análisis financiero del sistema**

## 🛠️ Herramientas Recomendadas

### **Bases de Datos:**
- **PostgreSQL** - Base de datos principal
- **pgAdmin** - Interfaz gráfica
- **DBeaver** - Cliente universal

### **Visualización:**
- **Tableau** - Análisis visual
- **Power BI** - Business Intelligence
- **Grafana** - Dashboards en tiempo real

### **Documentación:**
- **Notion** - Documentación técnica
- **Confluence** - Colaboración empresarial
- **GitHub** - Control de versiones

## 🔧 Solución de Problemas

### **Error de Conexión:**
```bash
# Verificar si PostgreSQL está corriendo
sudo systemctl status postgresql

# Iniciar servicio
sudo systemctl start postgresql
```

### **Error de Permisos:**
```bash
# Verificar permisos de usuario
sudo -u postgres psql -c "\du"

# Crear usuario si no existe
sudo -u postgres psql -c "CREATE USER sql_avanzado WITH PASSWORD 'password123';"
```

### **Error de Base de Datos:**
```bash
# Eliminar y recrear base de datos
sudo -u postgres psql -c "DROP DATABASE IF EXISTS sistema_escolar_avanzado;"
sudo -u postgres psql -c "CREATE DATABASE sistema_escolar_avanzado;"
```

## 📚 Recursos Adicionales

### **Documentación Oficial:**
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQL Tutorial](https://www.w3schools.com/sql/)
- [PostgreSQL Window Functions](https://www.postgresql.org/docs/current/tutorial-window.html)

### **Cursos Online:**
- **Coursera**: SQL for Data Science
- **edX**: Database Systems
- **Udemy**: Advanced SQL Masterclass

### **Libros Recomendados:**
- "SQL Performance Explained" - Markus Winand
- "SQL Cookbook" - Anthony Molinaro
- "PostgreSQL: Up and Running" - Regina Obe

## 🤝 Contribuciones

¿Tienes ideas para mejorar el curso? ¡Contribuye!

1. **Fork** el repositorio
2. **Crea** una rama para tu feature
3. **Commit** tus cambios
4. **Push** a la rama
5. **Abre** un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👨‍💻 Autor

**Tu Nombre** - [tu-email@ejemplo.com](mailto:tu-email@ejemplo.com)

---

## 🎉 ¡Felicitaciones!

Al completar este curso, habrás dominado:
- ✅ **SQL Avanzado** para PostgreSQL
- ✅ **Análisis de datos** complejos
- ✅ **Documentación técnica** profesional
- ✅ **Pensamiento analítico** para resolver problemas

**¡Estás listo para enfrentar desafíos de datos en el mundo real!** 🚀

---

*Última actualización: $(date)*

