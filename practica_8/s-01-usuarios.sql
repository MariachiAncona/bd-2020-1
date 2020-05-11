--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  11/05/2020
--@Descripción:     Creación de usuarios y roles

prompt Conectando como sys para crear usuarios
connect sys as sysdba

prompt Creando usuario josr_p0802_cuentas
create user josr_p0802_cuentas identified by josr;

prompt Asignando privilegios a josr_p0802_cuentas;
grant create session, create procedure, create sequence, create table
to josr_p0802_cuentas;

disconnect
/