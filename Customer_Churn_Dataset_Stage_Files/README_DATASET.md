# Customer Churn & Retention Analytics — Dataset Stage

## Dataset
IBM Telco Customer Churn dataset. The supplied source contains 7,043 customer records and 21 columns.

## Files
- `telco_customer_churn_raw.csv` — original source file, unchanged.
- `telco_customer_churn_cleaned.csv` — cleaned and type-corrected dataset.
- `data_dictionary.csv` — field descriptions and recommended data types.
- `data_quality_report.csv` — quality checks and results.
- `Customer_Churn_Dataset_Audit.xlsx` — workbook containing the cleaned data, data dictionary, and quality reports.

## Cleaning decisions
1. Trimmed leading/trailing whitespace in text columns.
2. Converted `TotalCharges` from text to numeric.
3. Converted whitespace-only `TotalCharges` values to missing values (NA).
4. Did not impute missing `TotalCharges`. These records have zero tenure in this dataset; retaining NA avoids inventing billing values.
5. Preserved the original raw CSV unchanged.
6. Checked exact duplicate rows, duplicate customer IDs, tenure range, and negative monthly charges.

## Important analytical note
This is a customer-level snapshot dataset, not a sequence of monthly customer snapshots. It supports churn comparisons by customer tenure, contract, services, payment method, and other attributes. It does not support true historical month-by-month cohort retention without additional time-series data.

## Source
IBM Telco Customer Churn repository:
https://github.com/IBM/telco-customer-churn-on-icp4d
