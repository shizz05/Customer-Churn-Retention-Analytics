# Business Insights

The following findings are based on the cleaned IBM Telco Customer Churn dataset and the figures represented in the project dashboard.

## 1. Overall Churn and Retention
- The dataset contains 7,043 customers.
- 1,869 customers are marked as churned and 5,174 as retained.
- Overall churn rate is 26.54%; retention rate is 73.46%.

**Business interpretation:** Approximately one in four customers in this snapshot has churned. This provides a clear baseline for monitoring churn-related customer segments.

## 2. Contract Type
Observed churn rates:
- Month-to-month: 42.71%.
- One year: 11.27%.
- Two year: 2.83%.

**Business interpretation:** Month-to-month customers have a substantially higher observed churn rate than customers on longer contracts. The business could investigate whether onboarding, service experience, pricing communication, or suitable contract incentives would improve retention. These results show association, not proof that contract length causes churn.

## 3. Tenure Groups
Observed churn rates by tenure:
- 0–12 months: 47.4% (2,186 customers).
- 13–24 months: 28.7% (1,024 customers).
- 25–48 months: 20.4% (1,594 customers).
- 49+ months: 9.5% (2,239 customers).

**Business interpretation:** Churn is highest among customers with 0–12 months of tenure and decreases across the longer-tenure groups. Early customer experience and onboarding are sensible areas for further investigation.

## 4. Payment Method
Observed churn rates:
- Electronic check: 45.29%.
- Mailed check: 19.11%.
- Bank transfer (automatic): 16.71%.
- Credit card (automatic): 15.24%.

**Business interpretation:** Customers using electronic checks show the highest observed churn rate among the displayed payment categories. The business could examine payment friction and offer convenient automatic payment options, while avoiding assumptions that payment method itself causes churn.

## 5. Monthly Charges
- Average monthly charges for churned customers: $74.44.
- Average monthly charges for retained customers: $61.27.

**Business interpretation:** Churned customers have higher average monthly charges in this dataset. Further analysis by service combination, contract, and tenure could help determine whether higher bills are concentrated in particular customer groups.

## 6. Monthly Charges Associated with Churn
- Monthly charges associated with churned customers: $139,130.85.
- Share of total monthly charges represented by churned customers: 30.50%.

**Business interpretation:** This amount represents the sum of the current monthly charges recorded for customers labelled as churned. It is not a forecast of future revenue loss, nor a verified recurring-revenue impact estimate.

## 7. Internet Service Mix
The dashboard compares customer mix and churn status across Fiber optic, DSL, and No internet service categories.

**Business interpretation:** Use this visual to identify service categories that merit deeper investigation. Validate the underlying category counts and churn-rate calculations before making service-specific business decisions.

## Recommended Areas for Further Investigation
1. Review the first-year customer journey and identify common reasons for early churn.
2. Investigate the high churn rate among month-to-month customers.
3. Examine the electronic-check segment for billing or payment friction.
4. Compare monthly charges with contract type and service combinations.
5. Validate findings with customer feedback and more recent operational data before implementing retention interventions.

## Interpretation Caution
These are descriptive findings from a cross-sectional customer snapshot. They identify patterns and potential investigation areas; they do not establish causation, predict which individual customer will churn, or measure historical monthly cohort retention.
