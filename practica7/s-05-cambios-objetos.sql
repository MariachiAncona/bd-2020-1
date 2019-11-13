--@Autor:          Eliezer Jair Ochoa Santos, Simon Eduardo Ramirez Ancona
--@Fecha creación: 06/11/2019
--@Descripción:    modificacion de objetos

prompt Proporcionar el password del usuario jos_p0703_admin
connect jos_p0703_admin 


alter table cuenta add (curp varchar2(18) null);

alter table cuenta_inversion add constraint cuenta_inversion_chk
check(porcentaje_interes < 20.00);

alter table cuenta drop constraint cuenta_es_ahorro_o_inversion_chk;

alter table cuenta drop column es_ahorro;
alter table cuenta drop column es_inversion;


alter table cuenta add (tipo_cuenta varchar2(1));

alter table cuenta add constraint cuenta_tipo_cuenta_chk check(tipo_cuenta in('I','A'));

alter table cuenta rename column titular to nombre_titular;

alter table movimiento_cuenta rename to operacion_cuenta;

alter table operacion_cuenta add(operacion_cuenta_id number(20,0));
alter table operacion_cuenta drop constraint movimiento_cuenta_pk;
alter table operacion_cuenta add constraint operacion_cuenta_pk primary key(operacion_cuenta_id);
 
alter table operacion_cuenta modify (importe number(20,2));

--cambios a vista 
create or replace view v_cuenta_movimiento(
cuentahambiente,num_cuenta,num_movimiento,importe,
concepto,tipo_movimiento,fecha_baja
) as select nombre_titular,num_cuenta,num_movimiento,importe,concepto,
    tipo_movimiento,fecha_baja
from cuenta c,operacion_cuenta o
where c.cuenta_id=o.cuenta_id;   

alter sequence seq_cuenta increment by 15
minvalue 15 maxvalue 100000000 cycle;

alter index rfc_titular_iuk rename to cuenta_cuentahabiente_uk;




