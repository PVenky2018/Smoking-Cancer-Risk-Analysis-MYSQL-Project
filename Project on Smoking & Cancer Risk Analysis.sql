create database Project1;

select * from project1.patients;
select * from project1.habits;
select * from project1.results;


/* Project on Smoking & Cancer Risk Analysis 
Basic level queries */

select * from project1.patients where age > 50 and diet_quality = "Poor";

select distinct (physical_activity_level) from project1.patients;

select * from project1.habits order by cigarettes_per_day desc limit 5;


/* Project on Smoking & Cancer Risk Analysis 
Intermediate level queries */

select physical_activity_level, round(avg(bmi),2) as Avg_BMI from project1.patients group by physical_activity_level;

select count(patient_id) as Total_Patients, smoking_status from project1.habits group by smoking_status;

select cancer_type, count(patient_id) as Total_Patients  from project1.results group by cancer_type order by Total_Patients desc;

select smoking_status, avg(years_smoking) as Avg_years_of_smoking from project1.habits group by smoking_status 
having smoking_status in ("Current", "former");

select patients.gender, round(avg(patients.bmi),2) as Avg_BMI from project1.patients inner join project1.results 
on patients.patient_id=results.patient_id where results.cancer_type != "none " group by patients.gender;

select patients.gender, round(avg(patients.bmi),2) as Avg_BMI from project1.patients inner join project1.results 
on patients.patient_id=results.patient_id where results.cancer_type in ("Lung", "Mouth", "Throat","Other") group by patients.gender;

/* Project on Smoking & Cancer Risk Analysis 
Advance level queries */

select avg(cigarettes_per_day) from project1.habits where smoking_status != "never";

select patient_id, round(avg(cigarettes_per_day),0) as Avg_No_Of_Cigerettes_Per_Day from project1.habits where smoking_status != "Never" 
group by patient_id having avg(cigarettes_per_day) > (select avg(cigarettes_per_day) from project1.habits where smoking_status != "never");

select *, 
case
when smoking_status = "Never" then "Low"
when smoking_status = "current" then "High"
else "Medium"
end as Risk_Level from project1.habits;

select * from project1.habits where years_smoking > 20 ;

select habits.patient_id, habits.smoking_status, habits.cigarettes_per_day, habits.years_smoking, results.cancer_type from project1.habits
join project1.results on habits.patient_id=results.patient_id where years_smoking > 20 and cancer_type = "none";

select count(patients.patient_id) as Total_Patients, patients.gender, results.cancer_type from project1.patients join project1.results
on patients.patient_id=results.patient_id where gender = "Female" group by results.cancer_type order by Total_Patients desc limit 3;










