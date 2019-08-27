@echo off
rem Better relative paths ~ More security

rem Scripts folder
set /p scripts=Do you wanna update the scripts folder? (Si/Yes/Else ~ No): 

rem Logical check -> nested ifs
set result=false
if "%scripts%"=="Si" set result=true
if "%scripts%"=="si" set result=true
if "%scripts%"=="Yes" set result=true
if "%scripts%"=="yes" set result=true
if "%scripts%"=="S" set result=true
if "%scripts%"=="s" set result=true
if "%scripts%"=="Y" set result=true
if "%scripts%"=="y" set result=true

rem Any coincidence?
if "%result%" == "true" (
	CALL "updateGit.bat"
	echo Updated
)

cd ../Codigo/
dir

rem Specify language folder
set /p lang="Programming language: "

:languageLoop
if NOT EXIST "%cd%\%lang%" (
	echo Try again writing the programming language
	set /p lang="language: "
	GOTO languageLoop
)

cd %lang%
dir

rem Specify project folder
set /p proj="Project: "

:projectLoop
if NOT EXIST "%cd%\%proj%" (
	echo Try again writing the project
	set /p proj="Project: "
	GOTO projectLoop
)

cd %proj%
CALL "../../../Scripts/updateGit.bat"
cd ../../../Scripts
