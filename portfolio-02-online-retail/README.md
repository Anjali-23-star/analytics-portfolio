## Objective
We analyse how Top 20% customers are constributing to the company revenue.

## Dataset
Online retail dataset(Kaggle) containing Invoice No, Stock code, Description, Quantity, Invoice Date, Unit price, Customer ID, country.

## Key Questions
1. Distribution of revenue amongst customers.
2. Analyse if revenue is disproportionately distributed with some segment of customers leading to major proportion of revenue.
3. What factors explain this concentration (order, frequency, quantity, pricing)?

## Approach
- Computed revenue at the transactional level.
- Compute total revenue for each customer.
- Rank customers by total revenue using Window functions.
- Segmented customers into top 20%.

## Key findings
- The revenue is distributed unevenly with top segment of customers responsible for most of the revenue.
- The highest revenue customer alone generates ~26% revenue.


## Business Implications
- The business is exposed to churn risk if top customers are lost.
- Retention strategies for high-value customers are critical.
