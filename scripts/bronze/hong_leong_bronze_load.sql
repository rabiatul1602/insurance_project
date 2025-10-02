TRUNCATE bronze.account;
COPY bronze.account (
	POLICY_NUMBER,PLAN_CODE,CLIENT_CODE,SUM_ASSURED,
	MODAL_PREMIUM,ISSUE_DATE,TYPE,POLICY_STATUS,
	SURRENDER_DATE,PAYMENT_MODE
)
FROM 'C:\Program Files\PostgreSQL\17\data\staging\Hong Leong Assurance - Data Analytics Assessment Note\Account.csv'
DELIMITER ','
CSV HEADER;


TRUNCATE bronze.customer;
COPY bronze.customer (
	CLIENT_CODE,AGE,MARITAL_STATUS,GENDER,INCOME,POSTCODE,LASTUPDATE
)
FROM 'C:\Program Files\PostgreSQL\17\data\staging\Hong Leong Assurance - Data Analytics Assessment Note\Customer.csv'
DELIMITER ','
CSV HEADER;