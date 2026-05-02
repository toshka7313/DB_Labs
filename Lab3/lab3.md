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

<img width="792" height="220" alt="appointments_result" src="https://github.com/user-attachments/assets/d81be723-19f5-4f00-bcdc-f653e543dc03" />
<img width="1280" height="391" alt="patient_result" src="https://github.com/user-attachments/assets/f930bb3d-9dff-4211-adac-d800a8966add" />
<img width="1280" height="369" alt="diagnosis_update" src="https://github.com/user-attachments/assets/58e8d762-a8cd-481b-8bb6-fb321a0a3e96" />

