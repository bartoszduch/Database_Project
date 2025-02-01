-- Tabela dla członków
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    membership_start_date DATE NOT NULL,
    membership_end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela dla karnetów
CREATE TABLE memberships (
    membership_id SERIAL PRIMARY KEY,
    membership_type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    duration_in_days INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela powiązania członków z karnetami
CREATE TABLE member_memberships (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    membership_id INT REFERENCES memberships(membership_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela dla trenerów
CREATE TABLE trainers (
    trainer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    specialization VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela dla zajęć grupowych
CREATE TABLE group_classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    class_description TEXT,
    schedule TIMESTAMP NOT NULL,
    trainer_id INT REFERENCES trainers(trainer_id) ON DELETE SET NULL,
    max_participants INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela rezerwacji zajęć grupowych
CREATE TABLE class_reservations (
    reservation_id SERIAL PRIMARY KEY,
    class_id INT REFERENCES group_classes(class_id) ON DELETE CASCADE,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela dla sprzętu
CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'available',
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela dla zgłoszeń napraw sprzętu
CREATE TABLE equipment_repairs (
    repair_id SERIAL PRIMARY KEY,
    equipment_id INT REFERENCES equipment(equipment_id) ON DELETE CASCADE,
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    repair_status VARCHAR(50) DEFAULT 'pending',
    description TEXT
);

-- Tabela historii wizyt
CREATE TABLE visit_history (
    visit_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    visit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela raportów
CREATE TABLE reports (
    report_id SERIAL PRIMARY KEY,
    report_type VARCHAR(50) NOT NULL,
    generated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content TEXT
);

-- Tabela rezerwacji sprzętu
CREATE TABLE equipment_reservations (
    reservation_id SERIAL PRIMARY KEY,
    equipment_id INT REFERENCES equipment(equipment_id) ON DELETE CASCADE,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    reservation_start TIMESTAMP NOT NULL,
    reservation_end TIMESTAMP NOT NULL
);
