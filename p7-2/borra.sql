connect sra_p0701_oper/simon

alter table empleado drop constraint pizzeria_empleado_id_fk;
alter table pizzeria drop constraint empleado_pizzeria_id_fk;
alter table empleado drop constraint empleado_pk;
alter table pizzeria drop constraint pizzeria_pk;

drop sequence seq_pizzeria;
drop table empleado cascade;
drop table status_pedido;
drop table pedido;
drop table sucursal;
drop table almacen;
drop table pizzeria;

drop table empleado;

prompt listo
disconnect
/