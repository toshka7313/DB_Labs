-- Лабораторна робота 3: Маніпулювання даними (OLTP)

-- Додавання даних (INSERT) до 5 рядків
INSERT INTO Patient (full_name, birth_date, phone, email) VALUES 
('Олександр Усик', '1987-01-17', '+380509998877', 'usyk.o@example.com'),
('Марія Кюрі', '1995-11-07', '+380671112233', 'marie.c@example.com');

-- Додаємо 2 нових записи про прийоми для цих пацієнтів
INSERT INTO Appointment (patient_id, doctor_id, date_time, complaints, diagnosis) VALUES 
(4, 1, '2026-05-01 10:00:00', 'Біль у спині', NULL),
(5, 2, '2026-05-01 11:30:00', 'Запаморочення, слабкість', NULL);

-- Оновлення (UPDATE) - лікар провів огляд і встановил діагноз
UPDATE Appointment 
SET diagnosis = 'Остеохондроз' 
WHERE patient_id = 11 AND doctor_id = 1 AND diagnosis IS NULL;

-- Видалення (DELETE) тестового/скасованого запису
DELETE FROM Appointment 
WHERE patient_id = 12 AND doctor_id = 2;

-- Фінальна перевірка
SELECT * FROM Patient;
SELECT * FROM Appointment;