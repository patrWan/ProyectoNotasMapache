DROP DATABASE bd_notas;
CREATE DATABASE bd_notas;
 
USE bd_notas;

CREATE TABLE privilegio(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(30),
    PRIMARY KEY(id)
);
INSERT INTO privilegio VALUES(NULL,'alumno');
INSERT INTO privilegio VALUES(NULL,'docente');
INSERT INTO privilegio VALUES(NULL,'apoderado');
INSERT INTO privilegio VALUES(NULL,'Administrador');
SELECT * FROM alumnoAsignatura WHERE alumno = '19.121.033-6';

--SELECT descripcion FROM privilegio WHERE id = 1;
--SELECT privilegio.id FROM privilegio, cuenta
--WHERE privilegio.id = cuenta.privilegio 
--AND cuenta.usuario = 'pgonzalez';

CREATE TABLE cuenta(
    id INT AUTO_INCREMENT,
    usuario VARCHAR(30),
    pass VARCHAR (40),
    privilegio INT,
    PRIMARY KEY(id),
    FOREIGN KEY (privilegio) REFERENCES privilegio(id)
);

CREATE TABLE apoderado(
    rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    cuenta INT,
    PRIMARY KEY(rut),
    FOREIGN KEY (cuenta) REFERENCES cuenta(id)
);

CREATE TABLE docente(
    rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(100),
    correo VARCHAR(100),
    cuenta INT,
    docenteActivo boolean,
    PRIMARY KEY(rut),
    FOREIGN KEY (cuenta) REFERENCES cuenta(id)
);

CREATE TABLE alumno(
    rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(100),
    apoderado_FK VARCHAR(13),
    cuenta INT,
    alumnoActivo boolean,
    PRIMARY KEY(rut),
    FOREIGN KEY (apoderado_FK) REFERENCES apoderado(rut),
    FOREIGN KEY (cuenta) REFERENCES cuenta(id)
);

CREATE TABLE horario(
    id INT AUTO_INCREMENT,
    horasTotal INT,
    horaInicio TIME,
    horaFin TIME,
    dia VARCHAR(50),
    PRIMARY KEY(id)
);


CREATE TABLE asignatura(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    docente_fk VARCHAR(13),
    horario_fk INT,
    PRIMARY KEY(id),
    FOREIGN KEY (docente_fk) REFERENCES docente(rut),
    FOREIGN KEY (horario_fk) REFERENCES horario(id)
   
);

SELECT * FROM asignatura WHERE docente_fk = '10.576.982-7';

CREATE TABLE alumnoAsignatura(
    id INT AUTO_INCREMENT,
    alumno VARCHAR(13),
    asignatura_fk INT,
    PRIMARY KEY(id),
    FOREIGN KEY (alumno) REFERENCES alumno(rut),
    FOREIGN KEY (asignatura_fk) REFERENCES asignatura(id)
);
SELECT alumno.rut, alumno.nombre FROM alumnoAsignatura, alumno, asignatura WHERE alumnoAsignatura.alumno = alumno.rut 
AND alumnoAsignatura.asignatura_fk = asignatura.id AND  asignatura_fk = 1;

SELECT asignatura.nombre FROM alumnoAsignatura, alumno, asignatura 
WHERE alumnoAsignatura.asignatura_fk = asignatura.id 
AND alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.alumno = '19.121.033-6';

CREATE TABLE nota(
    id INT AUTO_INCREMENT,
    alumnoAsignatura INT,
    valor FLOAT,/*Nota en sí*/
    porcentaje FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(alumnoAsignatura) REFERENCES alumnoAsignatura(id)
);
SELECT nota.valor, nota.porcentaje FROM nota WHERE alumnoAsignatura = 1;

SELECT alumnoAsignatura.id, alumno.rut, alumno.nombre, alumno.apellido FROM alumno, asignatura, alumnoAsignatura
WHERE alumnoAsignatura.alumno = alumno.rut AND alumnoAsignatura.asignatura_fk = asignatura.id
AND asignatura.id = 1;

CREATE TABLE asistencia(
	id INT AUTO_INCREMENT,
    fechaHora DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE alumnoAsistencia(
	id INT AUTO_INCREMENT,
    alumnoAsignatura_fk INT,
    asistencia_fk INT,
    asistido BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (alumnoAsignatura_fk) REFERENCES alumnoAsignatura(id),
    FOREIGN KEY (asistencia_fk) REFERENCES asistencia(id)
);
create table curso(
    id int auto_increment,
    carrera varchar(50),
    año int,
    cantidad_Alumno int,
    primary key(id)
 
);
CREATE TABLE mensajeDocente(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(200),
    curso_fk int,
    alumnoAsignatura_fk int,
    PRIMARY KEY(id),
    foreign key(curso_fk)references curso(id),
    foreign key(alumnoAsignatura_fk)references alumnoAsignatura(id)
);
create table alumno_curso(
     id int auto_increment,
     id_curso int,
     rut_alumno varchar(50),
     primary key(id),
     foreign key(id_curso)references curso(id),
     foreign key(rut_alumno)references alumno(rut)
);
SELECT * FROM alumno;
SELECT * FROM apoderado;

SELECT * FROM alumnoAsignatura WHERE alumno LIKE '19.121.033-6';

SELECT alumno.rut, alumno.nombre, nota.valor, nota.porcentaje, nota.id 
FROM nota, alumno, asignatura, alumnoAsignatura
WHERE nota.alumnoAsignatura = alumnoAsignatura.id
AND alumnoAsignatura.alumno = alumno.rut 
AND alumnoAsignatura.asignatura_fk = asignatura.id
AND alumno.rut = '19.121.033-6' AND asignatura.id = 2