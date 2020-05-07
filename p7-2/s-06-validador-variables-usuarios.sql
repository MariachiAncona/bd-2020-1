--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo
--@Fecha creación:  27/04/2020
--@Descripción:     Script empleado para configurar usuarios y passwords.
--                  En la práctica, no se deben guardar passwords en los
--                  scripts, pero para agilizar la prueba del validador
--                  se crea este archivo y asi evitar escribiros cada vez
--                  que se requiera. Se realiza esta técnica en esta práctica
--                  ya que se requiere la intervención de 4 usuarios.
--                  Cambiar los valores segun corresponda.
set verify off
set serveroutput on
set feedback off
whenever sqlerror exit rollback
--password del usuario SYS
define sys_pwd=system

--username del usuario del previo
--define p7_previo_usr=sra_p07_previo
define p7_previo_usr=jos_p0701_previo
--password del usuario del previo
--define p7_previo_usr_pwd=simon
define p7_previo_usr_pwd=jair

--username del usuario admin
define p7_usr_admin=jos_p0701_admin
--password del usuario admin
define p7_usr_admin_pwd=jair

--username del usuario admin
define p7_usr_oper=jos_p0701_oper
--password del usuario admin
define p7_usr_oper_pwd=jair

--username del usuario invitado
define p7_usr_invitado=jos_p0701_invitado
--password del usuario invitado
define p7_usr_invitado_pwd=jair