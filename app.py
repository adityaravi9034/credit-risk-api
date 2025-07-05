
from flask import Flask, request, jsonify
import joblib
import numpy as np
import pandas as pd

# Load the trained LightGBM model
model = joblib.load("lightgbm_credit_risk_model.joblib")

# Define feature order (must match training set!)
FEATURES = [
    "loan_amount", "term_months", "interest_rate", "installment", "annual_income",
    "dti_ratio", "fico_score", "employment_length", "open_credit_lines",
    "revol_util", "credit_history_years", "num_delinquencies", "home_ownership_encoded",
    "loan_purpose_encoded", "state_encoded"
]

# Initialize Flask app
app = Flask(__name__)

@app.route("/")
def index():
    return "Credit Risk Scoring API is up!"

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()

    # Check if all features are present
    if not all(feature in data for feature in FEATURES):
        return jsonify({"error": "Missing one or more required features."}), 400

    # Convert to DataFrame
    input_df = pd.DataFrame([data], columns=FEATURES)

    # Predict probability and class
    prob = model.predict_proba(input_df)[0][1]
    pred = model.predict(input_df)[0]

    return jsonify({
        "prediction": int(pred),
        "probability_of_default": round(prob, 4)
    })

if __name__ == "__main__":
    app.run(debug=True)
