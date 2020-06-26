--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  20/06/2020
--@Descripción:     Creación de procedimiento para mostrar directorio telefonico de marcas


prompt Conectando como usuario admin para crear tablas
connect or_proy_admin/admin
set serveroutput on
create or replace procedure marca_telefono is

  cursor cur_marca_telefono is
  select m.nombre, t.telefono
  from marca m, telefono t
  where m.marca_id = t.marca_id;
   -- and m.marca_id = 6;

  v_para_imprimir varchar(200);

begin
  for r in cur_marca_telefono loop
    v_para_imprimir := r.nombre
      ||'->'
      ||r.telefono;
    dbms_output.put_line(v_para_imprimir);
  end loop;
end;
/
show errors