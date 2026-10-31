-- 16. LEFT JOIN - CONTRACT REFERENCE VALIDATION

SELECT
    c."Contract",
    r.contract_type,
    r.commitment_months,
    r.contract_category,

    COUNT(*) AS total_customers,

    COUNT(*) FILTER (
        WHERE c."Churn" = 'Yes'
    ) AS churned_customers,

    COUNT(*) FILTER (
        WHERE r.contract_type IS NULL
    ) AS unmatched_customers

FROM public.telco_customers AS c

LEFT JOIN public.contract_reference AS r
    ON c."Contract" = r.contract_type

GROUP BY
    c."Contract",
    r.contract_type,
    r.commitment_months,
    r.contract_category

ORDER BY
    r.commitment_months NULLS LAST;