-- Customers data.
CREATE TABLE customers(
	                    customer_id INT PRIMARY KEY,
                      customer_name VARCHAR(100),
                      region VARCHAR(50),
                      signup_date DATE
                     );

-- Our business products.
CREATE TABLE products(
                    	product_id INT PRIMARY KEY,
                    	product_name VARCHAR(100),
                    	category VARCHAR(50),
                    	price DECIMAL(10, 2)
                      );

-- Order details including promised date, actual delivery date and discount.
CREATE TABLE orders(
                    	order_id INT PRIMARY KEY,
                    	customer_id INT,
                    	order_date DATE,
                    	promised_date DATE,
                    	delivery_date DATE,
                    	shipping_cost DECIMAL(10, 2),
                    	discount DECIMAL(10, 2),
                    
                    	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
                    );

-- The product and quantity for each of the order.
CREATE TABLE order_items(
                    	order_item_id INT PRIMARY KEY,
                    	order_id INT,
                    	product_id INT,
                    	quantity INT,
                    
                    	FOREIGN KEY (order_id) REFERENCES orders(order_id),
                    	FOREIGN KEY (product_id) REFERENCES products(product_id)
                    );

-- Payment details.
CREATE TABLE payments(
                    	payment_id INT PRIMARY KEY,
                    	order_id INT,
                    	payment_date DATE,
                    	payment_method VARCHAR(50),
                    	amount DECIMAL(10, 2),
                    
                    	FOREIGN KEY (order_id) REFERENCES orders(order_id)
                    );

-- Shipment detail for each order.
CREATE TABLE shipments(
                    	shipment_id INT PRIMARY KEY,
                    	order_id INT,
                    	dispatch_date DATE,
                    	delivery_status VARCHAR(50),
                    
                      FOREIGN KEY (order_id) REFERENCES orders(order_id)
                     );

-- Return information : Which order itmes are returned and why.
CREATE TABLE returns(
                      return_id INT PRIMARY KEY,
                      order_id INT,
                      product_id INT,
                      return_date DATE,
                      return_reason VARCHAR(100),
                      
                      FOREIGN KEY (order_id) REFERENCES orders(order_id),
                      FOREIGN KEY (product_id) REFERENCES products(product_id)
                     );
