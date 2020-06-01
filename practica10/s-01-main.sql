--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  01/06/2020
--@Descripción:     Creación de usuario

prompt Conectando como sys para crear usuarios
connect sys as sysdba

prompt Creando usuario ocra_p1001_subastas
create user ocra_p1001_subastas identified by ocra
quota unlimited on users;

prompt Asignando privilegios a ocra_p1001_subastas;
grant create session, create procedure, create sequence, create table, insert any table
to ocra_p1001_subastas;

prompt Conectando como ocra_p1001_subastas para crear tablas
connect ocra_p1001_subastas/ocra

start s-02-ddl.sql 
prompt Se ejecuto con exito script s-02-ddl.sql

set define off
start s-03-carga-inicial.sql 
set define on 
prompt Se ejecuto con exito script s-03-carga-inicial.sql


commit;
prompt Se realizo "commit"

disconnect
/