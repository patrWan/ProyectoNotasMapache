USE bd_notas;
/*las cuentas de los 3 profesores que se crearan */
INSERT INTO cuenta VALUES(NULL, 'pgonzalez', SHA(123456), 1);
INSERT INTO cuenta VALUES(NULL, 'profe1', SHA(111), 2);
INSERT INTO cuenta VALUES(NULL, 'profe2', SHA(222), 2);
/*cuentas de los  5 apoderados*/
INSERT INTO cuenta VALUES(NULL, 'apoderado1', SHA(1111), 3);
INSERT INTO cuenta VALUES(NULL, 'apoderado2', SHA(2222), 3);
INSERT INTO cuenta VALUES(NULL, 'apoderado3', SHA(3333), 3);
INSERT INTO cuenta VALUES(NULL, 'apoderado4', SHA(4444), 3);
/*cuenta de los alumnos creados */
INSERT INTO cuenta VALUES(NULL, 'alumno1', SHA(11111), 1);
INSERT INTO cuenta VALUES(NULL, 'alumno2', SHA(22222), 1);
INSERT INTO cuenta VALUES(NULL, 'alumno3', SHA(33333), 1);
INSERT INTO cuenta VALUES(NULL, 'alumno4', SHA(44444), 1);
select * from cuenta;
/*en mi caso las cuentas de los porfe son 6 y 7 verificar cuantas cuentas tienen echas para no tirar algun error */

/*se crearon tres docentes para hacer las consultas y ejmplos */
INSERT INTO docente VALUES('17.666.666-7', 'Claudio','Aravena', 'Calle Arturo Pratt', 'caravena@gmail.com',2, TRUE);
INSERT INTO docente VALUES('111', 'Pedro','ARce', 'Calle profesor1', 'correo_Profesor1',6, TRUE);
INSERT INTO docente VALUES('222', 'Patricio','Perez', 'Calle profesor2', 'correo_Profesor2',7, TRUE);

/*se crearan 5 apoderados para el curso estos son datos falsos solo para realizar las pruebas */
/*comprobrar nuevamente las cuentas para que no tire error */
INSERT INTO apoderado VALUES('11.950.574-7','Angelica','Camilo', 3); 
INSERT INTO apoderado VALUES('1111','Angelica','Camilo', 8); 
INSERT INTO apoderado VALUES('2222','Ana','Aguilera', 9); 
INSERT INTO apoderado VALUES('3333','Rene','Pinto', 10); 
INSERT INTO apoderado VALUES('4444','Diana','Cruz', 11); 
/*se creara 5 alumnos falsos solo para pruebas*/
INSERT INTO alumno VALUES('19.121.033-6', 'Patricio','Gonzalez', 'Calle Boticelli 177', '11.950.574-7',1, TRUE);
INSERT INTO alumno VALUES('11111', 'Daniel','Palacios', 'Calle Alumno1', '1111',12, TRUE);
INSERT INTO alumno VALUES('22222', 'Luis','Paredes', 'Calle Alumno2', '2222',13, TRUE);
INSERT INTO alumno VALUES('33333', 'Vale','Diaz', 'Calle Alumno3', '3333',14, TRUE);
INSERT INTO alumno VALUES('44444', 'Cami','Valdes', 'Calle Alumno4', '4444',15, TRUE);
/* alumno rut ,nombre,apellido,calle,apoderado,cuenta,activo*/
/*las cuentas de los 3 profesores que se crearan */

select * from cuenta;


/*sintaxis time HH:MM:SS*/
/*primera asignatura*/
insert into horario values(null,4,'1:30:00','5:30:00','Lunes');
insert into horario values(null,2,'8:15:00','10:15:00','jueves');
/*horario segunda asignatura*/
insert into horario values(null,3,'14:45:00','17:45:00','martes');
/*tercera asignatura*/
insert into horario values(null,5,'10:20:00','15:2:00','Viernes');
/*se crearan 3 curso solo se usara uno de ejemplo*/
insert into  curso values(null,'informatica',3,5);
insert into  curso values(null,'informatica',1,'10');
insert into  curso values (null,'informatica',2,'12');
/*se le agregaran los laumnos al curso 1*/



select * from curso;
select * from alumno;

insert into alumno_curso values(null,1,'19.121.033-6');
insert into alumno_curso values (null,1,'11111');
insert into alumno_curso values(null,1,'22222');
insert into alumno_curso values(null,1,'33333');
insert into alumno_curso values(null,1,'44444');

/*se crearon las asignaturas para los siguientes alumnos*/
insert into asignatura values(null,'Calculo','17.666.666-7',1);
insert into asignatura values(null,'Java','111',1);
insert into asignatura values(null,'Cultura','222',1);
select * from asignatura;
/*asignasion de ramos */
select * from asignatura
insert into alumnoAsignatura values(null,'19.121.033-6',2);
insert into alumnoAsignatura values (null,'11111',1);
insert into alumnoAsignatura values(null,'22222',1);
insert into alumnoAsignatura values(null,'33333',1);
insert into alumnoAsignatura values(null,'44444',1);











