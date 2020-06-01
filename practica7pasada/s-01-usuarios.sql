--@Autor(es):       Eliezer Jair Ochoa Santos, 
--@Fecha creación:  01/11/2019
--@Descripción:     Creación de usuarios y roles

prompt Proporcionar el password del usuario sys:
connect sys as sysdba 

prompt creando usuario jos_p0703_admin:
create user jos_p0703_admin identified by jair 
quota 1024m on users
password expire;
grant create session to jos_p0703_admin;

prompt creando usuario jos_p0703_invitado:
create user jos_p0703_invitado identified by invitado;
grant create session to jos_p0703_invitado;

prompt creando roles:
create role jos_p0703_admin_rol;
grant create table, create view, create synonym, create procedure,
create trigger, create sequence to jos_p0703_admin_rol;

prompt Asignar el rol jos_p0703_admin_rol a jos_p0703_admin:
grant jos_p0703_admin_rol to jos_p0703_admin;

prompt Listo!
disconnect;






