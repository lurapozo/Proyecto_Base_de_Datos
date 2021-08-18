/*Muestra a los admins que trabajan hoy*/
create view AdminQueTrabajanHoy as
select nombreA, correo, horario_Turno from Adminn where weekday(horario_Turno) =weekday(now());

/*Muestra todos los trabajos pendientes*/
create view TrabajosPendientes as
select actividadID, estudianteID from Trabajos where estado is null ;



