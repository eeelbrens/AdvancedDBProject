
--DataBasewarehouse
CREATE TABLE Dim_Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(20)
);

CREATE TABLE Dim_Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Dim_Specialization (
    SpecializationID INT PRIMARY KEY,
    SpecializationName VARCHAR(100)
);

CREATE TABLE Dim_Time (
    TimeID INT PRIMARY KEY,
    FullDate DATE,
    DayNumber INT,
    MonthNumber INT,
    YearNumber INT
);

CREATE TABLE Fact_Appointment (
    FactID INT PRIMARY KEY IDENTITY,

    PatientID INT,
    DoctorID INT,
    SpecializationID INT,
    TimeID INT,

    AppointmentCount INT,
    PrescriptionCount INT,

    FOREIGN KEY (PatientID)
    REFERENCES Dim_Patient(PatientID),

    FOREIGN KEY (DoctorID)
    REFERENCES Dim_Doctor(DoctorID),

    FOREIGN KEY (SpecializationID)
    REFERENCES Dim_Specialization(SpecializationID),

    FOREIGN KEY (TimeID)
    REFERENCES Dim_Time(TimeID)
);

-- ETL Processes

INSERT INTO Dim_Patient
(
    PatientID,
    PatientName,
    Gender,
    Age,
    Phone
)

SELECT
    PatientID,
    Name,
    Gender,

    DATEDIFF(YEAR, DateOfBirth, GETDATE()),

    Phone

FROM HealthcareDB.dbo.Patient;


INSERT INTO Dim_Doctor
(
    DoctorID,
    DoctorName,
    Phone
)

SELECT
    DoctorID,
    Name,
    Phone

FROM HealthcareDB.dbo.Doctor;


INSERT INTO Dim_Specialization
(
    SpecializationID,
    SpecializationName
)

SELECT
    SpecializationID,
    Name

FROM HealthcareDB.dbo.Specialization;


INSERT INTO Dim_Time
(
    TimeID,
    FullDate,
    DayNumber,
    MonthNumber,
    YearNumber
)

SELECT DISTINCT

    CAST(
        FORMAT(AppointmentDate,'yyyyMMdd')
        AS INT
    ),

    CAST(AppointmentDate AS DATE),

    DAY(AppointmentDate),
    MONTH(AppointmentDate),
    YEAR(AppointmentDate)

FROM HealthcareDB.dbo.Appointment;


INSERT INTO Fact_Appointment
(
    PatientID,
    DoctorID,
    SpecializationID,
    TimeID,
    AppointmentCount,
    PrescriptionCount
)

SELECT

    A.PatientID,

    A.DoctorID,

    D.SpecializationID,

    CAST(
        FORMAT(A.AppointmentDate,'yyyyMMdd')
        AS INT
    ),

    1,

    COUNT(P.PrescriptionID)

FROM HealthcareDB.dbo.Appointment A

JOIN HealthcareDB.dbo.Doctor D
ON A.DoctorID = D.DoctorID

LEFT JOIN HealthcareDB.dbo.Prescription P
ON A.AppointmentID = P.AppointmentID

GROUP BY

    A.PatientID,
    A.DoctorID,
    D.SpecializationID,
    A.AppointmentDate;


--analysis query
 

-- Total Appointments Per Specialization
SELECT
    S.SpecializationName,
    SUM(F.AppointmentCount) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Specialization S
ON F.SpecializationID = S.SpecializationID
GROUP BY S.SpecializationName;


-- Top 5 Doctors By Number Of Appointments
SELECT TOP 5
    D.DoctorName,
    SUM(F.AppointmentCount) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Doctor D
ON F.DoctorID = D.DoctorID
GROUP BY D.DoctorName
ORDER BY TotalAppointments DESC;


-- Total Prescriptions Per Year
SELECT
    T.YearNumber,
    SUM(F.PrescriptionCount) AS TotalPrescriptions
FROM Fact_Appointment F
JOIN Dim_Time T
ON F.TimeID = T.TimeID
GROUP BY T.YearNumber
ORDER BY T.YearNumber;


-- Total Patients By Gender
SELECT
    P.Gender,
    COUNT(*) AS TotalPatients
FROM Dim_Patient P
GROUP BY P.Gender;


-- Total Appointments Per Month
SELECT
    T.MonthNumber,
    SUM(F.AppointmentCount) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Time T
ON F.TimeID = T.TimeID
GROUP BY T.MonthNumber
ORDER BY T.MonthNumber;


-- Doctors With Prescriptions Count
SELECT
    D.DoctorName,
    SUM(F.PrescriptionCount) AS TotalPrescriptions
FROM Fact_Appointment F
JOIN Dim_Doctor D
ON F.DoctorID = D.DoctorID
GROUP BY D.DoctorName
ORDER BY TotalPrescriptions DESC;


-- Number Of Appointments For Each Patient
SELECT
    P.PatientName,
    SUM(F.AppointmentCount) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Patient P
ON F.PatientID = P.PatientID
GROUP BY P.PatientName
ORDER BY TotalAppointments DESC;


-- Appointments By Gender
SELECT
    P.Gender,
    SUM(F.AppointmentCount) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Patient P
ON F.PatientID = P.PatientID
GROUP BY P.Gender;


-- Yearly Appointment Trend
SELECT
    T.YearNumber,
    COUNT(*) AS TotalAppointments
FROM Fact_Appointment F
JOIN Dim_Time T
ON F.TimeID = T.TimeID
GROUP BY T.YearNumber
ORDER BY T.YearNumber;


-- Most Active Specializations
SELECT
    S.SpecializationName,
    COUNT(*) AS AppointmentFrequency
FROM Fact_Appointment F
JOIN Dim_Specialization S
ON F.SpecializationID = S.SpecializationID
GROUP BY S.SpecializationName
ORDER BY AppointmentFrequency DESC;





select * from Fact_Appointment

select COUNT(*) from Dim_Patient

select COUNT(*) from Dim_Doctor

select COUNT(*) from Dim_Specialization

select COUNT(*) from Dim_Time
