
  Project Overview
   
  E-commerce Performance Dashboard
  Objective:

  "This Power BI dashboard provides real-time insights into sales performance, revenue trends, deep dive into data to reach to target more faster and customer segmentation to help businesses make data-driven decisions."

   Business Use Case:

   "The sales team and product owners at Company mayass wants to track product performance, sales targets, and customer retention rates."

 Data Sources
 Source Type	     Description	Location
 Google BigQuery	 Real-time sales data (Cloud)
 Google Analytics	 Website conversion data	(API)

 Data Model & Schema
📂 Tables Used:
    SalesData – Transaction-level & sales records
    CustomerData – Customer demographics & segments
    ProductData – Product categories, prices, and stock
    


  Key Metrics & KPIs
  Category	KPI	Formula (DAX)
📊 Revenue Analysis	Total Sales	SUM(SalesData[Revenue])
📉 Sales Trends	YoY Sales Growth %	((Current Year Sales - Last Year Sales) / Last Year Sales) * 100
📦 Product Performance	Top-Selling Products	TOPN(5, ProductData, SalesData[Revenue])
🏆 Sales Team Performance	Revenue per Salesperson	SUM(SalesData[Revenue]) / COUNT(SalesData[Salesperson])


    Overview Page – KPIs, total revenue, growth trends
    Sales Trends Page – Monthly revenue, YoY comparisons
    Product Performance Page – Best & worst-performing products
    Customer Segmentation – New vs. Returning customers
    Regional Sales Analysis – Sales by country & store

  Deployment & Automation
    Scheduled Data Refresh
    Automated Alerts: Power Automate sends alerts for low sales
    Row-Level Security (RLS): Restricting data based on roles


  Future Enhancements and recommendation

   Predictive Sales Forecasting (Power BI AI Insights)
   Customer Churn Prediction Model
   Interactive What-If Analysis for Pricing Strategies




   
