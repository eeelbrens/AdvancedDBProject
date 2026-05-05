use HealthcareDB;

SET XACT_ABORT ON; -- aborts a transaction in case of a failure in transaction

-- Concurrency

-- scenario 1: dirty read
BEGIN TRANSACTION;
    UPDATE Appointment
    SET    Status = 'Scheduled'
    WHERE  AppointmentID = 1;



ROLLBACK TRANSACTION;









-- scenario 2: deadlock
BEGIN TRANSACTION;
    UPDATE Appointment
    SET    Status = 'Scheduled'
    WHERE  AppointmentID = 1;




    UPDATE Appointment
    SET    Status = 'Scheduled'
    WHERE  AppointmentID = 2;




COMMIT TRANSACTION;









-- Recovery from a System Failure

BEGIN TRANSACTION;
    INSERT INTO Prescription(AppointmentID, Notes)
    VALUES (14, 'Post-op care — take with food'); -- there's no yet Prescription linked to Appointment 14
    


    
    DECLARE @rxID INT = SCOPE_IDENTITY();
    INSERT INTO PrescriptionDetails(PrescriptionID, MedicationID, Dosage)
    VALUES (@rxID, 999, '100mg once daily'); -- bad entry: there's no PrescriptionID = 999
ROLLBACK TRANSACTION; -- simulating will rollback sessionB select












