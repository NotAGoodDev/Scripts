@echo off
rem Mejor rutas relativas a rutas absolutas, no desvelamos el arbol de directorios ~ Mas seguridad
rem Guardar la carpeta Scripts
set /p scripts=Quieres actualizar la carpeta de Scripts? (Si/Yes/Else ~ No): 

rem Comprobacion logica -> Ifs anidados
set result=false
if "%scripts%"=="Si" set result=true
if "%scripts%"=="si" set result=true
if "%scripts%"=="Yes" set result=true
if "%scripts%"=="yes" set result=true
if "%scripts%"=="S" set result=true
if "%scripts%"=="s" set result=true
if "%scripts%"=="Y" set result=true
if "%scripts%"=="y" set result=true

rem Alguna coincicdencia
if "%result%" == "true" (
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
