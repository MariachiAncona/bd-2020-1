
prompt Proporcionar contraseña para sys
connect sys as sysdba 

drop user ocra_p1001_subastas cascade;

disconnect

@@s-01-main.sql

connect ocra_p1001_subastas/ocra

@@s-04-respuestas.sql

@@s-05-validador-main.sql