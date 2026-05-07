# HealthCare database
- see eerd.html
- 
  
# database Optimization and Stored Procedures (Healthcare System)
-In this project, several database optimization techniques and stored procedures were implemented to improve system performance and simplify data operations.

1. Stored Procedures

Three stored procedures were created to manage core operations in the system:

BookAppointment: Used to insert a new appointment for a patient with a doctor and automatically sets the status to Scheduled.
GetDoctorAppointments: Retrieves all appointments for a specific doctor, including patient name, appointment date, and status, sorted by date.
CancelAppointment: Updates the appointment status to Cancelled instead of deleting the record, ensuring data consistency and history tracking.

These procedures improve code reusability, security, and performance by reducing direct query execution.

2. Window Functions

Window functions were used to analyze and rank data without affecting the original dataset:

ROW_NUMBER() was used to assign a sequential order to appointments for each doctor based on appointment date.
RANK() and DENSE_RANK() were used to rank doctors based on the number of appointments they have.

These functions are useful for reporting and analytical queries such as identifying top-performing doctors.

3. Indexing

Non-clustered indexes were created to improve query performance:

Index on (DoctorID, AppointmentDate) to speed up searching and sorting doctor appointments.
Index on PatientID to optimize patient-related queries.
Index on DoctorID in the Schedule table to improve retrieval of doctor availability.

Indexes significantly reduce query execution time by minimizing full table scans.

4. Performance Testing

The performance of queries was evaluated using:

SET STATISTICS IO ON
SET STATISTICS TIME ON

Execution plans before and after indexing showed a clear improvement, where table scans were replaced with index seeks, resulting in faster query execution and lower resource usage

# DataWare House

Star Schema for Healthcare Data Warehouse

This Star Schema illustrates the design of the healthcare data warehouse system. At the center is the Fact_Appointment table, which represents the fact table containing the analytical data related to appointments, such as the number of appointments (AppointmentCount) and the number of prescriptions (PrescriptionCount), along with foreign keys that link it to the surrounding dimension tables.

Surrounding the fact table are several dimension tables that describe the different entities in the system:

Dim_Patient: Contains patient information such as name, gender, age, and phone number.
Dim_Doctor: Contains doctor information such as name and phone number.
Dim_Specialization: Represents the different medical specialties of doctors.
Dim_Time: Represents the time dimension and includes date details such as day, month, and year.

This design enables fast and efficient data analysis, such as identifying the number of appointments per doctor, per specialization, or over a specific time period. It supports decision-making and performance analysis within the healthcare system.























