--@Autor(es):       Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:     Creación de usuarios y roles 

prompt Proporcionar el password del usuario sys:
connect sys as sysdba 

prompt creando rol p0701_admin_rol:
create role p0701_admin_rol;
prompt dando permisos al rol p0701_admin_rol:
grant create session, create table, create view to p0701_admin_rol;

prompt creando rol p0701_basic_rol:
create role p0701_basic_rol;
prompt dando permisos al rol p0701_basic_rol:
grant create session, create table to p0701_basic_rol;

prompt creando rol p0701_guest_rol:
create role p0701_guest_rol;
prompt dando permisos al rol p0701_guest_rol:
grant create session, create synonym to p0701_guest_rol;


prompt creando usuario sra_p0701_admin:
create user sra_p0701_admin identified by simon
quota 1024m on users;
prompt asignando el rol de p0701_admin_rol:
grant p0701_admin_rol, create procedure, create sequence to sra_p0701_admin;


prompt creando usuario sra_p0701_oper:
create user sra_p0701_oper identified by simon
quota 500m on users;
prompt asignando el rol de p0701_basic_rol:
grant p0701_basic_rol,create procedure, create sequence to sra_p0701_oper;

prompt creando usuario sra_p0701_invitado:
create user sra_p0701_invitado identified by simon;
prompt asignando el rol de p0701_guest_rol:
grant p0701_guest_rol, create procedure, create sequence to sra_p0701_invitado;

prompt LISTO!
disconnect;