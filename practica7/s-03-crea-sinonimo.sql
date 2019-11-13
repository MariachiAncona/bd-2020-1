--@Autor:          Eliezer Jair Ochoa Santos, Ramirez Ancona Simon Eduardo
--@Fecha creación: 01/11/2019
--@Descripción:    Creacion de sinonimo

prompt Proporcionar el password del usuario sys
connect sys as sysdba

grant create synonym to jos_p0703_invitado;

prompt Proporcionar el password del usuario jos_p0703_admin
connect jos_p0703_admin 

grant select on cuenta to jos_p0703_invitado;


prompt Proporcionar el password del usuario jos_p0703_invitado
connect jos_p0703_invitado 


create or replace synonym s_cuenta_cliente for jos_p0703_admin.cuenta; 
 
disconnect;
/

