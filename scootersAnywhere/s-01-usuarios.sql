--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de usuarios y roles

prompt Conectando como sys para creación de usuarios
connect sys as sysdba

prompt Creando usuario or_proy_admin
create user or_proy_admin identified by admin
quota unlimited on users;

prompt Create usuario or_proy_invitado
create user or_proy_invitado identified by invi
quota 1024m on users;

prompt Creando rol admin
create role rol_admin;

grant create session to or_proy_admin;

grant create table, create view, create synonym, create trigger, create sequence, 
create procedure to rol_admin;

create or replace directory directorio 
  as '/home/simon/Desktop/BD/bd-2020-1/scootersAnywhere';

grant read, write on directory directorio to rol_admin;

prompt Creando role invitado
create role rol_invitado;
grant create synonym to rol_invitado;
grant create session to or_proy_invitado;

prompt Asignando roles
grant rol_admin to or_proy_admin;
grant rol_invitado to or_proy_invitado;

prompt Listo!
disconnect
/