# Project Methodology

## 1. Project Workflow

The project follows a structured analytics workflow:

1. Dataset acquisition.
2. Data inspection and quality assessment.
3. Data cleaning and preparation.
4. PostgreSQL data loading.
5. SQL-based exploratory and business analysis.
6. KPI and measure creation.
7. Power BI dashboard design.
8. Insight interpretation and documentation.

## 2. Dataset Acquisition

The project uses the IBM Telco Customer Churn dataset:
- 7,043 customer records.
- 21 columns.
- One record per customer.
- `Churn` is the target field, with `Yes` and `No` values.

The dataset is a customer-level snapshot. It does not contain a sequence of monthly snapshots for each customer.

## 3. Data Quality Assessment and Cleaning

The raw and cleaned data were checked for:
- Exact duplicate rows.
- Duplicate customer IDs.
- Missing values.
- Numeric conversion issues.
- Negative monthly charges.
- Tenure values outside the expected range.
- Consistency of churn labels.

Recorded data quality results:
- Exact duplicate rows: 0.
- Duplicate customer IDs: 0.
- Blank `TotalCharges` strings in the raw file: 11.
- Missing `TotalCharges` after numeric conversion: 11.
- Customers with zero tenure: 11.
- Negative `MonthlyCharges`: 0.
- Tenure values outside the expected 0–72 range: 0.

The 11 missing `TotalCharges` values were retained as missing and were not artificially imputed. They correspond to customers with zero tenure.

## 4. Database and SQL Analysis

The cleaned data was loaded into PostgreSQL:
- Database: `telco_churn_db`.
- Main table: `public.telco_customers`.

SQL was used for customer counts, churn rates, grouped comparisons, revenue summaries, data-quality checks, joins, CTE-based segmentation, and ranking/window-function analysis.

A contract reference table was also used to demonstrate joining customer records with contract metadata.

## 5. KPI Definitions

- **Total Customers:** distinct count of `customerID`.
- **Churned Customers:** distinct customers where `Churn = 'Yes'`.
- **Retained Customers:** distinct customers where `Churn = 'No'`.
- **Churn Rate:** churned customers divided by total customers.
- **Retention Rate:** retained customers divided by total customers.
- **Average Monthly Charges:** average of `MonthlyCharges` for the selected customer group.
- **Churned Customers' Monthly Charges:** sum of `MonthlyCharges` for customers where `Churn = 'Yes'`.

The churned-customer monthly-charge sum is a descriptive snapshot measure, not a forecast of future revenue loss.

## 6. Power BI and Visualisation

Power BI is used to present:
- KPI cards for customer volume, churn, and retention.
- Churn rate by contract type.
- Customer volume and churn rate by tenure group.
- Churn rate by payment method.
- Customer mix by internet service.
- Churn versus retention split.
- Average monthly charges by churn status.
- Customer tenure distribution.
- Customer composition by contract.
- Monthly charges associated with churn.

DAX measures calculate the key customer and charge metrics. Slicers are intended to support interactive exploration by contract, internet service, payment method, and gender.

## 7. Validation

The report is checked against these baseline figures:
- Total customers: 7,043.
- Churned customers: 1,869.
- Retained customers: 5,174.
- Churn rate: approximately 26.54%.
- Retention rate: approximately 73.46%.

Additional checks:
- Churned customers plus retained customers equals total customers.
- Churn rate plus retention rate equals approximately 100%.
- Visual totals and filter behaviour are consistent with the underlying data.

## 8. Limitations

- The dataset is cross-sectional, not monthly longitudinal data.
- The analysis is descriptive, not causal.
- No trained machine-learning churn prediction model is included.
- Rule-based risk groups, if used, are heuristic categories and not statistically validated predictions.
- Current monthly charges associated with churned customers should not be presented as forecast future revenue loss.
