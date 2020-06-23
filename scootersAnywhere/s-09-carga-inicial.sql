--@Autor(es):       Eliezer Jair Ochoa Santos, Ramírez Ancona Simón Eduardo 
--@Fecha creación:  21/06/2020
--@Descripción:     Carga inicial de datos

prompt Conectando como usuario admin para insertar en tablas
connect or_proy_admin/admin


--Datos de status_scooter
insert into status_scooter(clave,descripcion)
  values ('APAGADO','EL SCOOTER ESTA APAGADO');
insert into status_scooter(clave,descripcion)
  values ('EN ESPERA','EL SCOOTER ESTA DISPONILE');
insert into status_scooter(clave,descripcion)
  values ('EN SERVICIO VIAJE','EL SCOOTER ESTA EN SERVICIO DE VIAJE');
insert into status_scooter(clave,descripcion)
  values ('BATERIA BAJA','EL SCOOTER TIENE LA BATERIA BAJA');
insert into status_scooter(clave,descripcion)
  values ('CON FALLAS','EL SCOOTER TIENE FALLAS');
insert into status_scooter(clave,descripcion)
  values ('EN SERVICIO RENTA','EL SCOOTER ESTA RENTADO');
insert into status_scooter(clave,descripcion)
  values ('EN SERVICIO CARGA','EL SCOOTER ESTA EN SERVICIO DE CARGA');

--Datos de tabla zona

INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'A','F0E 2D6H6U 9H3E9P 6V4T1P 2I2G9S 9O6R1J 4A1E3L 3G3');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'B','L4X 2L6E6E 7L3J5Z 5B6U9N 1B9S4I 7D9O8S 3S0Y9B 6Z5');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'C','G3R 6Y8Z1W 4W2V3E 0S8C2N 6P3D5V 5L2B6D 2C0U4M 1P8');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'D','Z6B 6C5E1P 3E9P3M 3E0P8A 0J7F3O 4R5K0C 0Z5U1Z 7A6');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'E','L7L 3N8E4B 3J9E9R 9K7C0H 8D2Y2A 3Q3N9I 2P4V6L 8Y8');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'F','B1P 0C3S9Q 7Q8B6A 3I9Y6N 6X4S9Z 2J3J4V 3N9N5F 7X4');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'G','P7C 0C8A6X 0M2Z5V 8B0J5D 9I2U4J 3X1L9K 6N8I8X 6V6');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'H','L7H 0O4O2N 5O8D3E 4U5K4R 4X2E4V 9H3T3J 0P7F4K 7O1');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'I','Q5R 6G6K5U 1O6K0L 9H7C9D 6C2W8Y 7G1M6L 8V9S9S 9F0');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'J','Z4A 2F2G0L 5S5P3L 6Z9Z5Y 2R6O9G 5W2B9H 7J1B0G 6Q0');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'K','J3X 4G5A9O 6P9A5O 4U1A0H 4M5T4S 4L0V7H 5D0Y3R 9D1');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'L','U9D 4X8Z7O 5K9C9X 0N5K3L 8X8H5G 8F0C0R 4V5G0O 4Q8');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'N','C5C 1Z6Y6G 8X8Y6F 3X1D4P 5L7W7A 2K3N4D 1Q1F8U 5L0');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'M','K7F 4R6Y6N 0K7O8T 7W2U0T 7L3D8Q 7J4P9K 0J9S0T 9K3');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'O','H9E 7D6Y8G 0P5E2R 1W3Y9A 8X5D4I 3Q6X3F 5Z7E1B 7Z5');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'P','M8T 1C5D0V 8I2X6V 0F0Y9I 9C8U6P 9E1R9L 1N3L1L 2I2');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'Q','V2H 5E3T1P 0G4R6H 7F7A0F 7Y3K6H 0M5G3P 9W9A0I 1Z6');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'R','V1J 0Y6N0L 9W0J7N 4J1U1Z 5C1P2E 6R2R7S 9X8P1R 8O6');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'S','O3K 5U1S6A 1U3N4H 9J1U0K 0T5R5U 4D4A5F 2M0U1E 9R1');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'T','D5X 7O6S0Z 2P9I0D 3U7J7X 1U9I7Z 6O0M5V 1I8Y5B 8G0');
INSERT INTO zona (zona_id,nombre,cobertura) VALUES (seq_zona.nextval,'U','C3S 1P2T6I 7Z6R2T 0P2E4N 1I4N3K 5A2D4W 7V2T6Q 0D0');

--Insertando datos de tabla marca
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Celeste Fitzpatrick');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Bradley Daniels');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Lara Duke');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Larissa Wilcox');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Yael Wise');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Aaron Matthews');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Sharon Powers');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Cruz Whitley');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'George Rocha');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Jacob Vang');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Jermaine Dalton');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Jaden Morrow');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Evan Dawson');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Cadman Russo');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Elvis Little');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Kennan Cain');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Francesca Chavez');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Christian Baird');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Porter Whitfield');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Samuel Prince');
INSERT INTO marca (marca_id,nombre) VALUES (seq_marca.nextval,'Erasmus Merritt');

--Insertando datos de tabla telefono
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,13,'3954912907');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,9,'0211748605');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,17,'9373510433');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,4,'3229563365');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (3,16,'9467636882');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (3,10,'5540950446');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (3,5,'2941207617');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,14,'7267692939');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,12,'8314972354');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,10,'2000156830');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (3,18,'7260819565');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,20,'7601370433');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,5,'5364927916');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,13,'5147992935');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,18,'0895544139');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,5,'0721427340');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,11,'4053195510');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,1,'2904246301');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,9,'2306110734');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,7,'7795300937');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,16,'4261354508');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,18,'1748883623');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,6,'7500597633');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,16,'8754804811');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,6,'5056611975');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,10,'6454313145');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,15,'5244781174');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (3,12,'4016896815');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (2,12,'7173664832');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,19,'7431619063');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,2,'5651619063');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,3,'5531619063');
INSERT INTO telefono (telefono_id,marca_id,telefono) VALUES (1,8,'8871619063');


--Insertando datos de tabla scooter
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'D8Y 3R3','166270088150010132','90','M4TI2H0X7LI2Z1A9JW',15,3,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'W2L 6L6','718925084021802971','110','Y1MF9S4V8LF5R9B5UH',13,5,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'N3V 4Y6','631728469489459013','110','B5TH2R4U6CP9V9M2VS',2,5,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'X5T 3M7','097133862266961668','110','Q4ZP1B3K5CL4N0S6AQ',1,3,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'G3S 0W7','451014119898021971','90','M2KZ5Z8M5OT2Y6N8YO',11,6,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'Q2N 1T8','181441437813711567','110','U1LL8Y7W7FR1J5A9UH',7,7,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'B3U 5S6','068279178386082765','90','L0CO0B4F2HR8K8Z1GI',19,2,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'A5J 0R4','616573917227130256','70','E8AQ6Q6L2CP0J4K4QI',9,1,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'W8B 9K7','687344261604527220','90','F4EA0R7C8JT3I0D2JA',19,6,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'Q6B 7H7','312106796190565243','110','T3YK6C2B3DQ9B4S1MW',19,3,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'R7L 0B3','181311088618204397','70','J0KZ4I6L7JC9X9H5NZ',2,5,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'B9X 3G7','769334199521033755','110','X9BK7O4Y5LS5C7M5YS',18,2,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'U5L 1F4','731949802813109082','90','K9FM4Z2K8EU4I3U2RA',5,5,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'M7U 0S0','802004670781014815','70','G4NR3N9S5PV3K9P9RV',19,3,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'R7P 9G7','443193504480431851','90','T2MR4F0E5OF4A1R2AW',19,7,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'W8W 7Y9','742310981924336190','110','U7OW2E3O9SB1M0H6YM',1,4,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'D3T 4F6','169310385874379617','90','X1NE5S5R3NB1N7I4XP',4,5,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'Y3V 8Y2','321215179410411281','110','G9XO4J0C6IT8A0X1YV',2,4,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'J7C 6I5','410296258419114401','110','K7JG3D6U5HC3D9U9PH',4,6,NULL);
INSERT INTO scooter (scooter_id,matricula,codigo_consola,capacidad_max_kg,no_serie,marca_id,status_scooter_id,scooter_reemplazo_id) VALUES (seq_scooter.nextval,'T1R 4M0','120923854704101046','90','L9PR4D9E7KW9G1B8RU',1,4,5);--Caso de scooter reemplazado

--Insertando datos de tabla zona_scooter
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,9,9);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,11,5);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,5,8);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,19,13);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,14,11);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,11,12);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,7,5);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,12,18);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,10,10);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,4,11);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,3,1);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,11,10);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,5,11);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,14,4);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,17,6);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,6,3);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,2,2);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,2,13);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,15,2);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,6,17);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,7,12);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,4,8);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,11,19);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,16,14);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,10,10);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,16,3);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,5,2);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,10,3);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,18,17);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,20,9);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,14,2);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,10,5);
INSERT INTO zona_scooter (zona_scooter_id,zona_id,scooter_id) VALUES (seq_zona_scooter.nextval,14,15);

--Insertando datos de tabla historico_status_scooter
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,5,'11/06/2021');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,7,2,'17/07/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,5,18,'24/02/2021');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,4,14,'01/06/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,5,12,'17/07/2019');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,6,17,'05/05/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,2,12,'20/02/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,5,'23/03/2021');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,13,'16/09/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,1,13,'24/05/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,3,'07/09/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,5,6,'07/02/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,4,16,'28/12/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,2,11,'20/09/2019');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,4,5,'08/06/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,5,8,'13/10/2019');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,7,5,'24/03/2021');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,2,14,'22/09/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,15,'04/04/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,7,7,'28/10/2019');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,4,2,'18/02/2021');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,5,18,'11/09/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,7,4,'21/05/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,13,'14/04/2020');
INSERT INTO historico_status_scooter (historico_status_scooter_id,status_scooter_id,scooter_id,fecha_status) VALUES (seq_historico_status_scooter.nextval,3,11,'09/03/2021');

--Insertando datos de tabla ubicacion_scooter
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-73.10474',17,'2021-04-04 23:53:17','-145.86039');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'63.51519',7,'2019-12-16 05:21:31','171.91467');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'61.53409',14,'2020-06-28 18:06:20','33.74867');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-31.77795',11,'2021-05-21 19:15:39','-8.02382');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-73.13727',3,'2020-01-06 21:56:43','49.97391');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'36.7234',2,'2021-03-07 10:21:06','57.62496');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'58.26025',12,'2020-12-05 05:40:41','-25.72174');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'82.52226',19,'2021-04-21 12:26:29','8.93721');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'72.4106',3,'2020-01-14 03:07:15','-91.51079');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'37.20173',8,'2020-03-07 09:16:23','-1.87283');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval'-54.54966',19,'2019-11-16 20:59:40','49.30433');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'82.82493',7,'2020-01-31 03:59:23','-5.31103');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'47.71022',12,'2020-06-17 18:33:07','-94.05504');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-57.0839',19,'2020-10-27 08:29:34','-43.31241');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'4.85652',17,'2021-04-30 03:29:52','-157.56377');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-63.53277',13,'2020-04-01 06:47:21','-168.7348');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'20.21348',5,'2019-09-22 01:32:42','41.06684');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-7.0695',14,'2021-01-29 23:50:57','-18.77558');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-76.13163',1,'2021-02-22 13:54:45','139.759');
INSERT INTO ubicacion_scooter (ubicacion_scooter_id,latitud,scooter_id,fecha_hora,longitud) VALUES (seq_ubicacion_scooter.nextval,'-33.56163',16,'2021-06-06 19:53:24','-178.42155');

--Insertando datos de tabla servicio















insert usuario_pago (nombre, banco, clabe, servicio, no_scooters, pago_total)
  values(
  (select nombre 
  from usuario
  where usuario_id = 1),
  (select banco 
  from servicio_carga
  natural join servicio
  where usuario_id = 1),
  (select clabe 
  from servicio_carga
  natural join servicio
  where usuario_id = 1),
  (select nombre 
  from usuario
  where usuario_id = 1),
  (select count(*)
  from servicio_carga 
  natural join scooter_servicio_carga
  natural join servicio
  natural join usuario
  where usuario_id = 1
    and servicio_id = 1
    and tipo = C),
  (select sum(te.cantidad)
  from (
    select carga_final
    from scooter_servicio_carga 
    natural join servicio_carga
    natural join scooter_servicio_carga
    natural join servicio
    natural join usuario
    where usuario_id = 1
      and servicio_id = 1
      and tipo = C
    )q1, tabla_pago_ext te
  where carga_final between carga_minima and carga_maxima)
);


disconnect
/