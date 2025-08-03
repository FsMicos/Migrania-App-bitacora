@echo off
REM Verificación rápida de que behave funciona
echo ========================================
echo      VERIFICACION RAPIDA DE BEHAVE
echo ========================================

cd /d "%~dp0backend"

echo.
echo Configurando Django...
set DJANGO_SETTINGS_MODULE=migraine_app.settings

echo.
echo Ejecutando Behave (sin coverage)...
python -m behave evaluacion_diagnostico/features --no-color --format=plain

echo.
echo ========================================
echo        VERIFICACION COMPLETADA  
echo ========================================
pause
