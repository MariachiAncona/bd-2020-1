--@Autor(es):       Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:    Script que realiza cambios en caso de pizzeria

prompt Conectando como usuario sra_p0701_oper
connect sra_p0701_oper/simon

prompt Cambio para que una pizzeria pueda tener 2 roles

alter table pizzeria drop column tipo;
alter table pizzeria add (es_almacen number(1,0) not null);
alter table pizzeria add (es_sucursal number(1,0) not null);
alter table pizzeria add constraint pizzeria_es_almacen_o_sucursal_chk check(
    (es_sucursal = 1 and es_almacen = 1)or
    (es_sucursal = 1 and es_almacen =0 ) or
    (es_sucursal = 0 and es_almacen =1 ));

prompt Cambios en columna requiere_surtir de tabla pizzeria_almacen
alter table pizzeria_almacen modify (requiere_surtir number(1,0));
alter table pizzeria_almacen add constraint pizzeria_almacen_requiere_surtir_chk 
    check(requiere_surtir=0 or requiere_surtir=1);

prompt Cambio para columnas ap_pat y ap_mat

alter table empleado rename column ap_pat to ap_paterno;
alter table empleado rename column ap_mat to ap_materno;
--alter table empleado drop column ap_materno;
alter table empleado modify (ap_materno varchar2(40) null);

prompt cambio de status_id a status_pedido_id
alter table pedido drop constraint pedido_status_id_fk;
alter table pedido rename column status_id to status_pedido_id;
alter table status_pedido drop constraint status_pedido_pk;
alter table status_pedido rename column status_id to status_pedido_id;
alter table status_pedido add constraint status_pedido_pk primary key (status_pedido_id);
alter table pedido add constraint pedido_status_pedido_id_fk foreign key (status_pedido_id)
    references status_pedido(status_pedido_id);

prompt Cambiando fk de empleado en pizzeria
alter table pizzeria drop constraint pizzeria_empleado_id_fk;
alter table pizzeria drop column empleado_id;
alter table empleado add (pizzeria_id number(10,0) not null);
alter table empleado add constraint empleado_pizzeria_id_fk foreign key (pizzeria_id)
    references pizzeria(pizzeria_id);

prompt Cambios en fecha_ing, importe_total
alter table empleado modify (fecha_ing date);
alter table pedido modify (importe_total number(10,2));

prompt Cambio en fecha_apertura
alter table sucursal add (fecha_apertura date default sysdate not null);

prompt Cambios en clave pizzeria
alter table pizzeria modify (clave varchar2(10));
alter table pizzeria add constraint pizzeria_clave_chk check(
    (es_sucursal = 1 and es_almacen = 1 and clave like 'PIZ-AS-%')or
    (es_sucursal = 1 and es_almacen =0 and clave like 'PIZ-S-%') or
    (es_sucursal = 0 and es_almacen =1 and clave like 'PIZ-A-%'));

prompt Cambios en tabla pedido pk e índice compuesto
alter table pedido drop constraint pedido_pk;
alter table pedido rename column num_pedido to pedido_id;
alter table pedido add constraint pedido_pk primary key (pedido_id);
alter table pedido add constraint pedido_num_pedido_pizzeria_uk unique (pedido_id, pizzeria_id);

prompt Cambiando nombre a campo fecha_ingreso en empleado
alter table empleado rename column fecha_ing to fecha_ingreso;

prompt Cambiando longitud máxima de teléfono
alter table pizzeria add constraint telefono_chk check(telefono<=9999999999);

prompt Cambiando nombre de tabla pizzeria_almacen a almacen
alter table pizzeria_almacen rename to almacen;

prompt Cambios en secuencia
prompt Alteramos la secuencia 
alter sequence seq_pizzeria
nocycle 
increment by 4 
minvalue  7
cache 7;

prompt Validando cambio con inserción de datos

prompt Cambio 1
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
    telefono,num_empleados,es_almacen,es_sucursal)
    values(1,'PIZ-AS-001','Pizzas Cachos','Av. Juarez 512',5510028938,200,1,1);

prompt Cambio 2
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
    telefono,num_empleados,es_almacen,es_sucursal)
    values(2,'PIZ-S-002','Pizza Planeta','Av. Constitucion de 1917 10',
    5513523978,400,0,1);

prompt Cambio 3
insert into empleado(empleado_id,nombre,ap_paterno,ap_materno,
    fecha_ingreso,pizzeria_id)
    values(1,'Daniel','Lopez',null,sysdate,1);

prompt Cambio 4
insert into almacen(pizzeria_id,descripcion,num_refrescos,
    num_ingredientes,requiere_surtir)
    values(1,'Almacen para pizza planeta',80,100,0);

prompt Cambio 5
insert into sucursal(pizzeria_id,fecha_apertura,total_pedidos)
    values(2,sysdate,500);

prompt Cambio 6
insert into status_pedido(status_pedido_id,clave,descripcion)
    values(1,'ACTIVO', 'SOLICITADO');

prompt Cambio 7
insert into pedido(pedido_id,importe_total,total_pizzas,total_refrescos,
    pizzeria_id,status_pedido_id)
    values(1,145.50,1,2,2,1);

disconnect
/
