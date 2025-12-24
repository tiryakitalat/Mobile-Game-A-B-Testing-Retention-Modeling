# Mobile Game A/B Testing & Retention Analysis Case Study 🎮

## 📌 Project Overview
This repository contains the solution for the **Vertigo Games Data Analyst Case Study**. The project is divided into two main tasks:
1.  **Task 1 (Simulation):** A/B test modeling to determine the best difficulty flow variant using Python.
2.  **Task 2 (EDA):** Exploratory Data Analysis on user characteristics and behaviors using SQL and Python.

The project follows a modular software engineering approach to ensure **clean, reusable, and reproducible code**.

---

## 🚀 Executive Summary (The Verdict)
**Task 1-a Winner:** **Variant B**

After running the retention and monetization simulations, **Variant B** is identified as the superior choice for long-term growth. Although Variant A has better initial retention (D1), Variant B's retention decay is slower (better "long-tail"), leading to higher DAU and Revenue over time.

---

## 📊 Task 1: A/B Test Simulation Results

Here are the direct answers to the case study questions based on the simulation outputs:

### a) & b) 15-Day Performance
* **DAU (Day 15):** **Variant B** has more active users due to a flatter retention curve.
* **Total Revenue (Day 15):** **Variant B** generates more cumulative revenue.

### c) 30-Day Performance
* **Choice:** The choice **does not change**. In fact, the gap between Variant B and Variant A widens by Day 30, making B clearly more profitable in the long run.

### d) Impact of 10-Day Sale (Boosting Purchase Rate)
* **Observation:** Running a sale (Day 15-25) significantly boosts revenue for both variants.
* **Winner:** **Variant B** still earns more total money by Day 30 because it has a larger user base (DAU) to monetize during the sale period.

---

## 📈 Visual Evidence (Task 1)

### 1. User Retention (DAU) Trend
Variant B overtakes Variant A after the first week.
![DAU Comparison Trend](screenshots/Case1_DAU_Graph.png)

### 2. Cumulative Revenue Growth
Variant B generates significantly higher total revenue by Day 30.
![Total Revenue Comparison](screenshots/Case1_Revenue_Graph.png)

### 3. Impact of Discount Strategy
Revenue uplift analysis during the sale event.
![Sale vs No-Sale Impact](screenshots/Case1_Sale_Report_Graph.png)

---

## 🔎 Task 2: Exploratory Data Analysis (SQL Findings)

In addition to the simulation, I analyzed the provided user dataset to uncover behavioral trends.

### 1. Market Value Analysis (ROI)
Identified high-value markets based on **ARPU** rather than just volume.
![Country ARPU](screenshots/sql_country_arpu.png)

### 2. The "Hook" Effect (Loyalty Analysis)
* **Insight:** Users who played more than **20 minutes** on their first day showed a drastic increase in LTV. Engagement is a leading indicator of monetization.
![Loyalty Analysis](screenshots/sql_loyalty_analysis.png)

### 3. Platform Demographics
Breakdown of the user base by operating system.
![Platform Dist](screenshots/sql_platform_dist.png)

*Full SQL queries are available in `eda_queries.sql`.*

---

## 🛠️ Methodology & Technical Approach

### 1. Mathematical Modeling (Python)
I utilized **Curve Fitting ($Retention(x) = a \cdot e^{-b(x-1)}$)** to model user retention accurately for future days where data was not provided.
* **Library:** `scipy.optimize.curve_fit`
* **Why?** To predict D30 performance mathematically rather than linear estimation.

### 2. Simulation Engine
Built a custom engine (`src/analysis.py`) that calculates DAU using a **convolution approach** (stacking cohorts) to simulate real-world active user accumulation.

### 3. Clean Code Architecture
The project is structured for reproducibility:
* `src/`: Contains configuration and logic modules.
* `main.py`: The entry point for running simulations.
* `load_db.py`: ETL pipeline to convert CSV data to SQLite.

---

## 📂 Repository Structure

```bash
├── src/
│   ├── config.py           # Configuration & Constants
│   ├── models.py           # Curve fitting & Math logic
│   ├── analysis.py         # Simulation Engine
├── screenshots/            # Graphs for README
├── main.py                 # Task 1 Runner
├── load_db.py              # Task 2 Data Loader
├── eda_queries.sql         # Task 2 SQL Scripts
├── requirements.txt        # Dependencies
└── README.md               # Documentation
