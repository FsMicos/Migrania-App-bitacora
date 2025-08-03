@echo off
REM Script para verificar Coverage localmente
echo ========================================
echo    VERIFICACION DE COVERAGE LOCAL
echo ========================================

cd /d "%~dp0backend"

echo.
echo 1. Configurando entorno de Django...
set DJANGO_SETTINGS_MODULE=migraine_app.settings

echo.
echo 2. Limpiando datos de coverage anteriores...
python -m coverage erase

echo.
echo 3. Ejecutando tests con coverage...
python -m coverage run --source=. -m behave evaluacion_diagnostico/features --no-color --format=plain

echo.
echo 4. Generando reporte de coverage...
python -m coverage report --show-missing

echo.
echo 5. Generando archivo XML para SonarQube...
python -m coverage xml -o coverage.xml

echo.
echo 6. Verificando archivo de coverage...
if exist coverage.xml (
    echo ✅ Archivo coverage.xml generado correctamente
    echo 📊 Tamaño del archivo: %~zc coverage.xml bytes
    echo.
    echo 📋 Primeras líneas del archivo XML:
    type coverage.xml | more
) else (
    echo ❌ Error: No se pudo generar el archivo coverage.xml
    exit /b 1
)

echo.
echo ========================================
echo        VERIFICACION COMPLETADA
echo ========================================
pause
