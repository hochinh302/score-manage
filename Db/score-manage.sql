USE e_exam;
GO

DROP DATABASE score_manage;
GO

CREATE DATABASE score_manage;
GO

USE score_manage;
GO

CREATE TABLE ADMIN (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100) UNIQUE,
    password NVARCHAR(255),
    token NVARCHAR(255) NULL
);
GO
 
CREATE TABLE CLASS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    status INT,
    createAt DATETIME DEFAULT GETDATE(),
    totalStu INT DEFAULT 0
);
GO

CREATE TABLE STUDENT (
    id NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    status INT,
    sex INT,
    classId INT,
    birthday DATETIME,
    className NVARCHAR(100),
    FOREIGN KEY (classId) REFERENCES CLASS(id)
);
GO

CREATE TABLE SUBJECT (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    session NVARCHAR(50),
    status INT,
    maxScore INT
);
GO

CREATE TABLE SUBJECT_SCORE (
    studentId NVARCHAR(50),
    subjectId INT,
    type INT,
    exam INT,
    score FLOAT,
    PRIMARY KEY (studentId, subjectId, type, exam),
    FOREIGN KEY (studentId) REFERENCES STUDENT(id),
    FOREIGN KEY (subjectId) REFERENCES SUBJECT(id)
);
GO

-- PROCEDURE
CREATE PROCEDURE sp_Class_GetAll
AS
BEGIN
    SELECT * FROM CLASS;
END;
GO

CREATE PROCEDURE sp_Class_Add
    @name NVARCHAR(100),
    @status INT
AS
BEGIN
    INSERT INTO CLASS (name, status) 
    VALUES (@name, @status);
END;
GO

CREATE PROCEDURE sp_Class_Update
    @id INT,
    @name NVARCHAR(100),
    @status INT
AS
BEGIN
    UPDATE CLASS
    SET name = @name, status = @status
    WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Class_Remove
    @id INT
AS
BEGIN
    DELETE FROM CLASS WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Class_FindId
    @id INT
AS
BEGIN
    SELECT * FROM CLASS WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Student_GetAll
AS
BEGIN
    SELECT * FROM STUDENT;
END;
GO

CREATE PROCEDURE sp_Student_Add
    @id NVARCHAR(50),
    @name NVARCHAR(100),
    @sex INT,
    @classId INT,
    @birthday DATETIME,
    @status INT
AS
BEGIN
	DECLARE @className NVARCHAR(100);

    UPDATE CLASS
    SET totalStu = totalStu + 1
    WHERE id = @classId;

    SELECT @className = c.name
    FROM CLASS c
    WHERE id = @classId;

    INSERT INTO STUDENT (id, name, status, sex, classId, birthday, className)
    VALUES (@id, @name, @status, @sex, @classId, @birthday, @className);
END;
GO

CREATE PROCEDURE sp_Student_Update
    @id NVARCHAR(50),
    @name NVARCHAR(100),
    @sex INT,
    @classId INT,
    @birthday DATETIME,
    @status INT
AS
BEGIN
	DECLARE @oldClassId INT;
    DECLARE @oldClassName NVARCHAR(100);
	DECLARE @newClassName NVARCHAR(100);

	SELECT @oldClassId = classId, @oldClassName = className
    FROM STUDENT
    WHERE id = @id;

	SET @newClassName = @oldClassName;
	IF @oldClassId != @classId
    BEGIN
        UPDATE CLASS
        SET totalStu = totalStu - 1
        WHERE id = @oldClassId;

        UPDATE CLASS
        SET totalStu = totalStu + 1
        WHERE id = @classId;

		SELECT @newClassName = c.name
		FROM CLASS c
		WHERE id = @classId;
    END

    UPDATE STUDENT
    SET name = @name, status = @status, sex = @sex, classId = @classId, birthday = @birthday, className = @newClassName
    WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Student_Remove
    @id NVARCHAR(50)
AS
BEGIN
    DELETE FROM STUDENT WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Student_FindId
    @id NVARCHAR(50)
AS
BEGIN
    SELECT * FROM STUDENT WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Student_FindClass
    @classId INT
AS
BEGIN
    SELECT * FROM STUDENT WHERE classId = @classId;
END;
GO

CREATE PROCEDURE sp_Subject_GetAll
AS
BEGIN
    SELECT * FROM SUBJECT;
END;
GO

CREATE PROCEDURE sp_Subject_Add
    @name NVARCHAR(100),
    @maxScore INT,
    @session NVARCHAR(50),
    @status INT
AS
BEGIN
    INSERT INTO SUBJECT (name, session, status, maxScore)
    VALUES (@name, @session, @status, @maxScore);
END;
GO

CREATE PROCEDURE sp_Subject_Update
    @id INT,
    @name NVARCHAR(100),
    @maxScore INT,
    @session NVARCHAR(50),
    @status INT
AS
BEGIN
    UPDATE SUBJECT
    SET name = @name, session = @session, status = @status, maxScore = @maxScore
    WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Subject_Remove
    @id INT
AS
BEGIN
    DELETE FROM SUBJECT WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Subject_FindId
    @id INT
AS
BEGIN
    SELECT * FROM SUBJECT WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_SubScore_Add
    @subjectId INT,
    @studentId NVARCHAR(50),
    @type INT,
    @exam INT,
    @score FLOAT
AS
BEGIN
    INSERT INTO SUBJECT_SCORE (studentId, subjectId, type, exam, score)
    VALUES (@studentId, @subjectId, @type, @exam, @score);
END;
GO

CREATE PROCEDURE sp_SubScore_Find
    @studentId NVARCHAR(50),
    @subjectId INT,
    @type INT
AS
BEGIN
    SELECT * FROM SUBJECT_SCORE 
    WHERE studentId = @studentId AND subjectId = @subjectId AND type = @type;
END;
GO

CREATE PROCEDURE sp_SubScore_Remove
    @studentId NVARCHAR(50),
    @subjectId INT
AS
BEGIN
    DELETE FROM SUBJECT_SCORE WHERE studentId = @studentId AND subjectId = @subjectId;
END;
GO

CREATE PROCEDURE sp_Admin_Add
    @name NVARCHAR(100),
    @email NVARCHAR(100),
    @password NVARCHAR(255)
AS
BEGIN
    INSERT INTO ADMIN (name, email, password)
    VALUES (@name, @email, @password);
END;
GO

CREATE PROCEDURE sp_Admin_Update
    @id INT,
    @token NVARCHAR(255)
AS
BEGIN
    UPDATE ADMIN
    SET token = @token
    WHERE id = @id;
END;
GO

CREATE PROCEDURE sp_Admin_FindByToken
    @token NVARCHAR(255)
AS
BEGIN
    SELECT * FROM ADMIN WHERE token = @token;
END;
GO

CREATE PROCEDURE sp_Admin_FindInfo
    @email NVARCHAR(100),
    @password NVARCHAR(255)
AS
BEGIN
    SELECT * FROM ADMIN WHERE email = @email AND password = @password;
END;
GO


CREATE PROCEDURE sp_Search_Score
    @studentId NVARCHAR(50)
AS
BEGIN
     SELECT 
        ss.studentId, 
        ss.subjectId, 
        ss.type, 
        ss.exam, 
        ss.score, 
        s.name, 
        s.maxScore
    FROM 
        SUBJECT_SCORE ss
    JOIN 
        SUBJECT s ON ss.subjectId = s.id
    WHERE 
        ss.studentId = @studentId;
END;
GO

