USE [REPORTS]
GO
/****** Object:  Table [dbo].[semana]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semana](
	[numsemana] [int] NOT NULL,
	[semana] [nvarchar](50) NULL,
 CONSTRAINT [PK_semana] PRIMARY KEY CLUSTERED 
(
	[numsemana] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restriccion_digitado]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restriccion_digitado](
	[codtienda] [int] NULL,
	[sku] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planilla]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planilla](
	[AÑO] [int] NULL,
	[MES] [int] NULL,
	[COD] [int] NULL,
	[UNIDAD] [nvarchar](50) NULL,
	[PUESTO] [nvarchar](50) NULL,
	[PLLA] [nvarchar](150) NULL,
	[CODIGO] [int] NULL,
	[COLABORADOR] [nvarchar](150) NULL,
	[DOC] [nvarchar](50) NULL,
	[NUMDOC] [int] NULL,
	[FE_NACI] [datetime] NULL,
	[SEX] [nvarchar](50) NULL,
	[FE_INGR] [datetime] NULL,
	[FE_CESE] [datetime] NULL,
	[COD_MOD] [nvarchar](50) NULL,
	[MODALIDAD] [nvarchar](200) NULL,
	[TI_SITU] [nvarchar](50) NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mes]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mes](
	[nummes] [int] NOT NULL,
	[mes] [varchar](50) NULL,
 CONSTRAINT [PK_mes] PRIMARY KEY CLUSTERED 
(
	[nummes] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[digitados_diario]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[digitados_diario](
	[fecha] [datetime] NOT NULL,
	[codtienda] [int] NOT NULL,
	[nomtienda] [nvarchar](250) NULL,
	[codcajero] [int] NULL,
	[cajero] [nvarchar](250) NULL,
	[division] [nvarchar](250) NULL,
	[depart] [nvarchar](250) NULL,
	[subdep] [nvarchar](250) NULL,
	[sku] [int] NOT NULL,
	[skudescrip] [nvarchar](250) NULL,
	[pos] [int] NULL,
	[cantproduc] [decimal](18, 2) NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[digitados]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[digitados](
	[ano] [int] NULL,
	[numsemestre] [int] NULL,
	[nummes] [int] NULL,
	[numsemana] [int] NULL,
	[codtienda] [int] NOT NULL,
	[nomtienda] [nvarchar](250) NULL,
	[codcajero] [int] NULL,
	[cajero] [nvarchar](250) NULL,
	[division] [nvarchar](250) NULL,
	[depart] [nvarchar](250) NULL,
	[subdep] [nvarchar](250) NULL,
	[sku] [int] NOT NULL,
	[skudescrip] [nvarchar](250) NULL,
	[pos] [int] NULL,
	[cantproduc] [decimal](18, 2) NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cambiosprecio]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cambiosprecio](
	[ano] [int] NULL,
	[numsemestre] [int] NULL,
	[nummes] [int] NULL,
	[numsemana] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[codtienda] [int] NULL,
	[nomtienda] [nvarchar](100) NULL,
	[codsupervisor] [int] NULL,
	[nomsupervisor] [nvarchar](250) NULL,
	[codrebaja] [nvarchar](50) NULL,
	[rebaja] [nvarchar](50) NULL,
	[codcajero] [int] NULL,
	[cajero] [nvarchar](250) NULL,
	[pos] [int] NULL,
	[trx] [int] NULL,
	[sku] [int] NOT NULL,
	[skudescrip] [nvarchar](250) NULL,
	[subdep] [nvarchar](250) NULL,
	[marca] [nvarchar](250) NULL,
	[estado] [nvarchar](50) NULL,
	[preciocosto] [decimal](18, 2) NULL,
	[preciovigente] [decimal](18, 2) NULL,
	[unidadmedida] [nvarchar](50) NULL,
	[codvendedor] [int] NULL,
	[vendedor] [nvarchar](250) NULL,
	[uniddscto] [decimal](18, 2) NULL,
	[montorebaja] [decimal](18, 2) NULL,
	[montoventadscto] [decimal](18, 2) NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[velocidad_trx]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[velocidad_trx](
	[fecha] [datetime] NULL,
	[codtienda] [int] NULL,
	[tienda] [nvarchar](50) NULL,
	[codcajero] [int] NULL,
	[cajero] [nvarchar](50) NULL,
	[tipotransaccion] [nvarchar](50) NULL,
	[codtipoterminal] [int] NULL,
	[tipoterminal] [nvarchar](50) NULL,
	[hhini] [int] NULL,
	[pos] [int] NULL,
	[trx] [int] NULL,
	[itemxmin] [decimal](18, 8) NULL,
	[itemxseg] [decimal](18, 8) NULL,
	[cant_item_pos] [int] NULL,
	[cant_trx_terminal] [int] NULL,
	[duracseg_digesc_item] [decimal](18, 8) NULL,
	[cant_item_terminal] [int] NULL,
	[duracseg_trx] [int] NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[velocidad_semanal]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[velocidad_semanal](
	[top100] [int] NULL,
	[ano] [int] NULL,
	[numsemestre] [int] NULL,
	[nummes] [int] NULL,
	[numsemana] [int] NULL,
	[codtienda] [int] NULL,
	[scannerbalanza] [nvarchar](50) NULL,
	[codcajero] [int] NULL,
	[cajero] [nvarchar](150) NULL,
	[itemxmin] [decimal](18, 8) NULL,
	[trx] [int] NULL,
	[rangovelocidad] [nvarchar](50) NULL,
	[fechaactualizacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tienda]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tienda](
	[codtienda] [int] NOT NULL,
	[nomtienda] [nvarchar](50) NOT NULL,
	[formato] [nvarchar](20) NULL,
	[scanner] [nvarchar](10) NULL,
	[zona] [nvarchar](10) NULL,
 CONSTRAINT [PK_tienda] PRIMARY KEY CLUSTERED 
(
	[codtienda] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiempo]    Script Date: 02/07/2014 00:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiempo](
	[fecha] [datetime] NOT NULL,
	[numsemana] [int] NULL,
	[nummes] [int] NULL,
	[numsemestre] [int] NULL,
	[ano] [int] NULL,
 CONSTRAINT [PK_tiempo] PRIMARY KEY CLUSTERED 
(
	[fecha] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tiempo_mes]    Script Date: 02/07/2014 00:10:45 ******/
ALTER TABLE [dbo].[tiempo]  WITH CHECK ADD  CONSTRAINT [FK_tiempo_mes] FOREIGN KEY([nummes])
REFERENCES [dbo].[mes] ([nummes])
GO
ALTER TABLE [dbo].[tiempo] CHECK CONSTRAINT [FK_tiempo_mes]
GO
/****** Object:  ForeignKey [FK_tiempo_semana]    Script Date: 02/07/2014 00:10:45 ******/
ALTER TABLE [dbo].[tiempo]  WITH CHECK ADD  CONSTRAINT [FK_tiempo_semana] FOREIGN KEY([numsemana])
REFERENCES [dbo].[semana] ([numsemana])
GO
ALTER TABLE [dbo].[tiempo] CHECK CONSTRAINT [FK_tiempo_semana]
GO
