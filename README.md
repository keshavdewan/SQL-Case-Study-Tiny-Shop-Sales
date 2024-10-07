# SQL Case-Study: Tiny-Shop-Sales
This case study has been provided by Data in Motion. The case study talks about a small restaurant. They want a brief analysis of their sales, product performance, orders, and sales trends. So, I have written some SQL queries to find insights from the given data. This case study has been done by using PostgreSQL

![Tinyshopsales.png](https://github.com/keshavdewan/SQL-Case-Study-Tiny-Shop-Sales/blob/a6a4848399869797dfed291cbaef7ccfeb962f24/Tinyshopsales.png)
# Case Study Overview
There are four tables. These are

- Customers: In this table, all the restaurant’s customer data is stored. Data like customer ID, customer first name, customer last name, and email ID are in this table.
- Products: Here are details of all the products that are sold in the restaurant. Product ID, product name, and price are in this table. From this, we can see which is the most and least expensive product.
- Orders: Here, all the order data is stored which were placed by customers. In this table, the order ID, customer ID, and order date columns are included.
- Order_Items: This table contains the order ID, Product ID and quantity ordered.

[Creating Tables & Insert Data](https://github.com/keshavdewan/SQL-Case-Study-Tiny-Shop-Sales/blob/62211999ea66421cb4a0e5398c7c89742640e7da/Creating%20Tables%20%26%20Inserting%20Data.sql)

# Analysis Criteria
The case study utilises the following areas (commands) of SQL:
- Basic aggregations
- CASE WHEN statements
- Window Functions
- Joins
- Date time functions
- CTEs

# Questions
1. Which product has the highest price? Only return a single row.
2. Which customer has made the most orders?
3. What’s the total revenue per product?
4. Find the day with the highest revenue.
5. Find the first order (by date) for each customer.
6. Find the top 3 customers who have ordered the most distinct products
7. Which product has been bought the least in terms of quantity?
8. What is the median order total?
9. For each order, determine if it was ‘Expensive’ (total over 300), ‘Affordable’ (total over 100), or ‘Cheap’.
10. Find customers who have ordered the product with the highest price.

[Solutions](https://github.com/keshavdewan/SQL-Case-Study-Tiny-Shop-Sales/blob/0186e0ce0f00c4671601fece2242e63c696beeb5/solutions.sql)

# Data Sources
- [Data in Motion](https://d-i-motion.com/lessons/customer-orders-analysis/)
