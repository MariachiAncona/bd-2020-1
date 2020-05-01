--@Autor(es):       Eliezer Jair Ochoa Santos, 
--@Fecha creación:  27/04/2020
--@Descripción:     Creación de usuarios y roles 


prompt Proporcionar el password del usuario sys:
connect sys as sysdba 

create table estudiante(
    estudiante_id number(10,0) constraint estudiante_pk


