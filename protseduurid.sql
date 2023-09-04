use trigerikasutamine;
go

--protseeduurid tabel guest
--andmete lisamine ja SELECT
create procedure lisaguestt
@firstname varchar(100),
@lastname varchar(100),
@date datetime
as
begin
select * from guest;
insert into guest(firstname,lastname,membersince)
values (@firstname,@lastname,@date)
select * from guest;
end

exec lisaguestt @firstname='max',@lastname='dotskin',@date='2006-12-03 12:12:12';
--kustutamine ja SELECT 
create procedure kustutaguest
@id int
as
begin
select * from guest;
delete from guest
where guestID=@id;
select * from guest;
end

exec kustutaguest @id=2;


--andmete uuendamine sisestatud id jargi
create procedure uuendaguest
@id int,
@firstname varchar(100),
@lastname varchar(100),
@date datetime

as
begin
select * from guest;
update guest
set firstname=@firstname,lastname=@lastname,membersince=@date
where guestID=@id;
select * from guest;
end

exec uuendaguest @id=1,@firstname='max',@lastname='dotskin',@date='2006-12-03 12:12:12';

--lasutajate guest arvu leidmine
--
