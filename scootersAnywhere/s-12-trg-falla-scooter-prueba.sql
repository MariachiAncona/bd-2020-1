--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Prueba de trigger falla_scooter


prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin


prompt prueba tr_registro_falla en scooter sin status = falla
insert into falla_scooter(falla_scooter_id, fecha_hora, 
  latitud, longitud, descripcion, scooter_id, usuario_id)
values (seq_falla_scooter.nextval, sysdate, 195.123, 
  123.122,'Falla de prueba', 1, 1);



prompt prueba tr_registro_falla en scooter con status = falla
insert into falla_scooter(falla_scooter_id, fecha_hora, 
  latitud, longitud, descripcion, scooter_id, usuario_id)
values (22, sysdate, 195.123, 
  123.122,'Falla de prueba', 5, 3);

prompt prueba tr_registro_falla en scooter con status = falla
insert into falla_scooter(falla_scooter_id, fecha_hora, 
  latitud, longitud, descripcion, scooter_id, usuario_id)
values (seq_falla_scooter.nextval, sysdate, 195.123, 
  123.122,'Falla de prueba', 5, 6);

commit;

--disconnect
/
