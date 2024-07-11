/* Author: Khush Shah(G23239366)
/* This SQL file contains the codes for the Hackerank SQL practice. I will add the questions, and the probable answers to them. I will write codes in MySQL. */
/*Q. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
ID: Number, City: Varchar, State: Varchar, LAT_N:NUMBER ,LONG_W:NUMBER
where LAT_N is the northern latitude and LONG_W is the western longitude. */
SELECT DISTINCT CITY FROM STATION where CITY NOT REGEXP '^[AEIOU].*[AEIOU]$';
/* I have used Regex, you can also use NOT in, and RIGHT(CITY), and LEFT(CITY) to grab the first and last alphabet of the CITY.*/

/*Q. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
ID: Number, City: Varchar, State: Varchar, LAT_N:NUMBER ,LONG_W:NUMBER
where LAT_N is the northern latitude and LONG_W is the western longitude. */
SELECT DISTINCT(CITY) FROM STATION WHERE CITY NOT REGEXP '^[AEIOU].*[AEIOU]$'
/* A similar type of solution to the above question, but here they ask for no repetition.*/

/* Q. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. The CITY table is described as follows:
ID: NUMBER, NAME: VARCHAR, COUNTRYCODE: VARCHAR, DISTRICT: VARCHAR, POPULATION: NUMBER
 */
SELECT NAME FROM CITY WHERE COUNTRYCODE='JPN';

/* 
Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Input Format

The STUDENTS table is described as follows:The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
ID: Integer, Name: String, Marks: Integer

Sample Output

Ashley
Julia
Belvet
Explanation

Only Ashley, Julia, and Belvet have Marks > . If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
*/
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(NAME,3),ID ASC

/*
Q. A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Input Format

The STATION table is described as follows:
ID: Number, City: Varchar, State: Varchar, LAT_N:NUMBER ,LONG_W:NUMBER

where LAT_N is the northern latitude and LONG_W is the western longitude
*/
SELECT ROUND(lat_n, 4)
FROM (
    SELECT lat_n, ROW_NUMBER() OVER() row_num
    FROM STATION
    ORDER BY lat_n
) ordered
WHERE row_num = ROUND(0.5 * (SELECT COUNT(*) FROM STATION))

/* To calculate the median, the column LAT_N is ordered in ascending way.*/

/*
Q. Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

Input Format

The OCCUPATIONS table is described as follows:Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.
Name: String, Occupation: String
Sample Input

An OCCUPATIONS table that contains the following records:


Sample Output

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
Explanation

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession (), and then alphabetically by profession (, and ).
*/
SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
        FROM OCCUPATIONS
    ORDER BY Name ASC;
    
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
        FROM OCCUPATIONS
    GROUP BY Occupation
    ORDER BY COUNT(Occupation) ASC;

/*
Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

Input Format
ID: Number, City: Varchar, State: Varchar, LAT_N:NUMBER ,LONG_W:NUMBER
The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.

*/
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4) FROM STATION

/* 
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
Input Format

The following tables contain company data:

Company: The company_code is the code of the company and founder is the founder of the company.

Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.

Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

Sample Input

Company Table:Lead_Manager Table:Senior_Manager Table:Manager Table:Employee Table:

Sample Output

C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2
Explanation

In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under manager M1.

In company C2, the only lead manager is LM2. There is one senior manager, SM3, under LM2. There are two managers, M2 and M3, under senior manager SM3. There is one employee, E3, under manager M2, and another employee, E4, under manager, M3.

*/
select distinct c.company_code as company_code, c.founder as founder, count(distinct(l.lead_manager_code)) as total_lead_manager, count(distinct(s.senior_manager_code)) as total_senior_manager, count(distinct(m.manager_code)) as total_manager, count(distinct(e.employee_code)) as total_employee from company as c left join lead_manager as l on c.company_code=l.company_code left join senior_manager as s on l.lead_manager_code= s.lead_manager_code left join manager as m on s.senior_manager_code = m.senior_manager_code left join employee as e on m.manager_code = e.manager_code group by company_code, founder order by company_code asc;

/*
Q. Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

Input Format

The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
select round(sqrt(power(max(LAT_N)-min(LAT_N),2)+ power(max(LONG_W)-min(LONG_W),2)),4) from station;

/*
Q. You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.



Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
Sample Input



Sample Output

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf

*/
SELECT N, CASE WHEN P IS NULL THEN 'Root' WHEN N IN (SELECT P FROM BST) THEN 'Inner' ELSE 'Leaf' END AS 'RESULT' FROM BST
ORDER BY N;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

*/
SELECT name FROM Employee ORDER BY name ASC;


/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
*/
SELECT name FROM Employee WHERE months<10 AND salary>2000;


/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/
select w.ID, p.AGE, w.COINS_NEEDED, w.POWER

from WANDS as w
join WANDS_PROPERTY as p
on w.CODE = p.CODE

where p.IS_EVIL = 0
        and w.COINS_NEEDED in (
                    select min(w2.coins_needed)
                    from wands w2
                    join wands_property p2 
                    on w2.code = p2.code

                    where w2.power = w.power
                            and p2.age = p.age
                            and p2.is_evil = 0
                )

order by w.POWER desc, p.AGE desc;

/* 
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
SELECT 
 CASE 
 WHEN T.A=T.B AND T.B=T.C THEN 'Equilateral'
 WHEN T.A=T.B OR T.B=T.C OR T.A=T.C THEN 'Isosceles'
 WHEN T.A + T.B <= T.C OR T.A + T.C <= T.B THEN 'Not A Triangle'
ELSE 'SCALENE'
END AS RESULT
FROM TRIANGLES AS T;
