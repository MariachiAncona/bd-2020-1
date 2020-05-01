--@Autor(es):       Eliezer Jair Ochoa Santos, 
--@Fecha creación:  27/04/2020
--@Descripción:     Creación de usuarios y roles 


prompt Proporcionar el password del usuario sys:
connect sys as sysdba 

create table estudiante(
    estudiante_id number(10,0) constraint estudiante_pk primary key,
    nombre varchar2(40) not null, 
    ap_paterno varchar2(40) not null,
    ap_materno varchar2(40),
    num_cuenta number(9,0) not null,
    tipo char(1) not null,
    constraint estudiante_tipo_chk check(tipo='R' or tipo='O'),
    constraint estudiante_num_cuenta_chk check(
            (tipo='R' and num_cuenta like '30%')or
            (tipo='O' and num_cuenta like '31%')
    )
);

create table asignatura(
    asignatura_id number(10,0) constraint asignatura_pk primary key,
    nombre varchar2(40) not null,
    clave number(4,0) not null,
    creditos number(2,0) not null
    asignatura_requerida number(10,0),
    constraint asignatura_asignatura_requerida_fk foreign key(asignatura_requerida)
    references asignatura(asignatura_id),
    constraint asignatura_clave_uk unique(clave)
);


create table oyente(
    estudiante_id number(10,0),
    num_recursamientos number(2,0) not null,
    num_extraordinarios number(2,0) not null,
    constraint oyente_estudiante_id_fk foreign key(estudiante_id)
    references estudiante(estudiante_id),
    constraint oyente_pk primary key(estudiante_id),
    constraint oyente_suma_recursamiento_extraordinario_chk check(num_estudiante+num_extraordinarios<=10)
);

create table regular(
    estudiante_id number(10,0),
    semestre number(2,0) not null,
    promedio_general number(4,2) not null,
    constraint regular_estudiante_id_fk foreign key(estudiante_id)
    references estudiante(estudiante_id),
    constraint regular_pk primary key(estudiante_id),
     
);

create table oyente_asignatura(
    estudiante_id number(10,0),
    asignatura_id number(10,0),
    fecha_aprobacion date default sysdate not null,
    calificacion number(2,0),
    constraint oyente_asignatura_estudiante_id_fk foreign key(estudiante_id)
    references estudiante(estudiante_id),
    constraint oyente_asignatura_asignatura_id_fk foreign key(asignatura_id)
    references asignatura(asignatura_id),
    constraint oyente_asignatura_pk primary key (estudiante_id,asignatura_id),
    constraint oyente_asignatura_calificacion_chk chek(calificacion>=5 and calificacion<=10)
    
);

create sequence seq_estudiante
    start with 10
    increment by 3
    nocycle
    cache 5; 

prompt Primer valor de la secuencia
select seq_estudiante.nextval from dual;

prompt Valor de la secuencia, no incremento
select seq_estudiante.currval from dual;

create index num_cuenta_ix
on estudiante(substr(to_string(num_cuenta),3,8));

create asignatura_requerida_id_ix 
on asignatura(asignatura_requerida);


create or replace view v_estudiante(
    estudiante_id,nombre,semestre,num_cuenta )
    as select estudiante_id,nombre,semestre,num_cuenta
    from estudiante e, regular r 
    where e.estudiante_id=r.estudiante_id;

prompt Listo!
disconnect;



