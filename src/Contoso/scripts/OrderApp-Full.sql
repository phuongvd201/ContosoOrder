USE [Contoso]
GO
/****** Object:  User [dev_contoso]    Script Date: 6/26/2016 6:48:48 AM ******/
CREATE USER [dev_contoso] FOR LOGIN [dev_contoso] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 6/26/2016 6:48:49 AM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 6/26/2016 6:48:50 AM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 6/26/2016 6:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'10a4b6ca-584e-4fc0-bd73-5f13f4524d1d', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'10a4b6ca-584e-4fc0-bd73-5f13f4524d1d', N'0fac16c5-9ae8-4ad5-a6f2-7f2e3d0cd695', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'10a4b6ca-584e-4fc0-bd73-5f13f4524d1d', N'4b279158-0e8e-497f-b47d-305f87286ad4', N'Member', N'member', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (1, N'Cutomer name 01', N'email01@gmail.com', N'Da nang 01', N'01232133', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (2, N'Cutomer name 02', N'email02@gmail.com', N'Da nang 02', N'01232133', N'Uraguay')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (3, N'Cutomer name 03', N'email03@gmail.com', N'Da nang 03', N'01232133', N'Uraguay')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (4, N'Name 04', N'email04@gmail.com', N'sai gon', N'413221', N'American Samoa')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (5, N'Name 05', N'email05@gmail.com', N'sai gon', N'413221', N'American Samoa')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (6, N'Name 07', N'email05@gmail.com', N'sai gon', N'413221', N'American Samoa')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (7, N'fsdfs', N'fdsfsd@fsd.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (8, N'321', N'321321@fsd.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (9, N'312321', N'fsda@fsfds.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (10, N'312321', N'fsda@fsfds.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (11, N'sfsdf', N'dsa@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (12, N'fsdfs', N'fsdafds@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (13, N'gfsgfdgfd', N'fsdafds@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (14, N'fsdfsd', N'fsdfsa@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (15, N'gfdgdf', N'gdfgdf@gfdgd.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (16, N'fsdfds', N'fsdfd@cxcxz.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (17, N'fdsfdsf', N'fdsfsda@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (18, N'fdsfsdf', N'fsdfs@fsdfds.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (19, N'dsfdsfsd', N'dssa@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (20, N'dsfdsfsd', N'dssa@fdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (21, N'fsdfsd', N'fdsfsdf@csdf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (22, N'fsdfsd', N'fdsfsdf@csdf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (23, N'fdsfdsf', N'fsdfsdfa@fdsfs.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (24, N'fdsfdsf', N'fsdfsdfa@fdsfs.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (25, N'fdsfdsf', N'fsdfsdfa@fdsfs.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (26, N'dsfdsaff', N'dsffsda@fsfsdfsd.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (27, N'fgfhgfhf', N'fgdgd@fsfa.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (28, N'123213213fdsfdsf', N'fdsfasfsdfw@fsafdsf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (29, N'sdfsdafdsfsdffds', N'fdsfsdaf@fsdf.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (30, N'sdaf', N'phuongvd@contoso.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (31, N'sdfdsf', N'phuongvd2@contoso.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (32, N'fsd', N'phuongvd@contoso.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (33, N'1321321fdsfsdfsdaf', N'debbie@company.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (34, N'fsdfsdfsdafsaf', N'debbie@company.com', N'fsdafsfsd', N'fdsfsdf', N'Antigua & Barbuda')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (35, N'fsd', N'phuongvd@contoso.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (36, N'sdfsdfsd', N'phuongvd201@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (37, N'000phuong', N'phuongvd201@gmail.com', N'32321312', N'3213123213', N'Angola')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (38, N'000001phuong', N'debbie@company.com', N'fsdfsfdsfsdfsd', N'321321321', N'Algeria')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (39, N'Customer 0', N'customer_mail0@contoso.com', N'0Da Nang,  Viet Nam', N'0903213350', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (40, N'Customer 1', N'customer_mail1@contoso.com', N'1Da Nang,  Viet Nam', N'0903213351', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (41, N'Customer 2', N'customer_mail2@contoso.com', N'2Da Nang,  Viet Nam', N'0903213352', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (42, N'Customer 3', N'customer_mail3@contoso.com', N'3Da Nang,  Viet Nam', N'0903213353', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (43, N'Customer 4', N'customer_mail4@contoso.com', N'4Da Nang,  Viet Nam', N'0903213354', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (44, N'Customer 5', N'customer_mail5@contoso.com', N'5Da Nang,  Viet Nam', N'0903213355', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (45, N'Customer 6', N'customer_mail6@contoso.com', N'6Da Nang,  Viet Nam', N'0903213356', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (46, N'Customer 7', N'customer_mail7@contoso.com', N'7Da Nang,  Viet Nam', N'0903213357', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (47, N'Customer 8', N'customer_mail8@contoso.com', N'8Da Nang,  Viet Nam', N'0903213358', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (48, N'Customer 9', N'customer_mail9@contoso.com', N'9Da Nang,  Viet Nam', N'0903213359', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (49, N'Customer 10', N'customer_mail10@contoso.com', N'10Da Nang,  Viet Nam', N'09032133510', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (50, N'Customer 11', N'customer_mail11@contoso.com', N'11Da Nang,  Viet Nam', N'09032133511', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (51, N'Customer 12', N'customer_mail12@contoso.com', N'12Da Nang,  Viet Nam', N'09032133512', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (52, N'Customer 13', N'customer_mail13@contoso.com', N'13Da Nang,  Viet Nam', N'09032133513', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (53, N'Customer 14', N'customer_mail14@contoso.com', N'14Da Nang,  Viet Nam', N'09032133514', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (54, N'Customer 15', N'customer_mail15@contoso.com', N'15Da Nang,  Viet Nam', N'09032133515', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (55, N'Customer 16', N'customer_mail16@contoso.com', N'16Da Nang,  Viet Nam', N'09032133516', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (56, N'Customer 17', N'customer_mail17@contoso.com', N'17Da Nang,  Viet Nam', N'09032133517', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (57, N'Customer 18', N'customer_mail18@contoso.com', N'18Da Nang,  Viet Nam', N'09032133518', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (58, N'Customer 19', N'customer_mail19@contoso.com', N'19Da Nang,  Viet Nam', N'09032133519', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (59, N'Customer 20', N'customer_mail20@contoso.com', N'20Da Nang,  Viet Nam', N'09032133520', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (60, N'Customer 21', N'customer_mail21@contoso.com', N'21Da Nang,  Viet Nam', N'09032133521', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (61, N'Customer 22', N'customer_mail22@contoso.com', N'22Da Nang,  Viet Nam', N'09032133522', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (62, N'Customer 23', N'customer_mail23@contoso.com', N'23Da Nang,  Viet Nam', N'09032133523', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (63, N'Customer 24', N'customer_mail24@contoso.com', N'24Da Nang,  Viet Nam', N'09032133524', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (64, N'Customer 25', N'customer_mail25@contoso.com', N'25Da Nang,  Viet Nam', N'09032133525', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (65, N'Customer 26', N'customer_mail26@contoso.com', N'26Da Nang,  Viet Nam', N'09032133526', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (66, N'Customer 27', N'customer_mail27@contoso.com', N'27Da Nang,  Viet Nam', N'09032133527', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (67, N'Customer 28', N'customer_mail28@contoso.com', N'28Da Nang,  Viet Nam', N'09032133528', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (68, N'Customer 29', N'customer_mail29@contoso.com', N'29Da Nang,  Viet Nam', N'09032133529', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (69, N'Customer 30', N'customer_mail30@contoso.com', N'30Da Nang,  Viet Nam', N'09032133530', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (70, N'Customer 31', N'customer_mail31@contoso.com', N'31Da Nang,  Viet Nam', N'09032133531', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (71, N'Customer 32', N'customer_mail32@contoso.com', N'32Da Nang,  Viet Nam', N'09032133532', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (72, N'Customer 33', N'customer_mail33@contoso.com', N'33Da Nang,  Viet Nam', N'09032133533', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (73, N'Customer 34', N'customer_mail34@contoso.com', N'34Da Nang,  Viet Nam', N'09032133534', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (74, N'Customer 35', N'customer_mail35@contoso.com', N'35Da Nang,  Viet Nam', N'09032133535', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (75, N'Customer 36', N'customer_mail36@contoso.com', N'36Da Nang,  Viet Nam', N'09032133536', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (76, N'Customer 37', N'customer_mail37@contoso.com', N'37Da Nang,  Viet Nam', N'09032133537', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (77, N'Customer 38', N'customer_mail38@contoso.com', N'38Da Nang,  Viet Nam', N'09032133538', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (78, N'Customer 39', N'customer_mail39@contoso.com', N'39Da Nang,  Viet Nam', N'09032133539', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (79, N'Customer 40', N'customer_mail40@contoso.com', N'40Da Nang,  Viet Nam', N'09032133540', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (80, N'Customer 41', N'customer_mail41@contoso.com', N'41Da Nang,  Viet Nam', N'09032133541', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (81, N'Customer 42', N'customer_mail42@contoso.com', N'42Da Nang,  Viet Nam', N'09032133542', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (82, N'Customer 43', N'customer_mail43@contoso.com', N'43Da Nang,  Viet Nam', N'09032133543', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (83, N'Customer 44', N'customer_mail44@contoso.com', N'44Da Nang,  Viet Nam', N'09032133544', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (84, N'Customer 45', N'customer_mail45@contoso.com', N'45Da Nang,  Viet Nam', N'09032133545', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (85, N'Customer 46', N'customer_mail46@contoso.com', N'46Da Nang,  Viet Nam', N'09032133546', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (86, N'Customer 47', N'customer_mail47@contoso.com', N'47Da Nang,  Viet Nam', N'09032133547', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (87, N'Customer 48', N'customer_mail48@contoso.com', N'48Da Nang,  Viet Nam', N'09032133548', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (88, N'Customer 49', N'customer_mail49@contoso.com', N'49Da Nang,  Viet Nam', N'09032133549', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (89, N'Customer 50', N'customer_mail50@contoso.com', N'50Da Nang,  Viet Nam', N'09032133550', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (90, N'Customer 51', N'customer_mail51@contoso.com', N'51Da Nang,  Viet Nam', N'09032133551', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (91, N'Customer 52', N'customer_mail52@contoso.com', N'52Da Nang,  Viet Nam', N'09032133552', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (92, N'Customer 53', N'customer_mail53@contoso.com', N'53Da Nang,  Viet Nam', N'09032133553', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (93, N'Customer 54', N'customer_mail54@contoso.com', N'54Da Nang,  Viet Nam', N'09032133554', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (94, N'Customer 55', N'customer_mail55@contoso.com', N'55Da Nang,  Viet Nam', N'09032133555', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (95, N'Customer 56', N'customer_mail56@contoso.com', N'56Da Nang,  Viet Nam', N'09032133556', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (96, N'Customer 57', N'customer_mail57@contoso.com', N'57Da Nang,  Viet Nam', N'09032133557', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (97, N'Customer 58', N'customer_mail58@contoso.com', N'58Da Nang,  Viet Nam', N'09032133558', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (98, N'Customer 59', N'customer_mail59@contoso.com', N'59Da Nang,  Viet Nam', N'09032133559', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (99, N'Customer 60', N'customer_mail60@contoso.com', N'60Da Nang,  Viet Nam', N'09032133560', N'Vietnam')
GO
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (100, N'Customer 61', N'customer_mail61@contoso.com', N'61Da Nang,  Viet Nam', N'09032133561', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (101, N'Customer 62', N'customer_mail62@contoso.com', N'62Da Nang,  Viet Nam', N'09032133562', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (102, N'Customer 63', N'customer_mail63@contoso.com', N'63Da Nang,  Viet Nam', N'09032133563', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (103, N'Customer 64', N'customer_mail64@contoso.com', N'64Da Nang,  Viet Nam', N'09032133564', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (104, N'Customer 65', N'customer_mail65@contoso.com', N'65Da Nang,  Viet Nam', N'09032133565', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (105, N'Customer 66', N'customer_mail66@contoso.com', N'66Da Nang,  Viet Nam', N'09032133566', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (106, N'Customer 67', N'customer_mail67@contoso.com', N'67Da Nang,  Viet Nam', N'09032133567', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (107, N'Customer 68', N'customer_mail68@contoso.com', N'68Da Nang,  Viet Nam', N'09032133568', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (108, N'Customer 69', N'customer_mail69@contoso.com', N'69Da Nang,  Viet Nam', N'09032133569', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (109, N'Customer 70', N'customer_mail70@contoso.com', N'70Da Nang,  Viet Nam', N'09032133570', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (110, N'Customer 71', N'customer_mail71@contoso.com', N'71Da Nang,  Viet Nam', N'09032133571', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (111, N'Customer 72', N'customer_mail72@contoso.com', N'72Da Nang,  Viet Nam', N'09032133572', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (112, N'Customer 73', N'customer_mail73@contoso.com', N'73Da Nang,  Viet Nam', N'09032133573', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (113, N'Customer 74', N'customer_mail74@contoso.com', N'74Da Nang,  Viet Nam', N'09032133574', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (114, N'Customer 75', N'customer_mail75@contoso.com', N'75Da Nang,  Viet Nam', N'09032133575', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (115, N'Customer 76', N'customer_mail76@contoso.com', N'76Da Nang,  Viet Nam', N'09032133576', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (116, N'Customer 77', N'customer_mail77@contoso.com', N'77Da Nang,  Viet Nam', N'09032133577', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (117, N'Customer 78', N'customer_mail78@contoso.com', N'78Da Nang,  Viet Nam', N'09032133578', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (118, N'Customer 79', N'customer_mail79@contoso.com', N'79Da Nang,  Viet Nam', N'09032133579', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (119, N'Customer 80', N'customer_mail80@contoso.com', N'80Da Nang,  Viet Nam', N'09032133580', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (120, N'Customer 81', N'customer_mail81@contoso.com', N'81Da Nang,  Viet Nam', N'09032133581', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (121, N'Customer 82', N'customer_mail82@contoso.com', N'82Da Nang,  Viet Nam', N'09032133582', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (122, N'Customer 83', N'customer_mail83@contoso.com', N'83Da Nang,  Viet Nam', N'09032133583', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (123, N'Customer 84', N'customer_mail84@contoso.com', N'84Da Nang,  Viet Nam', N'09032133584', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (124, N'Customer 85', N'customer_mail85@contoso.com', N'85Da Nang,  Viet Nam', N'09032133585', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (125, N'Customer 86', N'customer_mail86@contoso.com', N'86Da Nang,  Viet Nam', N'09032133586', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (126, N'Customer 87', N'customer_mail87@contoso.com', N'87Da Nang,  Viet Nam', N'09032133587', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (127, N'Customer 88', N'customer_mail88@contoso.com', N'88Da Nang,  Viet Nam', N'09032133588', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (128, N'Customer 89', N'customer_mail89@contoso.com', N'89Da Nang,  Viet Nam', N'09032133589', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (129, N'Customer 90', N'customer_mail90@contoso.com', N'90Da Nang,  Viet Nam', N'09032133590', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (130, N'Customer 91', N'customer_mail91@contoso.com', N'91Da Nang,  Viet Nam', N'09032133591', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (131, N'Customer 92', N'customer_mail92@contoso.com', N'92Da Nang,  Viet Nam', N'09032133592', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (132, N'Customer 93', N'customer_mail93@contoso.com', N'93Da Nang,  Viet Nam', N'09032133593', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (133, N'Customer 94', N'customer_mail94@contoso.com', N'94Da Nang,  Viet Nam', N'09032133594', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (134, N'Customer 95', N'customer_mail95@contoso.com', N'95Da Nang,  Viet Nam', N'09032133595', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (135, N'Customer 96', N'customer_mail96@contoso.com', N'96Da Nang,  Viet Nam', N'09032133596', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (136, N'Customer 97', N'customer_mail97@contoso.com', N'97Da Nang,  Viet Nam', N'09032133597', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (137, N'Customer 98', N'customer_mail98@contoso.com', N'98Da Nang,  Viet Nam', N'09032133598', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (138, N'Customer 99', N'customer_mail99@contoso.com', N'99Da Nang,  Viet Nam', N'09032133599', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (139, N'Customer 100', N'customer_mail100@contoso.com', N'100Da Nang,  Viet Nam', N'090321335100', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (140, N'Customer 101', N'customer_mail101@contoso.com', N'101Da Nang,  Viet Nam', N'090321335101', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (141, N'Customer 102', N'customer_mail102@contoso.com', N'102Da Nang,  Viet Nam', N'090321335102', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (142, N'Customer 103', N'customer_mail103@contoso.com', N'103Da Nang,  Viet Nam', N'090321335103', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (143, N'Customer 104', N'customer_mail104@contoso.com', N'104Da Nang,  Viet Nam', N'090321335104', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (144, N'Customer 105', N'customer_mail105@contoso.com', N'105Da Nang,  Viet Nam', N'090321335105', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (145, N'Customer 106', N'customer_mail106@contoso.com', N'106Da Nang,  Viet Nam', N'090321335106', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (146, N'Customer 107', N'customer_mail107@contoso.com', N'107Da Nang,  Viet Nam', N'090321335107', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (147, N'Customer 108', N'customer_mail108@contoso.com', N'108Da Nang,  Viet Nam', N'090321335108', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (148, N'Customer 109', N'customer_mail109@contoso.com', N'109Da Nang,  Viet Nam', N'090321335109', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (149, N'Customer 110', N'customer_mail110@contoso.com', N'110Da Nang,  Viet Nam', N'090321335110', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (150, N'Customer 111', N'customer_mail111@contoso.com', N'111Da Nang,  Viet Nam', N'090321335111', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (151, N'Customer 112', N'customer_mail112@contoso.com', N'112Da Nang,  Viet Nam', N'090321335112', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (152, N'Customer 113', N'customer_mail113@contoso.com', N'113Da Nang,  Viet Nam', N'090321335113', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (153, N'Customer 114', N'customer_mail114@contoso.com', N'114Da Nang,  Viet Nam', N'090321335114', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (154, N'Customer 115', N'customer_mail115@contoso.com', N'115Da Nang,  Viet Nam', N'090321335115', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (155, N'Customer 116', N'customer_mail116@contoso.com', N'116Da Nang,  Viet Nam', N'090321335116', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (156, N'Customer 117', N'customer_mail117@contoso.com', N'117Da Nang,  Viet Nam', N'090321335117', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (157, N'Customer 118', N'customer_mail118@contoso.com', N'118Da Nang,  Viet Nam', N'090321335118', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (158, N'Customer 119', N'customer_mail119@contoso.com', N'119Da Nang,  Viet Nam', N'090321335119', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (159, N'Customer 120', N'customer_mail120@contoso.com', N'120Da Nang,  Viet Nam', N'090321335120', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (160, N'Customer 121', N'customer_mail121@contoso.com', N'121Da Nang,  Viet Nam', N'090321335121', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (161, N'Customer 122', N'customer_mail122@contoso.com', N'122Da Nang,  Viet Nam', N'090321335122', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (162, N'Customer 123', N'customer_mail123@contoso.com', N'123Da Nang,  Viet Nam', N'090321335123', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (163, N'Customer 124', N'customer_mail124@contoso.com', N'124Da Nang,  Viet Nam', N'090321335124', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (164, N'Customer 125', N'customer_mail125@contoso.com', N'125Da Nang,  Viet Nam', N'090321335125', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (165, N'Customer 126', N'customer_mail126@contoso.com', N'126Da Nang,  Viet Nam', N'090321335126', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (166, N'Customer 127', N'customer_mail127@contoso.com', N'127Da Nang,  Viet Nam', N'090321335127', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (167, N'Customer 128', N'customer_mail128@contoso.com', N'128Da Nang,  Viet Nam', N'090321335128', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (168, N'Customer 129', N'customer_mail129@contoso.com', N'129Da Nang,  Viet Nam', N'090321335129', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (169, N'Customer 130', N'customer_mail130@contoso.com', N'130Da Nang,  Viet Nam', N'090321335130', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (170, N'Customer 131', N'customer_mail131@contoso.com', N'131Da Nang,  Viet Nam', N'090321335131', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (171, N'Customer 132', N'customer_mail132@contoso.com', N'132Da Nang,  Viet Nam', N'090321335132', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (172, N'Customer 133', N'customer_mail133@contoso.com', N'133Da Nang,  Viet Nam', N'090321335133', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (173, N'Customer 134', N'customer_mail134@contoso.com', N'134Da Nang,  Viet Nam', N'090321335134', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (174, N'Customer 135', N'customer_mail135@contoso.com', N'135Da Nang,  Viet Nam', N'090321335135', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (175, N'Customer 136', N'customer_mail136@contoso.com', N'136Da Nang,  Viet Nam', N'090321335136', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (176, N'Customer 137', N'customer_mail137@contoso.com', N'137Da Nang,  Viet Nam', N'090321335137', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (177, N'Customer 138', N'customer_mail138@contoso.com', N'138Da Nang,  Viet Nam', N'090321335138', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (178, N'Customer 139', N'customer_mail139@contoso.com', N'139Da Nang,  Viet Nam', N'090321335139', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (179, N'Customer 140', N'customer_mail140@contoso.com', N'140Da Nang,  Viet Nam', N'090321335140', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (180, N'Customer 141', N'customer_mail141@contoso.com', N'141Da Nang,  Viet Nam', N'090321335141', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (181, N'Customer 142', N'customer_mail142@contoso.com', N'142Da Nang,  Viet Nam', N'090321335142', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (182, N'Customer 143', N'customer_mail143@contoso.com', N'143Da Nang,  Viet Nam', N'090321335143', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (183, N'Customer 144', N'customer_mail144@contoso.com', N'144Da Nang,  Viet Nam', N'090321335144', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (184, N'Customer 145', N'customer_mail145@contoso.com', N'145Da Nang,  Viet Nam', N'090321335145', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (185, N'Customer 146', N'customer_mail146@contoso.com', N'146Da Nang,  Viet Nam', N'090321335146', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (186, N'Customer 147', N'customer_mail147@contoso.com', N'147Da Nang,  Viet Nam', N'090321335147', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (187, N'Customer 148', N'customer_mail148@contoso.com', N'148Da Nang,  Viet Nam', N'090321335148', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (188, N'Customer 149', N'customer_mail149@contoso.com', N'149Da Nang,  Viet Nam', N'090321335149', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (189, N'Customer 150', N'customer_mail150@contoso.com', N'150Da Nang,  Viet Nam', N'090321335150', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (190, N'Customer 151', N'customer_mail151@contoso.com', N'151Da Nang,  Viet Nam', N'090321335151', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (191, N'Customer 152', N'customer_mail152@contoso.com', N'152Da Nang,  Viet Nam', N'090321335152', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (192, N'Customer 153', N'customer_mail153@contoso.com', N'153Da Nang,  Viet Nam', N'090321335153', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (193, N'Customer 154', N'customer_mail154@contoso.com', N'154Da Nang,  Viet Nam', N'090321335154', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (194, N'Customer 155', N'customer_mail155@contoso.com', N'155Da Nang,  Viet Nam', N'090321335155', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (195, N'Customer 156', N'customer_mail156@contoso.com', N'156Da Nang,  Viet Nam', N'090321335156', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (196, N'Customer 157', N'customer_mail157@contoso.com', N'157Da Nang,  Viet Nam', N'090321335157', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (197, N'Customer 158', N'customer_mail158@contoso.com', N'158Da Nang,  Viet Nam', N'090321335158', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (198, N'Customer 159', N'customer_mail159@contoso.com', N'159Da Nang,  Viet Nam', N'090321335159', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (199, N'Customer 160', N'customer_mail160@contoso.com', N'160Da Nang,  Viet Nam', N'090321335160', N'Vietnam')
GO
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (200, N'Customer 161', N'customer_mail161@contoso.com', N'161Da Nang,  Viet Nam', N'090321335161', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (201, N'Customer 162', N'customer_mail162@contoso.com', N'162Da Nang,  Viet Nam', N'090321335162', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (202, N'Customer 163', N'customer_mail163@contoso.com', N'163Da Nang,  Viet Nam', N'090321335163', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (203, N'Customer 164', N'customer_mail164@contoso.com', N'164Da Nang,  Viet Nam', N'090321335164', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (204, N'Customer 165', N'customer_mail165@contoso.com', N'165Da Nang,  Viet Nam', N'090321335165', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (205, N'Customer 166', N'customer_mail166@contoso.com', N'166Da Nang,  Viet Nam', N'090321335166', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (206, N'Customer 167', N'customer_mail167@contoso.com', N'167Da Nang,  Viet Nam', N'090321335167', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (207, N'Customer 168', N'customer_mail168@contoso.com', N'168Da Nang,  Viet Nam', N'090321335168', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (208, N'Customer 169', N'customer_mail169@contoso.com', N'169Da Nang,  Viet Nam', N'090321335169', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (209, N'Customer 170', N'customer_mail170@contoso.com', N'170Da Nang,  Viet Nam', N'090321335170', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (210, N'Customer 171', N'customer_mail171@contoso.com', N'171Da Nang,  Viet Nam', N'090321335171', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (211, N'Customer 172', N'customer_mail172@contoso.com', N'172Da Nang,  Viet Nam', N'090321335172', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (212, N'Customer 173', N'customer_mail173@contoso.com', N'173Da Nang,  Viet Nam', N'090321335173', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (213, N'Customer 174', N'customer_mail174@contoso.com', N'174Da Nang,  Viet Nam', N'090321335174', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (214, N'Customer 175', N'customer_mail175@contoso.com', N'175Da Nang,  Viet Nam', N'090321335175', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (215, N'Customer 176', N'customer_mail176@contoso.com', N'176Da Nang,  Viet Nam', N'090321335176', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (216, N'Customer 177', N'customer_mail177@contoso.com', N'177Da Nang,  Viet Nam', N'090321335177', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (217, N'Customer 178', N'customer_mail178@contoso.com', N'178Da Nang,  Viet Nam', N'090321335178', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (218, N'Customer 179', N'customer_mail179@contoso.com', N'179Da Nang,  Viet Nam', N'090321335179', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (219, N'Customer 180', N'customer_mail180@contoso.com', N'180Da Nang,  Viet Nam', N'090321335180', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (220, N'Customer 181', N'customer_mail181@contoso.com', N'181Da Nang,  Viet Nam', N'090321335181', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (221, N'Customer 182', N'customer_mail182@contoso.com', N'182Da Nang,  Viet Nam', N'090321335182', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (222, N'Customer 183', N'customer_mail183@contoso.com', N'183Da Nang,  Viet Nam', N'090321335183', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (223, N'Customer 184', N'customer_mail184@contoso.com', N'184Da Nang,  Viet Nam', N'090321335184', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (224, N'Customer 185', N'customer_mail185@contoso.com', N'185Da Nang,  Viet Nam', N'090321335185', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (225, N'Customer 186', N'customer_mail186@contoso.com', N'186Da Nang,  Viet Nam', N'090321335186', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (226, N'Customer 187', N'customer_mail187@contoso.com', N'187Da Nang,  Viet Nam', N'090321335187', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (227, N'Customer 188', N'customer_mail188@contoso.com', N'188Da Nang,  Viet Nam', N'090321335188', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (228, N'Customer 189', N'customer_mail189@contoso.com', N'189Da Nang,  Viet Nam', N'090321335189', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (229, N'Customer 190', N'customer_mail190@contoso.com', N'190Da Nang,  Viet Nam', N'090321335190', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (230, N'Customer 191', N'customer_mail191@contoso.com', N'191Da Nang,  Viet Nam', N'090321335191', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (231, N'Customer 192', N'customer_mail192@contoso.com', N'192Da Nang,  Viet Nam', N'090321335192', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (232, N'Customer 193', N'customer_mail193@contoso.com', N'193Da Nang,  Viet Nam', N'090321335193', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (233, N'Customer 194', N'customer_mail194@contoso.com', N'194Da Nang,  Viet Nam', N'090321335194', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (234, N'Customer 195', N'customer_mail195@contoso.com', N'195Da Nang,  Viet Nam', N'090321335195', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (235, N'Customer 196', N'customer_mail196@contoso.com', N'196Da Nang,  Viet Nam', N'090321335196', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (236, N'Customer 197', N'customer_mail197@contoso.com', N'197Da Nang,  Viet Nam', N'090321335197', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (237, N'Customer 198', N'customer_mail198@contoso.com', N'198Da Nang,  Viet Nam', N'090321335198', N'Vietnam')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Address], [Phone], [Country]) VALUES (238, N'Customer 199', N'customer_mail199@contoso.com', N'199Da Nang,  Viet Nam', N'090321335199', N'Vietnam')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (1, CAST(0x0000A62C00056255 AS DateTime), N'Approve', 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (2, CAST(0x0000A62C000593EA AS DateTime), N'Approve', 2)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (3, CAST(0x0000A62C0005B7EB AS DateTime), N'New', 3)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (4, CAST(0x0000A62C000619D0 AS DateTime), N'New', 4)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (5, CAST(0x0000A62C000635D7 AS DateTime), N'New', 5)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (6, CAST(0x0000A62C00065AAD AS DateTime), N'Approve', 6)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (7, CAST(0x0000A6300132BDA2 AS DateTime), N'New', 7)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (8, CAST(0x0000A63001337A57 AS DateTime), N'New', 8)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (9, CAST(0x0000A630013FC739 AS DateTime), N'Approve', 9)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (10, CAST(0x0000A630013FCBE1 AS DateTime), N'Approve', 10)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (11, CAST(0x0000A630014027BF AS DateTime), N'New', 11)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (12, CAST(0x0000A63001411162 AS DateTime), N'New', 12)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (13, CAST(0x0000A630014123F0 AS DateTime), N'New', 13)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (14, CAST(0x0000A6300141D6C7 AS DateTime), N'New', 14)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (15, CAST(0x0000A63001421298 AS DateTime), N'New', 15)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (16, CAST(0x0000A6300142576B AS DateTime), N'New', 16)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (17, CAST(0x0000A63001445E9D AS DateTime), N'New', 17)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (18, CAST(0x0000A6300144C32A AS DateTime), N'New', 18)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (19, CAST(0x0000A63001483B80 AS DateTime), N'Reject', 19)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (20, CAST(0x0000A63001485765 AS DateTime), N'New', 20)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (21, CAST(0x0000A63001487D6D AS DateTime), N'New', 21)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (22, CAST(0x0000A63001488987 AS DateTime), N'New', 22)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (23, CAST(0x0000A6310042A156 AS DateTime), N'New', 30)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (24, CAST(0x0000A631004308A4 AS DateTime), N'New', 31)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (25, CAST(0x0000A631004D4016 AS DateTime), N'New', 32)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (26, CAST(0x0000A631004D5A2A AS DateTime), N'New', 33)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (27, CAST(0x0000A631004D7263 AS DateTime), N'New', 34)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (28, CAST(0x0000A6310054B2A0 AS DateTime), N'New', 35)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (29, CAST(0x0000A631005F3C49 AS DateTime), N'New', 36)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (30, CAST(0x0000A6310061626E AS DateTime), N'Reject', 37)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (31, CAST(0x0000A6310062035F AS DateTime), N'New', 38)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (32, CAST(0x0000A631006AA192 AS DateTime), N'Approve', 39)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (33, CAST(0x0000A631006AA1F5 AS DateTime), N'New', 40)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (34, CAST(0x0000A631006AA235 AS DateTime), N'New', 41)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (35, CAST(0x0000A631006AA286 AS DateTime), N'New', 42)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (36, CAST(0x0000A631006AA2C4 AS DateTime), N'New', 43)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (37, CAST(0x0000A631006AA300 AS DateTime), N'New', 44)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (38, CAST(0x0000A631006AA342 AS DateTime), N'New', 45)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (39, CAST(0x0000A631006AA385 AS DateTime), N'New', 46)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (40, CAST(0x0000A631006AA3CB AS DateTime), N'New', 47)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (41, CAST(0x0000A631006AA417 AS DateTime), N'New', 48)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (42, CAST(0x0000A631006AA461 AS DateTime), N'New', 49)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (43, CAST(0x0000A631006AA4AB AS DateTime), N'New', 50)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (44, CAST(0x0000A631006AA4FB AS DateTime), N'New', 51)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (45, CAST(0x0000A631006AA53A AS DateTime), N'New', 52)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (46, CAST(0x0000A631006AA574 AS DateTime), N'New', 53)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (47, CAST(0x0000A631006AA5BB AS DateTime), N'New', 54)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (48, CAST(0x0000A631006AA607 AS DateTime), N'New', 55)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (49, CAST(0x0000A631006AA64B AS DateTime), N'New', 56)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (50, CAST(0x0000A631006AA68A AS DateTime), N'New', 57)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (51, CAST(0x0000A631006AA6CF AS DateTime), N'New', 58)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (52, CAST(0x0000A631006AA74D AS DateTime), N'New', 59)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (53, CAST(0x0000A631006AA79A AS DateTime), N'New', 60)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (54, CAST(0x0000A631006AA7F0 AS DateTime), N'New', 61)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (55, CAST(0x0000A631006AA834 AS DateTime), N'New', 62)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (56, CAST(0x0000A631006AA888 AS DateTime), N'New', 63)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (57, CAST(0x0000A631006AA8E6 AS DateTime), N'New', 64)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (58, CAST(0x0000A631006AA924 AS DateTime), N'New', 65)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (59, CAST(0x0000A631006AA957 AS DateTime), N'New', 66)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (60, CAST(0x0000A631006AA9A5 AS DateTime), N'New', 67)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (61, CAST(0x0000A631006AAA0C AS DateTime), N'New', 68)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (62, CAST(0x0000A631006AAA4A AS DateTime), N'New', 69)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (63, CAST(0x0000A631006AAA8D AS DateTime), N'New', 70)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (64, CAST(0x0000A631006AAAD2 AS DateTime), N'New', 71)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (65, CAST(0x0000A631006AAB1D AS DateTime), N'New', 72)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (66, CAST(0x0000A631006AAB6C AS DateTime), N'New', 73)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (67, CAST(0x0000A631006AABA8 AS DateTime), N'New', 74)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (68, CAST(0x0000A631006AABEB AS DateTime), N'New', 75)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (69, CAST(0x0000A631006AAC2D AS DateTime), N'New', 76)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (70, CAST(0x0000A631006AAC7B AS DateTime), N'New', 77)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (71, CAST(0x0000A631006AACBB AS DateTime), N'New', 78)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (72, CAST(0x0000A631006AAD06 AS DateTime), N'New', 79)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (73, CAST(0x0000A631006AAD48 AS DateTime), N'New', 80)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (74, CAST(0x0000A631006AAD96 AS DateTime), N'New', 81)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (75, CAST(0x0000A631006AADD7 AS DateTime), N'New', 82)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (76, CAST(0x0000A631006AAE22 AS DateTime), N'New', 83)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (77, CAST(0x0000A631006AAE69 AS DateTime), N'New', 84)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (78, CAST(0x0000A631006AAEAD AS DateTime), N'New', 85)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (79, CAST(0x0000A631006AAF4D AS DateTime), N'New', 86)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (80, CAST(0x0000A631006AAF97 AS DateTime), N'New', 87)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (81, CAST(0x0000A631006AAFE1 AS DateTime), N'New', 88)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (82, CAST(0x0000A631006AB01C AS DateTime), N'New', 89)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (83, CAST(0x0000A631006AB059 AS DateTime), N'New', 90)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (84, CAST(0x0000A631006AB09D AS DateTime), N'New', 91)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (85, CAST(0x0000A631006AB0F9 AS DateTime), N'New', 92)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (86, CAST(0x0000A631006AB144 AS DateTime), N'New', 93)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (87, CAST(0x0000A631006AB18A AS DateTime), N'New', 94)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (88, CAST(0x0000A631006AB1CB AS DateTime), N'New', 95)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (89, CAST(0x0000A631006AB215 AS DateTime), N'New', 96)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (90, CAST(0x0000A631006AB266 AS DateTime), N'New', 97)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (91, CAST(0x0000A631006AB2AA AS DateTime), N'New', 98)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (92, CAST(0x0000A631006AB2EE AS DateTime), N'New', 99)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (93, CAST(0x0000A631006AB33A AS DateTime), N'New', 100)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (94, CAST(0x0000A631006AB37C AS DateTime), N'New', 101)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (95, CAST(0x0000A631006AB3BD AS DateTime), N'New', 102)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (96, CAST(0x0000A631006AB400 AS DateTime), N'New', 103)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (97, CAST(0x0000A631006AB45D AS DateTime), N'New', 104)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (98, CAST(0x0000A631006AB4A3 AS DateTime), N'New', 105)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (99, CAST(0x0000A631006AB4EE AS DateTime), N'New', 106)
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (100, CAST(0x0000A631006AB52E AS DateTime), N'New', 107)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (101, CAST(0x0000A631006AB57B AS DateTime), N'New', 108)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (102, CAST(0x0000A631006AB5BE AS DateTime), N'New', 109)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (103, CAST(0x0000A631006AB605 AS DateTime), N'New', 110)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (104, CAST(0x0000A631006AB64E AS DateTime), N'New', 111)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (105, CAST(0x0000A631006AB6A2 AS DateTime), N'New', 112)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (106, CAST(0x0000A631006AB6ED AS DateTime), N'New', 113)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (107, CAST(0x0000A631006AB73B AS DateTime), N'New', 114)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (108, CAST(0x0000A631006AB788 AS DateTime), N'New', 115)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (109, CAST(0x0000A631006AB7DF AS DateTime), N'New', 116)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (110, CAST(0x0000A631006AB81B AS DateTime), N'New', 117)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (111, CAST(0x0000A631006AB869 AS DateTime), N'New', 118)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (112, CAST(0x0000A631006AB8A9 AS DateTime), N'New', 119)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (113, CAST(0x0000A631006AB8E8 AS DateTime), N'New', 120)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (114, CAST(0x0000A631006AB942 AS DateTime), N'New', 121)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (115, CAST(0x0000A631006AB995 AS DateTime), N'New', 122)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (116, CAST(0x0000A631006AB9DB AS DateTime), N'New', 123)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (117, CAST(0x0000A631006ABA21 AS DateTime), N'New', 124)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (118, CAST(0x0000A631006ABA5E AS DateTime), N'New', 125)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (119, CAST(0x0000A631006ABAB3 AS DateTime), N'New', 126)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (120, CAST(0x0000A631006ABAF3 AS DateTime), N'New', 127)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (121, CAST(0x0000A631006ABB35 AS DateTime), N'New', 128)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (122, CAST(0x0000A631006ABB72 AS DateTime), N'New', 129)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (123, CAST(0x0000A631006ABBB4 AS DateTime), N'New', 130)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (124, CAST(0x0000A631006ABBF5 AS DateTime), N'New', 131)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (125, CAST(0x0000A631006ABC3D AS DateTime), N'New', 132)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (126, CAST(0x0000A631006ABC95 AS DateTime), N'New', 133)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (127, CAST(0x0000A631006ABCE6 AS DateTime), N'New', 134)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (128, CAST(0x0000A631006ABD44 AS DateTime), N'New', 135)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (129, CAST(0x0000A631006ABD89 AS DateTime), N'New', 136)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (130, CAST(0x0000A631006ABDCE AS DateTime), N'New', 137)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (131, CAST(0x0000A631006ABE1A AS DateTime), N'New', 138)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (132, CAST(0x0000A631006ABE6C AS DateTime), N'New', 139)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (133, CAST(0x0000A631006ABEB7 AS DateTime), N'New', 140)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (134, CAST(0x0000A631006ABEFF AS DateTime), N'New', 141)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (135, CAST(0x0000A631006ABF46 AS DateTime), N'New', 142)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (136, CAST(0x0000A631006ABFA2 AS DateTime), N'New', 143)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (137, CAST(0x0000A631006ABFF2 AS DateTime), N'New', 144)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (138, CAST(0x0000A631006AC040 AS DateTime), N'New', 145)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (139, CAST(0x0000A631006AC082 AS DateTime), N'New', 146)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (140, CAST(0x0000A631006AC0C6 AS DateTime), N'New', 147)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (141, CAST(0x0000A631006AC104 AS DateTime), N'New', 148)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (142, CAST(0x0000A631006AC14D AS DateTime), N'New', 149)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (143, CAST(0x0000A631006AC195 AS DateTime), N'New', 150)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (144, CAST(0x0000A631006AC1E2 AS DateTime), N'New', 151)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (145, CAST(0x0000A631006AC27A AS DateTime), N'New', 152)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (146, CAST(0x0000A631006AC2E5 AS DateTime), N'New', 153)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (147, CAST(0x0000A631006AC339 AS DateTime), N'New', 154)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (148, CAST(0x0000A631006AC3B0 AS DateTime), N'New', 155)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (149, CAST(0x0000A631006AC40F AS DateTime), N'New', 156)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (150, CAST(0x0000A631006AC47F AS DateTime), N'New', 157)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (151, CAST(0x0000A631006AC4D0 AS DateTime), N'New', 158)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (152, CAST(0x0000A631006AC526 AS DateTime), N'New', 159)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (153, CAST(0x0000A631006AC585 AS DateTime), N'New', 160)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (154, CAST(0x0000A631006AC5EA AS DateTime), N'New', 161)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (155, CAST(0x0000A631006AC640 AS DateTime), N'New', 162)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (156, CAST(0x0000A631006AC68E AS DateTime), N'New', 163)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (157, CAST(0x0000A631006AC6F0 AS DateTime), N'New', 164)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (158, CAST(0x0000A631006AC75A AS DateTime), N'New', 165)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (159, CAST(0x0000A631006AC7A9 AS DateTime), N'New', 166)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (160, CAST(0x0000A631006AC7FE AS DateTime), N'New', 167)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (161, CAST(0x0000A631006AC84A AS DateTime), N'New', 168)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (162, CAST(0x0000A631006AC895 AS DateTime), N'New', 169)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (163, CAST(0x0000A631006AC8D3 AS DateTime), N'New', 170)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (164, CAST(0x0000A631006AC918 AS DateTime), N'New', 171)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (165, CAST(0x0000A631006AC968 AS DateTime), N'New', 172)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (166, CAST(0x0000A631006AC9B1 AS DateTime), N'New', 173)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (167, CAST(0x0000A631006ACA0A AS DateTime), N'New', 174)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (168, CAST(0x0000A631006ACA4B AS DateTime), N'New', 175)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (169, CAST(0x0000A631006ACAA6 AS DateTime), N'New', 176)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (170, CAST(0x0000A631006ACAF3 AS DateTime), N'New', 177)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (171, CAST(0x0000A631006ACB3B AS DateTime), N'New', 178)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (172, CAST(0x0000A631006ACB7B AS DateTime), N'New', 179)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (173, CAST(0x0000A631006ACBC8 AS DateTime), N'New', 180)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (174, CAST(0x0000A631006ACC1F AS DateTime), N'New', 181)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (175, CAST(0x0000A631006ACC5F AS DateTime), N'New', 182)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (176, CAST(0x0000A631006ACCA4 AS DateTime), N'New', 183)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (177, CAST(0x0000A631006ACCE7 AS DateTime), N'New', 184)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (178, CAST(0x0000A631006ACD28 AS DateTime), N'New', 185)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (179, CAST(0x0000A631006ACD6D AS DateTime), N'New', 186)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (180, CAST(0x0000A631006ACDAF AS DateTime), N'New', 187)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (181, CAST(0x0000A631006ACDF5 AS DateTime), N'New', 188)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (182, CAST(0x0000A631006ACE3B AS DateTime), N'New', 189)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (183, CAST(0x0000A631006ACE8A AS DateTime), N'New', 190)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (184, CAST(0x0000A631006ACED5 AS DateTime), N'New', 191)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (185, CAST(0x0000A631006ACF20 AS DateTime), N'New', 192)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (186, CAST(0x0000A631006ACF7C AS DateTime), N'New', 193)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (187, CAST(0x0000A631006ACFD1 AS DateTime), N'New', 194)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (188, CAST(0x0000A631006AD029 AS DateTime), N'New', 195)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (189, CAST(0x0000A631006AD079 AS DateTime), N'New', 196)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (190, CAST(0x0000A631006AD0CA AS DateTime), N'New', 197)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (191, CAST(0x0000A631006AD11C AS DateTime), N'New', 198)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (192, CAST(0x0000A631006AD168 AS DateTime), N'New', 199)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (193, CAST(0x0000A631006AD1B7 AS DateTime), N'New', 200)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (194, CAST(0x0000A631006AD210 AS DateTime), N'New', 201)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (195, CAST(0x0000A631006AD25F AS DateTime), N'New', 202)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (196, CAST(0x0000A631006AD2AC AS DateTime), N'New', 203)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (197, CAST(0x0000A631006AD2F5 AS DateTime), N'New', 204)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (198, CAST(0x0000A631006AD341 AS DateTime), N'New', 205)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (199, CAST(0x0000A631006AD387 AS DateTime), N'New', 206)
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (200, CAST(0x0000A631006AD3CC AS DateTime), N'New', 207)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (201, CAST(0x0000A631006AD414 AS DateTime), N'New', 208)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (202, CAST(0x0000A631006AD458 AS DateTime), N'New', 209)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (203, CAST(0x0000A631006AD4A1 AS DateTime), N'New', 210)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (204, CAST(0x0000A631006AD4E3 AS DateTime), N'New', 211)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (205, CAST(0x0000A631006AD526 AS DateTime), N'New', 212)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (206, CAST(0x0000A631006AD56E AS DateTime), N'New', 213)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (207, CAST(0x0000A631006AD5BB AS DateTime), N'New', 214)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (208, CAST(0x0000A631006AD60C AS DateTime), N'New', 215)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (209, CAST(0x0000A631006AD658 AS DateTime), N'New', 216)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (210, CAST(0x0000A631006AD6A3 AS DateTime), N'New', 217)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (211, CAST(0x0000A631006AD6E7 AS DateTime), N'New', 218)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (212, CAST(0x0000A631006AD72D AS DateTime), N'New', 219)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (213, CAST(0x0000A631006AD772 AS DateTime), N'New', 220)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (214, CAST(0x0000A631006AD7BA AS DateTime), N'New', 221)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (215, CAST(0x0000A631006AD7FD AS DateTime), N'New', 222)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (216, CAST(0x0000A631006AD840 AS DateTime), N'New', 223)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (217, CAST(0x0000A631006AD890 AS DateTime), N'New', 224)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (218, CAST(0x0000A631006AD8E0 AS DateTime), N'New', 225)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (219, CAST(0x0000A631006AD92D AS DateTime), N'New', 226)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (220, CAST(0x0000A631006AD978 AS DateTime), N'New', 227)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (221, CAST(0x0000A631006AD9C1 AS DateTime), N'New', 228)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (222, CAST(0x0000A631006ADA05 AS DateTime), N'New', 229)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (223, CAST(0x0000A631006ADA4D AS DateTime), N'New', 230)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (224, CAST(0x0000A631006ADA98 AS DateTime), N'New', 231)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (225, CAST(0x0000A631006ADAE5 AS DateTime), N'New', 232)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (226, CAST(0x0000A631006ADB44 AS DateTime), N'New', 233)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (227, CAST(0x0000A631006ADB9B AS DateTime), N'New', 234)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (228, CAST(0x0000A631006ADBEC AS DateTime), N'New', 235)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (229, CAST(0x0000A631006ADC34 AS DateTime), N'New', 236)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (230, CAST(0x0000A631006ADC8E AS DateTime), N'New', 237)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [Status], [CustomerId]) VALUES (231, CAST(0x0000A631006ADCEE AS DateTime), N'New', 238)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 15, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 1, 71, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 1, 15, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 1, 72, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 2, 15, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 2, 68, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 2, 20, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 2, 12, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 3, 2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 3, 61, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 3, 83, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 3, 12, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 3, 14, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 3, 15, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 4, 4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 4, 5, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 4, 3, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 4, 19, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 4, 14, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 4, 14, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 5, 4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 5, 15, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 5, 3, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 5, 15, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 5, 14, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (26, 5, 14, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (27, 6, 7, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (28, 6, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (29, 6, 3, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (30, 6, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (31, 6, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (32, 6, 14, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (33, 9, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (34, 9, 2, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (35, 9, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (36, 10, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (37, 10, 2, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (38, 10, 1, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (39, 11, 14, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (40, 12, 14, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (41, 14, 17, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (42, 19, 15, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (43, 20, 15, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (44, 21, 15, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (45, 22, 15, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (46, 23, 11, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (47, 24, 15, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (48, 25, 14, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (49, 26, 11, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (50, 26, 13, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (51, 27, 19, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (52, 27, 17, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (53, 28, 2, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (54, 29, 2, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (55, 29, 1, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (56, 30, 15, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (57, 30, 15, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (58, 31, 18, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (59, 31, 13, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (60, 31, 14, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (61, 31, 19, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (62, 32, 49, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (63, 32, 62, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (64, 32, 125, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (65, 32, 77, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (66, 32, 15, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (67, 33, 60, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (68, 33, 79, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (69, 33, 34, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (70, 33, 122, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (71, 33, 66, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (72, 34, 112, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (73, 34, 89, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (74, 34, 19, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (75, 34, 11, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (76, 34, 78, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (77, 35, 20, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (78, 35, 53, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (79, 35, 71, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (80, 35, 69, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (81, 35, 33, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (82, 36, 48, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (83, 36, 105, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (84, 36, 56, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (85, 36, 99, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (86, 36, 65, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (87, 37, 34, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (88, 37, 26, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (89, 37, 110, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (90, 37, 58, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (91, 37, 62, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (92, 38, 19, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (93, 38, 74, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (94, 38, 37, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (95, 38, 17, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (96, 38, 58, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (97, 39, 72, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (98, 39, 84, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (99, 39, 21, 8)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (100, 39, 32, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (101, 39, 70, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (102, 40, 103, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (103, 40, 29, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (104, 40, 103, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (105, 40, 13, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (106, 40, 63, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (107, 41, 114, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (108, 41, 35, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (109, 41, 29, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (110, 41, 85, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (111, 41, 39, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (112, 42, 64, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (113, 42, 3, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (114, 42, 13, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (115, 42, 86, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (116, 42, 30, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (117, 43, 50, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (118, 43, 51, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (119, 43, 67, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (120, 43, 45, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (121, 43, 26, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (122, 44, 45, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (123, 44, 42, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (124, 44, 79, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (125, 44, 69, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (126, 44, 14, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (127, 45, 77, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (128, 45, 114, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (129, 45, 34, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (130, 45, 49, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (131, 45, 8, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (132, 46, 17, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (133, 46, 12, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (134, 46, 60, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (135, 46, 113, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (136, 46, 7, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (137, 47, 48, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (138, 47, 83, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (139, 47, 15, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (140, 47, 94, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (141, 47, 127, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (142, 48, 125, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (143, 48, 51, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (144, 48, 126, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (145, 48, 96, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (146, 48, 118, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (147, 49, 111, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (148, 49, 99, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (149, 49, 53, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (150, 49, 54, 46)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (151, 49, 115, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (152, 50, 118, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (153, 50, 86, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (154, 50, 8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (155, 50, 49, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (156, 50, 2, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (157, 51, 68, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (158, 51, 54, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (159, 51, 119, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (160, 51, 51, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (161, 51, 120, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (162, 52, 117, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (163, 52, 107, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (164, 52, 101, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (165, 52, 123, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (166, 52, 28, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (167, 53, 10, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (168, 53, 56, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (169, 53, 112, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (170, 53, 6, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (171, 53, 122, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (172, 54, 91, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (173, 54, 44, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (174, 54, 66, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (175, 54, 85, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (176, 54, 74, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (177, 55, 98, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (178, 55, 30, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (179, 55, 22, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (180, 55, 79, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (181, 55, 88, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (182, 56, 73, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (183, 56, 83, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (184, 56, 5, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (185, 56, 67, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (186, 56, 58, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (187, 57, 72, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (188, 57, 94, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (189, 57, 115, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (190, 57, 41, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (191, 57, 8, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (192, 58, 58, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (193, 58, 15, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (194, 58, 42, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (195, 58, 127, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (196, 58, 4, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (197, 59, 40, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (198, 59, 44, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (199, 59, 125, 48)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (200, 59, 8, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (201, 59, 39, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (202, 60, 107, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (203, 60, 68, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (204, 60, 24, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (205, 60, 73, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (206, 60, 38, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (207, 61, 96, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (208, 61, 84, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (209, 61, 63, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (210, 61, 75, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (211, 61, 88, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (212, 62, 82, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (213, 62, 5, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (214, 62, 116, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (215, 62, 34, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (216, 62, 84, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (217, 63, 7, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (218, 63, 15, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (219, 63, 101, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (220, 63, 50, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (221, 63, 96, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (222, 64, 38, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (223, 64, 86, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (224, 64, 56, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (225, 64, 30, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (226, 64, 90, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (227, 65, 49, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (228, 65, 92, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (229, 65, 109, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (230, 65, 102, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (231, 65, 65, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (232, 66, 105, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (233, 66, 122, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (234, 66, 64, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (235, 66, 69, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (236, 66, 38, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (237, 67, 31, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (238, 67, 5, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (239, 67, 48, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (240, 67, 84, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (241, 67, 50, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (242, 68, 16, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (243, 68, 53, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (244, 68, 102, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (245, 68, 43, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (246, 68, 46, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (247, 69, 23, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (248, 69, 40, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (249, 69, 58, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (250, 69, 38, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (251, 69, 60, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (252, 70, 125, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (253, 70, 92, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (254, 70, 41, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (255, 70, 26, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (256, 70, 31, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (257, 71, 111, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (258, 71, 14, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (259, 71, 95, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (260, 71, 111, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (261, 71, 27, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (262, 72, 117, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (263, 72, 127, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (264, 72, 50, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (265, 72, 106, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (266, 72, 41, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (267, 73, 67, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (268, 73, 95, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (269, 73, 34, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (270, 73, 108, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (271, 73, 32, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (272, 74, 78, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (273, 74, 101, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (274, 74, 87, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (275, 74, 52, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (276, 74, 8, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (277, 75, 109, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (278, 75, 46, 46)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (279, 75, 43, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (280, 75, 33, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (281, 75, 1, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (282, 76, 59, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (283, 76, 14, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (284, 76, 26, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (285, 76, 35, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (286, 76, 119, 46)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (287, 77, 91, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (288, 77, 85, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (289, 77, 109, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (290, 77, 15, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (291, 77, 113, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (292, 78, 122, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (293, 78, 30, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (294, 78, 64, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (295, 78, 122, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (296, 78, 106, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (297, 79, 27, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (298, 79, 101, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (299, 79, 19, 57)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (300, 79, 103, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (301, 79, 100, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (302, 80, 58, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (303, 80, 56, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (304, 80, 84, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (305, 80, 57, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (306, 80, 43, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (307, 81, 8, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (308, 81, 24, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (309, 81, 68, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (310, 81, 59, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (311, 81, 34, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (312, 82, 75, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (313, 82, 49, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (314, 82, 93, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (315, 82, 123, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (316, 82, 33, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (317, 83, 103, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (318, 83, 101, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (319, 83, 78, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (320, 83, 26, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (321, 83, 66, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (322, 84, 7, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (323, 84, 46, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (324, 84, 33, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (325, 84, 6, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (326, 84, 59, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (327, 85, 42, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (328, 85, 10, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (329, 85, 86, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (330, 85, 64, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (331, 85, 14, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (332, 86, 17, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (333, 86, 62, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (334, 86, 69, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (335, 86, 52, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (336, 86, 111, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (337, 87, 49, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (338, 87, 7, 43)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (339, 87, 24, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (340, 87, 32, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (341, 87, 104, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (342, 88, 101, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (343, 88, 17, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (344, 88, 8, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (345, 88, 48, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (346, 88, 116, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (347, 89, 87, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (348, 89, 65, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (349, 89, 62, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (350, 89, 7, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (351, 89, 112, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (352, 90, 61, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (353, 90, 118, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (354, 90, 46, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (355, 90, 122, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (356, 90, 82, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (357, 91, 93, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (358, 91, 62, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (359, 91, 1, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (360, 91, 102, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (361, 91, 76, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (362, 92, 124, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (363, 92, 7, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (364, 92, 83, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (365, 92, 82, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (366, 92, 70, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (367, 93, 110, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (368, 93, 55, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (369, 93, 10, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (370, 93, 41, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (371, 93, 66, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (372, 94, 60, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (373, 94, 23, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (374, 94, 121, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (375, 94, 43, 43)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (376, 94, 57, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (377, 95, 46, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (378, 95, 71, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (379, 95, 47, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (380, 95, 2, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (381, 95, 53, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (382, 96, 98, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (383, 96, 81, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (384, 96, 32, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (385, 96, 18, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (386, 96, 65, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (387, 97, 52, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (388, 97, 68, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (389, 97, 113, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (390, 97, 97, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (391, 97, 17, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (392, 98, 84, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (393, 98, 13, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (394, 98, 68, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (395, 98, 78, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (396, 98, 10, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (397, 99, 34, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (398, 99, 108, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (399, 99, 52, 22)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (400, 99, 79, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (401, 99, 1, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (402, 100, 20, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (403, 100, 29, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (404, 100, 106, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (405, 100, 38, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (406, 100, 125, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (407, 101, 97, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (408, 101, 124, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (409, 101, 89, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (410, 101, 40, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (411, 101, 116, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (412, 102, 107, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (413, 102, 3, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (414, 102, 16, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (415, 102, 112, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (416, 102, 91, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (417, 103, 33, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (418, 103, 13, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (419, 103, 127, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (420, 103, 1, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (421, 103, 103, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (422, 104, 64, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (423, 104, 84, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (424, 104, 82, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (425, 104, 108, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (426, 104, 96, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (427, 105, 120, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (428, 105, 114, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (429, 105, 37, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (430, 105, 74, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (431, 105, 69, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (432, 106, 95, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (433, 106, 40, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (434, 106, 20, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (435, 106, 62, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (436, 106, 39, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (437, 107, 24, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (438, 107, 69, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (439, 107, 102, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (440, 107, 29, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (441, 107, 12, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (442, 108, 35, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (443, 108, 75, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (444, 108, 28, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (445, 108, 100, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (446, 108, 114, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (447, 109, 55, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (448, 109, 24, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (449, 109, 40, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (450, 109, 110, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (451, 109, 82, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (452, 110, 62, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (453, 110, 11, 92)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (454, 110, 122, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (455, 110, 104, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (456, 110, 96, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (457, 111, 72, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (458, 111, 17, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (459, 111, 49, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (460, 111, 49, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (461, 111, 72, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (462, 112, 125, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (463, 112, 27, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (464, 112, 33, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (465, 112, 65, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (466, 112, 83, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (467, 113, 111, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (468, 113, 75, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (469, 113, 87, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (470, 113, 24, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (471, 113, 80, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (472, 114, 85, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (473, 114, 1, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (474, 114, 70, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (475, 114, 11, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (476, 114, 50, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (477, 115, 15, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (478, 115, 30, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (479, 115, 25, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (480, 115, 105, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (481, 115, 22, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (482, 116, 92, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (483, 116, 125, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (484, 116, 8, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (485, 116, 107, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (486, 116, 13, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (487, 117, 32, 77)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (488, 117, 23, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (489, 117, 34, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (490, 117, 44, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (491, 117, 12, 46)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (492, 118, 63, 43)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (493, 118, 95, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (494, 118, 116, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (495, 118, 24, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (496, 118, 6, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (497, 119, 38, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (498, 119, 20, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (499, 119, 99, 66)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (500, 119, 12, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (501, 119, 103, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (502, 120, 70, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (503, 120, 92, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (504, 120, 54, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (505, 120, 120, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (506, 120, 97, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (507, 121, 122, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (508, 121, 102, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (509, 121, 39, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (510, 121, 8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (511, 121, 109, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (512, 122, 62, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (513, 122, 127, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (514, 122, 64, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (515, 122, 73, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (516, 122, 107, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (517, 123, 90, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (518, 123, 52, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (519, 123, 49, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (520, 123, 103, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (521, 123, 13, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (522, 124, 121, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (523, 124, 123, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (524, 124, 4, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (525, 124, 83, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (526, 124, 7, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (527, 125, 25, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (528, 125, 68, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (529, 125, 86, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (530, 125, 63, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (531, 125, 127, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (532, 126, 61, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (533, 126, 32, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (534, 126, 12, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (535, 126, 121, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (536, 126, 82, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (537, 127, 81, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (538, 127, 108, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (539, 127, 24, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (540, 127, 3, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (541, 127, 49, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (542, 128, 10, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (543, 128, 10, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (544, 128, 105, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (545, 128, 97, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (546, 128, 22, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (547, 129, 67, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (548, 129, 40, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (549, 129, 60, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (550, 129, 63, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (551, 129, 122, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (552, 130, 98, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (553, 130, 111, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (554, 130, 15, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (555, 130, 43, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (556, 130, 115, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (557, 131, 48, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (558, 131, 79, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (559, 131, 126, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (560, 131, 45, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (561, 131, 106, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (562, 132, 23, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (563, 132, 5, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (564, 132, 109, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (565, 132, 33, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (566, 132, 76, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (567, 133, 34, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (568, 133, 11, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (569, 133, 35, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (570, 133, 105, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (571, 133, 52, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (572, 134, 111, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (573, 134, 106, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (574, 134, 19, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (575, 134, 107, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (576, 134, 43, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (577, 135, 15, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (578, 135, 51, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (579, 135, 101, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (580, 135, 87, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (581, 135, 36, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (582, 136, 96, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (583, 136, 38, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (584, 136, 56, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (585, 136, 39, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (586, 136, 115, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (587, 137, 25, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (588, 137, 67, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (589, 137, 10, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (590, 137, 6, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (591, 137, 88, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (592, 138, 102, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (593, 138, 35, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (594, 138, 121, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (595, 138, 8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (596, 138, 79, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (597, 139, 7, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (598, 139, 107, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (599, 139, 76, 8)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (600, 139, 115, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (601, 139, 72, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (602, 140, 119, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (603, 140, 28, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (604, 140, 3, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (605, 140, 74, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (606, 140, 69, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (607, 141, 126, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (608, 141, 15, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (609, 141, 86, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (610, 141, 68, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (611, 141, 83, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (612, 142, 31, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (613, 142, 86, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (614, 142, 41, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (615, 142, 49, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (616, 142, 77, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (617, 143, 87, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (618, 143, 115, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (619, 143, 123, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (620, 143, 15, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (621, 143, 49, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (622, 144, 37, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (623, 144, 83, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (624, 144, 107, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (625, 144, 17, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (626, 144, 40, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (627, 145, 124, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (628, 145, 57, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (629, 145, 17, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (630, 145, 90, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (631, 145, 7, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (632, 146, 67, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (633, 146, 49, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (634, 146, 27, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (635, 146, 72, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (636, 146, 59, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (637, 147, 21, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (638, 147, 37, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (639, 147, 108, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (640, 147, 24, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (641, 147, 11, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (642, 148, 91, 77)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (643, 148, 29, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (644, 148, 119, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (645, 148, 5, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (646, 148, 64, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (647, 149, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (648, 149, 63, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (649, 149, 3, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (650, 149, 1, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (651, 149, 10, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (652, 150, 79, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (653, 150, 55, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (654, 150, 14, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (655, 150, 109, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (656, 150, 63, 43)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (657, 151, 33, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (658, 151, 42, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (659, 151, 95, 77)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (660, 151, 61, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (661, 151, 15, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (662, 152, 8, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (663, 152, 95, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (664, 152, 78, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (665, 152, 49, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (666, 152, 112, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (667, 153, 8, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (668, 153, 105, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (669, 153, 61, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (670, 153, 23, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (671, 153, 61, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (672, 154, 32, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (673, 154, 74, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (674, 154, 43, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (675, 154, 110, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (676, 154, 116, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (677, 155, 113, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (678, 155, 61, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (679, 155, 124, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (680, 155, 62, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (681, 155, 68, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (682, 156, 63, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (683, 156, 29, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (684, 156, 108, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (685, 156, 64, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (686, 156, 59, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (687, 157, 88, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (688, 157, 125, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (689, 157, 90, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (690, 157, 23, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (691, 157, 114, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (692, 158, 87, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (693, 158, 9, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (694, 158, 73, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (695, 158, 124, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (696, 158, 63, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (697, 159, 62, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (698, 159, 61, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (699, 159, 56, 86)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (700, 159, 112, 88)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (701, 159, 33, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (702, 160, 16, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (703, 160, 49, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (704, 160, 10, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (705, 160, 64, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (706, 160, 112, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (707, 161, 93, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (708, 161, 17, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (709, 161, 121, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (710, 161, 66, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (711, 161, 103, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (712, 162, 43, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (713, 162, 111, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (714, 162, 105, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (715, 162, 68, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (716, 162, 94, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (717, 163, 29, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (718, 163, 33, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (719, 163, 31, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (720, 163, 27, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (721, 163, 90, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (722, 164, 60, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (723, 164, 104, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (724, 164, 114, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (725, 164, 7, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (726, 164, 84, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (727, 165, 116, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (728, 165, 7, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (729, 165, 68, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (730, 165, 101, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (731, 165, 57, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (732, 166, 67, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (733, 166, 102, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (734, 166, 52, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (735, 166, 102, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (736, 166, 48, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (737, 167, 41, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (738, 167, 27, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (739, 167, 35, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (740, 167, 90, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (741, 167, 18, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (742, 168, 73, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (743, 168, 99, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (744, 168, 117, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (745, 168, 71, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (746, 168, 11, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (747, 169, 108, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (748, 169, 63, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (749, 169, 43, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (750, 169, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (751, 169, 93, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (752, 170, 58, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (753, 170, 31, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (754, 170, 27, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (755, 170, 3, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (756, 170, 84, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (757, 171, 8, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (758, 171, 126, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (759, 171, 11, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (760, 171, 5, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (761, 171, 75, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (762, 172, 40, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (763, 172, 70, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (764, 172, 93, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (765, 172, 112, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (766, 172, 68, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (767, 173, 50, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (768, 173, 76, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (769, 173, 19, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (770, 173, 57, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (771, 173, 43, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (772, 174, 71, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (773, 174, 25, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (774, 174, 31, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (775, 174, 67, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (776, 174, 11, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (777, 175, 11, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (778, 175, 50, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (779, 175, 56, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (780, 175, 4, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (781, 175, 10, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (782, 176, 63, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (783, 176, 60, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (784, 176, 40, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (785, 176, 20, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (786, 176, 22, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (787, 177, 95, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (788, 177, 5, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (789, 177, 123, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (790, 177, 127, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (791, 177, 15, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (792, 178, 80, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (793, 178, 53, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (794, 178, 49, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (795, 178, 86, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (796, 178, 12, 41)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (797, 179, 6, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (798, 179, 63, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (799, 179, 34, 19)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (800, 179, 102, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (801, 179, 23, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (802, 180, 37, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (803, 180, 7, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (804, 180, 116, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (805, 180, 82, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (806, 180, 17, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (807, 181, 69, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (808, 181, 79, 92)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (809, 181, 71, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (810, 181, 63, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (811, 181, 11, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (812, 182, 100, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (813, 182, 23, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (814, 182, 26, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (815, 182, 43, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (816, 182, 4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (817, 183, 111, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (818, 183, 29, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (819, 183, 80, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (820, 183, 115, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (821, 183, 107, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (822, 184, 61, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (823, 184, 124, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (824, 184, 63, 73)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (825, 184, 117, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (826, 184, 98, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (827, 185, 71, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (828, 185, 3, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (829, 185, 117, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (830, 185, 61, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (831, 185, 73, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (832, 186, 67, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (833, 186, 122, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (834, 186, 2, 78)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (835, 186, 85, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (836, 186, 61, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (837, 187, 66, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (838, 187, 5, 89)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (839, 187, 112, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (840, 187, 59, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (841, 187, 10, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (842, 188, 66, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (843, 188, 16, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (844, 188, 94, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (845, 188, 32, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (846, 188, 87, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (847, 189, 122, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (848, 189, 45, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (849, 189, 49, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (850, 189, 126, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (851, 189, 59, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (852, 190, 97, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (853, 190, 98, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (854, 190, 32, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (855, 190, 113, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (856, 190, 29, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (857, 191, 5, 22)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (858, 191, 62, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (859, 191, 85, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (860, 191, 44, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (861, 191, 111, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (862, 192, 37, 86)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (863, 192, 7, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (864, 192, 40, 43)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (865, 192, 25, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (866, 192, 104, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (867, 193, 114, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (868, 193, 102, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (869, 193, 24, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (870, 193, 27, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (871, 193, 95, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (872, 194, 68, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (873, 194, 89, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (874, 194, 105, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (875, 194, 106, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (876, 194, 47, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (877, 195, 43, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (878, 195, 15, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (879, 195, 88, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (880, 195, 94, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (881, 195, 17, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (882, 196, 99, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (883, 196, 44, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (884, 196, 43, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (885, 196, 60, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (886, 196, 117, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (887, 197, 3, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (888, 197, 116, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (889, 197, 125, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (890, 197, 40, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (891, 197, 111, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (892, 198, 35, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (893, 198, 60, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (894, 198, 81, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (895, 198, 21, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (896, 198, 104, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (897, 199, 112, 95)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (898, 199, 28, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (899, 199, 64, 19)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (900, 199, 23, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (901, 199, 95, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (902, 200, 16, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (903, 200, 100, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (904, 200, 19, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (905, 200, 3, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (906, 200, 89, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (907, 201, 48, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (908, 201, 44, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (909, 201, 102, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (910, 201, 110, 75)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (911, 201, 82, 92)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (912, 202, 100, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (913, 202, 54, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (914, 202, 86, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (915, 202, 126, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (916, 202, 94, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (917, 203, 111, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (918, 203, 60, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (919, 203, 12, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (920, 203, 71, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (921, 203, 70, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (922, 204, 15, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (923, 204, 5, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (924, 204, 94, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (925, 204, 51, 93)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (926, 204, 63, 79)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (927, 205, 67, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (928, 205, 15, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (929, 205, 79, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (930, 205, 67, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (931, 205, 75, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (932, 206, 78, 58)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (933, 206, 21, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (934, 206, 5, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (935, 206, 12, 72)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (936, 206, 50, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (937, 207, 28, 92)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (938, 207, 116, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (939, 207, 116, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (940, 207, 14, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (941, 207, 41, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (942, 208, 84, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (943, 208, 18, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (944, 208, 70, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (945, 208, 107, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (946, 208, 14, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (947, 209, 34, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (948, 209, 113, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (949, 209, 54, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (950, 209, 109, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (951, 209, 5, 47)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (952, 210, 45, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (953, 210, 119, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (954, 210, 107, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (955, 210, 54, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (956, 210, 107, 29)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (957, 211, 76, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (958, 211, 64, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (959, 211, 63, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (960, 211, 34, 82)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (961, 211, 101, 57)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (962, 212, 108, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (963, 212, 8, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (964, 212, 18, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (965, 212, 15, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (966, 212, 95, 85)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (967, 213, 33, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (968, 213, 18, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (969, 213, 2, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (970, 213, 30, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (971, 213, 107, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (972, 214, 64, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (973, 214, 90, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (974, 214, 84, 62)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (975, 214, 11, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (976, 214, 100, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (977, 215, 96, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (978, 215, 34, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (979, 215, 40, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (980, 215, 118, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (981, 215, 94, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (982, 216, 127, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (983, 216, 106, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (984, 216, 122, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (985, 216, 98, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (986, 216, 87, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (987, 217, 32, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (988, 217, 50, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (989, 217, 77, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (990, 217, 79, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (991, 217, 81, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (992, 218, 88, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (993, 218, 80, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (994, 218, 32, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (995, 218, 45, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (996, 218, 54, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (997, 219, 17, 83)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (998, 219, 109, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (999, 219, 114, 27)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1000, 219, 11, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1001, 219, 26, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1002, 220, 94, 19)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1003, 220, 77, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1004, 220, 97, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1005, 220, 13, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1006, 220, 17, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1007, 221, 23, 94)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1008, 221, 106, 59)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1009, 221, 52, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1010, 221, 107, 92)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1011, 221, 117, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1012, 222, 55, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1013, 222, 51, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1014, 222, 7, 81)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1015, 222, 87, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1016, 222, 111, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1017, 223, 86, 27)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1018, 223, 122, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1019, 223, 90, 31)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1020, 223, 67, 71)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1021, 223, 104, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1022, 224, 97, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1023, 224, 2, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1024, 224, 16, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1025, 224, 12, 63)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1026, 224, 80, 51)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1027, 225, 47, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1028, 225, 96, 98)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1029, 225, 127, 38)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1030, 225, 14, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1031, 225, 71, 69)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1032, 226, 92, 91)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1033, 226, 3, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1034, 226, 11, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1035, 226, 9, 61)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1036, 226, 17, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1037, 227, 21, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1038, 227, 33, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1039, 227, 92, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1040, 227, 103, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1041, 227, 117, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1042, 228, 102, 53)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1043, 228, 20, 74)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1044, 228, 47, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1045, 228, 55, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1046, 228, 69, 52)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1047, 229, 7, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1048, 229, 92, 68)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1049, 229, 2, 76)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1050, 229, 35, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1051, 229, 62, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1052, 230, 108, 64)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1053, 230, 18, 66)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1054, 230, 112, 34)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1055, 230, 23, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1056, 230, 32, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1057, 231, 27, 87)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1058, 231, 52, 67)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1059, 231, 123, 96)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1060, 231, 18, 97)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1061, 231, 106, 38)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (1, N'Classic Buttery Jack', CAST(4.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (2, N'Classic Buttery Jack - Combo', CAST(6.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (3, N'Bacon & Swiss Buttery Jack', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (4, N'Bacon & Swiss Buttery Jack - Combo', CAST(7.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (5, N'Sourdough Jack', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (6, N'Sourdough Jack - Combo', CAST(6.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (7, N'Ultimate Cheeseburger', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (8, N'Ultimate Cheeseburger - Combo', CAST(6.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (9, N'Bacon Ultimate Cheeseburger', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (10, N'Bacon Ultimate Cheeseburger - Combo', CAST(7.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (11, N'Jumbo Jack Cheeseburger', CAST(3.19 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (12, N'Jumbo Jack Cheeseburger - Combo', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (13, N'Spicy Sriracha', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (14, N'Spicy Sriracha - Combo', CAST(6.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (15, N'Cheddar Onion Buttery Jack Burger (Limited Time)', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (17, N'Upgrade to Medium Combo', CAST(0.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (18, N'Upgrade to Large Combo', CAST(0.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (19, N'Sub Curly Fries', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (20, N'Homestyle Ranch Chicken Club', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (21, N'Homestyle Ranch Chicken Club - Combo', CAST(7.19 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (22, N'Sourdough Grilled Chicken Club', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (23, N'Sourdough Grilled Chicken Club - Combo', CAST(7.19 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (24, N'Jacks Spicy Chicken', CAST(4.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (25, N'Jacks Spicy Chicken - Combo', CAST(6.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (26, N'Crispy Chicken Strips', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (27, N'Crispy Chicken Strips - Combo', CAST(6.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (28, N'Chicken Nuggets', CAST(3.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (29, N'Chicken Nuggets - Combo', CAST(5.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (30, N'Chicken Fajita Pita', CAST(4.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (31, N'Chicken Fajita Pita - Combo', CAST(6.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (32, N'Chicken Teriyaki Bowl', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (33, N'Chicken Teriyaki Bowl - Combo', CAST(6.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (34, N'Upgrade to Medium Combo', CAST(0.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (35, N'Upgrade to Large Combo', CAST(0.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (36, N'Sub Curly Fries', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (37, N'2 Tacos', CAST(0.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (38, N'Jr. Jack', CAST(1.39 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (39, N'Jumbo Jack', CAST(2.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (40, N'Chicken Nuggets', CAST(1.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (41, N'Chicken Nuggets', CAST(3.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (42, N'Chicken Nuggets', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (43, N'Chicken Sandwich', CAST(1.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (44, N'Jr. Bacon Cheeseburger', CAST(1.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (45, N'Big Cheeseburger', CAST(2.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (46, N'Value Drink', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (47, N'Value Fries', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (48, N'Add Cheese', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (49, N'Add Bacon', CAST(0.50 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (50, N'Add Jalapeños', CAST(0.25 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (51, N'Hamburger', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (52, N'Chicken Nuggets', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (53, N'Cheeseburger', CAST(3.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (54, N'Chicken Breast Strips', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (55, N'Turkey, Bacon & Cheddar Grilled Sandwich', CAST(4.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (56, N'Turkey, Bacon & Cheddar Grilled Sandwich - Combo', CAST(6.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (57, N'Deli Trio Grilled Sandwich', CAST(4.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (58, N'Deli Trio Grilled Sandwich - Combo', CAST(6.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (59, N'Chicken Club Salad', CAST(5.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (60, N'Grilled Chicken Salad', CAST(5.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (61, N'Southwest Chicken Salad', CAST(5.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (62, N'French Fries', CAST(1.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (63, N'French Fries', CAST(2.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (64, N'French Fries', CAST(2.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (65, N'Seasoned Curly Fries', CAST(1.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (66, N'Seasoned Curly Fries', CAST(2.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (67, N'Seasoned Curly Fries', CAST(2.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (68, N'Monster Taco', CAST(1.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (69, N'Nacho Monster Taco', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (70, N'Bacon Ranch Monster Taco', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (71, N'Bacon Cheddar Potato Wedges', CAST(3.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (72, N'Onion Rings', CAST(2.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (73, N'Egg Rolls', CAST(1.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (74, N'Egg Rolls', CAST(4.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (75, N'Stuffed Jalapeños', CAST(2.19 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (76, N'Stuffed Jalapeños', CAST(4.19 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (77, N'Side Salad', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (78, N'Spicy Nacho Curly Fries (Limited Time)', CAST(2.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (79, N'Mini Churros', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (80, N'Mini Churros', CAST(1.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (81, N'Mini Cookies', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (82, N'Cheesecake', CAST(1.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (83, N'Chocolate Overload Cake', CAST(1.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (84, N'Oreo Cookie Shake', CAST(2.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (85, N'Oreo Cookie Shake', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (86, N'Shake (Chocolate, Vanilla, or Strawberry)', CAST(2.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (87, N'Shake (Chocolate, Vanilla, or Strawberry)', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (88, N'Salted Caramel Shake (Limited Time)', CAST(2.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (89, N'Salted Caramel Shake (Limited Time)', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (92, N'Premium Roast Coffee - Hot', CAST(1.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (93, N'Premium Roast Coffee - Hot', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (96, N'Flavored Iced Tea', CAST(1.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (97, N'Bottled Water', CAST(1.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (98, N'Orange Juice', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (99, N'Milk', CAST(1.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (100, N'Fresh Brewed Iced Tea', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (101, N'Fresh Brewed Iced Tea', CAST(1.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (102, N'Fresh Brewed Iced Tea', CAST(2.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (103, N'Fountain Drink', CAST(1.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (104, N'Fountain Drink', CAST(1.89 AS Decimal(18, 2)))
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (105, N'Fountain Drink', CAST(2.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (106, N'Outside of Late Night Hours', CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (107, N'Loaded Breakfast Sandwich', CAST(3.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (108, N'Loaded Breakfast Sandwich - Combo', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (109, N'Jumbo Platter', CAST(3.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (110, N'Jumbo Platter with Regular Coffee', CAST(4.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (111, N'Grilled Breakfast Sandwich', CAST(3.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (112, N'Grilled Breakfast Sandwich - Combo', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (113, N'Supreme Croissant', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (114, N'Supreme Croissant - Combo', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (115, N'Sausage Croissant', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (116, N'Sausage Croissant - Combo', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (117, N'Ultimate Breakfast', CAST(3.49 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (118, N'Ultimate Breakfast - Combo', CAST(4.89 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (119, N'Extreme Sausage', CAST(3.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (120, N'Extreme Sausage - Combo', CAST(4.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (121, N'Grande Sausage Burrito', CAST(3.39 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (122, N'Grande Sausage Burrito - Combo', CAST(4.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (123, N'Meat Lovers Burrito', CAST(3.39 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (124, N'Meat Lovers Burrito - Combo', CAST(4.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (125, N'Sausage, Egg & Cheese Biscuit', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (126, N'Sausage, Egg & Cheese Biscuit - Combo', CAST(4.29 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (127, N'Breakfast Jack', CAST(1.59 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (128, N'Breakfast Jack - Combo', CAST(3.79 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (129, N'Mini Pancakes', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (130, N'Steak & Egg Burrito', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (131, N'Steak & Egg Burrito - Combo', CAST(5.09 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (132, N'Jalapeño Bacon Burrito (Limited Time)', CAST(3.69 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price]) VALUES (133, N'Jalapeño Bacon Burrito - Combo (Limited Time)', CAST(5.09 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email]) VALUES (1, N'phuongvd@contoso.com')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A63001303A29 AS DateTime), NULL, 1, CAST(0x0000A63001355551 AS DateTime), 0, N'ACWWlvAtJaVHZwbBlRqf7IWyk18Wmh9GXMj56fReLNynovt3jBYoTb7DkgSsDFq5NQ==', CAST(0x0000A63001303A29 AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 2)
/****** Object:  Index [PK__aspnet_A__C93A4C980476735F]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE47D77EB09]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__30910331D42175BE]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D4F94228E]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC5817166C9D]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06111E3E25]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B7A577DDC]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D56A524CF]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__A9D10534E19CA93F]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B616051E8F53C]    Script Date: 6/26/2016 6:48:50 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
