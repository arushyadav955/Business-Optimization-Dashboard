# 📊 Business Optimization Dashboard

An interactive Power BI dashboard that analyzes operational efficiency, demand-supply gaps, and profitability trends to support data-driven business decision-making.

---

## 📌 Overview

Businesses often struggle to get a unified view of profitability, supply-demand balance, and operational shortages. This dashboard consolidates these metrics into a single, dark-themed, interactive report helping decision-makers quickly spot performance gaps and act on them.

**Core capabilities:**
- Monitor profit and loss trends
- Analyze supply-demand gaps
- Track operational shortages
- Evaluate business efficiency metrics
- Surface optimization opportunities through interactive KPI visuals and slicers

---

## 🗂️ Repository Contents

| File | Description |
|---|---|
| `Business Optimization Dashboard.pbix` | Power BI Desktop file containing the full report, data model, and DAX measures |
| `Dataset.csv` | Primary transactional/operational dataset used in the report |
| `Products.csv` | Product-level reference data |
| `SQL_Query.sql` | SQL query used for data extraction/preparation |

---

## 🧹 SQL Data Preparation

`SQL_Query.sql` handles the data cleaning and preparation pipeline that feeds the Power BI model. It performs the following steps:

1. **Workspace setup** : creates the `Business_Project` database.
2. **Initial data check** : pulls all rows from `Dataset` to inspect the raw data.
3. **Date quality check** : lists distinct order dates, then isolates rows where the date is null or blank.
4. **Product ID audit** : lists distinct `Product_ID` values to spot inconsistencies.
5. **Data cleanup** : corrects mismatched product codes via `UPDATE` statements (`Product_ID 21 → 7`, `22 → 11`).
6. **Re-verification** : re-checks distinct `Product_ID` values (ordered) to confirm the fix.
7. **Metric sanity checks** : reviews distinct `Availability` and `Demand` values before they're used in KPIs.
8. **Final join & export** : joins `Dataset` with `Products` on `Product_ID` to bring in `Product_Name` and `Unit_Price`, then writes the result into `new_table` via `SELECT * INTO`.

This produces a single, clean, denormalized table dates, product details, pricing, demand, and availability which is the source loaded into Power BI for the dashboard.

---

## ⚙️ Methodology

1. Loaded the dataset into Power BI Desktop from the source files
2. Cleaned and preprocessed data in Power Query Editor
3. Assessed data quality via Column Distribution, Column Quality, and Column Profile
4. Handled null values and enforced consistency across columns
5. Applied transformations required for optimization analysis
6. Designed a custom dark-themed dashboard for modern visualization
7. Built KPI cards for key metrics (see below)
8. Added slicers for interactive, dynamic filtering
9. Wrote DAX measures for KPI and operational calculations
10. Laid out the report for readability and business interpretation
11. Published the report to Power BI Service

---

## 📐 DAX Measures

```DAX
Total Profit              = SUM(BusinessData[Profit])
Total Loss                = SUM(BusinessData[Loss])
Average Daily Loss        = AVERAGE(BusinessData[Daily Loss])
Average Demand per Day    = AVERAGE(BusinessData[Demand])
Average Availability per Day = AVERAGE(BusinessData[Availability])
Total Supply Shortage     = SUM(BusinessData[Supply Shortage])
```

## 🖼️ Visuals Used

- **Cards** : key business KPIs at a glance
- **KPI Visuals** : tracking optimization metrics over time
- **Slicers** : interactive filtering for drill-down analysis

---

## 📈 Key Insights

### 1. Profit & Loss
- Total Profit: **301K**
- Total Loss: **8M**
- Average Daily Loss: **2.97K**

Losses far outweigh profit, pointing to a strong need for operational optimization and cost control.

### 2. Demand vs. Availability
- Average Demand per Day: **48.65**
- Average Availability per Day: **24.70**

Demand nearly doubles availability, signaling supply-chain constraints and operational inefficiency.

### 3. Supply Shortage
- Total Supply Shortage: **61K**

A shortage of this scale risks customer satisfaction, delivery timelines, and overall performance.

### 4. Optimization Opportunities
- Identify high-loss operational areas
- Improve supply chain efficiency
- Reduce daily losses
- Balance demand and availability
- Optimize inventory and resource allocation

---

## 🛠️ Tools Used

- **Power BI Desktop / Service** : data modeling, DAX, visualization, publishing
- **Power Query** : data cleaning and transformation
- **SQL** : data extraction and preparation

---

## ✅ Conclusion

The Business Optimization Dashboard offers a comprehensive, interactive view of operational performance. By combining KPI monitoring with supply-demand and profitability analysis, it helps organizations identify inefficiencies, reduce shortages, and make faster, data-backed decisions.
