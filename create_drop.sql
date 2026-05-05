CREATE DATABASE HealthcareDB;
use HealthcareDB;

-- Specialization
CREATE TABLE Specialization (
    SpecializationID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL UNIQUE
);

-- Doctor
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    SpecializationID INT NOT NULL,
    FOREIGN KEY (SpecializationID) REFERENCES Specialization(SpecializationID)
);

-- Patient
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    DateOfBirth DATE,
    Phone VARCHAR(20) UNIQUE
);

-- Schedule
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY IDENTITY,
    DoctorID INT NOT NULL,
    AvailableDate DATE NOT NULL,
    AvailableTime TIME NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    UNIQUE (DoctorID, AvailableDate, AvailableTime)
);

-- Appointment
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Scheduled','Completed','Cancelled')),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Prescription
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY IDENTITY,
    AppointmentID INT UNIQUE,
    Notes VARCHAR(255),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

-- Medication
CREATE TABLE Medication (
    MedicationID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

-- Bridge Table
CREATE TABLE PrescriptionDetails (
    PrescriptionID INT,
    MedicationID INT,
    Dosage VARCHAR(50),
    PRIMARY KEY (PrescriptionID, MedicationID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID),
    FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);

-- drop
use HealthCareDb;
DROP TABLE IF EXISTS PrescriptionDetails;
DROP TABLE IF EXISTS Prescription;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Specialization;
DROP TABLE IF EXISTS Medication;
