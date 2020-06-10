--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  01/06/2020
--@Descripción:     Creación de usuario

prompt Conectando como sys para crear usuarios
connect sys as sysdba

prompt Creando usuario ocra_p1101_subastas
create user ocra_p1101_subastas identified by ocra
quota unlimited on users;

prompt Asignando privilegios a ocra_p1101_subastas;
grant create session,create procedure, create sequence,
 create table,create synonym
to ocra_p1101_subastas;

---Permisos de lectura para usuario ocra_p1101_subastas
Prompt otorgando permisos a ocra_p1101_subastas para leer tablas de ocra_p1001_subastas
grant select on ocra_p1001_subastas.articulo to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.articulo_arqueologico to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.articulo_donado to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.articulo_famoso to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.cliente to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.entidad to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.factura_cliente to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.historico_status_articulo to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.pais to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.status_articulo to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.subasta to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.subasta_venta to ocra_p1101_subastas;
grant select on ocra_p1001_subastas.tarjeta_cliente to ocra_p1101_subastas;


prompt conectando como ocra_p1101_subastas
connect ocra_p1101_subastas/ ocra

create or replace synonym articulo for ocra_p1001_subastas.articulo;
create or replace synonym articulo_arqueologico for ocra_p1001_subastas.articulo_arqueologico;
create or replace synonym articulo_donado for ocra_p1001_subastas.articulo_donado;
create or replace synonym articulo_famoso for ocra_p1001_subastas.articulo_famoso;
create or replace synonym cliente for ocra_p1001_subastas.cliente;
create or replace synonym entidad for ocra_p1001_subastas.entidad;
create or replace synonym factura_cliente for ocra_p1001_subastas.factura_cliente;
create or replace synonym historico_status_articulo for ocra_p1001_subastas.historico_status_articulo;
create or replace synonym pais for ocra_p1001_subastas.pais;
create or replace synonym status_articulo for ocra_p1001_subastas.status_articulo;
create or replace synonym subasta for ocra_p1001_subastas.subasta;
create or replace synonym subasta_venta for ocra_p1001_subastas.subasta_venta;
create or replace synonym tarjeta_cliente for ocra_p1001_subastas.tarjeta_cliente;

prompt Se ha otorgado todo los permisos de forma correcta


