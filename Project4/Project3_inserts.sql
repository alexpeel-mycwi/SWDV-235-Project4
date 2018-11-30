-- Insert Statements

-- Insert Artist Type
USE [disk_inventory]

INSERT INTO [dbo].[Artist_type]
([type])
VALUES
  --   (<type, varchar(20),>)
  ('Individual Artist'),
  ('Group Artist')
GO

-- Insert CD rows
USE [disk_inventory]

INSERT INTO [dbo].[CD]
([type_ID], [status], [title], [release_year])
VALUES
  --   (<type_ID, int,>, <status, varchar(15),>, <release_year, datetime,>)
  (2, 'In Library', 'The Dark Side of the Moon', '1973'), --1
  (2, 'In Library', 'Back in Black', '1980'), --2
  (2, 'In Library', 'Bat Out of Hell', '1977'), --3
  (2, 'Borrowed', 'Appetite for Destruction', '1987'), --4
  (2, 'Borrowed', 'Physical Graffiti', '1975'), --5
  (2, 'In Library', 'American Beauty', '1970'), --6
  (2, 'Borrowed', 'A Night at the Opera', '1975'), --7
  (2, 'In Library', 'American Idiot', '2004'), --8
  (2, 'In Library', 'Sticky Fingers', '1971'), --9
  (2, 'In Library', 'Disintegration', '1989'), --10
  (2, 'In Library', 'Californication', '1999'), --11
  (2, 'In Library', 'Permanent Vacation', '1987'), --12
  (2, 'Missing', 'The Bends', '1995'), --13
  (2, 'In Library', 'Ride the Lightning', '1984'), --14
  (2, 'In Library', 'The White Album', '1968'), --15
  (2, 'In Library', 'Supernatural', '1999'), --16
  (2, 'In Library', 'Nevermind', '1991'), --17
  (2, 'In Library', 'Hotel California', '1976'), --18
  (1, 'In Library', 'Only the Lonely', '1958'), --19
  (1, 'In Library', 'Antichrist Superstar', '1996'), --20
  (1, 'Borrowed', 'Born in the U.S.A.', '1984'), --21
  (1, 'In Library', 'Bad', '1987'), --22
  (1, 'In Library', '21', '2011') --23
GO

-- Insert Group Artist
USE [disk_inventory]

INSERT INTO [dbo].[Artist]
([type_ID], [first_name])
VALUES
  --   (<type_ID, int,>, <first_name, varchar(50),>)
  (2, 'Pink Floyd'), --1
  (2, 'ACDC'), --2
  (2, 'MeatLoaf'), --3
  (2, 'Guns N Roses'), --4
  (2, 'Led Zeppelin'), --5
  (2, 'Grateful Dead'), --6
  (2, 'Queen'), --7
  (2, 'Green Day'), --8
  (2, 'Rolling Stones'), --9
  (2, 'The Cure'), --10
  (2, 'Red Hot Chili Peppers'), --11
  (2, 'Aerosmith'), --12
  (2, 'Radiohead'), --13
  (2, 'Metallica'), --14
  (2, 'The Beatles'), --15
  (2, 'Santana'), --16
  (2, 'Nirvana'), --17
  (2, 'Eagles') --18
GO

-- Insert Individual Artist
USE [disk_inventory]

INSERT INTO [dbo].[Artist]
([type_ID], [first_name], [last_name])
VALUES
  --   (<type_ID, int,>, <first_name, varchar(50),>, <last_name, varchar(50),>)
  (1, 'Frank', 'Sinatra'), --19
  (1, 'Marilyn', 'Manson'), --20
  (1, 'Bruce', 'Springsteen'), --21
  (1, 'Michael', 'Jackson'), --22
  (1, 'Adele','') --23
GO

-- Insert CD Artists
USE [disk_inventory]

INSERT INTO [dbo].[CD_Artist]
([CD_ID], [Artist_ID])
VALUES
  --   (<CD_ID, int,>, <Artist_ID, int,>)
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10),
  (11, 11),
  (12, 12),
  (13, 13),
  (14, 14),
  (15, 15),
  (16, 16),
  (17, 17),
  (18, 18),
  (19, 19),
  (20, 20),
  (21, 21),
  (22, 22),
  (23, 23)
GO

-- Insert Genre
USE [disk_inventory]

INSERT INTO [dbo].[genre]
([name], [parent_genre])
VALUES
  ('Hard Rock', NULL), --1
  ('Progressive Rock', NULL), --2
  ('Soft Rock', NULL), --3
  ('Pop', NULL), --4
  ('Rock', NULL), --5
  ('Heavy Metal', NULL), --6
  ('Alternative Rock', NULL), --7
  ('Latin Rock', NULL), --8
  ('Jazz', NULL) --9
GO

-- Insert CD genre
USE [disk_inventory]

INSERT INTO [dbo].[CD_genre]
([CD_ID], [genre_ID])
VALUES
  --   (<CD_ID, int,>, <genre_ID, int,>)
  (1, 2),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 5),
  (7, 5),
  (8, 7),
  (9, 5),
  (10, 7),
  (11, 7),
  (12, 1),
  (13, 7),
  (14, 6),
  (15, 1),
  (16, 5),
  (17, 5),
  (18, 3),
  (19, 9),
  (20, 1),
  (21, 1),
  (22, 4),
  (23, 4)
GO

-- Insert borrower
USE [disk_inventory]

INSERT INTO [dbo].[borrower]
([first_name], [last_name])
VALUES
  --   (<first_name, varchar(50),>, <last_name, varchar(50),>)
  ('Sarah', 'Mathews'), --1
  ('George', 'Kennedy'), --2
  ('Gina', 'Cowan'), --3
  ('Brock', 'Smith'), --4
  ('Marcus', 'Birdsell'), --5
  ('Kimberly', 'Peterson'), --6
  ('David', 'Peckham'), --7
  ('Cody', 'Hendricks'), --8
  ('Kyle', 'Taylor'), --9
  ('Robert', 'Breyer'), --10
  ('Mark', 'Holding'), --11
  ('Joel', 'Turner'), --12
  ('Shannon', 'Hale'), --13
  ('Haylee', 'Allen'), --14
  ('Mike', 'Fox'), --15
  ('Tristan', 'Combs'),
  ('Joshua', 'Frankovich'), --16
  ('April', 'Bingham'), --18
  ('Elizabeth', 'Holt'), --19
  ('Allen', 'Lampkey'), --20
  ('Sherry', 'Moore') --21
GO

-- Insert CD borrowed
USE [disk_inventory]

INSERT INTO [dbo].[CD_borrowed]
([CD_ID], [borrower_ID], [borrowed_date], [returned_date], [times_borrowed])
VALUES
  --   (<CD_ID, int,>, <borrower_ID, int,>, <borrowed_date, datetime,>, <returned_date, datetime,>, <Times_Borrowed, int,>)
  (6, 1, '20160403', '20160817', 8),
  (12, 1, '20160403', '20160817', 7),
  (13, 1, '20160403', '20160817', 6),
  (17, 1, '20160405', '20160817', 5),
  (21, 1, '20160405', '20160817', 7),
  (4, 5, '20180702', NULL, 4),
  (5, 5, '20180702', NULL, 7),
  (23, 9, '20170403', '20170419', 6),
  (7, 10, '20171101', '20171102', 5),
  (14, 20, '20141213', '20150118', 8),
  (8, 8, '20180927', NULL, 5),
  (9, 8, '20180927', '20181011', 2),
  (10, 8, '20180927', '20181011', 1),
  (11, 19, '20170904', NULL, 6),
  (1, 11, '20171007', '20180419', 8),
  (2, 11, '20171007', '20180419', 9),
  (3, 4, '20180901', '20180902', 4),
  (16, 1, '20170405', '20170407', 6),
  (18, 2, '20180911', NULL, 4),
  (15, 6, '20180529', '20180723', 3),
  (22, 6, '20180529', '20180723', 7),
  (20, 6, '20180529', '20180723', 5),
  (19, 6, '20180529', '20180723', 4)
GO

--  Function to get borrower full name
USE disk_inventory;
DROP FUNCTION IF EXISTS BorrowerName;
GO

CREATE FUNCTION BorrowerName(@BorrowerID int)
RETURNS varchar(100)
BEGIN
RETURN (SELECT first_name + ' ' + last_name FROM borrower WHERE borrower_ID = @BorrowerID);
END;
GO