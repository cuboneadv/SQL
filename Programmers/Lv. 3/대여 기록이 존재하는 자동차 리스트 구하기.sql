SELECT DISTINCT H.CAR_ID
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
JOIN CAR_RENTAL_COMPANY_CAR C
    ON H.CAR_ID = C.CAR_ID
WHERE C.CAR_TYPE = '세단'
    AND DATE_FORMAT(H.START_DATE, '%Y%m') = '202210'
ORDER BY H.CAR_ID DESC;