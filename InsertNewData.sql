-- Dodanie nowych członków
INSERT INTO members (first_name, last_name, email, phone_number, date_of_birth, membership_start_date, membership_end_date)
VALUES
('Krzysztof', 'Nowak', 'krzysztof.nowak@example.com', '601202303', '1987-08-21', '2023-05-01', '2024-05-01'),
('Monika', 'Wiśniewska', 'monika.wisniewska@example.com', '602203404', '1993-11-12', '2023-06-10', '2024-06-10'),
('Tomasz', 'Kaczmarek', 'tomasz.kaczmarek@example.com', '603204505', '1985-04-05', '2023-07-20', '2024-07-20'),
('Alicja', 'Mazur', 'alicja.mazur@example.com', '604205606', '1997-12-15', '2023-08-15', '2024-08-15');

-- Dodanie nowych karnetów
INSERT INTO memberships (membership_type, price, duration_in_days)
VALUES
('Half-Yearly', 300.00, 180),
('Annual', 550.00, 365);

-- Powiązanie nowych członków z karnetami
INSERT INTO member_memberships (member_id, membership_id, start_date, end_date)
VALUES
((SELECT member_id FROM members WHERE email = 'krzysztof.nowak@example.com' LIMIT 1), 
 (SELECT membership_id FROM memberships WHERE membership_type = 'Annual' LIMIT 1), '2023-05-01', '2024-05-01'),
 
((SELECT member_id FROM members WHERE email = 'monika.wisniewska@example.com' LIMIT 1), 
 (SELECT membership_id FROM memberships WHERE membership_type = 'Half-Yearly' LIMIT 1), '2023-06-10', '2023-12-10');

-- Dodanie nowych trenerów
INSERT INTO trainers (first_name, last_name, email, phone_number, specialization)
VALUES
('Paweł', 'Lis', 'pawel.lis@example.com', '700800900', 'Yoga'),
('Ewa', 'Zielińska', 'ewa.zielinska@example.com', '710810910', 'Kickboxing');

-- Dodanie nowych zajęć grupowych
INSERT INTO group_classes (class_name, class_description, schedule, trainer_id, max_participants)
VALUES
('Yoga for Beginners', 'Relaxing yoga class for beginners.', '2023-09-10 08:00:00', 
 (SELECT trainer_id FROM trainers WHERE email = 'pawel.lis@example.com' LIMIT 1), 15),

('Kickboxing Challenge', 'High-intensity kickboxing training.', '2023-09-12 18:30:00', 
 (SELECT trainer_id FROM trainers WHERE email = 'ewa.zielinska@example.com' LIMIT 1), 10);

-- Dodanie rezerwacji na zajęcia
INSERT INTO class_reservations (class_id, member_id, reservation_date)
VALUES
((SELECT class_id FROM group_classes WHERE class_name = 'Yoga for Beginners' LIMIT 1),
 (SELECT member_id FROM members WHERE email = 'monika.wisniewska@example.com' LIMIT 1), '2023-09-09 08:00:00'),

((SELECT class_id FROM group_classes WHERE class_name = 'Kickboxing Challenge' LIMIT 1),
 (SELECT member_id FROM members WHERE email = 'tomasz.kaczmarek@example.com' LIMIT 1), '2023-09-11 18:30:00');

-- Dodanie nowego sprzętu
INSERT INTO equipment (equipment_name, status, last_maintenance_date, next_maintenance_date)
VALUES
('Treadmill', 'available', '2023-06-01', '2023-12-01'),
('Bench Press', 'available', '2023-07-10', '2024-01-10');

-- Dodanie nowych rezerwacji sprzętu
INSERT INTO equipment_reservations (equipment_id, member_id, reservation_start, reservation_end)
VALUES
((SELECT equipment_id FROM equipment WHERE equipment_name = 'Treadmill' LIMIT 1), 
 (SELECT member_id FROM members WHERE email = 'krzysztof.nowak@example.com' LIMIT 1), '2023-09-10 07:00:00', '2023-09-10 08:00:00'),

((SELECT equipment_id FROM equipment WHERE equipment_name = 'Bench Press' LIMIT 1), 
 (SELECT member_id FROM members WHERE email = 'tomasz.kaczmarek@example.com' LIMIT 1), '2023-09-11 17:30:00', '2023-09-11 18:00:00');

-- Dodanie zgłoszeń napraw sprzętu
INSERT INTO equipment_repairs (equipment_id, report_date, repair_status, description)
VALUES
((SELECT equipment_id FROM equipment WHERE equipment_name = 'Treadmill' LIMIT 1), 
 '2023-09-05 10:00:00', 'pending', 'Treadmill belt is slipping.');

-- Dodanie wizyt członków
INSERT INTO visit_history (member_id, visit_date)
VALUES
((SELECT member_id FROM members WHERE email = 'krzysztof.nowak@example.com' LIMIT 1), '2023-09-01 09:30:00'),
((SELECT member_id FROM members WHERE email = 'monika.wisniewska@example.com' LIMIT 1), '2023-09-02 10:15:00');

-- Dodanie nowego raportu
INSERT INTO reports (report_type, generated_date, content)
VALUES
('Monthly Usage Report', '2023-09-01 12:00:00', 'Summary of gym activities for August 2023.');
