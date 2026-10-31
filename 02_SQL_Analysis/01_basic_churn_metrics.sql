SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT "customerID") AS unique_customers,
    COUNT(*) FILTER (WHERE "Churn" = 'Yes') AS churned_customers,
    COUNT(*) FILTER (WHERE "Churn" = 'No') AS retained_customers,
    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM public.telco_customers;