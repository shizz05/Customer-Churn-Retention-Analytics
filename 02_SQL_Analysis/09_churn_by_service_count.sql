-- 09. CHURN ANALYSIS BY NUMBER OF SERVICES

WITH customer_services AS (
    SELECT
        "customerID",
        "Churn",

        (
            CASE WHEN "PhoneService" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "MultipleLines" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "OnlineSecurity" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "OnlineBackup" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "DeviceProtection" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "TechSupport" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "StreamingTV" = 'Yes' THEN 1 ELSE 0 END +
            CASE WHEN "StreamingMovies" = 'Yes' THEN 1 ELSE 0 END
        ) AS service_count

    FROM public.telco_customers
)

SELECT
    service_count,
    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'Yes'
    ) AS churned_customers,

    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate

FROM customer_services

GROUP BY service_count

ORDER BY service_count;