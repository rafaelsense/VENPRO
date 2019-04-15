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

-- Volcando estructura para tabla reports.cambiopreciolinea
CREATE TABLE IF NOT EXISTS `cambiopreciolinea` (
  `llavetrx` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `caja` int(11) NOT NULL,
  `trx` int(11) NOT NULL,
  `hora` int(11) NOT NULL,
  `horahhmmss` time DEFAULT NULL,
  `codcajerocaja` int(11) DEFAULT NULL,
  `plu` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipodescuento` int(11) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precioant` decimal(18,4) DEFAULT NULL,
  `precionuevo` decimal(18,4) DEFAULT NULL,
  `montoDescuento` decimal(18,4) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `codsupervisorcaja` int(11) DEFAULT NULL,
  `llavesupervisor` bigint(20) DEFAULT NULL,
  `codsupervisor` bigint(20) DEFAULT NULL,
  `nomsupervisor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cambioprecio_resum_sem
CREATE TABLE IF NOT EXISTS `cambioprecio_resum_sem` (
  `ano` int(11) NOT NULL,
  `numsemestre` int(11) NOT NULL,
  `nummes` int(11) NOT NULL,
  `numsemana` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cambioprecio` decimal(20,4) NOT NULL,
  `totlineasticket` decimal(20,4) NOT NULL,
  PRIMARY KEY (`fecha`,`codtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cambioprecio_semanal
CREATE TABLE IF NOT EXISTS `cambioprecio_semanal` (
  `fecha` date NOT NULL,
  `ano` int(11) NOT NULL,
  `numsemestre` int(11) NOT NULL,
  `nummes` int(11) NOT NULL,
  `numsemana` int(11) NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codunidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ean` bigint(40) NOT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `codestado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `trx` int(11) NOT NULL,
  `codtipotransaccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantarticulo` decimal(20,4) NOT NULL,
  `tipocambioprecio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `articulocp` decimal(20,4) NOT NULL,
  `montorebaja` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`fecha`,`codtienda`,`sku`,`pos`,`trx`,`tipocambioprecio`,`codtipotransaccion`,`cantarticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cambio_precio_2017
CREATE TABLE IF NOT EXISTS `cambio_precio_2017` (
  `Fecha` date DEFAULT NULL,
  `codtienda` bigint(20) DEFAULT NULL,
  `Desc_tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Division` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Departamento` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Subdepartamento` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clase` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ean_id` bigint(20) DEFAULT NULL,
  `Sku_cod` bigint(20) DEFAULT NULL,
  `Sku_desc` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Codestado` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pos` bigint(20) DEFAULT NULL,
  `Trx` bigint(20) DEFAULT NULL,
  `Cajero_id` bigint(20) DEFAULT NULL,
  `Cajero_desc` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cajero_cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Marca_desc` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Marca_over` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sup_cod` bigint(20) DEFAULT NULL,
  `Sup_desc` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sup_num4` bigint(20) DEFAULT NULL,
  `Cantidad_de_Item_Ticket` bigint(20) DEFAULT NULL,
  `Monto_rebaja` decimal(20,4) DEFAULT NULL,
  `Monto_item_con_iva` decimal(20,4) DEFAULT NULL,
  `Precio_pos` decimal(20,4) DEFAULT NULL,
  `Precio_unitario_pos` decimal(20,4) DEFAULT NULL,
  `Cantidad_de_Segundos_Entre_Timb` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.capoyo
CREATE TABLE IF NOT EXISTS `capoyo` (
  `ano` int(11) NOT NULL,
  `nummes` int(11) NOT NULL,
  `codtienda` bigint(20) DEFAULT NULL,
  `codtrabajador` bigint(20) NOT NULL,
  `trabajador` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motivoarea` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipolabor` int(11) NOT NULL,
  `aplicabonosupervisorscorecard` bit(1) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL,
  KEY `FK_capoyo_ctipolabor` (`codtipolabor`),
  CONSTRAINT `FK_capoyo_ctipolabor` FOREIGN KEY (`codtipolabor`) REFERENCES `ctipolabor` (`codlabor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cduracionbloqueo
CREATE TABLE IF NOT EXISTS `cduracionbloqueo` (
  `fecha` date NOT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bloqueoHHmmss` time DEFAULT NULL,
  `desbloqueoHHmmss` time DEFAULT NULL,
  `duracionHHmmss` time DEFAULT NULL,
  `bloqueoHHmm` time DEFAULT NULL,
  `desbloqueoHHmm` time DEFAULT NULL,
  `duracionHHmm` time DEFAULT NULL,
  `duracionb100` decimal(10,4) DEFAULT NULL,
  `horasbloqueo` decimal(10,4) DEFAULT NULL,
  `bloqueos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cduracionpos
CREATE TABLE IF NOT EXISTS `cduracionpos` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `pos` int(11) DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `loginHHmmss` time DEFAULT NULL,
  `logoutHHmmss` time DEFAULT NULL,
  `duracionHHmmss` time DEFAULT NULL,
  `loginHHmm` time DEFAULT NULL,
  `logoutHHmm` time DEFAULT NULL,
  `duracionHHmm` time DEFAULT NULL,
  `duracionb100` decimal(10,4) DEFAULT NULL,
  `horaspos` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.clientenoreconocido
CREATE TABLE IF NOT EXISTS `clientenoreconocido` (
  `fecha` date NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `codtipotransaccion` bigint(20) DEFAULT NULL,
  `tipotransaccion` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` bigint(20) NOT NULL,
  `trx` bigint(20) NOT NULL,
  `codtender` bigint(20) DEFAULT NULL,
  `tender` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bintarj` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numtarj` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `montoventa` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cmarcas
CREATE TABLE IF NOT EXISTS `cmarcas` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `planilla` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `seccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtrabajador` bigint(20) NOT NULL,
  `trabajador` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inicioteorico` time DEFAULT NULL,
  `finteorico` time DEFAULT NULL,
  `inicioreal` time DEFAULT NULL,
  `finreal` time DEFAULT NULL,
  `tipomarcacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destipomarcacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.comedor_diario
CREATE TABLE IF NOT EXISTS `comedor_diario` (
  `fecha` date NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codtipoterminal` bigint(20) DEFAULT NULL,
  `tipoterminal` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` bigint(20) NOT NULL,
  `trx` bigint(20) NOT NULL,
  `tcnumero` decimal(20,0) DEFAULT NULL,
  `codtipocliente` bigint(20) DEFAULT NULL,
  `tipocliente` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `ean` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `cantarticulo` decimal(20,4) NOT NULL,
  `montoventa` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.conectividad
CREATE TABLE IF NOT EXISTS `conectividad` (
  `fecha` date NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `numsemestre` int(11) DEFAULT NULL,
  `nummes` int(11) DEFAULT NULL,
  `numsemana` int(11) DEFAULT NULL,
  `codtienda` int(11) NOT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipocajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `seccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtrabajador` bigint(20) NOT NULL,
  `trabajador` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inicioteorico` time DEFAULT NULL,
  `finteorico` time DEFAULT NULL,
  `inicioreal` time DEFAULT NULL,
  `finreal` time DEFAULT NULL,
  `tipomarcacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destipomarcacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `horamarca` decimal(10,4) DEFAULT NULL,
  `horamarcar` decimal(10,4) DEFAULT NULL,
  `ratio` decimal(10,4) DEFAULT NULL,
  `horaspos` decimal(10,4) DEFAULT NULL,
  `horasbloqueo` decimal(10,4) DEFAULT NULL,
  `horaefectivapos` decimal(10,4) DEFAULT NULL,
  `bloqueos` int(11) DEFAULT NULL,
  `canttrx` decimal(10,4) DEFAULT NULL,
  `monto` decimal(10,4) DEFAULT NULL,
  `conexion` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipolabor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.conexionpos_trx
CREATE TABLE IF NOT EXISTS `conexionpos_trx` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `trx` int(11) DEFAULT NULL,
  `codcajero` int(11) DEFAULT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `horainitrx` time DEFAULT NULL,
  `horafintrx` time DEFAULT NULL,
  `codtipotransaccion` int(11) DEFAULT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `canttrx` int(11) DEFAULT NULL,
  `montoventa` decimal(20,4) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cresumenpos
CREATE TABLE IF NOT EXISTS `cresumenpos` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `codcajero` int(11) NOT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `horaspos` decimal(10,4) DEFAULT NULL,
  `horasbloqueo` decimal(10,4) DEFAULT NULL,
  `horaefectivapos` decimal(10,4) DEFAULT NULL,
  `bloqueos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ctipolabor
CREATE TABLE IF NOT EXISTS `ctipolabor` (
  `codlabor` int(11) NOT NULL,
  `nomlabor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codlabor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cuotasventa
CREATE TABLE IF NOT EXISTS `cuotasventa` (
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mesid` bigint(20) DEFAULT NULL,
  `fecha` date NOT NULL,
  `montoplanventa` decimal(20,4) NOT NULL,
  PRIMARY KEY (`codtienda`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cuotasventadepart
CREATE TABLE IF NOT EXISTS `cuotasventadepart` (
  `codtienda` bigint(20) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mesid` bigint(20) DEFAULT NULL,
  `fecha` date NOT NULL,
  `codpart` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `depart` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `montoplanventa` decimal(24,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.cventapos
CREATE TABLE IF NOT EXISTS `cventapos` (
  `fecha` date NOT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `codcajero` int(11) NOT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `canttrx` decimal(20,4) DEFAULT NULL,
  `monto` decimal(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.depart
CREATE TABLE IF NOT EXISTS `depart` (
  `iddivision` bigint(20) NOT NULL,
  `coddivision` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iddepart` bigint(20) NOT NULL,
  `coddepart` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`iddivision`,`iddepart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.digitados
IF NOT EXISTS ;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.digitados_diario
CREATE TABLE IF NOT EXISTS `digitados_diario` (
  `fecha` date NOT NULL,
  `Sem` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Local_COD` bigint(20) NOT NULL,
  `Local_DESC` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Division` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clase` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cajero_ID` bigint(20) NOT NULL,
  `Cajero_DESC` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ean_ID` bigint(20) DEFAULT NULL,
  `Sku_COD` bigint(20) NOT NULL,
  `Sku_DESC` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UM_COD` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UM_Descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Digitados_SKU` bigint(20) DEFAULT NULL,
  `Escaneado_SKU` bigint(20) DEFAULT NULL,
  `Lineas_Ticket` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fecha`,`Local_COD`,`Cajero_ID`,`Sku_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.dsctomanual_diario
CREATE TABLE IF NOT EXISTS `dsctomanual_diario` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codunidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ean` bigint(40) NOT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `codestado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) DEFAULT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `trx` bigint(20) NOT NULL,
  `codtipotransaccion` bigint(20) DEFAULT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codrebaja` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomrebaja` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `preciovigente` decimal(20,4) DEFAULT NULL,
  `codvendedor` bigint(20) DEFAULT NULL,
  `vendedor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidadvtadscto` decimal(20,4) NOT NULL,
  `montorebaja` decimal(20,4) DEFAULT NULL,
  `montoventadscto` decimal(20,4) DEFAULT NULL,
  `montoventa` decimal(20,4) NOT NULL,
  PRIMARY KEY (`fecha`,`codtienda`,`sku`,`pos`,`trx`,`montoventa`,`unidadvtadscto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `codigo` bigint(20) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `cargo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `area` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `seccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `disponibilidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaingreso` date NOT NULL,
  `fechasalida` date DEFAULT NULL,
  `tiendalaboral` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.eventosfueradia
CREATE TABLE IF NOT EXISTS `eventosfueradia` (
  `PRC_HDR_NUMBER` bigint(20) DEFAULT NULL,
  `PRC_HDR_NAME` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PRC_HDR_FROM_DATE` datetime DEFAULT NULL,
  `PRC_HDR_TO_DATE` datetime DEFAULT NULL,
  `PRC_STATUS` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FECHA_LIBERACION` datetime DEFAULT NULL,
  `USER` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTATUS_FINAL` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PRIORIDAD` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CANTIDAD` bigint(20) DEFAULT NULL,
  `tipopricing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.hora
CREATE TABLE IF NOT EXISTS `hora` (
  `hora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.infocashier
CREATE TABLE IF NOT EXISTS `infocashier` (
  `fechareg` date NOT NULL,
  `llave` bigint(20) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `Tail_NumCajero` bigint(20) NOT NULL,
  `CashierID` bigint(20) DEFAULT NULL,
  `CashierName` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`llave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.llamadas
CREATE TABLE IF NOT EXISTS `llamadas` (
  `Fecha_Emision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Zona` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Turno` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Origen_Requerimiento` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tienda` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Grupo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Requerimiento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pos` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Problemas_Observacioens` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Respon_ini` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Respon_fin` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tiempo_Respuesta` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sem` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Mes` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Año` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Atencion_Geo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formato` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Local_desc` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dia_sem` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Prov_Pos` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tipo_Operador` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.masterplu
CREATE TABLE IF NOT EXISTS `masterplu` (
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `plu` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `pludescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoplu` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`sku`,`plu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.masterproducto
CREATE TABLE IF NOT EXISTS `masterproducto` (
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subclase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codestilo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estilo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `ean` bigint(20) NOT NULL,
  `codmarca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codestado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipoproducto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoproducto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codunidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechareg` date NOT NULL,
  PRIMARY KEY (`sku`,`ean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.masterproducto_plu
CREATE TABLE IF NOT EXISTS `masterproducto_plu` (
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subclase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codestilo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estilo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `ean` bigint(20) NOT NULL,
  `codmarca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codestado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipoproducto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoproducto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codunidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechareg` date DEFAULT NULL,
  PRIMARY KEY (`sku`,`ean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.motivodsctoweb
CREATE TABLE IF NOT EXISTS `motivodsctoweb` (
  `codmotivodscto` int(11) NOT NULL,
  `nommotivodscto` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.op_regcasoproveedor_web
CREATE TABLE IF NOT EXISTS `op_regcasoproveedor_web` (
  `idregcasoproveedor` bigint(20) NOT NULL,
  `caso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `codempleadousuario` bigint(20) DEFAULT NULL,
  `cargousuario` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreusuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamentousuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechacaso` date DEFAULT NULL,
  `terminal` int(11) DEFAULT NULL,
  `idproveedor` bigint(20) DEFAULT NULL,
  `idequipo` bigint(20) DEFAULT NULL,
  `idmarca` bigint(20) DEFAULT NULL,
  `idproblema` bigint(20) DEFAULT NULL,
  `numeroserie` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcionproblema` mediumtext COLLATE utf8_spanish_ci,
  `estadoequipo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idestadocaso` bigint(20) DEFAULT NULL,
  `idrespuestacierrecaso` bigint(20) DEFAULT NULL,
  `fechacierrecaso` date DEFAULT NULL,
  `costoaccesorio` decimal(20,3) DEFAULT NULL,
  `codempleado_op_ini` bigint(20) DEFAULT NULL,
  `op_ini` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codempleado_op_fin` bigint(20) DEFAULT NULL,
  `op_fin` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempoatencion` int(11) DEFAULT NULL,
  `semregcaso` int(11) DEFAULT NULL,
  `mesregcaso` int(11) DEFAULT NULL,
  `anoregcaso` int(11) DEFAULT NULL,
  `diasemregcaso` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechareg` datetime NOT NULL,
  `usureg` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hostreg` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaultmod` datetime DEFAULT NULL,
  `usuultmod` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hostultmod` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `equipo` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `problema` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadocaso` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `respuestacierrecaso` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomtienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `formato` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ubicaciongeografica` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zonamonitoreo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idregcasoproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.override
CREATE TABLE IF NOT EXISTS `override` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codclase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clase` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codunidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ean` bigint(40) NOT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `codestado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pos` bigint(20) NOT NULL,
  `trx` bigint(20) NOT NULL,
  `codtipotransaccion` bigint(20) NOT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `flagoverride` int(11) DEFAULT NULL,
  `flagcambioprecio` int(11) NOT NULL,
  `cantarticulo` decimal(20,4) NOT NULL,
  `montoventa` decimal(20,4) NOT NULL,
  PRIMARY KEY (`fecha`,`codtienda`,`sku`,`pos`,`trx`,`flagcambioprecio`,`cantarticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.planilla
CREATE TABLE IF NOT EXISTS `planilla` (
  `ANO` int(11) DEFAULT NULL,
  `MES` int(11) DEFAULT NULL,
  `COD` int(11) NOT NULL,
  `UNIDAD` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `PUESTO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PLLA` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CODIGO` bigint(20) NOT NULL,
  `COLABORADOR` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `DOC` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NUMDOC` bigint(20) DEFAULT NULL,
  `FE_NACI` date DEFAULT NULL,
  `SEX` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FE_INGR` date NOT NULL,
  `FE_INGR_ULTIMO` date DEFAULT NULL,
  `FE_CESE` date DEFAULT NULL,
  `COD_MOD` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MODALIDAD` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TI_SITU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.planilla_tmp
CREATE TABLE IF NOT EXISTS `planilla_tmp` (
  `ANO` int(11) DEFAULT NULL,
  `MES` int(11) DEFAULT NULL,
  `COD` int(11) DEFAULT NULL,
  `UNIDAD` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `PUESTO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PLLA` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CODIGO` bigint(20) NOT NULL,
  `COLABORADOR` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DOC` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NUMDOC` bigint(20) DEFAULT NULL,
  `FE_NACI` date DEFAULT NULL,
  `SEX` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FE_INGR` date DEFAULT NULL,
  `FE_INGR_ULTIMO` date DEFAULT NULL,
  `FE_CESE` date DEFAULT NULL,
  `COD_MOD` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MODALIDAD` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TI_SITU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.pre_productividad
CREATE TABLE IF NOT EXISTS `pre_productividad` (
  `tipotrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `tienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `trx` int(11) NOT NULL,
  `codcajero` int(11) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `codtipotransaccion` int(11) NOT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.productomenorafecto
CREATE TABLE IF NOT EXISTS `productomenorafecto` (
  `fecha` date NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pos` bigint(20) NOT NULL,
  `trx` bigint(20) NOT NULL,
  `sku` bigint(20) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ean` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `unidades` decimal(20,4) NOT NULL,
  `montoventa` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `Caso` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Proveedor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Zonas` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tienda` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre_Usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha_Requerimiento` date DEFAULT NULL,
  `Marca` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pos` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Grupo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Requerimiento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Serie` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Observaciones_Probl_Sol` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Operativo` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Estado` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Solucion_Final` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha_Respuesta` date DEFAULT NULL,
  `Responsable_Ini` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Responsable_Fin` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dias_Trascurridos` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Semana` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Mes` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ano` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Atencion_Geo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formato` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nom_Tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dia_Sem` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dia_Sem2` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Marca_Pos` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ano_Apert` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pos_cant` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Columna_Integral` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Zonal` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.regcambioprecioweb
CREATE TABLE IF NOT EXISTS `regcambioprecioweb` (
  `login_reg` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcambioprecio` bigint(20) DEFAULT NULL,
  `fechareg` datetime DEFAULT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `nomtienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomsupervisor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `trx` int(11) DEFAULT NULL,
  `ean` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` bigint(20) DEFAULT NULL,
  `skudescrip` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdepartamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidades` decimal(18,2) DEFAULT NULL,
  `preciovigente` decimal(18,2) DEFAULT NULL,
  `montorebaja` decimal(18,2) DEFAULT NULL,
  `ventadscto` decimal(18,2) DEFAULT NULL,
  `nomautorizacion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigomotivodscto` int(11) DEFAULT NULL,
  `fechamodificacion` datetime DEFAULT NULL,
  `login_mod` text COLLATE utf8_spanish_ci,
  `observacion` text COLLATE utf8_spanish_ci,
  `fechasuceso` datetime DEFAULT NULL,
  `horasuceso` datetime DEFAULT NULL,
  `observacionarea` text COLLATE utf8_spanish_ci,
  `login_mod_area` text COLLATE utf8_spanish_ci,
  `fechamodificacionarea` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.registro_web
CREATE TABLE IF NOT EXISTS `registro_web` (
  `ano` int(4) DEFAULT NULL,
  `mes` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `codtienda` int(3) DEFAULT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `supervisor` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(3) DEFAULT NULL,
  `trx` int(5) DEFAULT NULL,
  `ean` int(20) DEFAULT NULL,
  `sku` int(10) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `area` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `area_desc` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdepartamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidades` int(5) DEFAULT NULL,
  `precio_vigente` decimal(10,2) DEFAULT NULL,
  `monto_rebaja` decimal(10,2) DEFAULT NULL,
  `venta_post_desc` decimal(10,2) DEFAULT NULL,
  `nom_autorizador` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observacion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observacion_area` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_mod_area` date DEFAULT NULL,
  `motivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.sc_empleadocaja
CREATE TABLE IF NOT EXISTS `sc_empleadocaja` (
  `ANO` int(11) NOT NULL,
  `MES` int(11) NOT NULL,
  `UNI` bigint(20) NOT NULL,
  `UNIDAD` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PLLA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SECCION` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PUESTO` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CODIGO` bigint(20) NOT NULL,
  `AP_PATERNO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AP_MATERNO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `COLABORADOR` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO_DOC` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NUMERO_DOC` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FE_NACI` date DEFAULT NULL,
  `SEXO` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FE_INGR` date DEFAULT NULL,
  `FE_CESE` date DEFAULT NULL,
  `DE_MOTI_SEPA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `OBSERVACIONES` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTADO` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ANO`,`MES`,`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.sc_empleadocajarotacion
CREATE TABLE IF NOT EXISTS `sc_empleadocajarotacion` (
  `ano` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `uni` bigint(20) NOT NULL,
  `unidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `puesto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `plla` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` bigint(20) NOT NULL,
  `colaborador` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_doc` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero_doc` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fe_naci` date DEFAULT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fe_ingr` date DEFAULT NULL,
  `fe_cese` date DEFAULT NULL,
  `cod_mod` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `de_moti_sepa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ano`,`mes`,`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.sc_rotacion
CREATE TABLE IF NOT EXISTS `sc_rotacion` (
  `codtienda` bigint(20) NOT NULL,
  `tienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rotacion` decimal(26,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.sc_tipocese_rotacion
CREATE TABLE IF NOT EXISTS `sc_tipocese_rotacion` (
  `COD_MOD` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `MODALIDAD` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ROTACION` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`COD_MOD`),
  UNIQUE KEY `MODALIDAD` (`MODALIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tiempo
CREATE TABLE IF NOT EXISTS `tiempo` (
  `fecha` date NOT NULL,
  `numsemana` int(11) NOT NULL,
  `nummes` int(11) NOT NULL,
  `numsemestre` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  PRIMARY KEY (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tienda
CREATE TABLE IF NOT EXISTS `tienda` (
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `formato` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `scanner` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zona` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaapertura` date DEFAULT NULL,
  `nummesapertura` int(11) DEFAULT NULL,
  `anoapertura` int(11) DEFAULT NULL,
  `nomcomercial` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tiendaventa
CREATE TABLE IF NOT EXISTS `tiendaventa` (
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomtiendacorto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `formato` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcomercial` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empresa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `igv` decimal(20,2) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tienda_distribucion_garantiavxh
CREATE TABLE IF NOT EXISTS `tienda_distribucion_garantiavxh` (
  `codtienda` bigint(20) NOT NULL,
  `correoenvio` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tipo_llamada
CREATE TABLE IF NOT EXISTS `tipo_llamada` (
  `Grupo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Requerimiento` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tipo_proveedor
CREATE TABLE IF NOT EXISTS `tipo_proveedor` (
  `Grupo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Requerimiento` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.tmp_tipoterminal
CREATE TABLE IF NOT EXISTS `tmp_tipoterminal` (
  `codtienda` bigint(20) NOT NULL,
  `nomtienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `codtipoterminal` int(11) NOT NULL,
  `tipoterminal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codtienda`,`pos`,`codtipoterminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.trxs
CREATE TABLE IF NOT EXISTS `trxs` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `tienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `canttrx` bigint(20) NOT NULL,
  `Cant_Articulos` decimal(10,0) NOT NULL,
  `lineasticket` decimal(20,4) NOT NULL,
  `montoventa` decimal(20,4) NOT NULL,
  `montoventasin` decimal(20,4) NOT NULL,
  `cantcajas` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`fecha`,`codtienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.trxs_r200
CREATE TABLE IF NOT EXISTS `trxs_r200` (
  `fecha` date NOT NULL,
  `codtienda` int(10) NOT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `montoventa` decimal(10,3) NOT NULL,
  `montoventasin` decimal(10,3) NOT NULL,
  `canttrx` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.trxtipoventa
CREATE TABLE IF NOT EXISTS `trxtipoventa` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codtipotransaccion` int(11) NOT NULL,
  `tipotransaccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `trx` bigint(20) NOT NULL,
  `Cant_Articulos` decimal(24,4) NOT NULL,
  `lineasticket` decimal(24,4) NOT NULL,
  `montoventa` decimal(24,4) NOT NULL,
  `montoventasin` decimal(24,4) NOT NULL,
  PRIMARY KEY (`fecha`,`codtienda`,`codtipotransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.velocidad_diario
CREATE TABLE IF NOT EXISTS `velocidad_diario` (
  `top100` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `numsemestre` int(11) DEFAULT NULL,
  `nummes` int(11) DEFAULT NULL,
  `numsemana` int(11) DEFAULT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `scannerbalanza` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) DEFAULT NULL,
  `cajero` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `itemxmin` decimal(29,8) DEFAULT NULL,
  `trx` int(11) DEFAULT NULL,
  `rangovelocidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mespermanencia` int(11) DEFAULT NULL,
  `permanencia` decimal(20,6) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.velocidad_semanal
CREATE TABLE IF NOT EXISTS `velocidad_semanal` (
  `top100` int(11) DEFAULT NULL,
  `ano` int(11) NOT NULL,
  `numsemestre` int(11) DEFAULT NULL,
  `nummes` int(11) DEFAULT NULL,
  `numsemana` int(11) NOT NULL,
  `codtienda` int(11) NOT NULL,
  `scannerbalanza` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `itemxmin` decimal(29,8) NOT NULL,
  `trx` int(11) NOT NULL,
  `item_pos` int(11) DEFAULT NULL,
  `item_terminal` int(11) DEFAULT NULL,
  `rangovelocidad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mespermanencia` decimal(20,5) DEFAULT NULL,
  `permanencia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL,
  PRIMARY KEY (`ano`,`numsemana`,`codtienda`,`codcajero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.velocidad_trx
CREATE TABLE IF NOT EXISTS `velocidad_trx` (
  `fecha` date NOT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipotransaccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipoterminal` int(11) DEFAULT NULL,
  `tipoterminal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hhini` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `trx` int(11) DEFAULT NULL,
  `itemxmin` decimal(29,8) DEFAULT NULL,
  `itemxseg` decimal(29,8) DEFAULT NULL,
  `cant_item_pos` int(11) DEFAULT NULL,
  `cant_trx_terminal` int(11) DEFAULT NULL,
  `duracseg_digesc_item` decimal(29,8) DEFAULT NULL,
  `cant_item_terminal` int(11) DEFAULT NULL,
  `duracseg_trx` int(11) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventahoragarantiahoy
CREATE TABLE IF NOT EXISTS `ventahoragarantiahoy` (
  `fechaproceso` date NOT NULL,
  `codigo` bigint(20) NOT NULL,
  `dni` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiendalaboral` bigint(20) DEFAULT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomtiendacorto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `formato` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `codtienda` bigint(20) DEFAULT NULL,
  `codvendedor` bigint(20) DEFAULT NULL,
  `venta` decimal(20,4) DEFAULT NULL,
  `ventasinigv` decimal(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventahoraproducto
CREATE TABLE IF NOT EXISTS `ventahoraproducto` (
  `fecha` date NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `hora` int(11) NOT NULL,
  `iddepart` bigint(20) NOT NULL,
  `idcajero` bigint(20) DEFAULT NULL,
  `codvendedor` bigint(20) DEFAULT NULL,
  `cantidad` decimal(24,4) DEFAULT NULL,
  `venta` decimal(20,4) NOT NULL,
  `ventasinigv` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventahoraproductohoy
CREATE TABLE IF NOT EXISTS `ventahoraproductohoy` (
  `fecha` date DEFAULT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomtiendacorto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `formato` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcomercial` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empresa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `iddivision` bigint(20) DEFAULT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iddepart` bigint(20) DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ventaconigv` decimal(20,4) DEFAULT NULL,
  `ventasinigv` decimal(20,4) DEFAULT NULL,
  `montoplanventa` decimal(20,4) DEFAULT NULL,
  `ventahora` decimal(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventahoy
CREATE TABLE IF NOT EXISTS `ventahoy` (
  `fecha` date DEFAULT NULL,
  `codtienda` int(11) DEFAULT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomtiendacorto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `formato` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nomcomercial` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `empresa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `ventaconigv` decimal(20,4) DEFAULT NULL,
  `ventasinigv` decimal(20,4) DEFAULT NULL,
  `montoplanventa` decimal(20,4) DEFAULT NULL,
  `ventahora` decimal(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventairregular
CREATE TABLE IF NOT EXISTS `ventairregular` (
  `fecha` date NOT NULL,
  `codtienda` bigint(20) NOT NULL,
  `nomtienda` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numerotarjeta` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` bigint(20) DEFAULT NULL,
  `trx` bigint(20) DEFAULT NULL,
  `canttimbrado` bigint(20) DEFAULT NULL,
  `montotarjeta` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.ventashora
CREATE TABLE IF NOT EXISTS `ventashora` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `hora` int(11) NOT NULL,
  `venta` decimal(20,4) NOT NULL,
  PRIMARY KEY (`fecha`,`codtienda`,`hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.vxh_listadistribucion
CREATE TABLE IF NOT EXISTS `vxh_listadistribucion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `activo` bit(1) NOT NULL,
  `correo_to` text COLLATE utf8_spanish_ci,
  `correo_cc` text COLLATE utf8_spanish_ci,
  `correo_cco` text COLLATE utf8_spanish_ci,
  `cuerpomensaje` text COLLATE utf8_spanish_ci,
  `piemensaje` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
