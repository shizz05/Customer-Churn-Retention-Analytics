-- 10. CHURN ANALYSIS BY MONTHLY CHARGES

WITH charge_segments AS (
    SELECT
        "Churn",
        "MonthlyCharges",
        CASE
            WHEN "MonthlyCharges" < 35 THEN 'Low Charges'
            WHEN "MonthlyCharges" < 70 THEN 'Medium Charges'
            ELSE 'High Charges'
        END AS charge_band
    FROM public.telco_customers
)

SELECT
    charge_band,
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

FROM charge_segments

GROUP BY charge_band

ORDER BY
    CASE charge_band
        WHEN 'Low Charges' THEN 1
        WHEN 'Medium Charges' THEN 2
        WHEN 'High Charges' THEN 3
    END;