SELECT
    "Contract",
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE "Churn" = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM public.telco_customers
GROUP BY "Contract"
ORDER BY churn_rate DESC;