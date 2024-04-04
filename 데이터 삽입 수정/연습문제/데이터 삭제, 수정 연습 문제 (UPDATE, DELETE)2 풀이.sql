-- 답안 1:
INSERT INTO Patients (Name, BirthDate, Gender, PhoneNumber)
VALUES ('John Smith', '1985-02-20', 'M', '123-456-7890');

-- 답안 2:
INSERT INTO Appointments (PatientID, AppointmentDate, AppointmentTime, Type)
VALUES (1, '2023-04-20', '10:00', 'General Checkup');

-- 답안 3:
INSERT INTO MedicalRecords (PatientID, VisitDate, Diagnosis, Prescription)
VALUES (1, '2023-04-10', 'Common Cold', 'Rest and hydration');

-- 답안 4:
UPDATE Patients
SET PhoneNumber = '987-654-3210'
WHERE PatientID = 1;

-- 답안 5:
UPDATE Appointments
SET AppointmentTime = '14:00'
WHERE PatientID = 1 AND AppointmentDate = '2023-04-20';

-- 답안 6:
UPDATE MedicalRecords
SET Diagnosis = 'Seasonal Allergies'
WHERE PatientID = 1 AND VisitDate = '2023-04-10';

-- 답안 7:
DELETE FROM Appointments
WHERE AppointmentDate = '2023-04-20';

-- 답안 8:
DELETE FROM MedicalRecords
WHERE Diagnosis = 'Seasonal Allergies';

-- 답안 9:
DELETE FROM Patients
WHERE PatientID = 1;


-- 답안 10:
INSERT INTO Patients (Name, BirthDate, Gender, PhoneNumber)
VALUES ('Alice Johnson', '1992-08-24', 'F', '555-1234'),
       ('Bob Williams', '1980-03-15', 'M', '555-5678');