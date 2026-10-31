# Customer Churn Dataset

## Overview

This folder contains the IBM Telco Customer Churn dataset used for customer churn and retention analytics.

The dataset helps analyse customer behaviour, identify churn patterns, and understand customer retention.

## Dataset Information

- **Total Records:** 7,043
- **Total Columns:** 21
- **Target Variable:** Churn
- **Dataset Type:** Customer-level snapshot

## Files Included

**1. telco_customer_churn_cleaned.csv**

Cleaned dataset used for SQL analysis and dashboard development.

**2. telco_customer_churn_raw.csv**

Original IBM Telco Customer Churn dataset.

**3. data_dictionary.csv**

Contains descriptions of the dataset columns.

**4. data_quality_report.csv**

Contains data validation results and quality checks.

**5. README_DATASET.md**

Provides dataset information and documentation.

## Data Quality Summary

- Exact duplicate rows: 0
- Duplicate customer IDs: 0
- Missing TotalCharges values: 11
- Negative MonthlyCharges: 0
- Customers with zero tenure: 11

The 11 missing TotalCharges values were retained as missing values. No artificial values were inserted.

## Project Objective

To analyse customer churn behaviour, identify retention patterns, understand factors associated with customer churn, and generate actionable business insights.
