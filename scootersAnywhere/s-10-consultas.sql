--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Consultas para completar las que faltan de utilizar


prompt Conectando como usuario invitado para hacer consultas
connect or_proy_invitado/invi

--Consulta que muestra todos los scooter que no tienen reporte de falla o status de falla
select s.scooter_id, s.status_scooter_id, ss.clave
from scooter s, status_scooter ss,
  (
  select scooter_id
  from scooter
    minus ( 
    select s.scooter_id
    from falla_scooter fs, scooter s
    where fs.scooter_id = s.scooter_id
      union
    select s.scooter_id
    from scooter s, status_scooter ss
    where s.status_scooter_id = ss.status_scooter_id
      and clave = 'CON FALLAS'
    )
 ) q1
where q1.scooter_id = s.scooter_id
  and s.status_scooter_id = ss.status_scooter_id;

prompt Conectando como usuario admin para hacer consultas a vistas
connect or_proy_admin/admin


--Consulta que muestra todas las fallas y en caso de tener imagen tambien la obtiene
select fs.scooter_id, fs.falla_scooter_id, i.no_imagen, i.imagen_falla
from falla_scooter fs
left join imagen_falla i
on fs.falla_scooter_id = i.falla_scooter_id;

--Consulta a las vistas creadas
select * from v_nombre_zona_sccoter;
select * from v_scooter_marca_falla;
select * from v_usuario_tarjetas;


disconnect

/