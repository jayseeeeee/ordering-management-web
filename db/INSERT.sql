INSERT INTO customers (full_name, address, email_address, contact_number, id_picture, acquisition_channel, notes)
VALUES
    ('Dacasin, John Christian B.', 'Imus, Cavite', 'john.dacasin@gmail.com', '09171234561', NULL, NULL, 'Interested in blackout curtains'),
    ('Mallillin, Kyle Jhayzee D.', 'Bacoor, Cavite', NULL, '09171234562', 'ids/kyle.png', 'Referral', NULL),
    ('Ricafrente, Artxander Vincent M.', 'Dasmariñas, Cavite', NULL, '09171234563', 'ids/artxander.png', 'Walk-in', 'Prefers modern styles'),
    ('Sardoncillo, Danzhel Jay N.', 'General Trias, Cavite', 'danzhel.sardoncillo@gmail.com', '09171234564', 'ids/danzhel.png', 'Instagram', 'Needs urgent installation'),
    ('Sosmeña, Michaela Jane B.', 'Tagaytay, Cavite', NULL, '09171234565', NULL, 'Facebook', NULL),
    ('Vilog, Cynric Ziv C.', 'Trece Martires, Cavite', 'cynric.vilog@gmail.com', '09171234566', 'ids/cynric.png', NULL, 'Looking for affordable blinds');

INSERT INTO quotes (customer_id, measurements, product, type, fabric, color, customization, price_per_sq_ft, total_amount, discount_rate, payment_terms, status)
VALUES
    (1, '10x12 ft', 'Curtain', 'Sheers', 'Silk', 'Gray', 'Blackout', 250.50, 12000.00, 10.00, 'Full Payment', 'Approved'),
    (2, '8x10 ft', 'Blind', 'Venetian', null, 'White', 'Chain Type', 180.75, 8500.00, NULL, 'Down Payment', 'Approved'),
    (3, '12x14 ft', 'Accordion', 'Wooden', null, 'Brown', 'Track Type', 320.00, 18000.00, 15.00, 'Full Payment', 'Approved'),
    (4, '9x11 ft', 'Curtain', 'Drop', 'Cotton', 'Black', 'Motorized', 410.25, 22000.00, 20.00, 'Cash on Delivery', 'Pending'),
    (5, '7x9 ft', 'Accordion', 'Glass', null, 'Cream', 'Head Cover', 150.00, 7000.00, NULL, 'Cash on Delivery', 'Cancelled'),
    (6, '15x16 ft', 'Blind', 'Vertical', 'Polyester', 'Silver', 'Blackout', 275.00, 26000.00, 30.00, 'Full Payment', 'Approved');

INSERT INTO orders (quote_id, contract_picture, down_payment_amount, balance_amount, installation_date, status)
VALUES
    (1, 'contracts/contract1.png', NULL, 0.00, '2026-06-10', 'Completed'),
    (2, 'contracts/contract2.png', 3000.00, 5500.00, '2026-06-12',  'Installation'),
    (3, 'contracts/contract3.png', NULL, 0.00, '2026-06-15',  'In Production'),
    (4, 'contracts/contract4.png', NULL, 17600.00, '2026-06-18', 'Change'),
    (6, 'contracts/contract5.png', NULL, 0.00, '2027-06-20', 'In Production');

INSERT INTO services (order_id, service_type, service_date, notes)
VALUES
    (1, 'Installation', '2026-06-10', 'Install curtain'),
    (2, 'Installation', '2026-06-13', NULL),
    (1, 'Warranty', '2026-06-16', 'Repair curtain blackout');

INSERT INTO transactions (order_id, payment_method, amount_paid, proof_of_payment, status)
VALUES
    (1, 'Cash', 10800.00, 'payments/pay1.png', 'Full'),
    (2, 'Check', 3000.00, 'payments/pay2.png', 'Partial'),
    (3, 'Bank Transfer', 15300.00, 'payments/pay3.png', 'Full'),
    (5, 'Cash', 18200.00, 'payments/pay5.png', 'Full');

INSERT INTO installers (full_name, contact_number)
VALUES
    ('Ronald dela Rosa', '09181111111'),
    ('Robin Padilla', '09182222222'),
    ('Rodrigo Duterte', '09183333333'),
    ('Alan Peter Cayetano', '09184444444'),
    ('Pia Cayetano', '09185555555');

INSERT INTO service_installers (service_id, installer_id, payment)
VALUES
    (1, 1, 1500.00),
    (1, 2, 1500.00),
    (2, 2, 1200.00),
    (2, 3, 1800.00);