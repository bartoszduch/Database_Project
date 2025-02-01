-- Dodanie nowych członków
INSERT INTO members (first_name, last_name, email, phone_number, date_of_birth, membership_start_date, membership_end_date)
VALUES
('Emilia', 'Kowalska', 'emilia.kowalska@example.com', '111222333', '1985-05-15', '2023-03-01', '2024-03-01'),
('Michał', 'Jankowski', 'michal.jankowski@example.com', '444555666', '1990-07-20', '2023-03-05', '2024-03-05'),
('Jan', 'Kowalski', 'jan.kowalski@example.com', '500600700', '1988-06-10', '2023-04-01', '2024-04-01'),
('Anna', 'Nowak', 'anna.nowak@example.com', '600700800', '1995-09-15', '2023-04-15', '2024-04-15');

-- Dodanie nowych karnetów
INSERT INTO memberships (membership_type, price, duration_in_days)
VALUES
('Weekly', 15.00, 7),
('Quarterly', 120.00, 90);

-- Powiązanie nowych członków z karnetami
INSERT INTO member_memberships (member_id, membership_id, start_date, end_date)
VALUES
((SELECT member_id FROM members WHERE email = 'emilia.kowalska@example.com' LIMIT 1), (SELECT membership_id FROM memberships WHERE membership_type = 'Weekly' LIMIT 1), '2023-03-01', '2023-03-08'),
((SELECT member_id FROM members WHERE email = 'michal.jankowski@example.com' LIMIT 1), (SELECT membership_id FROM memberships WHERE membership_type = 'Quarterly' LIMIT 1), '2023-03-05', '2023-06-05'),
((SELECT member_id FROM members WHERE email = 'jan.kowalski@example.com' LIMIT 1), (SELECT membership_id FROM memberships WHERE membership_type = 'Weekly' LIMIT 1), '2023-04-01', '2023-04-08'),
((SELECT member_id FROM members WHERE email = 'anna.nowak@example.com' LIMIT 1), (SELECT membership_id FROM memberships WHERE membership_type = 'Quarterly' LIMIT 1), '2023-04-15', '2023-07-15');

-- Dodanie nowych trenerów
INSERT INTO trainers (first_name, last_name, email, phone_number, specialization)
VALUES
('Mateusz', 'Nowicki', 'mateusz.nowicki@example.com', '777888999', 'Pilates'),
('Tomasz', 'Lisowski', 'tomasz.lisowski@example.com', '666777888', 'Crossfit');

-- Dodanie nowych zajęć grupowych
INSERT INTO group_classes (class_name, class_description, schedule, trainer_id, max_participants)
VALUES
('Pilates Basics', 'Beginner-friendly pilates session.', '2023-03-10 09:00:00', (SELECT trainer_id FROM trainers WHERE email = 'mateusz.nowicki@example.com' LIMIT 1), 10),
('Crossfit Challenge', 'Advanced crossfit session for experienced participants.', '2023-03-10 19:00:00', (SELECT trainer_id FROM trainers WHERE email = 'tomasz.lisowski@example.com' LIMIT 1), 12);

-- Dodanie nowych sprzętów
INSERT INTO equipment (equipment_name, status, last_maintenance_date, next_maintenance_date)
VALUES
('Rowing Machine', 'available', '2023-02-15', '2023-08-15'),
('Stationary Bike', 'available', '2023-02-20', '2023-08-20');

-- Dodanie nowych zgłoszeń napraw
INSERT INTO equipment_repairs (equipment_id, report_date, repair_status, description)
VALUES
((SELECT equipment_id FROM equipment WHERE equipment_name = 'Rowing Machine' LIMIT 1), '2023-03-01 14:00:00', 'pending', 'Rowing machine monitor not working.');

-- Dodanie nowych wizyt
INSERT INTO visit_history (member_id, visit_date)
VALUES
((SELECT member_id FROM members WHERE email = 'emilia.kowalska@example.com' LIMIT 1), '2023-03-05 10:00:00'),
((SELECT member_id FROM members WHERE email = 'michal.jankowski@example.com' LIMIT 1), '2023-03-06 18:00:00'),
((SELECT member_id FROM members WHERE email = 'jan.kowalski@example.com' LIMIT 1), '2023-04-03 11:00:00'),
((SELECT member_id FROM members WHERE email = 'anna.nowak@example.com' LIMIT 1), '2023-04-17 17:00:00');

-- Dodanie nowych raportów
INSERT INTO reports (report_type, generated_date, content)
VALUES
('Weekly Report', '2023-03-01 12:00:00', 'Example content for weekly report.');
