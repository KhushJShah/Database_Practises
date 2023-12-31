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

