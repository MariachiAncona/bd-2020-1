--@Autor: Simón Eduardo Ramírez Ancona
--@Fecha creación: 29/04/2020
--@Descripción: Creación de Usuarios
create user sra_p07_previo identified by simon quota unlimited on users;
grant create table, create session, create procedure, create sequence to sra_p07_previo;
