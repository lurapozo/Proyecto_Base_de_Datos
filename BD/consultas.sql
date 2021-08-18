create view vistaActividades as
Select * From Actividades;



create view vistaAdmin as
Select * From Adminn;
create view vistaCurso as
Select * From Curso;
create view vistaEnsenar as
Select * From Ensenar;
create view vistaEstudiantes as
Select * From Estudiantes;
create view vistaInstitucion as
Select * From Institucion;
create view vistaPertenecer as
Select * From Pertenecer;
create view vistaProfesores as
Select * From Profesores;
create view vistaTrabajos as
Select * From Trabajos;


create view vistaIDActividad as
Select actividadID From Actividades;
create view vistaIDAdmin as
Select adminID From Adminn;
create view vistaIDCurso as
Select cursoID From Curso;
create view vistaIDEnsenar as
Select profesorID, estudianteID From Ensenar;
create view vistaIDEstudiante as
Select estudianteID From Estudiantes;
create view vistaIDInstitucion as
Select nombreI, ubicacion From Institucion;
create view vistaIDPertenecer as
Select estudianteID, cursoID From Pertenecer;
create view vistaIDProfesores as
Select profesorID From Profesores;
create view vistaIDTrabajos as
Select estudianteID, cursoID, actividadID From Trabajos;

create view vistaIDActividadAvance as
Select descripcion From Actividades Where descripcion like 'Avance%';

create view vistaIDAdminAd as
Select nombreA From Adminn WHere nombreA not like 'Ad%';

create view vistaIDCursoDeProfesor2 as
Select cursoId, materia From Curso where profesorID like 'PRF00002';

create view vistaIDEstudianteB as
Select nombreE From Estudiantes Where nombreE like'B%';

create view vistaEstudiantesDeProfesor2 as
Select estudianteID From Ensenar where profesorID like 'PRF00002';


create view vistaUniversidades as
Select nombreI From Institucion where tipo_Institucion like 'uni';

create view vistaEstudiantesDeCurso3 as
Select estudianteID From Pertenecer where cursoID like 'CUR00003';

create view vistaProfesoresDeNuevomundo as
Select nombreP From Profesores where nombreI like 'HuevoMundo';

create view vistaTrabajosDeEstudiante1 as
Select actividadID From Trabajos where estudianteID like 'EST00001';


/*Finalizar tarea*/
UPDATE Trabajos set estado = true WHERE estudianteID like 'EST00001';

/*Cambiar profesor*/
UPDATE Curso set profesorID="PRF00004" where profesorID like "PRF00005";

/*Eliminar Usuario*/
Delete From Profesores where profesorID = "PRF00005";

/*Consultar Datos*/
create view datosEstudiante as
Select Estudiantes.nombreE, Curso.Materia, Curso.NombreI From Estudiantes, Curso, Pertenecer where Estudiantes.estudianteID = Pertenecer.estudianteID AND Curso.CursoId=Pertenecer.cursoID AND Estudiantes.estudianteID like "EST00001";

/*Salirse de Curso*/
Delete From Trabajos where estudianteID = "EST00003" AND cursoID = "CUR00001";
Delete From Pertenecer where estudianteID = "EST00003" AND cursoID = "CUR00001";