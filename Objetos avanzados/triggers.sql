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