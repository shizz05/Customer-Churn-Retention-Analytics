-- 15. CUSTOMER CONTRACT ANALYSIS USING INNER JOIN

SELECT
    c."Contract",
    r.commitment_months,
    r.contract_category,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE c."Churn" = 'Yes'
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE c."Churn" = 'No'
    ) AS retained_customers,

    ROUND(
        COUNT(*) FILTER (
            WHERE c."Churn" = 'Yes'
        ) * 100.0 / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate

FROM public.telco_customers AS c

INNER JOIN public.contract_reference AS r
    ON c."Contract" = r.contract_type

GROUP BY
    c."Contract",
    r.commitment_months,
    r.contract_category

ORDER BY
    r.commitment_months;