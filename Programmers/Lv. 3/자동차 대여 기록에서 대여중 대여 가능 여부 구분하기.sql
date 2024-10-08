# WITH를 이용한 풀이
WITH RENTED_CARS AS (
    SELECT DISTINCT(CAR_ID), '대여중' AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE DATE_FORMAT(START_DATE, '%Y%m%d') <= 20221016
    AND DATE_FORMAT(END_DATE, '%Y%m%d') >= 20221016
    -- ORDER BY CAR_ID
),

ALL_CARS AS (
    SELECT DISTINCT(CAR_ID)
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    -- ORDER BY CAR_ID
)

SELECT A.CAR_ID,
    CASE
        WHEN R.CAR_ID IS NULL THEN '대여 가능'
        ELSE '대여중'
    END AS AVAILABILITY
FROM ALL_CARS A
LEFT JOIN RENTED_CARS R
ON A.CAR_ID = R.CAR_ID
ORDER BY A.CAR_ID DESC;