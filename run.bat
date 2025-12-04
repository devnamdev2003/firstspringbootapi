@echo off
echo ================================
echo        Spring Boot Run
echo ================================

mvn spring-boot:run

IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Application failed to start!
    pause
    exit /b
)

pause
