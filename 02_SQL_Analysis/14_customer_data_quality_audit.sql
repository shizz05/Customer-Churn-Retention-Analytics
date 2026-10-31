-- 14. CUSTOMER DATA QUALITY AUDIT

SELECT
    'Total Records' AS validation_check,
    COUNT(*) AS issue_count
FROM public.telco_customers

UNION ALL

SELECT
    'Duplicate Customer IDs',
    COUNT(*)
FROM (
    SELECT "customerID"
    FROM public.telco_customers
    GROUP BY "customerID"
    HAVING COUNT(*) > 1
) duplicates

UNION ALL

SELECT
    'Missing Customer IDs',
    COUNT(*)
FROM public.telco_customers
WHERE "customerID" IS NULL

UNION ALL

SELECT
    'Missing Churn Values',
    COUNT(*)
FROM public.telco_customers
WHERE "Churn" IS NULL

UNION ALL

SELECT
    'Missing Total Charges',
    COUNT(*)
FROM public.telco_customers
WHERE "TotalCharges" IS NULL

UNION ALL

SELECT
    'Negative Monthly Charges',
    COUNT(*)
FROM public.telco_customers
WHERE "MonthlyCharges" < 0

UNION ALL

SELECT
    'Invalid Tenure',
    COUNT(*)
FROM public.telco_customers
WHERE "tenure" < 0;