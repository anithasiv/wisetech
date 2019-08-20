Basic & Date function
/*1.	Write a Query to display the current date. Label the column Date.
Date
28-Sep-01
*/
select  getdate()  date

/*1.	For each employee display the employee number, last_name, salary, and salary increased by 15% and expressed as a whole number. Label the new column New Salary. Place your SQL statement in a text file named Lab3_2.sql.*/
select employee_id,last_name,salary,(salary+salary*15/100)newsalary from employees

/*
1.	Modify your query lab3_2.Sql to add a column that subtracts the old salary from the new salary. Label the column Increase. Save the contents of the file as lab3_4.Sql.
Run the revised query.
*/
select employee_id,last_name,salary,(salary+salary*15/100)newsalary ,((salary+salary*15/100)-salary) increas from employees
/*1.	Write a query that displays the employees last name with the first letter Capitalized and all other letters lowercase, and the length of the names, for all the employees whose names starts with J, A or M. Give each column an appropriate label. Sort the results by the employees last names.*/
select last_name,len( last_name) len from employees where  last_name like '[jha]%' 
select*from employees
/* NO COMMISION*/
select last_name lastname,commission_pct,
case when
commission_pct='0' then '0'
else 'No Commission'
end
from employees

/* 1.	For each employee, display the employees last name, and calculate the number of months between today and the date the employees was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.*/
SELECT LAST_NAME,DATEDIFF(MONTH,HIRE_DATE,GETDATE()) MONTHS_WORKED
FROM employees WHER ORDER BY(DATEDIFF(MONTH,HIRE_DATE,GETDATE()))

/*1.	 Display the last name, hire date and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week starting with Monday.*/
SELECT LAST_NAME,HIRE_DATE,DAY(HIRE_DATE) DAY,DATENAME(DW,DAY(HIRE_DATE))SDAY FROM EMPLOYEES
ORDER BY(DAY(HIRE_DATE)), DATENAME(DW,DAY(HIRE_DATE))

/*1.	Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long. left-padded with $. Label the column SALARY.*/
select last_name, REPLICATE('$',15-LEN(salary)) + rtrim(salary ) salary from employees 

/*1.	Create a query that displays the employees last names and indicates the amount of their annual salaries with asterisks.  Each asterisk signifies a thousand dollars. Sort the data in descending order of salary.  Label the column EMPLOYEES_AND_THEIR_SALARIES.*/
select rtrim(last_name)+REPLICATE('*',salary/1000) EMPLOYEES_AND_THEIR_SALARIES
 from employees  order by ( rtrim(last_name)+REPLICATE('*',salary/1000) ) desc
 /*1.	Using the DECODE function write a query that displays the grade of all employees based on the value of the column JOB_ID, as per the following data:
Job	Grade
AD_PRES	A
ST_MAN	B
IT_PROG	C
SA_REP	D
ST_CLERK	E
None of the Above	0
*/
select job_id Job,
case
when job_id='AD_PRES' then 'A'
when job_id='ST_MAN' then 'B'
when job_id='IT_PROG' then 'C'
when job_id='SA_REP' then 'D'
when job_id='ST_CLERK' then 'E'
ELSE
'0' 
END Grade
from employees order by job_id

/*1.	 Display the last name, hire date and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week starting with Monday.*/
select format(hire_date,'dd-MMM-yy'),datename(weekday,hire_date),isnull(nullif (datepart(weekday,hire_date)-1,0),7) dy from employees order by dy
 

Group by
SELECT * FROM EMPLOYEES
/*FIND,MIN,MAV.AVG,SUM*/
SELECT MAX(SALARY) MAX,MIN(SALARY) MIN,SUM(SALARY),AVG(SALARY) FROM EMPLOYEES

/* Modify the query 12 to display the minimum, maximum, sum, and average salary for each job type.  */
SELECT JOB_ID,MAX(SALARY) MAX,MIN(SALARY) MIN,SUM(SALARY),AVG(SALARY) FROM EMPLOYEES GROUP BY job_ID

/*Write a query to display the number of people with the same job.*/
SELECT JOB_ID JOB,COUNT(JOB_ID)  NUMBEROFJOBS FROM EMPLOYEES GROUP BY JOB_ID

/*Determine the number of managers without listing them. Label the column Number of Managers. Hint: Use the MANAGER_ID column to determine the number of managers.*/
SELECT  COUNT(MANAGER_ID) numberofmanager
  FROM EMPLOYEES 

/*Write a query that displays the difference between the highest and lowest salaries. Label the column DIFFERENCE*/
SELECT (MAX(SALARY)-MIN(SALARY)) DIFFERENCE FROM EMPLOYEES

/*Display the manager number and the salary of the lowest paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
*/
select  manager_id ,min(salary) from employees group by manager_id
having manager_id is not null and min(salary)>6000 order by(min(salary)) desc

/*Write a query to display each department’s name, location, number of employees, and the average salary for all employees in that department. Label the columns Name, Location, Number of People, and Salary, respectively. Round the average salary to two decimal places.*/
select *from employees 
select * from departments

select department_name name,location_id location ,count(department_name)'number of employee',avg(salary) saary from 
employees  join departments on employees.department_id=departments.department_id 
group by department_name,location_id

/*Create a query that will display the total number of employees and, of that total, the number of employees hired in 1995, 1996, 1997, and 1998. Create appropriate column headings.*/
select count(employee_id) total,
(SELECT COUNT(hire_date)   FROM EMPLOYEES WHERE DATEPART(YY,HIRE_DATE) ='1995') '1995'
,(SELECT COUNT(hire_date)   FROM EMPLOYEES WHERE DATEPART(YY,HIRE_DATE) ='1996') '1996'
,(SELECT COUNT(hire_date)   FROM EMPLOYEES WHERE DATEPART(YY,HIRE_DATE) ='1997') '1997'
,(SELECT COUNT(hire_date)   FROM EMPLOYEES WHERE DATEPART(YY,HIRE_DATE) ='1998') '1998'FROM EMPLOYEES

/*Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 20, 50, 80, and 90, giving each column an appropriate heading.8*/
SELECT JOB_ID JOB
,SUM (CASE WHEN DEPARTMENT_ID=20 THEN SALARY END) dEP20
,SUM (CASE WHEN DEPARTMENT_ID=50 THEN SALARY END) dEP50
,SUM (CASE WHEN DEPARTMENT_ID=80 THEN SALARY END) dEP80
,SUM (CASE WHEN DEPARTMENT_ID=90 THEN SALARY END) dEP90,
SUM(SALARY) TOTAL FROM EMPLOYEES GROUP BY JOB_ID
 JOINS

select * from employees
select* from departments
select*from locations
SELECT* FROM 

/*Write a query to display the last name, department number, and department name for all employees.*/
select last_name,departments.department_id ,department_name from 
employees  join departments on
 employees.department_id=departments.department_id

/*Create a unique listing of all jobs that are in department 80. Include the location of the department in the output.*/
select distinct Top 2 employees.job_id,location_id from
 employees  join departments on 
 employees.department_id=departments.department_id where  departments.department_id=80
 
/*Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission*/
select last_name lasrname,department_name departmentname ,locations.location_id  location_id ,city city
 from employees join departments on 
 employees.department_id=departments.department_id  join  locations 
 on departments.location_id=locations.location_id WHERE commission_pct=0

 /*Display the employee last name and department name for all employees who have an a (lowercase) in their last names*/
 select last_name lastname,department_name from
  employees join departments on 
  employees.department_id=departments.department_id

  /*Write a query to display the last name, job, department number, and department name for all employees who work in Toronto.
*/
select last_name lasename,job_id,departments.department_id depid ,department_name from 
employees  join departments on employees.department_id=departments.department_id join locations 
 on departments.location_id=locations.location_id where
city='toronto'


/*Display the employee last name and employee number along with their manager’s last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively. */
SELECT e.employee_id 'Emp_Id', e.last_name 'Employee', 
m.employee_id 'Mgr_Id', m.last_name 'Manager' 
FROM employees e 
 join employees m 
ON (e.manager_id = m.employee_id);

/*Modify Query 6 to display all employees including King, who has no manager.*/
select 
e.employee_id,e.last_name as emp_name, m.employee_id as manager_id, m.last_name as manager_lastNamefrom employees e left join employees m on
 e.manager_id = m.employee_id

/*Show the structure of the JOB_GRADES table. Create a query that displays the name, job, department name, salary, and grade for all employees*/
SELECT JOB_ID,DEPARTMENT_NAME,SALARY FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID

/*Create a query to display the name and hire date of any employee hired after employee Davies.*/
SELECT lAST_NAME LAST_NAME,HIRE_DATE DATE FROM EMPLOYEES WHERE HIRE_DATE >  (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME='Davies') 

 
/*Display the names and hire dates for all employees who were hired before their managers, along with their manager’s names and hire dates. Label the columns Employee, Emp,Hired, Manager, and Mgr Hired, respectively*/
SELECT m.LAST_NAME ,m.HIRE_DATE,e.LAST_NAME,e.HIRE_DATE FROM EMPLOYEES E JOIN EMPLOYEES M ON 
E.employee_id=M.MANAGER_ID where e.HIRE_DATE > m.HIRE_DATE

/*Create a query that displays employee last names, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label*/
select department_id,last_name from employees group by last_name,department_id having department_id>=20 order by department_id 

select count(department_id),last_name from employees group by last_name


