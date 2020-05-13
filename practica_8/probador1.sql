
prompt Conectando como usuario sys
connect sys as sysdba

prompt Eliminando usuario josr_p0802_cuentas y sus tablas
drop user josr_p0802_cuentas cascade;

prompt Saliendo de usuario sys
disconnect

prompt Ejecutando script 1
@s-01-usuarios.sql

prompt Ejecutando script 2
@s-02-cuentas-ddl.sql

prompt Ejecutando script 3
@s-03-ejercicio3.sql

prompt Ejecutando script 4 (validación)
@s-04p-validador-ejercicio3.plb



prompt Ejecutando script 7 (inserta datos)
@s-07-ejercicio5-datos.sql

prompt Ejecutando script 8
--@s-08-ejercicio5.sql

prompt Ejecutando script 9
--@s-09p-validador-ejercicio5.plb