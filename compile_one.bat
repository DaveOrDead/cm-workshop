@echo off
pogo_compiler.exe %1 > %~n1.pgsql
psql -dtest -Utest -q -f %~n1.pgsql
del %~n1.pgsql
