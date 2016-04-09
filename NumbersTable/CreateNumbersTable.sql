
-- =============================================
-- Author:		sareljacobs.com
-- Create date: 09 April 2016
-- Description:	Creates a numbers table
-- Blog post:	sareljacobs.com/numbers-table
-- =============================================

CREATE TABLE [dbo].[Numbers]
(
	[Number] INT NOT NULL,
	CONSTRAINT [PK_Numbers]
		PRIMARY KEY CLUSTERED ([Number])
		WITH FILLFACTOR = 100
)

;WITH nt_1 AS (
				SELECT 1 as [Number]
				FROM (VALUES(0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) [NumberBase]([Number])
			 )
	,nt_2 AS (
				SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as [Number]
				FROM nt_1 as [Base]
					 CROSS JOIN nt_1 [Power2] --100
					 CROSS JOIN nt_1 [Power3] --1000
					 CROSS JOIN nt_1 [Power4] --10 000
					 CROSS JOIN nt_1 [Power5] --100 000
					 CROSS JOIN nt_1 [Power6] --1 000 000
					 CROSS JOIN nt_1 [Power7] --10 000 000
					 --CROSS JOIN nt_1 [Power8] --100 000 000
					 --CROSS JOIN nt_1 [Power9] --1000 000 000
					 --CROSS JOIN nt_1 [Power10] --10 000 000 000
			 )

INSERT INTO [dbo].[Numbers]
SELECT [Number]
FROM nt_2