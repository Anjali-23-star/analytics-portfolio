-- According to our schema, each product is categorized into a category of furniture/electronics etc.
-- I started with a suspicion. What are the categories that are returned the most? I picked up furniture.

HYPOTHESIS: Products belonging to furniture category are returned most.
APPROACH: 
  I asked a simple question: Is return rate for furniture higher than others?

  For that, I need category of each of the ordered product and check if its returned or not.
  My schmea ought to look like:

================================================================
| Orderid | product_name | category | Delivered | Returned |
================================================================

Now, the delivered status is given in shipments table and returned status is in returns table. I simply joined and extracted
the needed information. It is to be noted that while joining returns table, I came to realize that I have to join it based on
both the product id and the order to which the product belongs.

QUERY:

CREATE VIEW return_data AS
		                  SELECT
                            oi.order_id,
      		                  p.product_name,
      		                  p.category,
                            CASE 
      			                WHEN s.delivery_status = 'Delivered' THEN 'Yes'
                            ELSE 'No'
      		                  END AS delivered,
                            CASE 
      			                WHEN r.return_date IS NOT NULL THEN 'Yes'
                            ELSE 'No'
      		                  END AS returned
                		FROM order_items oi
                		INNER JOIN products p
		                ON oi.product_id = p.product_id
                    LEFT JOIN shipments s 
                    ON oi.order_id = s.order_id
		                LEFT JOIN returns r
		                ON oi.product_id = r.product_id
                    AND oi.order_id = r.order_id;

Finally, I checked out of the total delivered product of the respective category, how many were returned?
Total returned/Total delivered for each category.

                     SELECT 
                           category,
                           SUM(CASE
                    	     WHEN delivered = 'Yes' THEN 1
                           ELSE 0
                           END) AS total_delivered_orders,
                           SUM(CASE
                           WHEN returned = 'Yes' THEN 1
                           ELSE 0
                           END) AS total_returned,
                          CONCAT(ROUND(SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END)/SUM(CASE WHEN delivered = 'Yes' THEN 1 ELSE 0 END)*100, 0), '%') AS return_rate
                     FROM return_data
                     GROUP BY category;

RESULT SET:
-------------------------------------------------------------------
| category | total_delivered_orders | total_returned | return_rate |
--------------------------------------------------------------------  
Electronics	            3                	1	             33%
Furniture	              2               	1	             50%
-------------------------------------------------------------------

INSIGHT:
The results concluded the hypothesis. Out of the total furntiure shipped, 50% were returned. Meanwhile, Electronics return rate is just 33%.
