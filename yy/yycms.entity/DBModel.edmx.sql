
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/19/2016 14:19:55
-- Generated from EDMX file: D:\360Downloads\yycms-master\yycms-master\yycms.entity\DBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [yyCms];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[yy_Banner]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Banner];
GO
IF OBJECT_ID(N'[dbo].[yy_Banner_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Banner_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Fans_Wechat]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Fans_Wechat];
GO
IF OBJECT_ID(N'[dbo].[yy_FriendLink]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_FriendLink];
GO
IF OBJECT_ID(N'[dbo].[yy_Keywords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Keywords];
GO
IF OBJECT_ID(N'[dbo].[yy_Message]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Message];
GO
IF OBJECT_ID(N'[dbo].[yy_News]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_News];
GO
IF OBJECT_ID(N'[dbo].[yy_News_Schedule]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_News_Schedule];
GO
IF OBJECT_ID(N'[dbo].[yy_News_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_News_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Page]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Page];
GO
IF OBJECT_ID(N'[dbo].[yy_Page_Build_Config]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Page_Build_Config];
GO
IF OBJECT_ID(N'[dbo].[yy_Page_Build_Task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Page_Build_Task];
GO
IF OBJECT_ID(N'[dbo].[yy_Page_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Page_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Permission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Permission];
GO
IF OBJECT_ID(N'[dbo].[yy_Permission_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Permission_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Photo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Photo];
GO
IF OBJECT_ID(N'[dbo].[yy_Photo_Item]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Photo_Item];
GO
IF OBJECT_ID(N'[dbo].[yy_Photo_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Photo_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Platforms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Platforms];
GO
IF OBJECT_ID(N'[dbo].[yy_Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Product];
GO
IF OBJECT_ID(N'[dbo].[yy_Product_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Product_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_RedPack]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_RedPack];
GO
IF OBJECT_ID(N'[dbo].[yy_RedPack_Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_RedPack_Order];
GO
IF OBJECT_ID(N'[dbo].[yy_SinglePage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_SinglePage];
GO
IF OBJECT_ID(N'[dbo].[yy_SiteSetting]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_SiteSetting];
GO
IF OBJECT_ID(N'[dbo].[yy_Spider]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Spider];
GO
IF OBJECT_ID(N'[dbo].[yy_Spider_Log]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Spider_Log];
GO
IF OBJECT_ID(N'[dbo].[yy_Spider_News]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Spider_News];
GO
IF OBJECT_ID(N'[dbo].[yy_Statistics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Statistics];
GO
IF OBJECT_ID(N'[dbo].[yy_SynchronousTask]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_SynchronousTask];
GO
IF OBJECT_ID(N'[dbo].[yy_SysError]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_SysError];
GO
IF OBJECT_ID(N'[dbo].[yy_User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_User];
GO
IF OBJECT_ID(N'[dbo].[yy_User_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_User_Type];
GO
IF OBJECT_ID(N'[dbo].[yy_Video]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Video];
GO
IF OBJECT_ID(N'[dbo].[yy_Video_Type]', 'U') IS NOT NULL
    DROP TABLE [dbo].[yy_Video_Type];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'yy_Banner'
CREATE TABLE [dbo].[yy_Banner] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [TypeIDs] nvarchar(500)  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [ImageUrl] nvarchar(500)  NOT NULL,
    [LinkUrl] nvarchar(500)  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Banner_Type'
CREATE TABLE [dbo].[yy_Banner_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Image] nvarchar(200)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Fans_Wechat'
CREATE TABLE [dbo].[yy_Fans_Wechat] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [openid] nvarchar(200)  NOT NULL,
    [nickname] nvarchar(200)  NOT NULL,
    [language] nvarchar(50)  NOT NULL,
    [sex] int  NOT NULL,
    [province] nvarchar(50)  NOT NULL,
    [city] nvarchar(50)  NOT NULL,
    [country] nvarchar(50)  NOT NULL,
    [headimgurl] nvarchar(500)  NOT NULL,
    [Latitude] nvarchar(50)  NOT NULL,
    [Longitude] nvarchar(50)  NOT NULL,
    [Precision] nvarchar(50)  NOT NULL,
    [remark] nvarchar(500)  NOT NULL,
    [unionid] nvarchar(50)  NOT NULL,
    [LOCATIONUpdateTime] datetime  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_FriendLink'
CREATE TABLE [dbo].[yy_FriendLink] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(200)  NOT NULL,
    [Summary] nvarchar(1000)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [Recommend] int  NOT NULL,
    [SiteUrl] nvarchar(500)  NOT NULL,
    [DefaultImg] nvarchar(500)  NOT NULL,
    [Score] decimal(18,2)  NOT NULL,
    [IsShow] int  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CanReply] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Keywords'
CREATE TABLE [dbo].[yy_Keywords] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [ApplyType] int  NOT NULL,
    [TypeIDs] nvarchar(500)  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [ReplaceContent] nvarchar(1000)  NOT NULL,
    [ReplaceCount] int  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Message'
CREATE TABLE [dbo].[yy_Message] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Platform] int  NOT NULL,
    [Status] int  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Mail] nvarchar(200)  NOT NULL,
    [Mobile] nvarchar(50)  NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_News'
CREATE TABLE [dbo].[yy_News] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [TypeIDs] nvarchar(500)  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [TargetPlatforms] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(200)  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [Summary] nvarchar(1000)  NOT NULL,
    [DefaultImg] nvarchar(500)  NOT NULL,
    [ImgList] nvarchar(max)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [Recommend] int  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CanReply] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [WechatMediaID] nvarchar(50)  NOT NULL,
    [WechatNewsUrl] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'yy_News_Schedule'
CREATE TABLE [dbo].[yy_News_Schedule] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [TypeIDs] nvarchar(500)  NOT NULL,
    [Title] nvarchar(100)  NOT NULL,
    [KeyWords] nvarchar(100)  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [Summary] nvarchar(200)  NOT NULL,
    [DefaultImg] nvarchar(500)  NOT NULL,
    [ImgList] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [Unions] nvarchar(500)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [ReleaseDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_News_Type'
CREATE TABLE [dbo].[yy_News_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Image] nvarchar(200)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Page'
CREATE TABLE [dbo].[yy_Page] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [PageName] nvarchar(50)  NOT NULL,
    [BuildType] int  NOT NULL,
    [TypeID] bigint  NOT NULL,
    [PageKind] int  NOT NULL,
    [SavePath] nvarchar(500)  NOT NULL,
    [ExtensionName] nvarchar(200)  NOT NULL,
    [Summary] nvarchar(200)  NOT NULL,
    [PageCode] nvarchar(max)  NOT NULL,
    [CanBuild] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastUpdateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Page_Build_Config'
CREATE TABLE [dbo].[yy_Page_Build_Config] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [PageTypeID] bigint  NOT NULL,
    [PageID] bigint  NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NOT NULL,
    [BuildType] int  NOT NULL,
    [DataTypeIDs] nvarchar(500)  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Page_Build_Task'
CREATE TABLE [dbo].[yy_Page_Build_Task] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(500)  NOT NULL,
    [TypeID] bigint  NOT NULL,
    [PageID] bigint  NOT NULL,
    [BuildEntity] nvarchar(max)  NOT NULL,
    [TotalCount] bigint  NOT NULL,
    [BuildCount] bigint  NOT NULL,
    [Status] int  NOT NULL,
    [BuildHistory] nvarchar(max)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastUpdateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Page_Type'
CREATE TABLE [dbo].[yy_Page_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [IsMaster] int  NOT NULL,
    [SupportPlatform] bigint  NOT NULL,
    [Author] nvarchar(50)  NOT NULL,
    [Website] nvarchar(200)  NOT NULL,
    [QQ] nvarchar(15)  NOT NULL,
    [Mobile] nvarchar(50)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(100)  NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [Name_En] nvarchar(50)  NOT NULL,
    [Images] nvarchar(500)  NOT NULL,
    [Version] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Permission'
CREATE TABLE [dbo].[yy_Permission] (
    [ID] bigint  NOT NULL,
    [TypeID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(500)  NOT NULL,
    [MenuName] nvarchar(10)  NOT NULL,
    [MenuLink] nvarchar(500)  NOT NULL,
    [PageName] nvarchar(200)  NOT NULL,
    [ShowIndex] nchar(10)  NOT NULL,
    [Icon] nchar(10)  NOT NULL,
    [IsShow] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Permission_Type'
CREATE TABLE [dbo].[yy_Permission_Type] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Icon] nvarchar(100)  NOT NULL,
    [ShowIndex] int  NOT NULL,
    [IsShow] int  NOT NULL
);
GO

-- Creating table 'yy_Photo'
CREATE TABLE [dbo].[yy_Photo] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(500)  NOT NULL,
    [Summary] nvarchar(1000)  NOT NULL,
    [TypeIDs] nvarchar(200)  NOT NULL,
    [Recommend] int  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [TargetPlatforms] nvarchar(500)  NOT NULL,
    [CanReply] int  NOT NULL,
    [IsShow] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Photo_Item'
CREATE TABLE [dbo].[yy_Photo_Item] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [PhotoID] bigint  NOT NULL,
    [Title] nvarchar(200)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [ImgUrl] nvarchar(500)  NOT NULL,
    [ShowIndex] bigint  NOT NULL
);
GO

-- Creating table 'yy_Photo_Type'
CREATE TABLE [dbo].[yy_Photo_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Image] nvarchar(200)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Platforms'
CREATE TABLE [dbo].[yy_Platforms] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Link] nvarchar(500)  NOT NULL,
    [Image] nvarchar(500)  NOT NULL,
    [Code] int  NOT NULL,
    [APPKey] nvarchar(50)  NULL,
    [APPSecret] nvarchar(500)  NULL,
    [APPAdminID] nvarchar(500)  NULL,
    [Access_token] nvarchar(500)  NULL,
    [Access_token_Expires_in] datetime  NOT NULL,
    [Refresh_token] nvarchar(500)  NULL,
    [APPPayID] nvarchar(50)  NULL,
    [APPPayKey] nvarchar(50)  NULL,
    [APPPayCert] nvarchar(500)  NULL,
    [APPID] nvarchar(50)  NULL,
    [APPName] nvarchar(50)  NULL,
    [APPNumber] nvarchar(50)  NULL,
    [jsapi_ticket] nvarchar(500)  NULL,
    [jsapi_ticket_Expires_in] datetime  NOT NULL,
    [api_ticket] nvarchar(500)  NULL,
    [api_ticket_Expires_in] datetime  NOT NULL,
    [PlatformConfig] nvarchar(500)  NULL,
    [RecallUrl] nvarchar(500)  NULL,
    [Remark] nvarchar(500)  NULL,
    [JSSDK] nvarchar(max)  NULL,
    [QRCode] nvarchar(500)  NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Product'
CREATE TABLE [dbo].[yy_Product] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [TypeIDs] nvarchar(500)  NOT NULL,
    [TargetPlatforms] nvarchar(500)  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(200)  NOT NULL,
    [Specifications] nvarchar(max)  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [Summary] nvarchar(1000)  NOT NULL,
    [DefaultImg] nvarchar(500)  NOT NULL,
    [ImgList] nvarchar(max)  NOT NULL,
    [Price] decimal(18,2)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [Recommend] int  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CanReply] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Product_Type'
CREATE TABLE [dbo].[yy_Product_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Image] nvarchar(200)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_RedPack'
CREATE TABLE [dbo].[yy_RedPack] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [MerchantID] bigint  NOT NULL,
    [AgencyID] bigint  NOT NULL,
    [hb_type] nvarchar(50)  NOT NULL,
    [nick_name] nvarchar(50)  NOT NULL,
    [send_name] nvarchar(50)  NOT NULL,
    [current_amount] bigint  NOT NULL,
    [total_amount] bigint  NOT NULL,
    [min_value] bigint  NOT NULL,
    [max_value] bigint  NOT NULL,
    [Quantity] bigint  NOT NULL,
    [total_num] int  NOT NULL,
    [wishing] nvarchar(500)  NOT NULL,
    [act_name] nvarchar(500)  NOT NULL,
    [remark] nvarchar(500)  NOT NULL,
    [logo_imgurl] nvarchar(500)  NOT NULL,
    [share_content] nvarchar(500)  NOT NULL,
    [share_url] nvarchar(500)  NOT NULL,
    [share_imgurl] nvarchar(500)  NOT NULL,
    [GetLimit] bigint  NOT NULL,
    [GetEmptyLimit] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_RedPack_Order'
CREATE TABLE [dbo].[yy_RedPack_Order] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [red_packID] bigint  NOT NULL,
    [UserID] bigint  NOT NULL,
    [MechantID] bigint  NOT NULL,
    [AgencyID] bigint  NOT NULL,
    [re_openid] nvarchar(100)  NOT NULL,
    [mch_billno] nvarchar(50)  NOT NULL,
    [detail_id] nvarchar(50)  NOT NULL,
    [red_money] bigint  NOT NULL,
    [status] nvarchar(50)  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_SinglePage'
CREATE TABLE [dbo].[yy_SinglePage] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(200)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [IsShow] int  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_SiteSetting'
CREATE TABLE [dbo].[yy_SiteSetting] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [SiteAddress] nvarchar(500)  NOT NULL,
    [Email] nvarchar(200)  NOT NULL,
    [Watermark] nvarchar(500)  NOT NULL,
    [EnabelWatermark] int  NOT NULL,
    [MailServer] nvarchar(200)  NOT NULL,
    [MailPort] int  NOT NULL,
    [MailAccount] nvarchar(500)  NOT NULL,
    [MailPassword] nvarchar(500)  NOT NULL,
    [SystemTopBar] nvarchar(max)  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Spider'
CREATE TABLE [dbo].[yy_Spider] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Title] nvarchar(200)  NOT NULL,
    [KeyWords] nvarchar(max)  NOT NULL,
    [TypeIDs] nvarchar(200)  NOT NULL,
    [Code] nvarchar(200)  NOT NULL,
    [Status] int  NOT NULL,
    [Quality] decimal(18,2)  NOT NULL,
    [SourceUrls] nvarchar(max)  NOT NULL,
    [RuleConfig] nvarchar(max)  NOT NULL,
    [IsShow] int  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [SpiderMode] int  NOT NULL,
    [TargetPlatforms] nvarchar(500)  NOT NULL,
    [ExecutionInterval] bigint  NOT NULL,
    [LastStartTime] datetime  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Spider_Log'
CREATE TABLE [dbo].[yy_Spider_Log] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [SpiderID] bigint  NOT NULL,
    [TotalUrl] bigint  NOT NULL,
    [SuccessUrl] bigint  NOT NULL
);
GO

-- Creating table 'yy_Spider_News'
CREATE TABLE [dbo].[yy_Spider_News] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Identifer] bigint  NOT NULL,
    [SpiderID] bigint  NOT NULL,
    [Title] nvarchar(200)  NOT NULL,
    [SourceUrl] nvarchar(500)  NOT NULL,
    [DefaultImage] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(200)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Info] nvarchar(max)  NOT NULL,
    [IsSync] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Statistics'
CREATE TABLE [dbo].[yy_Statistics] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [PID] bigint  NOT NULL,
    [Type] int  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_SynchronousTask'
CREATE TABLE [dbo].[yy_SynchronousTask] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Platform] int  NOT NULL,
    [BusinessType] int  NOT NULL,
    [RelationID] bigint  NOT NULL,
    [OperationType] int  NOT NULL,
    [Status] int  NOT NULL,
    [MaxTry] int  NOT NULL,
    [TriedCount] int  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastUpdateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_SysError'
CREATE TABLE [dbo].[yy_SysError] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [LogKey] nvarchar(50)  NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [Source] nvarchar(max)  NOT NULL,
    [StackTrace] nvarchar(max)  NOT NULL,
    [HelpLink] nvarchar(max)  NOT NULL,
    [TargetSite] nvarchar(200)  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_User'
CREATE TABLE [dbo].[yy_User] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [HeadImgUrl] nvarchar(500)  NOT NULL,
    [Mobile] nvarchar(200)  NOT NULL,
    [Mail] nvarchar(200)  NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [UserPwd] nvarchar(100)  NOT NULL,
    [Gender] int  NOT NULL,
    [Role] int  NOT NULL,
    [Permission] nvarchar(max)  NOT NULL,
    [CountryID] int  NOT NULL,
    [ProvinceID] int  NOT NULL,
    [DistrictID] int  NOT NULL,
    [CityID] int  NOT NULL,
    [Address] nvarchar(500)  NOT NULL,
    [LockFlag] int  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_User_Type'
CREATE TABLE [dbo].[yy_User_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Permission] nvarchar(500)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateTime] datetime  NOT NULL
);
GO

-- Creating table 'yy_Video'
CREATE TABLE [dbo].[yy_Video] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [UserID] bigint  NOT NULL,
    [Title] nvarchar(500)  NOT NULL,
    [KeyWords] nvarchar(500)  NOT NULL,
    [Summary] nvarchar(1000)  NOT NULL,
    [TypeIDs] nvarchar(200)  NOT NULL,
    [SourceUrl] nvarchar(500)  NOT NULL,
    [Recommend] int  NOT NULL,
    [TargetPlatforms] nvarchar(500)  NOT NULL,
    [CanReply] int  NOT NULL,
    [LookCount] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'yy_Video_Type'
CREATE TABLE [dbo].[yy_Video_Type] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Summary] nvarchar(500)  NOT NULL,
    [Image] nvarchar(200)  NOT NULL,
    [PID] bigint  NOT NULL,
    [IsShow] int  NOT NULL,
    [ShowIndex] bigint  NOT NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'yy_Banner'
ALTER TABLE [dbo].[yy_Banner]
ADD CONSTRAINT [PK_yy_Banner]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Banner_Type'
ALTER TABLE [dbo].[yy_Banner_Type]
ADD CONSTRAINT [PK_yy_Banner_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Fans_Wechat'
ALTER TABLE [dbo].[yy_Fans_Wechat]
ADD CONSTRAINT [PK_yy_Fans_Wechat]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_FriendLink'
ALTER TABLE [dbo].[yy_FriendLink]
ADD CONSTRAINT [PK_yy_FriendLink]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Keywords'
ALTER TABLE [dbo].[yy_Keywords]
ADD CONSTRAINT [PK_yy_Keywords]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Message'
ALTER TABLE [dbo].[yy_Message]
ADD CONSTRAINT [PK_yy_Message]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_News'
ALTER TABLE [dbo].[yy_News]
ADD CONSTRAINT [PK_yy_News]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_News_Schedule'
ALTER TABLE [dbo].[yy_News_Schedule]
ADD CONSTRAINT [PK_yy_News_Schedule]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_News_Type'
ALTER TABLE [dbo].[yy_News_Type]
ADD CONSTRAINT [PK_yy_News_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Page'
ALTER TABLE [dbo].[yy_Page]
ADD CONSTRAINT [PK_yy_Page]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Page_Build_Config'
ALTER TABLE [dbo].[yy_Page_Build_Config]
ADD CONSTRAINT [PK_yy_Page_Build_Config]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Page_Build_Task'
ALTER TABLE [dbo].[yy_Page_Build_Task]
ADD CONSTRAINT [PK_yy_Page_Build_Task]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Page_Type'
ALTER TABLE [dbo].[yy_Page_Type]
ADD CONSTRAINT [PK_yy_Page_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Permission'
ALTER TABLE [dbo].[yy_Permission]
ADD CONSTRAINT [PK_yy_Permission]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Permission_Type'
ALTER TABLE [dbo].[yy_Permission_Type]
ADD CONSTRAINT [PK_yy_Permission_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Photo'
ALTER TABLE [dbo].[yy_Photo]
ADD CONSTRAINT [PK_yy_Photo]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Photo_Item'
ALTER TABLE [dbo].[yy_Photo_Item]
ADD CONSTRAINT [PK_yy_Photo_Item]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Photo_Type'
ALTER TABLE [dbo].[yy_Photo_Type]
ADD CONSTRAINT [PK_yy_Photo_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Platforms'
ALTER TABLE [dbo].[yy_Platforms]
ADD CONSTRAINT [PK_yy_Platforms]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Product'
ALTER TABLE [dbo].[yy_Product]
ADD CONSTRAINT [PK_yy_Product]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Product_Type'
ALTER TABLE [dbo].[yy_Product_Type]
ADD CONSTRAINT [PK_yy_Product_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_RedPack'
ALTER TABLE [dbo].[yy_RedPack]
ADD CONSTRAINT [PK_yy_RedPack]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_RedPack_Order'
ALTER TABLE [dbo].[yy_RedPack_Order]
ADD CONSTRAINT [PK_yy_RedPack_Order]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_SinglePage'
ALTER TABLE [dbo].[yy_SinglePage]
ADD CONSTRAINT [PK_yy_SinglePage]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_SiteSetting'
ALTER TABLE [dbo].[yy_SiteSetting]
ADD CONSTRAINT [PK_yy_SiteSetting]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Spider'
ALTER TABLE [dbo].[yy_Spider]
ADD CONSTRAINT [PK_yy_Spider]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Spider_Log'
ALTER TABLE [dbo].[yy_Spider_Log]
ADD CONSTRAINT [PK_yy_Spider_Log]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Spider_News'
ALTER TABLE [dbo].[yy_Spider_News]
ADD CONSTRAINT [PK_yy_Spider_News]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Statistics'
ALTER TABLE [dbo].[yy_Statistics]
ADD CONSTRAINT [PK_yy_Statistics]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_SynchronousTask'
ALTER TABLE [dbo].[yy_SynchronousTask]
ADD CONSTRAINT [PK_yy_SynchronousTask]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_SysError'
ALTER TABLE [dbo].[yy_SysError]
ADD CONSTRAINT [PK_yy_SysError]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_User'
ALTER TABLE [dbo].[yy_User]
ADD CONSTRAINT [PK_yy_User]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_User_Type'
ALTER TABLE [dbo].[yy_User_Type]
ADD CONSTRAINT [PK_yy_User_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Video'
ALTER TABLE [dbo].[yy_Video]
ADD CONSTRAINT [PK_yy_Video]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'yy_Video_Type'
ALTER TABLE [dbo].[yy_Video_Type]
ADD CONSTRAINT [PK_yy_Video_Type]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------