DROP DATABASE bd_notas;
CREATE DATABASE bd_notas;
 
USE bd_notas;

CREATE TABLE apoderado(
	rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    usuario VARCHAR(20),
    pass VARCHAR(40),
    PRIMARY KEY(rut)
); 

INSERT INTO apoderado VALUES('8.730.441-8','Patricio','Faundez','pfaundez',SHA('123456'));

CREATE TABLE docente(
	rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(100),
    correo VARCHAR(100),
    usuario VARCHAR(20),
    pass VARCHAR(40),
    PRIMARY KEY(rut)
);

INSERT INTO docente VALUES('11-1','Juan','Perez','Calle los nada','perezz@gmail.com','jperez',SHA('123456'));
INSERT INTO docente VALUES('22-2','Ricardo','Fernandez','Calle los nada','fer@gmail.com','rfernandez',SHA('123456'));

CREATE TABLE alumno(
	rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(100),
    apoderado_FK VARCHAR(13),
    usuario VARCHAR(20),
    pass VARCHAR(40),
    PRIMARY KEY(rut),
    FOREIGN KEY (apoderado_FK) REFERENCES apoderado(rut)
); 
INSERT INTO alumno VALUES('19.121.033-6','Patricio','Gonzalez','Calle Boticelli 177','8.730.441-8','pgonzalez',SHA('123456'));


CREATE TABLE asignatura(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    horas INT,
    docente_fk VARCHAR(13),
    PRIMARY KEY(id),
    FOREIGN KEY (docente_fk) REFERENCES docente(rut)
);

-- INSERT INTO asignatura VALUES(NULL, 'Ingles Intermedio I',70);
-- INSERT INTO asignatura VALUES(NULL, 'Ingenieria De Software',90);
INSERT INTO asignatura VALUES(NULL, 'Arquitectura De Software',90,'11-1');
INSERT INTO asignatura VALUES(NULL, 'Gestion De Procesos De Negocio',90,'22-2');
INSERT INTO asignatura VALUES(NULL, 'Gestion De Proyectos Informaticos',90,'11-1');

CREATE TABLE alumnoAsignatura(
	id INT AUTO_INCREMENT,
    alumno VARCHAR(13),
    asignatura INT,
    PRIMARY KEY(id),
    FOREIGN KEY (alumno) REFERENCES alumno(rut),
    FOREIGN KEY (asignatura) REFERENCES asignatura(id)
);

INSERT INTO alumnoAsignatura VALUES(NULL, '19.121.033-6', '1');
INSERT INTO alumnoAsignatura VALUES(NULL, '19.121.033-6', '2');
INSERT INTO alumnoAsignatura VALUES(NULL, '19.121.033-6', '3');
-- INSERT INTO alumnoAsignatura VALUES(NULL, '19.121.033-6', '4');
-- INSERT INTO alumnoAsignatura VALUES(NULL, '19.121.033-6', '5');
 
CREATE TABLE nota(
    id INT AUTO_INCREMENT,
    alumnoAsignatura INT,
    valor FLOAT,/*Nota en sí*/
    porcentaje FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(alumnoAsignatura) REFERENCES alumnoAsignatura(id)
);

INSERT INTO nota VALUES(NULL,'1',7.0,50);
INSERT INTO nota VALUES(NULL,'2',5.2,30);

SELECT * FROM alumno;
SELECT * FROM docente;
SELECT * FROM aapoderado;
SELECT * FROM alumnoAsignatura;

-- RESCATAR USUARIO Y CONTRASEÑA --
SELECT usuario, pass FROM alumno WHERE usuario='pgonzalez' AND pass=SHA('123456');

-- VER LAS ASIGNATURAS DE UN ALUMNO, SEGUN SU RUT.
SELECT asignatura.nombre as 'Asignatura' FROM alumnoAsignatura, alumno, asignatura
WHERE alumno.rut = alumnoAsignatura.alumno AND asignatura.id = alumnoAsignatura.asignatura
AND alumno.rut = '19.121.033-6';

-- VER LAS NOTAS DE UN ALUMNO, SEGUN SU RUT Y ASIGNATURA.
SELECT asignatura.nombre as 'Asignatura', nota.valor as 'Nota', nota.porcentaje as 'Porcentaje'
FROM asignatura, nota, alumno,alumnoAsignatura
WHERE nota.alumnoAsignatura = alumnoAsignatura.id 
AND alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura = asignatura.id
AND alumno.rut = '19.121.033-6' AND asignatura.id = 1;