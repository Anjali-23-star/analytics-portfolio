# :Products Product Category Return Analysis

## Business Question
Which product category has the highest return rate?

Product returns can indicate issues with product quality, delivery handling, or customer expectations.  
This analysis investigates whether certain product categories experience higher return rates than others.

---

## Hypothesis
Furniture products are returned more frequently than others.

---

## Approach 

To test this hypothesis, the goal was to create a dataset with the following structure:

| order_id | product_name | category | delivered | returned |

Steps followed:

1. Retrieved the **category and product information** from the `products` table.
2. Identify whether the product was **delivered** using the `shipments` table.
3. Identify whether the product was **returned** using the `returns` table.
4. Join the tables to construct a dataset at the **order-item level**.

A view named **`return_data`** was created to consolidate this information.

One important observation during the join was that the **returns table must be joined using both `product_id` and `order_id`**, since a product may appear in multiple orders.

--- 

## Analysis

The return rate was calculated as:

Return Rate = (Total Returned/Total Delivered) X 100

This was computed for each product category.

---

## Result
| category | total_delivered_orders | total_returned | return_rate |
|----------|-----------------------|---------------|-------------|
| Electronics | 3 | 1 | 33% |
| Furniture | 2 | 1 | 50% |

---

## Insight

Furniture products showed the highest return rate in this dataset, with **50% of delivered items being returned**, compared to **33% for electronics**.
This may suggest potential issues such as product expectations, delivery handling or product quality.
