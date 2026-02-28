-- This part is the core of our business- How our products are performing. Do prices have an influence on the return rate and disatisfaction among customers?

/*=======================================================================
HYPOTHESIS: Cheap products have more return rate.

APPROACH: We don't measure each indiviudual product, instead we categorize the products based on the prices. Once the prices are bucketed, the influence of price on 
our business can be understood.

The structure of my table ready for analysis should look like:
| product_id | price | median_value | price_band |
