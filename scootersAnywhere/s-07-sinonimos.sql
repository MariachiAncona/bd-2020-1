
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de sinonimos


prompt Conectando como admin para creación de sinonimos publicos
connect or_proy_admin/admin



create or replace public synonym zona for or_proy_admin.zona;
create or replace public synonym falla_scooter for or_proy_admin.falla_scooter;
create or replace public synonym scooter for or_proy_admin.scooter;
create or replace public synonym servicio for or_proy_admin.servicio;


prompt Ortogando permisos de lectura al usuario or_proy_invitado 

grant select on zona to or_proy_invitado;
grant select on falla_scooter to or_proy_invitado;
grant select on scooter to or_proy_invitado;
grant select on servicio to or_proy_invitado;

connect or_proy_invitado/invi

create or replace synonym zona for or_proy_admin.zona;
create or replace synonym falla_scooter for or_proy_admin.falla_scooter;
create or replace synonym scooter for or_proy_admin.scooter;
create or replace synonym servicio for or_proy_admin.servicio;


connect or_proy_admin/admin

declare
    cursor tablas is 
        select table_name 
        from user_tables 
        order by table_name;

begin
    for r in tablas loop
        execute immediate  'create or replace synonym or_'
        || r.table_name 
        || ' for '
        || t.table_name;
    end loop;
end;
/
show errors/

