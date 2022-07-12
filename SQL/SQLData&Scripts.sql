USE [master]
GO
/****** Object:  Database [almacenados]    Script Date: 9/07/2022 2:36:29 a. m. ******/
CREATE DATABASE [almacenados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'almacenados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\almacenados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'almacenados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\almacenados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [almacenados] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [almacenados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [almacenados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [almacenados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [almacenados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [almacenados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [almacenados] SET ARITHABORT OFF 
GO
ALTER DATABASE [almacenados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [almacenados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [almacenados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [almacenados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [almacenados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [almacenados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [almacenados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [almacenados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [almacenados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [almacenados] SET  ENABLE_BROKER 
GO
ALTER DATABASE [almacenados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [almacenados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [almacenados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [almacenados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [almacenados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [almacenados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [almacenados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [almacenados] SET RECOVERY FULL 
GO
ALTER DATABASE [almacenados] SET  MULTI_USER 
GO
ALTER DATABASE [almacenados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [almacenados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [almacenados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [almacenados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [almacenados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [almacenados] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'almacenados', N'ON'
GO
ALTER DATABASE [almacenados] SET QUERY_STORE = OFF
GO
USE [almacenados]
GO
/****** Object:  UserDefinedTableType [dbo].[id_personas]    Script Date: 9/07/2022 2:36:29 a. m. ******/
CREATE TYPE [dbo].[id_personas] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](30) NULL,
	[Fecha_Nacimiento] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[personas] ON 
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (1, N'David Fernando Rosero Guerrero', N'3178444099', N'Jul  3 1984 12:00AM')
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (2, N'Lorena Patricia Collazos Narvaez', N'3105080853', N'Feb  5 1986 12:00AM')
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (3, N'Oscar Ivan Paz Ramirez', N'3101024853', N'1984/12/09')
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (4, N'Gabriel Fernando Montenegro', N'3142485391', N'1992/02/22')
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (6, N'Valentina Rosero Collazos', N'3105835916', N'2010/05/12')
GO
INSERT [dbo].[personas] ([Id], [Nombre], [Telefono], [Fecha_Nacimiento]) VALUES (7, N'Santiago Rosero', N'315412477', N'Jul 11 2010 12:00AM')
GO
SET IDENTITY_INSERT [dbo].[personas] OFF
GO
/****** Object:  StoredProcedure [dbo].[persona_ID]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[persona_ID] 
(@Id int = 0)
AS
BEGIN
	SELECT * FROM personas
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[personasActualizar]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[personasActualizar]
@Id int,
@Nombre nvarchar(50),
@Telefono nvarchar(30),
@Fecha_Nacimiento datetime

as
begin
	update personas
	set Nombre = @Nombre,
		Telefono = @Telefono,
		Fecha_Nacimiento = @Fecha_Nacimiento
	Where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[personasBorrar]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[personasBorrar]
@Id int
as
begin
	delete from personas where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[personasInsertar]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[personasInsertar]
@Nombre nvarchar (50),
@Telefono nvarchar (30),
@Fecha_Nacimiento datetime

as
begin	
	Insert Into personas (Nombre, Telefono, Fecha_Nacimiento)
	values(@Nombre, @Telefono, @Fecha_Nacimiento);
End
GO
/****** Object:  StoredProcedure [dbo].[personasMostrar]    Script Date: 9/07/2022 2:36:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personasMostrar]
AS
BEGIN
	Select * from personas
END
GO
USE [master]
GO
ALTER DATABASE [almacenados] SET  READ_WRITE 
GO
