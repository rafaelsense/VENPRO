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

-- Volcando estructura para vista reports.vs1_t_fecha_ult7sem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs1_t_fecha_ult7sem` (
	`fecha` DATE NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs1_t_fecha_ult9sem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs1_t_fecha_ult9sem` (
	`fecha` DATE NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs1_t_fecha_ultsem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs1_t_fecha_ultsem` (
	`fecha` DATE NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs1_t_sem_ult9sem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs1_t_sem_ult9sem` (
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs1_t_sem_ultsem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs1_t_sem_ultsem` (
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cambioprecio_resum_sem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cambioprecio_resum_sem` (
	`fecha` DATE NOT NULL,
	`anogregoriano` VARCHAR(4) NULL COLLATE 'utf8_general_ci',
	`mesgregoriano` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`ano` INT(11) NOT NULL,
	`mes` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`mes_ano_corto` VARCHAR(103) NULL COLLATE 'utf8_bin',
	`numsemana` INT(11) NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`nummes` INT(11) NOT NULL,
	`cambioprecio` DECIMAL(20,4) NOT NULL,
	`totlineasticket` DECIMAL(20,4) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_conectividad
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_conectividad` (
	`fecha` DATE NOT NULL,
	`ano` INT(11) NULL,
	`numsemestre` INT(11) NULL,
	`nummes` INT(11) NULL,
	`numsemana` INT(11) NULL,
	`codtienda` INT(11) NOT NULL,
	`tienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`tipocajero` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`seccion` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`cargo` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codtrabajador` BIGINT(20) NOT NULL,
	`trabajador` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`inicioteorico` TIME NULL,
	`finteorico` TIME NULL,
	`inicioreal` TIME NULL,
	`finreal` TIME NULL,
	`tipomarcacion` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`destipomarcacion` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`horamarca` DECIMAL(10,4) NULL,
	`horamarcar` DECIMAL(10,4) NULL,
	`ratio` DECIMAL(10,4) NULL,
	`horaspos` DECIMAL(10,4) NULL,
	`horasbloqueo` DECIMAL(10,4) NULL,
	`horaefectivapos` DECIMAL(10,4) NULL,
	`bloqueos` INT(11) NULL,
	`canttrx` DECIMAL(10,4) NULL,
	`monto` DECIMAL(10,4) NULL,
	`conexion` VARCHAR(10) NULL COLLATE 'utf8_spanish_ci',
	`codtipolabor` INT(11) NULL,
	`labor` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tiendas` VARCHAR(114) NOT NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_conex_prod
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_conex_prod` (
	`ano` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`tipotrx` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`fecha` DATE NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`tienda` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`pos` INT(11) NOT NULL,
	`trx` INT(11) NOT NULL,
	`codcajero` INT(11) NOT NULL,
	`cajero` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`hora` TIME NULL,
	`codtipotransaccion` INT(11) NOT NULL,
	`tipotransaccion` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_datos_ayer
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_datos_ayer` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`coddivision` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`division` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`coddepart` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`depart` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codsubdep` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`subdep` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codclase` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`clase` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codunidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`unidad` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`ean` BIGINT(40) NOT NULL,
	`sku` BIGINT(20) NOT NULL,
	`skudescrip` VARCHAR(250) NOT NULL COLLATE 'utf8_spanish_ci',
	`codestado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codcajero` BIGINT(20) NULL,
	`cajero` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`pos` INT(11) NOT NULL,
	`trx` BIGINT(20) NOT NULL,
	`codtipotransaccion` BIGINT(20) NULL,
	`tipotransaccion` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codrebaja` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`nomrebaja` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`preciovigente` DECIMAL(20,4) NULL,
	`codvendedor` BIGINT(20) NULL,
	`vendedor` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`unidadvtadscto` DECIMAL(20,4) NOT NULL,
	`montorebaja` DECIMAL(20,4) NULL,
	`montoventadscto` DECIMAL(20,4) NULL,
	`montoventa` DECIMAL(20,4) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_datos_ayer_17
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_datos_ayer_17` (
	`Fecha` DATE NULL,
	`codtienda` BIGINT(20) NULL,
	`Desc_tienda` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`Division` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`Departamento` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Subdepartamento` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Clase` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Ean_id` BIGINT(20) NULL,
	`Sku_cod` BIGINT(20) NULL,
	`Sku_desc` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Codestado` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`Estado` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`Pos` BIGINT(20) NULL,
	`Trx` BIGINT(20) NULL,
	`Cajero_id` BIGINT(20) NULL,
	`Cajero_desc` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Cajero_cargo` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`Marca_desc` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`Marca_over` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`Sup_cod` BIGINT(20) NULL,
	`Sup_desc` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`Sup_num4` BIGINT(20) NULL,
	`Cantidad_de_Item_Ticket` BIGINT(20) NULL,
	`Monto_rebaja` DECIMAL(20,4) NULL,
	`Monto_item_con_iva` DECIMAL(20,4) NULL,
	`Precio_pos` DECIMAL(20,4) NULL,
	`Precio_unitario_pos` DECIMAL(20,4) NULL,
	`Cantidad_de_Segundos_Entre_Timb` BIGINT(20) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_eo_diario
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_eo_diario` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(10) NOT NULL,
	`tienda` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`cuenta` BIGINT(21) NOT NULL,
	`canttrx` INT(10) NOT NULL,
	`cantdscto` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_eo_diario_17
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_eo_diario_17` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(10) NOT NULL,
	`tienda` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`cuenta` BIGINT(21) NOT NULL,
	`canttrx` INT(10) NOT NULL,
	`cantdscto` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_eo_ult_30
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_eo_ult_30` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(10) NOT NULL,
	`tienda` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`cuenta` BIGINT(21) NOT NULL,
	`canttrx` INT(10) NOT NULL,
	`cantdscto` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_eo_ult_30_17
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_eo_ult_30_17` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(10) NOT NULL,
	`tienda` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`cuenta` BIGINT(21) NOT NULL,
	`canttrx` INT(10) NOT NULL,
	`cantdscto` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_total_dia
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_total_dia` (
	`fecha` DATE NOT NULL,
	`ano` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`coddivision` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`division` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`coddepart` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`depart` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codsubdep` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`subdep` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codclase` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`clase` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codunidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`unidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`ean` BIGINT(40) NOT NULL,
	`sku` BIGINT(20) NOT NULL,
	`skudescrip` VARCHAR(250) NOT NULL COLLATE 'utf8_spanish_ci',
	`codestado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codcajero` BIGINT(20) NOT NULL,
	`cajero` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`pos` INT(11) NOT NULL,
	`trx` INT(11) NOT NULL,
	`codtipotransaccion` INT(1) NOT NULL,
	`tipocambioprecio` VARCHAR(20) NOT NULL COLLATE 'utf8_spanish_ci',
	`cantarticulo` DECIMAL(20,4) NOT NULL,
	`montorebaja` DECIMAL(20,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_cp_total_ult_6_sem
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cp_total_ult_6_sem` (
	`fecha` DATE NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`coddivision` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`division` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`coddepart` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`depart` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codsubdep` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`subdep` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codclase` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`clase` VARCHAR(250) NULL COLLATE 'utf8_spanish_ci',
	`codunidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`unidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`ean` BIGINT(40) NOT NULL,
	`sku` BIGINT(20) NOT NULL,
	`skudescrip` VARCHAR(250) NOT NULL COLLATE 'utf8_spanish_ci',
	`codestado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codcajero` BIGINT(20) NOT NULL,
	`cajero` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`pos` INT(11) NOT NULL,
	`trx` INT(11) NOT NULL,
	`codtipotransaccion` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`tipotransaccion` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tipocambioprecio` VARCHAR(20) NOT NULL COLLATE 'utf8_spanish_ci',
	`cantarticulo` DECIMAL(20,4) NOT NULL,
	`montorebaja` DECIMAL(20,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_masterproducto_exporweb
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_masterproducto_exporweb` (
	`division` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`departamento` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`subdepartamento` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`clase` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`subclase` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`estilo` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`sku` BIGINT(20) NOT NULL,
	`skudescrip` VARCHAR(250) NOT NULL COLLATE 'utf8_spanish_ci',
	`ean` BIGINT(20) NOT NULL,
	`codmarca` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`marca` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codestado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codtipoproducto` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tipoproducto` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codunidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`unidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_masterproducto_plu_exporweb
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_masterproducto_plu_exporweb` (
	`division` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`departamento` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`subdepartamento` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`clase` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`subclase` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`estilo` VARCHAR(303) NULL COLLATE 'utf8_spanish_ci',
	`sku` BIGINT(20) NOT NULL,
	`skudescrip` VARCHAR(250) NOT NULL COLLATE 'utf8_spanish_ci',
	`ean` BIGINT(20) NOT NULL,
	`codmarca` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`marca` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codestado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codtipoproducto` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tipoproducto` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codunidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`unidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sc_empleadopersonal
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sc_empleadopersonal` (
	`ano` INT(11) NOT NULL,
	`mes` INT(11) NOT NULL,
	`uni` BIGINT(20) NOT NULL,
	`unidad` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`puesto` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`plla` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codigo` BIGINT(20) NOT NULL,
	`colaborador` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tipo_doc` VARCHAR(10) NULL COLLATE 'utf8_spanish_ci',
	`numero_doc` VARCHAR(12) NULL COLLATE 'utf8_spanish_ci',
	`fe_naci` DATE NULL,
	`sexo` VARCHAR(1) NULL COLLATE 'utf8_spanish_ci',
	`fe_ingr` DATE NULL,
	`fe_cese` DATE NULL,
	`cod_mod` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`de_moti_sepa` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sc_velocidad
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sc_velocidad` (
	`codcajero` BIGINT(20) NOT NULL,
	`Sem 5` DECIMAL(51,8) NULL,
	`Sem 6` DECIMAL(51,8) NULL,
	`Sem 7` DECIMAL(51,8) NULL,
	`Sem 8` DECIMAL(51,8) NULL,
	`promediomensual` DECIMAL(33,12) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sql_empleado
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sql_empleado` (
	`codigo` BIGINT(20) NOT NULL,
	`nombre` VARCHAR(150) NOT NULL COLLATE 'utf8_spanish_ci',
	`sexo` CHAR(1) NULL COLLATE 'utf8_spanish_ci',
	`edad` INT(11) NULL,
	`dni` INT(11) NOT NULL,
	`cargo` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`departamento` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`area` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`seccion` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`disponibilidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`estado` VARCHAR(10) NULL COLLATE 'utf8_spanish_ci',
	`fechaingreso` DATE NOT NULL,
	`fechasalida` DATE NULL,
	`tiendalaboral` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sql_ins_velocsem_ult
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sql_ins_velocsem_ult` (
	`top100` INT(11) NULL,
	`ano` INT(11) NOT NULL,
	`numsemestre` INT(11) NULL,
	`nummes` INT(11) NULL,
	`numsemana` INT(11) NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`scannerbalanza` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`codcajero` BIGINT(20) NOT NULL,
	`cajero` VARCHAR(150) NULL COLLATE 'utf8_spanish_ci',
	`itemxmin` DECIMAL(29,8) NOT NULL,
	`trx` INT(11) NOT NULL,
	`item_pos` INT(11) NULL,
	`item_terminal` INT(11) NULL,
	`rangovelocidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`mespermanencia` DECIMAL(20,5) NULL,
	`permanencia` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sql_planilla
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sql_planilla` (
	`ANO` INT(11) NULL,
	`MES` INT(11) NULL,
	`COD` INT(11) NOT NULL,
	`UNIDAD` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`PUESTO` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`PLLA` VARCHAR(150) NULL COLLATE 'utf8_spanish_ci',
	`CODIGO` BIGINT(20) NOT NULL,
	`COLABORADOR` VARCHAR(150) NOT NULL COLLATE 'utf8_spanish_ci',
	`DOC` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`NUMDOC` BIGINT(20) NULL,
	`FE_NACI` DATE NULL,
	`SEX` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`FE_INGR` DATE NOT NULL,
	`FE_INGR_ULTIMO` DATE NULL,
	`FE_CESE` DATE NULL,
	`COD_MOD` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`MODALIDAD` VARCHAR(200) NULL COLLATE 'utf8_spanish_ci',
	`TI_SITU` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`fechaactualizacion` DATE NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_sql_tiempo
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_sql_tiempo` (
	`fecha` DATE NOT NULL,
	`numsemana` INT(11) NOT NULL,
	`nummes` INT(11) NOT NULL,
	`numsemestre` INT(11) NOT NULL,
	`ano` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_trxtipo_mensual
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_trxtipo_mensual` (
	`fecha` DATE NOT NULL,
	`anogregoriano` VARCHAR(4) NULL COLLATE 'utf8_general_ci',
	`mesgregoriano` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`ano` INT(11) NOT NULL,
	`mes` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`mes_ano_corto` VARCHAR(103) NULL COLLATE 'utf8_bin',
	`numsemana` INT(11) NOT NULL,
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`codtipotransaccion` INT(11) NOT NULL,
	`tipotransaccion` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`trx` BIGINT(20) NOT NULL,
	`Cant_Articulos` DECIMAL(24,4) NOT NULL,
	`lineasticket` DECIMAL(24,4) NOT NULL,
	`montoventa` DECIMAL(24,4) NOT NULL,
	`montoventasin` DECIMAL(24,4) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_velocidad_semanal
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_velocidad_semanal` (
	`top100` BIGINT(11) NULL,
	`ano` INT(11) NOT NULL,
	`numsemestre` INT(11) NULL,
	`ano_mes` VARCHAR(25) NULL COLLATE 'utf8_general_ci',
	`mes_ano_corto` VARCHAR(103) NULL COLLATE 'utf8_bin',
	`nummes` INT(11) NULL,
	`numsemana` INT(11) NOT NULL,
	`semana` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`semana_ano` VARCHAR(29) NOT NULL COLLATE 'utf8_general_ci',
	`codtienda` INT(11) NOT NULL,
	`nomtienda` VARCHAR(100) NOT NULL COLLATE 'utf8_spanish_ci',
	`tiendas` VARCHAR(114) NOT NULL COLLATE 'utf8_spanish_ci',
	`scannerbalanza` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`formato` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`zona` VARCHAR(10) NULL COLLATE 'utf8_spanish_ci',
	`codcajero` BIGINT(20) NOT NULL,
	`cajero` VARCHAR(150) NULL COLLATE 'utf8_spanish_ci',
	`COLABORADOR` VARCHAR(150) NULL COLLATE 'utf8_spanish_ci',
	`PLLA` VARCHAR(150) NULL COLLATE 'utf8_spanish_ci',
	`TI_SITU` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`itemxmin` DECIMAL(26,4) NOT NULL,
	`trx` INT(11) NOT NULL,
	`item_pos` INT(11) NULL,
	`item_terminal` INT(11) NULL,
	`rangovelocidad` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`mespermanencia` DECIMAL(20,5) NULL,
	`permanencia` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_ventaxhora
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_ventaxhora` (
	`fecha` DATE NULL,
	`codtienda` INT(11) NULL,
	`nomtienda` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`nomtiendacorto` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`formato` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`nomcomercial` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`empresa` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`hora` INT(11) NULL,
	`ventaconigv` DECIMAL(20,4) NULL,
	`ventasinigv` DECIMAL(20,4) NULL,
	`montoplanventa` DECIMAL(20,4) NULL,
	`ventahora` DECIMAL(20,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_ventaxhora_garantia
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_ventaxhora_garantia` (
	`codtienda` BIGINT(20) NOT NULL,
	`correoenvio` TEXT NOT NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_ventaxhora_producto
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_ventaxhora_producto` (
	`fecha` DATE NULL,
	`codtienda` INT(11) NULL,
	`nomtienda` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`nomtiendacorto` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`formato` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`nomcomercial` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`empresa` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`hora` INT(11) NULL,
	`iddivision` BIGINT(20) NULL,
	`coddivision` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`division` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`iddepart` BIGINT(20) NULL,
	`coddepart` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`depart` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`ventaconigv` DECIMAL(20,4) NULL,
	`ventasinigv` DECIMAL(20,4) NULL,
	`montoplanventa` DECIMAL(20,4) NULL,
	`ventahora` DECIMAL(20,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_vxh_distribucion_gerentegeneral
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_vxh_distribucion_gerentegeneral` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`activo` BIT(1) NOT NULL,
	`correo_to` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cc` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cco` TEXT NULL COLLATE 'utf8_spanish_ci',
	`cuerpomensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`piemensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`hora` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_vxh_distribucion_gerentetienda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_vxh_distribucion_gerentetienda` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`activo` BIT(1) NOT NULL,
	`correo_to` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cc` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cco` TEXT NULL COLLATE 'utf8_spanish_ci',
	`cuerpomensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`piemensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`hora` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_vxh_distribucion_operadoressi
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_vxh_distribucion_operadoressi` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(50) NOT NULL COLLATE 'utf8_spanish_ci',
	`activo` BIT(1) NOT NULL,
	`correo_to` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cc` TEXT NULL COLLATE 'utf8_spanish_ci',
	`correo_cco` TEXT NULL COLLATE 'utf8_spanish_ci',
	`cuerpomensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`piemensaje` TEXT NULL COLLATE 'utf8_spanish_ci',
	`hora` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista reports.vs_vxh_envio_gerentetienda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_vxh_envio_gerentetienda` (
	`fecha` DATE NULL,
	`codtienda` VARCHAR(11) NULL COLLATE 'utf8_general_ci',
	`nomtienda` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci',
	`nomtiendacorto` VARCHAR(20) NULL COLLATE 'utf8_spanish_ci',
	`venta` DECIMAL(39,0) NULL,
	`cuota` DECIMAL(39,0) NULL,
	`porcentaje` DECIMAL(45,2) NULL,
	`vxh` DECIMAL(39,0) NULL,
	`J01` DECIMAL(46,3) NOT NULL,
	`J02` DECIMAL(46,3) NOT NULL,
	`J03` DECIMAL(46,3) NOT NULL,
	`J04` DECIMAL(46,3) NOT NULL,
	`J05` DECIMAL(46,3) NOT NULL,
	`J06` DECIMAL(46,3) NOT NULL,
	`J07` DECIMAL(46,3) NOT NULL,
	`J08` DECIMAL(46,3) NOT NULL,
	`J09` DECIMAL(46,3) NOT NULL,
	`J10` DECIMAL(46,3) NOT NULL,
	`J11` DECIMAL(46,3) NOT NULL
) ENGINE=MyISAM;


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


-- Volcando estructura para procedimiento reports.sp_consultar_ventahoragarantiahoy
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_consultar_ventahoragarantiahoy`(IN `p_codtienda` BIGINT)
BEGIN

select tiendalaboral as cod,  nomtiendacorto as tienda, codigo, nombre, venta from ventahoragarantiahoy
where tiendalaboral=p_codtienda
order by venta desc;

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


-- Volcando estructura para función reports.ins_sc_empleadocajarotacion
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `ins_sc_empleadocajarotacion`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(300);
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
select count(*)  from tienda t left join (select ano, mes, uni, count(*) as cantidad from sc_empleadocaja
where ano=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y'))
and mes=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%m')-2)
group by ano, mes, uni
) e
on t.codtienda= e.UNI
where t.formato<> 'Bodega'
);

if (contarreg> 54) then
SET rs = '1';
else
SET rs = concat('No esta cargado algunas tiendas en la tabla sc_empleadocaja del mes en curso para scorecard, solo se tiene  ', contarreg, ' registros.   \r\n');
return rs;
end if;

#-----------------

#ELIMINAR E INSERTAR----------------------------

#Eliminar------
delete from sc_empleadocajarotacion where ano=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y'))
and mes=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%m')-1);

#Insertar------


insert into sc_empleadocajarotacion
(
ano,
mes,
uni,
unidad,
seccion,
puesto,
plla,
codigo,
colaborador,
tipo_doc,
numero_doc, 
fe_naci,
sexo, 
fe_ingr,
fe_cese,
cod_mod,
de_moti_sepa,
observaciones,
estado
)
select 
e.ano,
e.mes,
e.uni,
e.unidad,
e.SECCION,
e.puesto,
e.plla,
e.codigo,
concat( e.ap_paterno, ' ', e.ap_materno, ', ', e.colaborador) as colaborador,
e.tipo_doc,
e.numero_doc, 
e.fe_naci,
e.sexo, 
e.fe_ingr,
e.fe_cese,
tr.COD_MOD,
e.de_moti_sepa,
e.observaciones,
e.estado
from sc_empleadocaja e left join sc_tipocese_rotacion tr
on tr.MODALIDAD=e.DE_MOTI_SEPA
where 
e.ano=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y'))
and e.mes=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%m')-1);


#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros sc_empleadocajarotacion, No se econtraron registros para insertar');
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


-- Volcando estructura para función reports.ins_ventahoragarantiahoy
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `ins_ventahoragarantiahoy`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;


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
delete from ventahoragarantiahoy;
insert into ventahoragarantiahoy 
(
fechaproceso,
codigo,
dni,
nombre,
cargo, 
departamento,
tiendalaboral,
nomtienda,
nomtiendacorto,
formato,
fecha,
codtienda,
codvendedor,
venta,
ventasinigv
)

select ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) as fechaproceso, 
e.codigo, e.dni, e.nombre, e.cargo, e.departamento, e.tiendalaboral, 
t.nomtienda, t.nomtiendacorto, t.formato, 
v.fecha, v.codtienda, v.codvendedor, 
ifnull(v.venta,0) as venta , ifnull(v.ventasinigv, 0) ventasinigv  from empleado e left join 
(select fecha, codtienda, codvendedor, 
sum(venta) as venta, sum(ventasinigv) as ventasinigv
from ventahoraproducto
where codvendedor is not null
and fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and iddepart=1105 #GARANTIA EXTENDIDA
group by fecha, codtienda, codvendedor) v
on e.codigo=v.codvendedor
inner join tiendaventa t
on t.codtienda=e.tiendalaboral
where e.departamento='ELECTRODOMESTICOS'
and e.cargo='VENDEDOR'
and t.estado=1;

#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros ventahoragarantiahoy, No se econtraron registros para insertar');
end if;



return rs;


END//
DELIMITER ;


-- Volcando estructura para función reports.ins_vxh_producto_ventahoy
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `ins_vxh_producto_ventahoy`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
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
  delete from ventahoraproductohoy;	
 insert into ventahoraproductohoy 
  (
  fecha,
  codtienda, 
  nomtienda, 
  nomtiendacorto, 
  formato, 
  nomcomercial, 
  empresa, 
  hora, 
  iddivision, 
  coddivision, 
  division,
  iddepart, 
  coddepart, 
  depart,
  ventaconigv, 
  ventasinigv, 
  montoplanventa, 
  ventahora) 
  
select cv.fecha, t.codtienda, t.nomtienda, t.nomtiendacorto,
 t.formato, t.nomcomercial, t.empresa, t.hora, 
 t.iddivision, t.coddivision, t.division, t.iddepart, t.coddepart, t.depart, 
if(v.venta is null, 0, round(v.venta,2)) as ventaconigv,
if(v.venta is null,  0, round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2)) as ventasinigv,
if(cv.montoplanventa is null, 0,
if(t.hora=(TIME_FORMAT(CURTIME(),'%k')-1),cv.montoplanventa,0))  as montoplanventa,
if(t.hora=(TIME_FORMAT(CURTIME(),'%k')-1),
ifnull(round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2),0),0) as ventahora
#round(round(if(t.igv>0,(v.venta)/(1+ t.igv),v.venta),2)/cv.montoplanventa,2) as cumplimiento
 from (select t.*, h.hora, d.* from  tiendaventa t, hora h, depart d where t.estado=1) as t 
 left join (select fecha, codtienda, hora, iddepart, 
 sum(cantidad) as cantidad, sum(venta) as venta, sum(ventasinigv) as ventasinigv
  from ventahoraproducto
where #fecha='2017-03-12'
fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
group by fecha, codtienda,  hora, iddepart 
) v
 on t.codtienda=v.codtienda and t.hora=v.hora and t.iddepart=v.iddepart
# left join cuotasventa cv on t.codtienda=cv.codtienda
  left join (select codtienda, nomtienda, fecha,  SUBSTRING(codpart,2,5)*1 as iddepart, codpart, 
  depart, montoplanventa from cuotasventadepart
  where #fecha='2017-03-12'
  fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
  
   ) cv on t.codtienda=cv.codtienda and t.iddepart=cv.iddepart
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
SET rs = concat('No se inserto registros ventahoraproductohoy, No se econtraron registros para insertar');
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


-- Volcando estructura para función reports.valid_enviar_cambioprecio_17
DELIMITER //
CREATE DEFINER=`dba`@`%` FUNCTION `valid_enviar_cambioprecio_17`() RETURNS text CHARSET utf8 COLLATE utf8_spanish_ci
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
from cambio_precio_2017 where 
cast(fecha as date) between (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
and  (DATE_FORMAT(DATE_ADD(CURDATE(), interval -1 DAY),'%Y-%m-%d'))
)p);


if (contar = 1) then
SET rs_dscto = '1';

else

SET rs_dscto = concat('No existen fechas cargadas tabla cambio_precio_2017, solo se tiene ',contar, ' Fechas.  \r\n');

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
select concat(TIME_FORMAT(SUBTIME(CURTIME(),'0:25:0'),'%k:%i:%s'), ' - ', TIME_FORMAT(SUBTIME(CURTIME(),'0:0:0'),'%k:%i:%s')) as hora, 
t.codtienda, venta from reports.tiendaventa t left join
(select tot.Tail_Fecha AS Tail_Fecha,
tot.StoreNumber AS StoreNumber,
#(time_format(total.Tail_Hora,'%k') * 1) AS hora,
(sum(tot.MontoTicket) / 100) AS venta 
from ventaspro.total tot
where (tot.Tail_Fecha = date_format((curdate() - interval 0 day),'%Y-%m-%d')) 
and tot.Tail_TicketCancelado = 0
 and tot.Saved_Tkt = 0
 and tot.MontoTicket <> 0
 and tot.Tail_Hora between SUBTIME(CURTIME(),'0:25:0') and SUBTIME(CURTIME(),'0:0:0')
 group by tot.Tail_Fecha,tot.StoreNumber 
 ) ve on t.codtienda=ve.StoreNumber
where venta is null and t.estado=1
)p);


if (contar = 0) then
SET rs = '1';
else
SET rs = concat('En la Hora no tienen ventas,  ',contar, ' Tiendas.  \r\n');
end if;

#Mostrar Valores-------

#Aumentar la longitud de group_contact---
set session group_concat_max_len = 4096; 

set valor='';
set valor=(SELECT GROUP_CONCAT( val.codtienda,' - ', val.nomtienda  SEPARATOR '\r\n') AS codtienda
from (
select concat(TIME_FORMAT(SUBTIME(CURTIME(),'0:25:0'),'%k:%i:%s'), ' - ', TIME_FORMAT(SUBTIME(CURTIME(),'0:0:0'),'%k:%i:%s')) as hora, 
t.codtienda, t.nomtienda, venta from reports.tiendaventa t left join
(select tot.Tail_Fecha AS Tail_Fecha,
tot.StoreNumber AS StoreNumber,
#(time_format(total.Tail_Hora,'%k') * 1) AS hora,
(sum(tot.MontoTicket) / 100) AS venta 
from ventaspro.total tot
where (tot.Tail_Fecha = date_format((curdate() - interval 0 day),'%Y-%m-%d')) 
and tot.Tail_TicketCancelado = 0
 and tot.Saved_Tkt = 0
 and tot.MontoTicket <> 0
 and tot.Tail_Hora between SUBTIME(CURTIME(),'0:25:0') and SUBTIME(CURTIME(),'0:0:0')
 group by tot.Tail_Fecha,tot.StoreNumber 
 ) ve on t.codtienda=ve.StoreNumber
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

delete from ventahoraproducto where fecha <=date_format((curdate() - interval 10 day),'%Y-%m-%d');

END//
DELIMITER ;


-- Volcando estructura para vista reports.vs1_t_fecha_ult7sem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs1_t_fecha_ult7sem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs1_t_fecha_ult7sem` AS SELECT  tt.fecha, tt.numsemana, tt.nummes, tt.numsemestre, tt.ano
FROM  tiempo AS t INNER JOIN
tiempo AS tt ON t.ano = tt.ano AND t.numsemestre = t.numsemestre 
AND t.nummes = tt.nummes 
AND t.numsemana = tt.numsemana 
AND t.fecha BETWEEN 
DATE_FORMAT(DATE_SUB(CURDATE(), interval 49 DAY),'%Y-%m-%d') AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ;


-- Volcando estructura para vista reports.vs1_t_fecha_ult9sem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs1_t_fecha_ult9sem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs1_t_fecha_ult9sem` AS SELECT  tt.fecha, tt.numsemana, tt.nummes, tt.numsemestre, tt.ano
FROM  tiempo AS t INNER JOIN
tiempo AS tt ON t.ano = tt.ano AND t.numsemestre = t.numsemestre 
AND t.nummes = tt.nummes 
AND t.numsemana = tt.numsemana 
AND t.fecha BETWEEN 
DATE_FORMAT(DATE_SUB(CURDATE(), interval 63 DAY),'%Y-%m-%d') AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ;


-- Volcando estructura para vista reports.vs1_t_fecha_ultsem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs1_t_fecha_ultsem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs1_t_fecha_ultsem` AS SELECT  tt.fecha, tt.numsemana, tt.nummes, tt.numsemestre, tt.ano
FROM  tiempo AS t INNER JOIN
tiempo AS tt ON t.ano = tt.ano AND t.numsemestre = t.numsemestre 
AND t.nummes = tt.nummes 
AND t.numsemana = tt.numsemana 
AND t.fecha BETWEEN 
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ;


-- Volcando estructura para vista reports.vs1_t_sem_ult9sem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs1_t_sem_ult9sem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs1_t_sem_ult9sem` AS SELECT DISTINCT tt.numsemana, tt.nummes, tt.numsemestre, tt.ano
FROM  tiempo AS t INNER JOIN
tiempo AS tt ON t.ano = tt.ano AND t.numsemestre = t.numsemestre 
AND t.nummes = tt.nummes 
AND t.numsemana = tt.numsemana 
AND t.fecha BETWEEN 
DATE_FORMAT(DATE_SUB(CURDATE(), interval 63 DAY),'%Y-%m-%d') AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ;


-- Volcando estructura para vista reports.vs1_t_sem_ultsem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs1_t_sem_ultsem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs1_t_sem_ultsem` AS SELECT DISTINCT tt.numsemana, tt.nummes, tt.numsemestre, tt.ano
FROM  tiempo AS t INNER JOIN
tiempo AS tt ON t.ano = tt.ano AND t.numsemestre = t.numsemestre 
AND t.nummes = tt.nummes 
AND t.numsemana = tt.numsemana 
AND t.fecha BETWEEN 
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ;


-- Volcando estructura para vista reports.vs_cambioprecio_resum_sem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cambioprecio_resum_sem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_cambioprecio_resum_sem` AS select tt.fecha, date_format(tt.fecha, '%Y') as anogregoriano ,
 fun_nommes(date_format(tt.fecha, '%m')) as mesgregoriano , t.ano, fun_nommes(t.nummes)as  mes,
 concat(fun_nommes(t.nummes) , '-' , SUBSTRING(t.ano, 3, 2) ) AS mes_ano_corto,
 tt.numsemana, tt.codtienda, 
tt.nomtienda, tt.nummes, tt.cambioprecio, tt.totlineasticket
from cambioprecio_resum_sem tt inner join tiempo t on tt.fecha=t.fecha  
where t.ano in (2015,2016) ;


-- Volcando estructura para vista reports.vs_conectividad
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_conectividad`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_conectividad` AS select c.fecha,
c.ano, c.numsemestre,	c.nummes,	c.numsemana,	c.codtienda, t.nomtienda as tienda,	c.tipocajero,	
c.seccion,	c.cargo,c.codtrabajador,	c.trabajador,	c.inicioteorico,	c.finteorico,
c.inicioreal,	c.finreal, c.tipomarcacion,	c.destipomarcacion,	c.horamarca,	c.horamarcar,
c.ratio,	c.horaspos, c.horasbloqueo,	c.horaefectivapos,	c.bloqueos,	c.canttrx,	
c.monto,	c.conexion,	c.codtipolabor, ct.nomlabor as labor, 
concat(c.codtienda , ' - ' , t.nomtienda) as tiendas
 from conectividad c left join ctipolabor ct on c.codtipolabor=ct.codlabor
inner join tienda t on c.codtienda=t.codtienda
where c.ano in (2017) ;


-- Volcando estructura para vista reports.vs_conex_prod
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_conex_prod`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_conex_prod` AS select t.ano, t.nummes, t.numsemana, p.* from pre_productividad p inner join vs1_t_fecha_ult7sem t
on p.fecha=t.fecha ;


-- Volcando estructura para vista reports.vs_cp_datos_ayer
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_datos_ayer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_datos_ayer` AS select * from dsctomanual_diario where fecha =DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')
 and codtienda not in(159,170,173,172,174,178,373,374) ;


-- Volcando estructura para vista reports.vs_cp_datos_ayer_17
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_datos_ayer_17`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_datos_ayer_17` AS select * from cambio_precio_2017 where fecha =DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')
and codtienda not in(159,170,173,172,173,174,178,373,374,910) ;


-- Volcando estructura para vista reports.vs_cp_eo_diario
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_eo_diario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_eo_diario` AS #permite obtener la información del día de ayer

select trx.fecha,trx.codtienda, trx.tienda, count(dscto.nomtienda) as cuenta, 
trx.canttrx,sum(if((dscto.unidadvtadscto=0 || dscto.unidadvtadscto is null),0,1)) as cantdscto from  trxs_r200 trx 
left join dsctomanual_diario dscto
on dscto.codtienda=trx.codtienda and dscto.fecha=trx.fecha 
where trx.fecha =DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d') #and dscto.unidadvtadscto>0
group by trx.fecha, trx.codtienda ;


-- Volcando estructura para vista reports.vs_cp_eo_diario_17
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_eo_diario_17`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_eo_diario_17` AS #permite obtener la información del día de ayer

select trx.fecha,trx.codtienda, trx.tienda, count(dscto.codtienda) as cuenta, 
trx.canttrx,sum(if((dscto.Cantidad_de_Item_Ticket=0 || dscto.Cantidad_de_Item_Ticket is null),0,1)) as cantdscto from  trxs_r200 trx 
left join cambio_precio_2017 dscto
on dscto.codtienda=trx.codtienda and dscto.fecha=trx.fecha 
where trx.fecha =DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d') #and dscto.Cantidad_de_Item_Ticket>0
group by trx.fecha, trx.codtienda ;


-- Volcando estructura para vista reports.vs_cp_eo_ult_30
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_eo_ult_30`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_eo_ult_30` AS #Permite obtener la información de los últimos 30 días

select trx.fecha, trx.codtienda, trx.tienda, count(dscto.nomtienda) as cuenta, 
trx.canttrx,sum(if((dscto.unidadvtadscto=0 || dscto.unidadvtadscto is null),0,1)) as cantdscto from trxs_r200 trx 
left join dsctomanual_diario  dscto 
on dscto.codtienda=trx.codtienda and dscto.fecha=trx.fecha 
where trx.fecha between DATE_FORMAT(DATE_SUB(CURDATE(), interval 30 DAY),'%Y-%m-%d') and DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')
#and dscto.unidadvtadscto>0
group by trx.fecha, trx.codtienda ;


-- Volcando estructura para vista reports.vs_cp_eo_ult_30_17
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_eo_ult_30_17`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_eo_ult_30_17` AS #Permite obtener la información de los últimos 30 días

select trx.fecha, trx.codtienda, trx.tienda, count(dscto.codtienda) as cuenta, 
trx.canttrx,sum(if((dscto.Cantidad_de_Item_Ticket=0 || dscto.Cantidad_de_Item_Ticket is null),0,1)) as cantdscto from trxs_r200 trx 
left join cambio_precio_2017  dscto 
on dscto.codtienda=trx.codtienda and dscto.fecha=trx.fecha 
where trx.fecha between DATE_FORMAT(DATE_SUB(CURDATE(), interval 30 DAY),'%Y-%m-%d') and DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')
#and dscto.Cantidad_de_Item_Ticket>0
group by trx.fecha, trx.codtienda ;


-- Volcando estructura para vista reports.vs_cp_total_dia
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_total_dia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_total_dia` AS #Permite tener los descuentos y override del día de ayer

select  cp.fecha, cp.ano, cp.numsemestre, cp.nummes, cp.numsemana, cp.codtienda, cp.nomtienda, cp.coddivision, 
cp.division, cp.coddepart, cp.depart, cp.codsubdep, cp.subdep, cp.codclase, cp.clase, cp.codunidad,
cp.unidad, cp.ean, cp.sku, cp.skudescrip, cp.codestado, cp.estado, cp.codcajero, cp.cajero, cp.pos, cp.trx,
cp.codtipotransaccion=1 as codtipotransaccion , #cp.cantarticulo,
cp.tipocambioprecio,cp.cantarticulo, cp.montorebaja
from cambioprecio_semanal cp where fecha=DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d') group by cp.fecha, cp.codtienda, cp.pos, 
cp.trx, cp.sku ;


-- Volcando estructura para vista reports.vs_cp_total_ult_6_sem
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cp_total_ult_6_sem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cp_total_ult_6_sem` AS #Devuelve los datos solicitados en el rango de fecha de acuerdo a lo solicitado por EO

select  cp.fecha, cp.codtienda, cp.nomtienda, cp.coddivision, 
cp.division, cp.coddepart, cp.depart, cp.codsubdep, cp.subdep, cp.codclase, cp.clase, cp.codunidad,
cp.unidad, cp.ean, cp.sku, cp.skudescrip, cp.codestado, cp.estado, cp.codcajero, cp.cajero, cp.pos, cp.trx,
cp.codtipotransaccion as codtipotransaccion , cp.tipotransaccion,
cp.tipocambioprecio,cp.cantarticulo, cp.montorebaja
from cambioprecio_semanal cp where  fecha between '2016-11-01' AND  
DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d') 
group by cp.fecha, cp.codtienda, cp.pos, 
cp.trx, cp.tipocambioprecio, cp.sku

#cp.codtipotransaccion=1 and ;


-- Volcando estructura para vista reports.vs_masterproducto_exporweb
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_masterproducto_exporweb`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_masterproducto_exporweb` AS SELECT concat(coddivision, ' - ',division) as  division, concat(coddepart, ' - ',depart) as departamento, 
concat(codsubdep, ' - ',subdep) as subdepartamento, concat(codclase, ' - ',clase) as clase, 
concat(codsubclase, ' - ',subclase) as subclase, concat(codestilo, ' - ',estilo) as estilo, 
sku, skudescrip, ean, codmarca, marca, codestado, estado, codtipoproducto, 
tipoproducto, codunidad, unidad
FROM masterproducto ;


-- Volcando estructura para vista reports.vs_masterproducto_plu_exporweb
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_masterproducto_plu_exporweb`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_masterproducto_plu_exporweb` AS SELECT concat(coddivision, ' - ',division) as  division, concat(coddepart, ' - ',depart) as departamento, 
concat(codsubdep, ' - ',subdep) as subdepartamento, concat(codclase, ' - ',clase) as clase, 
concat(codsubclase, ' - ',subclase) as subclase, concat(codestilo, ' - ',estilo) as estilo, 
sku, skudescrip, ean, codmarca, marca, codestado, estado, codtipoproducto, 
tipoproducto, codunidad, unidad
FROM masterproducto_plu ;


-- Volcando estructura para vista reports.vs_sc_empleadopersonal
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sc_empleadopersonal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_sc_empleadopersonal` AS select 
e.ano,
e.mes,
e.uni,
e.unidad,
#e.seccion,
e.puesto,
e.plla,
e.codigo,
e.colaborador,
e.tipo_doc,
e.numero_doc, 
e.fe_naci,
e.sexo, 
e.fe_ingr,
e.fe_cese,
e.cod_mod,
e.de_moti_sepa,
#e.observaciones,
e.estado
from sc_empleadocajarotacion e 
where 
e.ano=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y'))
and e.mes=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%m')-2) ;


-- Volcando estructura para vista reports.vs_sc_velocidad
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sc_velocidad`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_sc_velocidad` AS select  codcajero, sum(if(numsemana=5,itemxmin, 0)) as 'Sem 5', sum(if(numsemana=6,itemxmin, 0)) as 'Sem 6', 
sum(if(numsemana=7,itemxmin, 0)) as 'Sem 7', sum(if(numsemana=8,itemxmin, 0)) as 'Sem 8', 
avg(itemxmin) as promediomensual from velocidad_semanal where ano=2017 and numsemana between 5 and 8
and codcajero in (8501579, 8503104)
group by codcajero ;


-- Volcando estructura para vista reports.vs_sql_empleado
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sql_empleado`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_sql_empleado` AS select * from empleado ;


-- Volcando estructura para vista reports.vs_sql_ins_velocsem_ult
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sql_ins_velocsem_ult`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_sql_ins_velocsem_ult` AS SELECT top100
, v.ano
, v.numsemestre
, v.nummes
, v.numsemana
, v.codtienda
, v.scannerbalanza
, v.codcajero
, v.cajero
, v.itemxmin
, v.trx
, v.item_pos
, v.item_terminal
, v.rangovelocidad
, v.mespermanencia
, v.permanencia
FROM velocidad_semanal v inner join vs1_t_sem_ultsem t
#where v.ano=t.ano and v.numsemana=t.numsemana 
where v.ano=2017 and v.numsemana in (15,16) ;


-- Volcando estructura para vista reports.vs_sql_planilla
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sql_planilla`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_sql_planilla` AS SELECT  ANO, MES, COD, UNIDAD
, PUESTO, PLLA, CODIGO, COLABORADOR
, DOC, NUMDOC, FE_NACI, SEX, FE_INGR
, FE_INGR_ULTIMO, FE_CESE, COD_MOD, 
 MODALIDAD, TI_SITU, fechaactualizacion
FROM planilla ;


-- Volcando estructura para vista reports.vs_sql_tiempo
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_sql_tiempo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_sql_tiempo` AS select * from tiempo ;


-- Volcando estructura para vista reports.vs_trxtipo_mensual
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_trxtipo_mensual`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_trxtipo_mensual` AS select tt.fecha, date_format(tt.fecha, '%Y') as anogregoriano ,
 fun_nommes(date_format(tt.fecha, '%m')) as mesgregoriano , t.ano, fun_nommes(t.nummes)as  mes,
 concat(fun_nommes(t.nummes) , '-' , SUBSTRING(t.ano, 3, 2) ) AS mes_ano_corto,
 t.numsemana, tt.codtienda, 
tt.nomtienda, tt.codtipotransaccion, tt.tipotransaccion, tt.trx, tt.Cant_Articulos,
tt.lineasticket, tt.montoventa, tt.montoventasin 
from trxtipoventa tt inner join tiempo t on tt.fecha=t.fecha  
where t.ano in (2016,2017) ;


-- Volcando estructura para vista reports.vs_velocidad_semanal
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_velocidad_semanal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_velocidad_semanal` AS select 
CASE WHEN v.top100 > 100 THEN NULL 
	ELSE v.top100 END AS top100, 
	v.ano, v.numsemestre, 
concat( v.ano , ' - ' , v.nummes )  AS ano_mes, 
concat(fun_nommes(v.nummes) , '-' , SUBSTRING(v.ano, 3, 2) ) AS mes_ano_corto,
 v.nummes, v.numsemana, concat( 'Sem ' , v.numsemana)  AS semana, 
concat(v.ano  , ' - Sem ' , v.numsemana)  AS semana_ano, v.codtienda, t.nomtienda, 
concat(v.codtienda , ' - ' , t.nomtienda) AS tiendas, v.scannerbalanza, t.formato, t.zona, v.codcajero, v.cajero, p.COLABORADOR, p.PLLA, 
p.TI_SITU, ROUND(v.itemxmin, 4) AS itemxmin, 
v.trx, v.item_pos, v.item_terminal, v.rangovelocidad, v.mespermanencia, v.permanencia
FROM   velocidad_semanal AS v INNER JOIN
       tienda AS t ON v.codtienda = t.codtienda LEFT OUTER JOIN
       planilla AS p ON p.CODIGO = v.codcajero
where v.ano in (2016,2017) ;


-- Volcando estructura para vista reports.vs_ventaxhora
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_ventaxhora`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vs_ventaxhora` AS select * from ventahoy ;


-- Volcando estructura para vista reports.vs_ventaxhora_garantia
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_ventaxhora_garantia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` VIEW `vs_ventaxhora_garantia` AS select td.codtienda, td.correoenvio from tienda_distribucion_garantiavxh td inner join tiendaventa t
on t.codtienda=td.codtienda
where t.estado=1 ;


-- Volcando estructura para vista reports.vs_ventaxhora_producto
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_ventaxhora_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_ventaxhora_producto` AS select * from ventahoraproductohoy ;


-- Volcando estructura para vista reports.vs_vxh_distribucion_gerentegeneral
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_vxh_distribucion_gerentegeneral`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_vxh_distribucion_gerentegeneral` AS select id, nombre, activo, 
 correo_to, correo_cc, correo_cco, 
 cuerpomensaje, piemensaje, hora
 from vxh_listadistribucion inner join hora 
 where hora not in(0,1,2,3,4,5,6,7,8) and id=3 and activo=1
 and hora =time_format(curtime(),'%k') ;


-- Volcando estructura para vista reports.vs_vxh_distribucion_gerentetienda
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_vxh_distribucion_gerentetienda`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_vxh_distribucion_gerentetienda` AS select id, nombre, activo, 
 correo_to, correo_cc, correo_cco, 
 cuerpomensaje, piemensaje, hora
  from vxh_listadistribucion inner join hora 
 where hora not in(0,1,2,3,4,5,6,7,8) and id=1 and activo=1
 and hora =time_format(curtime(),'%k') ;


-- Volcando estructura para vista reports.vs_vxh_distribucion_operadoressi
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_vxh_distribucion_operadoressi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_vxh_distribucion_operadoressi` AS select id, nombre, activo, 
 correo_to, correo_cc, correo_cco, 
 cuerpomensaje, piemensaje, hora 
 from vxh_listadistribucion inner join hora 
 where hora not in(0,1,2,3,4,5,6,7,8) and id=2 and activo=1
 and hora =time_format(curtime(),'%k') ;


-- Volcando estructura para vista reports.vs_vxh_envio_gerentetienda
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_vxh_envio_gerentetienda`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_vxh_envio_gerentetienda` AS (
select fecha, codtienda, nomtienda, nomtiendacorto, 
round(sum(ventasinigv),0) venta,  round(sum(montoplanventa),0) as cuota,
round((sum(ventasinigv)/sum(montoplanventa)),2) as porcentaje,
round(sum(ventahora),0) as vxh, 
ifnull(round((sum(if(coddivision='J01', ventasinigv, 0))/sum(if(coddivision='J01', montoplanventa, 0))),3),0.0) as 'J01',
ifnull(round((sum(if(coddivision='J02', ventasinigv, 0))/sum(if(coddivision='J02', montoplanventa, 0))),3),0.0) as 'J02',
ifnull(round((sum(if(coddivision='J03', ventasinigv, 0))/sum(if(coddivision='J03', montoplanventa, 0))),3),0.0) as 'J03',
ifnull(round((sum(if(coddivision='J04', ventasinigv, 0))/sum(if(coddivision='J04', montoplanventa, 0))),3),0.0) as 'J04',
ifnull(round((sum(if(coddivision='J05', ventasinigv, 0))/sum(if(coddivision='J05', montoplanventa, 0))),3),0.0) as 'J05',
ifnull(round((sum(if(coddivision='J06', ventasinigv, 0))/sum(if(coddivision='J06', montoplanventa, 0))),3),0.0) as 'J06',
ifnull(round((sum(if(coddivision='J07', ventasinigv, 0))/sum(if(coddivision='J07', montoplanventa, 0))),3),0.0) as 'J07',
ifnull(round((sum(if(coddivision='J08', ventasinigv, 0))/sum(if(coddivision='J08', montoplanventa, 0))),3),0.0) as 'J08',
ifnull(round((sum(if(coddivision='J09', ventasinigv, 0))/sum(if(coddivision='J09', montoplanventa, 0))),3),0.0) as 'J09',
ifnull(round((sum(if(coddivision='J10', ventasinigv, 0))/sum(if(coddivision='J10', montoplanventa, 0))),3),0.0) as 'J10',
ifnull(round((sum(if(coddivision='J11', ventasinigv, 0))/sum(if(coddivision='J11', montoplanventa, 0))),3),0.0) as 'J11'

    from ventahoraproductohoy
group by codtienda
)
union all
(
select fecha,'', '', 'Ttk', 
round(sum(ventasinigv)/1000,0) venta,  round(sum(montoplanventa)/1000,0) as cuota,
round((sum(ventasinigv)/sum(montoplanventa)),2) as porcentaje,
round(sum(ventahora)/1000,0) as vxh, 
ifnull(round((sum(if(coddivision='J01', ventasinigv, 0))/sum(if(coddivision='J01', montoplanventa, 0))),3),0.0) as 'J01',
ifnull(round((sum(if(coddivision='J02', ventasinigv, 0))/sum(if(coddivision='J02', montoplanventa, 0))),3),0.0) as 'J02',
ifnull(round((sum(if(coddivision='J03', ventasinigv, 0))/sum(if(coddivision='J03', montoplanventa, 0))),3),0.0) as 'J03',
ifnull(round((sum(if(coddivision='J04', ventasinigv, 0))/sum(if(coddivision='J04', montoplanventa, 0))),3),0.0) as 'J04',
ifnull(round((sum(if(coddivision='J05', ventasinigv, 0))/sum(if(coddivision='J05', montoplanventa, 0))),3),0.0) as 'J05',
ifnull(round((sum(if(coddivision='J06', ventasinigv, 0))/sum(if(coddivision='J06', montoplanventa, 0))),3),0.0) as 'J06',
ifnull(round((sum(if(coddivision='J07', ventasinigv, 0))/sum(if(coddivision='J07', montoplanventa, 0))),3),0.0) as 'J07',
ifnull(round((sum(if(coddivision='J08', ventasinigv, 0))/sum(if(coddivision='J08', montoplanventa, 0))),3),0.0) as 'J08',
ifnull(round((sum(if(coddivision='J09', ventasinigv, 0))/sum(if(coddivision='J09', montoplanventa, 0))),3),0.0) as 'J09',
ifnull(round((sum(if(coddivision='J10', ventasinigv, 0))/sum(if(coddivision='J10', montoplanventa, 0))),3),0.0) as 'J10',
ifnull(round((sum(if(coddivision='J11', ventasinigv, 0))/sum(if(coddivision='J11', montoplanventa, 0))),3),0.0) as 'J11'

    from ventahoraproductohoy
) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
