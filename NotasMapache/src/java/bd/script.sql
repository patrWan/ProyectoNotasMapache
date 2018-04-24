DROP DATABASE bd_notas;
CREATE DATABASE bd_notas;
 
USE bd_notas;

CREATE TABLE privilegio(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(30),
    PRIMARY KEY(id)
);

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

CREATE TABLE alumnoAsignatura(
	id INT AUTO_INCREMENT,
    alumno VARCHAR(13),
    asignatura INT,
    PRIMARY KEY(id),
    FOREIGN KEY (alumno) REFERENCES alumno(rut),
    FOREIGN KEY (asignatura) REFERENCES asignatura(id)
);

CREATE TABLE nota(
    id INT AUTO_INCREMENT,
    alumnoAsignatura INT,
    valor FLOAT,/*Nota en sí*/
    porcentaje FLOAT,
    PRIMARY KEY(id),
    FOREIGN KEY(alumnoAsignatura) REFERENCES alumnoAsignatura(id)
);

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

