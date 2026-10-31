-- 20. REVENUE AT RISK FROM CHURNED CUSTOMERS

WITH revenue_summary AS (
    SELECT
        "Churn",

        COUNT(*) AS customer_count,

        SUM("MonthlyCharges") AS monthly_revenue,

        AVG("MonthlyCharges") AS avg_monthly_charges

    FROM public.telco_customers

    GROUP BY "Churn"
)

SELECT
    "Churn",
    customer_count,

    ROUND(monthly_revenue, 2)
        AS monthly_revenue,

    ROUND(avg_monthly_charges, 2)
        AS avg_monthly_charges,

    ROUND(
        monthly_revenue * 100.0 /
        NULLIF(SUM(monthly_revenue) OVER (), 0),
        2
    ) AS revenue_share_percentage

FROM revenue_summary

ORDER BY monthly_revenue DESC;