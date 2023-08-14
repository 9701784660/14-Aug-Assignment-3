create database Assignment3Db
use Assignment3Db

create table CompanyInfo
(CId int primary key,
CName nvarchar(50) not null)

insert into CompanyInfo values (1, 'Samsung')
insert into CompanyInfo values (2, 'HP')
insert into CompanyInfo values (3, 'Apple')
insert into CompanyInfo values (4, 'Dell')
insert into CompanyInfo values (5, 'Toshiba')
insert into CompanyInfo values (6, 'Redmi')

create table ProductInfo
(PId int primary key,
PName nvarchar(50) not null,
PPrice float,
PMDate date,
CId int foreign key references CompanyInfo)
insert into ProductInfo values (101,'Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo values (102,'Laptop',35000.90,'12/12/2012',2)
insert into ProductInfo values (103,'Mobile',15000.90,'12/12/2012',2)
insert into ProductInfo values (104,'Laptop',135000.90,'12/12/2012',3)
insert into ProductInfo values (105,'Mobile',65000.90,'12/12/2012',3)
insert into ProductInfo values (106,'Laptop',35000.90,'12/12/2012',5)
insert into ProductInfo values (107,'Mobile',35000.90,'12/12/2012',5)
insert into ProductInfo values (108,'Earpod',1000.90,'12/12/2022',3)
insert into ProductInfo values (109,'Laptop',85000.90,'12/12/2021',6)
insert into ProductInfo values (110,'Mobile',55000.90,'12/12/2020',1)

select * from ProductInfo
select p.*,c.CName 
from ProductInfo p join CompanyInfo c 
on p.CId=c.CId


select p.PName,c.CName 
from ProductInfo p join CompanyInfo c
on p.CId=c.CId

select p.*,c.CName 
from ProductInfo p join CompanyInfo c 
on p.CId=c.CId order by p.CId

--Part2
drop table Products
create table Products(
PId int primary key,
PQ int not null,
PPrice float,
Discount float)

INSERT INTO Products VALUES(1, 2, 900,0.05),(2, 3, 490,0.15),(3, 3, 700, 0.1)

create function Discounts(
@price float,@dis_percentage float)
returns float
as 
begin
declare @discount float
begin
select @discount=@price*@dis_percentage
end
return @discount
end

select p.PId,p.PPrice,p.Discount,p.PPrice-dbo.Discounts(PPrice,Discount) as 'Price after Discount' 
from Products p