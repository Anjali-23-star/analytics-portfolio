INSERT INTO customers VALUES
                          (1, 'Amit Sharma', 'North', '2023-01-10'),
                          (2, 'Neha Verma', 'West', '2023-02-15'),
                          (3, 'Rohit Mehta', 'South', '2023-03-05'),
                          (4, 'Sneha Iyer', 'East', '2023-04-12'),
                          (5, 'Arjun Kapoor', 'North', '2023-05-20');


INSERT INTO products VALUES
                            (101, 'Laptop', 'Electronics', 60000),
                            (102, 'Headphones', 'Electronics', 2000),
                            (103, 'Office Chair', 'Furniture', 8000),
                            (104, 'Desk Lamp', 'Furniture', 1500),
                            (105, 'Smartphone', 'Electronics', 30000);


INSERT INTO orders VALUES
                          (1001, 1, '2023-06-01', '2023-06-05', '2023-06-04', 200, 1000),
                          (1002, 2, '2023-06-03', '2023-06-07', '2023-06-10', 300, 500),
                          (1003, 3, '2023-06-05', '2023-06-09', '2023-06-08', 150, 0),
                          (1004, 4, '2023-06-07', '2023-06-11', '2023-06-15', 400, 2000),
                          (1005, 5, '2023-06-09', '2023-06-13', '2023-06-12', 250, 1500);


INSERT INTO order_items VALUES
                            (1, 1001, 101, 1),
                            (2, 1002, 102, 2),
                            (3, 1003, 103, 1),
                            (4, 1004, 104, 3),
                            (5, 1005, 105, 1);


INSERT INTO payments VALUES
                            (1, 1001, '2023-06-01', 'Credit Card', 59000),
                            (2, 1002, '2023-06-03', 'UPI', 3500),
                            (3, 1003, '2023-06-05', 'Debit Card', 8000),
                            (4, 1004, '2023-06-07', 'Credit Card', 2500),
                            (5, 1005, '2023-06-09', 'UPI', 28500);


INSERT INTO shipments VALUES
                            (1, 1001, '2023-06-02', 'Delivered'),
                            (2, 1002, '2023-06-04', 'Delivered'),
                            (3, 1003, '2023-06-06', 'Delivered'),
                            (4, 1004, '2023-06-08', 'Delivered'),
                            (5, 1005, '2023-06-10', 'Delivered');


INSERT INTO returns VALUES
                            (1, 1002, 102, '2023-06-12', 'Damaged'),
                            (2, 1004, 104, '2023-06-18', 'Not Needed');
