DECLARE @app_name SYSNAME 
		--= N'netFORUM eWeb';
		--= N'netFORUM iWeb';
		--= N'netFORUM xWeb';
DECLARE @threshold INT = 60;

SELECT
	[SPID] = [sess].[session_id],
	[Minutes Asleep] = DATEDIFF(MINUTE, [sess].[last_request_end_time], GETDATE()),
	[Application] = [sess].[program_name],
	[Last Executed SQL] = [sql].[text]
FROM [sys].[dm_exec_connections] AS [conn]
	JOIN [sys].[dm_exec_sessions] AS [sess] ON [conn].[session_id] = [sess].[session_id]
	CROSS APPLY [sys].[dm_exec_sql_text]([conn].[most_recent_sql_handle]) AS [sql]
WHERE [sess].[is_user_process] = 1
	AND [sess].[status] = 'sleeping'
	AND [sess].[database_id] = DB_ID()
	AND (NULLIF(@app_name, '') IS NULL OR [sess].[program_name] = NULLIF(@app_name, ''))
	AND DATEDIFF(SECOND, [sess].[last_request_end_time], GETDATE()) > @threshold
ORDER BY [sess].[last_request_end_time]