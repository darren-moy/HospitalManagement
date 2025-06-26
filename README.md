# Hospital Management SQL Project

This project demonstrates a relational database design for a hospital management system.

## Files

- `hospital_schema.sql`: Defines all tables and relationships.
- `sample_data.sql`: Populates the database with sample records.

## Features
- Tracks doctors, patients, appointments, billing, and medical records.
- Uses foreign keys for data integrity.
- Sample dataset provided for testing.

## Example SQL Queries
- Get all patients covered by "Blue Cross"
SELECT FirstName, LastName
FROM Patient
JOIN InsuranceProvider ON Patient.InsuranceID = InsuranceProvider.InsuranceID
WHERE ProviderName = 'Blue Cross';

- Show all upcoming appointments
SELECT a.AppointmentID, p.FirstName AS Patient, d.FirstName AS Doctor, a.AppointmentDate, a.Status
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
WHERE a.AppointmentDate > CURDATE();

-Count how many appointments each doctor has
SELECT d.FirstName, d.LastName, COUNT(*) AS TotalAppointments
FROM Appointment a
JOIN Doctor d ON a.DoctorID = d.DoctorID
GROUP BY a.DoctorID;

