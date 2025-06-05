# 📊 World Life Expectancy Data Analytic Project


**📁 Project Overview:**

This project analyzes global life expectancy trends using the World Life Expectancy dataset. The goal is to understand key factors that influence life expectancy across different countries and time periods. The analysis includes data cleaning, exploratory data analysis (EDA), and visualization to derive actionable insights.


**🧰 Tools & Technologies:**

- SQL (MySQL) – Data cleaning and transformation, EDA queries
- Excel – Basic inspection, tabular views, and verification
- Tableau – Dashboard and data visualization


**🔎 Data Cleaning (SQL):**

Steps taken to clean and prepare the data:
- Removed duplicate records using ROW_NUMBER() and DELETE operations.
- Filled in missing Status values (Developed / Developing) using JOIN based logic.
- Imputed missing Life expectancy values using average of adjacent years (self-join strategy).
- Verified non-empty fields for key columns such as GDP, BMI, and Adult Mortality.
  
📄 Script: [World Life Expectancy - Data Cleaning](https://github.com/nguyenpn1596/World-Life-Expectancy/blob/main/World%20Life%20Expectancy%20Project%20-%20Data%20Cleaning.sql)


**📈 Exploratory Data Analysis (SQL):**

The EDA phase focused on uncovering trends and relationships:
- Life Expectancy Over Time: Identified countries with the highest and lowest increase in life expectancy over 15 years.
- Yearly Trends: Observed a global upward trend in average life expectancy.
- GDP vs Life Expectancy: Strong positive correlation between GDP and life expectancy.
- Status (Developed/Developing): Developed countries have significantly higher average life expectancy.
- BMI and Life Expectancy: Some correlation observed; extreme BMIs may reduce life expectancy.
- Adult Mortality: Rolling sum used to track mortality trends across time for countries like the United States and United Kingdom.
  
Script: [World Life Expectancy - Exploratory Data Analysis.sql](https://github.com/nguyenpn1596/World-Life-Expectancy/blob/main/World%20Life%20Expectancy%20Project%20-%20Exploratory%20Data%20Analysis)


**📊 Visualization:**

- Line Chart: Global Life Expectancy Over Time.
- Bar Chart: Top 10 Countries by Life Expectancy Gain.
- Scatter Plot: GDP vs Life Expectancy.
- Column Chart: Life Expectancy by Development Status.
  
[Tableu Visual Dashboard](https://public.tableau.com/app/profile/nguyen.nguyen4911/viz/WorldLifeExpectancy_17489236504530/WorldLifeExpectancyAnalysis?publish=yes)


**🔍 Key Insights:**

- Countries like Rwanda and Cambodia saw the largest improvements in life expectancy, likely due to recovery from historical conflicts and improved healthcare.
- Higher GDP correlates with better life expectancy, but there are exceptions (e.g., oil-rich nations with poor healthcare infrastructure).
- Developing nations still lag behind in terms of average life expectancy, especially where GDP is low.
- Public health indicators such as BMI and adult mortality strongly influence life expectancy.


**✅ Conclusion:**

This project showcases practical skills in data cleaning, analysis, and visual storytelling using real-world health and economic indicators. It demonstrates how SQL can be used to process raw data and derive impactful insights, and how Excel and Tableau can be used to further refine and communicate findings visually.
