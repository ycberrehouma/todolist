-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2017 at 12:41 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `zip_id` int(11) NOT NULL,
  `county_id` int(11) DEFAULT NULL,
  `street_address_1` varchar(35) DEFAULT NULL,
  `street_address_2` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood_sugar`
--

CREATE TABLE `blood_sugar` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood_type`
--

CREATE TABLE `blood_type` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cholesterol`
--

CREATE TABLE `cholesterol` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `full` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `corporate_sponsor`
--

CREATE TABLE `corporate_sponsor` (
  `corporation_name` varchar(25) NOT NULL,
  `headquarter_address` varchar(255) NOT NULL,
  `ownership_percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

CREATE TABLE `county` (
  `id` int(11) NOT NULL,
  `full` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drug_interaction`
--

CREATE TABLE `drug_interaction` (
  `drug_interaction_id` int(11) NOT NULL,
  `drug1_id` int(11) NOT NULL,
  `drug2_id` int(11) NOT NULL,
  `interaction_severity` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `heart_disease_risk`
--

CREATE TABLE `heart_disease_risk` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `illnesse`
--

CREATE TABLE `illnesse` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inpatient`
--

CREATE TABLE `inpatient` (
  `patient_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `wing` varchar(1) NOT NULL,
  `nursing_unit` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `bed_number` varchar(1) NOT NULL,
  `surgery_scheduled` int(11) NOT NULL,
  `attending_nurse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medication_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `qunatity_on_hand` varchar(25) NOT NULL,
  `quantity_on_order` varchar(25) NOT NULL,
  `unit_cost` varchar(25) NOT NULL,
  `year_to_date_usage` varchar(25) NOT NULL,
  `medication_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `employee_id` int(11) NOT NULL,
  `grade` varchar(25) NOT NULL,
  `years_of_experience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `ssn` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `date_of_birth` date NOT NULL,
  `telephone_number` varchar(9) NOT NULL,
  `hospitalized` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_allergy`
--

CREATE TABLE `patient_allergy` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `allergy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_blood_sugar`
--

CREATE TABLE `patient_blood_sugar` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `blood_sugar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_blood_type`
--

CREATE TABLE `patient_blood_type` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `blood_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_cholesterol`
--

CREATE TABLE `patient_cholesterol` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `cholesterol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_heart_disease_risk`
--

CREATE TABLE `patient_heart_disease_risk` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `heart_disease_risk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_illnesse`
--

CREATE TABLE `patient_illnesse` (
  `patient_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `illnesse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `address` int(11) NOT NULL,
  `telephone_number` varchar(25) NOT NULL,
  `salary` varchar(25) NOT NULL,
  `ssn` varchar(25) NOT NULL,
  `job_title` varchar(25) NOT NULL,
  `personnel_type` int(11) NOT NULL,
  `address_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `employee_id` int(11) NOT NULL,
  `speciality` varchar(25) NOT NULL,
  `percentage_ownership` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `presciprtion`
--

CREATE TABLE `presciprtion` (
  `patient_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `full` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgeon`
--

CREATE TABLE `surgeon` (
  `surgeon_id` int(11) NOT NULL,
  `speciality` varchar(25) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `type_of_contract` varchar(25) NOT NULL,
  `lenght_of_contract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgery_schedule`
--

CREATE TABLE `surgery_schedule` (
  `surgery_id` int(11) NOT NULL,
  `op_theat` int(11) NOT NULL,
  `surgeon_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `surgery_type` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgery_skills`
--

CREATE TABLE `surgery_skills` (
  `employee_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `skill_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgery_type`
--

CREATE TABLE `surgery_type` (
  `surgery_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `time_of_day` date NOT NULL,
  `surgery_code` varchar(25) NOT NULL,
  `name_category` varchar(25) NOT NULL,
  `anatomical_locations` varchar(25) NOT NULL,
  `special_needs` varchar(255) NOT NULL,
  `categories` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zip`
--

CREATE TABLE `zip` (
  `id` int(11) NOT NULL,
  `full` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `address_city` (`city_id`),
  ADD KEY `address_county` (`county_id`),
  ADD KEY `address_state` (`state_id`),
  ADD KEY `address_zip` (`zip_id`);

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_sugar`
--
ALTER TABLE `blood_sugar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_type`
--
ALTER TABLE `blood_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cholesterol`
--
ALTER TABLE `cholesterol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `corporate_sponsor`
--
ALTER TABLE `corporate_sponsor`
  ADD PRIMARY KEY (`corporation_name`);

--
-- Indexes for table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_interaction`
--
ALTER TABLE `drug_interaction`
  ADD PRIMARY KEY (`drug_interaction_id`);

--
-- Indexes for table `heart_disease_risk`
--
ALTER TABLE `heart_disease_risk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `illnesse`
--
ALTER TABLE `illnesse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inpatient`
--
ALTER TABLE `inpatient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `inpatient_nurse` (`attending_nurse`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medication_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_allergy_allergy` (`allergy_id`);

--
-- Indexes for table `patient_blood_sugar`
--
ALTER TABLE `patient_blood_sugar`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_blood_sugar_blood_sugar` (`blood_sugar_id`);

--
-- Indexes for table `patient_blood_type`
--
ALTER TABLE `patient_blood_type`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_blood_type_blood_type` (`blood_type_id`);

--
-- Indexes for table `patient_cholesterol`
--
ALTER TABLE `patient_cholesterol`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_cholesterol_cholesterol` (`cholesterol_id`);

--
-- Indexes for table `patient_heart_disease_risk`
--
ALTER TABLE `patient_heart_disease_risk`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_heart_disease_risk_heart_disease_risk` (`heart_disease_risk_id`);

--
-- Indexes for table `patient_illnesse`
--
ALTER TABLE `patient_illnesse`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_illnesse_illnesse` (`illnesse_id`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `presciprtion`
--
ALTER TABLE `presciprtion`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `presciprtion_physician` (`employee_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surgeon`
--
ALTER TABLE `surgeon`
  ADD PRIMARY KEY (`surgeon_id`);

--
-- Indexes for table `surgery_schedule`
--
ALTER TABLE `surgery_schedule`
  ADD PRIMARY KEY (`surgery_id`),
  ADD KEY `inpatient_surgery_schedule` (`patient_id`),
  ADD KEY `surgery_schedule_surgeon` (`surgeon_id`);

--
-- Indexes for table `surgery_skills`
--
ALTER TABLE `surgery_skills`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `surgery_type`
--
ALTER TABLE `surgery_type`
  ADD PRIMARY KEY (`surgery_id`);

--
-- Indexes for table `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `address_county` FOREIGN KEY (`county_id`) REFERENCES `county` (`id`),
  ADD CONSTRAINT `address_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `address_zip` FOREIGN KEY (`zip_id`) REFERENCES `zip` (`id`);

--
-- Constraints for table `inpatient`
--
ALTER TABLE `inpatient`
  ADD CONSTRAINT `inpatient_nurse` FOREIGN KEY (`attending_nurse`) REFERENCES `nurse` (`employee_id`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_surgery_skills` FOREIGN KEY (`employee_id`) REFERENCES `surgery_skills` (`employee_id`),
  ADD CONSTRAINT `nurse_surgery_type` FOREIGN KEY (`employee_id`) REFERENCES `surgery_type` (`surgery_id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `inpatient_patient` FOREIGN KEY (`patient_id`) REFERENCES `inpatient` (`patient_id`),
  ADD CONSTRAINT `patients_address` FOREIGN KEY (`patient_id`) REFERENCES `address` (`user_id`),
  ADD CONSTRAINT `patients_consultation` FOREIGN KEY (`patient_id`) REFERENCES `consultation` (`patient_id`);

--
-- Constraints for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  ADD CONSTRAINT `patient_allergy_allergy` FOREIGN KEY (`allergy_id`) REFERENCES `allergies` (`id`),
  ADD CONSTRAINT `patient_allergy_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `patient_blood_sugar`
--
ALTER TABLE `patient_blood_sugar`
  ADD CONSTRAINT `patient_blood_sugar_blood_sugar` FOREIGN KEY (`blood_sugar_id`) REFERENCES `blood_sugar` (`id`),
  ADD CONSTRAINT `patient_blood_sugar_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `patient_blood_type`
--
ALTER TABLE `patient_blood_type`
  ADD CONSTRAINT `patient_blood_type_blood_type` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_type` (`id`),
  ADD CONSTRAINT `patient_blood_type_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `patient_cholesterol`
--
ALTER TABLE `patient_cholesterol`
  ADD CONSTRAINT `patient_cholesterol_cholesterol` FOREIGN KEY (`cholesterol_id`) REFERENCES `cholesterol` (`id`),
  ADD CONSTRAINT `patient_cholesterol_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `patient_heart_disease_risk`
--
ALTER TABLE `patient_heart_disease_risk`
  ADD CONSTRAINT `patient_heart_disease_risk_heart_disease_risk` FOREIGN KEY (`heart_disease_risk_id`) REFERENCES `heart_disease_risk` (`id`),
  ADD CONSTRAINT `patient_heart_disease_risk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `patient_illnesse`
--
ALTER TABLE `patient_illnesse`
  ADD CONSTRAINT `patient_illnesse_illnesse` FOREIGN KEY (`illnesse_id`) REFERENCES `illnesse` (`id`),
  ADD CONSTRAINT `patient_illnesse_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `nurse_personnel` FOREIGN KEY (`employee_id`) REFERENCES `nurse` (`employee_id`),
  ADD CONSTRAINT `personnel_address` FOREIGN KEY (`employee_id`) REFERENCES `address` (`user_id`),
  ADD CONSTRAINT `personnel_physician` FOREIGN KEY (`employee_id`) REFERENCES `physician` (`employee_id`);

--
-- Constraints for table `presciprtion`
--
ALTER TABLE `presciprtion`
  ADD CONSTRAINT `presciprtion_medication` FOREIGN KEY (`patient_id`) REFERENCES `medication` (`medication_id`),
  ADD CONSTRAINT `presciprtion_physician` FOREIGN KEY (`employee_id`) REFERENCES `physician` (`employee_id`);

--
-- Constraints for table `surgeon`
--
ALTER TABLE `surgeon`
  ADD CONSTRAINT `surgeon_surgery_skills` FOREIGN KEY (`surgeon_id`) REFERENCES `surgery_skills` (`employee_id`),
  ADD CONSTRAINT `surgeon_surgery_type` FOREIGN KEY (`surgeon_id`) REFERENCES `surgery_type` (`surgery_id`);

--
-- Constraints for table `surgery_schedule`
--
ALTER TABLE `surgery_schedule`
  ADD CONSTRAINT `inpatient_surgery_schedule` FOREIGN KEY (`patient_id`) REFERENCES `inpatient` (`patient_id`),
  ADD CONSTRAINT `surgery_schedule_surgeon` FOREIGN KEY (`surgeon_id`) REFERENCES `surgeon` (`surgeon_id`),
  ADD CONSTRAINT `surgery_schedule_surgery_type` FOREIGN KEY (`surgery_id`) REFERENCES `surgery_type` (`surgery_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
