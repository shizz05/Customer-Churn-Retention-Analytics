-- 19. CHURN ANALYSIS BY TENURE AND CONTRACT

WITH customer_segments AS (
    SELECT
        "customerID",
        "tenure",
        "Contract",
        "Churn",

        CASE
            WHEN "tenure" <= 12 THEN '0-12 Months'
            WHEN "tenure" <= 24 THEN '13-24 Months'
            WHEN "tenure" <= 48 THEN '25-48 Months'
            ELSE '49+ Months'
        END AS tenure_group

    FROM public.telco_customers
)

SELECT
    tenure_group,
    "Contract",

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'Yes'
    ) AS churned_customers,

    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate

FROM customer_segments

GROUP BY tenure_group, "Contract"

ORDER BY
    CASE tenure_group
        WHEN '0-12 Months' THEN 1
        WHEN '13-24 Months' THEN 2
        WHEN '25-48 Months' THEN 3
        ELSE 4
    END,
    "Contract";