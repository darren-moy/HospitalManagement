-- Create Database
CREATE DATABASE IF NOT EXISTS HospitalManagementSystem;
USE HospitalManagementSystem;

-- Create Insurance Provider Table
CREATE TABLE InsuranceProvider (
    InsuranceID INT PRIMARY KEY AUTO_INCREMENT,
    ProviderName VARCHAR(100) NOT NULL,
    PolicyNumber VARCHAR(50),
    CoverageDetails TEXT,
    ContactNumber VARCHAR(20)
);
-- Create Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100),
    Address TEXT,
    InsuranceID INT,
    FOREIGN KEY (InsuranceID) REFERENCES InsuranceProvider(InsuranceID)
);

-- Create Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100)
);

-- Create Appointment Table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    ReasonForVisit TEXT NOT NULL,
    Status ENUM('Scheduled', 'Cancelled', 'Rescheduled', 'Completed') DEFAULT 'Scheduled',
    FollowUpDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    INDEX (AppointmentDate, AppointmentTime)
);

-- Create Medical_Records Table
CREATE TABLE Medical_Records (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    VisitDate DATE NOT NULL,
    Diagnosis TEXT NOT NULL,
    Treatment TEXT,
    PrescribedMedications TEXT,
    Allergies TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create Billing Table
CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    AppointmentID INT,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Unpaid', 'Partial') DEFAULT 'Unpaid',
    DateIssued DATE NOT NULL,
    InsuranceClaimed BOOLEAN DEFAULT FALSE,
    InsuranceID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (InsuranceID) REFERENCES InsuranceProvider(InsuranceID)
);

-- Add email constraints
ALTER TABLE Patient ADD CONSTRAINT chk_patient_email 
CHECK (Email LIKE '%@%.%' OR Email IS NULL);

ALTER TABLE Doctor ADD CONSTRAINT chk_doctor_email 
CHECK (Email LIKE '%@%.%' OR Email IS NULL);

-- Create indexes
CREATE INDEX idx_patient_name ON Patient(LastName, FirstName);
CREATE INDEX idx_doctor_specialty ON Doctor(Specialty);
CREATE INDEX idx_billing_status ON Billing(PaymentStatus);

-- Set delimiter for trigger creation
DELIMITER //

-- Create appointment date validation trigger (corrected to check FollowUpDate)
CREATE TRIGGER check_followup_date
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.FollowUpDate IS NOT NULL AND NEW.FollowUpDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Followup date cannot be in the past';
    END IF;
END//

-- Reset delimiter
DELIMITER ;
