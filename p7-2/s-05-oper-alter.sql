--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:    Script que realiza cambios en caso de pizzeria

prompt Comentanto como usuario jos_p0107_oper
connect jos_p0107_oper/jair

prompt Cambio para que una pizzeria pueda tener 2 roles



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
