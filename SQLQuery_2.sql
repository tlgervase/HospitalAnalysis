SELECT *
FROM HospitalInfo
ORDER BY Hosp_ID
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;

--Find avgerage rating and how many hospitals are rated at each rank
SELECT 
    AVG(Rating) AS AverageRating,
    COUNT(*) AS RatingCount
FROM HospitalInfo
WHERE Rating IS NOT NULL
GROUP BY Rating
ORDER BY Rating;
--Many more hospitals are rated 3/5 stars. Distrubution is slightly right-shifted.

--See if there is a correlation between highly rated hospitals and effectiveness of care
SELECT 
    Rating,
    COUNT(*) AS HightlyRated,
    COUNT(DISTINCT Effectiveness_Of_Care)
FROM HospitalInfo
WHERE Rating IS NOT NULL AND Rating>3 
GROUP BY Effectiveness_Of_Care
ORDER BY Effectiveness_Of_Care;