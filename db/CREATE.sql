CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email_address VARCHAR(320),
    contact_number VARCHAR(20) NOT NULL,
    id_picture VARCHAR(255),
    acquisition_channel VARCHAR(50),
    notes VARCHAR(500),
    created_at DATETIME DEFAULT NOW()
);

CREATE TABLE quotes (
    quote_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_issued DATETIME DEFAULT NOW(),
    measurements VARCHAR(50) NOT NULL,
    product VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    fabric VARCHAR(100),
    color VARCHAR(50),
    customization VARCHAR(255),
    price_per_sq_ft DECIMAL(12,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    discount_rate DECIMAL(5,2),
    payment_terms VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_quotes_customer FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    quote_id INT NOT NULL UNIQUE,
    contract_picture VARCHAR(255),
    down_payment_amount DECIMAL(12,2),
    balance_amount DECIMAL(12,2),
    date_issued DATETIME DEFAULT NOW(),
    installation_date DATE,
    warranty_expiry_date DATE DEFAULT (CURRENT_DATE + INTERVAL 2 YEAR),
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_orders_quote FOREIGN KEY (quote_id)
    REFERENCES quotes(quote_id) ON DELETE CASCADE
);

CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    service_type VARCHAR(100) NOT NULL,
    service_date DATE NOT NULL,
    notes VARCHAR(500),
    date_issued DATETIME DEFAULT NOW(),
    CONSTRAINT fk_services_order FOREIGN KEY (order_id)
    REFERENCES orders(order_id) ON DELETE CASCADE
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATETIME DEFAULT NOW(),
    payment_method VARCHAR(50) NOT NULL,
    amount_paid DECIMAL(12,2) NOT NULL,
    proof_of_payment VARCHAR(255),
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_transactions_order FOREIGN KEY (order_id)
    REFERENCES orders(order_id) ON DELETE CASCADE
);

CREATE TABLE installers (
    installer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    created_at DATETIME DEFAULT NOW()
);

CREATE TABLE service_installers (
    service_id INT NOT NULL,
    installer_id INT NOT NULL,
    payment DECIMAL(12,2),
    assigned_at DATETIME DEFAULT NOW(),
    CONSTRAINT fk_service_installers_service FOREIGN KEY (service_id)
    REFERENCES services(service_id) ON DELETE CASCADE,
    CONSTRAINT fk_service_installers_installer FOREIGN KEY (installer_id)
    REFERENCES installers(installer_id) ON DELETE CASCADE
);