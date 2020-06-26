--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Definición de tabla temporal

prompt Conectando como usuario admin para crear tabla temporal
connect or_proy_admin/admin

create global temporary table usuario_pago(
    nombre varchar2(30),
    banco varchar2(40),
    clabe number(18,0),
    servicio number(10,0),
    no_scooters number(2,0),
    pago_total number(5,2)
) on commit preserve rows;



disconnect
/
