# JOIN을 이용한 풀이
SELECT I.ITEM_ID, ITEM_NAME
FROM ITEM_INFO I JOIN ITEM_TREE T
ON I.ITEM_ID = T.ITEM_ID
WHERE T.PARENT_ITEM_ID IS NULL
ORDER BY I.ITEM_ID

# SUBQUERY를 이용한 풀이
-- SELECT ITEM_ID, ITEM_NAME
-- FROM ITEM_INFO
-- WHERE ITEM_ID IN (
--     SELECT ITEM_ID
--     FROM ITEM_TREE
--     WHERE PARENT_ITEM_ID IS NULL
--     )
-- ORDER BY ITEM_ID

# WITH를 이용한 풀이
-- WITH ITEM AS (
--     SELECT ITEM_ID, PARENT_ITEM_ID
--     FROM ITEM_TREE
--     WHERE PARENT_ITEM_ID IS NULL
--     )
--     
-- SELECT F.ITEM_ID, F.ITEM_NAME
-- FROM ITEM AS I, ITEM_INFO AS F
-- WHERE F.ITEM_ID = I.ITEM_ID
-- ORDER BY F.ITEM_ID