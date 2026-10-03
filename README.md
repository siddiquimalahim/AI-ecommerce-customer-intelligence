# AI-Powered E-Commerce Customer Intelligence System

## Data Science Final Hackathon

This project develops an end-to-end data science solution for an e-commerce company.

The project uses SQLite data and covers:

- Data cleaning
- SQL business analysis
- Exploratory Data Analysis
- Customer churn prediction
- Neural network classification
- NLP sentiment analysis
- Streamlit deployment

## Database

The SQLite database contains:

- 8,000 customers
- 1,000 products
- 65,000 orders
- 26,000 reviews

## Machine Learning

Customer churn is defined using:

- Feature period: up to 31 May 2026
- Target period: 1 June 2026 to 31 August 2026

Models:

1. Logistic Regression
2. Random Forest
3. Feed-forward Neural Network

Features include:

- Total orders
- Total spending
- Average order value
- Days since last order
- Return rate
- Average delivery days
- Age
- Membership type

## NLP

Review sentiment labels:

- Rating 1–2: Negative
- Rating 3: Neutral
- Rating 4–5: Positive

The NLP pipeline uses:

- TF-IDF
- Logistic Regression

## Streamlit

The application contains three sections:

### Dashboard

Displays SQL-based business KPIs, monthly revenue, category revenue and top customers.

### Churn Prediction

Accepts customer features and predicts churn probability using the saved Random Forest model.

### Sentiment Analysis

Accepts review text and predicts sentiment using the saved TF-IDF + Logistic Regression model.

## Run Locally

Install dependencies:

```bash
pip install -r requirements.txt