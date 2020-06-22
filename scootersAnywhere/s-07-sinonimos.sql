
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de sinonimos


prompt Conectando como admin para creación de sinonimos publicos
connect or_proy_admin/admin



create or replace public synonym usuario for admin.usuario;

create or replace public synonym fallas for admin.falla_scooter;

create or replace public synonym scooter for admin.scooter;

create or replace public synonym servicio for admin.servicio;


prompt Ortogando permisos de lectura al usuario or_proy_invitado 






