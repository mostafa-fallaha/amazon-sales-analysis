# Amazon Sales Analysis

This project focuses on analyzing amazon sales and studying the customers reviews.

## Tech Stacks

**Python | MySQL | Power BI**

# ETL

#### 1. Extract the data from the csv files and load it to the staging-area-1.

<img src="./images/extract.png">

#### 2. Transformation and clean the data from staging-area-1 and then load it to staging-area-2.

Adding to the customers reviews a label (0 or 1) indicating for a bad or a good review. this is for analysis and predictions purposes.
<br>
For this, the TfidfVectorizer was used in combination with LogisticRegression to classify the label of the customer review.
<br>
<img src="./images/reviews_labels.png">

#### 3. Loading the data from staging area 2 to the DWH based on specific schedules.

| Load `also_bought` table daily | Load `manufacturer` table weekly |
| ------------------------------ | -------------------------------- |
| ![Landing](./images/loads.png) | ![fsdaf](./images/loads2.png)    |

#### 4. DWH Schema

<img src="./images/DWH_2.png">

#### 5. Procedure Logs Table

<img src="./images/procedure_logs.png">

<br><br>

# Time Series Analysis

| Plot 1                               | Plot 2                                |
| ------------------------------------ | ------------------------------------- |
| ![Landing](./images/time_series.png) | ![fsdaf](./images/all_timeseries.png) |

<br><br>

# Power BI Report

| 🌐 Geographical Analysis              | 📈 Products Analysis                     |
| ------------------------------------- | ---------------------------------------- |
| ![Landing](./images/geo_analysis.png) | ![fsdaf](./images/products_analysis.png) |
