# Import necessary libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import Ridge, Lasso
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt

# Load your dataset
# Assuming 'C4Olefinexperiment.csv' is your dataset file
df = pd.read_csv('C4Olefinexperiment.csv')

# Display the first few rows of the dataset
print(df.head())

# Select features and target variable
# Assuming 'temperature', 'catalyst', and 'number_of_input' are your features
features = df[['temperature', 'catalyst', 'number_of_input']]
target = df['output']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size=0.2, random_state=42)

# Standardize the features using StandardScaler
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Ridge Regression
ridge_model = Ridge(alpha=1.0)  # You can adjust the alpha parameter for regularization strength
ridge_model.fit(X_train_scaled, y_train)

# Lasso Regression
lasso_model = Lasso(alpha=1.0)  # You can adjust the alpha parameter for regularization strength
lasso_model.fit(X_train_scaled, y_train)

# Predictions
ridge_predictions = ridge_model.predict(X_test_scaled)
lasso_predictions = lasso_model.predict(X_test_scaled)

# Evaluate the models
ridge_mse = mean_squared_error(y_test, ridge_predictions)
lasso_mse = mean_squared_error(y_test, lasso_predictions)

print(f'Ridge Mean Squared Error: {ridge_mse}')
print(f'Lasso Mean Squared Error: {lasso_mse}')

# Visualize the predictions
plt.scatter(y_test, ridge_predictions, label='Ridge Regression')
plt.scatter(y_test, lasso_predictions, label='Lasso Regression')
plt.xlabel('True Values')
plt.ylabel('Predictions')
plt.legend()
plt.title('Ridge and Lasso Regression Predictions')
plt.show()
