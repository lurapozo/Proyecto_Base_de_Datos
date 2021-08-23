/*Muestra a los admins que trabajan hoy*/
create view AdminQueTrabajanHoy as
select nombreA, correo, horario_Turno from Adminn where weekday(horario_Turno) =weekday(now());

/*Muestra todos los trabajos pendientes*/
create view TrabajosPendientes as
select actividadID, estudianteID from Trabajos where estado is null ;

/*Consultar datos de profesor*/
create view vistaDatosProfesor as
select Profesores.profesorID, Profesores.nombreP, Profesores.nombreI, Curso.cursoID from Curso,Profesores 
where Profesores.profesorID=Curso.profesorID;

/*Consultar datos de estudiante*/
create view vistaDatosEstudiante as
select Estudiantes.estudianteID,Estudiantes.nombreE, Estudiantes.nombreI, Pertenecer.cursoID from Pertenecer,Estudiantes 
where Estudiantes.estudianteID=Pertenecer.estudianteID;

/*Consultar horario de estudiante*/
create view vistaHorarioEstudiante as
select Estudiantes.estudianteID,Curso.horas_semanales from Pertenecer,Estudiantes, Curso 
where Estudiantes.estudianteID=Pertenecer.estudianteID and Pertenecer.cursoID=Curso.cursoID;

/*Consultar horario de profesor*/

create view vistaHorarioProfesor as
select Profesores.profesorID, Curso.horas_semanales from Profesores, Curso 
where Profesores.profesorID=Curso.profesorID;

/*Consultar estudiantes por curso*/

create view vistaEstudiantesPorCurso as
select Estudiantes.nombreE,Curso.cursoID from Pertenecer,Estudiantes, Curso 
where Estudiantes.estudianteID=Pertenecer.estudianteID and Pertenecer.cursoID=Curso.cursoID;

/*Consultar cantidad de estudiantes por curso*/
create view vistaCantEstudiantesPorCurso as
select count(Estudiantes.estudianteID),Curso.cursoID from Pertenecer,Estudiantes, Curso 
where Estudiantes.estudianteID=Pertenecer.estudianteID and Pertenecer.cursoID=Curso.cursoID group by Curso.cursoID;


