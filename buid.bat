@echo off
echo ================================
echo       Maven Clean Install
echo ================================

mvn clean install

IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Build failed!
    pause
    exit /b
)

echo ✅ Build completed successfully!
pause
