-- ============================================================
--  HealthcareDB  Sample Data  INSERT Statements
-- ============================================================

USE HealthcareDB;


-- ────────────────────────────────────────────────────────────
-- 1. SPECIALIZATION  (10 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Specialization (Name) VALUES
('Cardiology'),
('Dermatology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Oncology'),
('Radiology'),
('Psychiatry'),
('Endocrinology'),
('Gastroenterology');


-- ────────────────────────────────────────────────────────────
-- 2. DOCTOR  (15 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Doctor (Name, Phone, SpecializationID) VALUES
('Dr. Ahmed Hassan',      '0100000001', 1),   -- Cardiology
('Dr. Sara Ali',          '0100000002', 2),   -- Dermatology
('Dr. Mohamed Adel',      '0100000003', 3),   -- Neurology
('Dr. Nour Ibrahim',      '0100000004', 4),   -- Orthopedics
('Dr. Laila Samir',       '0100000005', 5),   -- Pediatrics
('Dr. Khaled Mansour',    '0100000006', 6),   -- Oncology
('Dr. Rania Fawzy',       '0100000007', 7),   -- Radiology
('Dr. Tarek Mostafa',     '0100000008', 8),   -- Psychiatry
('Dr. Heba Sayed',        '0100000009', 9),   -- Endocrinology
('Dr. Omar Farouk',       '0100000010', 10),  -- Gastroenterology
('Dr. Dina Khalil',       '0100000011', 1),   -- Cardiology
('Dr. Youssef Nabil',     '0100000012', 3),   -- Neurology
('Dr. Mariam Gamal',      '0100000013', 5),   -- Pediatrics
('Dr. Sherif Abdallah',   '0100000014', 4),   -- Orthopedics
('Dr. Noha Ramadan',      '0100000015', 2);   -- Dermatology


-- ────────────────────────────────────────────────────────────
-- 3. PATIENT  (20 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Patient (Name, Gender, DateOfBirth, Phone) VALUES
('Marwan Mohamed',   'Male',   '2003-05-10', '0111111111'),
('Omar Khaled',      'Male',   '2002-08-20', '0122222222'),
('Laila Hassan',     'Female', '2001-03-15', '0155555555'),
('Youssef Tarek',    'Male',   '1999-11-02', '0101234567'),
('Mona Ali',         'Female', '1998-07-19', '0123456789'),
('Salma Adel',       'Female', '1995-02-28', '0111222333'),
('Kareem Nasser',    'Male',   '1990-06-14', '0122333444'),
('Rasha Ibrahim',    'Female', '1985-09-05', '0133444555'),
('Tamer Hosny',      'Male',   '1980-12-22', '0144555666'),
('Nadia Samir',      'Female', '1975-04-18', '0155666777'),
('Hesham Fathy',     'Male',   '1970-01-30', '0166777888'),
('Eman Mostafa',     'Female', '2000-07-07', '0177888999'),
('Samer Youssef',    'Male',   '1997-10-10', '0188999000'),
('Doaa Mahmoud',     'Female', '1993-03-03', '0199000111'),
('Adel Ramzy',       'Male',   '1988-08-08', '0100111222'),
('Farida Gamal',     'Female', '2004-11-15', '0111333555'),
('Ziad Hossam',      'Male',   '2005-02-20', '0122444666'),
('Hana Wael',        'Female', '1996-06-25', '0133555777'),
('Bassem Saad',      'Male',   '1983-09-09', '0144666888'),
('Yasmine Lotfy',    'Female', '1991-12-12', '0155777999');


-- ────────────────────────────────────────────────────────────
-- 4. SCHEDULE  (30 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Schedule (DoctorID, AvailableDate, AvailableTime) VALUES
-- Dr. Ahmed Hassan (Cardiology)
(1,  '2026-05-05', '09:00'),
(1,  '2026-05-05', '11:00'),
(1,  '2026-05-06', '10:00'),
-- Dr. Sara Ali (Dermatology)
(2,  '2026-05-05', '10:00'),
(2,  '2026-05-07', '12:00'),
-- Dr. Mohamed Adel (Neurology)
(3,  '2026-05-06', '08:00'),
(3,  '2026-05-06', '14:00'),
(3,  '2026-05-08', '09:00'),
-- Dr. Nour Ibrahim (Orthopedics)
(4,  '2026-05-07', '09:00'),
(4,  '2026-05-08', '11:00'),
-- Dr. Laila Samir (Pediatrics)
(5,  '2026-05-05', '13:00'),
(5,  '2026-05-09', '10:00'),
-- Dr. Khaled Mansour (Oncology)
(6,  '2026-05-06', '11:00'),
(6,  '2026-05-10', '15:00'),
-- Dr. Rania Fawzy (Radiology)
(7,  '2026-05-07', '08:00'),
(7,  '2026-05-07', '13:00'),
-- Dr. Tarek Mostafa (Psychiatry)
(8,  '2026-05-08', '10:00'),
(8,  '2026-05-09', '14:00'),
-- Dr. Heba Sayed (Endocrinology)
(9,  '2026-05-09', '09:00'),
(9,  '2026-05-10', '11:00'),
-- Dr. Omar Farouk (Gastroenterology)
(10, '2026-05-10', '08:00'),
(10, '2026-05-11', '12:00'),
-- Dr. Dina Khalil (Cardiology)
(11, '2026-05-11', '09:00'),
(11, '2026-05-12', '10:00'),
-- Dr. Youssef Nabil (Neurology)
(12, '2026-05-12', '14:00'),
(12, '2026-05-13', '09:00'),
-- Dr. Mariam Gamal (Pediatrics)
(13, '2026-05-13', '10:00'),
(13, '2026-05-14', '11:00'),
-- Dr. Sherif Abdallah (Orthopedics)
(14, '2026-05-14', '08:00'),
(14, '2026-05-15', '13:00');


-- ────────────────────────────────────────────────────────────
-- 5. APPOINTMENT  (25 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1,  2,  '2026-04-01 10:00', 'Completed'),
(2,  3,  '2026-04-02 09:00', 'Completed'),
(3,  4,  '2026-04-03 11:00', 'Completed'),
(4,  5,  '2026-04-04 14:00', 'Cancelled'),
(5,  1,  '2026-04-05 09:00', 'Completed'),
(6,  6,  '2026-04-06 10:00', 'Completed'),
(7,  7,  '2026-04-07 08:00', 'Scheduled'),
(8,  8,  '2026-04-08 10:00', 'Completed'),
(9,  9,  '2026-04-09 09:00', 'Cancelled'),
(10, 10, '2026-04-10 12:00', 'Completed'),
(11, 1,  '2026-04-11 11:00', 'Completed'),
(12, 2,  '2026-04-12 10:00', 'Scheduled'),
(13, 3,  '2026-04-13 09:00', 'Completed'),
(14, 4,  '2026-04-14 11:00', 'Cancelled'),
(15, 5,  '2026-04-15 13:00', 'Completed'),
(16, 6,  '2026-04-16 14:00', 'Completed'),
(17, 7,  '2026-04-17 08:00', 'Scheduled'),
(18, 8,  '2026-04-18 10:00', 'Completed'),
(19, 9,  '2026-04-19 09:00', 'Completed'),
(20, 10, '2026-04-20 12:00', 'Cancelled'),
(1,  11, '2026-04-21 09:00', 'Completed'),
(3,  12, '2026-04-22 14:00', 'Completed'),
(5,  13, '2026-04-23 10:00', 'Scheduled'),
(7,  14, '2026-04-24 08:00', 'Completed'),
(9,  15, '2026-04-25 11:00', 'Completed');


-- ────────────────────────────────────────────────────────────
-- 6. MEDICATION  (15 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO Medication (Name, Description) VALUES
('Paracetamol',   'Pain reliever and fever reducer'),
('Ibuprofen',     'Anti-inflammatory, pain reliever'),
('Amoxicillin',   'Broad-spectrum antibiotic'),
('Aspirin',       'Blood thinner and pain reliever'),
('Vitamin C',     'Immune system supplement'),
('Metformin',     'Type 2 diabetes management'),
('Atorvastatin',  'Cholesterol-lowering statin'),
('Omeprazole',    'Proton pump inhibitor for acid reflux'),
('Sertraline',    'Antidepressant (SSRI)'),
('Amlodipine',    'Calcium channel blocker for hypertension'),
('Cetirizine',    'Antihistamine for allergies'),
('Azithromycin',  'Macrolide antibiotic'),
('Prednisone',    'Corticosteroid anti-inflammatory'),
('Lisinopril',    'ACE inhibitor for blood pressure'),
('Gabapentin',    'Nerve pain and seizure medication');


-- ────────────────────────────────────────────────────────────
-- 7. PRESCRIPTION  (15 rows — one per completed appointment)
-- ────────────────────────────────────────────────────────────
INSERT INTO Prescription (AppointmentID, Notes) VALUES
(1,  'Apply cream twice daily, avoid sun exposure'),
(2,  'Rest and increase fluid intake'),
(3,  'Physical therapy recommended after medication course'),
(5,  'Monitor blood pressure weekly'),
(6,  'Follow-up scan in 3 months'),
(8,  'Continue therapy sessions bi-weekly'),
(10, 'Low-fat diet advised alongside medication'),
(11, 'Repeat ECG in 6 weeks'),
(13, 'MRI follow-up in 4 weeks'),
(15, 'Vaccine booster scheduled next visit'),
(16, 'Chemotherapy cycle 2 begins next week'),
(18, 'Journaling and mindfulness exercises advised'),
(19, 'Check HbA1c in 3 months'),
(21, 'Stress test scheduled for next visit'),
(22, 'Adjust dosage if headaches persist');


-- ────────────────────────────────────────────────────────────
-- 8. PRESCRIPTIONDETAILS  (30 rows)
-- ────────────────────────────────────────────────────────────
INSERT INTO PrescriptionDetails (PrescriptionID, MedicationID, Dosage) VALUES
-- Prescription 1 (Dermatology)
(1,  11, '10mg once daily'),
(1,  2,  '200mg after meals'),
-- Prescription 2 (Neurology)
(2,  1,  '500mg twice daily'),
(2,  5,  '1000mg once daily'),
-- Prescription 3 (Orthopedics)
(3,  2,  '400mg three times daily'),
(3,  13, '5mg once daily for 5 days'),
-- Prescription 4 (Cardiology)
(4,  10, '5mg once daily'),
(4,  7,  '20mg once daily at night'),
(4,  14, '10mg once daily'),
-- Prescription 5 (Oncology)
(5,  13, '20mg once daily'),
(5,  1,  '500mg as needed for pain'),
-- Prescription 6 (Psychiatry)
(6,  9,  '50mg once daily'),
-- Prescription 7 (Gastroenterology)
(7,  8,  '20mg before breakfast'),
(7,  2,  '400mg after meals'),
-- Prescription 8 (Cardiology)
(8,  10, '10mg once daily'),
(8,  4,  '75mg once daily'),
(8,  7,  '40mg once daily'),
-- Prescription 9 (Neurology)
(9,  15, '300mg twice daily'),
(9,  1,  '500mg as needed'),
-- Prescription 10 (Pediatrics)
(10, 1,  '250mg three times daily'),
(10, 5,  '500mg once daily'),
-- Prescription 11 (Oncology)
(11, 13, '60mg daily tapering over 2 weeks'),
-- Prescription 12 (Psychiatry)
(12, 9,  '100mg once daily'),
(12, 1,  '500mg as needed'),
-- Prescription 13 (Endocrinology)
(13, 6,  '500mg twice daily with meals'),
(13, 5,  '1000mg once daily'),
-- Prescription 14 (Cardiology)
(14, 14, '5mg once daily'),
(14, 7,  '20mg once daily'),
(14, 4,  '75mg once daily'),
-- Prescription 15 (Neurology)
(15, 15, '100mg three times daily'),
(15, 1,  '500mg as needed for pain');


-- ============================================================
--  End of file
-- ============================================================
