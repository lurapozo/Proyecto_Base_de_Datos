create table Institucion (
	nombreI varchar(50) not null,
    ubicacion varchar(70) not null,
    tipo_Institucion varchar(10),
    primary key(nombreI, ubicacion)
);

create table Adminn(
    adminID char(8) not null,
    nombreI varchar(50) not null,
    ubicacion varchar(70) not null,
    horario_Turno datetime not null,
    correo varchar(70),
    nombreA varchar(20),
    primary key(adminID),
    foreign key (nombreI, ubicacion) references Institucion(nombreI, ubicacion)
);
create table Profesores (
	profesorID char(8) not null primary key,
    nombreI varchar(50) not null,
    ubicacion varchar(70) not null,
	adminID char(8),
    nombreP varchar(50),
	foreign key (nombreI, ubicacion) references Institucion (nombreI, ubicacion),
    foreign key (adminID) references Adminn(adminID)
);

create table Curso(
    cursoID char(8) not null,
    profesorID char(8) not null,
    ubicacion varchar(70) not null,
    nombreI varchar(50) not null,
    horas_semanales time not null,
    materia varchar(20),
    primary key(cursoID),
    foreign key (nombreI, ubicacion) references Institucion(nombreI, ubicacion),
    foreign key (profesorID) references Profesores(profesorID)
);
create table Estudiantes (
	estudianteID char(8) not null primary key,
	nombreI varchar(50) not null,
    ubicacion varchar(70) not null,
    adminID char(8),
    nombreE varchar(50),
    foreign key (nombreI, ubicacion) references Institucion (nombreI, ubicacion),
    foreign key (adminID) references Adminn(adminID)
);
create table Ensenar(
    profesorID char(8) not null,
    estudianteID char(8) not null,
    primary key (profesorID, estudianteID),
    foreign key (estudianteID) references Estudiantes(estudianteID),
    foreign key (profesorID) references Profesores(profesorID)
);
create table Actividades(
    actividadID char(8) not null,
    profesorID char(8) not null,
    cursoID char(8) not null,
    fecha_Entrega datetime not null,
    duracion_Actividad time default null,
    descripcion varchar(100),
    primary key (actividadID),
    foreign key (cursoID) references Curso(cursoID),
    foreign key (profesorID) references Profesores(profesorID)
);
create table Pertenecer (
	estudianteID char(8) not null,
	cursoID char(8) not null,
    horario datetime,
    primary key(estudianteID, cursoID),
    foreign key (estudianteID) references Estudiantes(estudianteID),
    foreign key (cursoID) references Curso(cursoID)
);
create table Trabajos (
	estudianteID char(8) not null,
	cursoID char(8) not null,
    actividadID char(8) not null,
    estado boolean,
    primary key(estudianteID, cursoID, actividadID),
    foreign key (estudianteID, cursoID) references Pertenecer (estudianteID, cursoID),
    foreign key (actividadID) references Actividades(actividadID)
);