-- This part is the core of our business- How our products are performing. Do prices have an influence on the return rate and disatisfaction among customers?

/*=======================================================================
HYPOTHESIS: Cheap products have more return rate.

APPROACH: We don't measure each indiviudual product, instead we categorize the products based on the prices. Once the prices are bucketed, the influence of price on 
our business can be understood.

The structure of my table ready for analysis should look like:
=====================================================
| product_id | price | median_value | price_band |
=====================================================

Our task first is to find the median. And then assigning the product price band relative to the median.

This follows in consecutive steps where I first create a view consisting of ordering the products from the lowest to the highest price
after which we will calculate median. Also, since I want to retain the row level details, I used the window function where product price
will be listed in ascending order and also, total product count.

==============================================================================*/

QUERY:
      CREATE VIEW assign_rows AS
	                              SELECT 
                                      oi.order_id,
                                      p.product_id,
                                      p.product_name,
                                      p.price,
                                      r.return_id,
                                  	  ROW_NUMBER() OVER(ORDER BY price) AS row_rank,
                                      COUNT(*) OVER() AS total_count
                                FROM products p
                                LEFT JOIN order_items oi 
                                ON p.product_id = oi.product_id
                                LEFT JOIN returns r 
                                ON r.order_id = oi.order_id
                                AND r.product_id = oi.product_id;

/*=================================================================================
LEFT JOIN is used because for this analysis, our priority is Products table.

The result of the view is as:
====================================================================================
| orderid | product_id | product_name | price | return_id | row_rank | total_count |
====================================================================================

Because we are interested in return rate of orders, it is important to have an associateion
of each product with its corresponding order.

Next comes the crucial step. To find the median. We create a separate view for it.
The idea is simple. We already have our price in ascending order. 
If count % 2 == 1 (odd)
  => row_rank = count+1/2
else
=> row_rank = count/2, count+1/2.

We want to filer our rows based on the parity of count, after which we just simply do the 
average.
=====================================================================================*/

QUERY:
       -- Finding the median.
        CREATE VIEW median_price AS
        		                        SELECT 
                                          ROUND(AVG(price), 2) AS median
        		                        FROM assign_rows
        		                        WHERE (total_count % 2 = 1
        		                        AND row_rank = (total_count+1)/2)
        		                        OR
        		                        (total_count % 2 = 0
        		                        AND row_rank IN (total_count/2, total_count/2 + 1));

/*=======================================================================================
The result of the query is as:
=============================
| median |
  8000.00

Now that we have our median, our next step is to categorize product based on this. 
If price>= median_price  then its a 'Premium' product.
  else its a 'Cheap' product.

Every product has same median value so I have use Cross join.
=======================================================================================*/

QUERY:
      CREATE VIEW product_type AS
		                            SELECT
                                  		order_id,
                                  		product_name,
                                  		price,
                                  		return_id,
                                  		m.median,
                                  		CASE
                                  		WHEN price >= m.median THEN 'Premium'
                                  		ELSE 'Cheap'
                                  		END AS type
                                FROM assign_rows
                                CROSS JOIN median_price m;

/*============================================================================
RESULT:

| order_id | product_name | price | return_id | median | type |

Our last step is to calculate the return rate of products based on this
categorization.
===============================================================================*/

QUERY:
      SELECT  
            (SUM(CASE WHEN type = 'Cheap' AND return_id IS NOT NULL THEN 1 END)/NULLIF(SUM(CASE WHEN type = 'Cheap' THEN 1 END), 0)*100) AS cheap_return_percent,
            (SUM(CASE WHEN type = 'Premium' AND return_id IS NOT NULL THEN 1 END)/NULLIF(SUM(CASE WHEN type = 'Premium' THEN 1 END), 0)*100) AS premium_return_percent
      FROM product_type;

/*=================================================================================
Result:
| cheap_return_percent | premium_return_percent |
       100.0000	              NULL

This indicates that the return percent of our cheap products are 100%. This may be attributed to customer disatisfaction with product quality
or customer buying behaviour.
=================================================================================*/
