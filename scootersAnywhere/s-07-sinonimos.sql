
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de sinonimos


prompt Conectando como admin para creación de sinonimos publicos
connect or_proy_admin/admin



create or replace public synonym z for zona;
create or replace public synonym fs for falla_scooter;
create or replace public synonym st for scooter;
create or replace public synonym s for servicio;
create or replace public synonym ss for status_scooter;


prompt Ortogando permisos de lectura al usuario or_proy_invitado 

grant select on z to or_proy_invitado;
grant select on fs to or_proy_invitado;
grant select on st to or_proy_invitado;
grant select on s to or_proy_invitado;
grant select on ss to or_proy_invitado;

connect or_proy_invitado/invi

create or replace synonym zona for or_proy_admin.zona;
create or replace synonym falla_scooter for or_proy_admin.falla_scooter;
create or replace synonym scooter for or_proy_admin.scooter;
create or replace synonym status_scooter for or_proy_admin.status_scooter;
create or replace synonym servicio for or_proy_admin.servicio;


connect or_proy_admin/admin

declare
  cursor tablas is 
    select TABLE_NAME
    from user_tables;

begin
  for t in tablas loop
    execute immediate  'create or replace synonym or_'
    || t.TABLE_NAME 
    || ' for '
    || t.TABLE_NAME;
    end loop;
  end;


/
show errors

