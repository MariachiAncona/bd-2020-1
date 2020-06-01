--@Autor:          Eliezer Jair Ochoa Santos
--@Fecha creación: 01/11/2019
--@Descripción:    Creacion de objeto

prompt Proporcionar el password del usuario jos_p0703_admin
connect jos_p0703_admin 


Prompt Creacion de tabla cuenta 

create table cuenta(
    cuenta_id number(35,0) not null constraint cuenta_pk primary key,
    titular varchar2(100) not null,
    rfc varchar2(13) not null,
    num_cuenta varchar2(18) not null,
    clave_sucursal varchar2(5) not null,
    fecha_registro date default sysdate not null, 
    fecha_baja date null,
    saldo number(18,2) not null,
    es_ahorro number(1,0) not null,
    es_inversion number(1,0) not null,
    cuenta_aval_id null,
    constraint cuenta_aval_id_fk foreign key (cuenta_aval_id)
    references cuenta(cuenta_id),
    constraint cuenta_es_ahorro_o_inversion_chk check(
    (es_ahorro = 1 and es_inversion = 1 and num_cuenta like 'INAH%')or
    (es_ahorro = 1 and es_inversion =0 and num_cuenta like 'AH%' ) or
    (es_ahorro = 0 and es_inversion =1 and num_cuenta like 'IN%')),
    constraint cuenta_fecha_baja_chk check 
    (fecha_baja >= add_months(fecha_registro,1)),
    constraint cuenta_saldo_chk check(saldo > 1500)
);

prompt Creacion de tabla movimiento_cuenta

create table movimiento_cuenta(
    num_movimiento number(18,0) not null,
    importe number(18,0) not null,
    tipo_movimiento char(1) not null,
    concepto varchar2(50) null,
    comprobante blob null,
    fecha_movimiento date not null,
    cuenta_id number(35,0) not null,
    constraint cuenta_id_fk foreign key(cuenta_id) references 
    cuenta(cuenta_id),
    constraint movimiento_cuenta_pk primary key
    (cuenta_id,num_movimiento)
);

prompt creacion tabla cuenta_ahorro

create table cuenta_ahorro(
    cuenta_id number(35,0) not null constraint cuenta_ahorro_pk primary key,
    num_tarjeta_debito varchar(16) not null 
    constraint cuenta_ahorro_num_tarjeta_debito_uk unique,
    retiro_max_cajero numeric(7,2) not null,
    constraint cuenta_ahorro_id_fk foreign key(cuenta_id) references
    cuenta(cuenta_id),
    constraint cuenta_ahorro_retiro_chk check(retiro_max_cajero < 12500)
);

prompt creacion de tabla cuenta_inversion 

create table cuenta_inversion(
    cuenta_id number(35,0) not null constraint cuenta_inversion_pk primary key,
    porcentaje_interes numeric(5,2) not null,
    dia_retiro number(2,0) not null,
    constraint cuenta_inversion_id_fk foreign key(cuenta_id) references
    cuenta(cuenta_id),
    constraint cuenta_inversion_dia_retiro_chk check (dia_retiro between 05 and 25)
);


prompt creacion de la vista v_cuenta_movimiento

create or replace view v_cuenta_movimiento(
num_cuenta,num_movimiento,importe,concepto,tipo_movimiento,fecha_baja
) as select num_cuenta,num_movimiento,importe,concepto,
    tipo_movimiento,fecha_baja
from cuenta c,movimiento_cuenta m
where c.cuenta_id=m.cuenta_id;   


create sequence seq_cuenta
    start with 1001
    increment by 2
    nocycle
    cache 9;

prompt Primer valor de la secuencia
select seq_cuenta.nextval from dual;

prompt Valor de la secuencia, no incremento
select seq_cuenta.currval from dual;


--crear indice compuesto para rfc y titular

create unique index rfc_titular_iuk
on cuenta(rfc, titular);



-- mejoras de desempeño (indexado)

create index titular_ix
on cuenta(substr(titular,1,5));


create index fecha_movimiento_ix
on movimiento_cuenta(to_date(fecha_movimiento,'MM/YYYY'));


create index cuenta_aval_id_iuk 
on cuenta(cuenta_aval_id);









    

    

