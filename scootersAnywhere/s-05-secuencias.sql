
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de secuencias 


Prompt Ingresando como admin para crear secuencias 
connect or_proy_admin/admin

create sequence seq_zona_scooter 
start with 1
increment by 1
nocycle
order;

create sequence seq_ubicacion_scooter 
start with 1
increment by 1
nocycle
order;

create sequence seq_servicio 
start with 1
increment by 1
nocycle
order;

create sequence seq_falla_scooter 
start with 1
increment by 1
nocycle
order;

create sequence seq_scooter 
start with 1
increment by 1
nocycle
order;

create sequence seq_historico_status_scooter
start with 1
increment by 1
nocycle
order;

create sequence seq_usuario
start with 1
increment by 1
nocycle
order;

create sequence seq_zona 
start with 1
increment by 1
nocycle
order;


create sequence seq_marca 
start with 1
increment by 1
nocycle
order;


create sequence seq_tarjeta 
start with 1
increment by 1
nocycle
order;

create sequence seq_tarjeta_prepago 
start with 1
increment by 1
nocycle
order;

create sequence seq_scooter_servicio_carga
start with 1
increment by 1
nocycle
order;



prompt Listo!
disconnect
/











