CREATE DATABASE saas_dw;
use saas_dw;

-- DIMENSION TABLES
CREATE TABLE dim_calendar (
    calendar_date DATE NOT NULL,
    year INT NOT NULL,
    month VARCHAR(20) NOT NULL,
    quarter INT NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    PRIMARY KEY (calendar_date)
);

CREATE TABLE dim_customers (
    customer_id INT NOT NULL,
    tax_id VARCHAR(18) NOT NULL,-- Equivalente universal ao CNPJ
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50) NOT NULL, -- Setor
    state VARCHAR(2) NOT NULL,
    company_size VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE dim_plans (
    plan_id INT NOT NULL,
    plan_name VARCHAR(50) NOT NULL,
    monthly_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (plan_id)
);

-- FACT TABLES

CREATE TABLE fact_subscriptions (
    subscription_id INT NOT NULL,
    customer_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    cancel_date DATE NULL, 
    subscription_status VARCHAR(20) NOT NULL,
    PRIMARY KEY (subscription_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES dim_plans(plan_id),
    FOREIGN KEY (start_date) REFERENCES dim_calendar(calendar_date),
    FOREIGN KEY (cancel_date) REFERENCES dim_calendar(calendar_date)
);

CREATE TABLE fact_payments (
    payment_id INT NOT NULL,
    subscription_id INT NOT NULL,
    due_date DATE NOT NULL, -- Data de vencimento
    payment_date DATE NULL, -- Data do pagamento
    payment_status VARCHAR(20) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (subscription_id) REFERENCES fact_subscriptions(subscription_id),
    FOREIGN KEY (due_date) REFERENCES dim_calendar(calendar_date),
    FOREIGN KEY (payment_date) REFERENCES dim_calendar(calendar_date)
);