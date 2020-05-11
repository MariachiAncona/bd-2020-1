--@Autor(es):       Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:     Creación de sinonimos

prompt Conectando como usuario admin
connect sra_p0701_admin/simon

prompt Asignando permisos de consulta a usuario invitado
grant select on estudiante to sra_p0701_invitado;

prompt Conectando como usuario invitado
connect sra_p0701_invitado/simon

prompt Creando sinónimo
create or replace synonym s_alumno for sra_p0701_admin.estudiante; 
 
disconnect;
/

