/*Triggers*/

/*Valida si el deber a sido entregado a tiempo*/
drop trigger if exists VerificarTareaEntregeda;
DELIMITER $$
CREATE TRIGGER VerificarTareaEntregeda 
BEFORE UPDATE ON Trabajos FOR EACH ROW BEGIN
set @fecha= (select fecha_Entrega from Actividades where actividadID=old.actividadID);
IF @fecha<now() then
signal sqlstate '45000' set message_text = "RP";
end if;
END$$
DELIMITER ;
show triggers;
/*valida que el deber no tenga fecha de entrega de dias pasados*/
drop trigger if exists validarHoraDeCreacionActividad;
DELIMITER $$
CREATE TRIGGER validarHoraDeCreacionActividad
BEFORE INSERT ON Actividades FOR EACH ROW BEGIN
/*select new.fecha_Entrega;
set @fecha= (select fecha_Entrega from Actividades where actividadID=new.actividadID);*/
IF (new.fecha_Entrega<now()) then
signal sqlstate '45000' set message_text = "No se pueden enviar tareas al pasado.";
end if;
END$$
DELIMITER ;

/*Elimina los trabajos que contengan el ID de la actividad eliminada*/
drop trigger if exists destruirActividad;
DELIMITER $$
CREATE TRIGGER destruirActividad
before DELETE ON Actividades
FOR EACH ROW
BEGIN
delete from trabajos where actividadID=old.actividadID;
END$$
DELIMITER ;
/*Elimina las actividades y pertenecer que contengan el ID del curso eliminado*/
drop trigger if exists destruirCurso;
DELIMITER $$
CREATE TRIGGER destruirCurso
before DELETE ON Curso
FOR EACH ROW
BEGIN
delete from Actividades where cursoID = old.cursoID;
Delete From Pertenecer where cursoID = old.cursoID;
END$$
DELIMITER ;

show triggers;