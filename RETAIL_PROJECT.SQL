CREATE TABLE categories1 (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50)  NOT NULL,
    parent_id     INT          NULL,          -- NULL = top-level category (self-referential)
    created_at    DATE         NOT NULL
);

);

INSERT ALL
  INTO categories1 VALUES (1, 'Electronics', NULL, DATE '2019-01-15')
  INTO categories1 VALUES (2, 'Mobiles', 1, DATE '2019-01-15')
  INTO categories1 VALUES (3, 'Laptops', 1, DATE '2019-03-10')
  INTO categories1 VALUES (4, 'Clothing', NULL, DATE '2019-06-01')
  INTO categories1 VALUES (5, 'Men''s Wear', 4, DATE '2019-06-01')
  INTO categories1 VALUES (6, 'Women''s Wear', 4, DATE '2020-02-14')
  INTO categories1 VALUES (7, 'Home_Kitchen', NULL, DATE '2020-05-20')
  INTO categories1 VALUES (8, 'Furniture', 7, DATE '2020-05-20')
  INTO categories1 VALUES (9, 'Appliances', 7, DATE '2021-01-10')
  INTO categories1 VALUES (10, 'Books', NULL, DATE '2019-09-01')
  INTO categories1 VALUES (11, 'Fiction', 10, DATE '2019-09-01')
  INTO categories1 VALUES (12, 'Non-Fiction', 10, DATE '2020-07-15')
  INTO categories1 VALUES (13, 'Sports', NULL, DATE '2021-03-01')
  INTO categories1 VALUES (14, 'Outdoor Sports', 13, DATE '2021-03-01')
  INTO categories1 VALUES (15, 'Fitness', 13, DATE '2022-01-05')
  INTO categories1 VALUES (16, 'Beauty', NULL, DATE '2022-04-10')
  INTO categories1 VALUES (17, 'Skincare', 16, DATE '2022-04-10')
  INTO categories1 VALUES (18, 'Haircare', 16, DATE '2023-02-20')
  INTO categories1 VALUES (19, 'Toys', NULL, DATE '2023-06-15')
  INTO categories1 VALUES (20, 'Grocery', NULL, DATE '2024-01-01')
SELECT * FROM dual;


SELECT *
FROM CATEGORIES1

---PRODUCTS 

CREATE TABLE products1 (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR2(100) NOT NULL,
    category_id   NUMBER NOT NULL,
    price         DECIMAL(10,2) NOT NULL,
    cost_price    DECIMAL(10,2) NULL,          -- NULL = cost data unavailable for older SKUs
    stock_qty     INT          DEFAULT 0 NOT NULL,
    launch_date   DATE         NOT NULL,
    discontinued  CHAR(1)     DEFAULT 'N' NOT NULL,
    
    CONSTRAINT P_FK FOREIGN KEY( category_id) REFERENCES CATEGORIES1(CATEGORY_ID)
    
);

INSERT ALL
  INTO products1 VALUES (1, 'Samsung Galaxy S21', 2, 69999, 45000, 150, DATE '2021-02-15', 0)
  INTO products1 VALUES (2, 'Apple iPhone 14', 2, 109999, 72000, 80, DATE '2022-09-16', 0)
  INTO products1 VALUES (3, 'OnePlus Nord CE 3', 2, 24999, 15000, 300, DATE '2023-07-05', 0)
  INTO products1 VALUES (4, 'Dell XPS 15', 3, 149999, 98000, 40, DATE '2020-11-01', 0)
  INTO products1 VALUES (5, 'MacBook Air M2', 3, 114900, 75000, 60, DATE '2022-06-24', 0)
  INTO products1 VALUES (6, 'Lenovo IdeaPad 3', 3, 45999, NULL, 200, DATE '2019-08-10', 0)
  INTO products1 VALUES (7, 'Levi''s 511 Slim Jeans', 5, 3999, 1800, 500, DATE '2019-04-01', 0)
  INTO products1 VALUES (8, 'Nike Dri-FIT T-Shirt', 5, 1999, 900, 800, DATE '2020-03-15', 0)
  INTO products1 VALUES (9, 'Zara Floral Dress', 6, 4599, 2100, 350, DATE '2021-05-10', 0)
  INTO products1 VALUES (10, 'IKEA KALLAX Shelf', 8, 7999, 4500, 90, DATE '2020-09-01', 0)
  INTO products1 VALUES (11, 'Philips Air Fryer', 9, 7499, 4200, 120, DATE '2022-10-10', 0)
  INTO products1 VALUES (12, 'The Alchemist (Book)', 11, 299, 80, 9999, DATE '2019-01-01', 0)
  INTO products1 VALUES (13, 'Atomic Habits', 12, 499, 120, 5000, DATE '2019-10-01', 0)
  INTO products1 VALUES (14, 'Adidas Running Shoes', 14, 6999, 3500, 400, DATE '2021-07-20', 0)
  INTO products1 VALUES (15, 'Yoga Mat Premium', 15, 1499, 600, 700, DATE '2022-03-01', 0)
  INTO products1 VALUES (16, 'Neutrogena Moisturizer', 17, 799, 300, 1200, DATE '2023-01-15', 0)
  INTO products1 VALUES (17, 'Dyson Hair Dryer', 18, 35999, 22000, 30, DATE '2023-08-01', 0)
  INTO products1 VALUES (18, 'LEGO Classic Set', 19, 3499, 1700, 600, DATE '2022-12-01', 0)
  INTO products1 VALUES (19, 'Tata Salt 1kg', 20, 28, 15, 9999, DATE '2019-01-01', 0)
  INTO products1 VALUES (20, 'Nokia 3310 (2G)', 2, 3499, NULL, 0, DATE '2019-06-01', 1)
SELECT * FROM dual;



CREATE TABLE customers11 (
    customer_id   NUMBER,
    first_name    VARCHAR2(50)  NOT NULL,
    last_name     VARCHAR2(50)  NOT NULL,
    email         VARCHAR2(100),
    phone         VARCHAR2(15)  NOT NULL,
    city          VARCHAR2(50)  NOT NULL,
    state         VARCHAR2(50)  NOT NULL,
    signup_date   DATE          NOT NULL,
    segment       VARCHAR2(20)  NOT NULL,
    referral_code VARCHAR2(20),

    CONSTRAINT pk_customers PRIMARY KEY (customer_id),
    CONSTRAINT chk_segment 
        CHECK (segment IN ('Premium','Regular','New'))
);

INSERT ALL
  INTO customers11 VALUES (1, 'Aarav', 'Shah', 'aarav.shah@gmail.com', '9876543210', 'Mumbai', 'Maharashtra', DATE '2019-03-10', 'Premium', 'REF001')
  INTO customers11 VALUES (2, 'Priya', 'Mehta', 'priya.mehta@yahoo.com', '9845012345', 'Bangalore', 'Karnataka', DATE '2019-07-22', 'Premium', NULL)
  INTO customers11 VALUES (3, 'Rohan', 'Verma', NULL, '9711122233', 'Delhi', 'Delhi', DATE '2020-01-05', 'Regular', NULL)
  INTO customers11 VALUES (4, 'Sneha', 'Iyer', 'sneha.iyer@outlook.com', '8899001122', 'Chennai', 'Tamil Nadu', DATE '2020-06-15', 'Regular', 'REF002')
  INTO customers11 VALUES (5, 'Kiran', 'Rao', 'kiran.rao@gmail.com', '9988776655', 'Hyderabad', 'Telangana', DATE '2020-11-30', 'New', NULL)
  INTO customers11 VALUES (6, 'Vikram', 'Singh', 'vikram.s@gmail.com', '9001122334', 'Pune', 'Maharashtra', DATE '2021-02-14', 'Regular', 'REF003')
  INTO customers11 VALUES (7, 'Ananya', 'Gupta', NULL, '8765432109', 'Kolkata', 'West Bengal', DATE '2021-05-20', 'New', NULL)
  INTO customers11 VALUES (8, 'Arjun', 'Nair', 'arjun.nair@gmail.com', '9123456780', 'Kochi', 'Kerala', DATE '2021-08-08', 'Premium', 'REF001')
  INTO customers11 VALUES (9, 'Pooja', 'Sharma', 'pooja.s@hotmail.com', '9876012345', 'Jaipur', 'Rajasthan', DATE '2022-01-11', 'Regular', NULL)
  INTO customers11 VALUES (10, 'Rahul', 'Kumar', 'rahul.k@gmail.com', '9012345678', 'Lucknow', 'Uttar Pradesh', DATE '2022-03-22', 'New', 'REF004')
  INTO customers11 VALUES (11, 'Divya', 'Pillai', 'divya.p@gmail.com', '8800990011', 'Coimbatore', 'Tamil Nadu', DATE '2022-07-19', 'Regular', NULL)
  INTO customers11 VALUES (12, 'Nikhil', 'Joshi', NULL, '9911223344', 'Ahmedabad', 'Gujarat', DATE '2022-10-05', 'New', NULL)
  INTO customers11 VALUES (13, 'Meera', 'Reddy', 'meera.r@gmail.com', '9867453210', 'Vijayawada', 'Andhra Pradesh', DATE '2023-01-01', 'Premium', 'REF002')
  INTO customers11 VALUES (14, 'Siddharth', 'Chopra', 'sid.c@gmail.com', '9754321098', 'Chandigarh', 'Punjab', DATE '2023-04-17', 'Regular', NULL)
  INTO customers11 VALUES (15, 'Lakshmi', 'Venkat', 'lakshmi.v@yahoo.com', '9632541870', 'Mysore', 'Karnataka', DATE '2023-07-30', 'New', 'REF005')
  INTO customers11 VALUES (16, 'Abhishek', 'Pandey', 'abhi.p@gmail.com', '9871234560', 'Patna', 'Bihar', DATE '2023-09-09', 'New', NULL)
  INTO customers11 VALUES (17, 'Isha', 'Malhotra', NULL, '8741236540', 'Surat', 'Gujarat', DATE '2023-11-23', 'New', NULL)
  INTO customers11 VALUES (18, 'Tushar', 'Bansal', 'tushar.b@gmail.com', '9090909090', 'Nagpur', 'Maharashtra', DATE '2024-01-15', 'New', 'REF006')
  INTO customers11 VALUES (19, 'Nandini', 'Krishnan', 'nandini.k@gmail.com', '9181818181', 'Bhopal', 'Madhya Pradesh', DATE '2024-03-01', 'Regular', 'REF003')
  INTO customers11 VALUES (20, 'Gaurav', 'Tiwari', 'gaurav.t@outlook.com', '9272727272', 'Indore', 'Madhya Pradesh', DATE '2024-04-20', 'New', NULL)
SELECT * FROM dual;



CREATE TABLE orders11 (
    order_id        NUMBER,
    customer_id     NUMBER NOT NULL,
    order_date      TIMESTAMP NOT NULL,
    status          VARCHAR2(20) NOT NULL,
    shipping_city   VARCHAR2(50) NOT NULL,
    coupon_code     VARCHAR2(20),
    discount_amt    NUMBER(10,2) DEFAULT 0 NOT NULL,
    shipping_amt    NUMBER(10,2) DEFAULT 0 NOT NULL,
    estimated_del   DATE,

    CONSTRAINT pk_orders11 PRIMARY KEY (order_id),

    CONSTRAINT fk_orders_customer11
        FOREIGN KEY (customer_id)
        REFERENCES customers11(customer_id),

    CONSTRAINT chk_order_status11
        CHECK (status IN ('Placed','Processing','Shipped','Delivered','Cancelled'))
);


INSERT ALL
  INTO orders11 VALUES (1001, 1, TIMESTAMP '2019-11-10 10:30:00', 'Delivered', 'Mumbai', 'SAVE10', 500, 0, DATE '2019-11-15')
  INTO orders11 VALUES (1002, 2, TIMESTAMP '2020-01-25 14:15:00', 'Delivered', 'Bangalore', NULL, 0, 99, DATE '2020-01-30')
  INTO orders11 VALUES (1003, 3, TIMESTAMP '2020-05-02 09:00:00', 'Delivered', 'Delhi', 'FLAT200', 200, 0, DATE '2020-05-08')
  INTO orders11 VALUES (1004, 4, TIMESTAMP '2020-08-18 18:45:00', 'Cancelled', 'Chennai', NULL, 0, 49, NULL)
  INTO orders11 VALUES (1005, 1, TIMESTAMP '2021-01-14 11:00:00', 'Delivered', 'Mumbai', 'NEWYEAR', 300, 0, DATE '2021-01-20')
  INTO orders11 VALUES (1006, 5, TIMESTAMP '2021-03-08 16:20:00', 'Delivered', 'Hyderabad', NULL, 0, 99, DATE '2021-03-14')
  INTO orders11 VALUES (1007, 6, TIMESTAMP '2021-07-19 12:00:00', 'Delivered', 'Pune', 'SAVE10', 150, 0, DATE '2021-07-25')
  INTO orders11 VALUES (1008, 2, TIMESTAMP '2021-09-05 09:30:00', 'Cancelled', 'Bangalore', NULL, 0, 0, NULL)
  INTO orders11 VALUES (1009, 7, TIMESTAMP '2021-12-24 20:00:00', 'Delivered', 'Kolkata', 'XMAS50', 50, 0, DATE '2021-12-29')
  INTO orders11 VALUES (1010, 8, TIMESTAMP '2022-02-14 10:00:00', 'Delivered', 'Kochi', NULL, 0, 99, DATE '2022-02-20')
  INTO orders11 VALUES (1011, 3, TIMESTAMP '2022-05-10 13:45:00', 'Shipped', 'Delhi', NULL, 0, 49, DATE '2022-05-16')
  INTO orders11 VALUES (1012, 9, TIMESTAMP '2022-08-01 15:00:00', 'Delivered', 'Jaipur', 'FLAT200', 200, 0, DATE '2022-08-07')
  INTO orders11 VALUES (1013, 10, TIMESTAMP '2022-10-18 08:00:00', 'Delivered', 'Lucknow', NULL, 0, 99, DATE '2022-10-24')
  INTO orders11 VALUES (1014, 11, TIMESTAMP '2023-01-05 17:30:00', 'Delivered', 'Coimbatore', 'SAVE10', 400, 0, DATE '2023-01-11')
  INTO orders11 VALUES (1015, 13, TIMESTAMP '2023-03-22 11:15:00', 'Processing', 'Vijayawada', NULL, 0, 49, NULL)
  INTO orders11 VALUES (1016, 4, TIMESTAMP '2023-06-10 14:00:00', 'Delivered', 'Chennai', 'SUMMER20', 800, 0, DATE '2023-06-16')
  INTO orders11 VALUES (1017, 1, TIMESTAMP '2023-09-15 10:00:00', 'Delivered', 'Mumbai', NULL, 0, 0, DATE '2023-09-21')
  INTO orders11 VALUES (1018, 14, TIMESTAMP '2023-11-11 00:00:00', 'Delivered', 'Chandigarh', 'SALE11', 2000, 0, DATE '2023-11-17')
  INTO orders11 VALUES (1019, 2, TIMESTAMP '2024-01-20 09:45:00', 'Placed', 'Bangalore', NULL, 0, 99, NULL)
  INTO orders11 VALUES (1020, 18, TIMESTAMP '2024-04-25 16:00:00', 'Shipped', 'Nagpur', 'WELCOME', 150, 0, DATE '2024-04-30')
SELECT * FROM dual;





CREATE TABLE order_items11 (
    item_id       NUMBER,
    order_id      NUMBER NOT NULL,
    product_id    NUMBER NOT NULL,
    quantity      NUMBER NOT NULL,
    unit_price    NUMBER(10,2) NOT NULL,
    discount_pct  NUMBER(5,2) DEFAULT 0 NOT NULL,

    CONSTRAINT pk_order_items PRIMARY KEY (item_id),

    CONSTRAINT fk_oi_order
        FOREIGN KEY (order_id)
        REFERENCES orders11(order_id),

    CONSTRAINT fk_oi_product
        FOREIGN KEY (product_id)
        REFERENCES products1(product_id),

    CONSTRAINT chk_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_discount
        CHECK (discount_pct BETWEEN 0 AND 100)
);


INSERT ALL
  INTO order_items11 VALUES (1, 1001, 12, 2, 299, 0)
  INTO order_items11 VALUES (2, 1001, 7, 1, 3999, 10)
  INTO order_items11 VALUES (3, 1002, 4, 1, 149999, 0)
  INTO order_items11 VALUES (4, 1003, 8, 3, 1999, 5)
  INTO order_items11 VALUES (5, 1003, 13, 1, 499, 0)
  INTO order_items11 VALUES (6, 1004, 9, 2, 4599, 0)
  INTO order_items11 VALUES (7, 1005, 1, 1, 69999, 15)
  INTO order_items11 VALUES (8, 1006, 11, 1, 7499, 0)
  INTO order_items11 VALUES (9, 1006, 10, 1, 7999, 0)
  INTO order_items11 VALUES (10, 1007, 15, 2, 1499, 0)
  INTO order_items11 VALUES (11, 1008, 5, 1, 114900, 0)
  INTO order_items11 VALUES (12, 1009, 18, 1, 3499, 5)
  INTO order_items11 VALUES (13, 1010, 2, 1, 109999, 0)
  INTO order_items11 VALUES (14, 1011, 16, 3, 799, 0)
  INTO order_items11 VALUES (15, 1011, 19, 10, 28, 0)
  INTO order_items11 VALUES (16, 1012, 14, 1, 6999, 10)
  INTO order_items11 VALUES (17, 1013, 3, 1, 24999, 5)
  INTO order_items11 VALUES (18, 1014, 6, 1, 45999, 0)
  INTO order_items11 VALUES (19, 1015, 17, 1, 35999, 0)
  INTO order_items11 VALUES (20, 1016, 5, 1, 114900, 20)
  INTO order_items11 VALUES (21, 1016, 11, 2, 7499, 10)
  INTO order_items11 VALUES (22, 1017, 1, 5, 299, 0)
  INTO order_items11 VALUES (23, 1017, 13, 2, 499, 0)
  INTO order_items11 VALUES (24, 1018, 2, 2, 109999, 8)
  INTO order_items11 VALUES (25, 1019, 5, 1, 114900, 0)
  INTO order_items11 VALUES (26, 1020, 16, 4, 799, 0)
  INTO order_items11 VALUES (27, 1020, 15, 1, 1499, 10)
SELECT * FROM dual;




CREATE TABLE payments11 (
    payment_id     NUMBER,
    order_id       NUMBER NOT NULL,
    payment_date   TIMESTAMP,
    amount         NUMBER(10,2) NOT NULL,
    method         VARCHAR2(20) NOT NULL,
    status         VARCHAR2(20) NOT NULL,
    gateway_ref    VARCHAR2(50),

    CONSTRAINT pk_payments11 PRIMARY KEY (payment_id),

    CONSTRAINT fk_payments_order11
        FOREIGN KEY (order_id)
        REFERENCES orders11(order_id),

    CONSTRAINT chk_payment_method11
        CHECK (method IN ('Credit Card','Debit Card','UPI','Net Banking','COD','Wallet')),

    CONSTRAINT chk_payment_status11
        CHECK (status IN ('Success','Failed','Pending','Refunded'))
);



INSERT ALL
  INTO payments11 VALUES (2001, 1001, TIMESTAMP '2019-11-10 10:31:00', 4097, 'UPI', 'Success', 'UPI2019110100A')
  INTO payments11 VALUES (2002, 1002, TIMESTAMP '2020-01-25 14:17:00', 150098, 'Credit Card', 'Success', 'CC2020012500B')
  INTO payments11 VALUES (2003, 1003, TIMESTAMP '2020-05-02 09:02:00', 6092, 'Debit Card', 'Success', 'DC2020050200C')
  INTO payments11 VALUES (2004, 1004, TIMESTAMP '2020-08-18 18:46:00', 8149, 'UPI', 'Refunded', 'UPI2020081800D')
  INTO payments11 VALUES (2005, 1005, TIMESTAMP '2021-01-14 11:03:00', 69399, 'Credit Card', 'Success', 'CC2021011400E')
  INTO payments11 VALUES (2006, 1006, TIMESTAMP '2021-03-08 16:22:00', 15599, 'UPI', 'Success', 'UPI2021030800F')
  INTO payments11 VALUES (2007, 1007, TIMESTAMP '2021-07-19 12:01:00', 2548, 'Wallet', 'Success', 'WL2021071900G')
  INTO payments11 VALUES (2008, 1008, NULL, 114900, 'Credit Card', 'Refunded', NULL)
  INTO payments11 VALUES (2009, 1009, TIMESTAMP '2021-12-24 20:05:00', 3274, 'UPI', 'Success', 'UPI2021122400H')
  INTO payments11 VALUES (2010, 1010, TIMESTAMP '2022-02-14 10:02:00', 110098, 'Credit Card', 'Success', 'CC2022021400I')
  INTO payments11 VALUES (2011, 1011, TIMESTAMP '2022-05-10 13:47:00', 2633, 'COD', 'Pending', NULL)
  INTO payments11 VALUES (2012, 1012, TIMESTAMP '2022-08-01 15:01:00', 6099, 'Net Banking', 'Success', 'NB2022080100J')
  INTO payments11 VALUES (2013, 1013, TIMESTAMP '2022-10-18 08:02:00', 24849, 'UPI', 'Success', 'UPI2022101800K')
  INTO payments11 VALUES (2014, 1014, TIMESTAMP '2023-01-05 17:32:00', 45199, 'Debit Card', 'Success', 'DC2023010500L')
  INTO payments11 VALUES (2015, 1015, NULL, 35999, 'Credit Card', 'Pending', NULL)
  INTO payments11 VALUES (2016, 1016, TIMESTAMP '2023-06-10 14:02:00', 101218, 'Credit Card', 'Success', 'CC2023061000M')
  INTO payments11 VALUES (2017, 1017, TIMESTAMP '2023-09-15 10:01:00', 3491, 'UPI', 'Success', 'UPI2023091500N')
  INTO payments11 VALUES (2018, 1018, TIMESTAMP '2023-11-11 00:03:00', 217998, 'Credit Card', 'Success', 'CC2023111100O')
  INTO payments11 VALUES (2019, 1019, NULL, 114900, 'UPI', 'Pending', NULL)
  INTO payments11 VALUES (2020, 1020, TIMESTAMP '2024-04-25 16:05:00', 4647, 'Wallet', 'Success', 'WL2024042500P')
SELECT * FROM dual;



CREATE TABLE returns11 (
    return_id      NUMBER,
    order_id       NUMBER NOT NULL,
    product_id     NUMBER NOT NULL,
    return_date    DATE NOT NULL,
    reason         VARCHAR2(100) NOT NULL,
    refund_amt     NUMBER(10,2) NOT NULL,
    refund_status  VARCHAR2(20) NOT NULL,
    resolution     VARCHAR2(50),

    CONSTRAINT pk_returns11 PRIMARY KEY (return_id),

    CONSTRAINT fk_returns_order11
        FOREIGN KEY (order_id)
        REFERENCES orders11(order_id),

    CONSTRAINT fk_returns_product11
        FOREIGN KEY (product_id)
        REFERENCES products1(product_id),

    CONSTRAINT chk_refund_status11
        CHECK (refund_status IN ('Initiated','Processed','Rejected'))
);




INSERT ALL
  INTO returns11 VALUES (3001, 1001, 7, DATE '2019-11-20', 'Wrong size delivered', 3599.10, 'Processed', 'Refund to source')
  INTO returns11 VALUES (3002, 1002, 4, DATE '2020-02-01', 'Product damaged in transit', 149999, 'Processed', 'Replacement sent')
  INTO returns11 VALUES (3003, 1005, 1, DATE '2021-01-28', 'Changed mind', 59499.15, 'Rejected', 'Policy: >7 days')
  INTO returns11 VALUES (3004, 1006, 11, DATE '2021-03-15', 'Defective product', 7499, 'Processed', 'Refund to wallet')
  INTO returns11 VALUES (3005, 1007, 15, DATE '2021-07-26', 'Item not as described', 2998, 'Processed', 'Refund to source')
  INTO returns11 VALUES (3006, 1009, 18, DATE '2022-01-02', 'Missing parts in box', 3274, 'Initiated', NULL)
  INTO returns11 VALUES (3007, 1010, 2, DATE '2022-03-01', 'Found cheaper elsewhere', 109999, 'Rejected', 'Policy: 14 days past')
  INTO returns11 VALUES (3008, 1012, 14, DATE '2022-08-10', 'Wrong colour delivered', 6299.10, 'Processed', 'Refund to source')
  INTO returns11 VALUES (3009, 1013, 3, DATE '2022-10-25', 'Screen flickering issue', 24849, 'Processed', 'Replacement sent')
  INTO returns11 VALUES (3010, 1014, 6, DATE '2023-01-15', 'Performance issues', 45999, 'Initiated', NULL)
  INTO returns11 VALUES (3011, 1016, 5, DATE '2023-06-20', 'Better deal found', 91920, 'Rejected', 'Policy: non-returnable electronics')
  INTO returns11 VALUES (3012, 1017, 1, DATE '2023-09-22', 'Received duplicate copy', 299, 'Processed', 'Refund to wallet')
  INTO returns11 VALUES (3013, 1018, 2, DATE '2023-11-20', 'Genuine product doubt', 109999, 'Initiated', NULL)
  INTO returns11 VALUES (3014, 1003, 8, DATE '2020-05-12', 'Fabric quality poor', 5697, 'Processed', 'Refund to source')
  INTO returns11 VALUES (3015, 1007, 15, DATE '2021-07-28', 'Duplicate return attempt', 0, 'Rejected', 'Already processed')
  INTO returns11 VALUES (3016, 1020, 16, DATE '2024-05-01', 'Allergic reaction', 3196, 'Initiated', NULL)
  INTO returns11 VALUES (3017, 1011, 19, DATE '2022-05-18', 'Expired product', 28, 'Processed', 'Refund to source')
  INTO returns11 VALUES (3018, 1006, 10, DATE '2021-03-20', 'Damaged packaging', 7999, 'Processed', 'Replacement sent')
  INTO returns11 VALUES (3019, 1013, 3, DATE '2022-11-01', 'Duplicate return attempt', 0, 'Rejected', 'Replacement already dispatched')
  INTO returns11 VALUES (3020, 1016, 11, DATE '2023-06-25', 'Noise issue', 7499, 'Processed', 'Refund to source')
SELECT * FROM dual;







