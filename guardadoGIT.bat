@echo off

if NOT EXIST "%cd%/.git" (
	git init
	echo "# A" >> README.md
	git add README.md
	git commit -m "First Commit, auto-created"
	
	echo ""
	echo "-- Recuerda modificar el Markdown si es Publico :)"
	set /p alias="Alias del repositorio: "
	echo "-- Ahora debes crear el repositorio y ssh-keygen -t rsa (si privado)"
	set /p direccion="Direccion del repositorio: "
	git remote add origin %direccion%
	git push -u origin master
)

git pull
git add .
set /p ms="Mensaje de commit: "
git commit -m "%ms%"
git push
git log --oneline