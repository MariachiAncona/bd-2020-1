--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  25/05/2020
--@Descripción:     Creación de usuario

prompt Conectando como sys para crear usuarios
connect sys as sysdba

prompt Creando usuario josr_p0903_fx
create user josr_p0903_fx identified by josr
quota unlimited on users;

prompt Asignando privilegios a josr_p0903_fx;
grant create session, create procedure, create sequence, create table, insert any table
to josr_p0903_fx;

prompt Conectando como josr_p0903_fx para crear tablas
connect josr_p0903_fx/josr 

start s-02-fx-ddl.sql 
prompt Se ejecuto con exito script s-02-fx-ddl.sql

set define off
start s-03-fx-carga-inicial.sql 
set define on 
prompt Se ejecuto con exito script s-03-fx-carga-inicial.sql


commit;
prompt Se realizo "commit"


/
