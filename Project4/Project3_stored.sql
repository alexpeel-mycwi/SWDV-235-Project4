USE disk_inventory;
GO

-- 3 -- Stored Procedures for Artist Table
-- Insert Artist
DROP PROC IF EXISTS spInsertArtist
GO

CREATE PROC spInsertArtist @type_ID INT,	@f_name VARCHAR(50), @l_name VARCHAR(50) = NULL AS
BEGIN TRY
	INSERT INTO Artist (type_ID, first_name, last_name)
	VALUES  (@type_ID, @f_name, @l_name) 
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Update Artist
DROP PROC IF EXISTS spUpdateArtist
GO

CREATE PROC spUpdateArtist @cont_ID INT, @f_name VARCHAR(50), @l_name VARCHAR(50) = NULL AS
BEGIN TRY
	UPDATE Artist
	SET first_name = @f_name, last_name = @l_name
	WHERE artist_ID = @cont_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

--Delete Artist
DROP PROC IF EXISTS spDeleteArtist
GO

CREATE PROC spDeleteArtist @cont_ID INT AS
BEGIN TRY
	DELETE CD_Artist
	WHERE Artist_ID = @cont_ID;
	DELETE Artist
	WHERE Artist_ID = @cont_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not deleted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- 4 -- Stored Procedures for Borrower Table
-- Insert Borrower
DROP PROC IF EXISTS spInsertBorrower
GO

CREATE PROC spInsertBorrower @f_name VARCHAR(50), @l_name VARCHAR(50) AS
BEGIN TRY
	INSERT INTO borrower (first_name, last_name)
	VALUES  (@f_name, @l_name) 
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Update Borrower
DROP PROC IF EXISTS spUpdateBorrower
GO

CREATE PROC spUpdateBorrower @b_ID INT, @f_name VARCHAR(50), @l_name VARCHAR(50) AS
BEGIN TRY
	UPDATE borrower
	SET first_name = @f_name, last_name = @l_name
	WHERE borrower_ID = @b_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Delete Borrower
DROP PROC IF EXISTS spDeleteBorrower
GO

CREATE PROC spDeleteBorrower @b_ID INT AS
BEGIN TRY
	DELETE borrower
	WHERE borrower_ID = @b_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not deleted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- 5 -- Stored Procedures for CD Table
-- Insert CD
DROP PROC IF EXISTS spInsertCD
GO

CREATE PROC spInsertCD @t_ID INT, @title VARCHAR(100), @status VARCHAR(20), @release_year CHAR(4) AS
BEGIN TRY
	INSERT INTO CD (type_ID, title, status, release_year)
	VALUES  (@t_ID, @title, @status, @release_year) 
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Update CD
DROP PROC IF EXISTS spUpdateCD
GO

CREATE PROC spUpdateCD @m_ID INT, @t_ID INT, @title VARCHAR(100), @status VARCHAR(20), @release_year CHAR(4) AS
BEGIN TRY
	UPDATE CD
	SET type_ID = @t_ID, title = @title, status = @status, release_year = @release_year
	WHERE CD_ID = @m_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Delete CD
DROP PROC IF EXISTS spDeleteCD
GO

CREATE PROC spDeleteCD @m_ID INT AS
BEGIN TRY
	DELETE CD_Borrowed
	WHERE CD_ID = @m_ID;
	DELETE CD_Genre
	WHERE CD_ID = @m_ID;
	DELETE CD
	WHERE CD_ID = @m_ID;
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not deleted.'
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO