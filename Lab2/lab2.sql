-- ==========================================
-- Лабораторна робота 2 "DDL та DML скрипти"
-- Предметна область роботи: Лікарняні записи пацієнтів
-- ==========================================

-- Створення таблиць (DDL частина)

CREATE TABLE Doctor (
    doctor_id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20) 
);

CREATE TABLE Patient (
    patient_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE CHECK (birth_date <= CURRENT_DATE),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Appointment (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    complaints TEXT,
    diagnosis TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

CREATE TABLE Prescription (
    prescription_id SERIAL PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication_name VARCHAR(255) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE
);

-- Внесення даних в таблиці (DML частина)

INSERT INTO Doctor (full_name, specialization, contact_number) VALUES
('Радченко Антон Володимирович', 'Хірург', '+380123456789'),
('Уайт Уолтер Хартуелл', 'Терапевт', '+380987654321'),
('Петренко Іван Анатолійович', 'Ендокринолог', '+380912873645');

INSERT INTO Patient (full_name, birth_date, phone, email) VALUES
('Коваленко Андрій Романович', '1990-05-15', '+380545174111', 'andriikov@gmail.com'),
('Мельник Марія Іванівна', '2003-11-20', '+380672281337', 'mariaamelnyk@gmail.com'),
('Ткаченко Світлана Леонідівна', '1973-01-10', '+380932247332', 'svetatkach@gmail.com');

INSERT INTO Appointment (patient_id, doctor_id, complaints, diagnosis) VALUES
(1, 3, 'Головний біль, температура', 'ГРВІ'),
(2, 2, 'Біль у грудях', 'Гіпертонія'),
(3, 1, 'Кашель', 'Бронхіт');

INSERT INTO Prescription (appointment_id, medication_name, dosage, instructions) VALUES
(1, 'Парацетамол', '500 мг', '1 таблетка при температурі'),
(2, 'Еналаприл', '10 мг', '1 таблетка вранці'),
(3, 'Амброксол', '30 мг', '3 рази на день після їжі');