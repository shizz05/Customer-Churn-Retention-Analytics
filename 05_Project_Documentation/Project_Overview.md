# Customer Churn & Retention Analytics

## Project Overview

### Business Context
Customer churn occurs when customers discontinue a service. For a subscription-based telecom business, understanding which customer groups have higher churn rates can help the business investigate service experience, pricing, contract structure, and retention opportunities.

### Project Objective
This project analyses the IBM Telco Customer Churn dataset to:
- Measure overall customer churn and retention.
- Compare churn patterns across contract types, tenure groups, payment methods, and internet service categories.
- Examine monthly charges associated with churned and retained customers.
- Present findings through SQL analysis and a Power BI dashboard.

### Dataset
- Source: IBM Telco Customer Churn dataset.
- Records: 7,043 customers.
- Columns: 21.
- Grain: One row per customer; a customer-level snapshot.
- Target variable: `Churn` (`Yes` / `No`).

### Tools and Technologies
- PostgreSQL: data storage, SQL querying, joins, CTEs, aggregations, and window functions.
- Microsoft Power BI Desktop: KPI measures and data visualisation.
- DAX: calculated measures for customer counts, churn, retention, and monthly charges.
- Excel / CSV: data inspection and quality checks.

### Project Deliverables
- Cleaned customer dataset and data quality documentation.
- SQL analysis scripts.
- Power BI dashboard and supporting DAX measures.
- Dashboard preview and project documentation.

### Key Baseline Results
- Total customers: 7,043.
- Churned customers: 1,869.
- Retained customers: 5,174.
- Churn rate: 26.54%.
- Retention rate: 73.46%.

### Scope and Limitations
The dataset is a customer-level snapshot, not a sequence of monthly historical customer records. Therefore, this project describes observed churn patterns; it does not calculate true month-by-month cohort retention or customer lifetime trends. The analysis is descriptive and does not establish causation or provide a trained predictive churn model.
