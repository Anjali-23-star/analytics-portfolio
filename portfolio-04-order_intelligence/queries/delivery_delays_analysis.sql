-- In this part, I was curious about the effect of delivery delays on consumer behaviour. I came up with a simple question:
-- Are late deliveries more likely to be returned thus causing disatisfaction to customers?

/*
============================================================================================
HYPOTHESIS: Late deliveries are returned most.

APPROACH: The idea of how my table should look like was this:

========================================================
| order_id | delivery_status | returned |
========================================================

The goal was to first segment the orders if they are late or on time, and conclude their return status. 
These values are obtained with the help of promised_date information and delivery_date information.
  
So, keeping this mental model in mind, I created a view named order_status.
I used LEFT JOIN because I am operating at order grain.
===============================================================================================
*/

-- CREATING VIEW
CREATE VIEW order_status AS
SELECT 
      o.order_id,

      CASE
      WHEN delivery_date > promised_date THEN 'late'
      ELSE 'on_time'
      END AS delivery_status,

      CASE 
      WHEN r.return_id IS NULL THEN 0
      ELSE 1
      END AS returned

FROM
orders o
LEFT JOIN returns r
ON o.order_id = r.order_id;

/*
===============================================
The result of this view is:
===============================================
| order_id | delivery_status | returned |
   1001       	on_time	          0
===============================================

Next step is to simply compute the how many of the late orders are returned
and how many on time orders are returned.
*/

SELECT 
	  delivery_status,
	  ROUND(SUM(returned) *100.0/ COUNT(order_id), 2) AS return_rate
FROM
order_status
GROUP BY delivery_status;


/*
======================================================================================
RESULT:
The result confirmed my hypotheis. In this dataset, the late orders returned rate is 100%.

==============================================
| delivery_status | return_rate |
     on_time            0.00
     late              100.00
==============================================*/

/*
=====================================================================================
INSIGHT: 

Late deliveries were significantly more likely to be returned in this dataset.
This may indicate customer disatisfaction.
====================================================================================*/
