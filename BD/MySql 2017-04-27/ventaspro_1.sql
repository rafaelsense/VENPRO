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

-- Volcando estructura para tabla ventaspro.alert_version
CREATE TABLE IF NOT EXISTS `alert_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Alerta` int(11) DEFAULT NULL,
  `VersionPOS` int(11) DEFAULT NULL,
  `Version` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.cashierfunction
CREATE TABLE IF NOT EXISTS `cashierfunction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Trans_Info3` int(11) DEFAULT NULL,
  `Trans_Info3_cashier_Function` int(11) DEFAULT NULL,
  `FunctionType` int(11) DEFAULT NULL,
  `CashierID` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.delivery_trans
CREATE TABLE IF NOT EXISTS `delivery_trans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Tr_DeliveryF12` int(11) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PLU_Price` bigint(20) DEFAULT NULL,
  `PLU_Qty` int(11) DEFAULT NULL,
  `Delivery_Code` int(11) DEFAULT NULL,
  `Delivery_Type` int(11) DEFAULT NULL,
  `Item_Cancelado` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.discount
CREATE TABLE IF NOT EXISTS `discount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Descuento` int(11) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumDepartamento` int(11) DEFAULT NULL,
  `PromoSPF` int(11) DEFAULT NULL,
  `DescuentoOrden` int(11) DEFAULT NULL,
  `DescuentoItem` int(11) DEFAULT NULL,
  `NumDescuento` int(11) DEFAULT NULL,
  `MontoDescuento` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.enter_secure
CREATE TABLE IF NOT EXISTS `enter_secure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `Log_Enter_Secure` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.exit_secure
CREATE TABLE IF NOT EXISTS `exit_secure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `Log_Exit_Secure` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia1
CREATE TABLE IF NOT EXISTS `extmedia1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Info` int(11) DEFAULT NULL,
  `TndNumber` int(11) DEFAULT NULL,
  `BankNbr` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CheckNbr` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia2
CREATE TABLE IF NOT EXISTS `extmedia2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia2` int(11) DEFAULT NULL,
  `_CMRDep_VISARefNum` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ExpDateCMR` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SeqNum` int(11) DEFAULT NULL,
  `CardType` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia3
CREATE TABLE IF NOT EXISTS `extmedia3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia3` int(11) DEFAULT NULL,
  `EBT_Case_no` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia4
CREATE TABLE IF NOT EXISTS `extmedia4` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia4` int(11) DEFAULT NULL,
  `VISATRID` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EFTCardTypeID` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EFTCardTypeDescription` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EFTTraceNo` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia5
CREATE TABLE IF NOT EXISTS `extmedia5` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia5` int(11) DEFAULT NULL,
  `ID_RUT` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cuotas` int(11) DEFAULT NULL,
  `CodIVR` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Diferido` int(11) DEFAULT NULL,
  `CMROffline` int(11) DEFAULT NULL,
  `EstatusRespuesta` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia6
CREATE TABLE IF NOT EXISTS `extmedia6` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia6` int(11) DEFAULT NULL,
  `CMR_Auth_Code` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia8
CREATE TABLE IF NOT EXISTS `extmedia8` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia8` int(11) DEFAULT NULL,
  `ID_RUT` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cuotas` int(11) DEFAULT NULL,
  `CodIVR` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Diferido` int(11) DEFAULT NULL,
  `CMROffline` int(11) DEFAULT NULL,
  `PhoneRecharge` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia9
CREATE TABLE IF NOT EXISTS `extmedia9` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_ExtMedia9` int(11) DEFAULT NULL,
  `CMR_Auth_Code` bigint(20) DEFAULT NULL,
  `CMRPuntosAmount` int(11) DEFAULT NULL,
  `CMRPuntosEANCode` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.fiscalinfo
CREATE TABLE IF NOT EXISTS `fiscalinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `Info2_Fiscal` int(11) DEFAULT NULL,
  `RUTCajero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumTicketFiscal` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.frame
CREATE TABLE IF NOT EXISTS `frame` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Frame` int(11) DEFAULT NULL,
  `StartofTicket` int(11) DEFAULT NULL,
  `TenderPurchase` int(11) DEFAULT NULL,
  `PostVoid` int(11) DEFAULT NULL,
  `TicketNumber` int(11) DEFAULT NULL,
  `VoidTicketNumber` int(11) DEFAULT NULL,
  `NoSale` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_storenumber
CREATE TABLE IF NOT EXISTS `hook_storenumber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `Store_Number` int(11) DEFAULT NULL,
  `Num_Tienda` int(11) NOT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_taxesitems
CREATE TABLE IF NOT EXISTS `hook_taxesitems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `Item_Taxes` int(11) DEFAULT NULL,
  `PLU_Item_Code` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MontoIgv` int(11) DEFAULT NULL,
  `MontoIsc` int(11) DEFAULT NULL,
  `MontoSrv` int(11) DEFAULT NULL,
  `TasaIgv` int(11) DEFAULT NULL,
  `TasaIsc` int(11) DEFAULT NULL,
  `TasaSrv` int(11) DEFAULT NULL,
  `PLUSeqNo` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_tendertime
CREATE TABLE IF NOT EXISTS `hook_tendertime` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `Tender_Time` int(11) DEFAULT NULL,
  `Tender_No` int(11) DEFAULT NULL,
  `Start_Time` bigint(20) DEFAULT NULL,
  `End_Time` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infoboletaen
CREATE TABLE IF NOT EXISTS `infoboletaen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `BoletaEN` int(11) DEFAULT NULL,
  `Tipo_Boleta_EN` int(11) DEFAULT NULL,
  `Boleta_EN` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infocmrpoints
CREATE TABLE IF NOT EXISTS `infocmrpoints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info3` int(11) DEFAULT NULL,
  `CMRPoints` int(11) DEFAULT NULL,
  `CMR_Points_Item` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CMR_Price` bigint(20) DEFAULT NULL,
  `Disc_CMR` int(11) DEFAULT NULL,
  `Points_Used` int(11) DEFAULT NULL,
  `Money_Used` int(11) DEFAULT NULL,
  `Points_Available` int(11) DEFAULT NULL,
  `CMR_SalesmanID` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infocreditvoucher
CREATE TABLE IF NOT EXISTS `infocreditvoucher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `CreditVoucherInfo` int(11) DEFAULT NULL,
  `SerieNo` int(11) DEFAULT NULL,
  `NotaNo` int(11) DEFAULT NULL,
  `CreditAmt` int(11) DEFAULT NULL,
  `CreditDiff` int(11) DEFAULT NULL,
  `NDC_Offline` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodescuentoitemticketelec
CREATE TABLE IF NOT EXISTS `infodescuentoitemticketelec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info3` int(11) DEFAULT NULL,
  `DescuentoItemTicketElec` int(11) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PLUSeqNo` int(11) DEFAULT NULL,
  `PrcItemSinIgv` int(11) DEFAULT NULL,
  `MontoItem` int(11) DEFAULT NULL,
  `DescuentoMonto` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodescuentototalticketelec
CREATE TABLE IF NOT EXISTS `infodescuentototalticketelec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info3` int(11) DEFAULT NULL,
  `DescuentoTotalTicketElec` int(11) DEFAULT NULL,
  `ValorDR_D` int(11) DEFAULT NULL,
  `ValorDR_L` int(11) DEFAULT NULL,
  `ValorDR_R` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodocdata
CREATE TABLE IF NOT EXISTS `infodocdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `DocData` int(11) DEFAULT NULL,
  `DocNumber` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DocType` int(11) DEFAULT NULL,
  `VoidedMember` int(11) DEFAULT NULL,
  `CMRType` int(11) DEFAULT NULL,
  `DocName` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ClientePangui` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infoemployeeid
CREATE TABLE IF NOT EXISTS `infoemployeeid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `EmployeeIDInfo` int(11) DEFAULT NULL,
  `CashierID` int(11) NOT NULL,
  `CashierName` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofactura
CREATE TABLE IF NOT EXISTS `infofactura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `FacturaInfo` int(11) DEFAULT NULL,
  `NumeroRUC` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TaxAmt1` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TaxAmt2` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TaxAmt3` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TotalTaxAmt` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofacturaen
CREATE TABLE IF NOT EXISTS `infofacturaen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `FacturaEN` int(11) DEFAULT NULL,
  `Tipo_Factura_EN` int(11) DEFAULT NULL,
  `Factura_EN` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofoodvoucher
CREATE TABLE IF NOT EXISTS `infofoodvoucher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `FoodVoucherInfo` int(11) DEFAULT NULL,
  `VoucherTenderNum` int(11) DEFAULT NULL,
  `TenderAmt` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `ExpDate` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infopanguicoupon
CREATE TABLE IF NOT EXISTS `infopanguicoupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `PanguiCouponInfo` int(11) DEFAULT NULL,
  `CouponFlag` int(11) DEFAULT NULL,
  `TotalCouponCount` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infosalesperson
CREATE TABLE IF NOT EXISTS `infosalesperson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `SalesPersonIDInfo` int(11) DEFAULT NULL,
  `SalesPersonID` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infospf
CREATE TABLE IF NOT EXISTS `infospf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `InfoSPF` int(11) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `MontoDesc` int(11) DEFAULT NULL,
  `CodPromo` int(11) DEFAULT NULL,
  `CondBeneficio` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MontoPromo` int(11) DEFAULT NULL,
  `SPF_ID` int(11) DEFAULT NULL,
  `NumSubDepartamento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infostoredata1
CREATE TABLE IF NOT EXISTS `infostoredata1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `StoreInfo1` int(11) DEFAULT NULL,
  `RUT_Tienda` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infostoredata2
CREATE TABLE IF NOT EXISTS `infostoredata2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info2` int(11) DEFAULT NULL,
  `StoreInfo2` int(11) DEFAULT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infotravelvoucher
CREATE TABLE IF NOT EXISTS `infotravelvoucher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `TravelVoucherInfo` int(11) DEFAULT NULL,
  `UPC` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Monto` int(11) DEFAULT NULL,
  `_No_Referencia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infovaleconsumo
CREATE TABLE IF NOT EXISTS `infovaleconsumo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `ValeConsumo` int(11) DEFAULT NULL,
  `NumeroVale` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PrecioVale` bigint(20) DEFAULT NULL,
  `AnularVale` int(11) DEFAULT NULL,
  `ValeMediodePago` int(11) DEFAULT NULL,
  `VDC_Offline` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infowarranty
CREATE TABLE IF NOT EXISTS `infowarranty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `WarrantyIDInfo` int(11) DEFAULT NULL,
  `SvcPlanNum` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `RepairReplace` int(11) DEFAULT NULL,
  `SvcLength` int(11) DEFAULT NULL,
  `CustomerIDType` int(11) DEFAULT NULL,
  `CustomerID` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ItemUPC` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `WarrantyUPC` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `WarrantyCancelada` int(11) DEFAULT NULL,
  `GEX_Offline` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Media` int(11) DEFAULT NULL,
  `NumTender` int(11) DEFAULT NULL,
  `_Change` int(11) DEFAULT NULL,
  `TenderSubtract` int(11) DEFAULT NULL,
  `TenderCancel` int(11) DEFAULT NULL,
  `TenderType` int(11) DEFAULT NULL,
  `MontoTender` int(11) DEFAULT NULL,
  `NumTarjeta` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CCEscaneado` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.plu
CREATE TABLE IF NOT EXISTS `plu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_PLU` int(11) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AnularItem` int(11) DEFAULT NULL,
  `AnularUltimo` int(11) DEFAULT NULL,
  `PriceOverride` int(11) DEFAULT NULL,
  `ManualPrice` int(11) DEFAULT NULL,
  `Pesable` int(11) DEFAULT NULL,
  `Cant_es_Peso` int(11) DEFAULT NULL,
  `Linked_Envase` int(11) DEFAULT NULL,
  `Escaneado` int(11) DEFAULT NULL,
  `BottleDeposit` int(11) DEFAULT NULL,
  `BottleRefund` int(11) DEFAULT NULL,
  `NumDepartamento` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` bigint(20) DEFAULT NULL,
  `Monto_Recibido` int(11) DEFAULT NULL,
  `TxFlg1` int(11) DEFAULT NULL,
  `TxFlg2` int(11) DEFAULT NULL,
  `TxFlg3` int(11) DEFAULT NULL,
  `TxFlg4` int(11) DEFAULT NULL,
  `TxFlg5` int(11) DEFAULT NULL,
  `TxFlg6` int(11) DEFAULT NULL,
  `TxFlg7` int(11) DEFAULT NULL,
  `TxFlg8` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.priceoverride
CREATE TABLE IF NOT EXISTS `priceoverride` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Info_Override` int(11) DEFAULT NULL,
  `PrecioOriginal` int(11) DEFAULT NULL,
  `PrecioReducido` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recarga_1
CREATE TABLE IF NOT EXISTS `recarga_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Tr_Recarga_1` int(11) DEFAULT NULL,
  `No_Telefono` bigint(20) DEFAULT NULL,
  `No_Convenio` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recarga_2
CREATE TABLE IF NOT EXISTS `recarga_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Tr_Recarga_2` int(11) DEFAULT NULL,
  `Fecha_Hora` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `No_Autorizacion` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recoverticket
CREATE TABLE IF NOT EXISTS `recoverticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `Log_Recover` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.reportex
CREATE TABLE IF NOT EXISTS `reportex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `ReporteX` int(11) DEFAULT NULL,
  `ClaveCajero` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.retiros
CREATE TABLE IF NOT EXISTS `retiros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Retiro` int(11) DEFAULT NULL,
  `MontoRetiro` bigint(20) DEFAULT NULL,
  `TenderRetiro` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.saved_trans
CREATE TABLE IF NOT EXISTS `saved_trans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Tr_SavedTr` int(11) DEFAULT NULL,
  `Saved_Tkt` int(11) DEFAULT NULL,
  `Saved_Tkt_Amt` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.signoff
CREATE TABLE IF NOT EXISTS `signoff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `Log_SignOff` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.signon
CREATE TABLE IF NOT EXISTS `signon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Log` int(11) DEFAULT NULL,
  `Log_SignOn` int(11) DEFAULT NULL,
  `ClaveCajero` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.supervisor
CREATE TABLE IF NOT EXISTS `supervisor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `Info_Supervisor` int(11) DEFAULT NULL,
  `NumSupervisor` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.tax
CREATE TABLE IF NOT EXISTS `tax` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Tax` int(11) DEFAULT NULL,
  `NumTax` int(11) DEFAULT NULL,
  `MontoTaxable` int(11) DEFAULT NULL,
  `MontoTax` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.total
CREATE TABLE IF NOT EXISTS `total` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Total` int(11) DEFAULT NULL,
  `MontoTicket` int(11) DEFAULT NULL,
  `NumItems` int(11) DEFAULT NULL,
  `Saved_Tkt` int(11) DEFAULT NULL,
  `Recalled_Tkt` int(11) DEFAULT NULL,
  `GT` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totalesztenders
CREATE TABLE IF NOT EXISTS `totalesztenders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `ReporteZ` int(11) DEFAULT NULL,
  `ZTenders` int(11) DEFAULT NULL,
  `TenderID1` int(11) DEFAULT NULL,
  `Tender1Total` int(11) DEFAULT NULL,
  `TenderID2` int(11) DEFAULT NULL,
  `Tender2Total` int(11) DEFAULT NULL,
  `TenderID3` int(11) DEFAULT NULL,
  `Tender3Total` int(11) DEFAULT NULL,
  `TenderID4` int(11) DEFAULT NULL,
  `Tender4Total` int(11) DEFAULT NULL,
  `TenderID5` int(11) DEFAULT NULL,
  `Tender5Total` int(11) DEFAULT NULL,
  `TenderID6` int(11) DEFAULT NULL,
  `Tender6Total` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totaleszventas1
CREATE TABLE IF NOT EXISTS `totaleszventas1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `ReporteZ` int(11) DEFAULT NULL,
  `ZSales1` int(11) DEFAULT NULL,
  `Ingresos` int(11) DEFAULT NULL,
  `egresos` int(11) DEFAULT NULL,
  `pago_cmr` int(11) DEFAULT NULL,
  `pago_supercash` int(11) DEFAULT NULL,
  `trans_abortada` int(11) DEFAULT NULL,
  `trans_anulada` int(11) DEFAULT NULL,
  `recaudacion_bruta` int(11) DEFAULT NULL,
  `recaudacion_neta` int(11) DEFAULT NULL,
  `pickups` int(11) DEFAULT NULL,
  `loans` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totaleszventas2
CREATE TABLE IF NOT EXISTS `totaleszventas2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Info` int(11) DEFAULT NULL,
  `ReporteZ` int(11) DEFAULT NULL,
  `ZSales2` int(11) DEFAULT NULL,
  `RUC_tickets` int(11) DEFAULT NULL,
  `NSRT_Total` bigint(20) DEFAULT NULL,
  `Gross_Sales` int(11) DEFAULT NULL,
  `Canje_CMRPuntos` int(11) DEFAULT NULL,
  `_Rev_Canj_CMRPuntos` int(11) DEFAULT NULL,
  `CMRPuntos` int(11) DEFAULT NULL,
  `CMRPuntosSoles` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.trans_info2_measuring_bb_time
CREATE TABLE IF NOT EXISTS `trans_info2_measuring_bb_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Trans_Info2` int(11) DEFAULT NULL,
  `Trans_Info2_measuring_bb_time` int(11) DEFAULT NULL,
  `RequestType` int(11) DEFAULT NULL,
  `SendingTime` int(11) DEFAULT NULL,
  `ReceiveTime` int(11) DEFAULT NULL,
  `ReturnCode` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosdiscount
CREATE TABLE IF NOT EXISTS `v_productosdiscount` (
  `id` bigint(20) DEFAULT NULL,
  `archivo_venpro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `llavetrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `llaveitem` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `StoreNumber` bigint(20) NOT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `Tail_NumCajero` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Sequence_ID` bigint(20) NOT NULL,
  `hora` int(11) DEFAULT NULL,
  `Tail_Hora` time DEFAULT NULL,
  `NumDepartamento` bigint(20) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoproducto` bigint(20) DEFAULT NULL,
  `CodPromo` bigint(20) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Monto_Recibido` decimal(20,4) DEFAULT NULL,
  `venta` decimal(20,4) NOT NULL,
  `ventac` decimal(20,4) NOT NULL,
  `TailSeqHighByte` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosinfospf
CREATE TABLE IF NOT EXISTS `v_productosinfospf` (
  `id` bigint(20) DEFAULT NULL,
  `archivo_venpro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `llavetrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `llaveitem` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `StoreNumber` bigint(20) NOT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `Tail_NumCajero` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Sequence_ID` bigint(20) NOT NULL,
  `SPF_ID` bigint(20) NOT NULL,
  `hora` int(11) DEFAULT NULL,
  `Tail_Hora` time DEFAULT NULL,
  `NumDepartamento` bigint(20) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoproducto` bigint(20) DEFAULT NULL,
  `CodPromo` bigint(20) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Monto_Recibido` decimal(20,4) DEFAULT NULL,
  `venta` decimal(20,4) NOT NULL,
  `ventac` decimal(20,4) NOT NULL,
  `TailSeqHighByte` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosplu
CREATE TABLE IF NOT EXISTS `v_productosplu` (
  `id` bigint(20) DEFAULT NULL,
  `archivo_venpro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `llavetrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `llaveitem` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `StoreNumber` bigint(20) NOT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `Tail_NumCajero` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `Sequence_ID` bigint(20) NOT NULL,
  `Sequence_ID_plu` bigint(20) DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `Tail_Hora` time DEFAULT NULL,
  `NumDepartamento` bigint(20) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoproducto` bigint(20) DEFAULT NULL,
  `CodPromo` bigint(20) DEFAULT NULL,
  `Pesable` int(11) NOT NULL,
  `Cant_es_Peso` int(11) NOT NULL,
  `TxFlg1` int(11) NOT NULL,
  `Cantidad` decimal(20,4) DEFAULT NULL,
  `Monto_Recibido` decimal(20,4) DEFAULT NULL,
  `venta` decimal(20,4) NOT NULL,
  `ventac` decimal(20,4) NOT NULL,
  `TailSeqHighByte` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosventa
CREATE TABLE IF NOT EXISTS `v_productosventa` (
  `archivo_venpro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `llavetrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `llaveitem` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idplumax` bigint(20) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `StoreNumber` bigint(20) NOT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `Tail_NumCajero` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) DEFAULT NULL,
  `hora` int(11) NOT NULL,
  `Tail_Hora` time NOT NULL,
  `NumDepartamento` bigint(20) DEFAULT NULL,
  `CodigoPLU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoproducto` bigint(20) DEFAULT NULL,
  `CodPromo` bigint(20) DEFAULT NULL,
  `Pesable` int(11) DEFAULT NULL,
  `TxFlg1` int(11) DEFAULT NULL,
  `Cantidad` decimal(20,4) NOT NULL,
  `ventasubtotal` decimal(20,4) NOT NULL,
  `descuentospf` decimal(20,4) DEFAULT NULL,
  `descuentomanual` decimal(20,4) DEFAULT NULL,
  `venta` decimal(20,4) DEFAULT NULL,
  `ventasinigv` decimal(20,4) DEFAULT NULL,
  `vendedor` bigint(20) DEFAULT NULL,
  `coddivision` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `division_` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `coddepart` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `depart_` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `subdep` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codsubdep_` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sku` bigint(20) DEFAULT NULL,
  `skudescrip` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro._no_ruc
CREATE TABLE IF NOT EXISTS `_no_ruc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `RUCInfo` int(11) DEFAULT NULL,
  `NumeroRUC` bigint(20) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro._no_ruc2
CREATE TABLE IF NOT EXISTS `_no_ruc2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Tr_Hook` int(11) DEFAULT NULL,
  `RUCInfo2` int(11) DEFAULT NULL,
  `NumeroRUC` bigint(20) DEFAULT NULL,
  `RUC_Offline` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro._q_length
CREATE TABLE IF NOT EXISTS `_q_length` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
  `fechaprocesamiento_venpro` datetime NOT NULL,
  `codtienda_venpro` int(11) NOT NULL,
  `Info` int(11) DEFAULT NULL,
  `_Info_Q_Length` int(11) DEFAULT NULL,
  `_Q_Length` int(11) DEFAULT NULL,
  `Tail_NumTicketSL` int(11) NOT NULL,
  `Tail_Fecha` date NOT NULL,
  `Tail_Hora` time NOT NULL,
  `Tail_Devolucion` int(11) DEFAULT NULL,
  `Tail_Training` int(11) DEFAULT NULL,
  `Tail_Offline` int(11) DEFAULT NULL,
  `Tail_TicketCancelado` int(11) DEFAULT NULL,
  `Tail_BadRec` int(11) DEFAULT NULL,
  `Sequence_ID` int(11) NOT NULL,
  `Tail_NumCajero` int(11) DEFAULT NULL,
  `Tail_NumPOS` int(11) NOT NULL,
  `StoreNumber` int(11) NOT NULL,
  `TailSeqHighByte` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`Sequence_ID`,`Tail_NumPOS`,`StoreNumber`),
  UNIQUE KEY `id` (`id`),
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
