USE [master]
GO
/****** Object:  Database [WebDauThau]    Script Date: 10/4/2022 8:29:26 AM ******/
CREATE DATABASE [WebDauThau]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebDauThau', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\WebDauThau.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebDauThau_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\WebDauThau_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebDauThau] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebDauThau].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebDauThau] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebDauThau] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebDauThau] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebDauThau] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebDauThau] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebDauThau] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebDauThau] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebDauThau] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebDauThau] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebDauThau] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebDauThau] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebDauThau] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebDauThau] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebDauThau] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebDauThau] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebDauThau] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebDauThau] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebDauThau] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebDauThau] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebDauThau] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebDauThau] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebDauThau] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebDauThau] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebDauThau] SET  MULTI_USER 
GO
ALTER DATABASE [WebDauThau] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebDauThau] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebDauThau] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebDauThau] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebDauThau] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebDauThau', N'ON'
GO
ALTER DATABASE [WebDauThau] SET QUERY_STORE = OFF
GO
USE [WebDauThau]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WebDauThau]
GO
/****** Object:  User [NT AUTHORITY\IUSR]    Script Date: 10/4/2022 8:29:28 AM ******/
CREATE USER [NT AUTHORITY\IUSR] FOR LOGIN [NT AUTHORITY\IUSR]
GO
/****** Object:  User [IIS APPPOOL\Web Luu Tru]    Script Date: 10/4/2022 8:29:28 AM ******/
CREATE USER [IIS APPPOOL\Web Luu Tru] FOR LOGIN [IIS APPPOOL\Web Luu Tru] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\IUSR]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\IUSR]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\Web Luu Tru]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\Web Luu Tru]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/4/2022 8:29:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[HashedPassword] [varbinary](max) NOT NULL,
	[Key] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File]    Script Date: 10/4/2022 8:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Thông báo ID] [bigint] NULL,
	[Kết quả ID] [bigint] NULL,
	[Path] [nvarchar](max) NOT NULL,
	[FileSize] [int] NOT NULL,
	[Hashed Content] [varbinary](max) NOT NULL,
	[Content] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaLuaChonNhaThau_ThongTinChiTiet]    Script Date: 10/4/2022 8:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaLuaChonNhaThau_ThongTinChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Loại thông báo] [nvarchar](20) NULL,
	[Số TBMT] [nvarchar](50) NOT NULL,
	[Số hiệu KHLCNT] [nvarchar](50) NOT NULL,
	[Tên gói thầu] [nvarchar](max) NOT NULL,
	[Tên dự án/ Dự toán mua sắm] [nvarchar](max) NULL,
	[Bên mời thầu] [nvarchar](max) NULL,
	[Hình thức lựa chọn NT] [nvarchar](50) NULL,
	[Giá dự toán] [bigint] NULL,
	[Giá gói thầu] [bigint] NULL,
	[Nhà thầu trúng thầu] [nvarchar](max) NULL,
	[Giá trúng thầu] [bigint] NULL,
	[Hình thức hợp đồng] [nvarchar](20) NULL,
	[Thời gian thực hiện HĐ] [int] NULL,
	[Văn bản phê duyệt] [nvarchar](max) NULL,
	[Ngày phê duyệt] [datetime2](0) NULL,
	[Ngày đăng tải] [datetime2](0) NULL,
	[Lĩnh vực] [nvarchar](20) NULL,
	[AccountID] [bigint] NULL,
 CONSTRAINT [PK_KetQuaLuaChonNhaThau_ThongTinChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBaoMoiThau_ThongTinChiTiet]    Script Date: 10/4/2022 8:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBaoMoiThau_ThongTinChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hình thức thông báo] [nvarchar](50) NULL,
	[Loại thông báo] [nvarchar](50) NULL,
	[Số TBMT] [nvarchar](50) NOT NULL,
	[Số hiệu KHLCNT] [nvarchar](50) NOT NULL,
	[Thời điểm đăng tải] [datetime2](0) NULL,
	[Tên KHLCNT] [nvarchar](max) NULL,
	[Lĩnh vực] [nvarchar](20) NULL,
	[Bên mời thầu] [nvarchar](max) NULL,
	[Tên gói thầu] [nvarchar](max) NOT NULL,
	[Phân loại] [nvarchar](50) NULL,
	[Tên dự toán mua sắm] [nvarchar](max) NULL,
	[Chi tiết nguồn vốn] [nvarchar](max) NULL,
	[Loại hợp đồng] [nvarchar](20) NULL,
	[Hình thức lựa chọn nhà thầu] [nvarchar](50) NULL,
	[Phương thức LCNT] [nvarchar](30) NULL,
	[Thời gian thực hiện hợp đồng] [int] NULL,
	[Hình thức dự thầu] [nvarchar](20) NULL,
	[Thời gian nhận E-HSDT từ ngày] [datetime2](0) NULL,
	[Thời gian nhận E-HSDT đến ngày] [datetime2](0) NULL,
	[Phát hành E-HSMT] [nvarchar](20) NULL,
	[Thời gian hiệu lực của E-HSDT] [int] NULL,
	[Địa điểm nhận HSDT] [nvarchar](max) NULL,
	[Địa điểm thực hiện gói thầu] [nvarchar](max) NULL,
	[Thời điểm đóng/mở thầu] [datetime2](0) NULL,
	[Địa điểm mở thầu] [nvarchar](max) NULL,
	[Dự toán gói thầu] [bigint] NULL,
	[Số tiền bảo đảm dự thầu] [bigint] NULL,
	[Hình thức bảo đảm dự thầu] [nvarchar](20) NULL,
	[Làm rõ E-HSMT] [nvarchar](50) NULL,
	[Lần chỉnh sửa] [int] NOT NULL,
	[AccountID] [bigint] NULL,
 CONSTRAINT [PK_ThongBaoMoiThau_ThongTinChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[File] ADD  CONSTRAINT [DF_File_Content]  DEFAULT ((0)) FOR [Content]
GO
ALTER TABLE [dbo].[ThongBaoMoiThau_ThongTinChiTiet] ADD  CONSTRAINT [DF_ThongBaoMoiThau_ThongTinChiTiet_Lần chỉnh sửa]  DEFAULT ((0)) FOR [Lần chỉnh sửa]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'FileSize'
GO
USE [master]
GO
ALTER DATABASE [WebDauThau] SET  READ_WRITE 
GO
