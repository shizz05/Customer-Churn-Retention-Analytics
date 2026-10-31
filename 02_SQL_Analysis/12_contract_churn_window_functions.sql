-- 12. RANKING CONTRACT TYPES BY CHURN RATE

WITH contract_churn AS (
    SELECT
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

    FROM public.telco_customers
    GROUP BY "Contract"
)

SELECT
    "Contract",
    total_customers,
    churned_customers,
    churn_rate,

    RANK() OVER (
        ORDER BY churn_rate DESC
    ) AS churn_risk_rank,

    DENSE_RANK() OVER (
        ORDER BY churn_rate DESC
    ) AS dense_churn_rank

FROM contract_churn
ORDER BY churn_risk_rank;