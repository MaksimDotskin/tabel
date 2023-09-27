create trigger trMyFirstTrigger
on Database
for create_table
	as
	begin
	print 'New table created'
	end


alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
print'A table has been created,modified or deleted'
end

alter trigger trMyFirstTrigger
on database
for create_table,alter_table,drop_table
as
begin
rollback
print'You vannot create,alter or drop a table'
end

create trigger trRenameTable
on database
for rename
as
begin
print'You just renamed something'
end

exec sp_rename 'test','test2'


create trigger tr_DatabaseScopeTrigger
on database
for create_table,alter_table,drop_table
as
begin
rollback
print'You cannot create,alter or drop a table in the current database'
end

create trigger tr_ServerScopeTrigger
on all server
for create_table,alter_table,drop_table
as
begin
rollback
print 'You cannot create,alter or drop a table in any database on the server'
end

disable trigger tr_ServerScopeTrigger on all server
drop trigger tr_ServerScopeTrigger on all server
enable trigger tr_ServerScopeTrigger on all server

create trigger tr_DatabaseScopeTriger

on database
for create_table
as
begin
print'Database Scope Trigger'
end
go

create trigger tr_ServerScopeTriger
on all server
for create_table
as
begin
print'Server Scope Trigger'
end
go

exec sp_settriggerorder
@triggername='tr_DatabaseScopeTriger',
@order='none', 
@stmttype='CREATE_TABLE',
@namespace='DATABASE'
go

create trigger tr_LondonTriggers
on all server
for logon
as
begin
	declare @LoginName nvarchar(100)

	set @LoginName=original_login()

	if (select count(*) from sys.dm_exec_sessions
		where is_user_process=1
		and original_login_name=@LoginName)>3
	begin
		print 'Fourth connection of'+@LoginName+'blocked'
		rollback
	end
end


Execute sp_readerrorlog
