# 💰 Price Sensitivity & Product Return Analysis

## 🔍 Business Question
Do product prices influence return behavior?

Product pricing can influence customer expectations and satisfaction.  
This analysis explores whether lower-priced products experience higher return rates compared to premium products.

---

## 🧠 Hypothesis
Lower-priced products ("Cheap") have a higher return rate than premium products.

---

## 📊 Approach

Instead of analyzing each product individually, products were grouped into **price bands** relative to the **median price**.

The analytical dataset was designed with the following structure:

| product_id | price | median_value | price_band |

The analysis was carried out in three stages:

### 1️⃣ Prepare product-level dataset
A view was created that:
- orders products by price
- assigns a **row rank**
- captures the **total number of products**

This allows the median price to be computed.

### 2️⃣ Compute median price
The median price was calculated by:
- identifying the middle row when the number of products is odd
- averaging the two middle rows when the number of products is even

The median price obtained from the dataset was:

| median |
|------|
| 8000 |

### 3️⃣ Categorize products by price band
Products were categorized into two groups:

- **Premium** → price ≥ median  
- **Cheap** → price < median  

This classification enabled analysis of return behavior across pricing tiers.

---

## 📈 Analysis

Return rates were calculated separately for:

- Cheap products
- Premium products

Return Rate = Returned Products / Total Products

---

## 📊 Result

| cheap_return_percent | premium_return_percent |
|---------------------|-----------------------|
| 100% | NULL |

---

## 💡 Insight

All returned products in this dataset belonged to the **Cheap price band**, resulting in a **100% return rate for lower-priced products**.

This may indicate potential issues such as:
- product quality concerns
- unmet customer expectations
- purchasing behavior associated with low-cost products.
