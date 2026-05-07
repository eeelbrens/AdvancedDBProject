--optmization and window func stored procedure and clusterd index 
CREATE PROCEDURE GetDoctorAppointmentsoptimaed
    @DoctorID INT
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        A.AppointmentID,
        P.Name AS PatientName,
        A.AppointmentDate,
        A.Status
    FROM Appointment A
    INNER JOIN Patient P
        ON A.PatientID = P.PatientID
    WHERE A.DoctorID = @DoctorID
    ORDER BY A.AppointmentDate;

END;
GO

-- Optimized Procedure: CancelAppointment
CREATE PROCEDURE CancelAppointment
    @AppointmentID INT
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE Appointment
    SET Status = 'Cancelled'
    WHERE AppointmentID = @AppointmentID;

END;
GO

-- Optimized Procedure: BookAppointment
CREATE PROCEDURE BookAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppointmentDate DATETIME
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO Appointment
    (
        PatientID,
        DoctorID,
        AppointmentDate,
        Status
    )
    VALUES
    (
        @PatientID,
        @DoctorID,
        @AppointmentDate,
        'Scheduled'
    );

END;
GO




CREATE PROCEDURE CancelAppointment
    @AppointmentID INT
AS
BEGIN

    UPDATE Appointment
    SET Status = 'Cancelled'
    WHERE AppointmentID = @AppointmentID;

END;



CREATE PROCEDURE BookAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppointmentDate DATETIME
AS
BEGIN

    INSERT INTO Appointment
    (
        PatientID,
        DoctorID,
        AppointmentDate,
        Status
    )
    VALUES
    (
        @PatientID,
        @DoctorID,
        @AppointmentDate,
        'Scheduled'
    );

END;







    SELECT
    DoctorID,
    AppointmentID,
    AppointmentDate,

    ROW_NUMBER() OVER
    (
        PARTITION BY DoctorID
        ORDER BY AppointmentDate
    ) AS RowNum

FROM Appointment;


SELECT
    DoctorID,
    COUNT(*) AS TotalAppointments,

    RANK() OVER
    (
        ORDER BY COUNT(*) DESC
    ) AS DoctorRank

FROM Appointment
GROUP BY DoctorID;




SELECT
    DoctorID,
    COUNT(*) AS TotalAppointments,

    DENSE_RANK() OVER
    (
        ORDER BY COUNT(*) DESC
    ) AS DenseRanking

FROM Appointment
GROUP BY DoctorID;



CREATE NONCLUSTERED INDEX IX_Appointment_Doctor_Date
ON Appointment (DoctorID, AppointmentDate);


CREATE NONCLUSTERED INDEX IX_Appointment_Patient
ON Appointment (PatientID);

CREATE NONCLUSTERED INDEX IX_Schedule_Doctor
ON Schedule (DoctorID);


SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Appointment
WHERE DoctorID = 2
AND AppointmentDate = '2026-05-10 11:00';

CREATE NONCLUSTERED INDEX IX_Appointment_Doctor_Date2
ON Appointment (DoctorID, AppointmentDate);



