/*query 1*/
/*The next query demonstrates the use of a table column, a literal, an expression,              
// and a built-in function call in a single query against the employee table:*/
SELECT emp_id, 'ACTIVE', emp_id * 3.14159,  UPPER(lname) FROM employee;

/*query 2*/
SELECT employee.emp_id, employee.fname,   
employee.lname, department.name dept_name  
FROM employee INNER JOIN department    
ON employee.dept_id = department.dept_id;

/*query 3*/
/*find  trends in your data,
For example, rather than looking at a list of employees and the departments to which they are assigned, 
you might want to look at a list of departments along with the number of employees assigned to each department. 
When using the group by clause, you may also use the having clause, 
which allows you to filter group data in the same way the where clause lets you filter raw data.*/
   SELECT d.name, count(e.emp_id) num_employees  FROM department d INNER JOIN employee e   ON d.dept_id = e.dept_id   GROUP BY d.name   HAVING count(e.emp_id) > 2;
   
/*query 4*/
/*The order by clause is the mechanism for sorting your result set using either raw column data or expressions based on column data.*/
SELECT open_emp_id, product_cd FROM account ORDER BY open_emp_id;

/*query 5*/
SELECT account_id, product_cd, open_date, avail_balance  FROM account  ORDER BY avail_balance DESC;


/*query 6*/
/*condition is the inequality condition, which asserts that two expressions are not equal.*/
   SELECT pt.name product_type, p.name product
    FROM product p INNER JOIN product_type pt
    ON p.product_type_cd = pt.product_type_cd
    WHERE pt.name <> 'Customer Accounts';

/*query 7*/
SELECT emp_id, fname, lname, start_date  FROM employee
    WHERE start_date < '2007-01-01'
    AND start_date >= '2005-01-01';

/*query 8*/
SELECT account_id, product_cd, cust_id, avail_balance  FROM account
  WHERE avail_balance BETWEEN 3000 AND 5000;


/*query 9*/
/*MEMBERSHIP CONDITIONS*/
SELECT account_id, product_cd, cust_id, avail_balance FROM account
    WHERE product_cd = 'CHK' OR product_cd = 'SAV'
    OR product_cd = 'CD' OR product_cd = 'MM';

/*query 10*/
/*matching codititons*/
SELECT lname FROM employee WHERE lname LIKE '_a%e%';



/*query 11*/
SELECT cust_id, fed_id  FROM customer  WHERE fed_id LIKE '___-__-____';

/*query 12*/
/*CARTESIAN PRODUCT*/
SELECT e.fname, e.lname, d.name
    FROM employee e JOIN department d;
    
    

/*query 13*/
/*INNER JOINS*/
SELECT e.fname, e.lname, d.name
    FROM employee e JOIN department d
    ON e.dept_id = d.dept_id;
    
    

/*query 14*/
/*Grouping Concepts
Sometimes you will want to find trends in your data that will require the database server to cook the data a bit before you can generate the results you are looking*/
SELECT open_emp_id, COUNT(*) how_many
    FROM account
    GROUP BY open_emp_id;




/*query 15*/
/*SUBQUERY
A subquery is a query contained within another SQL statement (which I refer to as the containing statement for the rest of this discussion). 
A subquery is always enclosed within parentheses
Following subquery returns the maximum value found in the account_id column in the account table, 
and the containing statement then returns data about that account
*/
 SELECT account_id, product_cd, cust_id, avail_balance
    FROM account
    WHERE account_id = (SELECT MAX(account_id) FROM account);



