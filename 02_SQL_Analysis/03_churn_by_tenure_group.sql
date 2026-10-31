SELECT
    CASE
        WHEN "tenure" BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN "tenure" BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN "tenure" BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE "Churn" = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM public.telco_customers
GROUP BY tenure_group
ORDER BY MIN("tenure");