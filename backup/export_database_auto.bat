@echo off
echo ========================================
echo EXPORTADOR DE BASE DE DATOS POSTGRESQL
echo Sistema Escolar Bootstrap (Auto-detect)
echo ========================================
echo.

REM Configuración de la base de datos
set DB_NAME=sistema_escolar
set DB_USER=postgres
set DB_HOST=localhost
set DB_PORT=5432

REM Auto-detectar la instalación de PostgreSQL
set PG_BIN=
for /d %%i in ("C:\Program Files\PostgreSQL\*") do (
    if exist "%%i\bin\pg_dump.exe" (
        set PG_BIN="%%i\bin"
        echo PostgreSQL encontrado en: %%i
        goto :found_pg
    )
)

echo ERROR: No se encontró PostgreSQL instalado
echo Buscando en las ubicaciones estándar...
echo.
echo Por favor, instala PostgreSQL o verifica la instalación
pause
exit /b 1

:found_pg
echo Usando herramientas de PostgreSQL en: %PG_BIN%
echo.

REM Crear directorio de respaldo si no existe
if not exist "backup" mkdir backup

REM Generar nombre de archivo con fecha y hora
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

set BACKUP_FILE=backup\sistema_escolar_%timestamp%.sql
set DATA_FILE=backup\sistema_escolar_data_%timestamp%.sql

echo Exportando estructura de la base de datos...
%PG_BIN%\pg_dump.exe -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d %DB_NAME% --schema-only --no-owner --no-privileges > %BACKUP_FILE%

if %errorlevel% neq 0 (
    echo ERROR: No se pudo exportar la estructura de la base de datos
    echo Verifica que PostgreSQL esté ejecutándose y las credenciales sean correctas
    echo.
    echo Posibles soluciones:
    echo 1. Verifica que PostgreSQL esté ejecutándose
    echo 2. Revisa el nombre de la base de datos: %DB_NAME%
    echo 3. Verifica el usuario y contraseña
    echo 4. Asegúrate de que la base de datos existe
    pause
    exit /b 1
)

echo Exportando datos de la base de datos...
%PG_BIN%\pg_dump.exe -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d %DB_NAME% --data-only --no-owner --no-privileges > %DATA_FILE%

if %errorlevel% neq 0 (
    echo ERROR: No se pudo exportar los datos de la base de datos
    echo Verifica que PostgreSQL esté ejecutándose y las credenciales sean correctas
    pause
    exit /b 1
)

echo.
echo ========================================
echo EXPORTACIÓN COMPLETADA EXITOSAMENTE
echo ========================================
echo.
echo Archivos generados:
echo - Estructura: %BACKUP_FILE%
echo - Datos: %DATA_FILE%
echo.
echo Estos archivos están listos para ser compartidos con tu compañera.
echo.
echo Próximos pasos:
echo 1. Comprime la carpeta 'backup'
echo 2. Envía el archivo comprimido a tu compañera
echo 3. Tu compañera debe usar 'import_database.bat' para importar
echo.
pause
