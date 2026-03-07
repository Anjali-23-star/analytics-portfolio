# Product Category Return Analysis

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
