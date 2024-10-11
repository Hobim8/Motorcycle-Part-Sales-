---data reading 
SELECT *
FROM "Motorcycle Sales Part" msp 

---solution 
SELECT 
	product_line,
CASE 
    WHEN EXTRACT(MONTH FROM date::DATE) = 06 THEN 'June'
    WHEN EXTRACT(MONTH FROM date::DATE) = 07 THEN 'July'
    WHEN EXTRACT(MONTH FROM date::DATE) = 08 THEN 'August'
END AS MONTH,
	warehouse,
	SUM(total-payment_fee) AS net_revenue
FROM "Motorcycle Sales Part" msp
WHERE client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY net_revenue; 