--@Autor: Simón Eduardo Ramírez Ancona
--@Fecha creación: 29/04/2020
--@Descripción: Archivo principal

whenever sqlerror exit rollback;
prompt conectando como sys para eliminar/crear al usuario
connect sys as sysdba
prompt eliminando al usuario sra_p07_previo en caso de existir

@@s-00-asignaturas-elimina-usuario.sql

prompt creando usuario sra_p07_previo

@@s-01-asignaturas-crea-usuario.sql

prompt conectando como usuario sra_p07_previo

connect sra_p07_previo

prompt creando tablas

@@s-02-asignaturas-ddl.sql

prompt cargando datos

@@s-03-asignaturas-carga-inicial.sql

prompt Listo!
