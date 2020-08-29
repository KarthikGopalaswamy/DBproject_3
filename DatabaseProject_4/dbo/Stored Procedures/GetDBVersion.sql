
CREATE PROCEDURE [dbo].[GetDBVersion]
@DBVersion nvarchar(32) OUTPUT
AS
set @DBVersion = 'T.0.9.45'

select top 10 * from ChunkData
union all  
select top 100 * from ChunkData
union all  
select top 50 * from ChunkData
