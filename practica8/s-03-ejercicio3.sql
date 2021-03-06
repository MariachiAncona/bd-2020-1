--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  11/05/2020
--@Descripción:     Ejecutar incisos de ejercicio 3 de la práctica

prompt Conectando como josr_p0802_cuentas
connect josr_p0802_cuentas/josr

prompt Inciso A agregar registros a estatus_cuenta

insert into estatus_cuenta values 
    (1,'ABIERTA',1,'Cuenta válida y vigente');
insert into estatus_cuenta values 
    (2,'SUSPENDIDA',1,'Cuenta que no permite movimientos por un periodo de tiempo determinado');
insert into estatus_cuenta values 
    (3,'CONGELADA',1,'Cuenta que no permite movimientos por un tiempo indefinido');

prompt Inciso B agregar registros a banco

insert into banco values 
    (60,'BMEX');
insert into banco values 
    (61,'BANCA PLUS');
insert into banco values 
    (62,'BANEXITO');

prompt Inciso C agregar registros a tipo_portafolio

insert into tipo_portafolio values
    (100,'IEFA','Renta variable internacional',1);
insert into tipo_portafolio values
    (200,'IVV','Renta variable de los EU',1);
insert into tipo_portafolio values
    (300,'IEMG','Renta variable Internacional Global',1);

prompt Inciso D agregar un cliente, Gerardo

insert into cliente values 
    (cliente_seq.nextval,'GERARDO','LARA','URSUL','LAURGE891101HDF003',
    to_date('01/11/1989','dd/mm/yyyy'),'gerardo@mail.com',null);

prompt Inciso E agregar cliente y cuenta

insert into cliente values 
    (cliente_seq.nextval,'PACO','LUNA','PEREZ','LUPEPA900401HDF009',
    to_date('01/04/1990','dd/mm/yyyy'),'paco@mail.com',null);
insert into cuenta values 
    (cuenta_seq.nextval,903903,'A',5500.5,
    to_date('10/10/2009 09:40:55','dd/mm/yyyy hh24:mi:ss'),
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta')),
    (select banco_id from banco
    where nombre=upper('bmex')),
    cliente_seq.currval);
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval,
    to_date('10/10/2009 09:40:55','dd/mm/yyyy hh24:mi:ss'),
    cuenta_seq.currval,
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta'))
);
insert into cuenta_ahorro values 
    (cuenta_seq.currval,9990,1657090812110000,10000);

prompt Inciso F registro de 2 portafolios

insert into cliente values 
    (cliente_seq.nextval,'HUGO','MORA','PAZ','MOPAHU010922HDF005',
    to_date('22/09/2001','dd/mm/yyyy'),null,
    (select cliente_id from cliente 
    where nombre='PACO' and ap_paterno='LUNA' and ap_materno='PEREZ')
    );
insert into cuenta values 
    (cuenta_seq.nextval,903904,'I',1000000,
    to_date('01/01/2016 17:00:00','dd/mm/yyyy hh24:mi:ss'),
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta')),
    (select banco_id from banco
    where nombre=upper('banexito')),
    cliente_seq.currval);
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval, 
    to_date('01/01/2016 17:00:00','dd/mm/yyyy hh24:mi:ss'), 
    cuenta_seq.currval,
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta')));
insert into cuenta_inversion values 
    (cuenta_seq.currval, '124884-2',
    to_date('31/12/2018','dd/mm/yyyy'),2);
insert into portafolio_inversion values 
    ((select tipo_portafolio_id from tipo_portafolio
    where clave=upper('iefa')),
    cuenta_seq.currval,50,6);
insert into portafolio_inversion values 
    ((select tipo_portafolio_id from tipo_portafolio
    where clave=upper('ivv')),
    cuenta_seq.currval,50,6);

--Cambio de estatus de cuenta y actualización de fecha
update cuenta set 
    fecha_estatus=to_date('14/02/2017 17:00:00','dd/mm/yyyy hh24:mi:ss'),
    estatus_cuenta_id=
        (select estatus_cuenta_id from estatus_cuenta
        where clave=upper('Congelada'))
    where num_cuenta=903904;
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval, 
    to_date('14/02/2017 17:00:00','dd/mm/yyyy hh24:mi:ss'), 
    cuenta_seq.currval,
    (select estatus_cuenta_id from estatus_cuenta 
    where clave='CONGELADA')
    );

prompt Inciso G cliente con 2 cuentas bancarias

insert into cliente values 
    (cliente_seq.nextval,'SARA','OLMOS','GUTIERREZ','GUOLSA790203HDFG00',
    to_date('03/02/1979','dd/mm/yyyy'),'sara@gmail.com',
    (select cliente_id from cliente 
    where nombre='PACO' and ap_paterno='LUNA' and ap_materno='PEREZ'));
insert into cuenta values 
    (cuenta_seq.nextval,903911,'A',5000,
    to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta')),
    (select banco_id from banco
    where nombre=upper('banexito')),
    cliente_seq.currval);
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval, 
    to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'), 
    cuenta_seq.currval, 
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta'))
    );
insert into cuenta_ahorro values 
    (cuenta_seq.currval,8888,1450678300097777,25000);
insert into cuenta values 
    (cuenta_seq.nextval,903912,'I',5000,
    to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),
    (select estatus_cuenta_id from estatus_cuenta
    where clave=upper('Abierta')),
    (select banco_id from banco
    where nombre=upper('banexito')),
    cliente_seq.currval);
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval, 
        to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'), 
        cuenta_seq.currval,
        (select estatus_cuenta_id from estatus_cuenta
        where clave=upper('Abierta'))
    );
insert into cuenta_inversion values 
    (cuenta_seq.currval, '133478-3',
    to_date('19/09/2017','dd/mm/yyyy'),
    1
    );
insert into portafolio_inversion values 
    ((select tipo_portafolio_id from tipo_portafolio
    where clave=upper('iemg')),
    cuenta_seq.currval,100,2);

--Cambio de estatus de cuenta y actualización de fecha
update cuenta set 
    fecha_estatus=
        add_months(to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),1),
    estatus_cuenta_id=
        (select estatus_cuenta_id from estatus_cuenta
        where clave=upper('Congelada'))
    where num_cuenta=903912;
insert into historico_estatus_cuenta values 
    (hist_estatus_cta_seq.nextval,
    add_months(to_date('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),1),
    cuenta_seq.currval,
    (select estatus_cuenta_id from estatus_cuenta 
    where clave='CONGELADA'));

commit;
disconnect
/
