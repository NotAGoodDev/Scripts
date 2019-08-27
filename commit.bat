@echo off
rem Mejor rutas relativas a rutas absolutas, no desvelamos el arbol de directorios ~ Mas seguridad
rem Guardar la carpeta Scripts
set /p scripts=Quieres actualizar la carpeta de Scripts? (Si/Yes/Else ~ No): 
if "%scripts%"=="Si" or "%scripts%"=="S" or "%scripts%"=="Yes" or "%scripts%"=="Y" or "%scripts%"=="si" or "%scripts%"=="s" or "%scripts%"=="yes" or "%scripts%"=="y" (
	echo "%scripts%"
	echo "Si"
	CALL "guardadoGIT.bat"
	echo !!Scripts guardados!!
)

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
