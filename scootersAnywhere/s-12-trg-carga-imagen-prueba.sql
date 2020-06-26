--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Prueba de trigger carga imagen


prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin

insert into imagen_falla(no_imagen, falla_scooter_id, imagen_falla)
  values(1, 5, empty_blob());

  commit;

  disconnect

/