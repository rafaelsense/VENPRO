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
  `fecha` datetime DEFAULT NULL,
  `cod_tienda` bigint(20) DEFAULT NULL,
  `local_desc` varchar(22) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(23) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ean` bigint(20) DEFAULT NULL,
  `sku` bigint(20) DEFAULT NULL,
  `sku_desc` varchar(43) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` bigint(20) DEFAULT NULL,
  `trx` bigint(20) DEFAULT NULL,
  `marca_Descuento_Manual` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca_OVERRIDE` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad_de_Item_Ticket` bigint(20) DEFAULT NULL,
  `monto_de_Descuento_o_Rebaja` double DEFAULT NULL,
  `monto_de_Item_con_IVA` double DEFAULT NULL,
  `precio_Pos` double DEFAULT NULL,
  `precio_unitario_Pos` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.capoyo
CREATE TABLE IF NOT EXISTS `capoyo` (
  `ano` int(11) NOT NULL,
  `nummes` int(11) NOT NULL,
  `codtrabajador` bigint(20) NOT NULL,
  `trabajador` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codtipolabor` int(11) NOT NULL,
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


-- Volcando estructura para tabla reports.digitados
CREATE TABLE IF NOT EXISTS `digitados` (
  `ano` int(11) DEFAULT NULL,
  `numsemestre` int(11) DEFAULT NULL,
  `nummes` int(11) DEFAULT NULL,
  `numsemana` int(11) DEFAULT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` int(11) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `cantproduc` decimal(29,2) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.digitados_diario
CREATE TABLE IF NOT EXISTS `digitados_diario` (
  `fecha` date NOT NULL,
  `codtienda` int(11) NOT NULL,
  `nomtienda` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codcajero` bigint(20) NOT NULL,
  `cajero` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` int(11) NOT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `cantproduc` decimal(29,2) DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla reports.digitado_nuevo
CREATE TABLE IF NOT EXISTS `digitado_nuevo` (
  `Diaanalisis` date NOT NULL,
  `Semanacanalisis` int(11) DEFAULT NULL,
  `Localanalisis` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Local` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Division` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clase` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cod_Cajero` int(11) NOT NULL,
  `Cajero` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Sku(Producto)` int(20) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Digitados_SKU` int(10) DEFAULT NULL,
  `Escaneado_SKU` int(10) DEFAULT NULL,
  `Lineas_Ticket` int(10) DEFAULT NULL
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
CREATE TABLE `vs_cp_datos_ayer_17` 
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
CREATE DEFINER=`dba`@`%` VIEW `vs_cp_datos_ayer_17` AS SELECT * from cambio_precio_2017 ;


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
where v.ano=t.ano and v.numsemana=t.numsemana 
#where v.ano=2017 and v.numsemana in (6,7,8) ;


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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
