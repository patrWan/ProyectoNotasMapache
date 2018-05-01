DROP DATABASE bd_notas;
CREATE DATABASE bd_notas;
 
USE bd_notas;

CREATE TABLE privilegio(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(30),
    PRIMARY KEY(id)
);
INSERT INTO privilegio VALUES(NULL,'alumno');
INSERT INTO privilegio VALUES(NULL,'apoderado');

SELECT privilegio.id FROM privilegio, cuenta
WHERE privilegio.id = cuenta.privilegio 
AND cuenta.usuario = 'pgonzalez';

CREATE TABLE cuenta(
    id INT AUTO_INCREMENT,
    usuario VARCHAR(30),
    pass VARCHAR (40),
    privilegio INT,
    PRIMARY KEY(id),
    FOREIGN KEY (privilegio) REFERENCES privilegio(id)
);
INSERT INTO cuenta VALUES(NULL, 'pgonzalez', 123456, 1);
INSERT INTO cuenta VALUES(NULL, 'acamilo', 123456, 2);

SELECT * FROM CUENTA WHERE usuario = 'pgonzalez' AND pass = '123456';
CREATE TABLE apoderado(
    rut VARCHAR(13) UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    cuenta INT,
    PRIMARY KEY(rut),
    FOREIGN KEY (cuenta) REFERENCES cuenta(id)
);

INSERT INTO apoderado VALUES('11.950.574-7','Angelica','Camilo', 2); 

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
INSERT INTO alumno VALUES('19.121.033-6', 'Patricio','Gonzalez', 'Calle Boticelli 177', '11.950.574-7',1, TRUE); 

SELECT alumno.rut, alumno.nombre, alumno.apellido, alumno.direccion FROM cuenta, alumno, privilegio WHERE cuenta.privilegio = privilegio.id AND cuenta.usuario = 'pgonzalez' AND cuenta.pass = 123456;
 
CREATE TABLE horario(
	id INT AUTO_INCREMENT,
    horasTotal INT,
    horaInicio TIME,
    horaFin TIME,
    dia VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE mensajeDocente(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(200),
    PRIMARY KEY(id)
);

CREATE TABLE asignatura(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    docente_fk VARCHAR(13),
    horario_fk INT,
    mensajeDocente_fk INT,
    PRIMARY KEY(id),
    FOREIGN KEY (docente_fk) REFERENCES docente(rut),
    FOREIGN KEY (horario_fk) REFERENCES horario(id),
    FOREIGN KEY (mensajeDocente_fk) REFERENCES mensajeDocente(id)
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

