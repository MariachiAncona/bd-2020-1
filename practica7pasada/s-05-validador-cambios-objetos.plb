@@s-04-validador-usernames.sql
Prompt conectando como usuario  &&p7_usr_admin
connect &&p7_usr_admin/&&p7_usr_admin_pwd
set serveroutput on
set feedback off
set linesize 200
whenever sqlerror exit rollback;
@s-00-funciones-validacion.plb
@s-04-validador-usr-admin.plb
create or replace procedure spv_valida_cambios_main wrapped 
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
6da 3f5
mN8a6DLFxya7c81u+EQqMg2dBZQwg41cTCATfI5V1TqUNPcnQaJmMvyJSVtolaRwJx2jT1by
fWCNZ5WAGvnic0ZzLUyEFsiiXv3pvt/+ks52mgsGx8nz2l2iZIfLmy+7wnlWtzC1dZSNaMaT
4l5/Ezv6v/zX9aS831JaZ9K6/3FVnvQfcPR4X8dhRW4ah6JTDkeYbg/egi779hXQkUakJwve
f0n1AHp4RdMdr6n4L2ZHO7KLDAQiBBFS1jRQUuIrgqkEZMStTtDK73RmOdE5ViOxGNyD3jqt
r6mSWcv1NxQ2KFfLjoAehNAZB6Kj/eBzdf2CLtmbxWL2ANke5q7sIWSGQh+RYelCLapWXpMX
MgNtDMMibBYgM8LVZ/rRIhrCJ/Ho2AakrAN3Ms0+Lj/GwlmqAVxMb00TItRyf6zseTf8imNX
4XGvnrKSGRo9zzd0jIcEZ1WpTINa7ZboMQDTxcNkPd/i6yI/+SdR9rYiyLXeBJ5ZKXhF6E28
FSiBNu77RqmkmCK71zjv0L723JFn1lCvdgi6mUpHAEFswnZ28z7mfKnd3LC5p9068sunjvsX
TRPiCKRgaeCCIfwCBh0XHNNroDchd56E7VYaoqgIyn52yCJKIbMrWh74x/PWkGDAz9RiKrzv
yMvnSeExwy2yFhe2e232oHyUzwe1fxKFViQaAY2UOoUWlulYTQjHnil7YuueeYIB1nvVbd5P
IFkNOlO6sBT/ACLNd9J7rD2Ns5poPxhvjw0dVEdJdrq44HNMOrv/Fz19ivN2voMA9bFdMIaJ
R3+NvSGBfif3/u/EZ57z28cf2mmxKsFq2yaZ/+eFvTFj9KecyGZL34+iAB+c6XdjfJGk3akK
G4Z+DJ+0R+BB6c+NUJi/dzbeU3vN2is1SKWjAYDhsEc2zDJvRJ+saJ0IpoKWBZybeKU9CMeh
VJqpePm4mpaTHptS1cpPau3xdNFgd/mTbDGaJL5BjkLC9nCDK9NyhxCSW1eKPMM=

/
show errors
exec spv_print_header
exec spv_valida_cambios_main
disconnect