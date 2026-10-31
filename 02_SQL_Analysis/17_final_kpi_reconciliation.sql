-- 17. FINAL CUSTOMER CHURN KPI RECONCILIATION

SELECT
    COUNT(*) AS total_customers,

    COUNT(DISTINCT "customerID") AS unique_customers,

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
    ) AS churn_rate,

    ROUND(
        COUNT(*) FILTER (WHERE "Churn" = 'No') * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS retention_rate,

    ROUND(AVG("MonthlyCharges"), 2)
        AS average_monthly_charges,

    ROUND(SUM("MonthlyCharges"), 2)
        AS total_monthly_revenue,

    COUNT(*) FILTER (
        WHERE "TotalCharges" IS NULL
    ) AS missing_total_charges

FROM public.telco_customers;