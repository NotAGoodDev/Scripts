@echo off

if NOT EXIST "%cd%/.git" (
	git init
	set /p alias="Alias del repositorio: "
	echo "-- Ahora debes crear el repositorio"
	set /p direccion="Direccion del repositorio: "
	git remote add %alias% %direccion%
)

git pull
git add .
set /p ms="Mensaje de commit: "
echo %ms%
git commit -m "%ms%"
rem git push
git log --oneline