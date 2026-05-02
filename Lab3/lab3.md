# Лабораторна робота №3 | Маніпулювання даними SQL (OLTP)

### Мета роботи
Тестування бази даних шляхом виконання запитів у стилі транзакцій (OLTP). Практичне застосування основних операцій маніпулювання даними (DML) у PostgreSQL: `SELECT`, `INSERT`, `UPDATE` та `DELETE`.

### База даних складається з наступних таблиць:

* **Doctor** (`doctor_id` [PK], `full_name`, `specialization`, `contact_number`)
* **Patient** (`patient_id` [PK], `full_name`, `birth_date`, `phone`, `email`)
* **Appointment** (`appointment_id` [PK], `patient_id` [FK], `doctor_id` [FK], `date_time`, `complaints`, `diagnosis`) — *асоціативна таблиця, що реєструє прийоми пацієнтів у лікарів.*
* **Prescription** (`prescription_id` [PK], `appointment_id` [FK], `medication_name`, `dosage`, `instructions`)

### Виконані операції маніпулювання даними

Згідно з вимогами, базу даних було протестовано наступними запитами:
1. **INSERT:** Додано нові рядки в таблиці `Patient` та `Appointment`, щоб кожна таблиця містила щонайменше 5 записів.
2. **UPDATE:** Змінено існуючі дані з використанням речення `WHERE` (зафіксовано встановлений лікарем діагноз шляхом оновлення поля `diagnosis`).
3. **DELETE:** Виконано безпечне видалення тестового (скасованого) запису про прийом з використанням речення `WHERE`.
4. **SELECT:** Виконано вибірку даних для перевірки результатів змін.

### Результати виконання 
Нижче наведено скриншоти результатів, в тому числі й фінального запиту `SELECT * FROM Appointment;`, який підтверджує успішне додавання 5 рядків та оновлення поля `diagnosis`:

! (screenshots/appointments_result.jpeg)
! (screenshots/patient_result.jpeg)
! (screenshots/diagnosis_update.jpeg)
