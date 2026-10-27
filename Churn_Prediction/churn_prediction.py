import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report

# Note: Simulating Spark MLlib pipeline using Scikit-Learn 
# as it provides the same logic (Feature selection -> Model Training -> Evaluation).

def run_churn_prediction():
    print("--- 11(a) Loading and Cleaning Dataset ---")
    df = pd.read_csv('churn_data.csv')
    
    # Quality Check: Missing values
    print("Missing values:\n", df.isnull().sum())
    
    # Feature Selection
    # Features: Tenure, MonthlyCharges, TotalCharges
    # Target: Churn
    X = df[['Tenure', 'MonthlyCharges', 'TotalCharges']]
    y = df['Churn']
    
    print("\nSelected Features:\n", X.head())
    
    # 11(b) Model Building and Training
    print("\n--- 11(b) Training Classification Model ---")
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    
    # Using RandomForest as it mirrors Spark's DecisionTree/RandomForest classifier
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    # 11(c) Evaluation
    print("\n--- 11(c) Model Evaluation ---")
    predictions = model.predict(X_test)
    accuracy = accuracy_score(y_test, predictions)
    
    print(f"Model Accuracy: {accuracy * 100:.2f}%")
    print("\nClassification Report:\n", classification_report(y_test, predictions))

if __name__ == "__main__":
    run_churn_prediction()
