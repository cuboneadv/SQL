WITH CTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER(ORDER BY ID) AS NUMBER,
        ID - ROW_NUMBER() OVER(ORDER BY ID) AS RNK
    FROM STADIUM
    WHERE PEOPLE >= 100
)

SELECT ID, VISIT_DATE, PEOPLE
FROM CTE
WHERE RNK IN (
    SELECT RNK
    FROM CTE
    GROUP BY RNK
    HAVING COUNT(*) >= 3
)
ORDER BY VISIT_DATE;
