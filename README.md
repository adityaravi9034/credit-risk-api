
# 🏦 Credit Risk Scoring API (LightGBM + Flask + Docker)

This project is a deployable credit risk scoring API built with LightGBM and Flask, containerized with Docker, and ready for deployment on Google Cloud Run.

---

## 🔍 Features

- Predict loan default probability using financial input features
- Trained on synthetic data similar to LendingClub
- REST API endpoint (`/predict`) accepts JSON input
- Lightweight Flask + Docker app
- Easily deployable via Google Cloud Run

---

## 🚀 How to Use

### ✅ Option 1: Deploy Online Using Google Cloud Run (No Docker Needed)

1. **Fork or clone this repo**
2. **Push your code to GitHub**

    Make sure the repo contains:
    - `app.py`
    - `Dockerfile`
    - `lightgbm_credit_risk_model.joblib`

3. **Set up Google Cloud:**
    - Create a project at [console.cloud.google.com](https://console.cloud.google.com/)
    - Enable these APIs:
      - Cloud Run
      - Cloud Build
      - Artifact Registry

4. **Deploy from GitHub**
    - Go to **Cloud Run > Create Service**
    - Choose **"Deploy from source"**
    - Connect your GitHub repo
    - Set port to `5000`
    - Click **Deploy**

5. **Call the API**
    ```bash
    curl -X POST https://your-url.a.run.app/predict \
         -H "Content-Type: application/json" \
         -d @sample_input.json
    ```

---

### 🐳 Option 2: Run Locally with Docker

> Requires Docker Desktop installed.

```bash
# Build image
docker build -t credit-risk-api .

# Run container
docker run -p 5000:5000 credit-risk-api
```

Access at: `http://localhost:5000/predict`

---

## 📦 Example JSON Input

```json
{
  "loan_amount": 25000,
  "term_months": 36,
  "interest_rate": 12.5,
  "installment": 500,
  "annual_income": 60000,
  "dti_ratio": 20,
  "fico_score": 680,
  "employment_length": 5,
  "open_credit_lines": 8,
  "revol_util": 45,
  "credit_history_years": 10,
  "num_delinquencies": 1,
  "home_ownership_encoded": 1,
  "loan_purpose_encoded": 3,
  "state_encoded": 10
}
```

---

## 📁 Files

- `app.py` — Flask REST API
- `Dockerfile` — Container configuration
- `lightgbm_credit_risk_model.joblib` — Trained model

---

## 🧠 Credits

Built by Aditya Ravi as part of an end-to-end ML engineering exercise.
