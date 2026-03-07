# Delivery Delay Impact on Returns

## Business Question
Do delivery delays influence product return behavior?

Delivery performance plays an important role in customer satisfaction. Late deliveries may result in dissatisfaction among customers and increase the likelihood of customers returning their orders. This analysis explores whether delayed deliveries are associated with higher return rates.

---

## Hypothesis
Orders delivered late are more likely to be returned than orders delivered on time.

---

## Approach

To analyze this, the goal was to create a dataset with the following structure:

| order_id | delivery_status | returned |
|----------|----------------|---------|

Steps followed:

1. Determine whether an order was **late or on time** by comparing `delivery_date` and `promised_date`.
2. Identify whether the order was **returned** using the `returns` table.
3. Combine this information at the **order level**.

A view named **`order_status`** was created to consolidate the delivery status and return information.

A **LEFT JOIN** was used when joining the returns table because the analysis operates at the **order grain**, and every order may not be returned.

---

## Analysis

The return rate for each delivery category was calculated using:

Return Rate = (Total Returned Orders / Total Orders) × 100

---

## Result

| delivery_status | return_rate |
|----------------|------------|
| on_time | 0.00% |
| late | 100.00% |

---

## Insight

Every late delivered ordered was returned in this dataset.

This suggests that delivery delays may negatively impact customer satisfaction and increase the likelihood of product returns.
