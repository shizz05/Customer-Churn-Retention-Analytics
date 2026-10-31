-- 13. CUSTOMER REVENUE RANKING

SELECT
    "customerID",
    "Contract",
    "MonthlyCharges",
    "TotalCharges",
    "Churn",

    RANK() OVER (
        ORDER BY "TotalCharges" DESC NULLS LAST
    ) AS revenue_rank,

    DENSE_RANK() OVER (
        ORDER BY "MonthlyCharges" DESC
    ) AS monthly_charge_rank,

    ROUND(
        AVG("MonthlyCharges") OVER (),
        2
    ) AS overall_avg_monthly_charges

FROM public.telco_customers

ORDER BY revenue_rank
LIMIT 20;