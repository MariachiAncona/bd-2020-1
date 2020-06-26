--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Ejecuta todos los scripts del proyecto

prompt Conectando como usuario sys para eliminar usuarios y ejecutar main
connect sys as sysdba
drop user or_proy_admin cascade;
drop user or_proy_invitado cascade;
drop role rol_admin;
drop role rol_invitado;
disconnect

set serveroutput on

@s-01-usuarios.sql
@s-02-entidades.sql
@s-03-tablas-temporales.sql
@s-04-tablas-externas.sql
@s-05-secuencias.sql
@s-06-indices.sql
@s-07-sinonimos.sql
@s-08-vistas.sql
@s-09-carga-inicial.sql
@s-10-consultas.sql

@s-13-p-muestra-marca-telefono.sql
@s-13-p-registra-falla.sql
--@s-13-p-carga-imagen.sql

@s-11-tr-falla-scooter.sql
@s-12-trg-falla-scooter-prueba.sql

@s-11-tr-carga-imagen.sql
@s-12-trg-carga-imagen-prueba.sql

@resultados-proyecto-final.sql