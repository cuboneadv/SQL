SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS I JOIN ANIMAL_OUTS O USING(ANIMAL_ID)
ORDER BY DATEDIFF(O.DATETIME, I.DATETIME) DESC
LIMIT 2;