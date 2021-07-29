Select * From Actividades;
Select * From Adminn;
Select * From Curso;
Select * From Ensenar;
Select * From Estudiantes;
Select * From Institucion;
Select * From Pertenecer;
Select * From Profesores;
Select * From Trabajos;

Select actividadID From Actividades;
Select adminID From Adminn;
Select cursoID From Curso;
Select profesorID, estudianteID From Ensenar;
Select estudianteID From Estudiantes;
Select nombreI, ubicacion From Institucion;
Select estudianteID, cursoID From Pertenecer;
Select profesorID From Profesores;
Select estudianteID, cursoID, actividadID From Trabajos;

Select descripcion From Actividades Where descripcion like 'Avance%';
Select nombreA From Adminn WHere nombreA not like 'Ad%';
Select cursoId, materia From Curso where profesorID like 'PRF00002';
Select nombreE From Estudiantes Where nombreE like'B%';
Select estudianteID From Ensenar where profesorID like 'PRF00002';
Select nombreI From Institucion where tipo_Institucion like 'uni';
Select estudianteID From Pertenecer where cursoID like 'CUR00003';
Select nombreP From Profesores where nombreI like 'HuevoMundo';
Select actividadID From Trabajos where estudianteID like 'EST00001';


/*Finalizar tarea*/
UPDATE Trabajos set estado = true WHERE estudianteID like 'EST00001';

/*Cambiar profesor*/
UPDATE Curso set profesorID="PRF00004" where profesorID like "PRF00005";

/*Eliminar Usuario*/
Delete From Profesores where profesorID = "PRF00005";

/*Consultar Datos*/
Select Estudiantes.nombreE, Curso.Materia, Curso.NombreI From Estudiantes, Curso, Pertenecer where Estudiantes.estudianteID = Pertenecer.estudianteID AND Curso.CursoId=Pertenecer.cursoID AND Estudiantes.estudianteID like "EST00001";

/*Salirse de Curso*/
Delete From Trabajos where estudianteID = "EST00003" AND cursoID = "CUR00001";
Delete From Pertenecer where estudianteID = "EST00003" AND cursoID = "CUR00001";