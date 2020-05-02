--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:     Creación de sinonimos

prompt Conectando como usuario admin
connect jos_p0701_admin

prompt Asignando permisos de consulta a usuario invitado
grant select on estudiante to jos_p0107_invitado;

prompt Conectando como usuario invitado
connect jos_p0107_invitado

prompt Creando sinónimo
create or replace synonym estudiante for jos_p0701_admin.estudiante; 
 
disconnect;
/
