/*Adminn*/
/*Se ingresa un admin nuevo*/
drop procedure if exists anadirAdmin;
DELIMITER //
create procedure anadirAdmin(in iadminID varchar(8),in inombreI varchar(50), in iubicacion varchar(70), in ihorario_Turno datetime, 
in icorreo varchar(70), in inombreA varchar(20))
begin
INSERT INTO Adminn (adminID, nombreI, ubicacion, horario_Turno, correo, nombreA) 
VALUES (iadminID, inombreI, iubicacion, ihorario_Turno, icorreo, inombreA);
end//
DELIMITER ;

call anadirAdmin('ADM00022','Asuka High School','Feliz Jueves Street','2012-06-18 10:34:09', 'laasukabestow@huevomundo.edu.ec','Admin 21');

/*Cambia el horario de trabajo*/
drop procedure if exists cambiarAdminHorario;
DELIMITER //
create procedure cambiarAdminHorario(in iadminID varchar(8), in ihorario_Turno datetime)
begin
update Adminn set horario_Turno= ihorario_Turno where adminID= iadminID;
end//
DELIMITER ;
call cambiarAdminHorario('ADM00022', '2020-08-04 15:30:00');

/*Se borra al admin*/
drop procedure if exists borrarAdmin;
DELIMITER //
create procedure borrarAdmin(in iadminID varchar(8))
begin
delete from Adminn where adminID= iadminID;
end//
DELIMITER ;
call borrarAdmin('ADM00022');

/*Estudiantes*/
/*Se ingresa un nuevo estudiante*/
drop procedure if exists anadirEstudiante;
DELIMITER //
create procedure anadirEstudiante(in iestudianteID varchar(8),in inombreI varchar(50),in iubicacion varchar(70),
in iadminID varchar(8),in inombreE varchar(50))
begin
insert into Estudiantes (estudianteID,nombreI,ubicacion,adminID, nombreE) 
values (iestudianteID, inombreI, iubicacion, iadminID, inombreE);
end//
DELIMITER ;
call anadirEstudiante('EST00022','Asuka High School','Feliz Jueves Street','ADM00002','El Bic Rolando');


/*Cambia el admin asignado a este estudiante*/
drop procedure if exists cambiarEstudianteAdmin;
DELIMITER //
create procedure cambiarEstudianteAdmin(in iestudianteID varchar(8),in iadminID varchar(8))
begin
update Estudiantes set adminID= iadminID where estudianteID= iestudianteID;
end//
DELIMITER ;
call cambiarEstudianteAdmin('EST00022','ADM00005');

/*Se borra un estudiante*/
drop procedure if exists borrarEstudiante;
DELIMITER //
create procedure borrarEstudiante(in iestudianteID varchar(8))
begin
delete from Estudiantes where estudianteID= iestudianteID;
end//
DELIMITER ;
call borrarEstudiante('EST00022');

/*Institucion*/
/*Se ingresa un nuevo instituto*/
drop procedure if exists anadirInstitucion;
DELIMITER //
create procedure anadirInstitucion(in inombreI varchar(50),in iubicacion varchar(70),
in itipo_Institucion varchar(10))
begin
insert into Institucion (nombreI,ubicacion,tipo_Institucion)
values (inombreI, iubicacion, itipo_Institucion);
end//
DELIMITER ;
call anadirInstitucion('Combat Academy','Sao Paulo', 'Col');

/*Cambia el tipo de institucion*/
drop procedure if exists cambiarInstitucionTipo;
DELIMITER //
create procedure cambiarInstitucionTipo(in inombreI varchar(50),in iubicacion varchar(70),
in itipo_Institucion varchar(10))
begin
update Institucion set tipo_Institucion= itipo_Institucion where nombreI= inombreI and ubicacion=iubicacion;
end//
DELIMITER ;
call cambiarInstitucionTipo('Combat Academy','Sao Paulo','Uni');

/*se borra el instituto*/
drop procedure if exists borrarInstitucion;
DELIMITER //
create procedure borrarInstitucion(in inombreI varchar(50),in iubicacion varchar(70))
begin
delete from Institucion where nombreI= inombreI and ubicacion=iubicacion;
end//
DELIMITER ;
call MostrarDatosInstitucion('Combat Academy','Sao Paulo');

/*Muestra los datos de la institucion*/
drop procedure if exists MostrarDatosInstitucion;
DELIMITER //
create procedure MostrarDatosInstitucion(in inombreI varchar(50),in iubicacion varchar(70))
begin
Select * from Institucion where nombreI= inombreI and ubicacion=iubicacion;
end//
DELIMITER ;
call borrarInstitucion('Combat Academy','Sao Paulo');

/*Profesores*/
/*Se ingresa un nuevo profesor*/
drop procedure if exists anadirProfesor;
DELIMITER //
create procedure anadirProfesor(in iprofesorID varchar(8),in inombreI varchar(50),in iubicacion varchar(70),
in iadminID varchar(8),in inombreP varchar(50))
begin
insert into Profesores (profesorID ,nombreI,ubicacion,adminID, nombreP) 
values (iprofesorID , inombreI, iubicacion, iadminID, inombreP);
end//
DELIMITER ;
call anadirProfesor('PRF00021','Asuka High School','Feliz Jueves Street','ADM00002','Grav el Grave');


/*Cambia el admin asignado de este profesor*/
drop procedure if exists cambiarProfesorAdmin;
DELIMITER //
create procedure cambiarProfesorAdmin(in iprofesorID varchar(8),in iadminID varchar(8))
begin
update Profesores set adminID= iadminID where profesorID= iprofesorID;
end//
DELIMITER ;

call cambiarProfesorAdmin('PRF00021','ADM00004');

/*Elimina a un profesor*/
drop procedure if exists borrarProfesor;
DELIMITER //
create procedure borrarProfesor(in iprofesorID varchar(8))
begin
delete from Profesores where profesorID = iprofesorID;
end//
DELIMITER ;
call borrarProfesor('PRF00021');




/*Curso*/
/*anade profesores al curso*/
drop procedure if exists anadirCurso;
DELIMITER //
create procedure anadirCurso(in icursoID varchar(8), in iprofesorID varchar(8),in inombreI varchar(50),in iubicacion varchar(70),
in ihoras_semanales time ,in imateria varchar(20))
begin
insert into Curso (cursoID, profesorID, nombreI, ubicacion, horas_semanales, materia)
values(icursoID, iprofesorID, inombreI, iubicacion, ihoras_semanales, imateria);
end//
DELIMITER ;
call anadirCurso('CUR00021', 'PRF00014','MÃ¡ximo Maximo','Patico Street','04:00:00','Educacion sexual');

/* Update de curso, y proceso Cambiar Profesor,  cambia el profesor del curso*/
drop procedure if exists CambiarProfesorDeCurso;
DELIMITER //
create procedure CambiarProfesorDeCurso(in icursoID varchar(8),in iprofesorID varchar(8))
begin
update Curso set profesorID= iprofesorID where cursoID= icursoID;
end//
DELIMITER ;
call CambiarProfesorDeCurso('CUR00021','PRF00015');

/*Borra un curso*/
drop procedure if exists borrarCurso;
DELIMITER //
create procedure borrarCurso(in icursoID varchar(8))
begin
delete from Curso where cursoID = icursoID;
end//
DELIMITER ;
call borrarCurso('CUR00021');


/*Actividades*/
/*Al insertar actividades se pone por defecto la duracion como 0, si son lecciones o controles de lectura se 
aniade duracion despues de la insercion. Este procedimiento no inserta duracion, la deja como null por defecto*/
/*Anadir nueva tarea y add actividad son el mismo procedimiento*/
drop procedure if exists anadirNuevaTarea;
DELIMITER //
create procedure anadirNuevaTarea(in iactividadID varchar(8),in iprofesorID varchar(8),in icursoID varchar(8),
in ifecha_Entrega datetime,in idescripcion varchar(100))
begin
insert into Actividades (actividadID,profesorID,cursoID,fecha_Entrega,descripcion)
values (iactividadID,iprofesorID,icursoID,ifecha_Entrega,idescripcion);
end//
DELIMITER ;
call anadirNuevaTarea('AC000021','PRF00014','CUR00016','2021-08-21 12:00:00','Control de Lectura 1 (Estudiar Grafos)');

/* cambia la duracion de la actividad*/
drop procedure if exists CambiarActividadDuracion;
DELIMITER //
create procedure CambiarActividadDuracion(in iactividadID varchar(8),in iduracion_Actividad time)
begin
update Actividades set duracion_Actividad= iduracion_Actividad where actividadID= iactividadID;
end//
DELIMITER ;
call CambiarActividadDuracion('AC000021','01:00:00');
/* Elimina la actividad*/
drop procedure if exists borrarActividad;
DELIMITER //
create procedure borrarActividad(in iactividadID varchar(8))
begin
delete from Actividades where actividadID= iactividadID;
end//
DELIMITER ;

call borrarActividad('AC000021');




/*Pertenecer*/
/*Anade un nuevo Pertenecer*/
drop procedure if exists anadirPertenecer;
DELIMITER //
create procedure anadirPertenecer(in iestudianteID varchar(8), in icursoID varchar(8), ihorario datetime)
begin
insert into Pertenecer (estudianteID, cursoID, horario)
values(iestudianteID,icursoID,ihorario);
end//
DELIMITER ;
call anadirPertenecer('EST00006', 'CUR00011', '2021-08-21 12:00:00');


/*Asigna el horario del curso a todos los estudiantes que pertenezcan a ese curso*/
drop procedure if exists CambiarPertenecerHorario;
DELIMITER //
create procedure CambiarPertenecerHorario(in icursoID varchar(8), ihorario datetime)
begin
update Pertenecer set horario = ihorario where cursoID=icursoID;
end//
DELIMITER ;
caLL CambiarPertenecerHorario('CUR00011', '2021-08-21 11:00:00');

/*Delete pertenecer y Salirse de curso, elimina al estudiante del curso */
drop procedure if exists SalirseDeCurso;
DELIMITER //
create procedure SalirseDeCurso(in iestudianteID varchar(8), in icursoID varchar(8))
begin
delete from Pertenecer where estudianteID= iestudianteID and cursoID=icursoID;
end//
DELIMITER ;
call SalirseDeCurso('EST00006', 'CUR00011');

/*Trabajos*/
/*Anade un nuevo trabajo*/
drop procedure if exists anadirTrabajo;
DELIMITER //
create procedure anadirTrabajo(in iestudianteID varchar(8), in icursoID varchar(8), iactividadID varchar(8))
begin
insert into Trabajos (estudianteID, cursoID, actividadID, estado)
values(iestudianteID, icursoID, iactividadID, 0);
end//
DELIMITER ;
call anadirTrabajo("EST00012","CUR00030","AC000030");
/*Update trabajos y proceso finalizar tarea, marca la tarea como finalizada*/
drop procedure if exists FinalizarTarea;
DELIMITER //
create procedure FinalizarTarea(in iestudianteID varchar(8), in icursoID varchar(8), iactividadID varchar(8))
begin
update Trabajos set estado = 1 where estudianteID=iestudianteID and cursoID=icursoID and actividadID=iactividadID;
end//
DELIMITER ;
call FinalizarTarea ("EST00012","CUR00030","AC000030");
/*Borra todos los los trabajos con esa actividad*/
drop procedure if exists borrarTrabajo;
DELIMITER //
create procedure borrarTrabajo(in iactividadID varchar(8))
begin
delete from Trabajos where actividadID= iactividadID;
end//
DELIMITER ;
call borrarTrabajo("AC000030");

/*Procedimientos con views*/
/*Muestra las tareas que no estan terminadas por estudiante*/
drop procedure if exists mostrarTareasPendientes;
DELIMITER //
create procedure mostrarTareasPendientes(in iestudianteID varchar(8))
begin
select descripcion,fecha_Entrega  from TrabajosPendientes where estudianteID=iestudianteID;
end//
DELIMITER ;
call mostrarTareasPendientes('EST00011');

/*Admins trabajando muestra a los admins disponibles a estas horas*/
drop procedure if exists mostrarAdminsTrabajando;
DELIMITER //
create procedure mostrarAdminsTrabajando()
begin
select nombreA, correo from AdminQueTrabajanHoy where time(horario_Turno)>= time(now()) and time(horario_Turno)<time(date_add(now(), interval 5 hour));
end//
DELIMITER ;
call mostrarAdminsTrabajando();

/*Consultar datos de profesor por ID*/
drop procedure if exists verDatosProfesor;
DELIMITER //
create procedure verDatosProfesor(in iprofesorID varchar(8))
begin
select nombreP, cursoID from vistaDatosProfesor where profesorID=iprofesorID;
end//
DELIMITER ;
call verDatosProfesor('PRF00001');

/*Consultar datos del estudiante por ID*/
drop procedure if exists verDatosEstudiante;
DELIMITER //
create procedure verDatosEstudiante(in iestudianteID varchar(8))
begin
select nombreE, cursoID from vistaDatosEstudiante where estudianteID=iestudianteID;
end//
DELIMITER ;
call verDatosEstudiante('EST00011');

/*Consultar horario del profesor por ID*/
drop procedure if exists verHorarioEstudiante;
DELIMITER //
create procedure verHorarioEstudiante(in iestudianteID varchar(8))
begin
select weekday(horas_semanales) as dia, time(horas_semanales) as hora from vistaHorarioEstudiante where estudianteID=iestudianteID;
end//
DELIMITER ;
call verHorarioEstudiante('EST00011');

/*Consultar horario del profesor por ID*/
drop procedure if exists verHorarioProfesor;
DELIMITER //
create procedure verHorarioProfesor(in iprofesorID varchar(8))
begin
select weekday(horas_semanales) as dia, time(horas_semanales) as hora from vistaHorarioProfesor where profesorID=iprofesorID;
end//
DELIMITER ;
call verHorarioProfesor('PRF00001');
/*Mostrar los estudiantes de un curso*/
drop procedure if exists verEstudiantesPorCurso;
DELIMITER //
create procedure verEstudiantesPorCurso(in icursoID varchar(8))
begin
select nombreE from vistaEstudiantesPorCurso where cursoID=icursoID;
end//
DELIMITER ;

call verEstudiantesPorCurso('CUR00001');
/*Mostrar la cantidad de estudiantes de un curso*/
drop procedure if exists verCantEstudiantesPorCurso;
DELIMITER //
create procedure verCantEstudiantesPorCurso(in icursoID varchar(8))
begin
select * from vistaCantEstudiantesPorCurso where cursoID=icursoID;
end//
DELIMITER ;

call verCantEstudiantesPorCurso('CUR00001');
/*Muestra los datos importantes de los admins*/
drop procedure if exists verDatosAdmin;
DELIMITER //
create procedure verDatosAdmin()
begin
select nombreA,horario_Turno,correo from Adminn;
end//
DELIMITER ;

call verDatosAdmin();