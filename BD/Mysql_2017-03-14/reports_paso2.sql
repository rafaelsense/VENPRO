-- --------------------------------------------------------
-- Host:                         svr0403
-- Versión del servidor:         5.6.20-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para reports
CREATE DATABASE IF NOT EXISTS `reports` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `reports`;


-- Volcando estructura para procedimiento reports.pm
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` PROCEDURE `pm`()
BEGIN
select fecha from tiempo;
END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.pru_2
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` PROCEDURE `pru_2`()
BEGIN
select 1;
END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_del_conectividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_conectividad`(IN `fechas_in` VARCHAR(250))
BEGIN

SET @snt=concat(" delete  from conectividad where fecha in (",fechas_in ,"); " );
  
  
prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_del_velocidad_diario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_velocidad_diario`(IN `fechas_in` VARCHAR(250))
BEGIN

SET @snt=concat(" delete  from velocidad_diario where fecha in (",fechas_in ,"); " );
  
  
prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_del_velocidad_semanal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_velocidad_semanal`(IN `fechas_in` VARCHAR(250))
BEGIN

SET @snt=concat(
    " delete from velocidad_semanal where  ",
    " ano=(    select distinct ano from  tiempo where tiempo.numsemana= ",
     " (select distinct numsemana from tiempo  ",
     " where Cast(tiempo.fecha as date)in(", fechas_in,")) and  ",
     " tiempo.ano= ",
     " (select distinct ano from tiempo ",
     " where Cast(tiempo.fecha as date)in(", fechas_in,"))) ",
 
     " and numsemana=(    select distinct numsemana from  tiempo where tiempo.numsemana= ",
     " (select distinct numsemana from tiempo  ",
     " where Cast(tiempo.fecha as date)in(", fechas_in,")) and  ",
     " tiempo.ano= ",
     " (select distinct ano from tiempo ",
  " where Cast(tiempo.fecha as date)in(", fechas_in,"))); "
  );
  
  
prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_export_conectividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_export_conectividad`(IN `tiposeleccion` VARCHAR(50), IN `valorini` VARCHAR(50), IN `valorfin` VARCHAR(50), IN `valorano_mes_sem` VARCHAR(50))
BEGIN
 
 CASE  tiposeleccion
   WHEN  'año'     
		THEN  
		(
		select c.fecha, c.ano, c.numsemestre, c.nummes, c.numsemana,
c.codtienda, t.nomtienda as tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador,
c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion,
c.horamarca, c.horamarcar, c.ratio, c.horaspos,c.horasbloqueo, c.horaefectivapos, c.bloqueos,
c.canttrx,  c.monto, c.conexion, ifnull(ctl.nomlabor,'') as labor,  
concat(c.codtienda,' - ', t.nomtienda ) as tiendas
from conectividad c inner join tienda t on t.codtienda=c.codtienda
 left join ctipolabor ctl on c.codtipolabor=ctl.codlabor
where  c.ano between valorini and valorfin order by fecha, codtienda asc
		);
   WHEN  'mes'     
		 THEN 
		 (
		 select c.fecha, c.ano, c.numsemestre, c.nummes, c.numsemana,
c.codtienda, t.nomtienda as tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador,
c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion,
c.horamarca, c.horamarcar, c.ratio, c.horaspos,c.horasbloqueo, c.horaefectivapos, c.bloqueos,
c.canttrx,  c.monto, c.conexion, ifnull(ctl.nomlabor,'') as labor,  
concat(c.codtienda,' - ', t.nomtienda ) as tiendas
from conectividad c inner join tienda t on t.codtienda=c.codtienda
 left join ctipolabor ctl on c.codtipolabor=ctl.codlabor
where  c.ano=valorano_mes_sem and c.nummes between valorini and valorfin order by fecha, codtienda asc
		 );
   WHEN  'semana'       
		THEN 
		( 
		select c.fecha, c.ano, c.numsemestre, c.nummes, c.numsemana,
c.codtienda, t.nomtienda as tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador,
c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion,
c.horamarca, c.horamarcar, c.ratio, c.horaspos,c.horasbloqueo, c.horaefectivapos, c.bloqueos,
c.canttrx,  c.monto, c.conexion, ifnull(ctl.nomlabor,'') as labor,  
concat(c.codtienda,' - ', t.nomtienda ) as tiendas
from conectividad c inner join tienda t on t.codtienda=c.codtienda
 left join ctipolabor ctl on c.codtipolabor=ctl.codlabor
where  c.ano=valorano_mes_sem and c.numsemana between valorini and valorfin order by fecha, codtienda asc
		);
   
	WHEN  'fecha'       
		THEN 
		(
		select c.fecha, c.ano, c.numsemestre, c.nummes, c.numsemana,
		c.codtienda, t.nomtienda as tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador,
		c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion,
		c.horamarca, c.horamarcar, c.ratio, c.horaspos,c.horasbloqueo, c.horaefectivapos, c.bloqueos,
		c.canttrx, c.monto, c.conexion, ifnull(ctl.nomlabor,'') as labor,  
		concat(c.codtienda,' - ', t.nomtienda ) as tiendas
		 from conectividad c inner join tienda t on t.codtienda=c.codtienda
		 left join ctipolabor ctl on c.codtipolabor=ctl.codlabor
		 where  c.fecha between valorini and valorfin order by fecha, codtienda asc	
		#where  c.fecha between concat("'",valorini,"'") and concat("'",valorfin,"'") order by fecha, codtienda asc	
		);
   ELSE  ( select 'No definido');
  END CASE;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_export_velocidad_semanal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_export_velocidad_semanal`(IN `tiposeleccion` VARCHAR(50), IN `valorini` VARCHAR(50), IN `valorfin` VARCHAR(50), IN `valorano_mes_sem` VARCHAR(50))
BEGIN
 
 CASE  tiposeleccion
   WHEN  'año'     
		THEN  
		(
		select 
vel.puestovelocidad, vel.ano, vel.numsemestre, vel.nummes,
 vel.numsemana, vel.semana, vel.semana_ano, vel.codtienda, 
 vel.tienda, vel.tiendas, vel.scannerbalanza, vel.formato,vel.codcajero,
 vel.cajero, vel.puesto, vel.tipocajero, vel.itemxmin, vel.trx,
   CASE  
   WHEN  vel.mespermanencia<3     THEN '3'
   WHEN  vel.mespermanencia>=3 and vel.mespermanencia<6      THEN '6'
   WHEN  vel.mespermanencia>=6 and vel.mespermanencia<9       THEN '9'
   WHEN  vel.mespermanencia>=9 and vel.mespermanencia<12       THEN '12'
   WHEN  vel.mespermanencia>=12 and vel.mespermanencia<24       THEN '24'
         ELSE '24+'
       END as permanencia,
       vel.rangovelocidad
from(
 select  if(v.top100>100,'',v.top100) as puestovelocidad , v.ano, v.numsemestre,
 v.nummes, v.numsemana, concat('Sem ', v.numsemana) as semana, concat(v.ano, ' - Sem ', v.numsemana) as semana_ano,
v.codtienda, t.nomtienda as tienda,concat(v.codtienda,' - ', t.nomtienda) as tiendas,
 v.scannerbalanza,t.formato, v.codcajero, v.cajero,pla.PUESTO as puesto,
if(pla.PLLA='EMP','FT',if(pla.PLLA='PRT','PT',pla.PLLA)) as tipocajero,
 v.itemxmin, v.trx,
  (DATEDIFF(DATE_FORMAT(v.fechaactualizacion,'%Y-%m-%d'),DATE_FORMAT(pla.FE_INGR,'%Y-%m-%d')))/30
 as mespermanencia,  v.rangovelocidad
 from velocidad_semanal v left join tienda t on v.codtienda=t.codtienda
left join planilla pla on v.codcajero=pla.CODIGO
where  v.ano between valorini and valorfin
)vel order by vel.ano,vel.numsemana,vel.itemxmin desc
		);
   WHEN  'mes'     
		 THEN 
		 (
		 select 
vel.puestovelocidad, vel.ano, vel.numsemestre, vel.nummes,
 vel.numsemana, vel.semana, vel.semana_ano, vel.codtienda, 
 vel.tienda, vel.tiendas, vel.scannerbalanza, vel.formato,vel.codcajero,
 vel.cajero, vel.puesto, vel.tipocajero, vel.itemxmin, vel.trx,
   CASE  
   WHEN  vel.mespermanencia<3     THEN '3'
   WHEN  vel.mespermanencia>=3 and vel.mespermanencia<6      THEN '6'
   WHEN  vel.mespermanencia>=6 and vel.mespermanencia<9       THEN '9'
   WHEN  vel.mespermanencia>=9 and vel.mespermanencia<12       THEN '12'
   WHEN  vel.mespermanencia>=12 and vel.mespermanencia<24       THEN '24'
         ELSE '24+'
       END as permanencia,
       vel.rangovelocidad
from(
 select  if(v.top100>100,'',v.top100) as puestovelocidad , v.ano, v.numsemestre,
 v.nummes, v.numsemana, concat('Sem ', v.numsemana) as semana, concat(v.ano, ' - Sem ', v.numsemana) as semana_ano,
v.codtienda, t.nomtienda as tienda,concat(v.codtienda,' - ', t.nomtienda) as tiendas,
 v.scannerbalanza,t.formato, v.codcajero, v.cajero,pla.PUESTO as puesto,
if(pla.PLLA='EMP','FT',if(pla.PLLA='PRT','PT',pla.PLLA)) as tipocajero,
 v.itemxmin, v.trx,
  (DATEDIFF(DATE_FORMAT(v.fechaactualizacion,'%Y-%m-%d'),DATE_FORMAT(pla.FE_INGR,'%Y-%m-%d')))/30
 as mespermanencia,  v.rangovelocidad
 from velocidad_semanal v left join tienda t on v.codtienda=t.codtienda
left join planilla pla on v.codcajero=pla.CODIGO
where  v.ano=valorano_mes_sem and v.nummes between valorini and valorfin
)vel order by vel.ano,vel.numsemana,vel.itemxmin desc
		  );
   WHEN  'semana'       
		THEN 
		(
		select 
vel.puestovelocidad, vel.ano, vel.numsemestre, vel.nummes,
 vel.numsemana, vel.semana, vel.semana_ano, vel.codtienda, 
 vel.tienda, vel.tiendas, vel.scannerbalanza, vel.formato, vel.codcajero,
 vel.cajero, vel.puesto, vel.tipocajero, vel.itemxmin, vel.trx,
   CASE  
   WHEN  vel.mespermanencia<3     THEN '3'
   WHEN  vel.mespermanencia>=3 and vel.mespermanencia<6      THEN '6'
   WHEN  vel.mespermanencia>=6 and vel.mespermanencia<9       THEN '9'
   WHEN  vel.mespermanencia>=9 and vel.mespermanencia<12       THEN '12'
   WHEN  vel.mespermanencia>=12 and vel.mespermanencia<24       THEN '24'
         ELSE '24+'
       END as permanencia,
       vel.rangovelocidad, vel.semanadel
from(
 select  if(v.top100>100,'',v.top100) as puestovelocidad , v.ano, v.numsemestre,
 v.nummes, v.numsemana, concat('Sem ', v.numsemana) as semana, concat(v.ano, ' - Sem ', v.numsemana) as semana_ano,
v.codtienda, t.nomtienda as tienda,concat(v.codtienda,' - ', t.nomtienda) as tiendas,
 v.scannerbalanza,t.formato, v.codcajero, v.cajero,pla.PUESTO as puesto,
if(pla.PLLA='EMP','FT',if(pla.PLLA='PRT','PT',pla.PLLA)) as tipocajero,
 v.itemxmin, v.trx,
  (DATEDIFF(DATE_FORMAT(v.fechaactualizacion,'%Y-%m-%d'),DATE_FORMAT(pla.FE_INGR,'%Y-%m-%d')))/30
 as mespermanencia,  v.rangovelocidad, 
 (
select distinct
if(val1.numsemana=val2.numsemana,
concat( 'Semana ', val1.numsemana, ' del ',date_format(val1.fecha,'%d %b'), ' al ',date_format(val2.fecha,'%d %b'), ' del ', date_format(val1.fecha,'%Y') )
,
concat( 'Semana ', val1.numsemana, ' - ',date_format(val1.fecha,'%d %b'), ' del ', date_format(val1.fecha,'%Y'),
' a la Semana ', val2.numsemana, ' - ',date_format(val2.fecha,'%d %b'), ' del ', date_format(val2.fecha,'%Y') )
) as semanadel
from												  
(
 select date_format(fecha,'%Y-%m-%d') as fecha,	
numsemana, nummes,numsemestre,ano 
from  tiempo where numsemana between valorini and valorfin and 
ano=valorano_mes_sem
order by fecha  asc limit 1
)val1,
(
 select date_format(fecha,'%Y-%m-%d') as fecha,	
numsemana, nummes,numsemestre,ano 
from  tiempo where numsemana between valorini and valorfin and 
ano=valorano_mes_sem
order by fecha  desc limit 1
) val2 limit 1

 ) as semanadel
 
 from velocidad_semanal v left join tienda t on v.codtienda=t.codtienda
left join planilla pla on v.codcajero=pla.CODIGO
where  v.ano=valorano_mes_sem and v.numsemana between valorini and valorfin
)vel order by vel.ano,vel.numsemana,vel.itemxmin desc
		);
   WHEN  'fecha'       
		THEN ( select 'No se admite Fecha');
   ELSE  ( select 'No definido');
  END CASE;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_conectividad
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_conectividad`(IN `fechas_in` TEXT)
BEGIN

SET @snt=concat(    
#Insertar Registro conectividad---
"INSERT INTO conectividad (  ",
 " 	fecha, ",
"	ano, ",
"	numsemestre, ",
"	nummes, ",
"	numsemana, ",
"	codtienda, ",
"	tienda, ",
"	tipocajero, ",
"	seccion, ",
"	cargo, ",
"	codtrabajador, ",
"	trabajador, ",
"	inicioteorico, ",
"	finteorico, ",
"	inicioreal, ",
"	finreal, ",
"	tipomarcacion, ",
"	destipomarcacion, ",
"	horamarca, ",
"	horamarcar, ",
"	ratio, ",
"	horaspos, ",
"	horasbloqueo, ",
"	horaefectivapos, ",
"	bloqueos, ",
"	canttrx, ",
"	monto, ",
"	conexion, ",
"	codtipolabor ",
 " ) ",
  #---
  
" select con.*,  ",
" if(con.ratio<1 && con.horaefectivapos>0,'SI','NO') as conexion, ",
#Si cumple que tiene coneccion en caja y el ratio figura menor  100% tiene conectividad.
" ca.codtipolabor as codtipolabor ",
" from( ",
" select c.fecha,t.ano, t.numsemestre, t.nummes, t.numsemana,  ",
" c.codtienda, c.tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador, ",
" c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion, ",
" c.horasmarca, ",
" ROUND(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca),3) as horasmarcaR, ",
" ifnull( ROUND(if(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca)=0,0 ",
" ,c.horaefectivapos/(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca)) ",
" ),3),0) as ratio, ",
" ifnull(c.horaspos,0) as horaspos, ifnull(c.horasbloqueo,0) as horasbloqueo, ",
" ifnull(c.horaefectivapos,0) as horaefectivapos, ",
" ifnull(c.bloqueos,0) as bloqueos, ifnull(c.canttrx,0) as canttrx, ifnull(c.monto,0) as monto ",

" from tiempo t, ",
" (select cm.fecha,cm.codtienda, cm.tienda, ",
" if(cm.planilla='EMP','FT',if(cm.planilla='PRT','PT',cm.planilla)) as tipocajero,  ",
" cm.seccion,cm.cargo,cm.codtrabajador, cm.trabajador, cm.inicioteorico,cm.finteorico, ",
" cm.inicioreal,cm.finreal,cm.tipomarcacion,cm.destipomarcacion, ",
#Si horamarca es menor igual a cero ce considera valor cero.
" if( ",
" (TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%k') + ",
"  ROUND((TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%i'))/60,3) ",
"  )<=0,0, ",
"  (TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%k') + ",
"  ROUND((TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%i'))/60,3) ",
"  ) ",
"  ) as horasmarca, ",
" cp.horaspos,cp.horasbloqueo, cp.horaefectivapos, cp.bloqueos, cv.canttrx, cv.monto ",
"  from cmarcas cm left  join (select * from cresumenpos where cresumenpos.fecha in (",fechas_in ,")) cp ",
" on cm.fecha=cp.fecha and cm.codtrabajador=cp.codcajero ",
#and cm.codtienda=cp.codtienda -- No se considera tienda, porq un cajero puede pertenecer a una tienda, pero hizo caja en otra.
" left join (select * from cventapos where cventapos.fecha in (",fechas_in ,")) cv ",
" on cm.fecha=cv.fecha and cp.fecha=cv.fecha and cm.codtrabajador=cv.codcajero and cp.codcajero=cv.codcajero ",
" where  cm.fecha in (",fechas_in ,") ",
#and cm.codtienda=cv.codtienda -- No se considera tienda, porq un cajero puede pertenecer a una tienda, pero hizo caja en otra.
" )c where c.fecha=t.fecha ",
" )con left join capoyo ca on con.ano=ca.ano and con.nummes=ca.nummes and con.codtrabajador=ca.codtrabajador; "	 
	 );

prepare sent from @snt;
execute sent;
deallocate prepare sent;


END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_conectividad_between
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_conectividad_between`(IN `fechaini` DATE, IN `fechafin` DATE)
BEGIN

delete  from conectividad where fecha between fechaini and fechafin;
#Insertar Registro conectividad---
INSERT INTO conectividad ( 
  	fecha,
	ano,
	numsemestre,
	nummes,
	numsemana,
	codtienda,
	tienda,
	tipocajero,
	seccion,
	cargo,
	codtrabajador,
	trabajador,
	inicioteorico,
	finteorico,
	inicioreal,
	finreal,
	tipomarcacion,
	destipomarcacion,
	horamarca,
	horamarcar,
	ratio,
	horaspos,
	horasbloqueo,
	horaefectivapos,
	bloqueos,
	canttrx,
	monto,
	conexion,
	codtipolabor
  )
  #---
  
select con.*, 
if(con.ratio<1 && con.horaefectivapos>0,'SI','NO') as conexion,
#Si cumple que tiene coneccion en caja y el ratio figura menor  100% tiene conectividad.
ca.codtipolabor as codtipolabor
from(
select c.fecha,t.ano, t.numsemestre, t.nummes, t.numsemana, 
c.codtienda, c.tienda, c.tipocajero, c.seccion, c.cargo, c.codtrabajador, c.trabajador,
c.inicioteorico, c.finteorico, c.inicioreal, c.finreal, c.tipomarcacion, c.destipomarcacion,
c.horasmarca,
ROUND(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca),3) as horasmarcaR,
ifnull( ROUND(if(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca)=0,0
,c.horaefectivapos/(if(c.horasmarca>=7,c.horasmarca-1,c.horasmarca))
),3),0) as ratio,
ifnull(c.horaspos,0) as horaspos, ifnull(c.horasbloqueo,0) as horasbloqueo,
 ifnull(c.horaefectivapos,0) as horaefectivapos,
ifnull(c.bloqueos,0) as bloqueos, ifnull(c.canttrx,0) as canttrx, ifnull(c.monto,0) as monto

from tiempo t,
(select cm.fecha,cm.codtienda, cm.tienda, 
if(cm.planilla='EMP','FT',if(cm.planilla='PRT','PT',cm.planilla)) as tipocajero, 
cm.seccion,cm.cargo,cm.codtrabajador, cm.trabajador, cm.inicioteorico,cm.finteorico,
cm.inicioreal,cm.finreal,cm.tipomarcacion,cm.destipomarcacion,
#Si horamarca es menor igual a cero ce considera valor cero.
if(
 (TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%k') +
 ROUND((TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%i'))/60,3)
 )<=0,0,
 (TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%k') +
 ROUND((TIME_FORMAT(TIMEDIFF(TIME_FORMAT(cm.finreal,'%k:%i:%00'),TIME_FORMAT(cm.inicioreal,'%k:%i:%00')),'%i'))/60,3)
 )
 ) as horasmarca,
 cp.horaspos,cp.horasbloqueo, cp.horaefectivapos, cp.bloqueos, cv.canttrx, cv.monto
 from cmarcas cm left  join (select * from cresumenpos where cresumenpos.fecha between fechaini and fechafin) cp
on cm.fecha=cp.fecha and cm.codtrabajador=cp.codcajero
#and cm.codtienda=cp.codtienda -- No se considera tienda, porq un cajero puede pertenecer a una tienda, pero hizo caja en otra.
 left join (select * from cventapos where cventapos.fecha between fechaini and fechafin) cv
on cm.fecha=cv.fecha and cp.fecha=cv.fecha and cm.codtrabajador=cv.codcajero and cp.codcajero=cv.codcajero
 where  cm.fecha between fechaini and fechafin
#and cm.codtienda=cv.codtienda -- No se considera tienda, porq un cajero puede pertenecer a una tienda, pero hizo caja en otra.
)c where c.fecha=t.fecha
)con left join capoyo ca on con.ano=ca.ano and con.nummes=ca.nummes and con.codtrabajador=ca.codtrabajador;


END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_digitadofiltros
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.130` PROCEDURE `sp_ins_digitadofiltros`()
BEGIN
SET @snt_del=concat(
#Eliminar Registro---
  " delete from digitado_filtros_semanal  where exists ",
  " (select ano,numsemana from tiempo t where ",
  " t.ano=digitado_filtros_semanal.ano and t.numsemana=digitado_filtros_semanal.numsemana ",
 " and t.fecha in (", fechas_in ,")); "
);

prepare sent from @snt_del;
execute sent;
deallocate prepare sent;

SET @snt=concat( 
#Insertar Registro digitados_semanal---
" INSERT INTO digitado_filtros_semanal (  ",
"	ano, ",
"	numsemestre, ",
"	nummes, ",
"	numsemana, ",
"	codtienda, ",
"	nomtienda, ",
"	codcajero, ",
"	cajero, ",
"	coddivision, ",
"	division, ",
"	coddepart, ",
"	depart, ",
"	codsubdep, ",
"	subdep, ",
"	sku, ",
"	skudescrip, ",
"	pos, ",
"	cantproduc, ",
"	fechaactualizacion ",
"  )  ",
  #---
  
" select t.ano, t.numsemestre,t.nummes, t.numsemana, dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
"  dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep, sku,  ",
" skudescrip, pos, sum(dig.cantproduc) as cantproduc, ",
"  curdate() as fechaactualizacion ",
" from( ",
" select d.* from digitado_diario d  ",
" where not exists ( select * from digitado_excluidos de ",
" where d.codtienda=de.codtienda and d.sku=de.sku) and digitado=1 and fecha in (", fechas_in ,") ",
" and codtienda in (", tiendas_in ,") ",
" )dig,tiempo t where dig.fecha=t.fecha ",
" Group by dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
" dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep,  ",
" sku, skudescrip, pos ",
" Order by dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
" dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep, ",
"  sku, skudescrip, pos; "
);

prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_digitado_semanal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_digitado_semanal`(IN `tiendas_in` VARCHAR(250), IN `fechas_in` VARCHAR(250))
BEGIN
SET @snt_del=concat(
#Eliminar Registro---
  " delete from digitado_semanal  where exists ",
  " (select ano,numsemana from tiempo t where ",
  " t.ano=digitado_semanal.ano and t.numsemana=digitado_semanal.numsemana ",
 " and t.fecha in (", fechas_in ,")); "
);

prepare sent from @snt_del;
execute sent;
deallocate prepare sent;

SET @snt=concat( 
#Insertar Registro digitados_semanal---
" INSERT INTO digitado_semanal (  ",
"	ano, ",
"	numsemestre, ",
"	nummes, ",
"	numsemana, ",
"	codtienda, ",
"	nomtienda, ",
"	codcajero, ",
"	cajero, ",
"	coddivision, ",
"	division, ",
"	coddepart, ",
"	depart, ",
"	codsubdep, ",
"	subdep, ",
"	sku, ",
"	skudescrip, ",
"	pos, ",
"	cantproduc, ",
"	fechaactualizacion ",
"  )  ",
  #---
  
" select t.ano, t.numsemestre,t.nummes, t.numsemana, dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
"  dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep, sku,  ",
" skudescrip, pos, sum(dig.cantproduc) as cantproduc, ",
"  curdate() as fechaactualizacion ",
" from( ",
" select d.* from digitado_diario d  ",
" where not exists ( select * from digitado_excluidos de ",
" where d.codtienda=de.codtienda and d.sku=de.sku) and digitado=1 and fecha in (", fechas_in ,") ",
" and codtienda in (", tiendas_in ,") ",
" )dig,tiempo t where dig.fecha=t.fecha ",
" Group by dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
" dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep,  ",
" sku, skudescrip, pos ",
" Order by dig.codtienda,dig.nomtienda, dig.codcajero, dig.cajero, ",
" dig.coddivision, dig.division, dig.coddepart, dig.depart, dig.codsubdep, dig.subdep, ",
"  sku, skudescrip, pos; "
);

prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_velocidad_diario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_velocidad_diario`(IN `tiendas_in` VARCHAR(250), IN `fechas_in` VARCHAR(250))
BEGIN
   
SET @snt=concat( 
  #Insertar Velocidad_diario---
"    insert into velocidad_diario " ,
"  (top100,  " ,
"  fecha,  " ,
"  ano,  " ,
"  numsemestre,  " ,
 " nummes,  " ,
"  numsemana,  " ,
"  codtienda,  " ,
"  scannerbalanza,  " ,
"  codcajero,  " ,
"  cajero,  " ,
"  itemxmin,  " ,
"  trx,  " ,
"  rangovelocidad,  " ,
"  mespermanencia, ",
"  permanencia, ",
 " fechaactualizacion)    " ,
  
" select b.rownum, b.fecha, b.ano, b.numsemestre, b.nummes, b.numsemana, " ,
" b.codtienda, b.scanner, b.codcajero,b.cajero, b.itemxmin, b.trx_terminal, b.rangovelocidad, " ,
" b.mespermanencia, b.permanencia, b.fechaactualizacion  " ,
  " from ( " ,
 " select if(@filaindex=fecha,@rownumtmp:=@rownumtmp+1,@rownumtmp:=1) as rownum, " ,
"  @filaindex:=a.fecha AS filaindex, " ,
"   a.fecha, a.ano, a.numsemestre, a.nummes, a.numsemana, " ,
"  a.codtienda, a.scanner, a.codcajero, a.colaborador as cajero ,ROUND(itemxmin, 4) as itemxmin ,trx_terminal,rangovelocidad, " , 
"  ROUND(mespermanencia, 4) as mespermanencia, permanencia, fechaactualizacion " ,
 " from (SELECT @rownumtmp:=1) r, (SELECT @filaindex:='1890-01-01') f, ( " ,
" select fecha, ano, numsemestre, nummes, numsemana,  " ,
" tienda.codtienda, tienda.scanner, codcajero,pla.colaborador,itemxmin,trx_terminal,   " ,
"   CASE   " ,
"   WHEN  itemxmin<10     THEN '0-10'  " , 
"   WHEN  itemxmin>=10 and itemxmin<15      THEN '10-15'  " ,
"   WHEN  itemxmin>=15 and itemxmin<20      THEN '15-20'  " ,
"   WHEN  itemxmin>=20 and itemxmin<25      THEN '20-25' " ,
"   WHEN  itemxmin>=25 and itemxmin<30      THEN '25-30'  " ,
"   WHEN  itemxmin>=30 and itemxmin<35      THEN '30-35'  " ,
"   WHEN  itemxmin>=35 and itemxmin<40      THEN '35-40'  " ,
 "  WHEN  itemxmin>=40 and itemxmin<45      THEN '40-45'  " ,
"                                         ELSE '45-MAS'  " ,
"       END  " ,
" as rangovelocidad, mespermanencia, permanencia, curdate() as fechaactualizacion  " ,
" from (  " ,
 "select  v.fecha,v.codtienda, v.tienda, v.codcajero,   " ,
  #cajero, Se puede repetir el nombre de cajero.
 "   v.itemxmin, v.trx_terminal,  " ,
"	 tiempo.ano, tiempo.numsemestre, tiempo.nummes, tiempo.numsemana from  tiempo,  " ,
"  (select fecha, codtienda,tienda,  codcajero,AVG(itemxmin) as itemxmin,  " ,
"  COUNT(cant_trx_terminal) as trx_terminal  " ,
"   from velocidad_trx where velocidad_trx.fecha in(", fechas_in ,")  " ,
" and codtipoterminal in (1,3) and duracseg_digesc_item>=2   " ,
"  and codtienda in (", tiendas_in ,")  " ,
"  and cajero not in('NO DEFINIDO','NO DETERMINADO')  " ,
"  group by fecha,codtienda,codcajero )v  " ,
"  where  v.fecha=tiempo.fecha and v.trx_terminal>=15  " ,
"  and Cast(tiempo.fecha as date) in(", fechas_in ,")     " , 
 "  ) velocidad,  " ,
 "  (  " ,
"	      select CODIGO,COLABORADOR,FE_INGR, mespermanencia,  " ,
 " CASE    " ,
 "  WHEN  mespermanencia<3     THEN '3'  " ,
 "  WHEN  mespermanencia>=3 and mespermanencia<6      THEN '6'  " ,
 "  WHEN  mespermanencia>=6 and mespermanencia<9       THEN '9'  " ,
 "  WHEN  mespermanencia>=9 and mespermanencia<12       THEN '12'  " ,
 "  WHEN  mespermanencia>=12 and mespermanencia<24       THEN '24'  " ,
 "  WHEN  mespermanencia is null       THEN null ",
 "        ELSE '24+'  " ,
 "      END as permanencia,TI_SITU,COD_MOD,MODALIDAD  " ,
"   from (  " ,
"   select CODIGO,COLABORADOR, FE_INGR,( datediff(( select distinct date_format(fecha,'%Y-%m-%d') as fecha from tiempo where   " ,
" fecha in(", fechas_in ,")  order by fecha  desc limit 1) , FE_INGR )/30) as mespermanencia,  " ,
"    TI_SITU,COD_MOD,MODALIDAD  " ,
"   from planilla where (TI_SITU in('ACT') or COD_MOD in('PAF','FAP'))  " ,
 "  )planill where planill.mespermanencia>0   " ,
	# El cajero debe tener un mes como minimo.
"	)pla, tienda  " ,
 " where tienda.codtienda=velocidad.codtienda and velocidad.codcajero=pla.CODIGO and pla.mespermanencia>=1 " ,
 " order by  fecha, itemxmin desc) a " ,
  " ) b;" 
);

prepare sent from @snt;
execute sent;
deallocate prepare sent;


END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_velocidad_diario_between
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_velocidad_diario_between`(IN `tiendas_in` VARCHAR(250), IN `fechaini` DATE, IN `fechafin` DATE)
BEGIN
SET @snt_del=concat("delete  from velocidad_diario where fecha between '", fechaini ,"' and '", fechafin ,"' ;");

prepare sent from @snt_del;
execute sent;
deallocate prepare sent;

SET @snt=concat( 
  #Insertar Velocidad_diario---
"    insert into velocidad_diario " ,
"  (top100,  " ,
"  fecha,  " ,
"  ano,  " ,
"  numsemestre,  " ,
 " nummes,  " ,
"  numsemana,  " ,
"  codtienda,  " ,
"  scannerbalanza,  " ,
"  codcajero,  " ,
"  cajero,  " ,
"  itemxmin,  " ,
"  trx,  " ,
"  rangovelocidad,  " ,
"  mespermanencia, ",
"  permanencia, ",
 " fechaactualizacion)    " ,
  
" select b.rownum, b.fecha, b.ano, b.numsemestre, b.nummes, b.numsemana, " ,
" b.codtienda, b.scanner, b.codcajero,b.cajero, b.itemxmin, b.trx_terminal, b.rangovelocidad, " ,
" b.mespermanencia, b.permanencia, b.fechaactualizacion  " ,
  " from ( " ,
 " select if(@filaindex=fecha,@rownumtmp:=@rownumtmp+1,@rownumtmp:=1) as rownum, " ,
"  @filaindex:=a.fecha AS filaindex, " ,
"   a.fecha, a.ano, a.numsemestre, a.nummes, a.numsemana, " ,
"  a.codtienda, a.scanner, a.codcajero, a.colaborador as cajero ,ROUND(itemxmin, 4) as itemxmin ,trx_terminal,rangovelocidad, " , 
"  ROUND(mespermanencia, 4) as mespermanencia, permanencia, fechaactualizacion " ,
 " from (SELECT @rownumtmp:=1) r, (SELECT @filaindex:='1890-01-01') f, ( " ,
" select fecha, ano, numsemestre, nummes, numsemana,  " ,
" tienda.codtienda, tienda.scanner, codcajero,pla.colaborador,itemxmin,trx_terminal,   " ,
"   CASE   " ,
"   WHEN  itemxmin<10     THEN '0-10'  " , 
"   WHEN  itemxmin>=10 and itemxmin<15      THEN '10-15'  " ,
"   WHEN  itemxmin>=15 and itemxmin<20      THEN '15-20'  " ,
"   WHEN  itemxmin>=20 and itemxmin<25      THEN '20-25' " ,
"   WHEN  itemxmin>=25 and itemxmin<30      THEN '25-30'  " ,
"   WHEN  itemxmin>=30 and itemxmin<35      THEN '30-35'  " ,
"   WHEN  itemxmin>=35 and itemxmin<40      THEN '35-40'  " ,
 "  WHEN  itemxmin>=40 and itemxmin<45      THEN '40-45'  " ,
"                                         ELSE '45-MAS'  " ,
"       END  " ,
" as rangovelocidad, mespermanencia, permanencia, curdate() as fechaactualizacion  " ,
" from (  " ,
 "select  v.fecha,v.codtienda, v.tienda, v.codcajero,   " ,
  #cajero, Se puede repetir el nombre de cajero.
 "   v.itemxmin, v.trx_terminal,  " ,
"	 tiempo.ano, tiempo.numsemestre, tiempo.nummes, tiempo.numsemana from  tiempo,  " ,
"  (select fecha, codtienda,tienda,  codcajero,AVG(itemxmin) as itemxmin,  " ,
"  COUNT(cant_trx_terminal) as trx_terminal  " ,
"   from velocidad_trx where velocidad_trx.fecha between '", fechaini ,"' and '", fechafin ,"'  " ,
" and codtipoterminal in (1,3) and duracseg_digesc_item>=2   " ,
"  and codtienda in (", tiendas_in ,")  " ,
"  and cajero not in('NO DEFINIDO','NO DETERMINADO')  " ,
"  group by fecha,codtienda,codcajero )v  " ,
"  where  v.fecha=tiempo.fecha and v.trx_terminal>=15  " ,
"  and Cast(tiempo.fecha as date) between '", fechaini ,"' and '", fechafin ,"'    " , 
 "  ) velocidad,  " ,
 "  (  " ,
"	      select CODIGO,COLABORADOR,FE_INGR, mespermanencia,  " ,
 " CASE    " ,
 "  WHEN  mespermanencia<3     THEN '3'  " ,
 "  WHEN  mespermanencia>=3 and mespermanencia<6      THEN '6'  " ,
 "  WHEN  mespermanencia>=6 and mespermanencia<9       THEN '9'  " ,
 "  WHEN  mespermanencia>=9 and mespermanencia<12       THEN '12'  " ,
 "  WHEN  mespermanencia>=12 and mespermanencia<24       THEN '24'  " ,
 "  WHEN  mespermanencia is null       THEN null ",
 "        ELSE '24+'  " ,
 "      END as permanencia,TI_SITU,COD_MOD,MODALIDAD  " ,
"   from (  " ,
"   select CODIGO,COLABORADOR, FE_INGR,( datediff(( select distinct date_format(fecha,'%Y-%m-%d') as fecha from tiempo where   " ,
" fecha between '", fechaini ,"' and '", fechafin ,"' order by fecha  desc limit 1) , FE_INGR )/30) as mespermanencia,  " ,
"    TI_SITU,COD_MOD,MODALIDAD  " ,
"   from planilla where (TI_SITU in('ACT') or COD_MOD in('PAF','FAP'))  " ,
 "  )planill where planill.mespermanencia>0   " ,
	# El cajero debe tener un mes como minimo.
"	)pla, tienda  " ,
 " where tienda.codtienda=velocidad.codtienda and velocidad.codcajero=pla.CODIGO and pla.mespermanencia>=1 " ,
 " order by  fecha, itemxmin desc) a " ,
  " ) b;" 
);

prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para procedimiento reports.sp_ins_velocidad_semanal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_velocidad_semanal`(IN `tiendas_in` VARCHAR(250), IN `fechas_in` VARCHAR(250), IN `fechaultimo_in` VARCHAR(250))
BEGIN


SET @snt=concat(   
 "  insert into velocidad_semanal ",
 " (top100, ",
 " ano, ",
 " numsemestre, ",
 " nummes, ",
 " numsemana, ",
 " codtienda, ",
 " scannerbalanza, ",
 " codcajero, ",
 " cajero, ",
 " itemxmin, ",
 " trx, ",
 " rangovelocidad, ",
   " mespermanencia, ",
  " permanencia, ",
 " fechaactualizacion) ",
  
" select (@rownum:=@rownum+1) AS rownum, ano, numsemestre, nummes, numsemana, ",
" a.codtienda, a.scanner, codcajero,a.colaborador as cajero ,ROUND(itemxmin, 4) as itemxmin , ",
" trx_terminal,rangovelocidad, ROUND(mespermanencia,4) as mespermanencia, permanencia, fechaactualizacion ",
 "  from (SELECT @rownum:=0) r, ( ",
" select ano, numsemestre, nummes, numsemana, ",
" tienda.codtienda, tienda.scanner, codcajero,pla.colaborador,itemxmin,trx_terminal, ", 
 "  CASE  " ,
 "  WHEN  itemxmin<10     THEN '0-10' " ,
 "  WHEN  itemxmin>=10 and itemxmin<15      THEN '10-15' " ,
 "  WHEN  itemxmin>=15 and itemxmin<20      THEN '15-20' " ,
 "  WHEN  itemxmin>=20 and itemxmin<25      THEN '20-25' " ,
 "  WHEN  itemxmin>=25 and itemxmin<30      THEN '25-30' " ,
 "  WHEN  itemxmin>=30 and itemxmin<35      THEN '30-35' " ,
 "  WHEN  itemxmin>=35 and itemxmin<40      THEN '35-40' " ,
 "  WHEN  itemxmin>=40 and itemxmin<45      THEN '40-45' " ,
  "                                       ELSE '45-MAS' " ,
  "     END " ,
 "  as rangovelocidad, pla.mespermanencia, pla.permanencia,   curdate() as fechaactualizacion " ,
" from ( " ,
" select  codcajero, " ,
#"  #cajero, Se puede repetir el nombre de cajero. " ,
"   codtienda, tienda, AVG(itemxmin) as itemxmin, " ,
"  COUNT(cant_trx_terminal) as trx_terminal, tiempo.ano, tiempo.numsemestre, tiempo.nummes, tiempo.numsemana from  velocidad_trx,  tiempo  " ,
"  where codtipoterminal in (1,3) and duracseg_digesc_item>=2  " ,
"  and cajero not in('NO DEFINIDO','NO DETERMINADO')  and velocidad_trx.fecha=tiempo.fecha " ,
"  and Cast(tiempo.fecha as date) in (",fechas_in,")  " ,
" and velocidad_trx.codtienda in (",tiendas_in,") " ,
"   group by codcajero,codtienda,tienda, ano, numsemestre, nummes, numsemana) velocidad, " ,
"   ( " ,
"	      select CODIGO,COLABORADOR,FE_INGR, mespermanencia," ,
"  CASE  " ,
"  WHEN  mespermanencia<3     THEN '3' " ,
 "  WHEN  mespermanencia>=3 and mespermanencia<6      THEN '6' " ,
"   WHEN  mespermanencia>=6 and mespermanencia<9       THEN '9' " ,
 "  WHEN  mespermanencia>=9 and mespermanencia<12       THEN '12' " ,
 "  WHEN  mespermanencia>=12 and mespermanencia<24       THEN '24' " ,
 "  WHEN  mespermanencia is null       THEN null " ,
 "        ELSE '24+' " ,
 "      END as permanencia,TI_SITU,COD_MOD,MODALIDAD " ,
 "  from ( " ,
 "  select CODIGO,COLABORADOR, FE_INGR,( datediff(",fechaultimo_in," , FE_INGR )/30) as mespermanencia, " ,
 "   TI_SITU,COD_MOD,MODALIDAD " ,
 "  from planilla where (TI_SITU in('ACT') or COD_MOD in('PAF','FAP')) " ,
 "  )planill where planill.mespermanencia>0 ",
 # "# El cajero debe tener un mes como minimo. " ,
"	)pla, tienda " ,
 " where trx_terminal>=100 and tienda.codtienda=velocidad.codtienda and velocidad.codcajero=pla.CODIGO and pla.mespermanencia>=1 " ,
 " order by  itemxmin desc) a; "
);


prepare sent from @snt;
execute sent;
deallocate prepare sent;

END//
DELIMITER ;


-- Volcando estructura para función reports.fun_diasem
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.198` FUNCTION `fun_diasem`(`numerosemana` INT) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE diasemana VARCHAR(100);
set diasemana='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

set diasemana= CASE  numerosemana
	WHEN  0 THEN 	'Domingo'
   WHEN  1 THEN 	'Lunes' 
   WHEN  2 THEN 	'Martes'
   WHEN  3 THEN 	'Miércoles'
   WHEN  4 THEN 	'Jueves'
   WHEN  5 THEN 	'Viernes'
   WHEN  6 THEN 	'Sabado'
   ELSE 'Sindia'
END;

return diasemana;

END//
DELIMITER ;


-- Volcando estructura para función reports.fun_diasem_corto
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.198` FUNCTION `fun_diasem_corto`(`numerosemana` INT) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE diasemana VARCHAR(100);
set diasemana='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

set diasemana= CASE  numerosemana
	WHEN  0 THEN 	'Do'
   WHEN  1 THEN 	'Lu' 
   WHEN  2 THEN 	'Mar'
   WHEN  3 THEN 	'Mié'
   WHEN  4 THEN 	'Jue'
   WHEN  5 THEN 	'Vie'
   WHEN  6 THEN 	'Sab'
   ELSE 'Sindia'
END;

return diasemana;

END//
DELIMITER ;


-- Volcando estructura para función reports.fun_fueradia
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.168` FUNCTION `fun_fueradia`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select PRC_HDR_FROM_DATE, count(*) from eventosfueradia where PRC_HDR_FROM_DATE in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by PRC_HDR_FROM_DATE Order by PRC_HDR_FROM_DATE desc)p);

if (contarfecha>=6) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla EVENTOSFUERADIA de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------
   delete from eventosfueradia_resum_copy where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));

insert into eventosfueradia_resum_copy 
  (ano, 
  numsemestre, 
  nummes, 
  numsemana, 
  fecha, 
  diasemana_corto, 
  diasemana, 
  prioridadevento, 
  liberador,
  cumplediaevent, 
  nocumplediaevent, 
  toteventos, 
  productoscumple, 
  productosnocumple, 
  totproductos) 
#EVENTO FUERA DE FECHA----------------
#0->Domingo, 1->Lunes, 2->Martes, 3-> Miercoles,
#4->Jueves, 5->Viernes, 6->Sabado

select t.ano, t.numsemestre, t.nummes, t.numsemana, ev.PRC_HDR_FROM_DATE, #PRC_HDR_NUMBER, PRC_HDR_NAME,
fun_diasem_corto(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')) as diasem_corto,
fun_diasem(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')) as diasem,
 CASE  
  WHEN  ev.PRIORIDAD='Regular' and  ev.tipopricing=0  THEN 'Regular' 
  WHEN  ev.PRIORIDAD='Promocional' and  ev.tipopricing=0  THEN 'Promocional' 
  WHEN  ev.PRIORIDAD='Competencia' and  ev.tipopricing=0  THEN 'Competencia' 
  WHEN  ev.PRIORIDAD='Catalogo' and  ev.tipopricing=0  THEN 'Catalogo' 
  WHEN  ev.PRIORIDAD='Liquidacion' and  ev.tipopricing=0  THEN 'Liquidacion' 
  WHEN  ev.PRIORIDAD='competencia' and  ev.tipopricing=0  THEN 'competencia' 
  WHEN  ev.tipopricing=1  THEN 'Pricing'   
      ELSE ev.PRIORIDAD 
     END 
  as prioridadevent,
  ev.USER, ev.NOMBRE,
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 1,0)) as cumpledia, 
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 0,1)) as nocumpledia,
count(ev.PRC_HDR_NUMBER) as toteventos,
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, ev.CANTIDAD,0)) as productoscumple, 
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 0,ev.CANTIDAD)) as productosnocumple, 
sum(ev.CANTIDAD) as totproductos
 from eventosfueradia ev inner join tiempo t on t.fecha= ev.PRC_HDR_FROM_DATE
 where ev.PRC_HDR_FROM_DATE in( 
   select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
 group by ev.user;
 
#-------------------------------------


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros en la tabla eventosfueradia_resum, No se econtraron registros para insertar');
end if;



return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.fun_nommes
DELIMITER //
CREATE DEFINER=`reportuser`@`172.22.191.%` FUNCTION `fun_nommes`(`numeromes` INT) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE nombremes VARCHAR(100);
set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

set nombremes= CASE  numeromes
   WHEN  1 THEN 	'Ene' 
   WHEN  2 THEN 	'Feb'
   WHEN  3 THEN 	'Mar'
   WHEN  4 THEN 	'Abr'
   WHEN  5 THEN 	'May'
   WHEN  6 THEN 	'Jun'
   WHEN  7 THEN 	'Jul'
   WHEN  8 THEN 	'Ago'
   WHEN  9 THEN 	'Sep'
   WHEN  10 THEN 	'Oct'
   WHEN  11 THEN 	'Nov'
   WHEN  12 THEN 	'Dic'
   ELSE 'SinMes'
END;

return nombremes;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_cp_resum_sem_semcerrada
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `ins_cp_resum_sem_semcerrada`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

DECLARE contarfecha1 INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DSCTOMANUAL_DIARIO----
set contarfecha=0;
set contarfecha=(
 select count(*) as fechas from(select fecha, count(*) from cambioprecio_semanal where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas tabla cambioprecio_semanal de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;
#----------

#---OVERRIDE----
set contarfecha1=0;
set contarfecha1=(
select count(*) as fechas from(select fecha, count(*) from trxs where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha1>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla TRXS de la semana, solo se encuentran ', contarfecha1, ' fechas.');
return rs;
end if;
#----------

#-----------------



#ELIMINAR E INSERTAR----------------------------
 delete from cambioprecio_resum_sem where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));

  insert into cambioprecio_resum_sem 
  (
   ano,
	numsemestre,
	nummes,
	numsemana,
	fecha,
	codtienda,
	nomtienda,
	cambioprecio,
	totlineasticket
	)

select tim.ano, tim.numsemestre, tim.nummes, tim.numsemana,
cps.fecha, cps.codtienda, t.nomtienda, sum(cps.articulocp) as articulocp, 
tr.lineasticket
 from cambioprecio_semanal cps inner join tienda t on t.codtienda=cps.codtienda
 inner join tiempo tim on cps.fecha=tim.fecha 
inner join (select fecha, codtienda, canttrx, sum(cant_articulos) as  cant_articulos, 
sum(lineasticket) as lineasticket, sum(montoventa) as montoventa, 
sum(montoventasin) as montoventasin , avg(cantcajas) as cajas from trxs
group by fecha, codtienda )tr 
on tr.fecha=cps.fecha  and tr.codtienda=cps.codtienda
and tim.fecha=tr.fecha
where cps.fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
group by tim.ano, tim.numsemestre, tim.nummes, tim.numsemana,
cps.fecha, cps.codtienda;


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros cambioprecio_resum_sem, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_cp_sem_semanacerrada
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `ins_cp_sem_semanacerrada`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

DECLARE contarfechaoverride INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DSCTOMANUAL_DIARIO----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select fecha, count(*) from dsctomanual_diario where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla DSCTOMANUAL_DIARIO de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;
#----------

#---OVERRIDE----
set contarfechaoverride=0;
set contarfechaoverride=(
select count(*) as fechas from(select fecha, count(*) from override where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfechaoverride>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla OVERRIDE de la semana, solo se encuentran ', contarfechaoverride, ' fechas.');
return rs;
end if;
#----------

#-----------------



#ELIMINAR E INSERTAR----------------------------
 delete  from cambioprecio_semanal where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));
	
   insert into cambioprecio_semanal 
  (fecha,
	ano,
	numsemestre,
	nummes,
	numsemana,
	codtienda,
	nomtienda,
	coddivision,
	division,
	coddepart,
	depart,
	codsubdep,
	subdep,
	codclase,
	clase,
	codunidad,
	unidad,
	ean,
	sku,
	skudescrip,
	codestado,
	estado,
	codcajero,
	cajero,
	pos,
	trx,
	codtipotransaccion,
	tipotransaccion,
	cantarticulo,
	tipocambioprecio,
	contador,
	articulocp,
	montorebaja) 

select cp.fecha, t.ano, t.numsemestre, t.nummes, t.numsemana, cp.codtienda, cp.nomtienda, cp.coddivision, cp.division, cp.coddepart, cp.depart,
cp.codsubdep, cp.subdep, cp.codclase, cp.clase, cp.codunidad, cp.unidad, cp.ean, cp.sku, cp.skudescrip, 
cp.codestado, cp.estado, cp.codcajero, cp.cajero, cp.pos, cp.trx, cp.codtipotransaccion, cp.tipotransaccion,
cp.cantarticulo, cp.tipocambioprecio, cp.contador, cp.articulocp, cp.montorebaja
 from (
(select ds.fecha, ds.codtienda, ds.nomtienda, ds.coddivision, ds.division, ds.coddepart, ds.depart,
ds.codsubdep, ds.subdep, ds.codclase, ds.clase, ds.codunidad, ds.unidad, ds.ean, ds.sku, ds.skudescrip, 
ds.codestado, ds.estado, ds.codcajero, ds.cajero, ds.pos, ds.trx, ds.codtipotransaccion, ds.tipotransaccion,
ds.unidadvtadscto as cantarticulo, 'DSCTO MANUALES' as tipocambioprecio,
CASE   
   WHEN   codtipotransaccion=1     THEN 1.00   
   WHEN   codtipotransaccion<>1     THEN -1.00
       END  
 as contador,
 
 CASE   
   WHEN  codunidad=12 && codtipotransaccion=1     THEN 1.00   
   WHEN  codunidad=12 && codtipotransaccion<>1     THEN -1.00     
                                         ELSE  unidadvtadscto 
       END  
 as articulocp, ds.montorebaja
 
from dsctomanual_diario ds inner join tienda tie on tie.codtienda=ds.codtienda
where ds.fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
) 
union
(select ov.fecha, ov.codtienda, ov.nomtienda, ov.coddivision, ov.division, ov.coddepart, ov.depart,
ov.codsubdep, ov.subdep, ov.codclase, ov.clase, ov.codunidad, ov.unidad, ov.ean, ov.sku, ov.skudescrip, 
ov.codestado, ov.estado, ov.codcajero, ov.cajero, ov.pos, ov.trx, ov.codtipotransaccion, ov.tipotransaccion,
ov.cantarticulo, 'OVERRIDE' as tipocambioprecio,
CASE   
   WHEN   codtipotransaccion=1     THEN 1.00   
   WHEN   codtipotransaccion<>1     THEN -1.00
       END  
 as contador,
 
 CASE   
   WHEN  codunidad=12 && codtipotransaccion=1     THEN 1.00   
   WHEN  codunidad=12 && codtipotransaccion<>1     THEN -1.00     
                                         ELSE  cantarticulo 
       END  
 as articulocp, 0 as montorebaja
from override ov inner join tienda tie on tie.codtienda=ov.codtienda
where ov.fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
))cp, tiempo t where cp.fecha=t.fecha;



#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros cambioprecio_semanal, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_digitado_resum_sem_semcerrada
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `ins_digitado_resum_sem_semcerrada`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

DECLARE contarfecha1 INT;


#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DSCTOMANUAL_DIARIO----
set contarfecha=0;
set contarfecha=(
 select count(*) as fechas from(select fecha, count(*) from digitado_diario where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas tabla digitado_diario de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;
#----------

#---TRX----
set contarfecha1=0;
set contarfecha1=(
select count(*) as fechas from(select fecha, count(*) from trxs where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha1=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla TRXS de la semana, solo se encuentran ', contarfecha1, ' fechas.');
return rs;
end if;
#----------

#-----------------



#ELIMINAR E INSERTAR----------------------------
delete from digitado_resum_sem  where  
 fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
);

  insert into digitado_resum_sem 
  (
   ano,
	numsemestre,
	nummes,
	numsemana,
	fecha,
	codtienda,
	nomtienda,
	cantdigitado,
	totlineasticket
	)

select tim.ano, tim.numsemestre, tim.nummes, tim.numsemana, tim.fecha,
 dig.codtienda,  dig.nomtienda, dig.cantproduc , tr.lineasticket
from 
(select fecha, codtienda, canttrx, sum(cant_articulos) as  cant_articulos, 
sum(lineasticket) as lineasticket, sum(montoventa) as montoventa, 
sum(montoventasin) as montoventasin , avg(cantcajas) as cajas from trxs
where fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
group by fecha, codtienda )tr inner join
(select fecha, codtienda, nomtienda, sum(cantproduc) as cantproduc
from digitado_diario where fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
and concat(codtienda,sku) not in (select concat(codtienda,sku) from digitado_excluidos)
and coddivision not in ('J06')
group by fecha, codtienda
)dig on dig.fecha=tr.fecha and dig.codtienda=tr.codtienda
inner join tienda t on t.codtienda=dig.codtienda
inner join tiempo tim on tim.fecha=dig.fecha
Order by dig.fecha, codtienda;


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros digitado_resum_sem, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_digitado_sem_semcerrada
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `ins_digitado_sem_semcerrada`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;



#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DIGITADO_DIARIO----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select fecha, count(*) from digitado_diario where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla DIGITADO_DIARIO de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;
#----------


#-----------------



#ELIMINAR E INSERTAR----------------------------

 delete  from digitado_semanal where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));
	
   insert into digitado_semanal 
  (ano,
	numsemestre,
	nummes,
	numsemana,
	codtienda,
	nomtienda,
	coddivision,
	division,
	coddepart,
	depart,
	codsubdep,
	subdep,
	codclase,
	clase,
	codsubclase,
	subclase,
	codunidad,
	unidad,
	sku,
	skudescrip,	
	cantproduc
	) 

select tim.ano, tim.numsemestre, tim.nummes, tim.numsemana,
   d.codtienda,	d.nomtienda,	d.coddivision,	
	d.division,	d.coddepart,	d.depart,	
	d.codsubdep,	d.subdep,	
	d.codclase,	d.clase,	
	d.codsubclase,	d.subclase,	
	d.codunidad,	d.unidad,	
	d.sku,	d.skudescrip, sum(d.cantproduc) as cantproduc
from digitado_diario d inner join tiempo tim on tim.fecha=d.fecha
inner join tienda t on t.codtienda=d.codtienda
 where d.fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
and concat(d.codtienda,d.sku) not in (select concat(codtienda,sku) from digitado_excluidos)
and d.coddivision not in ('J06')
group by  d.codtienda, d.sku;



#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros digitado_semanal, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_digitado_V2
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.119` FUNCTION `ins_digitado_V2`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;



#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DIGITADO_DIARIO----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select fecha, count(*) from digitado_v2 where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 28 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=28) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla DIGITADO_DIARIO_v2 de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;
#----------


#-----------------



#ELIMINAR E INSERTAR----------------------------

 delete  from digitado_semanal_v2 where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 28 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 28 DAY),'%Y-%m-%d') ));
	
   insert into digitado_semanal_v2 
  (ano,
	numsemestre,
	nummes,
	numsemana,
	codtienda,
	nomtienda,
	coddivision,
	division,
	coddepart,
	depart,
	codsubdep,
	descsubdep,
	cantproduc
	) 

select tim.ano, tim.numsemestre, tim.nummes, tim.numsemana,
   d.codtienda,	d.nomtienda,	d.coddivision,	
	d.division,	d.coddepart,	d.depart,	
	d.codsubdep,	d.descsubdep, sum(d.cantproduc) as cantproduc
from digitado_v2 d inner join tiempo tim on tim.fecha=d.fecha
inner join tienda t on t.codtienda=d.codtienda
 where d.fecha in ( 
select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 28 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
group by  d.codtienda, d.subdep;



#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros digitado_semanal_v2, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_eventosfueradia_resum
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.198` FUNCTION `ins_eventosfueradia_resum`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select PRC_HDR_FROM_DATE, count(*) from eventosfueradia where PRC_HDR_FROM_DATE in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by PRC_HDR_FROM_DATE Order by PRC_HDR_FROM_DATE desc)p);

if (contarfecha>=6) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla EVENTOSFUERADIA de la semana, solo se encuentran ', contarfecha, ' fechas.');
return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------
   delete from eventosfueradia_resum where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));

insert into eventosfueradia_resum 
  (ano, 
  numsemestre, 
  nummes, 
  numsemana, 
  fecha, 
  diasemana_corto, 
  diasemana, 
  prioridadevento, 
  cumplediaevent, 
  nocumplediaevent, 
  toteventos, 
  productoscumple, 
  productosnocumple, 
  totproductos) 
#EVENTO FUERA DE FECHA----------------
#0->Domingo, 1->Lunes, 2->Martes, 3-> Miercoles,
#4->Jueves, 5->Viernes, 6->Sabado

select t.ano, t.numsemestre, t.nummes, t.numsemana, ev.PRC_HDR_FROM_DATE, #PRC_HDR_NUMBER, PRC_HDR_NAME,
fun_diasem_corto(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')) as diasem_corto,
fun_diasem(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')) as diasem,
 CASE  
  WHEN  ev.PRIORIDAD='Regular' and  ev.tipopricing=0  THEN 'Regular' 
  WHEN  ev.PRIORIDAD='Promocional' and  ev.tipopricing=0  THEN 'Promocional' 
  WHEN  ev.PRIORIDAD='Competencia' and  ev.tipopricing=0  THEN 'Competencia' 
  WHEN  ev.PRIORIDAD='Catalogo' and  ev.tipopricing=0  THEN 'Catalogo' 
  WHEN  ev.PRIORIDAD='Liquidacion' and  ev.tipopricing=0  THEN 'Liquidacion' 
  WHEN  ev.PRIORIDAD='competencia' and  ev.tipopricing=0  THEN 'competencia' 
  WHEN  ev.tipopricing=1  THEN 'Pricing'   
      ELSE ev.PRIORIDAD 
     END 
  as prioridadevent,
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 1,0)) as cumpledia, 
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 0,1)) as nocumpledia,
count(ev.PRC_HDR_NUMBER) as toteventos,
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, ev.CANTIDAD,0)) as productoscumple, 
sum(if((DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=1 && ev.PRIORIDAD='Regular' && ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=2 && ev.PRIORIDAD='Promocional'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=3 && ev.PRIORIDAD='Competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Catalogo'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=4 && ev.PRIORIDAD='Liquidacion'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=6 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=0 && ev.PRIORIDAD='competencia'&& ev.tipopricing=0) ||
(DATE_FORMAT(ev.PRC_HDR_FROM_DATE,'%w')=5 && ev.tipopricing=1) 
, 0,ev.CANTIDAD)) as productosnocumple, 
sum(ev.CANTIDAD) as totproductos
 from eventosfueradia ev inner join tiempo t on t.fecha= ev.PRC_HDR_FROM_DATE
 where ev.PRC_HDR_FROM_DATE in( 
   select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)
 group by ev.PRC_HDR_FROM_DATE, diasem_corto, prioridadevent;
 
#-------------------------------------


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros en la tabla eventosfueradia_resum, No se econtraron registros para insertar');
end if;



return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_veloc_semanacerrada
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.198` FUNCTION `ins_veloc_semanacerrada`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
set contarfecha=0;
set contarfecha=(
select count(*) as fechas from(select fecha, count(*) from velocidad_trx where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc)p);

if (contarfecha>=7) then
SET rs = '1';
else
SET rs = concat('No esta cargado las fechas completas de la tabla VELOCIDAD_TRX de la semana, solo se encuentran ', contarfecha, ' fechas.   \r\n');

#Mostrar Valores-------
set valor='';
set valor=(SELECT GROUP_CONCAT(val.fecha,' ' SEPARATOR '\r\n') AS fechas
from (
select fecha, count(*) from velocidad_trx where fecha in(
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
) group by fecha Order by fecha desc
)val);

SET rs = concat(rs ,valor);
#----------

return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------
  delete from velocidad_semanal where  
    ano=(select ano from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))	
       and numsemana=(select numsemana from tiempo t
	where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ));
	
 insert into velocidad_semanal 
  (top100, 
  ano, 
  numsemestre, 
  nummes, 
  numsemana, 
  codtienda, 
  scannerbalanza, 
  codcajero, 
  cajero, 
  itemxmin, 
  trx, 
  item_pos, 
  item_terminal, 
  rangovelocidad, 
  mespermanencia, 
  permanencia, 
  fechaactualizacion) 

select (@rownum:=@rownum+1) AS rownum, ano, numsemestre, nummes, numsemana, 
 a.codtienda, a.scanner, codcajero,a.colaborador as cajero ,ROUND(itemxmin, 4) as itemxmin , 
 trx_terminal, item_pos, item_terminal, rangovelocidad, ROUND(mespermanencia,4) as mespermanencia, permanencia, fechaactualizacion 
  from (SELECT @rownum:=0) r, ( 
 select ano, numsemestre, nummes, numsemana, 
 tienda.codtienda, tienda.scanner, codcajero,pla.colaborador,itemxmin,trx_terminal, item_pos, item_terminal,
  CASE  
  WHEN  itemxmin<10     THEN '0-10' 
  WHEN  itemxmin>=10 and itemxmin<15      THEN '10-15' 
  WHEN  itemxmin>=15 and itemxmin<20      THEN '15-20' 
  WHEN  itemxmin>=20 and itemxmin<25      THEN '20-25' 
  WHEN  itemxmin>=25 and itemxmin<30      THEN '25-30' 
  WHEN  itemxmin>=30 and itemxmin<35      THEN '30-35' 
  WHEN  itemxmin>=35 and itemxmin<40      THEN '35-40' 
  WHEN  itemxmin>=40 and itemxmin<45      THEN '40-45' 
                                       ELSE '45-MAS' 
     END 
  as rangovelocidad, pla.mespermanencia, pla.permanencia,   curdate() as fechaactualizacion 
 from ( 
  
 select  codcajero, 
#"  #cajero, Se puede repetir el nombre de cajero. " ,
   codtienda,  AVG(itemxmin) as itemxmin, 
  COUNT(cant_trx_terminal) as trx_terminal, 
  sum(velocidad_trx.cant_item_pos) as item_pos,  sum(velocidad_trx.cant_item_terminal) as item_terminal,
   tiempo.ano, tiempo.numsemestre, tiempo.nummes, tiempo.numsemana from  velocidad_trx,  tiempo  
  where codtipoterminal in (1,3) and duracseg_digesc_item>=2  
  and cajero not in('NO DEFINIDO','NO DETERMINADO')  and velocidad_trx.fecha=tiempo.fecha 
  and Cast(tiempo.fecha as date) in (
  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc
)  
 and velocidad_trx.codtienda in (select codtienda from tienda) 
   group by codcajero,codtienda, ano, numsemestre, nummes, numsemana  
	
	) velocidad, 
   ( 
	      select CODIGO,COLABORADOR,FE_INGR, mespermanencia,
  CASE  
  WHEN  mespermanencia<3     THEN '3' 
  WHEN  mespermanencia>=3 and mespermanencia<6      THEN '6' 
   WHEN  mespermanencia>=6 and mespermanencia<9       THEN '9' 
  WHEN  mespermanencia>=9 and mespermanencia<12       THEN '12' 
  WHEN  mespermanencia>=12 and mespermanencia<24       THEN '24' 
  WHEN  mespermanencia is null       THEN null 
        ELSE '24+' 
      END as permanencia,TI_SITU,COD_MOD,MODALIDAD 
  from ( 
  select CODIGO,COLABORADOR, FE_INGR,( datediff((  select tt.fecha
from(
select fecha,numsemana,nummes, numsemestre, ano from tiempo t
where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
order by tt.fecha desc limit 1) , FE_INGR )/30) as mespermanencia, 
   TI_SITU,COD_MOD,MODALIDAD 
  from planilla where (TI_SITU in('ACT') or COD_MOD in('PAF','FAP')) 
  )planill where planill.mespermanencia>0
# "# El cajero debe tener un mes como minimo. 
	)pla, tienda 
 where trx_terminal>=100 and tienda.codtienda=velocidad.codtienda and velocidad.codcajero=pla.CODIGO and pla.mespermanencia>=1 
 order by  itemxmin desc) a;


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros Velocidad_semanal, No se econtraron registros para insertar');
end if;



return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.ins_vxh_ventahoy
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.169` FUNCTION `ins_vxh_ventahoy`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION -----
set contarfecha=0;

if (contarfecha=0) then
SET rs = '1';
else
SET rs = '1';
#SET rs = concat('No esta cargado las fechas completas de la tabla XXXXX de la semana, solo se encuentran ', contarfecha, ' fechas.');
#return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------
  delete from ventahoy;	
 insert into ventahoy 
  (
  fecha,
  codtienda, 
  nomtienda, 
  nomtiendacorto, 
  formato, 
  nomcomercial, 
  empresa, 
  hora, 
  ventaconigv, 
  ventasinigv, 
  montoplanventa, 
  ventahora) 

select cv.fecha, t.codtienda, t.nomtienda, t.nomtiendacorto,
 t.formato, t.nomcomercial, t.empresa, t.hora, 
if(v.venta is null, 0, round(v.venta,2)) as ventaconigv,
if(v.venta is null,  0, round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2)) as ventasinigv,
if(cv.montoplanventa is null, 0,
if(t.hora=(TIME_FORMAT(CURTIME(),'%k')-1),cv.montoplanventa,0))  as montoplanventa,
if(t.hora=(TIME_FORMAT(CURTIME(),'%k')-1),
round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2),0) as ventahora
#round(round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2)/cv.montoplanventa,2) as cumplimiento
 from (select t.*, h.hora from  tiendaventa t, hora h where t.estado=1) as t 
 left join (select * from ventashora
where fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) ) v
 on t.codtienda=v.codtienda and t.hora=v.hora
# left join cuotasventa cv on t.codtienda=cv.codtienda
  left join (select * from cuotasventa
  where fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
   ) cv on t.codtienda=cv.codtienda
#and cv.fecha='2015-12-20'
order by t.codtienda, t.hora;
#where v.fecha='2015-03-30' 
#and v.hora<13 

#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros ventahoy, No se econtraron registros para insertar');
end if;



return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.sp_ins_masterproducto_plu
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `sp_ins_masterproducto_plu`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarreg INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
set contarreg=0;
set contarreg=(
select count(*) as fechas from masterplu );

if (contarreg> 200) then
SET rs = '1';
else
SET rs = concat('No esta cargado la tabla MATERPLU de la semana, solo se tiene  ', contarreg, ' registros.   \r\n');
return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------

#Eliminar------
delete from masterproducto_plu;

#Insertar------
insert into masterproducto_plu (
coddivision, division, coddepart, depart,
codsubdep, subdep, codclase, clase, codsubclase, subclase,
codestilo, estilo, sku, skudescrip, ean, codmarca, marca,
codestado, estado, codtipoproducto, tipoproducto, codunidad, unidad, fechareg
)
select mp.coddivision, mp.division, mp.coddepart, mp.depart,
mp.codsubdep, mp.subdep, mp.codclase, mp.clase, mp.codsubclase, mp.subclase,
mp.codestilo, mp.estilo, mp.sku, mp.skudescrip, plu.plu, mp.codmarca, mp.marca,
mp.codestado, mp.estado, mp.codtipoproducto, mp.tipoproducto, mp.codunidad, unidad, CURDATE() as fechareg
 from masterproducto mp inner join masterplu plu on mp.sku=plu.sku; 


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros masterproducto_plu, No se econtraron registros para insertar');
end if;



return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.update_cplinea_codsupervisor
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `update_cplinea_codsupervisor`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

update  cambiopreciolinea cpe inner join infocashier inf on cpe.llavesupervisor=inf.llave 
set cpe.codsupervisor=inf.CashierID, cpe.nomsupervisor= inf.CashierName
where cpe.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
and cpe.llavesupervisor=inf.llave;

#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > -1 ) then
SET rs = '1';
else
SET rs = concat('No se actualizo registros cambiopreciolinea, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.valid_cuotaventa
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.166` FUNCTION `valid_cuotaventa`() RETURNS longtext CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs LONGTEXT;
DECLARE contar INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


#VALIDACION TIENDAS NO CARGADAS--VENTAHORA---
set contar=0;
set contar=(select count(*) cant
from
(
select fecha,count(codtienda) as cant from cuotasventa 
where fecha >=(DATE_FORMAT(DATE_ADD(CURDATE(), interval 1 DAY),'%Y-%m-%d'))
group by fecha
)p);


if (contar >= 2) then
SET rs = '1';

else

SET rs = concat('No existen cuotas cargadas, solo se tiene ',contar, ' Fechas cargadas.  \r\n');

#Mostrar Valores-------

set valor='';
set valor=(SELECT GROUP_CONCAT(val.fecha,' ' SEPARATOR '\r\n') AS codtienda
from (
select fecha,count(codtienda) as cant from cuotasventa 
where fecha >=(DATE_FORMAT(DATE_ADD(CURDATE(), interval 1 DAY),'%Y-%m-%d'))
group by fecha
)val);

SET rs = concat(rs ,valor);

#----------

end if;


return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.valid_edatos_cp_ayer
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `valid_edatos_cp_ayer`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

DECLARE rs LONGTEXT;
DECLARE rs_dscto LONGTEXT;

DECLARE contar INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


##VALIDACION TIENDAS NO CARGADAS--VENTAHORA---
#set contar=0;
#set contar=(select count(*) cant
#from
#(
#select distinct DATE_FORMAT(fecha,'%Y-%m-%d') as fecha
#from trxs_r200 where 
#cast(fecha as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
#and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
#)p);


#if (contar = 1) then
#SET rs = '1';

#else

#SET rs = concat('No existen fechas cargadas tabla TRXS_R200, solo se tiene ',contar, ' Fechas.  \r\n');

##Mostrar Valores-------



##----------

#end if;


#Validacion TABLA DESCUENTO----

#---
set contar=0;
set contar=(select count(*) cant
from
(
select distinct DATE_FORMAT(fecha,'%Y-%m-%d') as fecha
from dsctomanual_diario where 
cast(fecha as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)p);


if (contar = 1) then
SET rs_dscto = '1';

else

SET rs_dscto = concat('No existen fechas cargadas tabla dsctomanual_diario, solo se tiene ',contar, ' Fechas.  \r\n');

#Mostrar Valores-------


#----------

end if;


if ( (rs = '1') && (rs_dscto='1')) then

return '1';

else

return concat(rs ,'*', rs_dscto);

end if;



END//
DELIMITER ;


-- Volcando estructura para función reports.valid_enviar_cambioprecio
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `valid_enviar_cambioprecio`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

DECLARE rs LONGTEXT;
DECLARE rs_dscto LONGTEXT;

DECLARE contar INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


#VALIDACION TIENDAS NO CARGADAS--VENTAHORA---
set contar=0;
set contar=(select count(*) cant
from
(
select distinct DATE_FORMAT(fecha,'%Y-%m-%d') as fecha
from trxs_r200 where 
cast(fecha as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)p);


if (contar = 1) then
SET rs = '1';

else

SET rs = concat('No existen fechas cargadas tabla TRXS_R200, solo se tiene ',contar, ' Fechas.  \r\n');

#Mostrar Valores-------



#----------

end if;


#Validacion TABLA DESCUENTO----

#---
set contar=0;
set contar=(select count(*) cant
from
(
select distinct DATE_FORMAT(fecha,'%Y-%m-%d') as fecha
from dsctomanual_diario where 
cast(fecha as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)p);


if (contar = 1) then
SET rs_dscto = '1';

else

SET rs_dscto = concat('No existen fechas cargadas tabla dsctomanual_diario, solo se tiene ',contar, ' Fechas.  \r\n');

#Mostrar Valores-------


#----------

end if;


if ( (rs = '1') && (rs_dscto='1')) then

return '1';

else

return concat(rs ,'*', rs_dscto);

end if;



END//
DELIMITER ;


-- Volcando estructura para función reports.valid_regcambioprecioweb
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `valid_regcambioprecioweb`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs LONGTEXT;
DECLARE contar INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


#VALIDACION TIENDAS NO CARGADAS--VENTAHORA---
set contar=0;
set contar=(select count(*) cant
from
(
select distinct DATE_FORMAT(fechareg,'%Y-%m-%d') as fecharegistro
from regcambioprecioweb where 
cast(fechareg as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -7 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)p);


if (contar = 7) then
SET rs = '1';

else

SET rs = concat('No existen fechas cargadas tabla REGCAMBIOPRECIOWEB, solo se tiene ',contar, ' Fechas.  \r\n');

#Mostrar Valores-------

set valor='';
set valor=(SELECT GROUP_CONCAT(val.fecharegistro,' ' SEPARATOR '\r\n') AS fechas
from (
select distinct DATE_FORMAT(fechareg,'%Y-%m-%d') as fecharegistro
from regcambioprecioweb where 
cast(fechareg as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -7 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)val);

SET rs = concat(rs ,valor);

#----------

end if;


return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.valid_SQL_clinor_sem
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `valid_SQL_clinor_sem`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 

#VALIDACION DE REGISTROS---------
#----------------------
set contar=0;
set contar=(
select count(*) as cantidad from vs_sql_ins_clie_nocmr_sem_ult);

if (contar>0) then
SET rs = '1';
else
SET rs = concat('No esta cargado ningun registro de la Ultima Semana, se tiene  ', contar, ' registros.');
return rs;
end if;
#----------

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.valid_veloc_duplicados
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` FUNCTION `valid_veloc_duplicados`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


#VALIDACION DUPLICADOS DE CAJEROS--VELOCIDAD SEMANAL---
set contar=0;
set contar=(select count(*) cant
from
(
select v.codcajero,count(*) as cant from velocidad_semanal v,
(select fecha,numsemana,nummes, numsemestre, ano from tiempo
where fecha=DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') )t
where
v.ano=t.ano and v.nummes=t.nummes and v.numsemana=t.numsemana
group by v.codcajero having cant>1
order by cant desc
)p);
#----------------------


if (contar = 0) then
SET rs = '1';
else
SET rs = concat('Se encontraron ',contar, ' casos repetidos');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función reports.valid_ventaxhora
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.166` FUNCTION `valid_ventaxhora`() RETURNS longtext CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs LONGTEXT;
DECLARE contar INT;
DECLARE valor LONGTEXT;

#set nombremes='p';
#if (instr(numeromes, '10') > 0) then
#SET nombremes = replace(numeromes, '10', 'Octubre');
#end if;

#CASE DATE_FORMAT(Date1 , '%w' ) 
#--------


#VALIDACION TIENDAS NO CARGADAS--VENTAHORA---
set contar=0;
set contar=(select count(*) cant
from
(
select t.codtienda,venta  from tiendaventa t left join
(select v.fecha, v.codtienda, v.hora, sum(v.venta) as venta from ventashora v
#where v.fecha='2015-03-30' #and venta <=0
where v.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
#and v.hora=23
and v.hora between (TIME_FORMAT(CURTIME(),'%k')-1) and (TIME_FORMAT(CURTIME(),'%k'))
group by v.fecha,v.codtienda
)ve on t.codtienda=ve.codtienda
where venta is null and t.estado=1
)p);


if (contar = 0) then
SET rs = '1';
else
SET rs = concat('En la Hora no tienen ventas,  ',contar, ' Tiendas.  \r\n');
end if;

#Mostrar Valores-------

set valor='';
set valor=(SELECT GROUP_CONCAT(val.codtienda,' - ', val.nomtienda  SEPARATOR '\r\n') AS codtienda
from (
select t.codtienda, t.nomtienda, ve.venta  from tiendaventa t left join
(select v.fecha, v.codtienda, v.hora, sum(v.venta) as venta from ventashora v
#where v.fecha='2015-03-30' #and venta <=0
where v.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
#and v.hora=23
and v.hora between (TIME_FORMAT(CURTIME(),'%k')-1) and (TIME_FORMAT(CURTIME(),'%k'))
group by v.fecha,v.codtienda
)ve on t.codtienda=ve.codtienda
where venta is null and t.estado=1
)val);


if (valor is null ) then
SET rs = '1';
else
SET rs = concat(rs ,valor);
end if;






return rs;

END//
DELIMITER ;


-- Volcando estructura para evento reports.Carga_pre_Prod
DELIMITER //
CREATE DEFINER=`dba`@`172.22.189.92` EVENT `Carga_pre_Prod` ON SCHEDULE EVERY 1 DAY STARTS '2015-10-23 12:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Carga diaria' DO insert into pre_productividad (tipotrx,Fecha,codtienda,tienda,pos,trx,codcajero,cajero,hora,codtipotransaccion,tipotransaccion)
(select if(rownum=1,'LOGIN','VENTA_INICIO') as tipotrx, 
conec.fecha, conec.codtienda, conec.tienda, conec.pos, conec.trx, conec.codcajero,
conec.cajero, conec.horainitrx as hora, conec.codtipotransaccion, conec.tipotransaccion
  from 
(select 
if(@filaindex=concat(tot.fecha,tot.codtienda, tot.codcajero),
@rownumtmp:=@rownumtmp+1,@rownumtmp:=1) as rownum,
 @filaindex:=concat(tot.fecha,tot.codtienda, tot.codcajero) AS filaindex,
 tot.fecha,tot.codtienda, tot.tienda, tot.pos, tot.trx,
tot.codcajero, tot.cajero, tot.horainitrx, tot.horafintrx, tot.codtipotransaccion, 
tot.tipotransaccion, tot.canttrx, tot.montoventa 
from (SELECT @rownumtmp:=1) r, (SELECT @filaindex:='1890-01-01') f,
 conexionpos_trx tot where tot.fecha=date_sub(curdate(),interval 1 day)
 and codcajero>=0 and tot.codtipotransaccion in (55,56,1)
order by tot.fecha,tot.codtienda, tot.codcajero asc, tot.horainitrx asc
 )conec where rownum in (1,2) 
) 
UNION ALL
(select if(rownum=1,'LOGOUT','VENTA_FIN') as tipotrx, 
conec.fecha, conec.codtienda, conec.tienda, conec.pos, conec.trx, conec.codcajero,
conec.cajero, if(rownum=1,conec.horainitrx, conec.horafintrx) as hora,
 conec.codtipotransaccion, conec.tipotransaccion
 from 
(select 
if(@filaindex=concat(tot.fecha,tot.codtienda, tot.codcajero),
@rownumtmp:=@rownumtmp+1,@rownumtmp:=1) as rownum,
 @filaindex:=concat(tot.fecha,tot.codtienda, tot.codcajero) AS filaindex,
 tot.fecha,tot.codtienda, tot.tienda, tot.pos, tot.trx,
tot.codcajero, tot.cajero, tot.horainitrx, tot.horafintrx, tot.codtipotransaccion, 
tot.tipotransaccion, tot.canttrx, tot.montoventa 
from (SELECT @rownumtmp:=1) r, (SELECT @filaindex:='1890-01-01') f,
 conexionpos_trx tot where tot.fecha=date_sub(curdate(),interval 1 day)
and codcajero>=0 and tot.codtipotransaccion in (55,56,1)
order by tot.fecha,tot.codtienda, tot.codcajero asc, tot.horainitrx desc
 )conec where rownum in (1,2))//
DELIMITER ;


-- Volcando estructura para evento reports.del_tablas
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.183` EVENT `del_tablas` ON SCHEDULE EVERY 1 DAY STARTS '2014-11-13 03:30:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

delete from velocidad_trx where fecha in(
select fecha from tiempo t
where t.fecha between ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 106 DAY),'%Y-%m-%d') ) 
and ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 105 DAY),'%Y-%m-%d') )
);

delete from conexionpos_trx where fecha in(
select fecha from tiempo t
where t.fecha between ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 106 DAY),'%Y-%m-%d') ) 
and ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 105 DAY),'%Y-%m-%d') )
);


END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
