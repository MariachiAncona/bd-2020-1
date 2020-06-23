--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Creación de vistas

create or replace view v_scooter_marca_falla(
  scooter_id, matricula, nombre, falla_scooter_id, descripcion
) as select st.scooter_id, matricula, nombre, falla_scooter_id, descripcion
  from marca m, scooter st, falla_scooter fs
 where m.marca_id = st.marca_id
  and st.scooter_id = fs.scooter_id;

create or replace view v_nombre_zona_sccoter(
  scooter_id, matricula, clave, nombre 
) as select st.scooter_id, matricula, clave, nombre 
  from scooter st, status_scooter ss, zona z, zona_scooter zs
  where ss.status_scooter_id = st.status_scooter_id
    and st.scooter_id = zs.scooter_id
    and zs.zona_id = z.zona_id;

create or replace view v_usuario_tarjetas(
  nombre, apellido_paterno, email, no_tarjeta, codigo_barras, credito_disponible
) as select  nombre, apellido_paterno, email, no_tarjeta, codigo_barras, credito_disponible
  from usuario u, tarjeta t, tarjeta_prepago tp
  where u.usuario_id = t.usuario_id(+)
  and u.usuario_id = tp.usuario_id(+);