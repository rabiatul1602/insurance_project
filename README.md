# Insurance Data Analytics Dashboard

## 📊 Project Overview
This project explores insurance policy and customer affordability insights using **Power BI** as the visualization layer.  
The data pipeline is built on **PostgreSQL** and follows the **Medallion Architecture** (Bronze → Silver → Gold).  

The main objectives of this project are:
- To analyze premium distribution across customer demographics and states.
- To measure policy issuance trends over time.
- To assess insurance affordability based on income and premium load percent.
- To integrate external datasets (postcode, town, state) for geographical context.

---

## 🛠 Data Engineering Workflow
The dataset was cleaned, transformed, and structured before being connected to Power BI.

### 1. Bronze Layer
- Raw data ingested into PostgreSQL via **bulk insert**.
- Stored without transformations to maintain data fidelity.

### 2. Silver Layer
- Applied cleaning and standardization:
  - Fixed missing values and inconsistent formats.
  - Normalized categorical variables.
- Created **cleaned and structured tables** for downstream consumption.

### 3. Gold Layer
- Designed **fact and dimension views** to support analysis:
  - **Fact Tables:** policy, premium, income.
  - **Dimension Tables:** customer, product type, marital status, geography.
- Views were materialized and optimized for BI usage.

### 4. External Data Integration
- Linked to external datasets containing **postcode, town, and state mappings**.
- Enriched customer profiles with geographical attributes.

---

## 📈 Power BI Dashboard
The cleaned and modeled data was imported into Power BI, where interactive dashboards were built to answer key business questions:

- **Who buys insurance?** (purchasing behaviour by demographics)
  <img width="1305" height="732" alt="image" src="https://github.com/user-attachments/assets/76db131d-3fb9-4628-843c-7dc74862af96" />

- **Policy Trends and Premiums** (premium pattern across plan type)
  <img width="1298" height="726" alt="image" src="https://github.com/user-attachments/assets/055b22c3-3320-4eab-bf25-7b4aeca33139" />

- **Affordability Insights** (policy ownership across state)
  <img width="1303" height="728" alt="image" src="https://github.com/user-attachments/assets/b7c26590-ca77-4b3c-b4b1-02bffcddfb42" />


---

## ⚙️ Tech Stack
- **Database:** PostgreSQL  
- **ETL Architecture:** Medallion (Bronze, Silver, Gold)  
- **BI Tool:** Microsoft Power BI  
- **Data Enrichment:** External postcode/town/state dataset  

---

## 🚀 How to Use
1. Clone this repository.  
2. Access the SQL scripts for Bronze → Silver → Gold transformations.  
3. Connect Power BI to the PostgreSQL database using the provided fact and dimension views.  
4. Refresh the model to generate interactive dashboards.  

---

## 📬 Contact
If you have any questions or suggestions, feel free to reach out via GitHub Issues or Discussions.  
