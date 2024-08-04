# SUBQUERY(인라인 뷰)를 이용한 풀이
-- SELECT A.CATEGORY,
--        B.MAX_PRICE,
--        A.PRODUCT_NAME
-- FROM FOOD_PRODUCT A
-- JOIN (
--     SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
--     FROM FOOD_PRODUCT
--     GROUP BY CATEGORY
-- ) B ON A.CATEGORY = B.CATEGORY AND A.PRICE = B.MAX_PRICE
-- WHERE A.CATEGORY IN ('과자', '국', '김치', '식용유')
-- ORDER BY B.MAX_PRICE DESC;

# CATEGORY를 기준으로 GROUP BY하면 MAX(PRICE) 값은 얻을 수 있지만 그것이 어떤 상품인지는 알 수 없음(PRODUCT_ID를 기준으로 GROUP BY할 수 없기 때문)
# 따라서, SUBQUERY를 이용해서 CATEGORY, MAX(PRICE) 값이 일치하는 PRODUCT를 조회함

# SUBQUERY(중첩)를 이용한 풀이
SELECT CATEGORY,
       PRICE MAX_PRICE,
       PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (
    SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY CATEGORY
)
ORDER BY MAX_PRICE DESC;