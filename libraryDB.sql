USE [master]
GO
/****** Object:  Database [libraryDB]    Script Date: 20/11/2020 21:23:06 ******/
CREATE DATABASE [libraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\libraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\libraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [libraryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [libraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [libraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [libraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'libraryDB', N'ON'
GO
ALTER DATABASE [libraryDB] SET QUERY_STORE = OFF
GO
USE [libraryDB]
GO
/****** Object:  Table [dbo].[tblAuthor]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAuthor](
	[authorId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](30) NULL,
	[lastName] [varchar](30) NULL,
 CONSTRAINT [PK_tblAuthor2_1] PRIMARY KEY CLUSTERED 
(
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NULL,
	[ISBN] [char](10) NULL,
	[rarityId] [int] NULL,
	[title] [varchar](30) NULL,
	[isBorrowed] [bit] NULL,
 CONSTRAINT [PK_tblBook2] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBook/Author]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook/Author](
	[bookId] [int] NOT NULL,
	[authorId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblBook/Author2] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC,
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMember]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMember](
	[memberId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](30) NULL,
	[lastName] [varchar](30) NULL,
	[pointsAvailable] [int] NULL,
 CONSTRAINT [PK_tblMember2] PRIMARY KEY CLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRarity]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRarity](
	[rarityId] [int] IDENTITY(1,1) NOT NULL,
	[points] [int] NULL,
	[description] [varchar](20) NULL,
 CONSTRAINT [PK_tblRarity] PRIMARY KEY CLUSTERED 
(
	[rarityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRequisition]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRequisition](
	[requisitionId] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [int] NULL,
	[bookId] [int] NULL,
	[requisitionDate] [date] NULL,
	[devolutionDate] [date] NULL,
 CONSTRAINT [PK_tblRequisition2] PRIMARY KEY CLUSTERED 
(
	[requisitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAuthor] ON 

INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (1, N'Miguel', N'Cervantes')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (2, N'Antoine', N'Saint-Exupéry')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (3, N'Lewis ', N'Caroll')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (4, N'Fernando ', N'Pessoa')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (5, N'José ', N'Saramago')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (6, N'Eça', N'Queirós')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (7, N'Gil', N'Vicente')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (8, N'Luís', N'Camões')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (9, N'Florbela', N'Espanca')
INSERT [dbo].[tblAuthor] ([authorId], [firstName], [lastName]) VALUES (10, N'Miguel', N'Torga')
SET IDENTITY_INSERT [dbo].[tblAuthor] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBook] ON 

INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (1, 1, N'9000000000', 4, N'Don Quixote', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (2, 1, N'9000000001', 2, N'La Galatea', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (3, 2, N'9000000002', 3, N'The Little Prince', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (4, 2, N'9000000003', 4, N'Night Flight', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (5, 3, N'9000000004', 5, N'Jabberwocky', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (6, 3, N'9000000005', 1, N'Alice in the Wonderland', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (7, 4, N'9000000006', 5, N'Message ', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (8, 4, N'9000000007', 5, N'The Book of Disquiet', 1)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (9, 5, N'9000000008', 4, N'Baltasar and Blimunda', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (10, 5, N'9000000009', 3, N'Land of Sin', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (11, 6, N'9000000010', 2, N'The Crime of Father Amaro', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (12, 6, N'9000000011', 1, N'The Maias', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (13, 7, N'9000000012', 2, N'Auto da Índia', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (14, 7, N'9000000013', 3, N'The Boat Plays', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (15, 8, N'9000000014', 1, N'Sonetos de Camões', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (16, 8, N'9000000015', 2, N'The Lusiads', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (17, 9, N'9000000016', 3, N'The Masks of Fate', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (18, 9, N'9000000017', 4, N'Moor in Bloom', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (19, 10, N'9000000018', 1, N'The Creation of the World', 0)
INSERT [dbo].[tblBook] ([bookId], [authorId], [ISBN], [rarityId], [title], [isBorrowed]) VALUES (20, 10, N'9000000019', 5, N'Animals', 0)
SET IDENTITY_INSERT [dbo].[tblBook] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMember] ON 

INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (1, N'Lucas', N'Taveira', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (2, N'Pedro', N'Santos', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (3, N'Maria', N'Carneiro', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (4, N'Sara', N'Lotus', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (5, N'Ricardo', N'Organista', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (6, N'Rita', N'Galego', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (7, N'Tiago', N'Lopes', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (8, N'Vasco', N'Figueiredo', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (9, N'Vitória', N'Carmen', 10)
INSERT [dbo].[tblMember] ([memberId], [firstName], [lastName], [pointsAvailable]) VALUES (10, N'Xavier', N'Cardoso', 10)
SET IDENTITY_INSERT [dbo].[tblMember] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRarity] ON 

INSERT [dbo].[tblRarity] ([rarityId], [points], [description]) VALUES (1, 1, N'Very Common')
INSERT [dbo].[tblRarity] ([rarityId], [points], [description]) VALUES (2, 2, N'Common')
INSERT [dbo].[tblRarity] ([rarityId], [points], [description]) VALUES (3, 3, N'Uncommon')
INSERT [dbo].[tblRarity] ([rarityId], [points], [description]) VALUES (4, 4, N'Rare')
INSERT [dbo].[tblRarity] ([rarityId], [points], [description]) VALUES (5, 5, N'Extremely Rare')
SET IDENTITY_INSERT [dbo].[tblRarity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRequisition] ON 

INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1, 1, 1, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1029, 1, 1, CAST(N'2020-11-11' AS Date), CAST(N'2020-11-11' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1031, 1, 2, CAST(N'2020-11-11' AS Date), CAST(N'2020-11-11' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1034, 1, 3, CAST(N'2020-11-11' AS Date), CAST(N'2020-11-11' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1035, 1, 5, CAST(N'2020-11-11' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1036, 1, 4, CAST(N'2020-11-11' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1037, 1, 6, CAST(N'2020-11-11' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1038, 2, 2, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1039, 3, 3, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1040, 4, 4, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1041, 5, 5, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1042, 6, 6, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1043, 7, 7, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1044, 8, 8, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1045, 9, 9, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (1046, 10, 10, CAST(N'2020-10-20' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (2017, 6, 1, CAST(N'2020-11-15' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (2018, 7, 7, CAST(N'2020-11-15' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (2019, 7, 8, CAST(N'2020-11-15' AS Date), NULL)
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (2020, 10, 16, CAST(N'2020-11-15' AS Date), CAST(N'2020-11-15' AS Date))
INSERT [dbo].[tblRequisition] ([requisitionId], [memberId], [bookId], [requisitionDate], [devolutionDate]) VALUES (2021, 2, 3, CAST(N'2020-11-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[tblRequisition] OFF
GO
/****** Object:  Index [UC_Requisition]    Script Date: 20/11/2020 21:23:07 ******/
ALTER TABLE [dbo].[tblRequisition] ADD  CONSTRAINT [UC_Requisition] UNIQUE NONCLUSTERED 
(
	[memberId] ASC,
	[bookId] ASC,
	[requisitionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBook]  WITH CHECK ADD  CONSTRAINT [FK_tblBook_tblRarity] FOREIGN KEY([rarityId])
REFERENCES [dbo].[tblRarity] ([rarityId])
GO
ALTER TABLE [dbo].[tblBook] CHECK CONSTRAINT [FK_tblBook_tblRarity]
GO
ALTER TABLE [dbo].[tblBook/Author]  WITH CHECK ADD  CONSTRAINT [FK_tblBook/Author_tblAuthor1] FOREIGN KEY([authorId])
REFERENCES [dbo].[tblAuthor] ([authorId])
GO
ALTER TABLE [dbo].[tblBook/Author] CHECK CONSTRAINT [FK_tblBook/Author_tblAuthor1]
GO
ALTER TABLE [dbo].[tblBook/Author]  WITH CHECK ADD  CONSTRAINT [FK_tblBook/Author_tblBook1] FOREIGN KEY([bookId])
REFERENCES [dbo].[tblBook] ([bookId])
GO
ALTER TABLE [dbo].[tblBook/Author] CHECK CONSTRAINT [FK_tblBook/Author_tblBook1]
GO
ALTER TABLE [dbo].[tblBook/Author]  WITH CHECK ADD  CONSTRAINT [FK_tblBook/Author_tblBook2] FOREIGN KEY([authorId])
REFERENCES [dbo].[tblBook] ([bookId])
GO
ALTER TABLE [dbo].[tblBook/Author] CHECK CONSTRAINT [FK_tblBook/Author_tblBook2]
GO
ALTER TABLE [dbo].[tblRequisition]  WITH CHECK ADD  CONSTRAINT [FK_tblRequisition_tblBook] FOREIGN KEY([bookId])
REFERENCES [dbo].[tblBook] ([bookId])
GO
ALTER TABLE [dbo].[tblRequisition] CHECK CONSTRAINT [FK_tblRequisition_tblBook]
GO
ALTER TABLE [dbo].[tblRequisition]  WITH CHECK ADD  CONSTRAINT [FK_tblRequisition_tblMember] FOREIGN KEY([memberId])
REFERENCES [dbo].[tblMember] ([memberId])
GO
ALTER TABLE [dbo].[tblRequisition] CHECK CONSTRAINT [FK_tblRequisition_tblMember]
GO
/****** Object:  StoredProcedure [dbo].[Devolucao]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================== --
-- Author:		<Author, Alexandre>                     --
-- Create date: <Create Date, 7/11/2020 02:27:14>       --
-- Description:	<Description, DevolucaoStoredProcedure> --
-- ==================================================== --

CREATE PROCEDURE [dbo].[Devolucao]
	-- INPUT/OUTPUT variables fed into the conditions
	@memberId int, 
	@bookId int,
	@success BIT OUTPUT, -- 0: If failure, 1: If success,
	@Detalhe varchar(50) OUTPUT -- If failure show detail 
AS
BEGIN
	-- Declare condition variables 
	DECLARE @isBorrowed BIT
	DECLARE @exist BIT
	SET NOCOUNT ON; -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.

	-- Set the book borrowed condition
	SET @isBorrowed = (
    SELECT Top (1)
         isBorrowed
    FROM 
        [dbo].[tblBook]
	WHERE
		[dbo].[tblBook].bookId=@bookId
		);

	-- Check the book existence
	IF(@isBorrowed IS NULL)
	BEGIN
	   SET @success=0
	   SET @Detalhe='The book does not exist';
	   RETURN
	END
    
	-- Set the member existence condition
	SET @exist = (
			SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END AS [Value]
				FROM [dbo].[tblMember]
			WHERE [memberId]=@memberId)
	
	-- Check the member existence with the exist SQL operator
	IF(@exist=0)
	BEGIN
	   SET @success=0
	   SET @Detalhe='The member does not exist';
	   RETURN
	END

	-- TRY/CATCH statement: tries and specifies the process of devolution and throws an exception in case of failure
	BEGIN TRY

	-- Set the devolutionDate in tblRequisition
		UPDATE [dbo].[tblRequisition]
			SET [devolutionDate] = CAST( GETDATE() AS Date )
				WHERE
					[memberId] = @memberId and
					[bookId] = @bookId and
					[requisitionDate] is not null and
					[devolutionDate] is null

   -- UPDATE the isBorrowed state to available in tblRequisition
		UPDATE [dbo].[tblBook]
			SET [isBorrowed] = 0
		WHERE [dbo].[tblBook].bookId=@bookId

   -- Return to the interface a success message	
		SET @success=1
		SET @Detalhe = 'Success'
	END TRY 
	
   -- Return to the interface a failure message	
	BEGIN CATCH  
		SET @success=0
		SET @Detalhe = 'Failure'
	END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[RequisicaoLivroMembro]    Script Date: 20/11/2020 21:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================== --
-- Author:		<Author, Alexandre>                     --
-- Create date: <Create Date, 7/11/2020 02:27:14>       --
-- Description:	<Description, OrderBookStoredProcedure> --
-- ==================================================== --

CREATE PROCEDURE [dbo].[RequisicaoLivroMembro]
	-- INPUT/OUTPUT variables fed into the conditions
	@memberId int, 
	@bookId int,
	@success BIT OUTPUT, -- 0: If failure, 1: If success,
	@Detalhe varchar(50) OUTPUT -- If failure show detail 
AS
BEGIN
	-- Declare condition variables 
    DECLARE @isBorrowed BIT
	DECLARE @nPontosLivro int
	DECLARE @nPontoUsados int
	DECLARE @nPontoMaximo int
	DECLARE @exist BIT
	SET NOCOUNT ON; -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	
	-- Set the book borrowed condition
	SET @isBorrowed = (
    SELECT Top (1)
         isBorrowed
    FROM 
        [dbo].[tblBook]
	Where 
	    [dbo].[tblBook].bookId=@bookId);
	
	-- Check the book existence
    IF(@isBorrowed IS NULL)
	BEGIN
	   SET @success=0
	   SET @Detalhe='The book does not exist';
	   RETURN
	END
    
	-- Check if the book was borrowed
	IF @isBorrowed = 1
	BEGIN
	   SET @success=0
	   SET @Detalhe='Book not available in the library'
	   RETURN
	END

	-- Set the member existence condition
	SET @exist = (
			SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END AS [Value]
				FROM [dbo].[tblMember]
			WHERE [memberId]=@memberId)

	-- Check the member existence with the exist SQL operator
	IF(@exist=0)
	BEGIN
	   SET @success=0
	   SET @Detalhe='The member does not exist';
	   RETURN
	END

	-- Get the number of points of the book
	SET @nPontosLivro = (
		SELECT TOP (1) [dbo].[tblRarity].points
			FROM [libraryDB].[dbo].[tblBook],  [dbo].[tblRarity]
			where 
			[libraryDB].[dbo].[tblBook].rarityId = [dbo].[tblRarity].rarityId 
			and [libraryDB].[dbo].[tblBook].bookId=@bookId);

	-- Get the current number of points of the member
     Set @nPontoUsados = (
		SELECT sum([dbo].[tblRarity].points)
		FROM 
			[dbo].[tblRequisition] inner join [dbo].[tblBook] on [dbo].[tblRequisition].bookId=[dbo].[tblBook].bookId
			inner join [dbo].[tblRarity] on [dbo].[tblRarity].rarityId=[dbo].[tblBook].rarityId
			where [devolutionDate] is null and [memberId]=@memberId
	 )

	 -- Get the restriction of maximum number of points for members
	 Set @nPontoMaximo = (
		SELECT TOP (1) pointsAvailable
		FROM 
		[dbo].[tblMember]
		where [memberId]=@memberId
	 )

	 -- Check if the member has enough points to order the book
	 if (@nPontoUsados+@nPontosLivro) > @nPontoMaximo
	 BEGIN
		SET @success=0
	    SET @Detalhe='You do not have enough points to order this book'
		RETURN
	 END

	--[Arriving at this step, it's now possible to order the book]--

	-- Insert the requisition data to the tblRequisition
	INSERT INTO [dbo].[tblRequisition]
           ([memberId]
           ,[bookId]
           ,[requisitionDate]
           ,[devolutionDate])
     VALUES
           (@memberId,
            @bookId,
           CAST( GETDATE() AS Date ), -- Converts the value of GETDATE() into a Date datatype
           null)

   -- Update the state of the book to borrowed	   
   UPDATE [dbo].[tblBook]
      SET [isBorrowed] = 1
   WHERE [dbo].[tblBook].bookId=@bookId

   -- Retrieve success message
	SET @success=1
	SET @Detalhe='Success'
END
GO
USE [master]
GO
ALTER DATABASE [libraryDB] SET  READ_WRITE 
GO
