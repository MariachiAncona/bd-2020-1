set verify off
set feedback off
set serveroutput on
whenever sqlerror exit rollback
Prompt Cargando nombres de usuarios
@@s-04-validador-usernames.sql
Prompt Conectando como sys
connect sys/&&sys_pwd as sysdba
Prompt otorgando privilegios para validar.
grant create procedure to &&p7_previo_usr;
grant create sequence to &&p7_previo_usr;
grant create procedure  to &&p7_usr_admin;
grant create sequence to &&p7_usr_admin;
grant create procedure  to &&p7_usr_invitado;
grant create sequence  to &&p7_usr_invitado;
Prompt conectando como usuario &&p7_previo_usr
connect &&p7_previo_usr/&&p7_previo_usr_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-previo.plb
Prompt conectando como usuario &&p7_usr_invitado
connect &&p7_usr_invitado/&&p7_usr_invitado_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-invitado.plb
Prompt conectando como usuario  &&p7_usr_admin
connect &&p7_usr_admin/&&p7_usr_admin_pwd
@s-00-funciones-validacion.plb
@s-04-validador-usr-admin.plb
create or replace procedure spv_valida_esquema_usr_admin wrapped 
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
fda 526
dkSN2vFUclNFvlI/Dzayypx6c6swg1XquscK3y+5xz8CGbjoe6SKFP/1ZcE1Ob7My1oi0zCD
SbJbx6tlSqG+Gs2du57n369SGy5ybIEwUHkN+M3GJ+pWGrhN/fIYGJgSECw761watwbQxb7w
9Vxde6NV6P3bjnvssw8EJHvm5/knLXcMBn+cEZw25ilpAqJla/QegiLCbzO+ECV0oI5BMs+z
SIq7XHe9Pr8EiJMYP3fJLy+Z0Ag2umgVJL8FnzM2kYs3z9WZ065kJ8A+Go5y53+8Ggl/r0/x
TpXxOnSRAhmjpI/sqn1n7mv8zYkFHiTfvq4MHpXVw4qaDHBqA55A/yzds8gGCdA5jtdjpcxy
Am1zbaQM+LGYUN6r1JSN+yE3EURgpDl2S8rS49vAuXAckmKRijCRoQ2ekGnFBjhQrFBue5yi
DOcnlFo3E+5fcfN0ZuLdww1NLmTW4/hopNbFfQLD8NS0xcZnWvmtQEmGu34FdJR6dyCe3L0Q
Eapug85HQCxhqHdCfUL4Bj5digtaDcehkCiMqy1cVTtRZTVSjX6X55Sh9PHmsBP4FJYlfk4Z
YKqHSTpqRdzqfQBlL26LsixhcD0bJS73XWwhATzliDKDuFinPXuXfzDjeD07SCu4NEq5tkzD
Uo0fs0WoH2tyoc+kKXo6AGKXemrXpV71tjgvowEEyICxk0Gx7f9baKNtyrY3+oajiNIKGgQ1
3Hx01oQqxuh5k99MAewGuxV80lAz9BnDHg3M5yXuXr0p8MzA4BatKczm0TfxyfIuh2f631oZ
0aSwQErrOEYhXvzSL6QLyl2qYMZYa4aK86QyzyG3/IpjRs8uYPkSIuhA0Cl8euw+KhAY8O2A
Qztbxr6ohs9aYIJj/weRdoX9BeFz7SsXFhxDGg+Q1y8JXZnlTlC+b9tK0NRkqYXVnoSc/1TK
Sxr7t+b4XerNyNXF6bU8cLEfRAubDwdc+Ju/Udmiw4hDeL106vqwoEe4QYneQSkFfZakgHih
QbLlClWO66uXDmk/2lnoXy6fZ61k5RkFhi0dzdHZC+udoXC+RgzDN+omrbg5hyjrBNB5elgc
WURfmEdr2pwR5zAwYe4oANEarnpqIPAwuB0sFn1h7DDbPHpd3KYI+UhgjjLMsEqZ+V/UELE6
i7h56ocgAaVE6z/eoBgP9LHz+eYYiO77EFB99DELMtbEwkbD4Q/H2SvMcjjZdgUZNk4f5qsd
cEra9TgbE7ow3W9RlpjX3A8z74VXA8jIP6Cpzoc8LB5/NmUYAy404nDSXrKpwP4GB6qmlndK
AA==

/
show errors
exec spv_print_header
connect &&p7_previo_usr/&&p7_previo_usr_pwd
set serveroutput on
exec spv_valida_esquema_usr_previo
connect &&p7_usr_invitado/&&p7_usr_invitado_pwd
set serveroutput on
exec spv_valida_esquema_usr_invitado
connect &&p7_usr_admin/&&p7_usr_admin_pwd
set serveroutput on
exec spv_valida_esquema_usr_admin
exit;
