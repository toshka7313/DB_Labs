-- Лабораторна робота №4 | Аналітичні SQL-запити (OLAP)

-- БЛОК 1: Агрегатні функції та групування

-- 1. Загальна кількість пацієнтів
SELECT COUNT(*) AS total_patients 
FROM Patient;

-- 2. Знаходження найстаршого (MIN) та наймолодшого (MAX) пацієнта за датою народження
SELECT MIN(birth_date) AS oldest_patient_dob, MAX(birth_date) AS youngest_patient_dob 
FROM Patient;

-- 3. Кількість лікарів кожної спеціалізації
SELECT specialization, COUNT(*) AS doctors_count 
FROM Doctor 
GROUP BY specialization;

-- 4. Завантажені лікарі: лікарі, які провели більше одного прийому (фільтрація груп)
SELECT doctor_id, COUNT(*) AS appointment_count 
FROM Appointment 
GROUP BY doctor_id 
HAVING COUNT(*) > 1;


-- БЛОК 2: Об'єднання таблиць (JOIN)

-- 5. INNER JOIN: ПІБ пацієнтів та дати їхніх запланованих або проведених прийомів
SELECT p.full_name, a.date_time 
FROM Patient p
INNER JOIN Appointment a ON p.patient_id = a.patient_id;

-- 6. LEFT JOIN: Всі лікарі та дати їхніх прийомів (навіть якщо до лікаря ще ніхто не записався)
SELECT d.full_name, d.specialization, a.date_time
FROM Doctor d
LEFT JOIN Appointment a ON d.doctor_id = a.doctor_id;

-- 7. Багатотабличний JOIN: ПІБ пацієнта, ПІБ лікаря та дата прийому
SELECT p.full_name AS patient_name, d.full_name AS doctor_name, a.date_time 
FROM Patient p 
JOIN Appointment a ON p.patient_id = a.patient_id 
JOIN Doctor d ON a.doctor_id = d.doctor_id;


-- БЛОК 3: Підзапити (Subqueries)

-- 8. Підзапит у WHERE (з IN): Імена пацієнтів, яким лікарі виписали хоча б один рецепт
SELECT full_name 
FROM Patient 
WHERE patient_id IN (
    SELECT patient_id 
    FROM Appointment a 
    JOIN Prescription pr ON a.appointment_id = pr.appointment_id
);

-- 9. Підзапит у SELECT: Підрахунок загальної кількості візитів для кожного пацієнта
SELECT full_name, 
       (SELECT COUNT(*) FROM Appointment a WHERE a.patient_id = p.patient_id) AS visits_count 
FROM Patient p;

-- 10. Підзапит у WHERE: Пацієнти, які мали медичні прийоми після 1 травня 2026 року
SELECT full_name, email 
FROM Patient 
WHERE patient_id IN (SELECT patient_id FROM Appointment WHERE date_time >= '2026-05-01');