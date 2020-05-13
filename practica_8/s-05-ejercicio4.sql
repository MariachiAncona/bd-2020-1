--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  11/05/2020
--@Descripción:     Ejecutar incisos de ejercicio 4 de la práctica 8



prompt Conectando como usuario josr_p0802_cuentas
connect josr_p0802_cuentas/josr

prompt Inciso A cambios en cuenta 903911 para congelar
update cuenta set 
    fecha_estatus=to_date('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss'),
    estatus_cuenta_id=
        (select estatus_cuenta_id from estatus_cuenta 
        where clave =upper('congelada'))
    where num_cuenta=903911;

insert into historico_estatus_cuenta values(
    hist_estatus_cta_seq.nextval,
    to_date('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss'),
    (select cuenta_id from cuenta where num_cuenta=903911),
    (select estatus_cuenta_id from estatus_cuenta 
        where clave =upper('congelada'))
);

prompt Inciso B cambios Hugo Mora en portafolio IVV
delete from portafolio_inversion 
    where tipo_portafolio_id=
            (select tipo_portafolio_id from tipo_portafolio 
            where clave='IVV') and 
        cuenta_id=
            (select cuenta_id from cuenta_inversion 
            where num_contrato='124884-2');

update portafolio_inversion set
    porcentaje=100
    where tipo_portafolio_id=
        (select tipo_portafolio_id from tipo_portafolio 
        where clave='IEFA') and
        cuenta_id=
        (select cuenta_id from cuenta_inversion 
        where num_contrato='124884-2');

update cuenta_inversion set
    total_portafolios=1
    where cuenta_id=
        (select cuenta_id from cuenta_inversion 
        where num_contrato='124884-2');

prompt Inciso C Eliminar a Paco Luna Perez y todo lo relacionado con él

prompt Eliminar cuenta de ahorro
delete from cuenta_ahorro 
    where cuenta_id=
        (select cuenta_id from cuenta 
        where cliente_id=
            (select cliente_id from cliente where
            nombre=upper('paco') and
            ap_paterno=upper('luna') and
            ap_materno=upper('perez') ) 
        );

prompt Eliminar registros de histórico
delete from historico_estatus_cuenta
    where cuenta_id =
        (select cuenta_id from cuenta 
        where cliente_id=
            (select cliente_id from cliente where
            nombre=upper('paco') and
            ap_paterno=upper('luna') and
            ap_materno=upper('perez') ) 
        );

prompt Eliminar cuenta 
delete from cuenta
    where cuenta_id=
        (select cuenta_id from cuenta 
        where cliente_id=
            (select cliente_id from cliente where
            nombre=upper('paco') and
            ap_paterno=upper('luna') and
            ap_materno=upper('perez') ) 
        );

prompt Eliminar como aval
update cliente set cliente_aval_id=null
    where cliente_aval_id=
        (select cliente_id from cliente where
        nombre=upper('paco') and
        ap_paterno=upper('luna') and
        ap_materno=upper('perez') 
        );

prompt Eliminar cliente
delete from cliente
    where 
        nombre=upper('paco') and
        ap_paterno=upper('luna') and
        ap_materno=upper('perez');

commit;
disconnect
/

