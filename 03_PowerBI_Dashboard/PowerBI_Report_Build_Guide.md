# Power BI Report Build Guide

## Purpose
Build a descriptive Customer Churn and Retention Analytics report using the IBM Telco Customer Churn customer-level snapshot. This is not a predictive churn model.

## Data source
Use `telco_customer_churn_cleaned.csv` or PostgreSQL table `public.telco_customers`.

For a local PostgreSQL connection, the previously used settings were:
- Server: `localhost`
- Database: `telco_churn_db`
- Schema/table: `public.telco_customers`

Use your actual local connection settings. Never upload database passwords or credentials to GitHub.

## Confirm the imported table and columns
The DAX measures supplied assume the table is named `public telco_customers`. Check the Fields/Data pane. If the name differs, replace it in every formula.

Confirm these fields and types:
- `customerID`: Text
- `Churn`: Text
- `tenure`: Whole number
- `MonthlyCharges`: Decimal number
- `Contract`, `PaymentMethod`, `InternetService`, `gender`: Text

## Create DAX measures
1. Select the customer table in the Fields/Data pane.
2. Choose **New measure**.
3. Paste one measure at a time from `PowerBI_DAX_Measures.txt`.
4. Press Enter after each formula.
5. Do not type an extra `Measure =` before the formula's measure name.
6. Format churn/retention percentages as Percentage with 2 decimal places; counts as Whole number; charges as Currency where appropriate.

## Apply the theme
1. Save `Customer_Churn_PowerBI_Theme.json` locally.
2. In Power BI Desktop, open **View**.
3. Choose **Browse for themes** and select the JSON file. Menu wording may vary by version.

## Suggested report layout

### Header
Title: **TELCO CUSTOMER CHURN & RETENTION ANALYTICS**
Subtitle: IBM Telco Customer Churn | Customer-level snapshot | Descriptive analysis

### KPI row
Place five Card visuals across the top:
- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate
- Retention Rate

### Visuals
- Churn rate by contract: horizontal bar chart
- Customer volume and churn rate by tenure group: line and clustered column chart
- Churn rate by payment method: horizontal bar chart
- Customer mix by internet service: 100% stacked bar chart
- Churn vs retention: donut chart
- Average monthly charges by churn status: clustered column chart
- Customer distribution by tenure: histogram or binned column chart
- Customer composition by contract: 100% stacked bar chart or treemap
- Monthly charges associated with churn: Card/KPI visuals

### Suggested slicers
Contract, InternetService, PaymentMethod, and gender. Check that slicers filter the intended visuals consistently.

## Validation
Compare the report against these verified baseline counts:
- Total customers: 7,043
- Churned customers: 1,869
- Retained customers: 5,174
- Churn rate: approximately 26.54%
- Retention rate: approximately 73.46%

Check that churned + retained equals total customers and that the percentage measures sum to approximately 100%.

## Interpretation cautions
- This is a customer-level snapshot, not monthly historical data.
- Do not describe tenure bands as historical retention cohorts.
- Monthly charges associated with churned customers are not forecasted future revenue loss.
- Descriptive associations do not prove causation.
- Hand-built risk bands are heuristic, not a validated predictive model.

## Save
Save the completed report as `Customer_Churn_Retention_Analytics.pbix`. Do not commit passwords, private connection strings, or sensitive customer data.
