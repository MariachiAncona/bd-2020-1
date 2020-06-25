--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de trigger que actualiza el status cuando se 
                    --ingresa una falla scooter

prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin


create or replace trigger trg_falla_scooter
after insert on falla_scooter
for each row

declare

  v_hist_id number(10,0);
  v_status_scooter_id number(10,0);
  v_fecha_hora date;
  v_usuario_id number(10,0);
  v_scooter_id number(10,0);
  begin

    v_status_scooter_id := 5;
    v_fecha_hora := :new.fecha_hora;
    v_usuario_id := :new.usuario_id;
    v_scooter_id := :new.scooter_id;

    select status_scooter_id into v_status_scooter_id
    from scooter
    where scooter_id = :new.scooter_id;

    if v_status_scooter_id <> 5 then
      -- obtiene el consecutivo de la secuencia historico
      select seq_historico_status_scooter.nextval into v_hist_id from dual;
      registra_falla(v_status_scooter_id, v_fecha_hora, v_scooter_id,
      v_usuario_id, v_hist_id);

    end if;
 
end;

/
show errors