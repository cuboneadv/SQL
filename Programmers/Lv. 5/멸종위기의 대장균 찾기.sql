# 재귀 함수 이용
WITH RECURSIVE GenerationCTE AS (
    SELECT 
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    SELECT 
        e.ID,
        e.PARENT_ID,
        g.GENERATION + 1 AS GENERATION
    FROM ECOLI_DATA e
    JOIN GenerationCTE g
    ON e.PARENT_ID = g.ID
),

ECOLI_GENERATION AS (
    SELECT 
        ID,
        GENERATION
    FROM GenerationCTE
)

-- SELECT *
-- FROM ECOLI_GENERATION

# 자식이 없는 경우, C.ID(자식의 ID)가 NULL로 출력되므로, P.ID(부모의 ID)별 하나의 행만 존재함
# 따라서, GENERATION별 GROUP BY 시 DISTINCT(P.ID)를 고려할 필요가 없음
SELECT COUNT(P.ID) COUNT, G.GENERATION GENERATION
FROM ECOLI_DATA P
LEFT JOIN ECOLI_DATA C
ON P.ID = C.PARENT_ID
JOIN ECOLI_GENERATION G
ON P.ID = G.ID
WHERE C.ID IS NULL
GROUP BY G.GENERATION
ORDER BY GENERATION;