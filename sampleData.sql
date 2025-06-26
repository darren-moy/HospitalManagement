-- Insert sample insurance providers
INSERT INTO InsuranceProvider (ProviderName, PolicyNumber, CoverageDetails, ContactNumber)
VALUES 
    ('Blue Cross', 'BC123456', 'Full medical coverage including hospitalization', '800-555-1001');

-- Insert doctor
INSERT INTO Doctor (DoctorID ,FirstName, LastName, Specialty, ContactNumber, Email)
VALUES
    ('Sarah', 'Johnson', 'Cardiology', '555-111-2222', 'dr.johnson@hospital.com');

-- Insert patient
INSERT INTO Patient (FirstName, LastName, DateOfBirth, ContactNumber, Email, Address, InsuranceID)
VALUES
    ('John', 'Smith', '1980-05-15', '555-123-4567', 'john.smith@email.com', '123 Main St, Anytown, USA', 1);

-- Insert appointment (with future dates that will pass validation)
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, Status, FollowUpDate)
VALUES
    (1, 1, '2024-12-15', '09:00:00', 'Annual heart checkup', 'Completed', '2025-06-15');

-- Insert medical record
INSERT INTO Medical_Records (PatientID, DoctorID, VisitDate, Diagnosis, Treatment, PrescribedMedications, Allergies)
VALUES
    (1, 1, '2023-12-15', 'Healthy cardiovascular system', 'Routine checkup completed', NULL, 'Penicillin');

-- Insert billing record
INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, DateIssued, InsuranceClaimed, InsuranceID)
VALUES
    (1, 1, 250.00, 'Paid', '2023-12-15', TRUE, 1);
SELECT * FROM appointment WHERE AppointmentID = 1;

-- Insert additional insurance providers
INSERT INTO InsuranceProvider (ProviderName, PolicyNumber, CoverageDetails, ContactNumber)
VALUES 
    ('Medicare', 'MC789012', 'Basic medical coverage for seniors', '800-555-2002'),
    ('Aetna', 'AE345678', 'Comprehensive health coverage', '800-555-3003'),
    ('United Healthcare', 'UH901234', 'Full coverage with dental', '800-555-4004');

-- Insert additional doctors
INSERT INTO Doctor (DoctorID ,FirstName, LastName, Specialty, ContactNumber, Email)
VALUES
    ('Michael', 'Chen', 'Neurology', '555-222-3333', 'dr.chen@hospital.com'),
    ('Lisa', 'Williams', 'Pediatrics', '555-333-4444', 'dr.williams@hospital.com'),
    ('David', 'Brown', 'Orthopedics', '555-444-5555', 'dr.brown@hospital.com');

-- Insert additional patients
INSERT INTO Patient (FirstName, LastName, DateOfBirth, ContactNumber, Email, Address, InsuranceID)
VALUES
    ('Emily', 'Davis', '1992-08-22', '555-234-5678', 'emily.davis@email.com', '456 Oak Ave, Somewhere, USA', 2),
    ('Robert', 'Wilson', '1975-03-10', '555-345-6789', 'robert.wilson@email.com', '789 Pine Rd, Nowhere, USA', 3),
    ('Maria', 'Garcia', '1988-11-05', '555-456-7890', 'maria.garcia@email.com', '321 Elm St, Anywhere, USA', 1),
    ('James', 'Johnson', '1960-07-15', '555-567-8901', 'james.johnson@email.com', '654 Maple Dr, Everywhere, USA', 4);

-- Insert additional appointments
INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, ReasonForVisit, Status, FollowUpDate)
VALUES
    (2, 2, 2, '2024-11-20', '10:30:00', 'Migraine evaluation', 'Scheduled', NULL),
    (3, 3, 3, '2024-12-01', '14:00:00', 'Child wellness check', 'Scheduled', '2025-06-01'),
    (4, 4, 1, '2024-12-10', '11:15:00', 'Chest pain evaluation', 'Completed', '2025-10-10'),
    (5, 5, 4, '2024-12-18', '13:45:00', 'Knee pain consultation', 'Scheduled', NULL),
    (6, 1, 2, '2025-12-22', '09:30:00', 'Follow-up for headaches', 'Scheduled', NULL),
    (7, 2, 1, '2025-01-05', '15:00:00', 'Cardiac screening', 'Scheduled', NULL);

-- Insert additional medical records
INSERT INTO Medical_Records (PatientID, DoctorID, VisitDate, Diagnosis, Treatment, PrescribedMedications, Allergies)
VALUES
    (2, 2, '2024-10-15', 'Chronic migraines', 'Prescribed medication and lifestyle changes', 'Sumatriptan 50mg', 'None'),
    (3, 3, '2024-09-10', 'Healthy child', 'Routine vaccinations administered', 'Vitamin D supplements', 'Peanuts'),
    (4, 1, '2024-11-05', 'Angina', 'Recommended stress test and medication', 'Nitroglycerin 0.4mg', 'Shellfish'),
    (5, 4, '2024-10-20', 'Osteoarthritis', 'Physical therapy recommended', 'Ibuprofen 600mg', 'Latex'),
    (1, 2, '2025-09-25', 'Tension headaches', 'Recommended relaxation techniques', NULL, 'Penicillin');

-- Insert additional billing records
INSERT INTO Billing (PatientID, AppointmentID, TotalAmount, PaymentStatus, DateIssued, InsuranceClaimed, InsuranceID)
VALUES
    (1, 1, 250.00, 'Paid', '2023-12-15', TRUE, 1),  -- For John Smith's heart checkup
    (2, 2, 180.00, 'Paid', '2024-11-20', TRUE, 2),  -- For Emily Davis' migraine evaluation
    (3, 3, 150.00, 'Unpaid', '2024-12-01', FALSE, 3),  -- For Robert Wilson's child check
    (4, 4, 300.00, 'Partial', '2024-12-10', TRUE, 1),  -- For Maria Garcia's chest pain eval
    (5, 5, 225.00, 'Unpaid', '2024-12-18', FALSE, 4),  -- For James Johnson's knee consult
    (1, 6, 175.00, 'Paid', '2024-12-22', TRUE, 1),  -- For John Smith's headache follow-up
    (2, 7, 200.00, 'Unpaid', '2025-01-05', TRUE, 2);  -- For Emily Davis' cardiac screening
