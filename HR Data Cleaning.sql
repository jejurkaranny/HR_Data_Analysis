create database sql_project;
use sql_project;
describe hr;
#Changing column name to emp_id
Alter table hr
change column ï»¿id emp_id varchar(20) null;
#Udatating the date formate
update hr
set birthdate =case
   when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
   when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
   else null
end;
#changing data type of column birthdate
alter table hr
modify column birthdate date;

update hr
set hire_date =case
   when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
   when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
   else null
end;
alter table hr
modify column hire_date date;

update hr
set termdate= date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != ' ';

alter table hr
modify column termdate date;
# adding Age column to table
alter table hr
add column Age int;
#insert values in age column based on birthdate
update hr
set Age = timestampdiff( year,birthdate,curdate());




