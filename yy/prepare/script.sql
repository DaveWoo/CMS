USE [master]
GO
/****** Object:  Database [yyCms]    Script Date: 12/28/2016 10:18:25 AM ******/
CREATE DATABASE [yyCms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yyCms', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQL12\MSSQL\DATA\yyCms.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'yyCms_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQL12\MSSQL\DATA\yyCms_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [yyCms] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yyCms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yyCms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [yyCms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [yyCms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [yyCms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [yyCms] SET ARITHABORT OFF 
GO
ALTER DATABASE [yyCms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yyCms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yyCms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yyCms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yyCms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [yyCms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [yyCms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yyCms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [yyCms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yyCms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [yyCms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yyCms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yyCms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yyCms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yyCms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yyCms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yyCms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yyCms] SET RECOVERY FULL 
GO
ALTER DATABASE [yyCms] SET  MULTI_USER 
GO
ALTER DATABASE [yyCms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yyCms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yyCms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yyCms] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [yyCms] SET DELAYED_DURABILITY = DISABLED 
GO
USE [yyCms]
GO
/****** Object:  User [saa]    Script Date: 12/28/2016 10:18:25 AM ******/
CREATE USER [saa] FOR LOGIN [saa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [doctor]    Script Date: 12/28/2016 10:18:25 AM ******/
CREATE USER [doctor] FOR LOGIN [doctor] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [doctor]
GO
/****** Object:  Table [dbo].[yy_Banner]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Banner](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TypeIDs] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[LinkUrl] [nvarchar](500) NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Banner_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Banner_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Banner_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Fans_Wechat]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Fans_Wechat](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[openid] [nvarchar](200) NOT NULL,
	[nickname] [nvarchar](200) NOT NULL,
	[language] [nvarchar](50) NOT NULL,
	[sex] [int] NOT NULL,
	[province] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[headimgurl] [nvarchar](500) NOT NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[Longitude] [nvarchar](50) NOT NULL,
	[Precision] [nvarchar](50) NOT NULL,
	[remark] [nvarchar](500) NOT NULL,
	[unionid] [nvarchar](50) NOT NULL,
	[LOCATIONUpdateTime] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Fans_Wechat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_FriendLink]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_FriendLink](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](200) NOT NULL,
	[Summary] [nvarchar](1000) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[Recommend] [int] NOT NULL,
	[SiteUrl] [nvarchar](500) NOT NULL,
	[DefaultImg] [nvarchar](500) NOT NULL,
	[Score] [decimal](18, 2) NOT NULL,
	[IsShow] [int] NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CanReply] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_FriendLink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Keywords]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Keywords](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ApplyType] [int] NOT NULL,
	[TypeIDs] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[ReplaceContent] [nvarchar](1000) NOT NULL,
	[ReplaceCount] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Keywords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Message]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Message](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Platform] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](200) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_News]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_News](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TypeIDs] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[TargetPlatforms] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](200) NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[Summary] [nvarchar](1000) NOT NULL,
	[DefaultImg] [nvarchar](500) NOT NULL,
	[ImgList] [nvarchar](max) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[Recommend] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CanReply] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[WechatMediaID] [nvarchar](50) NOT NULL,
	[WechatNewsUrl] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_yy_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_News_Schedule]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_News_Schedule](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TypeIDs] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[KeyWords] [nvarchar](100) NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[Summary] [nvarchar](200) NOT NULL,
	[DefaultImg] [nvarchar](500) NOT NULL,
	[ImgList] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[Unions] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_News_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_News_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_News_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_News_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Page]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Page](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[BuildType] [int] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[PageKind] [int] NOT NULL,
	[SavePath] [nvarchar](500) NOT NULL,
	[ExtensionName] [nvarchar](200) NOT NULL,
	[Summary] [nvarchar](200) NOT NULL,
	[PageCode] [nvarchar](max) NOT NULL,
	[CanBuild] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Page_Build_Config]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Page_Build_Config](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PageTypeID] [bigint] NOT NULL,
	[PageID] [bigint] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[BuildType] [int] NOT NULL,
	[DataTypeIDs] [nvarchar](500) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Page_Build_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Page_Build_Task]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Page_Build_Task](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](500) NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[PageID] [bigint] NOT NULL,
	[BuildEntity] [nvarchar](max) NOT NULL,
	[TotalCount] [bigint] NOT NULL,
	[BuildCount] [bigint] NOT NULL,
	[Status] [int] NOT NULL,
	[BuildHistory] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Page_Build_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Page_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Page_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[IsMaster] [int] NOT NULL,
	[SupportPlatform] [bigint] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](200) NOT NULL,
	[QQ] [nvarchar](15) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Name_En] [nvarchar](50) NOT NULL,
	[Images] [nvarchar](500) NOT NULL,
	[Version] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Page_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Permission]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Permission](
	[ID] [bigint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[MenuName] [nvarchar](24) NULL,
	[MenuLink] [nvarchar](500) NOT NULL,
	[PageName] [nvarchar](200) NOT NULL,
	[ShowIndex] [nchar](10) NOT NULL,
	[Icon] [nvarchar](30) NULL,
	[IsShow] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Permission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Permission_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Permission_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](30) NULL,
	[ShowIndex] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
 CONSTRAINT [PK_yy_Permission_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Photo]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Photo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](500) NOT NULL,
	[Summary] [nvarchar](1000) NOT NULL,
	[TypeIDs] [nvarchar](200) NOT NULL,
	[Recommend] [int] NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[TargetPlatforms] [nvarchar](500) NOT NULL,
	[CanReply] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Photo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Photo_Item]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Photo_Item](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PhotoID] [bigint] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[ImgUrl] [nvarchar](500) NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
 CONSTRAINT [PK_yy_Photo_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Photo_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Photo_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Photo_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Platforms]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Platforms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](500) NOT NULL,
	[Code] [int] NOT NULL,
	[APPKey] [nvarchar](50) NULL,
	[APPSecret] [nvarchar](500) NULL,
	[APPAdminID] [nvarchar](500) NULL,
	[Access_token] [nvarchar](500) NULL,
	[Access_token_Expires_in] [datetime] NOT NULL,
	[Refresh_token] [nvarchar](500) NULL,
	[APPPayID] [nvarchar](50) NULL,
	[APPPayKey] [nvarchar](50) NULL,
	[APPPayCert] [nvarchar](500) NULL,
	[APPID] [nvarchar](50) NULL,
	[APPName] [nvarchar](50) NULL,
	[APPNumber] [nvarchar](50) NULL,
	[jsapi_ticket] [nvarchar](500) NULL,
	[jsapi_ticket_Expires_in] [datetime] NOT NULL,
	[api_ticket] [nvarchar](500) NULL,
	[api_ticket_Expires_in] [datetime] NOT NULL,
	[PlatformConfig] [nvarchar](500) NULL,
	[RecallUrl] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[JSSDK] [nvarchar](max) NULL,
	[QRCode] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Platforms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Product]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TypeIDs] [nvarchar](500) NOT NULL,
	[TargetPlatforms] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](200) NOT NULL,
	[Specifications] [nvarchar](max) NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[Summary] [nvarchar](1000) NOT NULL,
	[DefaultImg] [nvarchar](500) NOT NULL,
	[ImgList] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[Recommend] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CanReply] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Product_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Product_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Product_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_RedPack]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_RedPack](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[MerchantID] [bigint] NOT NULL,
	[AgencyID] [bigint] NOT NULL,
	[hb_type] [nvarchar](50) NOT NULL,
	[nick_name] [nvarchar](50) NOT NULL,
	[send_name] [nvarchar](50) NOT NULL,
	[current_amount] [bigint] NOT NULL,
	[total_amount] [bigint] NOT NULL,
	[min_value] [bigint] NOT NULL,
	[max_value] [bigint] NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[total_num] [int] NOT NULL,
	[wishing] [nvarchar](500) NOT NULL,
	[act_name] [nvarchar](500) NOT NULL,
	[remark] [nvarchar](500) NOT NULL,
	[logo_imgurl] [nvarchar](500) NOT NULL,
	[share_content] [nvarchar](500) NOT NULL,
	[share_url] [nvarchar](500) NOT NULL,
	[share_imgurl] [nvarchar](500) NOT NULL,
	[GetLimit] [bigint] NOT NULL,
	[GetEmptyLimit] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_RedPack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_RedPack_Order]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_RedPack_Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[red_packID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[MechantID] [bigint] NOT NULL,
	[AgencyID] [bigint] NOT NULL,
	[re_openid] [nvarchar](100) NOT NULL,
	[mch_billno] [nvarchar](50) NOT NULL,
	[detail_id] [nvarchar](50) NOT NULL,
	[red_money] [bigint] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_RedPack_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_SinglePage]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_SinglePage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](200) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[IsShow] [int] NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_SinglePage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_SiteSetting]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_SiteSetting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteAddress] [nvarchar](500) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Watermark] [nvarchar](500) NOT NULL,
	[EnabelWatermark] [int] NOT NULL,
	[MailServer] [nvarchar](200) NOT NULL,
	[MailPort] [int] NOT NULL,
	[MailAccount] [nvarchar](500) NOT NULL,
	[MailPassword] [nvarchar](500) NOT NULL,
	[SystemTopBar] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_SiteSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Spider]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Spider](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[KeyWords] [nvarchar](max) NOT NULL,
	[TypeIDs] [nvarchar](200) NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[Status] [int] NOT NULL,
	[Quality] [decimal](18, 2) NOT NULL,
	[SourceUrls] [nvarchar](max) NOT NULL,
	[RuleConfig] [nvarchar](max) NOT NULL,
	[IsShow] [int] NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[SpiderMode] [int] NOT NULL,
	[TargetPlatforms] [nvarchar](500) NOT NULL,
	[ExecutionInterval] [bigint] NOT NULL,
	[LastStartTime] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Spider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Spider_Log]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Spider_Log](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SpiderID] [bigint] NOT NULL,
	[TotalUrl] [bigint] NOT NULL,
	[SuccessUrl] [bigint] NOT NULL,
 CONSTRAINT [PK_yy_Spider_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Spider_News]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Spider_News](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Identifer] [bigint] NOT NULL,
	[SpiderID] [bigint] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SourceUrl] [nvarchar](500) NOT NULL,
	[DefaultImage] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](200) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[IsSync] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Spider_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Statistics]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Statistics](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PID] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Statistics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_SynchronousTask]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_SynchronousTask](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Platform] [int] NOT NULL,
	[BusinessType] [int] NOT NULL,
	[RelationID] [bigint] NOT NULL,
	[OperationType] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[MaxTry] [int] NOT NULL,
	[TriedCount] [int] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_SynchronousTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_SysError]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_SysError](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LogKey] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Source] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NOT NULL,
	[HelpLink] [nvarchar](max) NOT NULL,
	[TargetSite] [nvarchar](200) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_SysError] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_User]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HeadImgUrl] [nvarchar](500) NOT NULL,
	[Mobile] [nvarchar](200) NOT NULL,
	[Mail] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPwd] [nvarchar](100) NOT NULL,
	[Gender] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[Permission] [nvarchar](max) NOT NULL,
	[CountryID] [int] NOT NULL,
	[ProvinceID] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[LockFlag] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_User_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_User_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Permission] [nvarchar](500) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_User_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Video]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Video](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[KeyWords] [nvarchar](500) NOT NULL,
	[Summary] [nvarchar](1000) NOT NULL,
	[TypeIDs] [nvarchar](200) NOT NULL,
	[SourceUrl] [nvarchar](500) NOT NULL,
	[Recommend] [int] NOT NULL,
	[TargetPlatforms] [nvarchar](500) NOT NULL,
	[CanReply] [int] NOT NULL,
	[LookCount] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yy_Video_Type]    Script Date: 12/28/2016 10:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yy_Video_Type](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[PID] [bigint] NOT NULL,
	[IsShow] [int] NOT NULL,
	[ShowIndex] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_yy_Video_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[yy_Banner] ON 

INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (1, 1, N'', N'制定广告计划的前提是必须首先明确广告目的', N'制定广告计划的前提是必须首先明确广告目的', N'/images/upload/2016-12-20/33858442-facd-4a9b-9cd6-b05c9485265c.png', N'/abc', 0, 0, CAST(N'2016-12-20 07:59:53.937' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (2, 1, N'', N'观念广告是通过提倡或灌输某种观念和意见，试图引导或转变公众的看法', N'观念广告是通过提倡或灌输某种观念和意见，试图引导或转变公众的看法', N'/images/upload/2016-12-20/d8b9767c-a01b-4bf9-a5d0-76eac2f1482a.jpg', N'观念广告', 1, 0, CAST(N'2016-12-20 08:04:05.997' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (3, 1, N'1', N'巨无霸', N'巨无霸of肯德基', N'/images/upload/2016-12-20/1339e19e-400f-434d-955d-2802787dedd0.jpg', N'巨无霸', 1, 0, CAST(N'2016-12-20 08:06:12.770' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (4, 1, N'6', N'汽车广告1', N'汽车广告1', N'/images/upload/2016-12-20/c34d1f2d-e63d-405a-a32d-9526d3a0a38b.jpg', N'汽车广告1', 1, 0, CAST(N'2016-12-20 08:12:01.253' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (5, 1, N'3', N'汽车广告2', N'汽车广告2', N'/images/upload/2016-12-20/ca5884ec-1048-4a06-a1e0-232e7244bf14.jpg', N'汽车广告2', 1, 0, CAST(N'2016-12-20 08:12:26.960' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (6, 1, N'1', N'汽车广告3', N'汽车广告3', N'/images/upload/2016-12-20/779b14df-c82d-495e-bbcf-93468efd80d5.jpg', N'汽车广告3', 1, 0, CAST(N'2016-12-20 08:12:55.780' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (7, 1, N'', N'汽车广告4', N'汽车广告4', N'/images/upload/2016-12-20/5f953e79-a7f1-4176-90dd-5344021f70a4.jpg', N'汽车广告4', 0, 0, CAST(N'2016-12-20 08:13:15.963' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (8, 1, N'2', N'汽车广告6', N'汽车广告6', N'/images/upload/2016-12-20/449bd15b-b715-41ae-a22b-827960809685.jpg', N'汽车广告6', 1, 0, CAST(N'2016-12-20 08:14:56.343' AS DateTime))
INSERT [dbo].[yy_Banner] ([ID], [UserID], [TypeIDs], [Title], [Summary], [ImageUrl], [LinkUrl], [IsShow], [ShowIndex], [CreateDate]) VALUES (9, 1, N'2', N'汽车广告7', N'汽车广告7', N'/images/upload/2016-12-20/abb7ca6f-ec8b-48fb-983d-28b0ccafadd1.jpg', N'汽车广告7', 0, 0, CAST(N'2016-12-20 08:14:44.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Banner] OFF
SET IDENTITY_INSERT [dbo].[yy_Banner_Type] ON 

INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (1, N'产品广告', N'产品广告产品广告', N'', 0, 1, 0, CAST(N'2016-12-20 07:53:16.210' AS DateTime))
INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (2, N'企业广告', N'企业广告企业广告', N'', 0, 1, 0, CAST(N'2016-12-20 08:00:25.427' AS DateTime))
INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (3, N'品牌广告', N'品牌广告品牌广告', N'', 0, 1, 0, CAST(N'2016-12-20 08:00:58.170' AS DateTime))
INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (4, N'观念广告', N'观念广告观念广告', N'', 0, 1, 0, CAST(N'2016-12-20 08:01:10.493' AS DateTime))
INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (5, N'汽车广告', N'汽车广告汽车广告', N'/images/upload/2016-12-20/80eeea2c-d60c-423a-a29e-04d623d5558d.jpg', 4, 1, 0, CAST(N'2016-12-20 08:10:45.577' AS DateTime))
INSERT [dbo].[yy_Banner_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (6, N'汽车广告', N'汽车广告汽车广告', N'/images/upload/2016-12-20/0f605e22-75e8-4e4f-a2a3-5d8f575add26.jpg', 0, 1, 0, CAST(N'2016-12-20 08:11:19.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Banner_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_FriendLink] ON 

INSERT [dbo].[yy_FriendLink] ([ID], [UserID], [Title], [KeyWords], [Summary], [Info], [Recommend], [SiteUrl], [DefaultImg], [Score], [IsShow], [LookCount], [ShowIndex], [CanReply], [CreateDate]) VALUES (1, 1, N'baidu', N'baidu', N'全球最大的中文搜索引擎、致力于让网民更便捷地获取信息，找到所求。百度超过千亿的中文网页数据库，可以瞬间找到相关的搜索结果。', N'<p>百度（纳斯达克：BIDU），全球最大的中文搜索引擎、最大的中文网站。1999年底,身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司。</p><p>“百度”二字,来自于八百年前南宋词人辛弃疾的一句词：众里寻他千百度。这句话描述了词人对理想的执着追求。</p><p>百度拥有数万名研发工程师，这是中国乃至全球最为优秀的技术团队。这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。</p>', 0, N'www.baidu.com', N'/images/upload/2016-12-21/412fc469-9f64-4c58-a41f-a1778dc1fe40.jpg', CAST(5.00 AS Decimal(18, 2)), 1, 0, 1, 1, CAST(N'2016-12-21 01:40:14.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_FriendLink] OFF
SET IDENTITY_INSERT [dbo].[yy_Keywords] ON 

INSERT [dbo].[yy_Keywords] ([ID], [UserID], [ApplyType], [TypeIDs], [Title], [ReplaceContent], [ReplaceCount], [IsShow], [ShowIndex], [CreateDate]) VALUES (1, 1, 1, N'', N'汽车', N'汽车2', 1, 1, 1, CAST(N'2016-12-21 01:41:40.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Keywords] OFF
SET IDENTITY_INSERT [dbo].[yy_News] ON 

INSERT [dbo].[yy_News] ([ID], [UserID], [TypeIDs], [Title], [TargetPlatforms], [KeyWords], [LookCount], [Summary], [DefaultImg], [ImgList], [Info], [Recommend], [IsShow], [ShowIndex], [CanReply], [CreateDate], [WechatMediaID], [WechatNewsUrl]) VALUES (1, 1, N'2', N'第一新闻', N'', N'第一新闻', 0, N'今天霾天气将持续，其中，今天京津冀地区将达到此轮霾天气最重时段。', N'/images/upload/2016-12-20/a4a5ff4a-077d-4ef1-8684-354c1877503d.jpg', N'', N'<html>
 <head></head> 
 <body> 
  <p><a href="http://new.item.btime.com/34rvbbm0hs487gpuq3aosbaa3gs" title="雾霾围城京城若“仙境” 如何防“心肺之患”" data-log="" data-read="1" se_prerender_url="complete" style="color: rgb(153, 153, 153); text-decoration: none; display: block; overflow: hidden; text-overflow: ellipsis; font-family: PingFang, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 20px; font-weight: bold; line-height: 26px; widows: 1;"><span style="color: rgb(51, 51, 51); font-family: PingFang, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; line-height: 32px; text-indent: 32px; widows: 1; background-color: rgb(255, 255, 255);">昨天(19日)夜间开始，华北、黄淮等地霾天气进入最严重时段，范围明显扩大，19日较18日重度霾区域面积翻倍，目前已超过百万公里，波及吉林、辽宁、北京、天津、河北、山东、河南、陕西、山西、湖北、安徽、江苏等12省市。预计，今天上述地区霾天气仍将持续，京津冀地区将达到最重。</span></a></p>  
 </body>
</html>', 1, 1, 0, 0, CAST(N'2016-12-20 08:57:10.277' AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[yy_News] OFF
SET IDENTITY_INSERT [dbo].[yy_News_Type] ON 

INSERT [dbo].[yy_News_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (1, N'国外', N'国外国外国外', N'', 0, 1, 0, CAST(N'2016-12-20 08:53:56.107' AS DateTime))
INSERT [dbo].[yy_News_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (2, N'国内', N'国内国内国内', N'', 0, 1, 0, CAST(N'2016-12-20 08:54:10.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_News_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_Page] ON 

INSERT [dbo].[yy_Page] ([ID], [PageName], [BuildType], [TypeID], [PageKind], [SavePath], [ExtensionName], [Summary], [PageCode], [CanBuild], [CreateDate], [LastUpdateTime]) VALUES (1, N'第一个单页模板', 0, 1, 0, N'~/', N'{0}.html', N'摘要：第一个单页模板', N'<body>
    <span>第一个单页模板</span>
</body>', 1, CAST(N'2016-12-23 02:24:22.090' AS DateTime), CAST(N'2016-12-23 02:24:22.090' AS DateTime))
INSERT [dbo].[yy_Page] ([ID], [PageName], [BuildType], [TypeID], [PageKind], [SavePath], [ExtensionName], [Summary], [PageCode], [CanBuild], [CreateDate], [LastUpdateTime]) VALUES (2, N'第一个组件模板', 0, 1, 1, N'~/', N'{0}.html', N'摘要：第一个组件模板', N'<body>
    <span>第一个组件模板</span>
</body>', 1, CAST(N'2016-12-23 02:23:18.830' AS DateTime), CAST(N'2016-12-23 02:23:18.830' AS DateTime))
INSERT [dbo].[yy_Page] ([ID], [PageName], [BuildType], [TypeID], [PageKind], [SavePath], [ExtensionName], [Summary], [PageCode], [CanBuild], [CreateDate], [LastUpdateTime]) VALUES (3, N'第一个列表也模板', 0, 1, 2, N'~/', N'{0}.html', N'摘要：第一个列表也模板', N'<body>
    <span>第一个列表也模板</span>
</body>', 1, CAST(N'2016-12-23 02:23:31.993' AS DateTime), CAST(N'2016-12-23 02:23:31.993' AS DateTime))
INSERT [dbo].[yy_Page] ([ID], [PageName], [BuildType], [TypeID], [PageKind], [SavePath], [ExtensionName], [Summary], [PageCode], [CanBuild], [CreateDate], [LastUpdateTime]) VALUES (4, N'第一个其他模板', 0, 1, 3, N'~/', N'{0}.html', N'摘要：第一个其他模板', N'<body>
    <span>第一个其他模板</span>
</body>', 1, CAST(N'2016-12-23 02:23:56.657' AS DateTime), CAST(N'2016-12-23 02:23:56.657' AS DateTime))
INSERT [dbo].[yy_Page] ([ID], [PageName], [BuildType], [TypeID], [PageKind], [SavePath], [ExtensionName], [Summary], [PageCode], [CanBuild], [CreateDate], [LastUpdateTime]) VALUES (5, N'测试模板', 0, 1, 0, N'~/', N'{0}.html', N'摘要：测试模板测试模板', N'

<yytag id=1></yytag>
<yytag id=2></yytag>
<yytag modal=''SELECT * FROM yy_News WITH(NOLOCK)'' view=''myview''>
    <view id=myview><script type="text/juicer" id="subTpl">
    I''m sub content, ${Title}
    </script>
Hi, {@include "#subTpl", modal}, End.</view>
</yytag>', 1, CAST(N'2016-12-23 07:28:04.257' AS DateTime), CAST(N'2016-12-23 07:28:04.257' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Page] OFF
SET IDENTITY_INSERT [dbo].[yy_Page_Build_Task] ON 

INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (1, N'第一个其他模板', 1, 4, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 15:08:50.000' AS DateTime), CAST(N'2016-12-22 15:08:50.900' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (2, N'第一个列表也模板', 1, 3, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 15:08:50.000' AS DateTime), CAST(N'2016-12-22 15:08:52.910' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (3, N'第一个组件模板', 1, 2, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 15:08:50.000' AS DateTime), CAST(N'2016-12-22 15:08:54.920' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (4, N'第一个单页模板', 1, 1, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 15:08:50.000' AS DateTime), CAST(N'2016-12-22 15:08:57.123' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (5, N'第一个其他模板', 1, 4, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:10:20.000' AS DateTime), CAST(N'2016-12-22 17:10:24.447' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (6, N'第一个列表也模板', 1, 3, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:10:20.000' AS DateTime), CAST(N'2016-12-22 17:10:24.580' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (7, N'第一个组件模板', 1, 2, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:10:20.000' AS DateTime), CAST(N'2016-12-22 17:10:24.640' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (8, N'第一个单页模板', 1, 1, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:10:20.000' AS DateTime), CAST(N'2016-12-22 17:10:24.737' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (9, N'第一个其他模板', 1, 4, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:11:04.000' AS DateTime), CAST(N'2016-12-22 17:11:05.010' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (10, N'第一个列表也模板', 1, 3, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:11:04.000' AS DateTime), CAST(N'2016-12-22 17:11:05.307' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (11, N'第一个组件模板', 1, 2, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:11:04.000' AS DateTime), CAST(N'2016-12-22 17:11:05.410' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (12, N'第一个单页模板', 1, 1, N'[0]', 1, 1, 2, N'', CAST(N'2016-12-22 17:11:04.000' AS DateTime), CAST(N'2016-12-22 17:11:05.450' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (13, N'第一个其他模板', 1, 4, N'[0]', 1, 0, 0, N'', CAST(N'2016-12-23 09:19:06.000' AS DateTime), CAST(N'2016-12-23 09:19:06.000' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (14, N'第一个列表也模板', 1, 3, N'[0]', 1, 0, 0, N'', CAST(N'2016-12-23 09:19:06.000' AS DateTime), CAST(N'2016-12-23 09:19:06.000' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (15, N'第一个组件模板', 1, 2, N'[0]', 1, 0, 0, N'', CAST(N'2016-12-23 09:19:06.000' AS DateTime), CAST(N'2016-12-23 09:19:06.000' AS DateTime))
INSERT [dbo].[yy_Page_Build_Task] ([ID], [FullName], [TypeID], [PageID], [BuildEntity], [TotalCount], [BuildCount], [Status], [BuildHistory], [CreateDate], [LastUpdateTime]) VALUES (16, N'第一个单页模板', 1, 1, N'[0]', 1, 0, 0, N'', CAST(N'2016-12-23 09:19:06.000' AS DateTime), CAST(N'2016-12-23 09:19:06.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Page_Build_Task] OFF
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (21, 2, N'首页', N'首页', N'首页', N'12', N'/admin/index', N'1         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (22, 2, N'消息列表', N'消息列表', N'消息列表', N'1', N'/message/index', N'3         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (23, 2, N'友链列表', N'友链列表', N'友链列表', N'1', N'/friendlink/index', N'4         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (24, 2, N'关键字', N'关键字', N'关键字', N'1', N'/keywords/index', N'5         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (26, 2, N'基本设置', N'基本设置', N'基本设置', N'1', N'/admin/setting', N'2         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (31, 3, N'用户管理', N'用户管理', N'用户列表', N'2', N'/user/index', N'1         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (32, 3, N'用户管理', N'用户管理', N'Add User', N'1', N'/user/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (33, 3, N'用户管理', N'用户管理', N'Edit User', N'1', N'/user/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (34, 3, N'用户管理', N'用户管理', N'User Types', N'1', N'/user/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (50, 5, N'单页列表', N'单页列表', N'单页列表', N'1', N'/singlepage/index', N'6         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (51, 5, N'产品列表', N'产品列表', N'产品列表', N'1', N'/product/index', N'3         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (52, 5, N'相册列表', N'相册列表', N'相册列表', N'1', N'/photo/index', N'4         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (53, 5, N'视频列表', N'视频列表', N'视频列表', N'1', N'/video/index', N'5         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (54, 5, N'广告列表', N'广告列表', N'广告列表', N'3', N'/banner/index', N'1         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (55, 5, N'新闻列表', N'新闻列表', N'新闻列表', N'3', N'/news/index', N'2         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (61, 6, N'蜘蛛管理', N'蜘蛛管理', N'Index', N'1', N'/spider/index', N'1         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (62, 6, N'蜘蛛管理', N'蜘蛛管理', N'Add', N'1', N'/spider/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (63, 6, N'蜘蛛管理', N'蜘蛛管理', N'Edit', N'1', N'/spider/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (64, 6, N'蜘蛛管理', N'蜘蛛管理', N'News', N'4', N'/spider/news', N'1         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (71, 7, N'Template', N'Template', N'Build', N'1', N'/page/build', N'4         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (72, 7, N'Template', N'Template', N'Progress', N'1', N'/page/progress', N'4         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (73, 7, N'Template', N'Template', N'Add Page', N'1', N'/page/add', N'1         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (74, 7, N'Template', N'Template', N'Edit Page', N'1', N'/page/edit', N'2         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (75, 7, N'Template', N'Template', N'Page Types', N'1', N'/page/types', N'3         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (76, 7, N'Template', N'Template', N'Page Index', N'1', N'/page/index', N'4         ', N'', 1, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (101, 10, N'Interface List', N'Interface List', N'Interface List', N'5', N'/help/index', N'5         ', N'', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (102, 10, N'API', N'API', N'API', N'5', N'/help/api', N'5         ', N'', 0, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (103, 10, N'Resouse', N'Resouse', N'Resouse', N'5', N'/help/resourcemodel', N'5         ', N'', 0, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (321, 9, N'Add News', N'Add News', N'Add News', N'1', N'/news/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (322, 9, N'Edit News', N'Edit News', N'Edit News', N'1', N'/news/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (323, 9, N'Types News', N'Types News', N'Types News', N'1', N'/news/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (431, 9, N'Add Product', N'Add Product', N'Add Product', N'1', N'/product/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (432, 9, N'Edit Product', N'Edit Product', N'Edit Product', N'1', N'/product/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (433, 9, N'Product Types', N'Product Types', N'Product Types', N'1', N'/product/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (710, 9, N'Add Photo', N'Add Photo', N'Add Photo', N'1', N'/photo/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (720, 9, N'Edit Photo', N'Edit Photo', N'Edit Photo', N'1', N'/photo/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (730, 9, N'Photo Types', N'Photo Types', N'Photo Types', N'1', N'/photo/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (911, 9, N'Add Message', N'Add Message', N'Add Message', N'1', N'/message/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (912, 9, N'Edit Message', N'Edit Message', N'Edit Message', N'1', N'/message/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (913, 9, N'Message Types', N'Message Types', N'Message Types', N'1', N'/message/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (921, 9, N'Banner Types', N'Banner Types', N'Banner Types', N'1', N'/banner/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (922, 9, N'Add Banner', N'Add Banner', N'Add Banner', N'1', N'/banner/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (923, 9, N'Edit Banner', N'Edit Banner', N'Edit Banner', N'1', N'/banner/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (931, 9, N'Add Keywords', N'Add Keywords', N'Add Keywords', N'1', N'/keywords/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (932, 9, N'Edit Keywords', N'Edit Keywords', N'Edit Keywords', N'1', N'/keywords/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (933, 9, N'Keywords Types', N'Keywords Types', N'Keywords Types', N'1', N'/keywords/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (941, 9, N'Add Friendlink', N'Add Friendlink', N'Add Friendlink', N'1', N'/friendlink/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (942, 9, N'Edit Friendlink', N'Edit Friendlink', N'Edit Friendlink', N'1', N'/friendlink/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (943, 9, N'Friendlink Types', N'Friendlink Types', N'Friendlink Types', N'1', N'/friendlink/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (951, 9, N'Add Fans', N'Add Fans', N'Add Fans', N'1', N'/fans/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (952, 9, N'Edit Fans', N'Edit Fans', N'Edit Fans', N'1', N'/fans/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (953, 9, N'Fans Types', N'Fans Types', N'Fans Types', N'1', N'/fans/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (962, 2, N'Edit Admin', N'Edit Admin', N'Edit Admin', N'1', N'/admin/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (963, 2, N'Admin Types', N'Admin Types', N'Admin Types', N'1', N'/admin/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (971, 9, N'Add SinglePage', N'Add SinglePage', N'Add SinglePage', N'1', N'/singlepage/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (972, 9, N'Edit SinglePage', N'Edit SinglePage', N'Edit SinglePage', N'1', N'/singlepage/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (973, 9, N'SinglePage Types', N'SinglePage Types', N'SinglePage Types', N'1', N'/singlepage/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (981, 9, N'Add Video', N'Add Video', N'Add Video', N'1', N'/video/add', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (982, 9, N'Edit Video', N'Edit Video', N'Edit Video', N'1', N'/video/edit', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_Permission] ([ID], [TypeID], [Title], [Description], [MenuName], [MenuLink], [PageName], [ShowIndex], [Icon], [IsShow], [CreateDate]) VALUES (983, 9, N'Video Types', N'Video Types', N'Video Types', N'1', N'/video/types', N'1         ', N'', 0, CAST(N'2016-12-20 10:35:20.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Permission_Type] ON 

INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (2, N'常规管理', N'fa fa-desktop', 1, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (3, N'用户管理', N'fa fa-users', 2, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (5, N'内容管理', N'fa fa-cloud', 3, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (6, N'Spider', N'fa fa-star', 4, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (7, N'Template', N'fa fa-sitemap', 5, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (9, N'Others', N'fa fa-shield', 100, 1)
INSERT [dbo].[yy_Permission_Type] ([ID], [Name], [Icon], [ShowIndex], [IsShow]) VALUES (10, N'API', N'fa fa-question-circle', 6, 1)
SET IDENTITY_INSERT [dbo].[yy_Permission_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_Photo_Type] ON 

INSERT [dbo].[yy_Photo_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (1, N'同事', N'同事相册集', N'', 0, 1, 0, CAST(N'2016-12-20 08:58:53.700' AS DateTime))
INSERT [dbo].[yy_Photo_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (2, N'朋友', N'朋友相册集', N'', 0, 1, 0, CAST(N'2016-12-20 08:59:15.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Photo_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_Platforms] ON 

INSERT [dbo].[yy_Platforms] ([ID], [UserID], [Name], [Link], [Image], [Code], [APPKey], [APPSecret], [APPAdminID], [Access_token], [Access_token_Expires_in], [Refresh_token], [APPPayID], [APPPayKey], [APPPayCert], [APPID], [APPName], [APPNumber], [jsapi_ticket], [jsapi_ticket_Expires_in], [api_ticket], [api_ticket_Expires_in], [PlatformConfig], [RecallUrl], [Remark], [JSSDK], [QRCode], [CreateDate]) VALUES (1, 1, N'微信', N'', N'/Images/platform/11.png', 11, NULL, NULL, NULL, NULL, CAST(N'2016-12-22 03:42:11.737' AS DateTime), NULL, NULL, NULL, NULL, N'wzhiu', NULL, NULL, NULL, CAST(N'2016-12-22 03:42:11.737' AS DateTime), NULL, CAST(N'2016-12-22 03:42:11.737' AS DateTime), N'{}', NULL, NULL, NULL, NULL, CAST(N'2016-12-22 03:42:11.737' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Platforms] OFF
SET IDENTITY_INSERT [dbo].[yy_Product] ON 

INSERT [dbo].[yy_Product] ([ID], [UserID], [TypeIDs], [TargetPlatforms], [Title], [KeyWords], [Specifications], [LookCount], [Summary], [DefaultImg], [ImgList], [Price], [Info], [Recommend], [IsShow], [ShowIndex], [CanReply], [CreateDate]) VALUES (1, 1, N'1', N'', N'奇瑞汽车', N'奇瑞汽车', N'', 0, N'奇瑞汽车奇瑞汽车奇瑞汽车奇瑞汽车奇瑞汽车', N'/images/upload/2016-12-21/aa68651b-cff6-4fa2-97d9-8e9184e842e0.jpg', N'', CAST(100.00 AS Decimal(18, 2)), N'<html>
 <head></head> 
 <body> 
  <p>奇瑞汽车奇瑞汽车奇瑞汽车奇瑞汽车</p>  
 </body>
</html>', 1, 1, 0, 0, CAST(N'2016-12-21 01:29:23.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Product] OFF
SET IDENTITY_INSERT [dbo].[yy_Product_Type] ON 

INSERT [dbo].[yy_Product_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateDate]) VALUES (1, N'汽车', N'中国汽车制造', N'', 0, 1, 0, CAST(N'2016-12-20 08:58:05.603' AS DateTime))
INSERT [dbo].[yy_Product_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateDate]) VALUES (2, N'手机', N'中国汽车制造', N'', 0, 1, 0, CAST(N'2016-12-20 08:58:15.807' AS DateTime))
INSERT [dbo].[yy_Product_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateDate]) VALUES (3, N'电影', N'中国电影制造', N'', 0, 1, 0, CAST(N'2016-12-20 08:58:33.273' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Product_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_SinglePage] ON 

INSERT [dbo].[yy_SinglePage] ([ID], [UserID], [Title], [KeyWords], [Summary], [Info], [IsShow], [LookCount], [CreateDate]) VALUES (1, 1, N'我的第一个单页', N'我的第一个单页', N'我的第一个单页我的第一个单页我的第一个单页', N'<p>我的第一个单页我的第一个单页我的第一个单页</p>', 1, 0, CAST(N'2016-12-21 01:36:25.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_SinglePage] OFF
SET IDENTITY_INSERT [dbo].[yy_SiteSetting] ON 

INSERT [dbo].[yy_SiteSetting] ([ID], [SiteAddress], [Email], [Watermark], [EnabelWatermark], [MailServer], [MailPort], [MailAccount], [MailPassword], [SystemTopBar], [CreateDate]) VALUES (7, N'wzhiu@163.com', N'wzhiu@163.com', N'/images/upload/2016-12-22/827b478e-8fd4-4330-b67f-455ae8cf8cfc.png', 1, N'wzhiu@163.com', 336, N'wzhiu@163.com', N'wzhiu@163.com', N'[{"ID":1482376878442,"PID":0,"Name":"Help","Url":"/help","Target":"_self"},{"ID":1482377022326,"PID":1482376878442,"Name":"Help 1","Url":"/help","Target":"_self"}]', CAST(N'2016-12-22 03:31:20.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_SiteSetting] OFF
SET IDENTITY_INSERT [dbo].[yy_User] ON 

INSERT [dbo].[yy_User] ([ID], [HeadImgUrl], [Mobile], [Mail], [UserName], [UserPwd], [Gender], [Role], [Permission], [CountryID], [ProvinceID], [DistrictID], [CityID], [Address], [LockFlag], [CreateDate]) VALUES (1, N'/images/upload/2016-12-21/ee4492e1-b545-46c8-a616-ecd431b0c8fa.jpg', N'15810801448', N'wzhiu@163.com', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 3, N'-2,21,22,23,24,26,962,963,-3,31,32,33,34,-5,50,51,52,53,54,55,-6,61,62,63,64,-7,71,72,73,74,75,76,-10,101,102,103,-9,321,322,323,431,432,433,710,720,730,911,912,913,921,922,923,931,932,933,941,942,943,951,952,953,971,972,973,981,982,983', 1, 110000, 110105, 110100, N'wzhiu@163.com', 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_User] ([ID], [HeadImgUrl], [Mobile], [Mail], [UserName], [UserPwd], [Gender], [Role], [Permission], [CountryID], [ProvinceID], [DistrictID], [CityID], [Address], [LockFlag], [CreateDate]) VALUES (2, N'/images/upload/2016-12-20/b6702e6b-e423-4469-bf0d-d148a2659af3.jpg', N'15810801448', N'wzhiu@163.com', N'admin1', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, N'-2', 0, 110000, 110101, 110100, N'111', 1, CAST(N'2016-12-20 09:03:08.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_User] OFF
SET IDENTITY_INSERT [dbo].[yy_User_Type] ON 

INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (1, N'管理员', N'这是一个普通管理员', N',-2,1,6,7,12,-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,-6,4,10,-7,5,11,-3,2,8,', 110, 1, 1, CAST(N'2016-12-19 10:35:20.000' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (2, N'系统管理员', N'系统管理员', N',-2,1,6,7,12,-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,-6,4,10,-7,5,11,-3,2,8,', 0, 1, 2, CAST(N'2016-12-21 00:39:39.043' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (3, N'超级管理员', N'超级管理员', N',-2,1,6,7,12,-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,-6,4,10,-7,5,11,-3,2,8,', 0, 1, 3, CAST(N'2016-12-21 00:39:53.387' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (4, N'普通用户', N'普通用户普通用户', N',-2,1,6,7,12,-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,-6,4,10,-7,5,11,-3,2,8,', 0, 1, 7, CAST(N'2016-12-21 00:42:47.930' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (5, N'秘书管理', N'秘书管理，秘书管理', N',-2,1,6,7,12,', 1, 1, 1, CAST(N'2016-12-21 00:44:17.407' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (6, N'干部管理', N'干部管理，干部管理', N',-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,', 1, 1, 3, CAST(N'2016-12-21 00:44:40.177' AS DateTime))
INSERT [dbo].[yy_User_Type] ([ID], [Name], [Summary], [Permission], [PID], [IsShow], [ShowIndex], [CreateTime]) VALUES (7, N'前台管理', N'前台管理，前台管理', N',-2,1,6,7,12,-5,3,9,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,131,132,133,141,142,143,', 2, 1, 1, CAST(N'2016-12-21 00:45:42.173' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_User_Type] OFF
SET IDENTITY_INSERT [dbo].[yy_Video_Type] ON 

INSERT [dbo].[yy_Video_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateDate]) VALUES (1, N'技术类', N'技术类视频', N'', 0, 1, 0, CAST(N'2016-12-21 01:29:59.817' AS DateTime))
INSERT [dbo].[yy_Video_Type] ([ID], [Name], [Summary], [Image], [PID], [IsShow], [ShowIndex], [CreateDate]) VALUES (2, N'科学类', N'科学类视屏', N'', 0, 1, 0, CAST(N'2016-12-21 01:30:16.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[yy_Video_Type] OFF
USE [master]
GO
ALTER DATABASE [yyCms] SET  READ_WRITE 
GO
