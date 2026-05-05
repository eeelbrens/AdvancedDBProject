use HealthcareDB;



-- Concurrency

-- scenario 1: dirty read 




SELECT AppointmentID, Status
FROM   Appointment
WHERE  AppointmentID = 1;

/*
observation: sessionB SELECT blocks until execution,
then old value reads
explanation: SQL Server's default policy is READ COMMITTED, where
it reads the rolled back value after committing sessionA transaction 
*/



-- scenario 2: deadlock




BEGIN TRANSACTION;
    UPDATE Appointment
    SET    Status = 'Cancelled'
    WHERE  AppointmentID = 2;




    UPDATE Appointment
    SET    Status = 'Cancelled'
    WHERE  AppointmentID = 1; -- fail: deadlock detected

/*
observation: sessionB transaction deadlocks and cancels the transaction.
explanation: each transaction initially holds a lock on AppointmentID = 1
and AppointmentID = 2 respectively. When a deadlock occurs, SQL Server's
default behavior is to cancel the second transaction completely whenever that
deadlock is detected.
*/


-- Recovery from a System Failure




-- before fail
SELECT p.PrescriptionID, p.Notes
FROM   Prescription p
WHERE  p.AppointmentID = 14;




-- after rollback
SELECT p.PrescriptionID, p.Notes
FROM   Prescription p
WHERE  p.AppointmentID = 14;

/*
observation: sessionB's select will also roll back, following ACID's atomicity
principle
explanation: due to sessionB SELECT blocked as a result of READ COMMITTED default policy,
rolling back a transaction (automatically due to XACT_ABORT ON)
also rolls back the blocked SELECTs
*/
