# Exercise 11 --- Customer Churn Prediction Using Spark MLlib

## Aim
Build a predictive model to determine if a customer is likely to churn (leave the service) based on historical data, using Spark MLlib (simulated via Scikit-Learn).

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Language : Python 3.14
Library  : Spark MLlib (simulated via Scikit-Learn / Pandas)
Dataset  : churn_data.csv
Directory: ~/Desktop/lab/Churn_Prediction
```

------------------------------------------------------------------------

## 1. Data Preparation and Feature Selection (11a)
The dataset contains customer tenure, monthly charges, and total charges. The goal is to predict the binary target `Churn` (1 = Yes, 0 = No).

**Data Quality Process:**
- **Missing Value Check**: Performed using `df.isnull().sum()`.
- **Feature Selection**: The following features were selected for training:
  - `Tenure`: How long the customer has been with the company.
  - `MonthlyCharges`: The monthly bill amount.
  - `TotalCharges`: Cumulative spending.

------------------------------------------------------------------------

## 2. Model Building and Training (11b)
A **Random Forest Classifier** was implemented, which mirrors the `RandomForestClassifier` available in Spark MLlib.

**Pipeline Steps:**
1. **Split**: Data was divided into training (70%) and testing (30%) sets.
2. **Training**: The model was trained on the training set to learn patterns associating tenure and charges with churn.

``` python
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)
```

------------------------------------------------------------------------

## 3. Evaluation and Business Application (11c)

### Evaluation Results
- **Model Accuracy**: 100.00% (on sample test data)
- **Precision/Recall**: Perfect scores achieved for both churn and non-churn classes.

### Business Application
These results provide actionable insights for a business to reduce churn:
- **Identify High-Risk Customers**: By feeding new customer data into the model, the business can identify those with low tenure and high monthly charges (typical churn patterns).
- **Proactive Retention**: Customers flagged as "Likely to Churn" can be targeted with special discounts or loyalty offers.
- **Resource Allocation**: Marketing budgets can be focused on high-value customers who are showing signs of churn.

------------------------------------------------------------------------

# Result
A customer churn prediction model was successfully developed. Through feature selection and the use of a Random Forest classifier, the model achieved high accuracy in predicting churn. This demonstrates how machine learning can be used to proactively manage customer retention.
