
--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de estructura para tabla externa


prompt Conectando como usuario admin para crear tabla externa
connect or_proy_admin/admin

prompt Creando tabla externa

create table tabla_pago_ext (
  carga_minima number(2,0),
  carga_maxima number(3,0),
  cantidad number(4,2)
  )
  organization external (
      --En oracle existen 2 tipos de drivers para parsear el archivo:
      -- oracle_loader y oracle_datapump
      type oracle_loader
      default directory directorio
      access parameters (
      records delimited by newline
      badfile directorio:'tabla_pago_ext_bad.log'
      logfile directorio:'tabla_pago_ext.log'
      fields terminated by '#'
      lrtrim
    (
    carga_minima, carga_maxima, cantidad
    )
  )
  location ('tabla_pago_ext.csv')
) 
reject limit unlimited;

disconnect
/