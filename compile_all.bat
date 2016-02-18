@echo off
go build ../pogocore/pogo_compiler.go
for /R %%i in (*.pogo) do call compile_one.bat "%%i"
del pogo_compiler.exe
