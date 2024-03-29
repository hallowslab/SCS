REM Get pybind
SET PROJECT_HOME=%CD%
cd cnake_mem\cnake\
SET CNAKE_HOME=%CD%
wget https://github.com/pybind/pybind11/archive/master.zip
7z x master.zip
REM Make pybind
mkdir -p pybind11-master\build\
cd pybind11-master\build\
SET PYTHON_PATH="%PROJECT_HOME%\venv\Scripts\python.exe"
cmake -DPYTHON_EXECUTABLE=%PYTHON_PATH% -A x64 ..
cmake --build . --config Release --target check
REM Make python module
cd %CNAKE_HOME%
mkdir build && cd build
set BUILD_TARGET=windows && cmake -DPYTHON_EXECUTABLE=%PYTHON_PATH% -A x64 ..
cmake --build . --config Release
xcopy Release\*.pyd "%PROJECT_HOME%\scs\backend"