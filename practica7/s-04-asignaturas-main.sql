--@Autor: Eliezer Jair Ochoa Santos, Ramírez Ancona Simon Eduardo
--@Fecha creación: 11/11/2019
--@Descripción: Archivo principal
whenever sqlerror exit rollback;

prompt conectando como sys para eliminar/crear al usuario
connect sys as sysdba

prompt eliminando al usuario jos_p07_previo en caso de existir
start s-00-asignaturas-elimina-usuario.sql

prompt creando usuario jos_p07_previo
start s-01-asignaturas-crea-usuario.sql

prompt conectando como usuario jos_p07_previo
connect jos_p07_previo 

prompt creando tablas
start s-02-asignaturas-ddl.sql

prompt cargando datos
start s-03-asignaturas-carga-inicial.sql

prompt Listo!

exit

