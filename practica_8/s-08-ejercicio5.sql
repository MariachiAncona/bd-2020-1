--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  11/05/2020
--@Descripción:     Ejecutar incisos de ejercicio 5 de la práctica 8


prompt Conectando como usuario josr_p0802_cuentas
connect josr_p0802_cuentas/josr

prompt Ejecutando merge para actualizar tabla cliente
merge into cliente c using cliente_import ci on
    (c.cliente_id=ci.cliente_id)
when matched then update
    set c.nombre = ci.nombre, c.ap_paterno = ci.ap_paterno,
        c.ap_materno = ci.ap_materno, c.curp = ci.curp,
        c.fecha_nacimiento = ci.fecha_nacimiento, c.email = ci.email,
        c.cliente_aval_id = ci.cliente_aval_id
when not matched then insert
    (c.cliente_id, c.nombre, c.ap_paterno, c.ap_materno, c.curp, c.fecha_nacimiento,
    c.email, c.cliente_aval_id) values
    (ci.cliente_id, ci.nombre, ci.ap_paterno, ci.ap_materno, ci.curp, ci.fecha_nacimiento,
    ci.email, ci.cliente_aval_id);