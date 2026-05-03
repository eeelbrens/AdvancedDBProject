-- ============================================================
--  HealthcareDB  Basic Queries
-- ============================================================

USE HealthcareDB;


-- ────────────────────────────────────────────────────────────
-- 1. SELECT  All doctors with their specialization
-- ────────────────────────────────────────────────────────────
SELECT
    d.DoctorID,
    d.Name      AS DoctorName,
    d.Phone,
    s.Name      AS Specialization
FROM   Doctor d
JOIN   Specialization s ON d.SpecializationID = s.SpecializationID
ORDER BY d.Name;


-- ────────────────────────────────────────────────────────────
-- 2. JOIN  All appointments with patient and doctor names
-- ────────────────────────────────────────────────────────────
SELECT
    a.AppointmentID,
    p.Name          AS PatientName,
    d.Name          AS DoctorName,
    s.Name          AS Specialization,
    a.AppointmentDate,
    a.Status
FROM   Appointment a
JOIN   Patient         p ON a.PatientID        = p.PatientID
JOIN   Doctor          d ON a.DoctorID         = d.DoctorID
JOIN   Specialization  s ON d.SpecializationID = s.SpecializationID
ORDER BY a.AppointmentDate DESC;


-- ────────────────────────────────────────────────────────────
-- 3. WHERE  Completed appointments only
-- ────────────────────────────────────────────────────────────
SELECT
    p.Name   AS Patient,
    d.Name   AS Doctor,
    a.AppointmentDate
FROM   Appointment a
JOIN   Patient p ON a.PatientID = p.PatientID
JOIN   Doctor  d ON a.DoctorID  = d.DoctorID
WHERE  a.Status = 'Completed'
ORDER BY a.AppointmentDate;


-- ────────────────────────────────────────────────────────────
-- 4. GROUP BY  Number of appointments per doctor
-- ────────────────────────────────────────────────────────────
SELECT
    d.Name                                                            AS DoctorName,
    s.Name                                                            AS Specialization,
    COUNT(a.AppointmentID)                                            AS TotalAppointments,
    SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END)          AS Completed,
    SUM(CASE WHEN a.Status = 'Cancelled' THEN 1 ELSE 0 END)          AS Cancelled
FROM   Doctor d
JOIN   Specialization s  ON d.SpecializationID = s.SpecializationID
LEFT JOIN Appointment a  ON d.DoctorID         = a.DoctorID
GROUP BY d.DoctorID, d.Name, s.Name
ORDER BY TotalAppointments DESC;


-- ────────────────────────────────────────────────────────────
-- 5. HAVING  Doctors with more than one appointment
-- ────────────────────────────────────────────────────────────
SELECT
    d.Name                 AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM   Doctor d
JOIN   Appointment a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Name
HAVING   COUNT(a.AppointmentID) > 1
ORDER BY TotalAppointments DESC;


-- ────────────────────────────────────────────────────────────
-- 6. LEFT JOIN  Patients who never booked an appointment
-- ────────────────────────────────────────────────────────────
SELECT
    p.PatientID,
    p.Name  AS PatientName,
    p.Phone
FROM      Patient     p
LEFT JOIN Appointment a ON p.PatientID = a.PatientID
WHERE     a.AppointmentID IS NULL;


-- ────────────────────────────────────────────────────────────
-- 7. AGG  Full prescription details (5-table join)
-- ────────────────────────────────────────────────────────────
SELECT
    p.Name   AS Patient,
    d.Name   AS Doctor,
    pr.Notes AS PrescriptionNotes,
    m.Name   AS Medication,
    pd.Dosage
FROM   Prescription        pr
JOIN   Appointment         a  ON pr.AppointmentID  = a.AppointmentID
JOIN   Patient             p  ON a.PatientID       = p.PatientID
JOIN   Doctor              d  ON a.DoctorID        = d.DoctorID
JOIN   PrescriptionDetails pd ON pr.PrescriptionID = pd.PrescriptionID
JOIN   Medication          m  ON pd.MedicationID   = m.MedicationID
ORDER BY p.Name, m.Name;


-- ────────────────────────────────────────────────────────────
-- 8. SUBQUERY  Doctors busier than average
-- ────────────────────────────────────────────────────────────
SELECT
    d.Name                 AS DoctorName,
    COUNT(a.AppointmentID) AS Appointments
FROM   Doctor d
JOIN   Appointment a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Name
HAVING   COUNT(a.AppointmentID) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(AppointmentID) AS cnt
        FROM   Appointment
        GROUP BY DoctorID
    ) AS sub
);


-- ────────────────────────────────────────────────────────────
-- 9. AGG  Most prescribed medications
-- ────────────────────────────────────────────────────────────
SELECT
    m.Name                   AS Medication,
    m.Description,
    COUNT(pd.PrescriptionID) AS TimesPrescribed
FROM   Medication          m
JOIN   PrescriptionDetails pd ON m.MedicationID = pd.MedicationID
GROUP BY m.MedicationID, m.Name, m.Description
ORDER BY TimesPrescribed DESC;


-- ────────────────────────────────────────────────────────────
-- 10. SELECT  Doctor available schedule slots (upcoming)
-- ────────────────────────────────────────────────────────────
SELECT
    d.Name          AS DoctorName,
    s.Name          AS Specialization,
    sc.AvailableDate,
    sc.AvailableTime
FROM   Schedule       sc
JOIN   Doctor         d ON sc.DoctorID         = d.DoctorID
JOIN   Specialization s ON d.SpecializationID  = s.SpecializationID
WHERE  sc.AvailableDate >= CAST(GETDATE() AS DATE)
ORDER BY sc.AvailableDate, sc.AvailableTime;


-- ============================================================
--  End of file
-- ============================================================
