CREATE TABLE Crimes_Against_Women (
    State VARCHAR(100),
    District VARCHAR(100),
    Year INT,
    Rapes INT,
    Kidnappings INT
    -- Add other columns as necessary
);


#3.2 Write SQL query to find the highest number of rapes & kidnappings that happened in which state, district, and year.

SELECT State, District, Year, Rapes, Kidnappings
FROM Crimes_Against_Women
ORDER BY Rapes DESC, Kidnappings DESC
LIMIT 1;


#3.3 Write SQL query to find all the lowest number of rapes & kidnappings that happened in which state, district, and year.

SELECT State, District, Year, Rapes, Kidnappings
FROM Crimes_Against_Women
WHERE Rapes = (SELECT MIN(Rapes) FROM Crimes_Against_Women);

#3.4 Insert records from 02_District_wise_crimes_committed_against_ST_2001_2012.csv into a new table.

CREATE TABLE Crimes_Against_ST (
    State VARCHAR(100),
    District VARCHAR(100),
    Year INT,
    Dacoity INT,
    Robbery INT,
    Murders INT
    -- Add other columns as necessary
);


#3.5 Write SQL query to find the highest number of dacoity/robbery in which district.

SELECT District, MAX(Dacoity) AS MaxDacoity, MAX(Robbery) AS MaxRobbery
FROM Crimes_Against_ST
GROUP BY District
ORDER BY MaxDacoity DESC, MaxRobbery DESC
LIMIT 1;

#3.6 Write SQL query to find in which districts (All) the lowest number of murders happened.

SELECT State, District, Year, Murders
FROM Crimes_Against_ST
WHERE Murders = (SELECT MIN(Murders) FROM Crimes_Against_ST);



#3.7 Write SQL query to find the number of murders in ascending order in district and year-wise.

SELECT State, District, Year, Murders
FROM Crimes_Against_ST
ORDER BY Murders ASC, District ASC, Year ASC;

#3.8.1 Insert records of STATE/UT, DISTRICT, YEAR, MURDER, ATTEMPT TO MURDER, and RAPE columns only from 01_District_wise_crimes_committed_IPC_2001_2012.csv


CREATE TABLE Crimes (
    STATE_UT VARCHAR(100),
    DISTRICT VARCHAR(100),
    YEAR INT,
    MURDER INT,
    ATTEMPT_TO_MURDER INT,
    RAPE INT
);

# Write SQL query to find which District in each state/UT has the highest number of murders year wise. Your output should show STATE/UT, YEAR, DISTRICT, and MURDERS.


SELECT 
    STATE_UT,
    YEAR,
    DISTRICT,
    MURDER
FROM (
    SELECT 
        STATE_UT,
        YEAR,
        DISTRICT,
        MURDER,
        ROW_NUMBER() OVER (PARTITION BY STATE_UT, YEAR ORDER BY MURDER DESC) AS rn
    FROM Crimes
) AS ranked
WHERE rn = 1;

#Store the above data (the result of 3.2) in DataFrame and analyze districts that appear 3 or more than 3 years and print the corresponding state/UT, district, murders, and year in descending order.





