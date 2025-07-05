
FROM python:3.10-slim

WORKDIR /app

COPY app.py /app/
COPY lightgbm_credit_risk_model.joblib /app/

RUN pip install --no-cache-dir flask pandas lightgbm joblib

EXPOSE 5000

CMD ["python", "app.py"]
