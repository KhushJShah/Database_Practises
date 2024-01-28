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