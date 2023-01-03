select*from customers;
commit;
mmm;
/
create or replace procedure Data_Link
is
begin

INSERT INTO CustomerProductCategory (CustomerName, ProductName, CategoryName)
SELECT Customers.Customer_Name AS CustomerName, Product.Product_Name AS ProductName, Product_Categories.Category_Name AS CategoryName
FROM Customers
JOIN Product ON Customers.Cus_id = Product.CUSTOMER_ID
JOIN Product_Categories ON Product.prod_id = Product_Categories.P_PROD_ID;
end;
/
create or replace PROCEDURE exchange_data 
is
emp_id employee_test.empid%type;
emp_firstname employee_test.firstname%type;
emp_lastname employee_test.lastname%type;
emp_salary employee_test.salary%type;
cursor getdetails is
select empid,firstname,lastname,salary from employee_test;
begin
open getdetails;
loop
fetch getdetails into emp_id,emp_firstname,emp_lastname,emp_salary ;
exit when getdetails%notfound;
dbms_output.put_line(emp_id||' '||emp_firstname||' '||emp_lastname||' '||emp_salary);
insert into employee_clone(empid,firstname,lastname,salary) values(emp_id,emp_firstname,emp_lastname,emp_salary); 
end loop;
end;




