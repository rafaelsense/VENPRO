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

-- Volcando estructura de base de datos para ventaspro
CREATE DATABASE IF NOT EXISTS `ventaspro` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `ventaspro`;


-- Volcando estructura para tabla ventaspro.alert_version
CREATE TABLE IF NOT EXISTS `alert_version` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.cashierfunction
CREATE TABLE IF NOT EXISTS `cashierfunction` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.delivery_trans
CREATE TABLE IF NOT EXISTS `delivery_trans` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.discount
CREATE TABLE IF NOT EXISTS `discount` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.enter_secure
CREATE TABLE IF NOT EXISTS `enter_secure` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.exit_secure
CREATE TABLE IF NOT EXISTS `exit_secure` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia1
CREATE TABLE IF NOT EXISTS `extmedia1` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia2
CREATE TABLE IF NOT EXISTS `extmedia2` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia3
CREATE TABLE IF NOT EXISTS `extmedia3` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia4
CREATE TABLE IF NOT EXISTS `extmedia4` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia5
CREATE TABLE IF NOT EXISTS `extmedia5` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia6
CREATE TABLE IF NOT EXISTS `extmedia6` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia8
CREATE TABLE IF NOT EXISTS `extmedia8` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.extmedia9
CREATE TABLE IF NOT EXISTS `extmedia9` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.fiscalinfo
CREATE TABLE IF NOT EXISTS `fiscalinfo` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.frame
CREATE TABLE IF NOT EXISTS `frame` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_storenumber
CREATE TABLE IF NOT EXISTS `hook_storenumber` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_taxesitems
CREATE TABLE IF NOT EXISTS `hook_taxesitems` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.hook_tendertime
CREATE TABLE IF NOT EXISTS `hook_tendertime` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infoboletaen
CREATE TABLE IF NOT EXISTS `infoboletaen` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infocmrpoints
CREATE TABLE IF NOT EXISTS `infocmrpoints` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infocreditvoucher
CREATE TABLE IF NOT EXISTS `infocreditvoucher` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodescuentoitemticketelec
CREATE TABLE IF NOT EXISTS `infodescuentoitemticketelec` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodescuentototalticketelec
CREATE TABLE IF NOT EXISTS `infodescuentototalticketelec` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infodocdata
CREATE TABLE IF NOT EXISTS `infodocdata` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infoemployeeid
CREATE TABLE IF NOT EXISTS `infoemployeeid` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofactura
CREATE TABLE IF NOT EXISTS `infofactura` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofacturaen
CREATE TABLE IF NOT EXISTS `infofacturaen` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infofoodvoucher
CREATE TABLE IF NOT EXISTS `infofoodvoucher` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infopanguicoupon
CREATE TABLE IF NOT EXISTS `infopanguicoupon` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infosalesperson
CREATE TABLE IF NOT EXISTS `infosalesperson` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infospf
CREATE TABLE IF NOT EXISTS `infospf` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infostoredata1
CREATE TABLE IF NOT EXISTS `infostoredata1` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infostoredata2
CREATE TABLE IF NOT EXISTS `infostoredata2` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infotravelvoucher
CREATE TABLE IF NOT EXISTS `infotravelvoucher` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infovaleconsumo
CREATE TABLE IF NOT EXISTS `infovaleconsumo` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.infowarranty
CREATE TABLE IF NOT EXISTS `infowarranty` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.media
CREATE TABLE IF NOT EXISTS `media` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.plu
CREATE TABLE IF NOT EXISTS `plu` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.priceoverride
CREATE TABLE IF NOT EXISTS `priceoverride` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recarga_1
CREATE TABLE IF NOT EXISTS `recarga_1` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recarga_2
CREATE TABLE IF NOT EXISTS `recarga_2` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.recoverticket
CREATE TABLE IF NOT EXISTS `recoverticket` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.reportex
CREATE TABLE IF NOT EXISTS `reportex` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.retiros
CREATE TABLE IF NOT EXISTS `retiros` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.saved_trans
CREATE TABLE IF NOT EXISTS `saved_trans` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.signoff
CREATE TABLE IF NOT EXISTS `signoff` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.signon
CREATE TABLE IF NOT EXISTS `signon` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.supervisor
CREATE TABLE IF NOT EXISTS `supervisor` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.tax
CREATE TABLE IF NOT EXISTS `tax` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.total
CREATE TABLE IF NOT EXISTS `total` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totalesztenders
CREATE TABLE IF NOT EXISTS `totalesztenders` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totaleszventas1
CREATE TABLE IF NOT EXISTS `totaleszventas1` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.totaleszventas2
CREATE TABLE IF NOT EXISTS `totaleszventas2` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.trans_info2_measuring_bb_time
CREATE TABLE IF NOT EXISTS `trans_info2_measuring_bb_time` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosdiscount
CREATE TABLE IF NOT EXISTS `v_productosdiscount` (
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
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`StoreNumber`,`Tail_NumPOS`,`Sequence_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosinfospf
CREATE TABLE IF NOT EXISTS `v_productosinfospf` (
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
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`StoreNumber`,`Tail_NumPOS`,`Sequence_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosplu
CREATE TABLE IF NOT EXISTS `v_productosplu` (
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
  `Pesable` int(11) NOT NULL,
  `Cant_es_Peso` int(11) NOT NULL,
  `TxFlg1` int(11) NOT NULL,
  `Cantidad` decimal(20,4) DEFAULT NULL,
  `Monto_Recibido` decimal(20,4) DEFAULT NULL,
  `venta` decimal(20,4) NOT NULL,
  `ventac` decimal(20,4) NOT NULL,
  `TailSeqHighByte` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Tail_Fecha`,`StoreNumber`,`Tail_NumPOS`,`Sequence_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro.v_productosventa
CREATE TABLE IF NOT EXISTS `v_productosventa` (
  `archivo_venpro` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `llavetrx` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `llaveitem` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
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
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro._no_ruc2
CREATE TABLE IF NOT EXISTS `_no_ruc2` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ventaspro._q_length
CREATE TABLE IF NOT EXISTS `_q_length` (
  `archivo_venpro` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_venpro` date NOT NULL,
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
  KEY `archivo_venpro_fecha_venpro_codtienda_venpro` (`archivo_venpro`,`fecha_venpro`,`codtienda_venpro`),
  KEY `Tail_Fecha` (`Tail_Fecha`),
  KEY `StoreNumber` (`StoreNumber`),
  KEY `Tail_NumPOS` (`Tail_NumPOS`),
  KEY `Tail_Hora` (`Tail_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para vista ventaspro.vs_cambiopreciolinea
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_cambiopreciolinea` (
	`llavetrx` VARCHAR(41) NULL COLLATE 'utf8_general_ci',
	`Tail_Fecha` DATE NOT NULL,
	`StoreNumber` INT(11) NOT NULL,
	`Tail_NumPOS` INT(11) NOT NULL,
	`Tail_NumTicketSL` INT(11) NULL,
	`hora` VARCHAR(7) NULL COLLATE 'utf8_general_ci',
	`Tail_Hora` TIME NOT NULL,
	`Tail_NumCajero` INT(11) NULL,
	`CodigoPLU` VARCHAR(50) NULL COLLATE 'utf8_spanish_ci',
	`tipodescuento` BIGINT(20) NULL,
	`tipo` VARCHAR(16) NOT NULL COLLATE 'utf8_general_ci',
	`precioant` DECIMAL(14,4) NULL,
	`precionuevo` DECIMAL(14,4) NULL,
	`MontoDescuento` DECIMAL(15,4) NULL,
	`cantidad` BIGINT(20) NOT NULL,
	`NumSupervisor` INT(11) NULL,
	`llavesupervisor` DOUBLE NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista ventaspro.vs_infocashier
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_infocashier` (
	`fechareg` DATE NOT NULL,
	`llave` VARCHAR(22) NULL COLLATE 'utf8_general_ci',
	`StoreNumber` INT(11) NOT NULL,
	`Tail_NumCajero` INT(11) NULL,
	`CashierID` INT(11) NOT NULL,
	`CashierName` VARCHAR(100) NULL COLLATE 'utf8_spanish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista ventaspro.vs_ventahora
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_ventahora` (
	`Tail_Fecha` DATE NOT NULL,
	`StoreNumber` INT(11) NOT NULL,
	`hora` DOUBLE(17,0) NULL,
	`venta` DECIMAL(36,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista ventaspro.vs_ventahora_del
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vs_ventahora_del` (
	`Tail_fecha` DATE NOT NULL,
	`StoreNumber` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para procedimiento ventaspro.sp_1_productosplu
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_1_productosplu`(IN `p_Tail_Fecha` DATE)
BEGIN

delete from v_productosplu;
 insert into v_productosplu  
  (
  archivo_venpro,
  llavetrx,
  llaveitem,
  Tail_Fecha,
  StoreNumber,
  Tail_NumPOS,
  Tail_NumCajero,
  Tail_NumTicketSL,
  Sequence_ID,
  hora,
  Tail_Hora,
  NumDepartamento,
  CodigoPLU,
  codigoproducto,
  CodPromo,
  Pesable,
  Cant_es_Peso,
  TxFlg1,
  Cantidad,
  Monto_Recibido,
  venta,
  ventac,
  TailSeqHighByte,
  tipo
  )  
  
(select plu.archivo_venpro, 
concat(DATE_FORMAT(plu.Tail_Fecha,'%Y%m%d'),'1', plu.StoreNumber,'1',plu.Tail_NumPOS,'1',plu.Tail_NumTicketSL ) as llavetrx,
concat(DATE_FORMAT(plu.Tail_Fecha,'%Y%m%d'), '1', plu.StoreNumber, '1',plu.Tail_NumPOS, '1',plu.Tail_NumTicketSL,'1',plu.CodigoPLU ) as llaveitem,
 plu.Tail_Fecha, plu.StoreNumber, plu.Tail_NumPOS, plu.Tail_NumCajero, plu.Tail_NumTicketSL,
if( plu.TailSeqHighByte is null,plu.Sequence_ID, 
(plu.TailSeqHighByte*65536)+plu.Sequence_ID) as Sequence_ID,
(TIME_FORMAT(plu.Tail_Hora,'%k')*1) as hora, plu.Tail_Hora,
 plu.NumDepartamento, plu.CodigoPLU,
 if(SUBSTRING(plu.CodigoPLU,1,3)='025' || SUBSTRING(plu.CodigoPLU,1,3)='026', 
 SUBSTRING(plu.CodigoPLU,4,5),plu.CodigoPLU*1) as codigoproducto,
  null as CodPromo,plu.Pesable,plu.Cant_es_Peso, plu.TxFlg1, 
 if(plu.Cant_es_Peso=1,plu.Cantidad/1000,plu.Cantidad) as Cantidad,   plu.Monto_Recibido , 
 plu.Monto_Recibido as venta, ((plu.Monto_Recibido)/100) as ventac,
 plu.TailSeqHighByte, 'PLU' as tipo from plu
where  #plu.Tail_Fecha= ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
#plu.Tail_Fecha='2017-03-08'
plu.Tail_Fecha=p_Tail_Fecha 
#and plu.StoreNumber=123 
and plu.Tail_TicketCancelado=0
and plu.Tail_BadRec=0
#and (TIME_FORMAT(plu.Tail_Hora,'%k')*1)=18
#and plu.Tail_NumTicketSL=9115
#and plu.Tail_NumPOS=19

); 


END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_2_productosinfospf
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_2_productosinfospf`(IN `p_Tail_Fecha` VARCHAR(50))
BEGIN

#----Descuento promociones----

delete from v_productosinfospf;
 insert into v_productosinfospf  
  (
  archivo_venpro,
  llavetrx,
  llaveitem,
  Tail_Fecha,
  StoreNumber,
  Tail_NumPOS,
  Tail_NumCajero,
  Tail_NumTicketSL,
  Sequence_ID,
  SPF_ID,
  hora,
  Tail_Hora,
  NumDepartamento,
  CodigoPLU,
  codigoproducto,
  CodPromo,
  Cantidad,
  Monto_Recibido,
  venta,
  ventac,
  TailSeqHighByte,
  tipo
  )
  
 (select inf.archivo_venpro, 
concat(DATE_FORMAT(inf.Tail_Fecha,'%Y%m%d'),'1', inf.StoreNumber,'1',inf.Tail_NumPOS,'1',inf.Tail_NumTicketSL ) as llavetrx,
concat(DATE_FORMAT(inf.Tail_Fecha,'%Y%m%d'), '1', inf.StoreNumber, '1',inf.Tail_NumPOS, '1',inf.Tail_NumTicketSL,'1',inf.CodigoPLU ) as llaveitem,
inf.Tail_Fecha ,inf.StoreNumber ,inf.Tail_NumPOS, inf.Tail_NumCajero, inf.Tail_NumTicketSL,
 inf.Sequence_ID, inf.SPF_ID,  
 #inf.SPF_ID as Sequence_ID,
(TIME_FORMAT(inf.Tail_Hora,'%k')*1) as hora, inf.Tail_Hora,
null as NumDepartamento, inf.CodigoPLU,
 if(SUBSTRING(inf.CodigoPLU,1,3)='025' || SUBSTRING(inf.CodigoPLU,1,3)='026', 
 SUBSTRING(inf.CodigoPLU,4,5),inf.CodigoPLU*1) as codigoproducto,
inf.CodPromo,0 as Cantidad, 0 as Monto_Recibido,
# ifnull(sum(inf.MontoDesc),0) as MontoDesc,
ifnull(-inf.MontoPromo,0) as venta, ifnull(-inf.MontoPromo/100,0) as ventac, 
ifnull(inf.TailSeqHighByte,0) as TailSeqHighByte, 'SPF' as tipo
from infospf  inf
where  
inf.Tail_Fecha=p_Tail_Fecha
#inf.Tail_Fecha='2017-03-08' 
and 
#inf.StoreNumber=123 and 
inf.Tail_TicketCancelado=0
and inf.CodPromo is not null
and inf.Tail_BadRec=0
#and (TIME_FORMAT(inf.Tail_Hora,'%k')*1)=18
#and inf.Tail_NumTicketSL=396 
#and inf.Tail_NumPOS=19
);

END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_3_productosdiscount
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_3_productosdiscount`(IN `p_Tail_Fecha` VARCHAR(50))
BEGIN

#----Descuento Manual tipo1 y tipo2----
delete from v_productosdiscount;
 insert into v_productosdiscount  
  (
  archivo_venpro,
  llavetrx,
  llaveitem,
  Tail_Fecha,
  StoreNumber,
  Tail_NumPOS,
  Tail_NumCajero,
  Tail_NumTicketSL,
  Sequence_ID,
  hora,
  Tail_Hora,
  NumDepartamento,
  CodigoPLU,
  codigoproducto,
  CodPromo,
  Cantidad,
  Monto_Recibido,
  venta,
  ventac,
  TailSeqHighByte,
  tipo
  )
  
 (select dsc.archivo_venpro, 
concat(DATE_FORMAT(dsc.Tail_Fecha,'%Y%m%d'),'1', dsc.StoreNumber,'1',dsc.Tail_NumPOS,'1',dsc.Tail_NumTicketSL ) as llavetrx,
concat(DATE_FORMAT(dsc.Tail_Fecha,'%Y%m%d'), '1', dsc.StoreNumber, '1',dsc.Tail_NumPOS, '1',dsc.Tail_NumTicketSL,'1',dsc.CodigoPLU ) as llaveitem,
dsc.Tail_Fecha, dsc.StoreNumber, dsc.Tail_NumPOS, dsc.Tail_NumCajero, dsc.Tail_NumTicketSL,
dsc.Sequence_ID,
(TIME_FORMAT(dsc.Tail_Hora,'%k')*1) as hora, dsc.Tail_Hora,
 dsc.NumDepartamento, dsc.CodigoPLU, 
 if(SUBSTRING(dsc.CodigoPLU,1,3)='025' || SUBSTRING(dsc.CodigoPLU,1,3)='026', 
 SUBSTRING(dsc.CodigoPLU,4,5),dsc.CodigoPLU*1) as codigoproducto,
 null as CodPromo, 0 as Cantidad, 0 as Monto_Recibido, 
 dsc.MontoDescuento as venta, ((dsc.MontoDescuento)/100) as ventac,
 ifnull(dsc.TailSeqHighByte,0) as TailSeqHighByte, 'DSCTO' as tipo
 from Discount dsc 
where  #dsc.StoreNumber=123 and 
dsc.Tail_Fecha=p_Tail_Fecha
#dsc.Tail_Fecha='2017-03-08' 
and dsc.Tail_TicketCancelado=0
and dsc.Tail_BadRec=0 and  promoSPF=0
#and (TIME_FORMAT(dsc.Tail_Hora,'%k')*1)=18
#and dsc.Tail_NumTicketSL=9115
#and dsc.Tail_NumPOS=19
);

#---Nota Override no aplica
# ya que elimina producto original no netea---


END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_4_productoventa
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_4_productoventa`(IN `p_Tail_Fecha` VARCHAR(50))
BEGIN

#--Insertar productos con datos----
delete from v_productosventa;
 insert into v_productosventa  
  (
  archivo_venpro,
  llavetrx,
  llaveitem,
  Tail_Fecha,
  StoreNumber,
  Tail_NumPOS,
  Tail_NumCajero,
  Tail_NumTicketSL,
  hora,
  Tail_Hora,
  NumDepartamento,
  CodigoPLU,
  codigoproducto,
  CodPromo,
  Pesable,
  TxFlg1,
  Cantidad,
  ventasubtotal,
  descuentospf,
  descuentomanual,
  venta,
  ventasinigv
  )
  
#--Nota: si se agrupa y se usa left join no ejecuta...
select p.archivo_venpro, p.llavetrx, p.llaveitem,
p.Tail_Fecha, p.StoreNumber, p.Tail_NumPOS, p.Tail_NumCajero, p.Tail_NumTicketSL, 
p.hora, p.Tail_Hora, p.NumDepartamento, p.CodigoPLU, p.codigoproducto, 
null as CodPromo, p.Pesable, p.TxFlg1, sum(p.Cantidad) as Cantidad, sum(p.ventac) as ventasubtotal, 
0 as descuentospf, 0 as descuentomanual, 
0 as venta, 0 as ventasinigv   
from v_productosplu p 
group by p.llaveitem;

#---Actualizar productoventa--- SPF-----
update  v_productosventa v inner join  
( select archivo_venpro, llavetrx, llaveitem,
Tail_Fecha, StoreNumber, Tail_NumPOS, Tail_NumCajero, Tail_NumTicketSL, 
hora, CodPromo, CodigoPLU, codigoproducto,
sum(ifnull(ventac,0)) as descuentospf from v_productosinfospf
group by llaveitem  ) spf  
on v.llaveitem=spf.llaveitem   
set v.descuentospf=spf.descuentospf
where   v.llaveitem=spf.llaveitem;


#---Actualizar productoventa--- Dscto-----
update  v_productosventa v inner join  
( select archivo_venpro, llavetrx, llaveitem,
Tail_Fecha, StoreNumber, Tail_NumPOS, Tail_NumCajero, Tail_NumTicketSL, 
hora, CodigoPLU, codigoproducto,
sum(ifnull(ventac,0)) as descuentomanual   from v_productosdiscount
group by llaveitem ) dscto  
on v.llaveitem=dscto.llaveitem   
set v.descuentomanual=dscto.descuentomanual
where   v.llaveitem=dscto.llaveitem;

#---Actualizar productoventa--- ventatotal-----
#Si es TRX anulado se debe sumar los descuentos, para que netee con el positivo.
update  v_productosventa set venta=if(cantidad<0,(ventasubtotal - descuentospf - descuentomanual), (ventasubtotal + descuentospf + descuentomanual)), 
ventasinigv=if(TxFlg1=1,truncate(if(cantidad<0,(ventasubtotal - descuentospf - descuentomanual), (ventasubtotal + descuentospf + descuentomanual))/1.18,2),
if(cantidad<0,(ventasubtotal - descuentospf - descuentomanual), (ventasubtotal + descuentospf + descuentomanual)));


#--Actualiza productoventa---VENDEDOR-------
#-- `vendedor` BIGINT(20) NULL DEFAULT NULL,
	
update  v_productosventa v inner join  
(select concat(DATE_FORMAT(Tail_Fecha,'%Y%m%d'),'1', StoreNumber,'1',
Tail_NumPOS, '1',Tail_NumTicketSL ) as llavetrx,infosalesperson.SalesPersonID from infosalesperson 
where Tail_Fecha=p_Tail_Fecha 
#and StoreNumber=123
#and Tail_TicketCancelado=0
#and Tail_NumPOS=34
) vend on Cast(v.llavetrx as char(50))=vend.llavetrx  
set v.vendedor=vend.SalesPersonID
where  Cast(v.llavetrx as char(50))=vend.llavetrx;
#se tiene que castear si no no es igual--

END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_5_productoventa_carga
DELIMITER //
CREATE DEFINER=`dba`@`%` PROCEDURE `sp_5_productoventa_carga`()
BEGIN

call sp_1_productosplu( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d'));

call sp_2_productosinfospf( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d'));

call sp_3_productosdiscount( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d'));

call sp_4_productoventa(DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d'));

END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_del_tablas
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_tablas`()
BEGIN

DECLARE fechaini varchar(10);
DECLARE fechafin varchar(10);

set fechaini=(select DATE_FORMAT(DATE_SUB(CURDATE(), interval 6 DAY),'%Y-%m-%d'));
set fechafin=(select DATE_FORMAT(DATE_SUB(CURDATE(), interval 3 DAY),'%Y-%m-%d'));
#set fechaini='2014-02-09';
#set fechafin='2014-02-09';

/*
alert_version
cashierfunction
delivery_trans
discount
enter_secure
exit_secure
extmedia1
extmedia2
extmedia3
extmedia4
extmedia5
extmedia6
extmedia8
extmedia9
fiscalinfo
frame
hook_storenumber
hook_taxesitems
hook_tendertime
infoboletaen
infocmroriginal
infocmrpoints
infocreditvoucher
infodescuentoitemticketelec
infodescuentototalticketelec
infodocdata
infoemployeeid
infofactura
infofacturaen
infofoodvoucher
infopanguicoupon
infosalesperson
infospf
infostoredata1
infostoredata2
infotravelvoucher
infovaleconsumo
infowarranty
media
plu
priceoverride
recarga_1
recarga_2
recoverticket
reportex
retiros
saved_trans
signoff
signon
supervisor
tax
total
totalesztenders
totaleszventas1
totaleszventas2
trans_info2_measuring_bb_time
_no_ruc
_no_ruc2
_q_length
*/

#----------
delete from alert_version where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from cashierfunction where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from delivery_trans where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from discount where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from enter_secure where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from exit_secure where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia1 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia2 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia3 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia4 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia5 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia6 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia8 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from extmedia9 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from fiscalinfo where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from frame where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from hook_storenumber where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from hook_taxesitems where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from hook_tendertime where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infoboletaen where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
#delete from infocmroriginal where fecha_venpro 
#between ( fechaini ) 
#and ( fechafin );
#----------
delete from infocmrpoints where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infocreditvoucher where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infodescuentoitemticketelec where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infodescuentototalticketelec where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infodocdata where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infoemployeeid where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infofactura where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infofacturaen where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infofoodvoucher where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infopanguicoupon where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infosalesperson where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infospf where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infostoredata1 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infostoredata2 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infotravelvoucher where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infovaleconsumo where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from infowarranty where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from media where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from plu where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from priceoverride where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from recarga_1 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from recarga_2 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from recoverticket where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from reportex where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from retiros where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from saved_trans where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from signoff where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from signon where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from supervisor where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from tax where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from total where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from totalesztenders where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from totaleszventas1 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from totaleszventas2 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from trans_info2_measuring_bb_time where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from _no_ruc where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from _no_ruc2 where fecha_venpro 
between ( fechaini ) 
and ( fechafin );
#----------
delete from _q_length where fecha_venpro 
between ( fechaini ) 
and ( fechafin );

END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_del_tablas_all
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_tablas_all`()
BEGIN

#DECLARE fechaini varchar(10);
#DECLARE fechafin varchar(10);


/*
alert_version
cashierfunction
delivery_trans
discount
enter_secure
exit_secure
extmedia1
extmedia2
extmedia3
extmedia4
extmedia5
extmedia6
extmedia8
extmedia9
fiscalinfo
frame
hook_storenumber
hook_taxesitems
hook_tendertime
infoboletaen
infocmroriginal
infocmrpoints
infocreditvoucher
infodescuentoitemticketelec
infodescuentototalticketelec
infodocdata
infoemployeeid
infofactura
infofacturaen
infofoodvoucher
infopanguicoupon
infosalesperson
infospf
infostoredata1
infostoredata2
infotravelvoucher
infovaleconsumo
infowarranty
media
plu
priceoverride
recarga_1
recarga_2
recoverticket
reportex
retiros
saved_trans
signoff
signon
supervisor
tax
total
totalesztenders
totaleszventas1
totaleszventas2
trans_info2_measuring_bb_time
_no_ruc
_no_ruc2
_q_length
*/

#----------
delete from alert_version; 

#----------
delete from cashierfunction; 

#----------
delete from delivery_trans; 

#----------
delete from discount; 

#----------
delete from enter_secure; 

#----------
delete from exit_secure; 

#----------
delete from extmedia1; 

#----------
delete from extmedia2; 

#----------
delete from extmedia3; 

#----------
delete from extmedia4; 

#----------
delete from extmedia5; 

#----------
delete from extmedia6; 

#----------
delete from extmedia8; 

#----------
delete from extmedia9; 

#----------
delete from fiscalinfo; 

#----------
delete from frame; 

#----------
delete from hook_storenumber; 

#----------
delete from hook_taxesitems; 

#----------
delete from hook_tendertime; 

#----------
delete from infoboletaen; 

#----------
delete from infocmroriginal;

#----------
delete from infocmrpoints; 

#----------
delete from infocreditvoucher; 

#----------
delete from infodescuentoitemticketelec; 

#----------
delete from infodescuentototalticketelec; 

#----------
delete from infodocdata; 

#----------
delete from infoemployeeid; 

#----------
delete from infofactura; 

#----------
delete from infofacturaen; 

#----------
delete from infofoodvoucher; 

#----------
delete from infopanguicoupon; 

#----------
delete from infosalesperson; 

#----------
delete from infospf; 

#----------
delete from infostoredata1; 

#----------
delete from infostoredata2; 

#----------
delete from infotravelvoucher; 

#----------
delete from infovaleconsumo; 

#----------
delete from infowarranty; 

#----------
delete from media; 

#----------
delete from plu; 

#----------
delete from priceoverride; 

#----------
delete from recarga_1; 

#----------
delete from recarga_2; 

#----------
delete from recoverticket; 

#----------
delete from reportex; 

#----------
delete from retiros; 

#----------
delete from saved_trans; 

#----------
delete from signoff; 

#----------
delete from signon; 

#----------
delete from supervisor; 

#----------
delete from tax; 

#----------
delete from total; 

#----------
delete from totalesztenders; 

#----------
delete from totaleszventas1; 

#----------
delete from totaleszventas2; 

#----------
delete from trans_info2_measuring_bb_time; 

#----------
delete from _no_ruc; 

#----------
delete from _no_ruc2; 

#----------
delete from _q_length; 


END//
DELIMITER ;


-- Volcando estructura para procedimiento ventaspro.sp_del_ventaproductos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_del_ventaproductos`()
BEGIN

delete from v_ventaproductos
where
Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d'));
#and horatrx>(TIME_FORMAT(CURTIME(),'%k')-1);

END//
DELIMITER ;


-- Volcando estructura para función ventaspro.ins_ventaproducto_Hoy
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `ins_ventaproducto_Hoy`() RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;



#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DIGITADO_DIARIO----
#set contarfecha=0;
#set contarfecha=(
#select count(*) as fechas from(select fecha, count(*) from digitado_diario where fecha in(
#  select tt.fecha
#from(
#select fecha,numsemana,nummes, numsemestre, ano from tiempo t
#where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
#where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
#order by tt.fecha desc
#) group by fecha Order by fecha desc)p);

#if (contarfecha>=7) then
#SET rs = '1';
#else
#SET rs = concat('No esta cargado las fechas completas de la tabla DIGITADO_DIARIO de la semana, solo se encuentran ', contarfecha, ' fechas.');
#return rs;
#end if;
#----------


#-----------------



#ELIMINAR E INSERTAR----------------------------

#POR PRODUCTO-----------Algunos Anulados no cuadran.---

delete from v_ventaproductos
where
Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) 
and horatrx>=(TIME_FORMAT(CURTIME(),'%k')-1);

insert into v_ventaproductos(
archivo_venpro,
Tail_Fecha,
StoreNumber,
Tail_NumPOS,
Tail_NumTicketSL,
horatrx,
horaproducto,
Tail_Hora,
NumDepartamento,
CodigoPLU,
codigoproducto,
Escaneado,
Pesable,
Cantidad,
Monto_Recibido,
MontoPromo,
venta
)

select plu.archivo_venpro, 
 plu.Tail_Fecha, plu.StoreNumber, plu.Tail_NumPOS, plu.Tail_NumTicketSL, 
(TIME_FORMAT(tot.Tail_Hora,'%k')*1) as horatrx, 
 (TIME_FORMAT(plu.Tail_Hora,'%k')*1) as horaproducto, 
plu.Tail_Hora,
 plu.NumDepartamento, plu.CodigoPLU*1 as CodigoPLU,
 (if(SUBSTRING(inf.CodigoPLU*1,1,2)=25 || SUBSTRING(inf.CodigoPLU*1,1,2)=26 , 
 SUBSTRING(inf.CodigoPLU*1,3,5),inf.CodigoPLU))*1 as codigoproducto,
 plu.Escaneado,  plu.Pesable, 
 if(plu.Cant_es_Peso=1,  plu.Cantidad/1000,plu.Cantidad) as Cantidad, 
 plu.Monto_Recibido/100 as Monto_Recibido , 
 #inf.MontoDesc/100 as MontoDesc,
  inf.MontoPromo/100 as MontoPromo,   
((plu.Monto_Recibido-ifnull(inf.MontoPromo,0))/100) as venta from plu
inner join (select * from total where 
total.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and total.Saved_Tkt=0 and total.MontoTicket!=0 
and (TIME_FORMAT(total.Tail_Hora,'%k')*1)>=(TIME_FORMAT(CURTIME(),'%k')-1)
) tot 
on  tot.StoreNumber=plu.StoreNumber #(Se demora no carga)
and tot.Tail_Fecha=plu.Tail_Fecha and tot.Tail_NumPOS=plu.Tail_NumPOS 
and tot.Tail_NumTicketSL=plu.Tail_NumTicketSL
left join ( select 
inf.Tail_Fecha ,inf.StoreNumber ,inf.Tail_NumPOS, inf.Tail_NumTicketSL,
inf.SPF_ID, inf.CodigoPLU,  ifnull(sum(inf.MontoDesc),0) as MontoDesc, 
ifnull(sum(inf.MontoPromo),0) as MontoPromo
#, ifnull(max(inf.TailSeqHighByte),0) as TailSeqHighByte
from infospf  inf
where  #inf.Tail_Fecha='2015-03-30' 
 inf.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) 
#and inf.StoreNumber=104 
and inf.Tail_TicketCancelado=0
and inf.Tail_BadRec=0
#and inf.Tail_NumTicketSL=396 
#and inf.Tail_NumPOS=179
#inf.CodPromo Un producto tiene mas de una promo se repite.
group by inf.Tail_Fecha ,inf.StoreNumber ,inf.Tail_NumPOS, inf.Tail_NumTicketSL,
inf.SPF_ID, inf.CodigoPLU
 ) inf on plu.Tail_Fecha=inf.Tail_Fecha
and plu.StoreNumber=inf.StoreNumber and plu.Tail_NumPOS=inf.Tail_NumPOS
and plu.Tail_NumTicketSL=inf.Tail_NumTicketSL
where
 if( plu.TailSeqHighByte is null,plu.Sequence_ID, 
(plu.TailSeqHighByte*65536)+plu.Sequence_ID)=inf.SPF_ID
#and  plu.Tail_Fecha='2015-03-30' 
and plu.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
#and plu.StoreNumber=104 
and plu.Tail_TicketCancelado=0
and plu.Tail_BadRec=0
#and plu.Tail_NumTicketSL=9115
#and plu.Tail_NumPOS=179

union all( select dsc.archivo_venpro, 
dsc.Tail_Fecha, dsc.StoreNumber, dsc.Tail_NumPOS, dsc.Tail_NumTicketSL,
(TIME_FORMAT(tot.Tail_Hora,'%k')*1) as horatrx, 
 (TIME_FORMAT(dsc.Tail_Hora,'%k')*1) as horaproducto, 
dsc.Tail_Hora,
 dsc.NumDepartamento, dsc.CodigoPLU*1 as CodigoPLU, 
  (if(SUBSTRING(dsc.CodigoPLU*1,1,2)=25, 
 SUBSTRING(dsc.CodigoPLU*1,3,5),dsc.CodigoPLU))*1 as codigoproducto,
 null as Escaneado, 0 as Pesable,  
 0 as Cantidad,  0 as Monto_Recibido , 
 #dsc.MontoDescuento/100 as MontoDesc,
  0 as MontoPromo, 
 dsc.MontoDescuento/100 as venta
 from Discount dsc 
inner join (select * from total where 
total.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and total.Saved_Tkt=0 and total.MontoTicket!=0 
and (TIME_FORMAT(total.Tail_Hora,'%k')*1)>=(TIME_FORMAT(CURTIME(),'%k')-1) ) tot 
on  tot.StoreNumber=dsc.StoreNumber #(Se demora no carga)
and tot.Tail_Fecha=dsc.Tail_Fecha and tot.Tail_NumPOS=dsc.Tail_NumPOS 
and tot.Tail_NumTicketSL=dsc.Tail_NumTicketSL
where  #dsc.StoreNumber=104 and
 #dsc.Tail_Fecha='2015-03-30' 
 dsc.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and dsc.Tail_TicketCancelado=0
and dsc.Tail_BadRec=0 and dsc.NumDepartamento!=0
#and dsc.Tail_NumTicketSL=9115
#and dsc.Tail_NumPOS=179
);



#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros v_ventaproductos, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para función ventaspro.ins_ventaproducto_HoyHoraDesde
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `ins_ventaproducto_HoyHoraDesde`(`horadesde` INT) RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN
DECLARE rs varchar(200);
DECLARE contar INT;
DECLARE contarfecha INT;

DECLARE tmp_horadesde INT;

Set tmp_horadesde=horadesde;


#VALIDACION DE FECHAS COMPLETAS DE LA SEMANA-----
#---DIGITADO_DIARIO----
#set contarfecha=0;
#set contarfecha=(
#select count(*) as fechas from(select fecha, count(*) from digitado_diario where fecha in(
#  select tt.fecha
#from(
#select fecha,numsemana,nummes, numsemestre, ano from tiempo t
#where t.fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 7 DAY),'%Y-%m-%d') ))t, tiempo tt
#where t.ano=tt.ano and t.nummes=tt.nummes and t.numsemana=tt.numsemana 
#order by tt.fecha desc
#) group by fecha Order by fecha desc)p);

#if (contarfecha>=7) then
#SET rs = '1';
#else
#SET rs = concat('No esta cargado las fechas completas de la tabla DIGITADO_DIARIO de la semana, solo se encuentran ', contarfecha, ' fechas.');
#return rs;
#end if;
#----------


#-----------------



#ELIMINAR E INSERTAR----------------------------

#POR PRODUCTO-----------Algunos Anulados no cuadran.---

delete from v_ventaproductos
where
Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) 
and horatrx>=tmp_horadesde;

insert into v_ventaproductos(
archivo_venpro,
Tail_Fecha,
StoreNumber,
Tail_NumPOS,
Tail_NumTicketSL,
horatrx,
horaproducto,
Tail_Hora,
NumDepartamento,
CodigoPLU,
codigoproducto,
Escaneado,
Pesable,
Cantidad,
Monto_Recibido,
MontoPromo,
venta
)

select plu.archivo_venpro, 
 plu.Tail_Fecha, plu.StoreNumber, plu.Tail_NumPOS, plu.Tail_NumTicketSL, 
(TIME_FORMAT(tot.Tail_Hora,'%k')*1) as horatrx, 
 (TIME_FORMAT(plu.Tail_Hora,'%k')*1) as horaproducto, 
plu.Tail_Hora,
 plu.NumDepartamento, plu.CodigoPLU*1 as CodigoPLU,
 (if(SUBSTRING(inf.CodigoPLU*1,1,2)=25 || SUBSTRING(inf.CodigoPLU*1,1,2)=26 , 
 SUBSTRING(inf.CodigoPLU*1,3,5),inf.CodigoPLU))*1 as codigoproducto,
 plu.Escaneado,  plu.Pesable, 
 if(plu.Cant_es_Peso=1,  plu.Cantidad/1000,plu.Cantidad) as Cantidad, 
 plu.Monto_Recibido/100 as Monto_Recibido , 
 #inf.MontoDesc/100 as MontoDesc,
  inf.MontoPromo/100 as MontoPromo,   
((plu.Monto_Recibido-ifnull(inf.MontoPromo,0))/100) as venta from plu
inner join (select * from total where 
total.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and total.Saved_Tkt=0 and total.MontoTicket!=0 
and (TIME_FORMAT(total.Tail_Hora,'%k')*1)>=tmp_horadesde
) tot 
on  tot.StoreNumber=plu.StoreNumber #(Se demora no carga)
and tot.Tail_Fecha=plu.Tail_Fecha and tot.Tail_NumPOS=plu.Tail_NumPOS 
and tot.Tail_NumTicketSL=plu.Tail_NumTicketSL
left join ( select 
inf.Tail_Fecha ,inf.StoreNumber ,inf.Tail_NumPOS, inf.Tail_NumTicketSL,
inf.SPF_ID, inf.CodigoPLU,  ifnull(sum(inf.MontoDesc),0) as MontoDesc, 
ifnull(sum(inf.MontoPromo),0) as MontoPromo
#, ifnull(max(inf.TailSeqHighByte),0) as TailSeqHighByte
from infospf  inf
where  #inf.Tail_Fecha='2015-03-30' 
 inf.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d')) 
#and inf.StoreNumber=104 
and inf.Tail_TicketCancelado=0
and inf.Tail_BadRec=0
#and inf.Tail_NumTicketSL=396 
#and inf.Tail_NumPOS=179
#inf.CodPromo Un producto tiene mas de una promo se repite.
group by inf.Tail_Fecha ,inf.StoreNumber ,inf.Tail_NumPOS, inf.Tail_NumTicketSL,
inf.SPF_ID, inf.CodigoPLU
 ) inf on plu.Tail_Fecha=inf.Tail_Fecha
and plu.StoreNumber=inf.StoreNumber and plu.Tail_NumPOS=inf.Tail_NumPOS
and plu.Tail_NumTicketSL=inf.Tail_NumTicketSL
where
 if( plu.TailSeqHighByte is null,plu.Sequence_ID, 
(plu.TailSeqHighByte*65536)+plu.Sequence_ID)=inf.SPF_ID
#and  plu.Tail_Fecha='2015-03-30' 
and plu.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
#and plu.StoreNumber=104 
and plu.Tail_TicketCancelado=0
and plu.Tail_BadRec=0
#and plu.Tail_NumTicketSL=9115
#and plu.Tail_NumPOS=179

union all( select dsc.archivo_venpro, 
dsc.Tail_Fecha, dsc.StoreNumber, dsc.Tail_NumPOS, dsc.Tail_NumTicketSL,
(TIME_FORMAT(tot.Tail_Hora,'%k')*1) as horatrx, 
 (TIME_FORMAT(dsc.Tail_Hora,'%k')*1) as horaproducto, 
dsc.Tail_Hora,
 dsc.NumDepartamento, dsc.CodigoPLU*1 as CodigoPLU, 
  (if(SUBSTRING(dsc.CodigoPLU*1,1,2)=25, 
 SUBSTRING(dsc.CodigoPLU*1,3,5),dsc.CodigoPLU))*1 as codigoproducto,
 null as Escaneado, 0 as Pesable,  
 0 as Cantidad,  0 as Monto_Recibido , 
 #dsc.MontoDescuento/100 as MontoDesc,
  0 as MontoPromo, 
 dsc.MontoDescuento/100 as venta
 from Discount dsc 
inner join (select * from total where 
total.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and total.Saved_Tkt=0 and total.MontoTicket!=0 
and (TIME_FORMAT(total.Tail_Hora,'%k')*1)>=tmp_horadesde ) tot 
on  tot.StoreNumber=dsc.StoreNumber #(Se demora no carga)
and tot.Tail_Fecha=dsc.Tail_Fecha and tot.Tail_NumPOS=dsc.Tail_NumPOS 
and tot.Tail_NumTicketSL=dsc.Tail_NumTicketSL
where  #dsc.StoreNumber=104 and
 #dsc.Tail_Fecha='2015-03-30' 
 dsc.Tail_Fecha=(DATE_FORMAT(DATE_SUB(CURDATE(), interval 0 DAY),'%Y-%m-%d'))
and dsc.Tail_TicketCancelado=0
and dsc.Tail_BadRec=0 and dsc.NumDepartamento!=0
#and dsc.Tail_NumTicketSL=9115
#and dsc.Tail_NumPOS=179
);



#---------------
set contar=0;
set contar= (SELECT ROW_COUNT());

if (contar > 0) then
SET rs = '1';
else
SET rs = concat('No se inserto registros v_ventaproductos, No se econtraron registros para insertar');
end if;

return rs;

END//
DELIMITER ;


-- Volcando estructura para evento ventaspro.ev_del_tablas
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `ev_del_tablas` ON SCHEDULE EVERY 1 DAY STARTS '2014-11-15 02:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

call sp_del_tablas();

END//
DELIMITER ;


-- Volcando estructura para evento ventaspro.ev_del_ventaproductos
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `ev_del_ventaproductos` ON SCHEDULE EVERY 1 DAY STARTS '2015-03-31 05:00:00' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN

call sp_del_ventaproductos();

END//
DELIMITER ;


-- Volcando estructura para evento ventaspro.prueba
DELIMITER //
CREATE DEFINER=`dba`@`172.22.191.198` EVENT `prueba` ON SCHEDULE EVERY 1 MINUTE STARTS '2015-02-05 11:22:50' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN

insert into pp (mm) values ('1');

END//
DELIMITER ;


-- Volcando estructura para vista ventaspro.vs_cambiopreciolinea
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_cambiopreciolinea`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_cambiopreciolinea` AS #Descuento Manual V2------
select distinct concat(DATE_FORMAT(d.Tail_Fecha,'%Y%m%d'), d.StoreNumber,d.Tail_NumPOS,d.Tail_NumTicketSL ) as llavetrx,
d.Tail_Fecha, d.StoreNumber, d.Tail_NumPOS, d.Tail_NumTicketSL,
time_format(d.Tail_Hora,'%k')  AS hora, d.Tail_Hora,
 d.Tail_NumCajero, d.CodigoPLU,  d.NumDescuento as tipodescuento, 'DESCUENTO MANUAL' as tipo,
 0 as  precioant, 0 as  precionuevo, 
 (d.MontoDescuento/100) as  MontoDescuento,1 as cantidad, s.NumSupervisor, 
 concat(d.StoreNumber,s.NumSupervisor)*1 as llavesupervisor
from discount d left join supervisor s on s.Tail_Fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
and s.Tail_TicketCancelado=0 and s.Tail_BadRec=0
and s.Tail_Fecha=d.Tail_Fecha
and s.StoreNumber= d.StoreNumber
and s.Tail_NumPOS=d.Tail_NumPOS
and s.Tail_NumTicketSL=d.Tail_NumTicketSL
where d.Tail_Fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
and d.PromoSPF=0
and d.Tail_TicketCancelado=0 and d.Tail_BadRec=0
#and d.StoreNumber=124 
#-------
union all
#override v2----
select distinct concat(DATE_FORMAT(p.Tail_Fecha,'%Y%m%d'), p.StoreNumber,p.Tail_NumPOS,p.Tail_NumTicketSL ) as llavetrx,
p.Tail_Fecha, p.StoreNumber, p.Tail_NumPOS, p.Tail_NumTicketSL,
time_format(p.Tail_Hora,'%k')  AS hora, p.Tail_Hora,
 p.Tail_NumCajero, '' as CodigoPLU, 0 as tipodescuento, 'OVERRIDE' as tipo,
 (p.PrecioOriginal/100) as  precioant, (p.PrecioReducido/100) as  precionuevo,
 (p.PrecioReducido - p.PrecioOriginal)/100 as MontoDescuento,1 as cantidad, s.NumSupervisor,
concat(p.StoreNumber,s.NumSupervisor)*1 as llavesupervisor
from priceoverride p left join  supervisor s on s.Tail_Fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
and s.Tail_TicketCancelado=0 and s.Tail_BadRec=0
and s.Tail_Fecha=p.Tail_Fecha
and s.StoreNumber= p.StoreNumber
and s.Tail_NumPOS=p.Tail_NumPOS
and s.Tail_NumTicketSL=p.Tail_NumTicketSL
where p.Tail_Fecha=( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d')) 
and p.Tail_TicketCancelado=0 and p.Tail_BadRec=0
#and p.StoreNumber=124 ;


-- Volcando estructura para vista ventaspro.vs_infocashier
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_infocashier`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`%` VIEW `vs_infocashier` AS select  CURDATE() as fechareg,concat(StoreNumber,Tail_NumCajero) as llave, 
StoreNumber, Tail_NumCajero, CashierID, CashierName   
from infoemployeeid where Tail_Fecha= ( DATE_FORMAT(DATE_SUB(CURDATE(), interval 1 DAY),'%Y-%m-%d') ) 
and Tail_TicketCancelado=0 and Tail_BadRec=0
group by StoreNumber, Tail_NumCajero ;


-- Volcando estructura para vista ventaspro.vs_ventahora
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_ventahora`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`172.22.191.171` VIEW `vs_ventahora` AS select total.Tail_Fecha AS Tail_Fecha,
total.StoreNumber AS StoreNumber,
(time_format(total.Tail_Hora,'%k') * 1) AS hora,
(sum(total.MontoTicket) / 100) AS venta 
from total 
where (total.Tail_Fecha = date_format((curdate() - interval 0 day),'%Y-%m-%d')) 
and total.Tail_TicketCancelado = 0
 and total.Saved_Tkt = 0
 and total.MontoTicket <> 0
 group by total.Tail_Fecha,total.StoreNumber,hora 
 order by total.Tail_Fecha,total.StoreNumber,hora desc ;


-- Volcando estructura para vista ventaspro.vs_ventahora_del
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vs_ventahora_del`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dba`@`172.22.191.171` VIEW `vs_ventahora_del` AS select distinct `total`.`Tail_Fecha` AS `Tail_fecha`,`total`.`StoreNumber` AS `StoreNumber` from `total` where (`total`.`Tail_Fecha` = date_format((curdate() - interval 0 day),'%Y-%m-%d')) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
