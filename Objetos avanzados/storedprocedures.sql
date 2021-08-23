
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
/*Cambia el horario de trabajo*/
drop procedure if exists cambiarAdminHorario;
DELIMITER //
create procedure cambiarAdminHorario(in iadminID varchar(8), in ihorario_Turno datetime)
begin
update Adminn set horario_Turno= ihorario_Turno where adminID= iadminID;
end//
DELIMITER ;
/*Se borra al admin*/
drop procedure if exists borrarAdmin;
DELIMITER //
create procedure borrarAdmin(in iadminID varchar(8))
begin
delete from Adminn where adminID= iadminID;
end//
DELIMITER ;

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
/*Cambia el admin asignado a este estudiante*/
drop procedure if exists cambiarEstudianteAdmin;
DELIMITER //
create procedure cambiarEstudianteAdmin(in iestudianteID varchar(8),in iadminID varchar(8))
begin
update Estudiantes set adminID= iadminID where estudianteID= iestudianteID;
end//
DELIMITER ;
/*Se borra un estudiante*/
drop procedure if exists borrarEstudiante;
DELIMITER //
create procedure borrarEstudiante(in iestudianteID varchar(8))
begin
delete from Estudiantes where estudianteID= iestudianteID;
end//
DELIMITER ;



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
/*Cambia el tipo de institucion*/
drop procedure if exists cambiarInstitucionTipo;
DELIMITER //
create procedure cambiarInstitucionTipo(in inombreI varchar(50),in iubicacion varchar(70),
in itipo_Institucion varchar(10))
begin
update Institucion set tipo_Institucion= itipo_Institucion where nombreI= inombreI and ubicacion=iubicacion;
end//
DELIMITER ;
/*se borra el instituto*/
drop procedure if exists borrarInstitucion;
DELIMITER //
create procedure borrarInstitucion(in inombreI varchar(50),in iubicacion varchar(70))
begin
delete from Institucion where nombreI= inombreI and ubicacion=iubicacion;

end//
DELIMITER ;
/*Muestra los datos de la institucion*/
drop procedure if exists MostrarDatosInstitucion;
DELIMITER //
create procedure MostrarDatosInstitucion(in inombreI varchar(50),in iubicacion varchar(70))
begin
Select * from Institucion where nombreI= inombreI and ubicacion=iubicacion;

end//
DELIMITER ;


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
/*Cambia el admin asignado de este profesor*/
drop procedure if exists cambiarProfesorAdmin;
DELIMITER //
create procedure cambiarProfesorAdmin(in iprofesorID varchar(8),in iadminID varchar(8))
begin
update Profesores set adminID= iadminID where profesorID= iprofesorID;
end//
DELIMITER ;
/*Elimina a un profesor*/
drop procedure if exists borrarProfesor;
DELIMITER //
create procedure borrarProfesor(in iprofesorID varchar(8))
begin
delete from Profesores where profesorID = iprofesorID;
end//
DELIMITER ;





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
/* Update de curso, y proceso Cambiar Profesor,  cambia el profesor del curso*/
drop procedure if exists CambiarProfesorDeCurso;
DELIMITER //
create procedure CambiarProfesorDeCurso(in icursoID varchar(8),in iprofesorID varchar(8))
begin
update Curso set profesorID= iprofesorID where cursoID= icursoID;
end//
DELIMITER ;
/*Borra un curso*/
drop procedure if exists borrarCurso;
DELIMITER //
create procedure borrarCurso(in icursoID varchar(8))
begin
delete from Curso where cursoID = icursoID;
end//
DELIMITER ;





/*Ensenar*/
/*Ingresa una relacion de ensenanza*/
drop procedure if exists anadirEnsenar;
DELIMITER //
create procedure anadirEnsenar(in iprofesorID varchar(8), in iestudianteID varchar(8))
begin
insert into Ensenar(profesorID, estudianteID)
values (iprofesorID, iestudianteID);
end//
DELIMITER ;
/* No se puede realizar update ya que solo tiene primary keys*/

/*Borra la relacion de ensenar del profesor con el estudiante, esto se realiza
cuando el estudiante no se encuentra en ningun curso de ese profesor*/
drop procedure if exists borrarEnsenar;
DELIMITER //
create procedure borrarEnsenar(in iprofesorID varchar(8), in iestudianteID varchar(8))
begin
delete from Ensenar where profesorID = iprofesorID and estudianteID=iestudianteID;
end//
DELIMITER ;





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

/* cambia la duracion de la actividad*/
drop procedure if exists CambiarActividadDuracion;
DELIMITER //
create procedure CambiarActividadDuracion(in iactividadID varchar(8),in iduracion_Actividad time)
begin
update Actividades set duracion_Actividad= iduracion_Actividad where actividadID= iactividadID;
end//
DELIMITER ;
/* Elimina la actividad*/
drop procedure if exists borrarActividad;
DELIMITER //
create procedure borrarActividad(in iactividadID varchar(8))
begin
delete from Actividades where actividadID= iactividadID;
end//
DELIMITER ;





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
/*Asigna el horario del curso a todos los estudiantes que pertenezcan a ese curso*/
drop procedure if exists CambiarPertenecerHorario;
DELIMITER //
create procedure CambiarPertenecerHorario(in icursoID varchar(8), ihorario datetime)
begin
update Pertenecer set horario = ihorario where cursoID=icursoID;
end//
DELIMITER ;
/*Delete pertenecer y Salirse de curso, elimina al estudiante del curso */
drop procedure if exists SalirseDeCurso;
DELIMITER //
create procedure SalirseDeCurso(in iestudianteID varchar(8), in icursoID varchar(8))
begin
delete from Pertenecer where estudianteID= iestudianteID and cursoID=icursoID;
end//
DELIMITER ;





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
/*Update trabajos y proceso finalizar tarea, marca la tarea como finalizada*/
drop procedure if exists FinalizarTarea;
DELIMITER //
create procedure FinalizarTarea(in iestudianteID varchar(8), in icursoID varchar(8), iactividadID varchar(8))
begin
update Trabajos set estado = 1 where estudianteID=iestudianteID and cursoID=icursoID and actividadID=iactividadID;
end//
DELIMITER ;
/*Borra todos los los trabajos con esa actividad*/
drop procedure if exists borrarTrabajo;

DELIMITER //
create procedure borrarTrabajo(in iactividadID varchar(8))
begin
delete from Trabajos where actividadID= iactividadID;
end//
DELIMITER ;


/*Procedimientos con views*/
/*Muestra las tareas que no estan terminadas por estudiante*/
drop procedure if exists mostrarTareasPendientes;
DELIMITER //
create procedure mostrarTareasPendientes(in iestudianteID varchar(8))
begin
select * from TrabajosPendientes where estudianteID=iestudianteID;
end//
DELIMITER ;

/*Admins trabajando muestra a los admins disponibles a estas horas*/
drop procedure if exists mostrarAdminsTrabajando;
DELIMITER //
create procedure mostrarAdminsTrabajando()
begin
select nombreA, correo from AdminQueTrabajanHoy where time(horario_Turno)>= time(now()) and time(horario_Turno)<time(date_add(now(), interval 5 hour));
end//
DELIMITER ;