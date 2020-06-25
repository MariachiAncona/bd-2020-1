--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de trigger que actualiza el status cuando se 
                    --ingresa una falla scooter


create or replace trigger trg_falla_scooter
before insert of falla_scooter_id on falla_scooter_id
for each row
declare
v_scooter_id number(10,0)
v_status_id number(10,0)
v_hist_id number(10,0)
v_fecha_status date;
  begin
-- obtiene el consecutivo de la secuencia historico
select seq_historico_status_scooter.nextval into v_hist_id from dual;
--obtiene el scooter_id de la falla registrada
select (scooter_id from falla_scooter
        where falla_scooter_id =(select seq_falla_scooter.currval from dual)
        ) into v_scooter_id from dual;
--asigna nuevos valores a las variables del status
v_status_id := :new.status_scooter_id := 5;
v_fecha_status:= :new.fecha_status;

dbms_output.put_line('status anterior: '|| :old.status_scooter_id);
dbms_output.put_line('status nuevo: '|| :new.status_scooter_id);
dbms_output.put_line('insertando en historico '
|| v_scooter_id ||', status_scooter_id: ' || v_status_id
||', fecha_status: '|| v_fecha_status||', hist_id: '||v_hist_id);

 insert into historico_status_scooter 
 (historico_status_scooter_id, fecha_status, scooter_id 
 , status_scooter_id) 
 values (v_hist_id, v_fecha_status, v_scooter_id, v_status_id );

 update into scooter_id (status_scooter_id) values (v_status_id);

 end;
