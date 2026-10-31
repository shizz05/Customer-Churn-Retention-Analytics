-- 18. CUSTOMER CHURN RISK SEGMENTATION

WITH customer_risk AS (
    SELECT
        "customerID",
        "tenure",
        "Contract",
        "Churn",

        CASE
            WHEN "tenure" <= 12
                 AND "Contract" = 'Month-to-month'
                THEN 'High Risk'

            WHEN "tenure" <= 24
                 AND "Contract" = 'Month-to-month'
                THEN 'Medium Risk'

            ELSE 'Lower Risk'
        END AS risk_category

    FROM public.telco_customers
)

SELECT
    risk_category,

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
    ) AS actual_churn_rate

FROM customer_risk

GROUP BY risk_category

ORDER BY
    CASE risk_category
        WHEN 'High Risk' THEN 1
        WHEN 'Medium Risk' THEN 2
        ELSE 3
    END;