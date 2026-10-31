-- 11. CUSTOMER SEGMENTATION USING CTE

WITH customer_segments AS (
    SELECT
        "customerID",
        "tenure",
        "Contract",
        "MonthlyCharges",
        "Churn",

        CASE
            WHEN "tenure" <= 12 THEN 'New Customer'
            WHEN "tenure" <= 48 THEN 'Growing Customer'
            ELSE 'Loyal Customer'
        END AS tenure_segment

    FROM public.telco_customers
)

SELECT
    tenure_segment,
    "Contract",

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'Yes'
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE "Churn" = 'No'
    ) AS retained_customers,

    ROUND(AVG("MonthlyCharges"), 2)
        AS avg_monthly_charges,

    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'Yes') * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate

FROM customer_segments

GROUP BY tenure_segment, "Contract"

ORDER BY tenure_segment, "Contract";