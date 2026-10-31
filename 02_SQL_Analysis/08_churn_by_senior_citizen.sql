-- 08. CHURN ANALYSIS BY SENIOR CITIZEN STATUS

SELECT
    "SeniorCitizen",

    CASE
        WHEN "SeniorCitizen" = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS customer_category,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'Yes'
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'No'
    ) AS retained_customers,

    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate

FROM public.telco_customers

GROUP BY "SeniorCitizen"

ORDER BY "SeniorCitizen" DESC;