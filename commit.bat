@echo off

rem Guardar la carpeta Scripts
echo Primero se va a actualizar la carpeta Scripts
CALL "guardadoGIT.bat"
echo !!Scripts guardados!!
cd ../Codigo/
dir

rem Especificar la carpeta del lenguaje
set /p l="Lenguaje: "

:bucleLenguaje
if NOT EXIST "%cd%\%l%" (
	echo Escribe bien el lenguaje
	set /p l="Lenguaje: "
	GOTO bucleLenguaje
)

cd %l%
dir

rem Especificar la carpeta del Proyecto
set /p p="Proyecto: "

:bucleProyecto
if NOT EXIST "%cd%\%p%" (
	echo Escribe bien el proyecto
	set /p p="Proyecto: "
	GOTO bucleProyecto
)

cd %p%
CALL "../../../Scripts/guardadoGIT.bat"
cd ../../../Scripts