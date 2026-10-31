-- 07. REVENUE ANALYSIS BY CHURN STATUS

SELECT
    "Churn",

    COUNT(*) AS total_customers,

    ROUND(AVG("MonthlyCharges"), 2)
        AS avg_monthly_charges,

    ROUND(SUM("MonthlyCharges"), 2)
        AS total_monthly_revenue,

    ROUND(AVG("TotalCharges"), 2)
        AS avg_total_charges,

    ROUND(SUM("TotalCharges"), 2)
        AS total_lifetime_charges

FROM public.telco_customers

GROUP BY "Churn"

ORDER BY "Churn";