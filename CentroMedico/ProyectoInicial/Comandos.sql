
insert into paciente (nombre,apellido,fNacimiento,domicilio) values ('federico','landriel','','lujan 978')
insert into paciente (nombre,apellido,fNacimiento,domicilio,idpais) values ('fede','nahuel','','lujan 978','arg')

select * from paciente where nombre='agustin' and domicilio='lujan 978'

UPDATE	paciente	SET domicilio= 'ayacucho 21' where idPaciente=2

delete from paciente where nombre='federico' and apellido='landriel' 

select * from paciente


select top 2 * from paciente where domicilio='lujan 978'

select top 2 * from turno order by fechaTurno DESC

select * from turno

select DISTINCT apellido from paciente -- es igual al group by, cambia la sintaxis solamente.

select apellido from paciente GROUP BY apellido

select nombre,MIN(idpaciente) from paciente group by nombre -- busca el min o el max
select * from paciente


select nombre, SUM(idpaciente) from paciente group by nombre -- hace una suma 

select AVG(idpaciente),nombre from paciente group by nombre --me da un promedio de un campo numerico

select COUNT(idpaciente) from paciente where nombre='agustin' -- es un contador

select estado from Turno group by estado HAVING COUNT (estado ) >= 2 --having es parecido al WHERE con la diferencia
-- de que el where va por registro a registro y el having por grupo asi q obligatoriamente hay que usar el group by
-- aca me muestra que registro de estado se repite 2 veces o mas

select * from Turno --Turno

select * from paciente where apellido in('landriel','perez') -- IN agrupa nombres o numeros 

select * from paciente where apellido NOT IN ('landriel') -- EL NOT CONTRADICE EL COMANDO

select * from paciente where apellido LIKE ('ati%')

select * from Turno where estado BETWEEN 1 AND 3 --BETWEEN SIGNIFICA ENTRE 


-------STORE PROCEDURE----------
EXEC SP_PACIENTE 7