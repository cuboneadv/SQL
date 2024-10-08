# JULY_MERGED와 FIRST_HALF 테이블의 FLAVOR 컬럼이 동일함을 확인 후에 작성한 쿼리임
WITH JULY_MERGED AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY
    GROUP BY FLAVOR
)

SELECT J.FLAVOR
FROM JULY_MERGED J
JOIN FIRST_HALF F
USING (FLAVOR)
ORDER BY (J.TOTAL_ORDER + F.TOTAL_ORDER) DESC
LIMIT 3;