#Qutions on Hr dataset
-- 1 what is the gender breakdown of employee in company?
select gender,count(*) as count from hr
where Age>18 and termdate='0000-00-00'
group by gender;
-- 2 What is Ethencity/Race breakdoen of employee in company?
select race , count(*) as count from hr
where Age>18 and termdate='0000-00-00'
group by race 
order by count(*) desc;
-- 3 What is the Age distribution of employee in company?
select min(Age) as youngest,
      max(Age) as oldest
from hr
where Age>18 and termdate='0000-00-00';
select case
   when Age >= 18 and Age <=24 then '18-24'
   when Age >= 25 and Age <=34 then '25-34'
   when Age >= 35 and Age <=44 then '35-44'
   when Age >= 45 and Age <=55 then '45-55'
   else '55+'
   end as Age_group,
   count(*) as count
   from hr
   where Age>18 and termdate='0000-00-00'
   group by Age_group
   order by Age_group;
   
   select case
   when Age >= 18 and Age <=24 then '18-24'
   when Age >= 25 and Age <=34 then '25-34'
   when Age >= 35 and Age <=44 then '35-44'
   when Age >= 45 and Age <=55 then '45-55'
   else '55+'
   end as Age_group,gender,
   count(*) as count
   from hr
   where Age>18 and termdate='0000-00-00'
   group by Age_group,gender
   order by Age_group,gender;
   -- 4 How many employes work in Headoffice and in remote location?
   select location,count(*) as count from hr
   where Age>18 and termdate='0000-00-00'
   group by location;
   
   -- 5 What is average lenght of employment of employee who have been terminated?
   select round(avg(datediff(termdate,hire_date))/365,0) as avg_lenght_year
   from hr
   where termdate<= curdate() and termdate!='0000-00-00' and Age>18;
   
   -- 6 How does the gender distribution varies acccording to department ?
   select department,gender,count(*) as count from hr
   where Age>18 and termdate='0000-00-00'
   group by department,gender
   order by department;
   
   -- 7 distribution by job title in company?
  select jobtitle,count(*) as count from hr
  where Age>18 and termdate='0000-00-00'
  group by jobtitle
  order by jobtitle desc;
  
  -- 8 Which department has highest turmination rate?
  select department,
   total_count,
   termination_count,
   total_count/termination_count as termination_rate
   from( 
         select department,
		 count(*) as total_count,
		 sum(case when termdate <>'0000-00-00' and termdate<= curdate() then 1 else 0 end)as termination_count
         from hr
         where Age>18
         group by department) as t
   order by termination_rate desc;
   
   -- 8 What is the distribution according to location of state ?
   select location_state,count(*) as count from hr
   where Age>18 and termdate='0000-00-00'
   group by location_state
   order by count(*) desc;
   
   -- 9 how has the company employee count has been changed over time based on hire date and term date?
   select year,hire,terminate,
	hire-terminate as net_change,
	round((hire-terminate)/hire * 100,2) as percentage_net_change
	from(
          select year(hire_date) as year,
          count(*) as hire,
          sum(case when termdate<>'0000-00-00'and termdate<=curdate() then 1 else 0 end)as terminate
          from hr where Age>18
          group by year(hire_date)
          )as t
	order by year asc;
    
    -- 10 What is tenure distribution for each department?
    select department,round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure from hr
    where termdate<>'0000-00-00' and termdate<=curdate() and Age>=18
    group by department
    order by avg_tenure desc;
    
    
          
          
          
   
   
  
   
   