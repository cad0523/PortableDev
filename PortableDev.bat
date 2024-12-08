@echo off
set CURRENTDIR=%~dp0
set PYTHONVER=3.12.8
set PYTHONDIR=python-%PYTHONVER%-embed-amd64
set PYTHONFILE=%PYTHONDIR%.zip
set PYTHONURL=https://www.python.org/ftp/python/%PYTHONVER%/%PYTHONFILE%
set PIPFILE=get-pip.py
set PIPURL=https://bootstrap.pypa.io/%PIPFILE%
set CODEDIR=VSCode-win32-x64
set CODEFILE=%CODEDIR%.zip
set CODEURL="https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"


REM python setting
curl %PYTHONURL% -o %PYTHONFILE%
mkdir %PYTHONDIR%
tar xvzf %PYTHONFILE% -C %PYTHONDIR%
echo import site >> %PYTHONDIR%\python312._pth

REM pip setting
curl %PIPURL% -o %PIPFILE%
%PYTHONDIR%\python.exe %PIPFILE%

REM venv setting
%PYTHONDIR%\Scripts\pip.exe install virtualenv


REM VSCode setting
curl -L %CODEURL% -o %CODEFILE%
mkdir %CODEDIR%
mkdir %CODEDIR%\data
tar xvzf %CODEFILE% -C %CODEDIR%


REM 
mkdir archive
move %PIPFILE% archive
move %PYTHONFILE% archive
move %CODEFILE% archive

REM 
mkdir src
cd src
..\%PYTHONDIR%\python.exe -m virtualenv py

echo.
echo.
echo 1. run "..\%CODEDIR%\code.exe"
echo 2. open folder "src"
echo 3. create new file "test.ipynb" in "src" folder
echo 4. install extensions
echo 5. select kernel "py\Scripts\python.exe"
