USE bd_notas;

/*cuenta de los alumnos creados */
INSERT INTO cuenta VALUES(NULL, 'pgonzalez', SHA(123456), 1);   -- 1
INSERT INTO cuenta VALUES(NULL, 'alumno2', SHA(22222), 1);      -- 2
INSERT INTO cuenta VALUES(NULL, 'alumno3', SHA(33333), 1);      -- 3
INSERT INTO cuenta VALUES(NULL, 'alumno4', SHA(44444), 1);      -- 4

/*las cuentas de los 3 profesores que se crearan */
INSERT INTO cuenta VALUES(NULL, 'profe1', SHA(111), 2);         -- 5
INSERT INTO cuenta VALUES(NULL, 'profe2', SHA(222), 2);         -- 6
INSERT INTO cuenta VALUES(NULL, 'profe3', SHA(333), 2);         -- 7

/*cuentas de los  5 apoderados*/
INSERT INTO cuenta VALUES(NULL, 'apoderado1', SHA(1111), 3);    -- 8
INSERT INTO cuenta VALUES(NULL, 'apoderado2', SHA(2222), 3);    -- 9
INSERT INTO cuenta VALUES(NULL, 'apoderado3', SHA(3333), 3);    -- 10
INSERT INTO cuenta VALUES(NULL, 'apoderado4', SHA(4444), 3);    -- 11

INSERT INTO cuenta VALUES(NULL, 'admin', SHA('admin'), 4);    -- 11

SELECT * FROM cuenta;


INSERT INTO docente VALUES('10.576.982-7', 'Pablo', 'Guajardo', 'Villa Miraflores 232', 'pguajardo@gmail.com', 5, TRUE);
INSERT INTO docente VALUES('1111', 'Cristian', 'Miranda', 'Calle Cuchifli', 'cmiranda@gmail.com', 6, TRUE);
INSERT INTO docente VALUES('2222', 'Daniel', 'Vasquez', 'Calle Arturo Pratt 12', 'dvasquez@gmail.com', 7, TRUE);

/*se crearan 4 apoderados para el curso estos son datos falsos solo para realizar las pruebas */
/*comprobrar nuevamente las cuentas para que no tire error */
INSERT INTO apoderado VALUES('11.950.574-7','Angelica','Camilo', 8); 
INSERT INTO apoderado VALUES('3333','Maria','Conchali', 9); 
INSERT INTO apoderado VALUES('4444','Ana','Aguilera', 10); 
INSERT INTO apoderado VALUES('5555','Rene','Pinto', 11);
/*se creara 5 alumnos falsos solo para pruebas*/
INSERT INTO alumno VALUES('19.121.033-6', 'Patricio','Gonzalez', 'Calle Boticelli 177', '11.950.574-7',1, TRUE);
INSERT INTO alumno VALUES('6666', 'Daniel','Palacios', 'Calle Alumno1', '3333',2, TRUE);
INSERT INTO alumno VALUES('7777', 'Luis','Paredes', 'Calle Alumno2', '4444',3, TRUE);
INSERT INTO alumno VALUES('8888', 'Vale','Diaz', 'Calle Alumno3', '5555',4, TRUE);
/* alumno rut ,nombre,apellido,calle,apoderado,cuenta,activo*/
/*las cuentas de los 3 profesores que se crearan */
SELECT * FROM alumno;
select * from cuenta;


/*sintaxis time HH:MM:SS*/
/*primera asignatura*/
insert into horario values(null,4,'13:30:00','17:30:00','Lunes');     -- 1
insert into horario values(null,2,'08:15:00','10:15:00','jueves');   -- 2

/*horario segunda asignatura*/
insert into horario values(null,3,'14:45:00','17:45:00','martes');  -- 3

/*tercera asignatura*/
insert into horario values(null,5,'10:20:00','15:2:00','Viernes');  -- 4
insert into horario values(null,5,'20:00:00','21:45:00','Viernes');  -- 5

/*se crearan 3 curso solo se usara uno de ejemplo*/
insert into  curso values(null,'Ingieneria En Informatica',2016,5);     -- 1
insert into  curso values(null,'Ingieneria En Informatica',2017,10);    -- 2
insert into  curso values (null,'Ingieneria En Informatica',2018,12);   -- 3
/*se le agregaran los laumnos al curso 1*/

select * from curso;

insert into alumno_curso values(null,1,'19.121.033-6');
insert into alumno_curso values (null,1,'6666');
insert into alumno_curso values(null,1,'7777');
insert into alumno_curso values(null,1,'8888');

/*se crearon las asignaturas para los siguientes alumnos*/
insert into asignatura values(null,'Calculo I','10.576.982-7',1);   -- 1
insert into asignatura values(null,'Java','1111',2);                -- 2
insert into asignatura values(null,'Cultura y Valores','2222',3);   -- 3
select * from asignatura;

/*asignacion de ramos */
insert into alumnoAsignatura values(null,'19.121.033-6',1);     -- 1
insert into alumnoAsignatura values (null,'19.121.033-6',2);    -- 2
insert into alumnoAsignatura values (null,'19.121.033-6',3);    -- 3

insert into alumnoAsignatura values(null,'6666',2);             -- 4
insert into alumnoAsignatura values(null,'6666',3);             -- 5

insert into alumnoAsignatura values(null,'7777',1);             -- 6

insert into alumnoAsignatura values(null,'8888',3);             -- 7

select * from alumnoAsignatura;

-- ASISTENCIA DE ALUMNOS.
-- YYYY-MM-DD HH:MM:SS
INSERT INTO asistencia VALUES(NULL,'2018-05-07 13:30:00');  -- 1
INSERT INTO asistencia VALUES(NULL,'2018-05-07 08:15:00');  -- 2

INSERT INTO asistencia VALUES(NULL,'2018-05-08 14:45:00');  -- 3
INSERT INTO asistencia VALUES(NULL,'2018-05-08 15:45:00');  -- 4

INSERT INTO asistencia VALUES(NULL,'2018-05-15 16:45:00');
INSERT INTO asistencia VALUES(NULL,'2018-05-16 20:00:00');

INSERT INTO alumnoAsistencia VALUES(NULL,1,1,TRUE);
INSERT INTO alumnoAsistencia VALUES(NULL,1,2,TRUE);

INSERT INTO alumnoAsistencia VALUES(NULL,2,3,FALSE);

INSERT INTO alumnoAsistencia VALUES(NULL,3,4,FALSE);
INSERT INTO alumnoAsistencia VALUES(NULL,3,5,TRUE);

INSERT INTO alumnoAsistencia VALUES(NULL,4,4,TRUE);
INSERT INTO alumnoAsistencia VALUES(NULL,4,5,TRUE);


-- PRUEBA NOTAS------------------

SELECT * FROM alumnoAsignatura;

INSERT INTO mensajeDocente VALUES(NULL,"Mensaje 1",1,1);
INSERT INTO mensajeDocente VALUES(NULL,"Mensaje 2",1,2);
INSERT INTO mensajeDocente VALUES(NULL,"Mensaje 3",1,3);

-- PRUEBA Mensaje------------------

INSERT INTO nota VALUES(NULL, 1, 7, 50);
INSERT INTO nota VALUES(NULL, 1, 7, 30);
INSERT INTO nota VALUES(NULL, 1, 6, 20);

INSERT INTO nota VALUES(NULL, 6, 5, 50);

UPDATE nota SET valor = 6 WHERE id = 1;
SELECT * FROM nota;
SELECT * FROM mensajeDocente;


SELECT * FROM asistencia WHERE id = 5;
SELECT * FROM mensajeDocente;

SELECT * FROM nota WHERE alumnoAsignatura = 1;

SELECT * FROM alumnoAsistencia WHERE alumnoAsignatura_fk = 5;


SELECT * FROM alumno WHERE cuenta = 2 and alumnoActivo is TRUE

SELECT * FROM mensajeDocente WHERE id = 1;