SELECT * FROM bronze.customer
WHERE client_code in (32924);

SELECT * FROM bronze.account
WHERE client_code = 32952;

--PRIMARY KEY CHECK
--EXPECTATION: NO RESULTS
--OUTPUT: CLIENT WITH HISTORY DATA APPEAR MORE THAN ONCE
SELECT client_code, count(*)
FROM silver.customer
GROUP BY client_code
HAVING count(*) > 1;

--PRIMARY KEY CHECK
--EXPECTATION: NO RESULTS
--OUTPUT: NO RESULTS
SELECT policy_number, count(*)
FROM bronze.account
GROUP BY policy_number
HAVING count(*) > 1;

--DATE VALIDATION
--EXPECTATION: NO RESULTS
SELECT * FROM bronze.account
WHERE surrender_date IS NOT NULL AND issue_date < surrender_date;


--INVALID DATA
--EXPECTATION: NO RESULTS
SELECT * FROM bronze.customer
WHERE lastupdate IS NULL;

-- CHECK FOR CLIENT WHO HAVE REMARRIED STATUS AND APPEAR MORE THAN ONCE
-- OUTPUT: ONE CLIENT WHICH APPEAR TWICE BUT WITH R STATUS FOR BOTH RECORDS
SELECT CLIENT_CODE, 
SUM(CASE WHEN marital_status = 'R' THEN 1 ELSE 0 END) AS R_flag
FROM bronze.customer
GROUP BY CLIENT_CODE
HAVING SUM(CASE WHEN marital_status = 'R' THEN 1 ELSE 0 END) > 0 AND COUNT(*) > 1


-- CHECK DISTINCT CLASSES
SELECT distinct marital_status,
CASE UPPER(TRIM(MARITAL_STATUS))
	WHEN 'D' THEN 'Divorced'
	WHEN 'M' THEN 'Married'
	WHEN 'R' THEN 'Remarried'
	WHEN 'S' THEN 'Single'
	WHEN 'W' THEN 'Widowed'
	ELSE 'N/A'
END AS MARITAL_STATUS1
FROM bronze.customer

SELECT distinct gender,
CASE UPPER(TRIM(GENDER))
	WHEN 'F' THEN 'Female'
	WHEN 'M' THEN 'Male'
ELSE 'N/A' END AS gender1
FROM bronze.customer

-- CHECK PRIMARY KEY CONNECTION
SELECT client_code FROM silver.customer WHERE client_code NOT IN (SELECT client_code FROM silver.account)

-- WE DONT HAVE CUSTOMER INFORMATION OF client_code: 2
SELECT client_code FROM silver.account WHERE client_code NOT IN (SELECT client_code FROM silver.customer)


SELECT POLICY_NUMBER,PLAN_CODE,CLIENT_CODE,SUM_ASSURED,MODAL_PREMIUM,ISSUE_DATE,TYPE,POLICY_STATUS,SURRENDER_DATE,PAYMENT_MODE
SELECT *
FROM silver.account a LEFT JOIN silver.customer b ON a.client_code = b.client_code
