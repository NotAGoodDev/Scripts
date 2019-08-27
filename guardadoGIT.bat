@echo off

if NOT EXIST "%cd%/.git" (
	git init
)

rem git pull
git add .
set /p ms="Mensaje de commit: "
echo %ms%
git commit -m "%ms%"
rem git push
git log --oneline