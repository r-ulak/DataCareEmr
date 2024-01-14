-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema openmrs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema openmrs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `openmrs` DEFAULT CHARACTER SET utf8 ;
USE `openmrs` ;

-- -----------------------------------------------------
-- Table `openmrs`.`cohort`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`cohort` (
  `cohort_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`cohort_id`),
  UNIQUE INDEX `cohort_uuid_index` (`uuid` ASC),
  INDEX `cohort_creator` (`creator` ASC),
  INDEX `user_who_voided_cohort` (`voided_by` ASC),
  INDEX `user_who_changed_cohort` (`changed_by` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`tribe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`tribe` (
  `tribe_id` INT(11) NOT NULL AUTO_INCREMENT,
  `retired` TINYINT(1) NOT NULL DEFAULT '0',
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`tribe_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 100
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_class` (
  `concept_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE INDEX `concept_class_uuid_index` (`uuid` ASC),
  INDEX `concept_class_creator` (`creator` ASC),
  INDEX `user_who_retired_concept_class` (`retired_by` ASC),
  INDEX `concept_class_retired_status` (`retired` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_datatype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_datatype` (
  `concept_datatype_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` VARCHAR(3) NULL DEFAULT NULL,
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE INDEX `concept_datatype_uuid_index` (`uuid` ASC),
  INDEX `concept_datatype_creator` (`creator` ASC),
  INDEX `user_who_retired_concept_datatype` (`retired_by` ASC),
  INDEX `concept_datatype_retired_status` (`retired` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept` (
  `concept_id` INT(11) NOT NULL AUTO_INCREMENT,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `short_name` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `form_text` TEXT NULL DEFAULT NULL,
  `datatype_id` INT(11) NOT NULL DEFAULT '0',
  `class_id` INT(11) NOT NULL DEFAULT '0',
  `is_set` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` VARCHAR(50) NULL DEFAULT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE INDEX `concept_uuid_index` (`uuid` ASC),
  INDEX `concept_classes_idx` (`class_id` ASC),
  INDEX `concept_creator` (`creator` ASC),
  INDEX `concept_datatypes_idx` (`datatype_id` ASC),
  INDEX `user_who_changed_concept` (`changed_by` ASC),
  INDEX `user_who_retired_concept` (`retired_by` ASC),
  CONSTRAINT `concept_classes`
    FOREIGN KEY (`class_id`)
    REFERENCES `openmrs`.`concept_class` (`concept_class_id`),
  CONSTRAINT `concept_datatypes`
    FOREIGN KEY (`datatype_id`)
    REFERENCES `openmrs`.`concept_datatype` (`concept_datatype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6099
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person` (
  `person_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(50) NULL DEFAULT '',
  `birthdate` DATE NULL DEFAULT NULL,
  `birthdate_estimated` SMALLINT(6) NOT NULL DEFAULT '0',
  `dead` SMALLINT(6) NOT NULL DEFAULT '0',
  `death_date` DATETIME NULL DEFAULT NULL,
  `cause_of_death` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE INDEX `person_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_patient` (`creator` ASC),
  INDEX `user_who_voided_patient` (`voided_by` ASC),
  INDEX `user_who_changed_pat` (`changed_by` ASC),
  INDEX `person_birthdate` (`birthdate` ASC),
  INDEX `person_death_date` (`death_date` ASC),
  INDEX `person_died_because_idx` (`cause_of_death` ASC),
  CONSTRAINT `person_died_because`
    FOREIGN KEY (`cause_of_death`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9347
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`patient` (
  `patient_id` INT(11) NOT NULL,
  `tribe` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `belongs_to_tribe_idx` (`tribe` ASC),
  INDEX `user_who_created_patient` (`creator` ASC),
  INDEX `user_who_voided_patient` (`voided_by` ASC),
  INDEX `user_who_changed_pat` (`changed_by` ASC),
  CONSTRAINT `belongs_to_tribe`
    FOREIGN KEY (`tribe`)
    REFERENCES `openmrs`.`tribe` (`tribe_id`),
  CONSTRAINT `person_id_for_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`cohort_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`cohort_member` (
  `cohort_id` INT(11) NOT NULL DEFAULT '0',
  `patient_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`, `patient_id`),
  INDEX `cohort` (`cohort_id` ASC),
  INDEX `patient` (`patient_id` ASC),
  CONSTRAINT `member_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `parent_cohort`
    FOREIGN KEY (`cohort_id`)
    REFERENCES `openmrs`.`cohort` (`cohort_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`drug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`drug` (
  `drug_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `combination` SMALLINT(6) NOT NULL DEFAULT '0',
  `dosage_form` INT(11) NULL DEFAULT NULL,
  `dose_strength` DOUBLE NULL DEFAULT NULL,
  `maximum_daily_dose` DOUBLE NULL DEFAULT NULL,
  `minimum_daily_dose` DOUBLE NULL DEFAULT NULL,
  `route` INT(11) NULL DEFAULT NULL,
  `units` VARCHAR(50) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE INDEX `drug_uuid_index` (`uuid` ASC),
  INDEX `drug_creator` (`creator` ASC),
  INDEX `primary_drug_concept_idx` (`concept_id` ASC),
  INDEX `dosage_form_concept_idx` (`dosage_form` ASC),
  INDEX `route_concept_idx` (`route` ASC),
  INDEX `user_who_voided_drug` (`retired_by` ASC),
  CONSTRAINT `dosage_form_concept`
    FOREIGN KEY (`dosage_form`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `primary_drug_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `route_concept`
    FOREIGN KEY (`route`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_answer` (
  `concept_answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `answer_concept` INT(11) NULL DEFAULT NULL,
  `answer_drug` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  `sort_weight` DOUBLE NULL COMMENT 'Initial value of sort_weight is concept_answer_id',
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE INDEX `concept_answer_uuid_index` (`uuid` ASC),
  INDEX `answer_creator` (`creator` ASC),
  INDEX `answer_idx` (`answer_concept` ASC),
  INDEX `answers_for_concept_idx` (`concept_id` ASC),
  INDEX `answer_answer_drug_fk_idx` (`answer_drug` ASC),
  CONSTRAINT `answer`
    FOREIGN KEY (`answer_concept`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `answers_for_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk`
    FOREIGN KEY (`answer_drug`)
    REFERENCES `openmrs`.`drug` (`drug_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1021
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_complex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_complex` (
  `concept_id` INT(11) NOT NULL,
  `handler` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_description` (
  `concept_description_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `description` TEXT NOT NULL,
  `locale` VARCHAR(50) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE INDEX `concept_description_uuid_index` (`uuid` ASC),
  INDEX `concept_being_described` (`concept_id` ASC),
  INDEX `user_who_created_description` (`creator` ASC),
  INDEX `user_who_changed_description` (`changed_by` ASC),
  CONSTRAINT `description_for_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2425
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_reference_source`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_reference_source` (
  `concept_source_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  `description` TEXT NOT NULL,
  `hl7_code` VARCHAR(50) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` TINYINT(1) NOT NULL,
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE INDEX `concept_source_uuid_index` (`uuid` ASC),
  INDEX `concept_source_creator` (`creator` ASC),
  INDEX `user_who_voided_concept_source` (`retired_by` ASC),
  INDEX `unique_hl7_code` (`hl7_code` ASC, `retired` ASC),
  UNIQUE INDEX `hl7_code_UNIQUE` (`hl7_code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_reference_term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_reference_term` (
  `concept_reference_term_id` INT NOT NULL AUTO_INCREMENT,
  `concept_source_id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `code` VARCHAR(255) NOT NULL,
  `version` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_changed` DATETIME NULL,
  `changed_by` INT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT 0,
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `mapped_concept_source_idx` (`concept_source_id` ASC),
  CONSTRAINT `mapped_concept_source`
    FOREIGN KEY (`concept_source_id`)
    REFERENCES `openmrs`.`concept_reference_source` (`concept_source_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_reference_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_reference_map` (
  `concept_map_id` INT(11) NOT NULL AUTO_INCREMENT,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `uuid` CHAR(38) NOT NULL,
  `concept_reference_term_id` INT NOT NULL,
  `concept_map_type_id` INT NOT NULL DEFAULT 1,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  PRIMARY KEY (`concept_map_id`),
  UNIQUE INDEX `concept_map_uuid_index` (`uuid` ASC),
  INDEX `map_creator` (`creator` ASC),
  INDEX `map_for_concept_idx` (`concept_id` ASC),
  INDEX `mapped_concept_reference_term_idx` (`concept_reference_term_id` ASC),
  CONSTRAINT `map_for_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `mapped_concept_reference_term`
    FOREIGN KEY (`concept_reference_term_id`)
    REFERENCES `openmrs`.`concept_reference_term` (`concept_reference_term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_name` (
  `concept_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `locale` VARCHAR(50) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `concept_name_id` INT(11) NOT NULL AUTO_INCREMENT,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `concept_name_type` VARCHAR(50) NULL,
  `locale_preferred` TINYINT(1) NULL DEFAULT FALSE,
  PRIMARY KEY (`concept_name_id`),
  UNIQUE INDEX `concept_name_id` (`concept_name_id` ASC),
  UNIQUE INDEX `concept_name_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_name` (`creator` ASC),
  INDEX `name_of_concept` (`name` ASC),
  INDEX `unique_concept_name_id` (`concept_id` ASC),
  INDEX `user_who_voided_name` (`voided_by` ASC),
  CONSTRAINT `name_for_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3461
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_name_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_name_tag` (
  `concept_name_tag_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tag` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE INDEX `concept_name_tag_id` (`concept_name_tag_id` ASC),
  UNIQUE INDEX `concept_name_tag_id_2` (`concept_name_tag_id` ASC),
  UNIQUE INDEX `concept_name_tag_unique_tags` (`tag` ASC),
  UNIQUE INDEX `concept_name_tag_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_name_tag` (`creator` ASC),
  INDEX `user_who_voided_name_tag` (`voided_by` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_name_tag_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_name_tag_map` (
  `concept_name_id` INT(11) NOT NULL,
  `concept_name_tag_id` INT(11) NOT NULL,
  INDEX `map_name` (`concept_name_id` ASC),
  INDEX `mapped_concept_name_tag_idx` (`concept_name_tag_id` ASC),
  CONSTRAINT `mapped_concept_name`
    FOREIGN KEY (`concept_name_id`)
    REFERENCES `openmrs`.`concept_name` (`concept_name_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `mapped_concept_name_tag`
    FOREIGN KEY (`concept_name_tag_id`)
    REFERENCES `openmrs`.`concept_name_tag` (`concept_name_tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_numeric`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_numeric` (
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `hi_absolute` DOUBLE NULL DEFAULT NULL,
  `hi_critical` DOUBLE NULL DEFAULT NULL,
  `hi_normal` DOUBLE NULL DEFAULT NULL,
  `low_absolute` DOUBLE NULL DEFAULT NULL,
  `low_critical` DOUBLE NULL DEFAULT NULL,
  `low_normal` DOUBLE NULL DEFAULT NULL,
  `units` VARCHAR(50) NULL DEFAULT NULL,
  `precise` SMALLINT(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`encounter_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`encounter_type` (
  `encounter_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  `description` TEXT NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE INDEX `encounter_type_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_type` (`creator` ASC),
  INDEX `user_who_retired_encounter_type` (`retired_by` ASC),
  INDEX `retired_status` (`retired` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`form`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`form` (
  `form_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `version` VARCHAR(50) NOT NULL DEFAULT '',
  `build` INT(11) NULL DEFAULT NULL,
  `published` SMALLINT(6) NOT NULL DEFAULT '0',
  `description` TEXT NULL DEFAULT NULL,
  `encounter_type` INT(11) NULL DEFAULT NULL,
  `template` TEXT NULL DEFAULT NULL,
  `xslt` TEXT NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retired_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE INDEX `form_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_form` (`creator` ASC),
  INDEX `user_who_last_changed_form` (`changed_by` ASC),
  INDEX `user_who_retired_form` (`retired_by` ASC),
  INDEX `encounter_type` (`encounter_type` ASC),
  INDEX `form_published_index` (`published` ASC),
  INDEX `form_retired_index` (`retired` ASC),
  INDEX `form_published_and_retired_index` (`published` ASC, `retired` ASC),
  CONSTRAINT `form_encounter_type`
    FOREIGN KEY (`encounter_type`)
    REFERENCES `openmrs`.`encounter_type` (`encounter_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`location` (
  `location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `address1` VARCHAR(255) NULL DEFAULT NULL,
  `address2` VARCHAR(255) NULL DEFAULT NULL,
  `city_village` VARCHAR(255) NULL DEFAULT NULL,
  `state_province` VARCHAR(255) NULL DEFAULT NULL,
  `postal_code` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NULL DEFAULT NULL,
  `latitude` VARCHAR(50) NULL DEFAULT NULL,
  `longitude` VARCHAR(50) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `county_district` VARCHAR(255) NULL DEFAULT NULL,
  `address3` VARCHAR(255) NULL DEFAULT NULL,
  `address6` VARCHAR(255) NULL DEFAULT NULL,
  `address5` VARCHAR(255) NULL DEFAULT NULL,
  `address4` VARCHAR(255) NULL DEFAULT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `parent_location` INT(11) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_location` (`creator` ASC),
  INDEX `name_of_location` (`name` ASC),
  INDEX `user_who_retired_location` (`retired_by` ASC),
  INDEX `retired_status` (`retired` ASC),
  INDEX `parent_location_idx` (`parent_location` ASC),
  CONSTRAINT `parent_location`
    FOREIGN KEY (`parent_location`)
    REFERENCES `openmrs`.`location` (`location_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`visit_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`visit_type` (
  `visit_type_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  `uuid` CHAR(38) NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT NOT NULL DEFAULT '0',
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`visit` (
  `visit_id` INT NOT NULL AUTO_INCREMENT,
  `patient_id` INT NOT NULL,
  `visit_type_id` INT NOT NULL,
  `date_started` DATETIME NOT NULL,
  `date_stopped` DATETIME NULL,
  `indication_concept_id` INT NULL,
  `location_id` INT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `visit_type_fk_idx` (`visit_type_id` ASC),
  INDEX `visit_location_fk_idx` (`location_id` ASC),
  INDEX `visit_patient_fk_idx` (`patient_id` ASC),
  INDEX `visit_indication_concept_fk_idx` (`indication_concept_id` ASC),
  INDEX `visit_patient_index` (`patient_id` ASC),
  CONSTRAINT `visit_type_fk`
    FOREIGN KEY (`visit_type_id`)
    REFERENCES `openmrs`.`visit_type` (`visit_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visit_location_fk`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visit_patient_fk`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visit_indication_concept_fk`
    FOREIGN KEY (`indication_concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`encounter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`encounter` (
  `encounter_id` INT(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` INT(11) NOT NULL,
  `patient_id` INT(11) NOT NULL DEFAULT '0',
  `location_id` INT(11) NULL DEFAULT '0',
  `form_id` INT(11) NULL DEFAULT NULL,
  `encounter_datetime` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `visit_id` INT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE INDEX `encounter_uuid_index` (`uuid` ASC),
  INDEX `encounter_location_idx` (`location_id` ASC),
  INDEX `encounter_patient_idx` (`patient_id` ASC),
  INDEX `encounter_type_id_idx` (`encounter_type` ASC),
  INDEX `encounter_creator` (`creator` ASC),
  INDEX `encounter_form_idx` (`form_id` ASC),
  INDEX `user_who_voided_encounter` (`voided_by` ASC),
  INDEX `encounter_changed_by` (`changed_by` ASC),
  INDEX `encounter_datetime_idx` (`encounter_datetime` ASC),
  INDEX `encounter_visit_id_fk_idx` (`visit_id` ASC),
  CONSTRAINT `encounter_form`
    FOREIGN KEY (`form_id`)
    REFERENCES `openmrs`.`form` (`form_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `encounter_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`),
  CONSTRAINT `encounter_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id`
    FOREIGN KEY (`encounter_type`)
    REFERENCES `openmrs`.`encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk`
    FOREIGN KEY (`visit_id`)
    REFERENCES `openmrs`.`visit` (`visit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 48845
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`order_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`order_type` (
  `order_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE INDEX `order_type_uuid_index` (`uuid` ASC),
  INDEX `type_created_by` (`creator` ASC),
  INDEX `user_who_retired_order_type` (`retired_by` ASC),
  INDEX `retired_status` (`retired` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`orders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_type_id` INT(11) NOT NULL DEFAULT '0',
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `orderer` INT(11) NULL DEFAULT '0',
  `encounter_id` INT(11) NULL DEFAULT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `auto_expire_date` DATETIME NULL DEFAULT NULL,
  `discontinued` SMALLINT(6) NOT NULL DEFAULT '0',
  `discontinued_date` DATETIME NULL DEFAULT NULL,
  `discontinued_by` INT(11) NULL DEFAULT NULL,
  `discontinued_reason` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `patient_id` INT(11) NOT NULL,
  `accession_number` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `discontinued_reason_non_coded` VARCHAR(255) NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `orders_uuid_index` (`uuid` ASC),
  INDEX `order_creator` (`creator` ASC),
  INDEX `orderer_not_drug` (`orderer` ASC),
  INDEX `orders_in_encounter_idx` (`encounter_id` ASC),
  INDEX `type_of_order_idx` (`order_type_id` ASC),
  INDEX `user_who_discontinued_order` (`discontinued_by` ASC),
  INDEX `user_who_voided_order` (`voided_by` ASC),
  INDEX `discontinued_because_idx` (`discontinued_reason` ASC),
  INDEX `order_for_patient` (`patient_id` ASC),
  CONSTRAINT `discontinued_because`
    FOREIGN KEY (`discontinued_reason`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `orders_in_encounter`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `openmrs`.`encounter` (`encounter_id`),
  CONSTRAINT `type_of_order`
    FOREIGN KEY (`order_type_id`)
    REFERENCES `openmrs`.`order_type` (`order_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`obs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`obs` (
  `obs_id` INT(11) NOT NULL AUTO_INCREMENT,
  `person_id` INT(11) NOT NULL,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `encounter_id` INT(11) NULL DEFAULT NULL,
  `order_id` INT(11) NULL DEFAULT NULL,
  `obs_datetime` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location_id` INT(11) NULL DEFAULT '0',
  `obs_group_id` INT(11) NULL DEFAULT NULL,
  `accession_number` VARCHAR(255) NULL DEFAULT NULL,
  `value_group_id` INT(11) NULL DEFAULT NULL,
  `value_boolean` TINYINT(1) NULL DEFAULT NULL,
  `value_coded` INT(11) NULL DEFAULT NULL,
  `value_coded_name_id` INT(11) NULL DEFAULT NULL,
  `value_drug` INT(11) NULL DEFAULT NULL,
  `value_datetime` DATETIME NULL DEFAULT NULL,
  `value_numeric` DOUBLE NULL DEFAULT NULL,
  `value_modifier` VARCHAR(2) NULL DEFAULT NULL,
  `value_text` TEXT NULL DEFAULT NULL,
  `comments` VARCHAR(255) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `value_complex` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `previous_version` INT NULL,
  PRIMARY KEY (`obs_id`),
  UNIQUE INDEX `obs_uuid_index` (`uuid` ASC),
  INDEX `answer_concept_idx` (`value_coded` ASC),
  INDEX `encounter_observations_idx` (`encounter_id` ASC),
  INDEX `obs_concept_idx` (`concept_id` ASC),
  INDEX `obs_enterer` (`creator` ASC),
  INDEX `obs_location_idx` (`location_id` ASC),
  INDEX `obs_order_idx` (`order_id` ASC),
  INDEX `patient_obs` (`person_id` ASC),
  INDEX `user_who_voided_obs` (`voided_by` ASC),
  INDEX `answer_concept_drug_idx` (`value_drug` ASC),
  INDEX `obs_grouping_id_idx` (`obs_group_id` ASC),
  INDEX `obs_name_of_coded_value_idx` (`value_coded_name_id` ASC),
  INDEX `obs_datetime_idx` (`obs_datetime` ASC),
  INDEX `previous_version_idx` (`previous_version` ASC),
  CONSTRAINT `answer_concept`
    FOREIGN KEY (`value_coded`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `answer_concept_drug`
    FOREIGN KEY (`value_drug`)
    REFERENCES `openmrs`.`drug` (`drug_id`),
  CONSTRAINT `encounter_observations`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `openmrs`.`encounter` (`encounter_id`),
  CONSTRAINT `obs_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `obs_grouping_id`
    FOREIGN KEY (`obs_group_id`)
    REFERENCES `openmrs`.`obs` (`obs_id`),
  CONSTRAINT `obs_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value`
    FOREIGN KEY (`value_coded_name_id`)
    REFERENCES `openmrs`.`concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `openmrs`.`orders` (`order_id`),
  CONSTRAINT `person_obs`
    FOREIGN KEY (`person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `previous_version`
    FOREIGN KEY (`previous_version`)
    REFERENCES `openmrs`.`obs` (`obs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 476974
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_proposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_proposal` (
  `concept_proposal_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NULL DEFAULT NULL,
  `encounter_id` INT(11) NULL DEFAULT NULL,
  `original_text` VARCHAR(255) NOT NULL DEFAULT '',
  `final_text` VARCHAR(255) NULL DEFAULT NULL,
  `obs_id` INT(11) NULL DEFAULT NULL,
  `obs_concept_id` INT(11) NULL DEFAULT NULL,
  `state` VARCHAR(32) NOT NULL DEFAULT 'UNMAPPED' COMMENT 'Valid values are: UNMAPPED, SYNONYM, CONCEPT, REJECT',
  `comments` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Comment from concept admin/mapper',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `locale` VARCHAR(50) NOT NULL DEFAULT '',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE INDEX `concept_proposal_uuid_index` (`uuid` ASC),
  INDEX `encounter_for_proposal_idx` (`encounter_id` ASC),
  INDEX `concept_for_proposal_idx` (`concept_id` ASC),
  INDEX `user_who_created_proposal` (`creator` ASC),
  INDEX `user_who_changed_proposal` (`changed_by` ASC),
  INDEX `proposal_obs_id_idx` (`obs_id` ASC),
  INDEX `proposal_obs_concept_id_idx` (`obs_concept_id` ASC),
  CONSTRAINT `concept_for_proposal`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `openmrs`.`encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id`
    FOREIGN KEY (`obs_concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id`
    FOREIGN KEY (`obs_id`)
    REFERENCES `openmrs`.`obs` (`obs_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_proposal_tag_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_proposal_tag_map` (
  `concept_proposal_id` INT(11) NOT NULL,
  `concept_name_tag_id` INT(11) NOT NULL,
  INDEX `map_proposal` (`concept_proposal_id` ASC),
  INDEX `map_name_tag` (`concept_name_tag_id` ASC),
  CONSTRAINT `mapped_concept_proposal`
    FOREIGN KEY (`concept_proposal_id`)
    REFERENCES `openmrs`.`concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag`
    FOREIGN KEY (`concept_name_tag_id`)
    REFERENCES `openmrs`.`concept_name_tag` (`concept_name_tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_set` (
  `concept_set_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `concept_set` INT(11) NOT NULL DEFAULT '0',
  `sort_weight` DOUBLE NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE INDEX `concept_set_uuid_index` (`uuid` ASC),
  INDEX `has_a_idx` (`concept_set` ASC),
  INDEX `user_who_created` (`creator` ASC),
  INDEX `idx_concept_set_concept` (`concept_id` ASC),
  CONSTRAINT `has_a`
    FOREIGN KEY (`concept_set`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `is_a`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 235
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_set_derived`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_set_derived` (
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `concept_set` INT(11) NOT NULL DEFAULT '0',
  `sort_weight` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`concept_id`, `concept_set`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`program` (
  `program_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `outcomes_concept_id` INT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE INDEX `program_uuid_index` (`uuid` ASC),
  INDEX `program_concept_idx` (`concept_id` ASC),
  INDEX `program_creator` (`creator` ASC),
  INDEX `user_who_changed_program` (`changed_by` ASC),
  INDEX `program_outcomes_concept_id_fk_idx` (`outcomes_concept_id` ASC),
  CONSTRAINT `program_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `program_outcomes_concept_id_fk`
    FOREIGN KEY (`outcomes_concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`program_workflow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`program_workflow` (
  `program_workflow_id` INT(11) NOT NULL AUTO_INCREMENT,
  `program_id` INT(11) NOT NULL DEFAULT '0',
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE INDEX `program_workflow_uuid_index` (`uuid` ASC),
  INDEX `program_for_workflow_idx` (`program_id` ASC),
  INDEX `workflow_concept_idx` (`concept_id` ASC),
  INDEX `workflow_creator` (`creator` ASC),
  INDEX `workflow_voided_by` (`changed_by` ASC),
  CONSTRAINT `program_for_workflow`
    FOREIGN KEY (`program_id`)
    REFERENCES `openmrs`.`program` (`program_id`),
  CONSTRAINT `workflow_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`program_workflow_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`program_workflow_state` (
  `program_workflow_state_id` INT(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` INT(11) NOT NULL DEFAULT '0',
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `initial` SMALLINT(6) NOT NULL DEFAULT '0',
  `terminal` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE INDEX `program_workflow_state_uuid_index` (`uuid` ASC),
  INDEX `workflow_for_state_idx` (`program_workflow_id` ASC),
  INDEX `state_concept_idx` (`concept_id` ASC),
  INDEX `state_creator` (`creator` ASC),
  INDEX `state_voided_by` (`changed_by` ASC),
  CONSTRAINT `state_concept`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `workflow_for_state`
    FOREIGN KEY (`program_workflow_id`)
    REFERENCES `openmrs`.`program_workflow` (`program_workflow_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_state_conversion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_state_conversion` (
  `concept_state_conversion_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NULL DEFAULT '0',
  `program_workflow_id` INT(11) NULL DEFAULT '0',
  `program_workflow_state_id` INT(11) NULL DEFAULT '0',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE INDEX `concept_state_conversion_uuid_index` (`uuid` ASC),
  UNIQUE INDEX `unique_workflow_concept_in_conversion` (`program_workflow_id` ASC, `concept_id` ASC),
  INDEX `triggering_concept` (`concept_id` ASC),
  INDEX `affected_workflow` (`program_workflow_id` ASC),
  INDEX `resulting_state` (`program_workflow_state_id` ASC),
  CONSTRAINT `concept_triggers_conversion`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow`
    FOREIGN KEY (`program_workflow_id`)
    REFERENCES `openmrs`.`program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state`
    FOREIGN KEY (`program_workflow_state_id`)
    REFERENCES `openmrs`.`program_workflow_state` (`program_workflow_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_word`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_word` (
  `concept_word_id` INT(11) NOT NULL AUTO_INCREMENT,
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `word` VARCHAR(50) NOT NULL DEFAULT '',
  `locale` VARCHAR(20) NOT NULL DEFAULT '',
  `concept_name_id` INT(11) NOT NULL,
  `weight` DOUBLE NULL DEFAULT '1',
  PRIMARY KEY (`concept_word_id`),
  INDEX `word_in_concept_name` (`word` ASC),
  INDEX `word_for_name_idx` (`concept_name_id` ASC),
  INDEX `concept_word_concept_idx` (`concept_id` ASC),
  INDEX `concept_word_weight_index` (`weight` ASC),
  CONSTRAINT `word_for`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `word_for_name`
    FOREIGN KEY (`concept_name_id`)
    REFERENCES `openmrs`.`concept_name` (`concept_name_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6706
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`drug_ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`drug_ingredient` (
  `concept_id` INT(11) NOT NULL DEFAULT '0',
  `ingredient_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredient_id`, `concept_id`),
  INDEX `combination_drug_idx` (`concept_id` ASC),
  INDEX `ingredient_idx` (`ingredient_id` ASC),
  CONSTRAINT `combination_drug`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `ingredient`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`drug_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`drug_order` (
  `order_id` INT(11) NOT NULL DEFAULT '0',
  `drug_inventory_id` INT(11) NULL DEFAULT '0',
  `dose` DOUBLE NULL DEFAULT NULL,
  `equivalent_daily_dose` DOUBLE NULL DEFAULT NULL,
  `units` VARCHAR(255) NULL DEFAULT NULL,
  `frequency` VARCHAR(255) NULL DEFAULT NULL,
  `prn` SMALLINT(6) NOT NULL DEFAULT '0',
  `complex` SMALLINT(6) NOT NULL DEFAULT '0',
  `quantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `inventory_item_idx` (`drug_inventory_id` ASC),
  CONSTRAINT `extends_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `openmrs`.`orders` (`order_id`),
  CONSTRAINT `inventory_item`
    FOREIGN KEY (`drug_inventory_id`)
    REFERENCES `openmrs`.`drug` (`drug_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`field_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`field_type` (
  `field_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `is_set` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`field_type_id`),
  UNIQUE INDEX `field_type_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_field_type` (`creator` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`field`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`field` (
  `field_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `description` TEXT NULL DEFAULT NULL,
  `field_type` INT(11) NULL DEFAULT NULL,
  `concept_id` INT(11) NULL DEFAULT NULL,
  `table_name` VARCHAR(50) NULL DEFAULT NULL,
  `attribute_name` VARCHAR(50) NULL DEFAULT NULL,
  `default_value` TEXT NULL DEFAULT NULL,
  `select_multiple` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE INDEX `field_uuid_index` (`uuid` ASC),
  INDEX `concept_for_field_idx` (`concept_id` ASC),
  INDEX `user_who_changed_field` (`changed_by` ASC),
  INDEX `user_who_created_field` (`creator` ASC),
  INDEX `type_of_field_idx` (`field_type` ASC),
  INDEX `user_who_retired_field` (`retired_by` ASC),
  INDEX `field_retired_status` (`retired` ASC),
  CONSTRAINT `concept_for_field`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`),
  CONSTRAINT `type_of_field`
    FOREIGN KEY (`field_type`)
    REFERENCES `openmrs`.`field_type` (`field_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 335
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`field_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`field_answer` (
  `field_id` INT(11) NOT NULL DEFAULT '0',
  `answer_id` INT(11) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`field_id`, `answer_id`),
  UNIQUE INDEX `field_answer_uuid_index` (`uuid` ASC),
  INDEX `answers_for_field_idx` (`field_id` ASC),
  INDEX `field_answer_concept_idx` (`answer_id` ASC),
  INDEX `user_who_created_field_answer` (`creator` ASC),
  CONSTRAINT `answers_for_field`
    FOREIGN KEY (`field_id`)
    REFERENCES `openmrs`.`field` (`field_id`),
  CONSTRAINT `field_answer_concept`
    FOREIGN KEY (`answer_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`form_field`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`form_field` (
  `form_field_id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_id` INT(11) NOT NULL DEFAULT '0',
  `field_id` INT(11) NOT NULL DEFAULT '0',
  `field_number` INT(11) NULL DEFAULT NULL,
  `field_part` VARCHAR(5) NULL DEFAULT NULL,
  `page_number` INT(11) NULL DEFAULT NULL,
  `parent_form_field` INT(11) NULL DEFAULT NULL,
  `min_occurs` INT(11) NULL DEFAULT NULL,
  `max_occurs` INT(11) NULL DEFAULT NULL,
  `required` SMALLINT(6) NOT NULL DEFAULT '0',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_weight` FLOAT(11,5) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE INDEX `form_field_uuid_index` (`uuid` ASC),
  INDEX `user_who_last_changed_form_field` (`changed_by` ASC),
  INDEX `field_within_form_idx` (`field_id` ASC),
  INDEX `form_containing_field_idx` (`form_id` ASC),
  INDEX `form_field_hierarchy_idx` (`parent_form_field` ASC),
  INDEX `user_who_created_form_field` (`creator` ASC),
  CONSTRAINT `field_within_form`
    FOREIGN KEY (`field_id`)
    REFERENCES `openmrs`.`field` (`field_id`),
  CONSTRAINT `form_containing_field`
    FOREIGN KEY (`form_id`)
    REFERENCES `openmrs`.`form` (`form_id`),
  CONSTRAINT `form_field_hierarchy`
    FOREIGN KEY (`parent_form_field`)
    REFERENCES `openmrs`.`form_field` (`form_field_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 596
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`global_property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`global_property` (
  `property` VARCHAR(255) NOT NULL DEFAULT '',
  `property_value` MEDIUMTEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `preferred_handler` VARCHAR(255) NULL,
  `datatype_config` TEXT NULL,
  `datatype` VARCHAR(255) NULL,
  `handler_config` TEXT NULL,
  PRIMARY KEY (`property`),
  UNIQUE INDEX `global_property_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `system_id` VARCHAR(50) NOT NULL DEFAULT '',
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(128) NULL DEFAULT NULL,
  `salt` VARCHAR(128) NULL DEFAULT NULL,
  `secret_question` VARCHAR(255) NULL DEFAULT NULL,
  `secret_answer` VARCHAR(255) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `person_id` INT(11) NOT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_creator_idx` (`creator` ASC),
  INDEX `user_who_changed_user_idx` (`changed_by` ASC),
  INDEX `user_who_retired_this_user_idx` (`retired_by` ASC),
  CONSTRAINT `user_creator`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `user_who_changed_user`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user`
    FOREIGN KEY (`retired_by`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`groovy_scripts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`groovy_scripts` (
  `id` INT(32) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `script` MEDIUMTEXT NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `User who wrote this script_idx` (`creator` ASC),
  INDEX `User who changed this script_idx` (`changed_by` ASC),
  CONSTRAINT `User who changed this script`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `User who wrote this script`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`htmlformentry_html_form`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`htmlformentry_html_form` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `xml_data` MEDIUMTEXT NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `User who created htmlformentry_htmlform_idx` (`creator` ASC),
  INDEX `Form with which this htmlform is related_idx` (`form_id` ASC),
  INDEX `User who changed htmlformentry_htmlform_idx` (`changed_by` ASC),
  CONSTRAINT `Form with which this htmlform is related`
    FOREIGN KEY (`form_id`)
    REFERENCES `openmrs`.`form` (`form_id`),
  CONSTRAINT `User who changed htmlformentry_htmlform`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `User who created htmlformentry_htmlform`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`location_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`location_tag` (
  `location_tag_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE INDEX `location_tag_uuid_index` (`uuid` ASC),
  INDEX `location_tag_creator` (`creator` ASC),
  INDEX `location_tag_retired_by` (`retired_by` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`location_tag_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`location_tag_map` (
  `location_id` INT(11) NOT NULL,
  `location_tag_id` INT(11) NOT NULL,
  PRIMARY KEY (`location_id`, `location_tag_id`),
  INDEX `location_tag_map_tag_idx` (`location_tag_id` ASC),
  INDEX `location_tag_map_location_idx` (`location_id` ASC),
  CONSTRAINT `location_tag_map_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`),
  CONSTRAINT `location_tag_map_tag`
    FOREIGN KEY (`location_tag_id`)
    REFERENCES `openmrs`.`location_tag` (`location_tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`note` (
  `note_id` INT(11) NOT NULL DEFAULT '0',
  `note_type` VARCHAR(50) NULL DEFAULT NULL,
  `patient_id` INT(11) NULL DEFAULT NULL,
  `obs_id` INT(11) NULL DEFAULT NULL,
  `encounter_id` INT(11) NULL DEFAULT NULL,
  `text` TEXT NOT NULL,
  `priority` INT(11) NULL DEFAULT NULL,
  `parent` INT(11) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE INDEX `note_uuid_index` (`uuid` ASC),
  INDEX `patient_note_idx` (`patient_id` ASC),
  INDEX `obs_note_idx` (`obs_id` ASC),
  INDEX `encounter_note_idx` (`encounter_id` ASC),
  INDEX `user_who_created_note` (`creator` ASC),
  INDEX `user_who_changed_note` (`changed_by` ASC),
  INDEX `note_hierarchy_idx` (`parent` ASC),
  CONSTRAINT `encounter_note`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `openmrs`.`encounter` (`encounter_id`),
  CONSTRAINT `note_hierarchy`
    FOREIGN KEY (`parent`)
    REFERENCES `openmrs`.`note` (`note_id`),
  CONSTRAINT `obs_note`
    FOREIGN KEY (`obs_id`)
    REFERENCES `openmrs`.`obs` (`obs_id`),
  CONSTRAINT `patient_note`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`notification_alert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`notification_alert` (
  `alert_id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(512) NOT NULL,
  `satisfied_by_any` INT(1) NOT NULL DEFAULT '0',
  `alert_read` INT(1) NOT NULL DEFAULT '0',
  `date_to_expire` DATETIME NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`alert_id`),
  UNIQUE INDEX `notification_alert_uuid_index` (`uuid` ASC),
  INDEX `alert_creator_idx` (`creator` ASC),
  INDEX `user_who_changed_alert_idx` (`changed_by` ASC),
  INDEX `alert_date_to_expire_idx` (`date_to_expire` ASC),
  CONSTRAINT `alert_creator`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `user_who_changed_alert`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`notification_alert_recipient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`notification_alert_recipient` (
  `alert_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `alert_read` INT(1) NOT NULL DEFAULT '0',
  `date_changed` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`alert_id`, `user_id`),
  INDEX `alert_read_by_user_idx` (`user_id` ASC),
  INDEX `id_of_alert_idx` (`alert_id` ASC),
  CONSTRAINT `alert_read_by_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `id_of_alert`
    FOREIGN KEY (`alert_id`)
    REFERENCES `openmrs`.`notification_alert` (`alert_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`notification_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`notification_template` (
  `template_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `template` TEXT NULL DEFAULT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `sender` VARCHAR(255) NULL DEFAULT NULL,
  `recipients` VARCHAR(512) NULL DEFAULT NULL,
  `ordinal` INT(11) NULL DEFAULT '0',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE INDEX `notification_template_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`patient_identifier_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`patient_identifier_type` (
  `patient_identifier_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  `description` TEXT NOT NULL,
  `format` VARCHAR(255) NULL DEFAULT NULL,
  `check_digit` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `required` SMALLINT(6) NOT NULL DEFAULT '0',
  `format_description` VARCHAR(255) NULL DEFAULT NULL,
  `validator` VARCHAR(200) NULL DEFAULT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `location_behavior` VARCHAR(50) NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE INDEX `patient_identifier_type_uuid_index` (`uuid` ASC),
  INDEX `type_creator` (`creator` ASC),
  INDEX `user_who_retired_patient_identifier_type` (`retired_by` ASC),
  INDEX `retired_status` (`retired` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`patient_identifier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`patient_identifier` (
  `patient_identifier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_id` INT(11) NOT NULL DEFAULT '0',
  `identifier` VARCHAR(50) NOT NULL DEFAULT '',
  `identifier_type` INT(11) NOT NULL DEFAULT '0',
  `preferred` SMALLINT(6) NOT NULL DEFAULT '0',
  `location_id` INT(11) NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `date_changed` DATETIME NULL,
  `changed_by` INT NULL,
  PRIMARY KEY (`patient_identifier_id`),
  UNIQUE INDEX `patient_identifier_uuid_index` (`uuid` ASC),
  INDEX `defines_identifier_type_idx` (`identifier_type` ASC),
  INDEX `identifier_creator` (`creator` ASC),
  INDEX `identifier_voider` (`voided_by` ASC),
  INDEX `identifier_location` (`location_id` ASC),
  INDEX `identifier_name` (`identifier` ASC),
  INDEX `idx_patient_identifier_patient` (`patient_id` ASC),
  CONSTRAINT `defines_identifier_type`
    FOREIGN KEY (`identifier_type`)
    REFERENCES `openmrs`.`patient_identifier_type` (`patient_identifier_type_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `identifies_patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`),
  CONSTRAINT `patient_identifier_ibfk_2`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 5285
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`patient_program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`patient_program` (
  `patient_program_id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_id` INT(11) NOT NULL DEFAULT '0',
  `program_id` INT(11) NOT NULL DEFAULT '0',
  `date_enrolled` DATETIME NULL DEFAULT NULL,
  `date_completed` DATETIME NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `location_id` INT(11) NULL,
  `outcome_concept_id` INT NULL,
  PRIMARY KEY (`patient_program_id`),
  UNIQUE INDEX `patient_program_uuid_index` (`uuid` ASC),
  INDEX `patient_in_program_idx` (`patient_id` ASC),
  INDEX `program_for_patient_idx` (`program_id` ASC),
  INDEX `patient_program_creator` (`creator` ASC),
  INDEX `user_who_changed` (`changed_by` ASC),
  INDEX `user_who_voided_patient_program` (`voided_by` ASC),
  INDEX `patient_program_location_id_idx` (`location_id` ASC),
  INDEX `patient_program_outcome_concept_id_fk_idx` (`outcome_concept_id` ASC),
  CONSTRAINT `patient_in_program`
    FOREIGN KEY (`patient_id`)
    REFERENCES `openmrs`.`patient` (`patient_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `program_for_patient`
    FOREIGN KEY (`program_id`)
    REFERENCES `openmrs`.`program` (`program_id`),
  CONSTRAINT `patient_program_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patient_program_outcome_concept_id_fk`
    FOREIGN KEY (`outcome_concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`patient_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`patient_state` (
  `patient_state_id` INT(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` INT(11) NOT NULL DEFAULT '0',
  `state` INT(11) NOT NULL DEFAULT '0',
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`patient_state_id`),
  UNIQUE INDEX `patient_state_uuid_index` (`uuid` ASC),
  INDEX `state_for_patient_idx` (`state` ASC),
  INDEX `patient_program_for_state_idx` (`patient_program_id` ASC),
  INDEX `patient_state_creator` (`creator` ASC),
  INDEX `patient_state_changer` (`changed_by` ASC),
  INDEX `patient_state_voider` (`voided_by` ASC),
  CONSTRAINT `patient_program_for_state`
    FOREIGN KEY (`patient_program_id`)
    REFERENCES `openmrs`.`patient_program` (`patient_program_id`),
  CONSTRAINT `state_for_patient`
    FOREIGN KEY (`state`)
    REFERENCES `openmrs`.`program_workflow_state` (`program_workflow_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`person_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person_address` (
  `person_address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `person_id` INT(11) NULL DEFAULT NULL,
  `preferred` SMALLINT(6) NOT NULL DEFAULT '0',
  `address1` VARCHAR(255) NULL DEFAULT NULL,
  `address2` VARCHAR(255) NULL DEFAULT NULL,
  `city_village` VARCHAR(255) NULL DEFAULT NULL,
  `state_province` VARCHAR(255) NULL DEFAULT NULL,
  `postal_code` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NULL DEFAULT NULL,
  `latitude` VARCHAR(50) NULL DEFAULT NULL,
  `longitude` VARCHAR(50) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `county_district` VARCHAR(255) NULL DEFAULT NULL,
  `address3` VARCHAR(255) NULL DEFAULT NULL,
  `address6` VARCHAR(255) NULL DEFAULT NULL,
  `address5` VARCHAR(255) NULL DEFAULT NULL,
  `address4` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `date_changed` DATETIME NULL,
  `changed_by` INT NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`person_address_id`),
  UNIQUE INDEX `person_address_uuid_index` (`uuid` ASC),
  INDEX `patient_address_creator` (`creator` ASC),
  INDEX `patient_addresses` (`person_id` ASC),
  INDEX `patient_address_void` (`voided_by` ASC),
  CONSTRAINT `address_for_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9347
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`person_attribute_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person_attribute_type` (
  `person_attribute_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  `description` TEXT NOT NULL,
  `format` VARCHAR(50) NULL DEFAULT NULL,
  `foreign_key` INT(11) NULL DEFAULT NULL,
  `searchable` SMALLINT(6) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `retired` SMALLINT(6) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `edit_privilege` VARCHAR(50) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `sort_weight` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE INDEX `person_attribute_type_uuid_index` (`uuid` ASC),
  INDEX `name_of_attribute` (`name` ASC),
  INDEX `type_creator` (`creator` ASC),
  INDEX `attribute_type_changer` (`changed_by` ASC),
  INDEX `attribute_is_searchable` (`searchable` ASC),
  INDEX `user_who_retired_person_attribute_type` (`retired_by` ASC),
  INDEX `person_attribute_type_retired_status` (`retired` ASC),
  INDEX `privilege_which_can_edit` (`edit_privilege` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`person_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person_attribute` (
  `person_attribute_id` INT(11) NOT NULL AUTO_INCREMENT,
  `person_id` INT(11) NOT NULL DEFAULT '0',
  `value` VARCHAR(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` INT(11) NOT NULL DEFAULT '0',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE INDEX `person_attribute_uuid_index` (`uuid` ASC),
  INDEX `identifies_person_idx` (`person_id` ASC),
  INDEX `defines_attribute_type_idx` (`person_attribute_type_id` ASC),
  INDEX `attribute_creator` (`creator` ASC),
  INDEX `attribute_changer` (`changed_by` ASC),
  INDEX `attribute_voider` (`voided_by` ASC),
  CONSTRAINT `defines_attribute_type`
    FOREIGN KEY (`person_attribute_type_id`)
    REFERENCES `openmrs`.`person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `openmrs`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5288
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`person_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person_name` (
  `person_name_id` INT(11) NOT NULL AUTO_INCREMENT,
  `preferred` SMALLINT(6) NOT NULL DEFAULT '0',
  `person_id` INT NOT NULL,
  `prefix` VARCHAR(50) NULL DEFAULT NULL,
  `given_name` VARCHAR(50) NULL DEFAULT NULL,
  `middle_name` VARCHAR(50) NULL DEFAULT NULL,
  `family_name_prefix` VARCHAR(50) NULL DEFAULT NULL,
  `family_name` VARCHAR(50) NULL DEFAULT NULL,
  `family_name2` VARCHAR(50) NULL DEFAULT NULL,
  `family_name_suffix` VARCHAR(50) NULL DEFAULT NULL,
  `degree` VARCHAR(50) NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`person_name_id`),
  UNIQUE INDEX `person_name_uuid_index` (`uuid` ASC),
  INDEX `name_for_patient` (`person_id` ASC),
  INDEX `user_who_made_name` (`creator` ASC),
  INDEX `user_who_voided_name` (`voided_by` ASC),
  INDEX `first_name` (`given_name` ASC),
  INDEX `middle_name` (`middle_name` ASC),
  INDEX `last_name` (`family_name` ASC),
  INDEX `family_name2` (`family_name2` ASC),
  CONSTRAINT `name for person`
    FOREIGN KEY (`person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9348
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`privilege` (
  `privilege` VARCHAR(50) NOT NULL DEFAULT '',
  `description` VARCHAR(250) NOT NULL DEFAULT '',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE INDEX `privilege_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`relationship_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`relationship_type` (
  `relationship_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` VARCHAR(50) NOT NULL,
  `b_is_to_a` VARCHAR(50) NOT NULL,
  `preferred` INT(1) NOT NULL DEFAULT '0',
  `weight` INT(11) NOT NULL DEFAULT '0',
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT '0',
  `retired_by` INT(11) NULL DEFAULT NULL,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE INDEX `relationship_type_uuid_index` (`uuid` ASC),
  INDEX `user_who_created_rel` (`creator` ASC),
  INDEX `user_who_retired_relationship_type` (`retired_by` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`relationship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`relationship` (
  `relationship_id` INT(11) NOT NULL AUTO_INCREMENT,
  `person_a` INT(11) NOT NULL,
  `relationship` INT(11) NOT NULL DEFAULT '0',
  `person_b` INT(11) NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL,
  `changed_by` INT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE INDEX `relationship_uuid_index` (`uuid` ASC),
  INDEX `relationship_type` (`relationship` ASC),
  INDEX `relation_creator` (`creator` ASC),
  INDEX `relation_voider` (`voided_by` ASC),
  INDEX `person_a_is_person_idx` (`person_a` ASC),
  INDEX `person_b_is_person_idx` (`person_b` ASC),
  CONSTRAINT `relationship_type_id`
    FOREIGN KEY (`relationship`)
    REFERENCES `openmrs`.`relationship_type` (`relationship_type_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `person_a_is_person`
    FOREIGN KEY (`person_a`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `person_b_is_person`
    FOREIGN KEY (`person_b`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`role` (
  `role` VARCHAR(50) NOT NULL DEFAULT '',
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE INDEX `role_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`role_privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`role_privilege` (
  `role` VARCHAR(50) NOT NULL DEFAULT '',
  `privilege` VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege`, `role`),
  INDEX `role_privilege_idx` (`role` ASC),
  INDEX `privilege_definitons_idx` (`privilege` ASC),
  CONSTRAINT `privilege_definitons`
    FOREIGN KEY (`privilege`)
    REFERENCES `openmrs`.`privilege` (`privilege`),
  CONSTRAINT `role_privilege`
    FOREIGN KEY (`role`)
    REFERENCES `openmrs`.`role` (`role`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`role_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`role_role` (
  `parent_role` VARCHAR(50) NOT NULL DEFAULT '',
  `child_role` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`, `child_role`),
  INDEX `inherited_role_idx` (`child_role` ASC),
  INDEX `parent_role_idx` (`parent_role` ASC),
  CONSTRAINT `inherited_role`
    FOREIGN KEY (`child_role`)
    REFERENCES `openmrs`.`role` (`role`),
  CONSTRAINT `parent_role`
    FOREIGN KEY (`parent_role`)
    REFERENCES `openmrs`.`role` (`role`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`user_property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`user_property` (
  `user_id` INT(11) NOT NULL DEFAULT '0',
  `property` VARCHAR(100) NOT NULL DEFAULT '',
  `property_value` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`, `property`),
  INDEX `user_property_idx` (`user_id` ASC),
  CONSTRAINT `user_property`
    FOREIGN KEY (`user_id`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`user_role` (
  `user_id` INT(11) NOT NULL DEFAULT '0',
  `role` VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`, `user_id`),
  INDEX `user_role_idx` (`user_id` ASC),
  INDEX `role_definitions_idx` (`role` ASC),
  CONSTRAINT `role_definitions`
    FOREIGN KEY (`role`)
    REFERENCES `openmrs`.`role` (`role`),
  CONSTRAINT `user_role`
    FOREIGN KEY (`user_id`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`formentry_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`formentry_archive` (
  `formentry_archive_id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_data` MEDIUMTEXT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formentry_archive_id`),
  INDEX `User who created formentry_archive_idx` (`creator` ASC),
  CONSTRAINT `User who created formentry_archive`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`formentry_error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`formentry_error` (
  `formentry_error_id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_data` MEDIUMTEXT NOT NULL,
  `error` VARCHAR(255) NOT NULL DEFAULT '',
  `error_details` TEXT NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`formentry_error_id`),
  INDEX `User who created formentry_error_idx` (`creator` ASC),
  CONSTRAINT `User who created formentry_error`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`formentry_queue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`formentry_queue` (
  `formentry_queue_id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_data` MEDIUMTEXT NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`formentry_queue_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`formentry_xsn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`formentry_xsn` (
  `formentry_xsn_id` INT(11) NOT NULL AUTO_INCREMENT,
  `form_id` INT(11) NOT NULL,
  `xsn_data` LONGBLOB NOT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `archived` INT(1) NOT NULL DEFAULT '0',
  `archived_by` INT(11) NULL DEFAULT NULL,
  `date_archived` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`formentry_xsn_id`),
  INDEX `User who created formentry_xsn_idx` (`creator` ASC),
  INDEX `Form with which this xsn is related_idx` (`form_id` ASC),
  INDEX `User who archived formentry_xsn_idx` (`archived_by` ASC),
  CONSTRAINT `Form with which this xsn is related`
    FOREIGN KEY (`form_id`)
    REFERENCES `openmrs`.`form` (`form_id`),
  CONSTRAINT `User who archived formentry_xsn`
    FOREIGN KEY (`archived_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `User who created formentry_xsn`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`hl7_in_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`hl7_in_archive` (
  `hl7_in_archive_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` INT(11) NOT NULL DEFAULT '0',
  `hl7_source_key` VARCHAR(255) NULL DEFAULT NULL,
  `hl7_data` MEDIUMTEXT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message_state` INT(1) NULL DEFAULT '2',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`hl7_in_archive_id`),
  UNIQUE INDEX `hl7_in_archive_uuid_index` (`uuid` ASC),
  INDEX `hl7_in_archive_message_state_idx` (`message_state` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`hl7_in_error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`hl7_in_error` (
  `hl7_in_error_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` INT(11) NOT NULL DEFAULT '0',
  `hl7_source_key` TEXT NULL DEFAULT NULL,
  `hl7_data` MEDIUMTEXT NOT NULL,
  `error` VARCHAR(255) NOT NULL DEFAULT '',
  `error_details` MEDIUMTEXT NULL DEFAULT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`hl7_in_error_id`),
  UNIQUE INDEX `hl7_in_error_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`hl7_source`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`hl7_source` (
  `hl7_source_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `description` TINYTEXT NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL DEFAULT '0',
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`hl7_source_id`),
  UNIQUE INDEX `hl7_source_uuid_index` (`uuid` ASC),
  INDEX `creator` (`creator` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`hl7_in_queue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`hl7_in_queue` (
  `hl7_in_queue_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` INT(11) NOT NULL DEFAULT '0',
  `hl7_source_key` TEXT NULL DEFAULT NULL,
  `hl7_data` MEDIUMTEXT NOT NULL,
  `message_state` INT(1) NOT NULL DEFAULT '0',
  `date_processed` DATETIME NULL DEFAULT NULL,
  `error_msg` TEXT NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`hl7_in_queue_id`),
  UNIQUE INDEX `hl7_in_queue_uuid_index` (`uuid` ASC),
  INDEX `hl7_source_idx` (`hl7_source` ASC),
  CONSTRAINT `hl7_source`
    FOREIGN KEY (`hl7_source`)
    REFERENCES `openmrs`.`hl7_source` (`hl7_source_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`liquibasechangeloglock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`liquibasechangeloglock` (
  `ID` INT(11) NOT NULL,
  `LOCKED` TINYINT(1) NOT NULL,
  `LOCKGRANTED` DATETIME NULL DEFAULT NULL,
  `LOCKEDBY` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`liquibasechangelog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`liquibasechangelog` (
  `ID` VARCHAR(63) NOT NULL,
  `AUTHOR` VARCHAR(63) NOT NULL,
  `FILENAME` VARCHAR(200) NOT NULL,
  `DATEEXECUTED` DATETIME NOT NULL,
  `MD5SUM` VARCHAR(32) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `COMMENTS` VARCHAR(255) NULL DEFAULT NULL,
  `TAG` VARCHAR(255) NULL DEFAULT NULL,
  `LIQUIBASE` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `AUTHOR`, `FILENAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`logic_rule_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`logic_rule_token` (
  `logic_rule_token_id` INT(11) NOT NULL AUTO_INCREMENT,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0002-11-30 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `token` VARCHAR(512) NOT NULL,
  `class_name` VARCHAR(512) NOT NULL,
  `state` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`logic_rule_token_id`),
  INDEX `token_creator_idx` (`creator` ASC),
  INDEX `token_changed_by_idx` (`changed_by` ASC),
  CONSTRAINT `token_creator`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`person` (`person_id`),
  CONSTRAINT `token_changed_by`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`person` (`person_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`logic_rule_token_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`logic_rule_token_tag` (
  `logic_rule_token_id` INT(11) NOT NULL,
  `tag` VARCHAR(512) NOT NULL,
  INDEX `token_tag_idx` (`logic_rule_token_id` ASC),
  CONSTRAINT `token_tag`
    FOREIGN KEY (`logic_rule_token_id`)
    REFERENCES `openmrs`.`logic_rule_token` (`logic_rule_token_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`report_object`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`report_object` (
  `report_object_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `report_object_type` VARCHAR(255) NOT NULL,
  `report_object_sub_type` VARCHAR(255) NOT NULL,
  `xml_data` TEXT NULL DEFAULT NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `voided` SMALLINT(6) NOT NULL DEFAULT '0',
  `voided_by` INT(11) NULL DEFAULT NULL,
  `date_voided` DATETIME NULL DEFAULT NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`report_object_id`),
  UNIQUE INDEX `report_object_uuid_index` (`uuid` ASC),
  INDEX `report_object_creator` (`creator` ASC),
  INDEX `user_who_changed_report_object` (`changed_by` ASC),
  INDEX `user_who_voided_report_object` (`voided_by` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`report_schema_xml`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`report_schema_xml` (
  `report_schema_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `xml_data` MEDIUMTEXT NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`report_schema_id`),
  UNIQUE INDEX `report_schema_xml_uuid_index` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`scheduler_task_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`scheduler_task_config` (
  `task_config_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  `schedulable_class` TEXT NULL DEFAULT NULL,
  `start_time` DATETIME NULL DEFAULT NULL,
  `start_time_pattern` VARCHAR(50) NULL DEFAULT NULL,
  `repeat_interval` INT(11) NOT NULL DEFAULT '0',
  `start_on_startup` INT(1) NOT NULL DEFAULT '0',
  `started` INT(1) NOT NULL DEFAULT '0',
  `created_by` INT(11) NULL DEFAULT '0',
  `date_created` DATETIME NULL DEFAULT '2005-01-01 00:00:00',
  `changed_by` INT(11) NULL DEFAULT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  `last_execution_time` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`task_config_id`),
  UNIQUE INDEX `scheduler_task_config_uuid_index` (`uuid` ASC),
  INDEX `schedule_creator` (`created_by` ASC),
  INDEX `schedule_changer` (`changed_by` ASC),
  CONSTRAINT `scheduler_changer`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `scheduler_creator`
    FOREIGN KEY (`created_by`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`scheduler_task_config_property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`scheduler_task_config_property` (
  `task_config_property_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `value` TEXT NULL DEFAULT NULL,
  `task_config_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`task_config_property_id`),
  INDEX `task_config` (`task_config_id` ASC),
  CONSTRAINT `task_config_for_property`
    FOREIGN KEY (`task_config_id`)
    REFERENCES `openmrs`.`scheduler_task_config` (`task_config_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`serialized_object`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`serialized_object` (
  `serialized_object_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(5000) NULL DEFAULT NULL,
  `type` VARCHAR(255) NOT NULL,
  `subtype` VARCHAR(255) NOT NULL,
  `serialization_class` VARCHAR(255) NOT NULL,
  `serialized_data` MEDIUMTEXT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `creator` INT(11) NOT NULL,
  `date_changed` DATETIME NULL DEFAULT NULL,
  `changed_by` INT(11) NULL DEFAULT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `date_retired` DATETIME NULL DEFAULT NULL,
  `retired_by` INT(11) NULL DEFAULT NULL,
  `retire_reason` VARCHAR(1000) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`serialized_object_id`),
  UNIQUE INDEX `serialized_object_uuid_index` (`uuid` ASC),
  INDEX `serialized_object_creator_idx` (`creator` ASC),
  INDEX `serialized_object_changed_by_idx` (`changed_by` ASC),
  INDEX `serialized_object_retired_by_idx` (`retired_by` ASC),
  CONSTRAINT `serialized_object_changed_by`
    FOREIGN KEY (`changed_by`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `serialized_object_creator`
    FOREIGN KEY (`creator`)
    REFERENCES `openmrs`.`users` (`user_id`),
  CONSTRAINT `serialized_object_retired_by`
    FOREIGN KEY (`retired_by`)
    REFERENCES `openmrs`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`active_list_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`active_list_type` (
  `active_list_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT(11) NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`active_list_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`active_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`active_list` (
  `active_list_id` INT NOT NULL AUTO_INCREMENT,
  `active_list_type_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `concept_id` INT NOT NULL,
  `start_obs_id` INT NULL,
  `stop_obs_id` INT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL,
  `comments` VARCHAR(255) NULL,
  `creator` INT(11) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT(11) NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`active_list_id`),
  INDEX `active_list_type_of_active_list_idx` (`active_list_type_id` ASC),
  INDEX `person_of_active_list_idx` (`person_id` ASC),
  INDEX `concept_active_list_idx` (`concept_id` ASC),
  INDEX `start_obs_active_list_idx` (`start_obs_id` ASC),
  INDEX `stop_obs_active_list_idx` (`stop_obs_id` ASC),
  CONSTRAINT `active_list_type_of_active_list`
    FOREIGN KEY (`active_list_type_id`)
    REFERENCES `openmrs`.`active_list_type` (`active_list_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `person_of_active_list`
    FOREIGN KEY (`person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `concept_active_list`
    FOREIGN KEY (`concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `start_obs_active_list`
    FOREIGN KEY (`start_obs_id`)
    REFERENCES `openmrs`.`obs` (`obs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stop_obs_active_list`
    FOREIGN KEY (`stop_obs_id`)
    REFERENCES `openmrs`.`obs` (`obs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`active_list_allergy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`active_list_allergy` (
  `active_list_id` INT NOT NULL AUTO_INCREMENT,
  `allergy_type` VARCHAR(50) NULL,
  `reaction_concept_id` INT NULL,
  `severity` VARCHAR(50) NULL,
  PRIMARY KEY (`active_list_id`),
  INDEX `reaction_allergy_idx` (`reaction_concept_id` ASC),
  CONSTRAINT `reaction_allergy`
    FOREIGN KEY (`reaction_concept_id`)
    REFERENCES `openmrs`.`concept` (`concept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`active_list_problem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`active_list_problem` (
  `active_list_id` INT NOT NULL,
  `status` VARCHAR(50) NULL,
  `sort_weight` DOUBLE NULL,
  PRIMARY KEY (`active_list_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_stop_word`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_stop_word` (
  `concept_stop_word_id` INT NOT NULL AUTO_INCREMENT,
  `word` VARCHAR(50) NOT NULL,
  `locale` VARCHAR(20) NOT NULL DEFAULT 'en',
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`person_merge_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`person_merge_log` (
  `person_merge_log_id` INT NOT NULL AUTO_INCREMENT,
  `winner_person_id` INT NOT NULL,
  `loser_person_id` INT NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `merged_data` BLOB NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`),
  INDEX `person_merge_log_winner_idx` (`winner_person_id` ASC),
  INDEX `person_merge_log_loser_idx` (`loser_person_id` ASC),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  CONSTRAINT `person_merge_log_winner`
    FOREIGN KEY (`winner_person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `person_merge_log_loser`
    FOREIGN KEY (`loser_person_id`)
    REFERENCES `openmrs`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`visit_attribute_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`visit_attribute_type` (
  `visit_attribute_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  `datatype` VARCHAR(255) NULL,
  `datatype_config` TEXT NULL,
  `preferred_handler` VARCHAR(255) NULL,
  `handler_config` TEXT NULL,
  `min_occurs` INT NOT NULL,
  `max_occurs` INT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT(11) NOT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`visit_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`visit_attribute` (
  `visit_attribute_id` INT NOT NULL AUTO_INCREMENT,
  `visit_id` INT NOT NULL,
  `attribute_type_id` INT NOT NULL,
  `value_reference` TEXT NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT(11) NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  INDEX `visit_attribute_visit_fk_idx` (`visit_id` ASC),
  INDEX `visit_attribute_attribute_type_id_fk_idx` (`attribute_type_id` ASC),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  CONSTRAINT `visit_attribute_visit_fk`
    FOREIGN KEY (`visit_id`)
    REFERENCES `openmrs`.`visit` (`visit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visit_attribute_attribute_type_id_fk`
    FOREIGN KEY (`attribute_type_id`)
    REFERENCES `openmrs`.`visit_attribute_type` (`visit_attribute_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`location_attribute_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`location_attribute_type` (
  `location_attribute_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  `datatype` VARCHAR(255) NULL,
  `datatype_config` TEXT NULL,
  `preferred_handler` VARCHAR(255) NULL,
  `handler_config` TEXT NULL,
  `min_occurs` INT NOT NULL,
  `max_occurs` INT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT 0,
  `retired_by` INT(11) NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(8) NOT NULL,  
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`location_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`location_attribute` (
  `idlocation_attribute` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `attribute_type_id` INT NOT NULL,
  `value_reference` TEXT NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT 0,
  `voided_by` INT NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idlocation_attribute`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `location_attribute_location_fk_idx` (`location_id` ASC),
  INDEX `location_attribute_attribute_type_id_fk_idx` (`attribute_type_id` ASC),
  CONSTRAINT `location_attribute_location_fk`
    FOREIGN KEY (`location_id`)
    REFERENCES `openmrs`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_attribute_attribute_type_id_fk`
    FOREIGN KEY (`attribute_type_id`)
    REFERENCES `openmrs`.`location_attribute_type` (`location_attribute_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_map_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_map_type` (
  `concept_map_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `is_hidden` TINYINT(1) NOT NULL DEFAULT 0,
  `retired` TINYINT(1) NOT NULL DEFAULT 0,
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`concept_reference_term_map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`concept_reference_term_map` (
  `concept_reference_term_map_id` INT NOT NULL AUTO_INCREMENT,
  `term_a_id` INT NOT NULL,
  `term_b_id` INT NOT NULL,
  `a_is_to_b_id` INT NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `mapped_term_a_idx` (`term_a_id` ASC),
  INDEX `mapped_term_b_idx` (`term_b_id` ASC),
  INDEX `mapped_concept_map_type_ref_term_map_idx` (`a_is_to_b_id` ASC),
  CONSTRAINT `mapped_term_a`
    FOREIGN KEY (`term_a_id`)
    REFERENCES `openmrs`.`concept_reference_term` (`concept_reference_term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mapped_term_b`
    FOREIGN KEY (`term_b_id`)
    REFERENCES `openmrs`.`concept_reference_term` (`concept_reference_term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mapped_concept_map_type_ref_term_map`
    FOREIGN KEY (`a_is_to_b_id`)
    REFERENCES `openmrs`.`concept_map_type` (`concept_map_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`provider` (
  `provider_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `identifier` VARCHAR(255) NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`provider_attribute_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`provider_attribute_type` (
  `provider_attribute_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  `datatype` VARCHAR(255) NULL,
  `datatype_config` TEXT NULL,
  `preferred_handler` VARCHAR(255) NULL,
  `handler_config` TEXT NULL,
  `min_occurs` INT NOT NULL,
  `max_occurs` INT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`provider_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`provider_attribute` (
  `provider_attribute_id` INT NOT NULL,
  `provider_id` INT NOT NULL,
  `attribute_type_id` INT NOT NULL,
  `value_reference` TEXT NOT NULL,
  `uuid` CHAR(38) NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `voided_by` INT NULL,
  `date_voided` DATETIME NULL,
  `void_reason` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `provider_attribute_provider_fk_idx` (`provider_id` ASC),
  INDEX `provider_attribute_attribute_type_id_fk_idx` (`attribute_type_id` ASC),
  CONSTRAINT `provider_attribute_provider_fk`
    FOREIGN KEY (`provider_id`)
    REFERENCES `openmrs`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `provider_attribute_attribute_type_id_fk`
    FOREIGN KEY (`attribute_type_id`)
    REFERENCES `openmrs`.`provider_attribute_type` (`provider_attribute_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`encounter_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`encounter_role` (
  `encounter_role_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `retired` TINYINT(1) NOT NULL DEFAULT FALSE,
  `retired_by` INT NULL,
  `date_retired` DATETIME NULL,
  `retire_reason` VARCHAR(255) NULL DEFAULT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`encounter_provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`encounter_provider` (
  `encounter_provider_id` INT NOT NULL AUTO_INCREMENT,
  `encounter_id` INT NOT NULL,
  `provider_id` INT NOT NULL,
  `encounter_role_id` INT NOT NULL,
  `creator` INT NOT NULL,
  `date_created` DATETIME NULL,
  `changed_by` INT NULL,
  `date_changed` DATETIME NULL,
  `voided` TINYINT(1) NOT NULL DEFAULT FALSE,
  `date_voided` DATETIME NULL,
  `voided_by` INT NULL,
  `void_reason` VARCHAR(255) NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `encounter_id_fk_idx` (`encounter_id` ASC),
  INDEX `provider_id_fk_idx` (`provider_id` ASC),
  INDEX `encounter_role_id_fk_idx` (`encounter_role_id` ASC),
  CONSTRAINT `encounter_id_fk`
    FOREIGN KEY (`encounter_id`)
    REFERENCES `openmrs`.`encounter` (`encounter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `provider_id_fk`
    FOREIGN KEY (`provider_id`)
    REFERENCES `openmrs`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `encounter_role_id_fk`
    FOREIGN KEY (`encounter_role_id`)
    REFERENCES `openmrs`.`encounter_role` (`encounter_role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`old_form_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`old_form_resource` (
  `form_resource_id` INT NOT NULL AUTO_INCREMENT,
  `form_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `value_reference` TEXT NOT NULL,
  `datatype` VARCHAR(255) NULL,
  `datatype_config` TEXT NULL,
  `preferred_handler` VARCHAR(255) NULL,
  `handler_config` TEXT NULL,
  `uuid` CHAR(38) NOT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `form_resource_form_fk_idx` (`form_id` ASC),
  UNIQUE INDEX `form_id_UNIQUE` (`form_id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  CONSTRAINT `form_resource_form_fk`
    FOREIGN KEY (`form_id`)
    REFERENCES `openmrs`.`form` (`form_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openmrs`.`clob_datatype_storage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openmrs`.`clob_datatype_storage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(38) NOT NULL,
  `value` BLOB NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `clob_datatype_storage_uuid_index` (`uuid` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
