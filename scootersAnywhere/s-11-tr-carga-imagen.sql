--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de trigger que carga una imagen generica al hacer insert
                  --en tabla imagen_falla con empty_blob()


prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin

--Solo inserta la misma imagen

create or replace trigger tr_carga_imagen
  for insert on imagen_falla
  compound trigger


  v_falla_scooter_id number(10,0);
  v_no_imagen number(1,0);
  v_nombre_archivo varchar2(11) := 'scooter.jpg';


  procedure carga_imagen(p_falla_scooter_id in number,
    p_no_imagen in number, p_nombre_archivo in varchar2) is

    v_bfile bfile;
    v_src_offset number := 1;
    v_dest_offset number:= 1;
    v_dest_blob blob;
    v_src_length number;
    v_dest_length number;

  begin

    v_bfile := bfilename('IMAGEN_DIR', p_nombre_archivo);
    

    if dbms_lob.fileexists(v_bfile) = 1 and not
      dbms_lob.isopen(v_bfile) = 1 then
      dbms_lob.open(v_bfile,dbms_lob.lob_readonly);

      else
      raise_application_error(-20001,'El archivo '
      ||p_nombre_archivo
      ||' no existe en el directorio IMAGEN_DIR'
      ||' o el archivo esta abierto');
    end if;

    v_dest_blob := empty_blob();

    select imagen_falla into v_dest_blob
    from imagen_falla
    where falla_scooter_id = p_falla_scooter_id
    for update;

    dbms_lob.loadblobfromfile(
    dest_lob => v_dest_blob,
    src_bfile => v_bfile,
    amount => dbms_lob.getlength(v_bfile),
    dest_offset => v_dest_offset,
    src_offset => v_src_offset);

    dbms_lob.close(v_bfile);

    v_src_length := dbms_lob.getlength(v_bfile);

    v_dest_length := dbms_lob.getlength(v_dest_blob);

    if v_src_length = v_dest_length then
    dbms_output.put_line('Escritura correcta, bytes escritos: '
      || v_src_length);
    
    else
      raise_application_error(-20002,'Error al escribir datos.\n'
      ||' Se esperaba escribir '||v_src_length
      ||' Pero solo se escribio '||v_dest_length);
    end if;

  end carga_imagen;

  before each row is
    
    begin
    
      v_falla_scooter_id := :new.falla_scooter_id;
      v_no_imagen := :new.no_imagen;
      v_nombre_archivo := 'scooter.jpg';


  end before each row;


  --After statement
  after statement is


  begin


    carga_imagen(v_falla_scooter_id, v_no_imagen, v_nombre_archivo);



  end after statement;




end;
/
show errors