--
-- Database: `Openemr`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `Addresses`
-- 

DROP TABLE IF EXISTS `Addresses`;
CREATE TABLE `Addresses` (
  `Id` int(11) NOT NULL default '0',
  `TenantId` int(11) NOT NULL,
  `Line1` varchar(255) default NULL,
  `Line2` varchar(255) default NULL,
  `City` varchar(255) default NULL,
  `State` varchar(35) default NULL,
  `Zip` varchar(10) default NULL,
  `PlusFour` varchar(4) default NULL,
  `Country` varchar(255) default NULL,
  `ForeignId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `ForeignId` (`ForeignId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `AmcMiscData`
--

DROP TABLE IF EXISTS `AmcMiscData`;
CREATE TABLE `AmcMiscData` (
  `AmcId` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to listOptions list clinicalRules',
  `Pid` bigint(20) default NULL,
  `MapCategory` varchar(255) NOT NULL default '' COMMENT 'Maps to an object category (Such as prescriptions etc.)',
  `MapId` bigint(20) NOT NULL default '0' COMMENT 'Maps to an object id (Such as prescription id etc.)',
  `DateCreated` datetime default NULL,
  `DateCompleted` datetime default NULL,
  KEY  (`AmcId`,`Pid`,`MapId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Amendments`
--

DROP TABLE IF EXISTS `Amendments`;
CREATE TABLE IF NOT EXISTS `Amendments` (
  `AmendmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
  `AmendmentDate` date	NOT NULL COMMENT 'Amendement request date',
  `AmendmentBy` varchar(50) NOT NULL COMMENT 'Amendment requested from',
  `AmendmentStatus` varchar(50) NULL COMMENT 'Amendment status accepted/rejected/null',
  `Pid` int(11) NOT NULL COMMENT 'Patient ID from patientData',
  `AmendmentDesc` text COMMENT 'Amendment Details',
  `CreatedBy` int(11) NOT NULL COMMENT 'References users.id for session owner',
  `ModifiedBy`	int(11) NULL COMMENT 'References users.id for session owner',
  `CreatedTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created time',
  `ModifiedTime` timestamp NULL COMMENT 'Modified time',
  PRIMARY KEY amendmentsId(`AmendmentId`),
  KEY amendmentPid(`Pid`)
) ENGINE = InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `AmendmentsHistory`
--

DROP TABLE IF EXISTS `AmendmentsHistory`;
CREATE TABLE IF NOT EXISTS `AmendmentsHistory` (
  `AmendmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Amendment ID',
  `AmendmentNote` text COMMENT 'Amendment requested from',
  `AmendmentStatus` VARCHAR(50) NULL COMMENT 'Amendment Request Status',
  `CreatedBy` int(11) NOT NULL COMMENT 'References users.id for session owner',
  `CreatedTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created time',
KEY amendmentHistoryId(`AmendmentId`)
) ENGINE = InnoDB;
	
-- --------------------------------------------------------

-- 
-- Table structure for table `Array`
-- 

DROP TABLE IF EXISTS `Array`;
CREATE TABLE `Array` (
  `ArrayKey` varchar(255) default NULL,
  `ArrayValue` longtext
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `AuditMaster`
--

DROP TABLE IF EXISTS `AuditMaster`;
CREATE TABLE `AuditMaster` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pid` bigint(20) NOT NULL,
  `UserId` bigint(20) NOT NULL COMMENT 'The Id of the user who approves or denies',
  `ApprovalStatus` tinyint(4) NOT NULL COMMENT '1-Pending,2-Approved,3-Denied,4-Appointment directly updated to calendar table,5-Cancelled appointment',
  `Comments` text,
  `CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedTime` datetime NOT NULL,
  `IpAddress` varchar(100) NOT NULL,
  `Type` tinyint(4) NOT NULL COMMENT '1-new patient,2-existing patient,3-change is only in the document,4-Patient upload,5-random key,10-Appointment',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- Table structure for table `AuditDetails`
--

DROP TABLE IF EXISTS `AuditDetails`;
CREATE TABLE `AuditDetails` (
  `Id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `TableName` VARCHAR(100) NOT NULL COMMENT 'Openemr table name',
  `FieldName` VARCHAR(100) NOT NULL COMMENT 'Openemr table''S field name',
  `FieldValue` TEXT COMMENT 'Openemr table''S field value',
  `AuditMasterId` BIGINT(20) NOT NULL COMMENT 'Id of the auditMaster table',
  `EntryIdentification` VARCHAR(255) NOT NULL DEFAULT '1' COMMENT 'Used when multiple entry occurs from the same table.1 means no multiple entry',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- Table structure for table `BackgroundServices`
--

DROP TABLE IF EXISTS `BackgroundServices`;
CREATE TABLE `BackgroundServices` (
  `Name` varchar(31) NOT NULL,
  `Title` varchar(127) NOT NULL COMMENT 'Name for reports',
  `Active` tinyint(1) NOT NULL default '0',
  `Running` tinyint(1) NOT NULL default '-1',
  `NextRun` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ExecuteInterval` int(11) NOT NULL default '0' COMMENT 'Minimum number of minutes between function calls,0=manual mode',
  `Function` varchar(127) NOT NULL COMMENT 'Name of background service function',
  `RequireOnce` varchar(255) default NULL COMMENT 'Include file (If necessary)',
  `SortOrder` int(11) NOT NULL default '100' COMMENT 'Lower numbers will be run first',
  PRIMARY KEY  (`Name`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `BackgroundServices`
-- 

INSERT INTO `BackgroundServices` (`Name`, `Title`, `ExecuteInterval`, `Function`, `RequireOnce`, `SortOrder`) VALUES
('Phimail', 'PhiMail Direct Messaging Service', 5, 'PhimailCheck', '/library/directMessageCheck.inc', 100);

-- --------------------------------------------------------

-- 
-- Table structure for table `Batchcom`
-- 

DROP TABLE IF EXISTS `Batchcom`;
CREATE TABLE `Batchcom` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) NOT NULL default '0',
  `SentBy` bigint(20) NOT NULL default '0',
  `MsgType` varchar(60) default NULL,
  `MsgSubject` varchar(255) default NULL,
  `MsgText` mediumtext,
  `MsgDateSent` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Billing`
-- 

DROP TABLE IF EXISTS `Billing`;
CREATE TABLE `Billing` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `CodeType` varchar(15) default NULL,
  `Code` varchar(20) default NULL,
  `Pid` int(11) default NULL,
  `ProviderId` int(11) default NULL,
  `User` int(11) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(1) default NULL,
  `Encounter` int(11) default NULL,
  `CodeText` longtext,
  `Billed` tinyint(1) default NULL,
  `Activity` tinyint(1) default NULL,
  `PayerId` int(11) default NULL,
  `BillProcess` tinyint(2) NOT NULL default '0',
  `BillDate` datetime default NULL,
  `ProcessDate` datetime default NULL,
  `ProcessFile` varchar(255) default NULL,
  `Modifier` varchar(12) default NULL,
  `Units` int(11) default NULL,
  `Fee` decimal(12,2) default NULL,
  `Justify` varchar(255) default NULL,
  `Target` varchar(30) default NULL,
  `X12PartnerId` int(11) default NULL,
  `NdcInfo` varchar(255) default NULL,
  `Notecodes` varchar(25) NOT NULL default '',
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Categories`
-- 

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories` (
  `Id` int(11) NOT NULL default '0',
  `Name` varchar(255) default NULL,
  `Value` varchar(255) default NULL,
  `Parent` int(11) NOT NULL default '0',
  `Lft` int(11) NOT NULL default '0',
  `Rght` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Id`),
  KEY `Parent` (`Parent`),
  KEY `Lft` (`Lft`,`Rght`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `Categories`
-- 

INSERT INTO `Categories` VALUES (1, 'Categories', '', 0, 0, 25);
INSERT INTO `Categories` VALUES (2, 'Lab Report', '', 1, 1, 2);
INSERT INTO `Categories` VALUES (3, 'Medical Record', '', 1, 3, 4);
INSERT INTO `Categories` VALUES (4, 'Patient Information', '', 1, 5, 10);
INSERT INTO `Categories` VALUES (5, 'Patient ID card', '', 4, 6, 7);
INSERT INTO `Categories` VALUES (6, 'Advance Directive', '', 1, 11, 18);
INSERT INTO `Categories` VALUES (7, 'Do Not Resuscitate Order', '', 6, 12, 13);
INSERT INTO `Categories` VALUES (8, 'Durable Power of Attorney', '', 6, 14, 15);
INSERT INTO `Categories` VALUES (9, 'Living Will', '', 6, 16, 17);
INSERT INTO `Categories` VALUES (10, 'Patient Photograph', '', 4, 8, 9);
INSERT INTO `Categories` VALUES (11, 'CCR', '', 1, 19, 20);
INSERT INTO `Categories` VALUES (12, 'CCD', '', 1, 21, 22);
INSERT INTO `Categories` VALUES (13, 'CCDA', '', 1, 23, 24);

-- --------------------------------------------------------

-- 
-- Table structure for table `CategoriesSeq`
-- 

DROP TABLE IF EXISTS `CategoriesSeq`;
CREATE TABLE `CategoriesSeq` (
  `Id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `CategoriesSeq`
-- 

INSERT INTO `CategoriesSeq` VALUES (13);

-- --------------------------------------------------------

-- 
-- Table structure for table `CategoriesToDocuments`
-- 

DROP TABLE IF EXISTS `CategoriesToDocuments`;
CREATE TABLE `CategoriesToDocuments` (
  `CategoryId` int(11) NOT NULL default '0',
  `DocumentId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`CategoryId`,`DocumentId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Claims`
-- 

DROP TABLE IF EXISTS `Claims`;
CREATE TABLE `Claims` (
  `PatientId` int(11) NOT NULL,
  `EncounterId` int(11) NOT NULL,
  `Version` int(10) unsigned NOT NULL COMMENT 'Claim version,Incremented in code',
  `PayerId` int(11) NOT NULL default '0',
  `Status` tinyint(2) NOT NULL default '0',
  `PayerType` tinyint(4) NOT NULL default '0',
  `BillProcess` tinyint(2) NOT NULL default '0',
  `BillTime` datetime default NULL,
  `ProcessTime` datetime default NULL,
  `ProcessFile` varchar(255) default NULL,
  `Target` varchar(30) default NULL,
  `X12PartnerId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`PatientId`,`EncounterId`,`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ClinicalPlans`
--

DROP TABLE IF EXISTS `ClinicalPlans`;
CREATE TABLE `ClinicalPlans` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to listOptions list clinicalPlans',
  `Pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients,While > 0 is id from patientData table',
  `NormalFlag` tinyint(1) COMMENT 'Normal Activation Flag',
  `CqmFlag` tinyint(1) COMMENT 'Clinical Quality Measure flag (Unable to customize per patient)',
  `Cqm2011Flag` tinyint(1) COMMENT '2011 Clinical Quality Measure flag (Unable to customize per patient)',
  `Cqm2014Flag` tinyint(1) COMMENT '2014 Clinical Quality Measure flag (Unable to customize per patient)',
  `CqmMeasureGroup` varchar(10) NOT NULL default '' COMMENT 'Clinical Quality Measure Group Identifier',
  PRIMARY KEY  (`Id`,`Pid`)
) ENGINE=InnoDB ;

--
-- Clinical Quality Measure (CMQ) plans
--
-- Measure Group A: Diabetes Mellitus
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('DmPlanCqm', 0, 0, 1, 1, 'A');
-- Measure Group C: Chronic Kidney Disease (CKD)
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('CkdPlanCqm', 0, 0, 1, 1, 'C');
-- Measure Group D: Preventative Care
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('PreventPlanCqm', 0, 0, 1, 1, 'D');
-- Measure Group E: Perioperative Care
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('PeriopPlanCqm', 0, 0, 1, 1, 'E');
-- Measure Group F: Rheumatoid Arthritis
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('RheumArthPlanCqm', 0, 0, 1, 1, 'F');
-- Measure Group G: Back Pain
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('BackPainPlanCqm', 0, 0, 1, 1, 'G');
-- Measure Group H: Coronary Artery Bypass Graft (CABG)
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmMeasureGroup` ) VALUES ('CabgPlanCqm', 0, 0, 1, 1, 'H');
--
-- Standard clinical plans
--
-- Diabetes Mellitus
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `CqmMeasureGroup` ) VALUES ('DmPlan', 0, 1, 0, '');
INSERT INTO `ClinicalPlans` ( `Id`, `Pid`, `NormalFlag`, `CqmFlag`, `CqmMeasureGroup` ) VALUES ('PreventPlan', 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `ClinicalPlansRules`
--

DROP TABLE IF EXISTS `ClinicalPlansRules`;
CREATE TABLE `ClinicalPlansRules` (
  `PlanId` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to listOptions list clinicalPlans',
  `RuleId` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to listOptions list clinicalRules',
  PRIMARY KEY  (`PlanId`,`RuleId`)
) ENGINE=InnoDB ;

--
-- Clinical Quality Measure (CMQ) plans to rules mappings
--
-- Measure Group A: Diabetes Mellitus
--   NQF 0059 (PQRI 1)   Diabetes: HbA1c Poor Control
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlanCqm', 'RuleDmA1cCqm');
--   NQF 0064 (PQRI 2)   Diabetes: LDL Management & Control
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlanCqm', 'RuleDmLdlCqm');
--   NQF 0061 (PQRI 3)   Diabetes: Blood Pressure Management
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlanCqm', 'RuleDmBpControlCqm');
--   NQF 0055 (PQRI 117) Diabetes: Eye Exam
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlanCqm', 'RuleDmEyeCqm');
--   NQF 0056 (PQRI 163) Diabetes: Foot Exam
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlanCqm', 'RuleDmFootCqm');
-- Measure Group D: Preventative Care
--   NQF 0041 (PQRI 110) Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlanCqm', 'RuleInfluenzaGe50Cqm');
--   NQF 0043 (PQRI 111) Pneumonia Vaccination Status for Older Adults
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlanCqm', 'RulePneumovaccGe65Cqm');
--   NQF 0421 (PQRI 128) Adult Weight Screening and Follow-Up
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlanCqm', 'RuleAdultWtScreenFuCqm');
--
-- Standard clinical plans to rules mappings
--
-- Diabetes Mellitus
--   Hemoglobin A1C
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlan', 'RuleDmHemoA1c');
--   Urine Microalbumin
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlan', 'RuleDmUrineAlb');
--   Eye Exam
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlan', 'RuleDmEye');
--   Foot Exam
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('DmPlan', 'RuleDmFoot');
-- Preventative Care
--   Hypertension: Blood Pressure Measurement
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleHtnBpMeasure');
--   Tobacco Use Assessment
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleTobUseAssess');
--   Tobacco Cessation Intervention
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleTobCessInter');
--   Adult Weight Screening and Follow-Up
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleAdultWtScreenFu');
--   Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleWtAssessCounsChild');
--   Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleInfluenzaGe50');
--   Pneumonia Vaccination Status for Older Adults
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RulePneumovaccGe65');
--   Cancer Screening: Mammogram
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleCsMammo');
--   Cancer Screening: Pap Smear
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleCsPap');
--   Cancer Screening: Colon Cancer Screening
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleCsColon');
--   Cancer Screening: Prostate Cancer Screening
INSERT INTO `ClinicalPlansRules` ( `PlanId`, `RuleId` ) VALUES ('PreventPlan', 'RuleCsProstate');

-- --------------------------------------------------------

--
-- Table structure for table `ClinicalRules`
--

DROP TABLE IF EXISTS `ClinicalRules`;
CREATE TABLE `ClinicalRules` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to listOptions list clinicalRules',
  `Pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients,While > 0 is id from patientData table',
  `ActiveAlertFlag` tinyint(1) COMMENT 'Active Alert Widget Module flag - note not yet utilized',
  `PassiveAlertFlag` tinyint(1) COMMENT 'Passive Alert Widget Module flag',
  `CqmFlag` tinyint(1) COMMENT 'Clinical Quality Measure flag (Unable to customize per patient)',
  `Cqm2011Flag` tinyint(1) COMMENT '2011 Clinical Quality Measure flag (Unable to customize per patient)',
  `Cqm2014Flag` tinyint(1) COMMENT '2014 Clinical Quality Measure flag (Unable to customize per patient)',
  `CqmNqfCode` varchar(10) NOT NULL default '' COMMENT 'Clinical Quality Measure NQF identifier',
  `CqmPqriCode` varchar(10) NOT NULL default '' COMMENT 'Clinical Quality Measure PQRI identifier',
  `AmcFlag` tinyint(1) COMMENT 'Automated Measure Calculation flag (Unable to customize per patient)',
  `Amc2011Flag` tinyint(1) COMMENT '2011 Automated Measure Calculation flag for (Unable to customize per patient)',
  `Amc2014Flag` tinyint(1) COMMENT '2014 Automated Measure Calculation flag for (Unable to customize per patient)',
  `AmcCode` varchar(10) NOT NULL default '' COMMENT 'Automated Measure Calculation indentifier (MU rule)',
  `AmcCode2014` varchar(30) NOT NULL default '' COMMENT 'Automated Measure Calculation 2014 indentifier (MU rule)',
  `Amc2014Stage1Flag` tinyint(1) COMMENT '2014 Stage 1 - Automated Measure Calculation flag for (Unable to customize per patient)',
  `Amc2014Stage2Flag` tinyint(1) COMMENT '2014 Stage 2 - Automated Measure Calculation flag for (Unable to customize per patient)',
  `PatientReminderFlag` tinyint(1) COMMENT 'Clinical Reminder Module flag',
  `Developer` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Developer',
  `FundingSource` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Funding Source',
  `ReleaseVersion` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Release Version',
  `WebReference` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Clinical Rule Web Reference',
  `AccessControl` VARCHAR(255) NOT NULL DEFAULT 'Patients:med' COMMENT 'ACO link for access control',
  PRIMARY KEY  (`Id`,`Pid`)
) ENGINE=InnoDB ;

--
-- Automated Measure Calculation (AMC) rules
--
-- MU 170.302(C) Maintain an up-to-date problem list of current and active diagnoses (2014-MU-AMC:170.314(G)(1)/(2)-4)
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag` ) VALUES ('ProblemListAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(C)', 1, '170.314(G)(1)/(2)-4', 0, 1);
-- MU 170.302(D) Maintain active medication list
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag` ) VALUES ('MedListAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(D)', 1, '170.314(G)(1)/(2)-5', 0, 1);
-- MU 170.302(E) Maintain active medication allergy list
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag` ) VALUES ('MedAllergyListAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(E)', 1, '170.314(G)(1)/(2)-6', 0, 1);
-- MU 170.302(F) Record and chart changes in vital signs
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RecordVitalsAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(F)', 0);
-- MU 170.302(G) Record smoking status for patients 13 years old or older
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag` ) VALUES ('RecordSmokeAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(G)', 1, '170.314(G)(1)/(2)-11', 0, 1, 1);
-- MU 170.302(H) Incorporate clinical lab-test results into certified EHR technology as
--               structured data
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag` ) VALUES ('LabResultAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(H)', 1, '170.314(G)(1)/(2)-12', 0, 1, 1);
-- MU 170.302(J) The EP,Eligible hospital or CAH who receives a patient from another
--               setting of care or provider of care or believes an encounter is relevant
--               should perform medication reconciliation
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag` ) VALUES ('MedReconcAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(J)', 1, '170.314(G)(1)/(2)-17', 0, 1, 1);
-- MU 170.302(M) Use certified EHR technology to identify patient-specific education resources
--              and provide those resources to the patient if appropriate
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag`, `Amc2014Flag`, `AmcCode2014`, `Amc2014Stage1Flag` ) VALUES ('PatientEduAmc', 0, 0, 0, 0, '', '', 1, 1, '170.302(M)', 0, 1, '170.314(G)(1)/(2)-16', 1);
-- MU 170.304(A) Use CPOE for medication orders directly entered by any licensed healthcare
--              professional who can enter orders into the medical record per state,Local
--              and professional guidelines
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag`, `Amc2014Flag`, `AmcCode2014`, `Amc2014Stage1Flag` ) VALUES ('CpoeMedAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(A)', 0, 1, '170.314(G)(1)/(2)-7', 1);
-- MU 170.304(B) Generate and transmit permissible prescriptions electronically (ERx)
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('EPrescribeAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(B)', 0);
-- MU 170.304(C) Record demographics
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `Amc2014Flag`, `AmcCode2014`, `PatientReminderFlag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag` ) VALUES ('RecordDemAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(C)', 1, '170.314(G)(1)/(2)-9', 0, 1, 1);
-- MU 170.304(D) Send reminders to patients per patient preference for preventive/follow up care
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag`, `Amc2014Flag`, `AmcCode2014`, `Amc2014Stage1Flag` ) VALUES ('SendReminderAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(D)', 0, 1, '170.314(G)(1)/(2)-13', 1);
-- MU 170.304(F) Provide patients with an electronic copy of their health information
--               (Including diagnostic test results,Problem list,Medication lists,
--               medication allergies),Upon request
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('ProvideRecPatAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(F)', 0);
-- MU 170.304(G) Provide patients with timely electronic access to their health information
--              (Including lab results,Problem list,Medication lists,Medication allergies)
--              within four business days of the information being available to the EP
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('TimelyAccessAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(G)', 0);
-- MU 170.304(H) Provide clinical summaries for patients for each office visit
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag`, `Amc2014Flag`, `AmcCode2014`, `Amc2014Stage1Flag` ) VALUES ('ProvideSumPatAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(H)', 0, 1, '170.314(G)(1)/(2)-15', 1);
-- MU 170.304(I) The EP,Eligible hospital or CAH who transitions their patient to
--               another setting of care or provider of care or refers their patient to
--               another provider of care should provide summary of care record for
--               each transition of care or referral
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `Amc2011Flag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('SendSumAmc', 0, 0, 0, 0, '', '', 1, 1, '170.304(I)', 0);
--
-- Clinical Quality Measure (CQM) rules
--
-- NQF 0013 Hypertension: Blood Pressure Measurement
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Cqm2014Flag` ) VALUES ('RuleHtnBpMeasureCqm', 0, 0, 0, 1, 1, '0018', '', 0, '', 0, 1);
-- NQF 0028a Tobacco Use Assessment
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleTobUseAssessCqm', 0, 0, 0, 1, 1, '0028a', '', 0, '', 0);
-- NQF 0028b Tobacco Cessation Intervention
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleTobCessInterCqm', 0, 0, 0, 1, 1, '0028b', '', 0, '', 0);
-- NQF 0421 (PQRI 128) Adult Weight Screening and Follow-Up
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Cqm2014Flag` ) VALUES ('RuleAdultWtScreenFuCqm', 0, 0, 0, 1, 1, '0421', '128', 0, '', 0, 1);
-- NQF 0024 Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`,Cqm2014Flag ) VALUES ('RuleWtAssessCounsChildCqm', 0, 0, 0, 1, 1, '0024', '', 0, '', 0, 1);
-- NQF 0041 (PQRI 110) Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Cqm2014Flag` ) VALUES ('RuleInfluenzaGe50Cqm', 0, 0, 0, 1, 1, '0041', '110', 0, '', 0, 1);
-- NQF 0038 Childhood immunization Status
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleChildImmunStatCqm', 0, 0, 0, 1, 1, '0038', '', 0, '', 0);
-- NQF 0043 (PQRI 111) Pneumonia Vaccination Status for Older Adults
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Cqm2014Flag` ) VALUES ('RulePneumovaccGe65Cqm', 0, 0, 0, 1, 1, '0043', '111', 0, '', 0, 1);
-- NQF 0055 (PQRI 117) Diabetes: Eye Exam
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmEyeCqm', 0, 0, 0, 1, 1, '0055', '117', 0, '', 0);
-- NQF 0056 (PQRI 163) Diabetes: Foot Exam
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmFootCqm', 0, 0, 0, 1, 1, '0056', '163', 0, '', 0);
-- NQF 0059 (PQRI 1) Diabetes: HbA1c Poor Control
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Cqm2014Flag` ) VALUES ('RuleDmA1cCqm', 0, 0, 0, 1, 1, '0059', '1', 0, '', 0, 1);
-- NQF 0061 (PQRI 3) Diabetes: Blood Pressure Management
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmBpControlCqm', 0, 0, 0, 1, 1, '0061', '3', 0, '', 0);
-- NQF 0064 (PQRI 2) Diabetes: LDL Management & Control
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `Cqm2011Flag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmLdlCqm', 0, 0, 0, 1, 1, '0064', '2', 0, '', 0);
-- NQF 0002 Rule Children Pharyngitis
INSERT INTO `ClinicalRules` (`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`) VALUES
('RuleChildrenPharyngitisCqm', 0, 0, 0, 1, '0002', '', 0, '', 0, 0, 0, '', 1, 1);
-- NQF 0101 Rule Fall Screening
INSERT INTO `ClinicalRules` (`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`) VALUES
('RuleFallScreeningCqm', 0, 0, 0, 1, '0101', '', 0, '', 0, 0, 0, '', 1, 1);
-- NQF 0384 Rule Pain Intensity
INSERT INTO `ClinicalRules` (`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`) VALUES
('RulePainIntensityCqm', 0, 0, 0, 1, '0384', '', 0, '', 0, 0, 0, '', 1, 1);
-- NQF 0038 Rule Child Immunization Status
INSERT INTO `ClinicalRules` (`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RuleChildImmunStat2014Cqm', 0, 0, 0, 1, '0038', '', 0, '', 0, 0, 0, '', 0, 1, 0, 0);
-- NQF 0028 Rule Tobacco Use
INSERT INTO `ClinicalRules` (`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RuleTobUse2014Cqm', 0, 0, 0, 1, '0028', '', 0, '', 0, 0, 0, '', 0, 1, 0, 0);
--
-- Standard clinical rules
--
-- Hypertension: Blood Pressure Measurement
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleHtnBpMeasure', 0, 0, 1, 0, '', '', 0, '', 0);
-- Tobacco Use Assessment
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleTobUseAssess', 0, 0, 1, 0, '', '', 0, '', 0);
-- Tobacco Cessation Intervention
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleTobCessInter', 0, 0, 1, 0, '', '', 0, '', 0);
-- Adult Weight Screening and Follow-Up
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleAdultWtScreenFu', 0, 0, 1, 0, '', '', 0, '', 0);
-- Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleWtAssessCounsChild', 0, 0, 1, 0, '', '', 0, '', 0);
-- Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleInfluenzaGe50', 0, 0, 1, 0, '', '', 0, '', 0);
-- Pneumonia Vaccination Status for Older Adults
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RulePneumovaccGe65', 0, 0, 1, 0, '', '', 0, '', 0);
-- Diabetes: Hemoglobin A1C
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmHemoA1c', 0, 0, 1, 0, '', '', 0, '', 0);
-- Diabetes: Urine Microalbumin
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmUrineAlb', 0, 0, 1, 0, '', '', 0, '', 0);
-- Diabetes: Eye Exam
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmEye', 0, 0, 1, 0, '', '', 0, '', 0);
-- Diabetes: Foot Exam
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleDmFoot', 0, 0, 1, 0, '', '', 0, '', 0);
-- Cancer Screening: Mammogram
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleCsMammo', 0, 0, 1, 0, '', '', 0, '', 0);
-- Cancer Screening: Pap Smear
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleCsPap', 0, 0, 1, 0, '', '', 0, '', 0);
-- Cancer Screening: Colon Cancer Screening
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleCsColon', 0, 0, 1, 0, '', '', 0, '', 0);
-- Cancer Screening: Prostate Cancer Screening
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleCsProstate', 0, 0, 1, 0, '', '', 0, '', 0);
--
-- Rules to specifically demonstrate passing of NIST criteria
--
-- Coumadin Management - INR Monitoring
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleInrMonitor', 0, 0, 1, 0, '', '', 0, '', 0);
--
-- Rule to specifically demonstrate MU2 for CDR engine
--
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `AccessControl` ) VALUES ('RuleSocsecEntry', 0, 0, 0, 0, '', '', 0, '', 0, 'Admin:practice');
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RulePenicillinAllergy', 0, 0, 0, 0, '', '', 0, '', 0);
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleBloodPressure', 0, 0, 0, 0, '', '', 0, '', 0);
INSERT INTO `ClinicalRules` ( `Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag` ) VALUES ('RuleInrMeasure', 0, 0, 0, 0, '', '', 0, '', 0);
--
-- MU2 AMC rules
--
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('ImageResultsAmc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-20', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('FamilyHealthHistoryAmc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-21', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('ElectronicNotesAmc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-22', 0, 0, 0, 1);
INSERT INTO `ClinicalRules`
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('SecureMessagingAmc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-19', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('ViewDownloadTransmitAmc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-14', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('CpoeRadiologyAmc', 0, 0, 0, 0, '', '', 1, '170.304(A)', 0, 0, 1, '170.314(G)(1)/(2)-7', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('CpoeProcOrdersAmc', 0, 0, 0, 0, '', '', 1, '170.304(A)', 0, 0, 1, '170.314(G)(1)/(2)-7', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('SendReminderStage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(D)', 0, 0, 1, '170.314(G)(1)/(2)-13', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('CpoeMedStage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(A)', 0, 0, 1, '170.314(G)(1)/(2)-7', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('PatientEduStage2Amc', 0, 0, 0, 0, '', '', 1, '170.302(M)', 0, 0, 1, '170.314(G)(1)/(2)-16', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RecordVitals1Stage1Amc', 0, 0, 0, 0, '', '', 1, '170.302(F)', 0, 0, 1, '170.314(G)(1)/(2)-10', 0, 0, 0, 0);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RecordVitals2Stage1Amc', 0, 0, 0, 0, '', '', 1, '170.302(F)', 0, 0, 1, '170.314(G)(1)/(2)-10', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RecordVitals3Stage1Amc', 0, 0, 0, 0, '', '', 1, '170.302(F)', 0, 0, 1, '170.314(G)(1)/(2)-10', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RecordVitals4Stage1Amc', 0, 0, 0, 0, '', '', 1, '170.302(F)', 0, 0, 1, '170.314(G)(1)/(2)-10', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('RecordVitalsStage2Amc', 0, 0, 0, 0, '', '', 1, '170.302(F)', 0, 0, 1, '170.314(G)(1)/(2)-10', 0, 0, 0, 0);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('ProvideSumPatStage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(H)', 0, 0, 1, '170.314(G)(1)/(2)-15', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('VdtStage2Amc', 0, 0, 0, 0, '', '', 1, '', 0, 0, 1, '170.314(G)(1)/(2)-14', 0, 0, 1, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('SendSumStage1Amc', 0, 0, 0, 0, '', '', 1, '170.304(I)', 0, 0, 1, '170.314(G)(1)/(2)-18', 0, 0, 1, 0);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('SendSum1Stage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(I)', 0, 0, 1, '170.314(G)(1)/(2)-18', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('SendSumStage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(I)', 0, 0, 1, '170.314(G)(1)/(2)-18', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('EPrescribeStage1Amc', 0, 0, 0, 0, '', '', 1, '170.304(B)', 0, 0, 1, '170.314(G)(1)/(2)-8', 0, 0, 1, 0);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('EPrescribe1Stage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(B)', 0, 0, 1, '170.314(G)(1)/(2)-8', 0, 0, 0, 1);
INSERT INTO `ClinicalRules` 
(`Id`, `Pid`, `ActiveAlertFlag`, `PassiveAlertFlag`, `CqmFlag`, `CqmNqfCode`, `CqmPqriCode`, `AmcFlag`, `AmcCode`, `PatientReminderFlag`, `Amc2011Flag`, `Amc2014Flag`, `AmcCode2014`, `Cqm2011Flag`, `Cqm2014Flag`, `Amc2014Stage1Flag`, `Amc2014Stage2Flag`) VALUES
('EPrescribe2Stage2Amc', 0, 0, 0, 0, '', '', 1, '170.304(B)', 0, 0, 1, '170.314(G)(1)/(2)-8', 0, 0, 0, 1);


-- --------------------------------------------------------

--
-- Table structure for table `ClinicalRulesLog
--

DROP TABLE IF EXISTS `ClinicalRulesLog`;
CREATE TABLE `ClinicalRulesLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Pid` bigint(20) NOT NULL DEFAULT '0',
  `Uid` bigint(20) NOT NULL DEFAULT '0',
  `Category` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'An example category is clinicalReminderWidget',
  `Value` TEXT,
  `NewValue` TEXT,
  PRIMARY KEY (`Id`),
  KEY `Pid` (`Pid`),
  KEY `Uid` (`Uid`),
  KEY `Category` (`Category`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Table structure for table `Codes`
-- 

DROP TABLE IF EXISTS `Codes`;
CREATE TABLE `Codes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CodeText` varchar(255) NOT NULL default '',
  `CodeTextShort` varchar(24) NOT NULL default '',
  `Code` varchar(25) NOT NULL default '',
  `CodeType` smallint(6) default NULL,
  `Modifier` varchar(12) NOT NULL default '',
  `Units` int(11) default NULL,
  `Fee` decimal(12,2) default NULL,
  `Superbill` varchar(31) NOT NULL default '',
  `RelatedCode` varchar(255) NOT NULL default '',
  `Taxrates` varchar(255) NOT NULL default '',
  `CypFactor` float NOT NULL DEFAULT 0 COMMENT 'Quantity representing a years supply',
  `Active` TINYINT(1) DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `Reportable` TINYINT(1) DEFAULT 0 COMMENT '0 = non-reportable, 1 = reportable',
  `FinancialReporting` TINYINT(1) DEFAULT 0 COMMENT '0 = negative, 1 = considered important code in financial reporting',
  PRIMARY KEY  (`Id`),
  KEY `Code` (`Code`),
  KEY `CodeType` (`CodeType`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Suspension','C60928',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Tablet','C42998',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Capsule','C25158',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Solution','C42986',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Tsp','C48544',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Ml','C28254',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Units','C44278',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Inhalations','C42944',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Gtts(Drops)','C48491',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Cream','C28944',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Ointment','C42966',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Per Oris','C38288',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Inhale','C38216',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Intramuscular','C28161',112);
INSERT INTO `Codes` (`CodeText`,`Code`,`CodeType`) VALUES ('Mg','C28253',112);

-- --------------------------------------------------------

-- 
-- Table structure for table `SyndromicSurveillance`
-- 

DROP TABLE IF EXISTS `SyndromicSurveillance`;
CREATE TABLE `SyndromicSurveillance` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ListsId` bigint(20) NOT NULL,
  `SubmissionDate` datetime NOT NULL,
  `Filename` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Id`),
  KEY (`ListsId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Config`
-- 

DROP TABLE IF EXISTS `Config`;
CREATE TABLE `Config` (
  `Id` int(11) NOT NULL default '0',
  `Name` varchar(255) default NULL,
  `Value` varchar(255) default NULL,
  `Parent` int(11) NOT NULL default '0',
  `Lft` int(11) NOT NULL default '0',
  `Rght` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Id`),
  KEY `Parent` (`Parent`),
  KEY `Lft` (`Lft`,`Rght`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `ConfigSeq`
-- 

DROP TABLE IF EXISTS `ConfigSeq`;
CREATE TABLE `ConfigSeq` (
  `Id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `ConfigSeq`
-- 

INSERT INTO `ConfigSeq` VALUES (0);

-- --------------------------------------------------------

--
-- Table structure for table `DatedReminders`
--

DROP TABLE IF EXISTS `DatedReminders`;
CREATE TABLE `DatedReminders` (
  `DrId` int(11) NOT NULL AUTO_INCREMENT,
  `DrFromID` int(11) NOT NULL,
  `DrMessageText` varchar(160) NOT NULL,
  `DrMessageSentDate` datetime NOT NULL,
  `DrMessageDueDate` date NOT NULL,
  `Pid` int(11) NOT NULL,
  `MessagePriority` tinyint(1) NOT NULL,
  `MessageProcessed` tinyint(1) NOT NULL DEFAULT '0',
  `ProcessedDate` timestamp NULL DEFAULT NULL,
  `DrProcessedBy` int(11) NOT NULL,
  PRIMARY KEY (`DrId`),
  KEY `DrFromID` (`DrFromID`,`DrMessageDueDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `DatedRemindersLink`
--

DROP TABLE IF EXISTS `DatedRemindersLink`;
CREATE TABLE `DatedRemindersLink` (           
  `DrLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `DrId` int(11) NOT NULL,
  `ToId` int(11) NOT NULL,
  PRIMARY KEY (`DrLinkId`),
  KEY `ToId` (`ToId`),
  KEY `DrId` (`DrId`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

-- 
-- Table structure for table `DirectMessageLog`
-- 

DROP TABLE IF EXISTS `DirectMessageLog`;
CREATE TABLE `DirectMessageLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MsgType` char(1) NOT NULL COMMENT 'S=sent,R=received',
  `MsgId` varchar(127) NOT NULL,
  `Sender` varchar(255) NOT NULL,
  `Recipient` varchar(255) NOT NULL,
  `CreateTs` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Status` char(1) NOT NULL COMMENT 'Q=queued,D=dispatched,R=received,F=failed',
  `StatusInfo` varchar(511) default NULL,
  `StatusTs` timestamp NULL default NULL,
  `PatientId` bigint(20) default NULL,
  `UserId` bigint(20) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `MsgId` (`MsgId`),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Documents`
-- 

DROP TABLE IF EXISTS `Documents`;
CREATE TABLE `Documents` (
  `Id` int(11) NOT NULL default '0',
  `Type` enum('FileUrl','Blob','WebUrl') default NULL,
  `Size` int(11) default NULL,
  `Date` datetime default NULL,
  `Url` varchar(255) default NULL,
  `Mimetype` varchar(255) default NULL,
  `Pages` int(11) default NULL,
  `Owner` int(11) default NULL,
  `Revision` timestamp NOT NULL,
  `ForeignId` int(11) default NULL,
  `Docdate` date default NULL,
  `Hash` varchar(40) DEFAULT NULL COMMENT '40-character SHA-1 hash of document',
  `ListId` bigint(20) NOT NULL default '0',
  `CouchDocid` VARCHAR(100) DEFAULT NULL,
  `CouchRevid` VARCHAR(100) DEFAULT NULL,
  `Storagemethod` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0->Harddisk,1->CouchDB',
  `PathDepth` TINYINT DEFAULT '1' COMMENT 'Depth of path to use in url to find document. Not applicable for CouchDB.',
  `Imported` TINYINT DEFAULT 0 NULL COMMENT 'Parsing status for CCR/CCD/CCDA importing',
  `EncounterId` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Encounter id if tagged',
  `EncounterCheck`	TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'If encounter is created while tagging',
  `AuditMasterApprovalStatus` TINYINT NOT NULL DEFAULT 1 COMMENT 'ApprovalStatus from auditMaster table',
  `AuditMasterId` int(11) default NULL,
  `DocumentationOf` varchar(255) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `Revision` (`Revision`),
  KEY `ForeignId` (`ForeignId`),
  KEY `Owner` (`Owner`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `DocumentsLegalDetail`
--

DROP TABLE IF EXISTS `DocumentsLegalDetail`;
CREATE TABLE `DocumentsLegalDetail` (
  `DldId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DldPid` int(10) unsigned DEFAULT NULL,
  `DldFacility` int(10) unsigned DEFAULT NULL,
  `DldProvider` int(10) unsigned DEFAULT NULL,
  `DldEncounter` int(10) unsigned DEFAULT NULL,
  `DldMasterDocid` int(10) unsigned NOT NULL,
  `DldSigned` smallint(5) unsigned NOT NULL COMMENT '0-Not Signed or Cannot Sign(Layout),1-Signed,2-Ready to sign,3-Denied(Pat Regi),4-Patient Upload,10-Save(Layout)',
  `DldSignedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DldFilepath` varchar(75) DEFAULT NULL,
  `DldFilename` varchar(45) NOT NULL,
  `DldSigningPerson` varchar(50) NOT NULL,
  `DldSignLevel` int(11) NOT NULL COMMENT 'Sign flow level',
  `DldContent` varchar(50) NOT NULL COMMENT 'Layout sign position',
  `DldFileForPdfGeneration` blob NOT NULL COMMENT 'The filled details in the fdf file is stored here.Patient Registration Screen',
  `DldDenialReason` longtext,
  `DldMoved` tinyint(4) NOT NULL DEFAULT '0',
  `DldPatientComments` text COMMENT 'Patient comments stored here',
  PRIMARY KEY (`DldId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `DocumentsLegalMaster`
--

DROP TABLE IF EXISTS `DocumentsLegalMaster`;
CREATE TABLE `DocumentsLegalMaster` (
  `DlmCategory` int(10) unsigned DEFAULT NULL,
  `DlmSubcategory` int(10) unsigned DEFAULT NULL,
  `DlmDocumentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DlmDocumentName` varchar(75) NOT NULL,
  `DlmFilepath` varchar(75) NOT NULL,
  `DlmFacility` int(10) unsigned DEFAULT NULL,
  `DlmProvider` int(10) unsigned DEFAULT NULL,
  `DlmSignHeight` double NOT NULL,
  `DlmSignWidth` double NOT NULL,
  `DlmFilename` varchar(45) NOT NULL,
  `DlmEffectiveDate` datetime NOT NULL,
  `DlmVersion` int(10) unsigned NOT NULL,
  `Content` varchar(255) NOT NULL,
  `DlmSavedsign` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
  `DlmReview` varchar(255) DEFAULT NULL COMMENT '0-Yes 1-No',
  `DlmUploadType` tinyint(4) DEFAULT '0' COMMENT '0-Provider Uploaded,1-Patient Uploaded',
  PRIMARY KEY (`DlmDocumentId`)
) ENGINE=InnoDB COMMENT='List of Master Docs to be signed' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `DocumentsLegalCategories`
--

DROP TABLE IF EXISTS `DocumentsLegalCategories`;
CREATE TABLE `DocumentsLegalCategories` (
  `DlcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DlcCategoryType` int(10) unsigned NOT NULL COMMENT '1 category 2 subcategory',
  `DlcCategoryName` varchar(45) NOT NULL,
  `DlcCategoryParent` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`DlcId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;

--
-- Dumping data for table `DocumentsLegalCategories`
--

INSERT INTO `DocumentsLegalCategories` (`DlcId`, `DlcCategoryType`, `DlcCategoryName`, `DlcCategoryParent`) VALUES
(3, 1, 'Category',NULL),
(4, 2, 'Sub Category', 1),
(5, 1, 'Layout Form', 0),
(6, 2, 'Layout Signed', 5);

-- 
-- Table structure for table `DrugInventory`
-- 

DROP TABLE IF EXISTS `DrugInventory`;
CREATE TABLE `DrugInventory` (
  `InventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `DrugId` int(11) NOT NULL,
  `LotNumber` varchar(20) default NULL,
  `Expiration` date default NULL,
  `Manufacturer` varchar(255) default NULL,
  `OnHand` int(11) NOT NULL default '0',
  `WarehouseId` varchar(31) NOT NULL DEFAULT '',
  `VendorId` bigint(20) NOT NULL DEFAULT 0,
  `LastNotify` date NOT NULL default '0000-00-00',
  `DestroyDate` date default NULL,
  `DestroyMethod` varchar(255) default NULL,
  `DestroyWitness` varchar(255) default NULL,
  `DestroyNotes` varchar(255) default NULL,
  PRIMARY KEY  (`InventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `DrugSales`
-- 

DROP TABLE IF EXISTS `DrugSales`;
CREATE TABLE `DrugSales` (
  `SaleId` int(11) NOT NULL AUTO_INCREMENT,
  `DrugId` int(11) NOT NULL,
  `InventoryId` int(11) NOT NULL,
  `PrescriptionId` int(11) NOT NULL default '0',
  `Pid` int(11) NOT NULL default '0',
  `Encounter` int(11) NOT NULL default '0',
  `User` varchar(255) default NULL,
  `SaleDate` date NOT NULL,
  `Quantity` int(11) NOT NULL default '0',
  `Fee` decimal(12,2) NOT NULL default '0.00',
  `Billed` tinyint(1) NOT NULL default '0' COMMENT 'Indicates if the sale is posted to accounting',
  `XferInventoryId` int(11) NOT NULL DEFAULT 0,
  `DistributorId` bigint(20) NOT NULL DEFAULT 0 COMMENT 'References users.id',
  `Notes` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`SaleId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `DrugTemplates`
-- 

DROP TABLE IF EXISTS `DrugTemplates`;
CREATE TABLE `DrugTemplates` (
  `DrugId` int(11) NOT NULL,
  `Selector` varchar(255) NOT NULL default '',
  `Dosage` varchar(10) default NULL,
  `Period` int(11) NOT NULL default '0',
  `Quantity` int(11) NOT NULL default '0',
  `Refills` int(11) NOT NULL default '0',
  `Taxrates` varchar(255) default NULL,
  PRIMARY KEY  (`DrugId`,`Selector`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Drugs`
-- 

DROP TABLE IF EXISTS `Drugs`;
CREATE TABLE `Drugs` (
  `DrugId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `NdcNumber` varchar(20) NOT NULL DEFAULT '',
  `OnOrder` int(11) NOT NULL default '0',
  `ReorderPoint` float NOT NULL DEFAULT 0.0,
  `MaxLevel` float NOT NULL DEFAULT 0.0,
  `LastNotify` date NOT NULL default '0000-00-00',
  `Reactions` text,
  `Form` int(3) NOT NULL default '0',
  `Size` float unsigned NOT NULL default '0',
  `Unit` int(11) NOT NULL default '0',
  `Route` int(11) NOT NULL default '0',
  `Substitute` int(11) NOT NULL default '0',
  `RelatedCode` varchar(255) NOT NULL DEFAULT '' COMMENT 'May reference a related codes.code',
  `CypFactor` float NOT NULL DEFAULT 0 COMMENT 'Quantity representing a years supply',
  `Active` TINYINT(1) DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `AllowCombining` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = allow filling an order from multiple lots',
  `AllowMultiple`  tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = allow multiple lots at one warehouse',
  `DrugCode` varchar(25) NULL,
  PRIMARY KEY  (`DrugId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `EligibilityResponse`
--

DROP TABLE IF EXISTS `EligibilityResponse`;
CREATE TABLE `EligibilityResponse` (
  `ResponseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ResponseDescription` varchar(255) default NULL,
  `ResponseStatus` enum('A','D') NOT NULL default 'A',
  `ResponseVendorId` bigint(20) default NULL,
  `ResponseCreateDate` date default NULL,
  `ResponseModifyDate` date default NULL,
  PRIMARY KEY  (`ResponseId`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `EligibilityVerification`
--

DROP TABLE IF EXISTS `EligibilityVerification`;
CREATE TABLE `EligibilityVerification` (
  `VerificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ResponseId` bigint(20) default NULL,
  `InsuranceId` bigint(20) default NULL,
  `EligibilityCheckDate` datetime default NULL,
  `Copay` int(11) default NULL,
  `Deductible` int(11) default NULL,
  `Deductiblemet` enum('Y','N') default 'Y',
  `CreateDate` date default NULL,
  PRIMARY KEY  (`VerificationId`),
  KEY `InsuranceId` (`InsuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

-- 
-- Table structure for table `EmployerData`
-- 

DROP TABLE IF EXISTS `EmployerData`;
CREATE TABLE `EmployerData` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) default NULL,
  `Street` varchar(255) default NULL,
  `PostalCode` varchar(255) default NULL,
  `City` varchar(255) default NULL,
  `State` varchar(255) default NULL,
  `Country` varchar(255) default NULL,
  `Date` datetime default NULL,
  `Pid` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `EncCategoryMap`
--
-- Mapping of rule encounter categories to category ids from the event category in openemrPostcalendarCategories
--

DROP TABLE IF EXISTS `EncCategoryMap`;
CREATE TABLE `EncCategoryMap` (
  `RuleEncId` varchar(31) NOT NULL DEFAULT '' COMMENT 'Encounter id from ruleEncTypes list in listOptions',
  `MainCatId` int(11) NOT NULL DEFAULT 0 COMMENT 'Category id from event category in openemrPostcalendarCategories',
  KEY  (`RuleEncId`,`MainCatId`)
) ENGINE=InnoDB ;

INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutpatient', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutpatient', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutpatient', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursFac', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursFac', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursFac', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOffVis', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOffVis', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOffVis', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncHeaAndBeh', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncHeaAndBeh', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncHeaAndBeh', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncHeaAndBeh', 12);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOccTher', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOccTher', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOccTher', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPsychAndPsych', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPsychAndPsych', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPsychAndPsych', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer18Older', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer18Older', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer18Older', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer18Older', 13);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer40Older', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer40Older', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer40Older', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedSer40Older', 13);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreIndCounsel', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreIndCounsel', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreIndCounsel', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreIndCounsel', 13);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedGroupCounsel', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedGroupCounsel', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedGroupCounsel', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedGroupCounsel', 13);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedOtherServ', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedOtherServ', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedOtherServ', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPreMedOtherServ', 13);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutPcpObgyn', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutPcpObgyn', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncOutPcpObgyn', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPregnancy', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPregnancy', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncPregnancy', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursDischarge', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursDischarge', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNursDischarge', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncAcuteInpOrEd', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncAcuteInpOrEd', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncAcuteInpOrEd', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNonacInpOutOrOpth', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNonacInpOutOrOpth', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncNonacInpOutOrOpth', 10);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncInfluenza', 5);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncInfluenza', 9);
INSERT INTO `EncCategoryMap` ( `RuleEncId`, `MainCatId` ) VALUES ('EncInfluenza', 10);


-- --------------------------------------------------------

--
-- Table structure for table `ErxTtlTouch`
--
-- Store records last update per patient data process
--

DROP TABLE IF EXISTS `ErxTtlTouch`;
CREATE  TABLE `ErxTtlTouch` (
  `PatientId` BIGINT(20) UNSIGNED NOT NULL COMMENT 'Patient record Id' ,
  `Process` ENUM('Allergies','Medications') NOT NULL COMMENT 'NewCrop eRx SOAP process' ,
  `Updated` DATETIME NOT NULL COMMENT 'Date and time of last process update for patient' ,
  PRIMARY KEY (`PatientId`, `Process`)
) ENGINE = InnoDB COMMENT = 'Store records last update per patient data process' ;

-- --------------------------------------------------------

--
-- Table structure for table `StandardizedTablesTrack`
--

DROP TABLE IF EXISTS `StandardizedTablesTrack`;
CREATE TABLE `StandardizedTablesTrack` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ImportedDate` datetime default NULL,
  `Name` varchar(255) NOT NULL default '' COMMENT 'Name of standardized tables such as RXNORM',
  `RevisionVersion` varchar(255) NOT NULL default '' COMMENT 'Revision of standardized tables that were imported',
  `RevisionDate` datetime default NULL COMMENT 'Revision of standardized tables that were imported',
  `FileChecksum` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Facility`
-- 

DROP TABLE IF EXISTS `Facility`;
CREATE TABLE `Facility` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) default NULL,
  `Phone` varchar(30) default NULL,
  `Fax` varchar(30) default NULL,
  `Street` varchar(255) default NULL,
  `City` varchar(255) default NULL,
  `State` varchar(50) default NULL,
  `PostalCode` varchar(11) default NULL,
  `CountryCode` varchar(10) default NULL,
  `FederalEin` varchar(15) default NULL,
  `Website` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  `ServiceLocation` tinyint(1) NOT NULL default '1',
  `BillingLocation` tinyint(1) NOT NULL default '0',
  `AcceptsAssignment` tinyint(1) NOT NULL default '0',
  `PosCode` tinyint(4) default NULL,
  `X12SenderId` varchar(25) default NULL,
  `Attn` varchar(65) default NULL,
  `DomainIdentifier` varchar(60) default NULL,
  `FacilityNpi` varchar(15) default NULL,
  `TaxIdType` VARCHAR(31) NOT NULL DEFAULT '',
  `Color` VARCHAR(7) NOT NULL DEFAULT '',
  `PrimaryBusinessEntity` INT(10) NOT NULL DEFAULT '0' COMMENT '0-Not Set as business entity 1-Set as business entity',
  `FacilityCode` VARCHAR(31) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `Facility`
-- 

INSERT INTO `Facility` VALUES (3, 'Your Clinic Name Here', '000-000-0000', '000-000-0000', '', '', '', '', '', '',NULL,NULL, 1, 1, 0,NULL, '', '', '', '', '','#99FFFF','0', '');


-- --------------------------------------------------------

-- 
-- Table structure for table `FacilityUserIds`
-- 

DROP TABLE IF EXISTS `FacilityUserIds`;
CREATE TABLE  `FacilityUserIds` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Uid` bigint(20) DEFAULT NULL,
  `FacilityId` bigint(20) DEFAULT NULL,
  `FieldId`    varchar(31)  NOT NULL COMMENT 'References layoutOptions.fieldId',
  `FieldValue` TEXT,
  PRIMARY KEY (`Id`),
  KEY `Uid` (`Uid`,`FacilityId`,`FieldId`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FeeSheetOptions`
-- 

DROP TABLE IF EXISTS `FeeSheetOptions`;
CREATE TABLE `FeeSheetOptions` (
  `FsCategory` varchar(63) default NULL,
  `FsOption` varchar(63) default NULL,
  `FsCodes` varchar(255) default NULL
) ENGINE=InnoDB;

-- 
-- Dumping data for table `FeeSheetOptions`
-- 

INSERT INTO `FeeSheetOptions` VALUES ('1New Patient', '1Brief', 'CPT4|99201|');
INSERT INTO `FeeSheetOptions` VALUES ('1New Patient', '2Limited', 'CPT4|99202|');
INSERT INTO `FeeSheetOptions` VALUES ('1New Patient', '3Detailed', 'CPT4|99203|');
INSERT INTO `FeeSheetOptions` VALUES ('1New Patient', '4Extended', 'CPT4|99204|');
INSERT INTO `FeeSheetOptions` VALUES ('1New Patient', '5Comprehensive', 'CPT4|99205|');
INSERT INTO `FeeSheetOptions` VALUES ('2Established Patient', '1Brief', 'CPT4|99211|');
INSERT INTO `FeeSheetOptions` VALUES ('2Established Patient', '2Limited', 'CPT4|99212|');
INSERT INTO `FeeSheetOptions` VALUES ('2Established Patient', '3Detailed', 'CPT4|99213|');
INSERT INTO `FeeSheetOptions` VALUES ('2Established Patient', '4Extended', 'CPT4|99214|');
INSERT INTO `FeeSheetOptions` VALUES ('2Established Patient', '5Comprehensive', 'CPT4|99215|');

-- --------------------------------------------------------

-- 
-- Table structure for table `FormDictation`
-- 

DROP TABLE IF EXISTS `FormDictation`;
CREATE TABLE `FormDictation` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default NULL,
  `Activity` tinyint(4) default NULL,
  `Dictation` longtext,
  `AdditionalNotes` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormEncounter`
-- 

DROP TABLE IF EXISTS `FormEncounter`;
CREATE TABLE `FormEncounter` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Reason` longtext,
  `Facility` longtext,
  `FacilityId` int(11) NOT NULL default '0',
  `Pid` bigint(20) default NULL,
  `Encounter` bigint(20) default NULL,
  `OnsetDate` datetime default NULL,
  `Sensitivity` varchar(30) default NULL,
  `BillingNote` text,
  `PcCatid` int(11) NOT NULL default '5' COMMENT 'Event category from openemrPostcalendarCategories',
  `LastLevelBilled` int  NOT NULL DEFAULT 0 COMMENT '0=none, 1=ins1, 2=ins2,Etc',
  `LastLevelClosed` int  NOT NULL DEFAULT 0 COMMENT '0=none, 1=ins1, 2=ins2,Etc',
  `LastStmtDate`    date DEFAULT NULL,
  `StmtCount`        int  NOT NULL DEFAULT 0,
  `ProviderId` INT(11) DEFAULT '0' COMMENT 'Default and main provider for this visit',
  `SupervisorId` INT(11) DEFAULT '0' COMMENT 'Supervising provider,If any,For this visit',
  `InvoiceRefno` varchar(31) NOT NULL DEFAULT '',
  `ReferralSource` varchar(31) NOT NULL DEFAULT '',
  `BillingFacility` INT(11) NOT NULL DEFAULT 0,
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `PidEncounter` (`Pid`, `Encounter`),
  KEY `EncounterDate` (`Date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormMiscBillingOptions`
-- 

DROP TABLE IF EXISTS `FormMiscBillingOptions`;
CREATE TABLE `FormMiscBillingOptions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default NULL,
  `Activity` tinyint(4) default NULL,
  `EmploymentRelated` tinyint(1) default NULL,
  `AutoAccident` tinyint(1) default NULL,
  `AccidentState` varchar(2) default NULL,
  `OtherAccident` tinyint(1) default NULL,
  `OutsideLab` tinyint(1) default NULL,
  `LabAmount` decimal(5,2) default NULL,
  `IsUnableToWork` tinyint(1) default NULL,
  `DateInitialTreatment` date default NULL,
  `OffWorkFrom` date default NULL,
  `OffWorkTo` date default NULL,
  `IsHospitalized` tinyint(1) default NULL,
  `HospitalizationDateFrom` date default NULL,
  `HospitalizationDateTo` date default NULL,
  `MedicaidResubmissionCode` varchar(10) default NULL,
  `MedicaidOriginalReference` varchar(15) default NULL,
  `PriorAuthNumber` varchar(20) default NULL,
  `Comments` varchar(255) default NULL,
  `ReplacementClaim` tinyint(1) default 0,
  `Box14DateQual` char(3) default NULL,
  `Box15DateQual` char(3) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormReviewofs`
-- 

DROP TABLE IF EXISTS `FormReviewofs`;
CREATE TABLE `FormReviewofs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default NULL,
  `Activity` tinyint(4) default NULL,
  `Fever` varchar(5) default NULL,
  `Chills` varchar(5) default NULL,
  `NightSweats` varchar(5) default NULL,
  `WeightLoss` varchar(5) default NULL,
  `PoorAppetite` varchar(5) default NULL,
  `Insomnia` varchar(5) default NULL,
  `Fatigued` varchar(5) default NULL,
  `Depressed` varchar(5) default NULL,
  `Hyperactive` varchar(5) default NULL,
  `ExposureToForeignCountries` varchar(5) default NULL,
  `Cataracts` varchar(5) default NULL,
  `CataractSurgery` varchar(5) default NULL,
  `Glaucoma` varchar(5) default NULL,
  `DoubleVision` varchar(5) default NULL,
  `BlurredVision` varchar(5) default NULL,
  `PoorHearing` varchar(5) default NULL,
  `Headaches` varchar(5) default NULL,
  `RingingInEars` varchar(5) default NULL,
  `BloodyNose` varchar(5) default NULL,
  `Sinusitis` varchar(5) default NULL,
  `SinusSurgery` varchar(5) default NULL,
  `DryMouth` varchar(5) default NULL,
  `StrepThroat` varchar(5) default NULL,
  `Tonsillectomy` varchar(5) default NULL,
  `SwollenLymphNodes` varchar(5) default NULL,
  `ThroatCancer` varchar(5) default NULL,
  `ThroatCancerSurgery` varchar(5) default NULL,
  `HeartAttack` varchar(5) default NULL,
  `IrregularHeartBeat` varchar(5) default NULL,
  `ChestPains` varchar(5) default NULL,
  `ShortnessOfBreath` varchar(5) default NULL,
  `HighBloodPressure` varchar(5) default NULL,
  `HeartFailure` varchar(5) default NULL,
  `PoorCirculation` varchar(5) default NULL,
  `VascularSurgery` varchar(5) default NULL,
  `CardiacCatheterization` varchar(5) default NULL,
  `CoronaryArteryBypass` varchar(5) default NULL,
  `HeartTransplant` varchar(5) default NULL,
  `StressTest` varchar(5) default NULL,
  `Emphysema` varchar(5) default NULL,
  `ChronicBronchitis` varchar(5) default NULL,
  `InterstitialLungDisease` varchar(5) default NULL,
  `ShortnessOfBreath2` varchar(5) default NULL,
  `LungCancer` varchar(5) default NULL,
  `LungCancerSurgery` varchar(5) default NULL,
  `Pheumothorax` varchar(5) default NULL,
  `StomachPains` varchar(5) default NULL,
  `PepticUlcerDisease` varchar(5) default NULL,
  `Gastritis` varchar(5) default NULL,
  `Endoscopy` varchar(5) default NULL,
  `Polyps` varchar(5) default NULL,
  `Colonoscopy` varchar(5) default NULL,
  `ColonCancer` varchar(5) default NULL,
  `ColonCancerSurgery` varchar(5) default NULL,
  `UlcerativeColitis` varchar(5) default NULL,
  `CrohnsDisease` varchar(5) default NULL,
  `Appendectomy` varchar(5) default NULL,
  `Divirticulitis` varchar(5) default NULL,
  `DivirticulitisSurgery` varchar(5) default NULL,
  `GallStones` varchar(5) default NULL,
  `Cholecystectomy` varchar(5) default NULL,
  `Hepatitis` varchar(5) default NULL,
  `CirrhosisOfTheLiver` varchar(5) default NULL,
  `Splenectomy` varchar(5) default NULL,
  `KidneyFailure` varchar(5) default NULL,
  `KidneyStones` varchar(5) default NULL,
  `KidneyCancer` varchar(5) default NULL,
  `KidneyInfections` varchar(5) default NULL,
  `BladderInfections` varchar(5) default NULL,
  `BladderCancer` varchar(5) default NULL,
  `ProstateProblems` varchar(5) default NULL,
  `ProstateCancer` varchar(5) default NULL,
  `KidneyTransplant` varchar(5) default NULL,
  `SexuallyTransmittedDisease` varchar(5) default NULL,
  `BurningWithUrination` varchar(5) default NULL,
  `DischargeFromUrethra` varchar(5) default NULL,
  `Rashes` varchar(5) default NULL,
  `Infections` varchar(5) default NULL,
  `Ulcerations` varchar(5) default NULL,
  `Pemphigus` varchar(5) default NULL,
  `Herpes` varchar(5) default NULL,
  `Osetoarthritis` varchar(5) default NULL,
  `RheumotoidArthritis` varchar(5) default NULL,
  `Lupus` varchar(5) default NULL,
  `AnkylosingSondlilitis` varchar(5) default NULL,
  `SwollenJoints` varchar(5) default NULL,
  `StiffJoints` varchar(5) default NULL,
  `BrokenBones` varchar(5) default NULL,
  `NeckProblems` varchar(5) default NULL,
  `BackProblems` varchar(5) default NULL,
  `BackSurgery` varchar(5) default NULL,
  `Scoliosis` varchar(5) default NULL,
  `HerniatedDisc` varchar(5) default NULL,
  `ShoulderProblems` varchar(5) default NULL,
  `ElbowProblems` varchar(5) default NULL,
  `WristProblems` varchar(5) default NULL,
  `HandProblems` varchar(5) default NULL,
  `HipProblems` varchar(5) default NULL,
  `KneeProblems` varchar(5) default NULL,
  `AnkleProblems` varchar(5) default NULL,
  `FootProblems` varchar(5) default NULL,
  `InsulinDependentDiabetes` varchar(5) default NULL,
  `NoninsulinDependentDiabetes` varchar(5) default NULL,
  `Hypothyroidism` varchar(5) default NULL,
  `Hyperthyroidism` varchar(5) default NULL,
  `CushingSyndrom` varchar(5) default NULL,
  `AddisonSyndrom` varchar(5) default NULL,
  `AdditionalNotes` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormRos`
-- 

DROP TABLE IF EXISTS `FormRos`;
CREATE TABLE `FormRos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pid` int(11) NOT NULL,
  `Activity` int(11) NOT NULL default '1',
  `Date` datetime default NULL,
  `WeightChange` varchar(3) default NULL,
  `Weakness` varchar(3) default NULL,
  `Fatigue` varchar(3) default NULL,
  `Anorexia` varchar(3) default NULL,
  `Fever` varchar(3) default NULL,
  `Chills` varchar(3) default NULL,
  `NightSweats` varchar(3) default NULL,
  `Insomnia` varchar(3) default NULL,
  `Irritability` varchar(3) default NULL,
  `HeatOrCold` varchar(3) default NULL,
  `Intolerance` varchar(3) default NULL,
  `ChangeInVision` varchar(3) default NULL,
  `GlaucomaHistory` varchar(3) default NULL,
  `EyePain` varchar(3) default NULL,
  `Irritation` varchar(3) default NULL,
  `Redness` varchar(3) default NULL,
  `ExcessiveTearing` varchar(3) default NULL,
  `DoubleVision` varchar(3) default NULL,
  `BlindSpots` varchar(3) default NULL,
  `Photophobia` varchar(3) default NULL,
  `HearingLoss` varchar(3) default NULL,
  `Discharge` varchar(3) default NULL,
  `Pain` varchar(3) default NULL,
  `Vertigo` varchar(3) default NULL,
  `Tinnitus` varchar(3) default NULL,
  `FrequentColds` varchar(3) default NULL,
  `SoreThroat` varchar(3) default NULL,
  `SinusProblems` varchar(3) default NULL,
  `PostNasalDrip` varchar(3) default NULL,
  `Nosebleed` varchar(3) default NULL,
  `Snoring` varchar(3) default NULL,
  `Apnea` varchar(3) default NULL,
  `BreastMass` varchar(3) default NULL,
  `BreastDischarge` varchar(3) default NULL,
  `Biopsy` varchar(3) default NULL,
  `AbnormalMammogram` varchar(3) default NULL,
  `Cough` varchar(3) default NULL,
  `Sputum` varchar(3) default NULL,
  `ShortnessOfBreath` varchar(3) default NULL,
  `Wheezing` varchar(3) default NULL,
  `Hemoptsyis` varchar(3) default NULL,
  `Asthma` varchar(3) default NULL,
  `Copd` varchar(3) default NULL,
  `ChestPain` varchar(3) default NULL,
  `Palpitation` varchar(3) default NULL,
  `Syncope` varchar(3) default NULL,
  `Pnd` varchar(3) default NULL,
  `Doe` varchar(3) default NULL,
  `Orthopnea` varchar(3) default NULL,
  `Peripheal` varchar(3) default NULL,
  `Edema` varchar(3) default NULL,
  `LegpainCramping` varchar(3) default NULL,
  `HistoryMurmur` varchar(3) default NULL,
  `Arrythmia` varchar(3) default NULL,
  `HeartProblem` varchar(3) default NULL,
  `Dysphagia` varchar(3) default NULL,
  `Heartburn` varchar(3) default NULL,
  `Bloating` varchar(3) default NULL,
  `Belching` varchar(3) default NULL,
  `Flatulence` varchar(3) default NULL,
  `Nausea` varchar(3) default NULL,
  `Vomiting` varchar(3) default NULL,
  `Hematemesis` varchar(3) default NULL,
  `GastroPain` varchar(3) default NULL,
  `FoodIntolerance` varchar(3) default NULL,
  `Hepatitis` varchar(3) default NULL,
  `Jaundice` varchar(3) default NULL,
  `Hematochezia` varchar(3) default NULL,
  `ChangedBowel` varchar(3) default NULL,
  `Diarrhea` varchar(3) default NULL,
  `Constipation` varchar(3) default NULL,
  `Polyuria` varchar(3) default NULL,
  `Polydypsia` varchar(3) default NULL,
  `Dysuria` varchar(3) default NULL,
  `Hematuria` varchar(3) default NULL,
  `Frequency` varchar(3) default NULL,
  `Urgency` varchar(3) default NULL,
  `Incontinence` varchar(3) default NULL,
  `RenalStones` varchar(3) default NULL,
  `Utis` varchar(3) default NULL,
  `Hesitancy` varchar(3) default NULL,
  `Dribbling` varchar(3) default NULL,
  `Stream` varchar(3) default NULL,
  `Nocturia` varchar(3) default NULL,
  `Erections` varchar(3) default NULL,
  `Ejaculations` varchar(3) default NULL,
  `G` varchar(3) default NULL,
  `P` varchar(3) default NULL,
  `Ap` varchar(3) default NULL,
  `Lc` varchar(3) default NULL,
  `Mearche` varchar(3) default NULL,
  `Menopause` varchar(3) default NULL,
  `Lmp` varchar(3) default NULL,
  `FFrequency` varchar(3) default NULL,
  `FFlow` varchar(3) default NULL,
  `FSymptoms` varchar(3) default NULL,
  `AbnormalHairGrowth` varchar(3) default NULL,
  `FHirsutism` varchar(3) default NULL,
  `JointPain` varchar(3) default NULL,
  `Swelling` varchar(3) default NULL,
  `MRedness` varchar(3) default NULL,
  `MWarm` varchar(3) default NULL,
  `MStiffness` varchar(3) default NULL,
  `Muscle` varchar(3) default NULL,
  `MAches` varchar(3) default NULL,
  `Fms` varchar(3) default NULL,
  `Arthritis` varchar(3) default NULL,
  `Loc` varchar(3) default NULL,
  `Seizures` varchar(3) default NULL,
  `Stroke` varchar(3) default NULL,
  `Tia` varchar(3) default NULL,
  `NNumbness` varchar(3) default NULL,
  `NWeakness` varchar(3) default NULL,
  `Paralysis` varchar(3) default NULL,
  `IntellectualDecline` varchar(3) default NULL,
  `MemoryProblems` varchar(3) default NULL,
  `Dementia` varchar(3) default NULL,
  `NHeadache` varchar(3) default NULL,
  `SCancer` varchar(3) default NULL,
  `Psoriasis` varchar(3) default NULL,
  `SAcne` varchar(3) default NULL,
  `SOther` varchar(3) default NULL,
  `SDisease` varchar(3) default NULL,
  `PDiagnosis` varchar(3) default NULL,
  `PMedication` varchar(3) default NULL,
  `Depression` varchar(3) default NULL,
  `Anxiety` varchar(3) default NULL,
  `SocialDifficulties` varchar(3) default NULL,
  `ThyroidProblems` varchar(3) default NULL,
  `Diabetes` varchar(3) default NULL,
  `AbnormalBlood` varchar(3) default NULL,
  `Anemia` varchar(3) default NULL,
  `FhBloodProblems` varchar(3) default NULL,
  `BleedingProblems` varchar(3) default NULL,
  `Allergies` varchar(3) default NULL,
  `FrequentIllness` varchar(3) default NULL,
  `Hiv` varchar(3) default NULL,
  `HaiStatus` varchar(3) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormSoap`
-- 

DROP TABLE IF EXISTS `FormSoap`;
CREATE TABLE `FormSoap` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Pid` bigint(20) default '0',
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default '0',
  `Activity` tinyint(4) default '0',
  `Subjective` text,
  `Objective` text,
  `Assessment` text,
  `Plan` text,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `FormVitals`
-- 

DROP TABLE IF EXISTS `FormVitals`;
CREATE TABLE `FormVitals` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Pid` bigint(20) default '0',
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default '0',
  `Activity` tinyint(4) default '0',
  `Bps` varchar(40) default NULL,
  `Bpd` varchar(40) default NULL,
  `Weight` float(5,2) default '0.00',
  `Height` float(5,2) default '0.00',
  `Temperature` float(5,2) default '0.00',
  `TempMethod` varchar(255) default NULL,
  `Pulse` float(5,2) default '0.00',
  `Respiration` float(5,2) default '0.00',
  `Note` varchar(255) default NULL,
  `BMI` float(4,1) default '0.0',
  `BMIStatus` varchar(255) default NULL,
  `WaistCirc` float(5,2) default '0.00',
  `HeadCirc` float(4,2) default '0.00',
  `OxygenSaturation` float(5,2) default '0.00',
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Forms`
-- 

DROP TABLE IF EXISTS `Forms`;
CREATE TABLE `Forms` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Encounter` bigint(20) default NULL,
  `FormName` longtext,
  `FormId` bigint(20) default NULL,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Authorized` tinyint(4) default NULL,
  `Deleted` tinyint(4) DEFAULT '0' NOT NULL COMMENT 'Flag indicates form has been deleted',
  `Formdir` longtext,
  PRIMARY KEY  (`Id`),
  KEY `PidEncounter` (`Pid`, `Encounter`),
  KEY `FormId` (`FormId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `GeoCountryReference`
-- 

DROP TABLE IF EXISTS `GeoCountryReference`;
CREATE TABLE `GeoCountryReference` (
  `CountriesId` int(5) NOT NULL AUTO_INCREMENT,
  `CountriesName` varchar(64) default NULL,
  `CountriesIsoCode2` char(2) NOT NULL default '',
  `CountriesIsoCode3` char(3) NOT NULL default '',
  PRIMARY KEY  (`CountriesId`),
  KEY `IDXCOUNTRIESNAME` (`CountriesName`)
) ENGINE=InnoDB AUTO_INCREMENT=240 ;

-- 
-- Dumping data for table `GeoCountryReference`
-- 

INSERT INTO `GeoCountryReference` VALUES (1, 'Afghanistan', 'AF', 'AFG');
INSERT INTO `GeoCountryReference` VALUES (2, 'Albania', 'AL', 'ALB');
INSERT INTO `GeoCountryReference` VALUES (3, 'Algeria', 'DZ', 'DZA');
INSERT INTO `GeoCountryReference` VALUES (4, 'American Samoa', 'AS', 'ASM');
INSERT INTO `GeoCountryReference` VALUES (5, 'Andorra', 'AD', 'AND');
INSERT INTO `GeoCountryReference` VALUES (6, 'Angola', 'AO', 'AGO');
INSERT INTO `GeoCountryReference` VALUES (7, 'Anguilla', 'AI', 'AIA');
INSERT INTO `GeoCountryReference` VALUES (8, 'Antarctica', 'AQ', 'ATA');
INSERT INTO `GeoCountryReference` VALUES (9, 'Antigua and Barbuda', 'AG', 'ATG');
INSERT INTO `GeoCountryReference` VALUES (10, 'Argentina', 'AR', 'ARG');
INSERT INTO `GeoCountryReference` VALUES (11, 'Armenia', 'AM', 'ARM');
INSERT INTO `GeoCountryReference` VALUES (12, 'Aruba', 'AW', 'ABW');
INSERT INTO `GeoCountryReference` VALUES (13, 'Australia', 'AU', 'AUS');
INSERT INTO `GeoCountryReference` VALUES (14, 'Austria', 'AT', 'AUT');
INSERT INTO `GeoCountryReference` VALUES (15, 'Azerbaijan', 'AZ', 'AZE');
INSERT INTO `GeoCountryReference` VALUES (16, 'Bahamas', 'BS', 'BHS');
INSERT INTO `GeoCountryReference` VALUES (17, 'Bahrain', 'BH', 'BHR');
INSERT INTO `GeoCountryReference` VALUES (18, 'Bangladesh', 'BD', 'BGD');
INSERT INTO `GeoCountryReference` VALUES (19, 'Barbados', 'BB', 'BRB');
INSERT INTO `GeoCountryReference` VALUES (20, 'Belarus', 'BY', 'BLR');
INSERT INTO `GeoCountryReference` VALUES (21, 'Belgium', 'BE', 'BEL');
INSERT INTO `GeoCountryReference` VALUES (22, 'Belize', 'BZ', 'BLZ');
INSERT INTO `GeoCountryReference` VALUES (23, 'Benin', 'BJ', 'BEN');
INSERT INTO `GeoCountryReference` VALUES (24, 'Bermuda', 'BM', 'BMU');
INSERT INTO `GeoCountryReference` VALUES (25, 'Bhutan', 'BT', 'BTN');
INSERT INTO `GeoCountryReference` VALUES (26, 'Bolivia', 'BO', 'BOL');
INSERT INTO `GeoCountryReference` VALUES (27, 'Bosnia and Herzegowina', 'BA', 'BIH');
INSERT INTO `GeoCountryReference` VALUES (28, 'Botswana', 'BW', 'BWA');
INSERT INTO `GeoCountryReference` VALUES (29, 'Bouvet Island', 'BV', 'BVT');
INSERT INTO `GeoCountryReference` VALUES (30, 'Brazil', 'BR', 'BRA');
INSERT INTO `GeoCountryReference` VALUES (31, 'British Indian Ocean Territory', 'IO', 'IOT');
INSERT INTO `GeoCountryReference` VALUES (32, 'Brunei Darussalam', 'BN', 'BRN');
INSERT INTO `GeoCountryReference` VALUES (33, 'Bulgaria', 'BG', 'BGR');
INSERT INTO `GeoCountryReference` VALUES (34, 'Burkina Faso', 'BF', 'BFA');
INSERT INTO `GeoCountryReference` VALUES (35, 'Burundi', 'BI', 'BDI');
INSERT INTO `GeoCountryReference` VALUES (36, 'Cambodia', 'KH', 'KHM');
INSERT INTO `GeoCountryReference` VALUES (37, 'Cameroon', 'CM', 'CMR');
INSERT INTO `GeoCountryReference` VALUES (38, 'Canada', 'CA', 'CAN');
INSERT INTO `GeoCountryReference` VALUES (39, 'Cape Verde', 'CV', 'CPV');
INSERT INTO `GeoCountryReference` VALUES (40, 'Cayman Islands', 'KY', 'CYM');
INSERT INTO `GeoCountryReference` VALUES (41, 'Central African Republic', 'CF', 'CAF');
INSERT INTO `GeoCountryReference` VALUES (42, 'Chad', 'TD', 'TCD');
INSERT INTO `GeoCountryReference` VALUES (43, 'Chile', 'CL', 'CHL');
INSERT INTO `GeoCountryReference` VALUES (44, 'China', 'CN', 'CHN');
INSERT INTO `GeoCountryReference` VALUES (45, 'Christmas Island', 'CX', 'CXR');
INSERT INTO `GeoCountryReference` VALUES (46, 'Cocos (Keeling) Islands', 'CC', 'CCK');
INSERT INTO `GeoCountryReference` VALUES (47, 'Colombia', 'CO', 'COL');
INSERT INTO `GeoCountryReference` VALUES (48, 'Comoros', 'KM', 'COM');
INSERT INTO `GeoCountryReference` VALUES (49, 'Congo', 'CG', 'COG');
INSERT INTO `GeoCountryReference` VALUES (50, 'Cook Islands', 'CK', 'COK');
INSERT INTO `GeoCountryReference` VALUES (51, 'Costa Rica', 'CR', 'CRI');
INSERT INTO `GeoCountryReference` VALUES (52, 'Cote D Ivoire', 'CI', 'CIV');
INSERT INTO `GeoCountryReference` VALUES (53, 'Croatia', 'HR', 'HRV');
INSERT INTO `GeoCountryReference` VALUES (54, 'Cuba', 'CU', 'CUB');
INSERT INTO `GeoCountryReference` VALUES (55, 'Cyprus', 'CY', 'CYP');
INSERT INTO `GeoCountryReference` VALUES (56, 'Czech Republic', 'CZ', 'CZE');
INSERT INTO `GeoCountryReference` VALUES (57, 'Denmark', 'DK', 'DNK');
INSERT INTO `GeoCountryReference` VALUES (58, 'Djibouti', 'DJ', 'DJI');
INSERT INTO `GeoCountryReference` VALUES (59, 'Dominica', 'DM', 'DMA');
INSERT INTO `GeoCountryReference` VALUES (60, 'Dominican Republic', 'DO', 'DOM');
INSERT INTO `GeoCountryReference` VALUES (61, 'East Timor', 'TP', 'TMP');
INSERT INTO `GeoCountryReference` VALUES (62, 'Ecuador', 'EC', 'ECU');
INSERT INTO `GeoCountryReference` VALUES (63, 'Egypt', 'EG', 'EGY');
INSERT INTO `GeoCountryReference` VALUES (64, 'El Salvador', 'SV', 'SLV');
INSERT INTO `GeoCountryReference` VALUES (65, 'Equatorial Guinea', 'GQ', 'GNQ');
INSERT INTO `GeoCountryReference` VALUES (66, 'Eritrea', 'ER', 'ERI');
INSERT INTO `GeoCountryReference` VALUES (67, 'Estonia', 'EE', 'EST');
INSERT INTO `GeoCountryReference` VALUES (68, 'Ethiopia', 'ET', 'ETH');
INSERT INTO `GeoCountryReference` VALUES (69, 'Falkland Islands (Malvinas)', 'FK', 'FLK');
INSERT INTO `GeoCountryReference` VALUES (70, 'Faroe Islands', 'FO', 'FRO');
INSERT INTO `GeoCountryReference` VALUES (71, 'Fiji', 'FJ', 'FJI');
INSERT INTO `GeoCountryReference` VALUES (72, 'Finland', 'FI', 'FIN');
INSERT INTO `GeoCountryReference` VALUES (73, 'France', 'FR', 'FRA');
INSERT INTO `GeoCountryReference` VALUES (74, 'France,MEtropolitan', 'FX', 'FXX');
INSERT INTO `GeoCountryReference` VALUES (75, 'French Guiana', 'GF', 'GUF');
INSERT INTO `GeoCountryReference` VALUES (76, 'French Polynesia', 'PF', 'PYF');
INSERT INTO `GeoCountryReference` VALUES (77, 'French Southern Territories', 'TF', 'ATF');
INSERT INTO `GeoCountryReference` VALUES (78, 'Gabon', 'GA', 'GAB');
INSERT INTO `GeoCountryReference` VALUES (79, 'Gambia', 'GM', 'GMB');
INSERT INTO `GeoCountryReference` VALUES (80, 'Georgia', 'GE', 'GEO');
INSERT INTO `GeoCountryReference` VALUES (81, 'Germany', 'DE', 'DEU');
INSERT INTO `GeoCountryReference` VALUES (82, 'Ghana', 'GH', 'GHA');
INSERT INTO `GeoCountryReference` VALUES (83, 'Gibraltar', 'GI', 'GIB');
INSERT INTO `GeoCountryReference` VALUES (84, 'Greece', 'GR', 'GRC');
INSERT INTO `GeoCountryReference` VALUES (85, 'Greenland', 'GL', 'GRL');
INSERT INTO `GeoCountryReference` VALUES (86, 'Grenada', 'GD', 'GRD');
INSERT INTO `GeoCountryReference` VALUES (87, 'Guadeloupe', 'GP', 'GLP');
INSERT INTO `GeoCountryReference` VALUES (88, 'Guam', 'GU', 'GUM');
INSERT INTO `GeoCountryReference` VALUES (89, 'Guatemala', 'GT', 'GTM');
INSERT INTO `GeoCountryReference` VALUES (90, 'Guinea', 'GN', 'GIN');
INSERT INTO `GeoCountryReference` VALUES (91, 'Guinea-bissau', 'GW', 'GNB');
INSERT INTO `GeoCountryReference` VALUES (92, 'Guyana', 'GY', 'GUY');
INSERT INTO `GeoCountryReference` VALUES (93, 'Haiti', 'HT', 'HTI');
INSERT INTO `GeoCountryReference` VALUES (94, 'Heard and Mc Donald Islands', 'HM', 'HMD');
INSERT INTO `GeoCountryReference` VALUES (95, 'Honduras', 'HN', 'HND');
INSERT INTO `GeoCountryReference` VALUES (96, 'Hong Kong', 'HK', 'HKG');
INSERT INTO `GeoCountryReference` VALUES (97, 'Hungary', 'HU', 'HUN');
INSERT INTO `GeoCountryReference` VALUES (98, 'Iceland', 'IS', 'ISL');
INSERT INTO `GeoCountryReference` VALUES (99, 'India', 'IN', 'IND');
INSERT INTO `GeoCountryReference` VALUES (100, 'Indonesia', 'ID', 'IDN');
INSERT INTO `GeoCountryReference` VALUES (101, 'Iran (Islamic Republic of)', 'IR', 'IRN');
INSERT INTO `GeoCountryReference` VALUES (102, 'Iraq', 'IQ', 'IRQ');
INSERT INTO `GeoCountryReference` VALUES (103, 'Ireland', 'IE', 'IRL');
INSERT INTO `GeoCountryReference` VALUES (104, 'Israel', 'IL', 'ISR');
INSERT INTO `GeoCountryReference` VALUES (105, 'Italy', 'IT', 'ITA');
INSERT INTO `GeoCountryReference` VALUES (106, 'Jamaica', 'JM', 'JAM');
INSERT INTO `GeoCountryReference` VALUES (107, 'Japan', 'JP', 'JPN');
INSERT INTO `GeoCountryReference` VALUES (108, 'Jordan', 'JO', 'JOR');
INSERT INTO `GeoCountryReference` VALUES (109, 'Kazakhstan', 'KZ', 'KAZ');
INSERT INTO `GeoCountryReference` VALUES (110, 'Kenya', 'KE', 'KEN');
INSERT INTO `GeoCountryReference` VALUES (111, 'Kiribati', 'KI', 'KIR');
INSERT INTO `GeoCountryReference` VALUES (112, 'Korea,Democratic Peoples Republic of', 'KP', 'PRK');
INSERT INTO `GeoCountryReference` VALUES (113, 'Korea,Republic of', 'KR', 'KOR');
INSERT INTO `GeoCountryReference` VALUES (114, 'Kuwait', 'KW', 'KWT');
INSERT INTO `GeoCountryReference` VALUES (115, 'Kyrgyzstan', 'KG', 'KGZ');
INSERT INTO `GeoCountryReference` VALUES (116, 'Lao Peoples Democratic Republic', 'LA', 'LAO');
INSERT INTO `GeoCountryReference` VALUES (117, 'Latvia', 'LV', 'LVA');
INSERT INTO `GeoCountryReference` VALUES (118, 'Lebanon', 'LB', 'LBN');
INSERT INTO `GeoCountryReference` VALUES (119, 'Lesotho', 'LS', 'LSO');
INSERT INTO `GeoCountryReference` VALUES (120, 'Liberia', 'LR', 'LBR');
INSERT INTO `GeoCountryReference` VALUES (121, 'Libyan Arab Jamahiriya', 'LY', 'LBY');
INSERT INTO `GeoCountryReference` VALUES (122, 'Liechtenstein', 'LI', 'LIE');
INSERT INTO `GeoCountryReference` VALUES (123, 'Lithuania', 'LT', 'LTU');
INSERT INTO `GeoCountryReference` VALUES (124, 'Luxembourg', 'LU', 'LUX');
INSERT INTO `GeoCountryReference` VALUES (125, 'Macau', 'MO', 'MAC');
INSERT INTO `GeoCountryReference` VALUES (126, 'Macedonia,The Former Yugoslav Republic of', 'MK', 'MKD');
INSERT INTO `GeoCountryReference` VALUES (127, 'Madagascar', 'MG', 'MDG');
INSERT INTO `GeoCountryReference` VALUES (128, 'Malawi', 'MW', 'MWI');
INSERT INTO `GeoCountryReference` VALUES (129, 'Malaysia', 'MY', 'MYS');
INSERT INTO `GeoCountryReference` VALUES (130, 'Maldives', 'MV', 'MDV');
INSERT INTO `GeoCountryReference` VALUES (131, 'Mali', 'ML', 'MLI');
INSERT INTO `GeoCountryReference` VALUES (132, 'Malta', 'MT', 'MLT');
INSERT INTO `GeoCountryReference` VALUES (133, 'Marshall Islands', 'MH', 'MHL');
INSERT INTO `GeoCountryReference` VALUES (134, 'Martinique', 'MQ', 'MTQ');
INSERT INTO `GeoCountryReference` VALUES (135, 'Mauritania', 'MR', 'MRT');
INSERT INTO `GeoCountryReference` VALUES (136, 'Mauritius', 'MU', 'MUS');
INSERT INTO `GeoCountryReference` VALUES (137, 'Mayotte', 'YT', 'MYT');
INSERT INTO `GeoCountryReference` VALUES (138, 'Mexico', 'MX', 'MEX');
INSERT INTO `GeoCountryReference` VALUES (139, 'Micronesia,Federated States of', 'FM', 'FSM');
INSERT INTO `GeoCountryReference` VALUES (140, 'Moldova,Republic of', 'MD', 'MDA');
INSERT INTO `GeoCountryReference` VALUES (141, 'Monaco', 'MC', 'MCO');
INSERT INTO `GeoCountryReference` VALUES (142, 'Mongolia', 'MN', 'MNG');
INSERT INTO `GeoCountryReference` VALUES (143, 'Montserrat', 'MS', 'MSR');
INSERT INTO `GeoCountryReference` VALUES (144, 'Morocco', 'MA', 'MAR');
INSERT INTO `GeoCountryReference` VALUES (145, 'Mozambique', 'MZ', 'MOZ');
INSERT INTO `GeoCountryReference` VALUES (146, 'Myanmar', 'MM', 'MMR');
INSERT INTO `GeoCountryReference` VALUES (147, 'Namibia', 'NA', 'NAM');
INSERT INTO `GeoCountryReference` VALUES (148, 'Nauru', 'NR', 'NRU');
INSERT INTO `GeoCountryReference` VALUES (149, 'Nepal', 'NP', 'NPL');
INSERT INTO `GeoCountryReference` VALUES (150, 'Netherlands', 'NL', 'NLD');
INSERT INTO `GeoCountryReference` VALUES (151, 'Netherlands Antilles', 'AN', 'ANT');
INSERT INTO `GeoCountryReference` VALUES (152, 'New Caledonia', 'NC', 'NCL');
INSERT INTO `GeoCountryReference` VALUES (153, 'New Zealand', 'NZ', 'NZL');
INSERT INTO `GeoCountryReference` VALUES (154, 'Nicaragua', 'NI', 'NIC');
INSERT INTO `GeoCountryReference` VALUES (155, 'Niger', 'NE', 'NER');
INSERT INTO `GeoCountryReference` VALUES (156, 'Nigeria', 'NG', 'NGA');
INSERT INTO `GeoCountryReference` VALUES (157, 'Niue', 'NU', 'NIU');
INSERT INTO `GeoCountryReference` VALUES (158, 'Norfolk Island', 'NF', 'NFK');
INSERT INTO `GeoCountryReference` VALUES (159, 'Northern Mariana Islands', 'MP', 'MNP');
INSERT INTO `GeoCountryReference` VALUES (160, 'Norway', 'NO', 'NOR');
INSERT INTO `GeoCountryReference` VALUES (161, 'Oman', 'OM', 'OMN');
INSERT INTO `GeoCountryReference` VALUES (162, 'Pakistan', 'PK', 'PAK');
INSERT INTO `GeoCountryReference` VALUES (163, 'Palau', 'PW', 'PLW');
INSERT INTO `GeoCountryReference` VALUES (164, 'Panama', 'PA', 'PAN');
INSERT INTO `GeoCountryReference` VALUES (165, 'Papua New Guinea', 'PG', 'PNG');
INSERT INTO `GeoCountryReference` VALUES (166, 'Paraguay', 'PY', 'PRY');
INSERT INTO `GeoCountryReference` VALUES (167, 'Peru', 'PE', 'PER');
INSERT INTO `GeoCountryReference` VALUES (168, 'Philippines', 'PH', 'PHL');
INSERT INTO `GeoCountryReference` VALUES (169, 'Pitcairn', 'PN', 'PCN');
INSERT INTO `GeoCountryReference` VALUES (170, 'Poland', 'PL', 'POL');
INSERT INTO `GeoCountryReference` VALUES (171, 'Portugal', 'PT', 'PRT');
INSERT INTO `GeoCountryReference` VALUES (172, 'Puerto Rico', 'PR', 'PRI');
INSERT INTO `GeoCountryReference` VALUES (173, 'Qatar', 'QA', 'QAT');
INSERT INTO `GeoCountryReference` VALUES (174, 'Reunion', 'RE', 'REU');
INSERT INTO `GeoCountryReference` VALUES (175, 'Romania', 'RO', 'ROM');
INSERT INTO `GeoCountryReference` VALUES (176, 'Russian Federation', 'RU', 'RUS');
INSERT INTO `GeoCountryReference` VALUES (177, 'Rwanda', 'RW', 'RWA');
INSERT INTO `GeoCountryReference` VALUES (178, 'Saint Kitts and Nevis', 'KN', 'KNA');
INSERT INTO `GeoCountryReference` VALUES (179, 'Saint Lucia', 'LC', 'LCA');
INSERT INTO `GeoCountryReference` VALUES (180, 'Saint Vincent and the Grenadines', 'VC', 'VCT');
INSERT INTO `GeoCountryReference` VALUES (181, 'Samoa', 'WS', 'WSM');
INSERT INTO `GeoCountryReference` VALUES (182, 'San Marino', 'SM', 'SMR');
INSERT INTO `GeoCountryReference` VALUES (183, 'Sao Tome and Principe', 'ST', 'STP');
INSERT INTO `GeoCountryReference` VALUES (184, 'Saudi Arabia', 'SA', 'SAU');
INSERT INTO `GeoCountryReference` VALUES (185, 'Senegal', 'SN', 'SEN');
INSERT INTO `GeoCountryReference` VALUES (186, 'Seychelles', 'SC', 'SYC');
INSERT INTO `GeoCountryReference` VALUES (187, 'Sierra Leone', 'SL', 'SLE');
INSERT INTO `GeoCountryReference` VALUES (188, 'Singapore', 'SG', 'SGP');
INSERT INTO `GeoCountryReference` VALUES (189, 'Slovakia (Slovak Republic)', 'SK', 'SVK');
INSERT INTO `GeoCountryReference` VALUES (190, 'Slovenia', 'SI', 'SVN');
INSERT INTO `GeoCountryReference` VALUES (191, 'Solomon Islands', 'SB', 'SLB');
INSERT INTO `GeoCountryReference` VALUES (192, 'Somalia', 'SO', 'SOM');
INSERT INTO `GeoCountryReference` VALUES (193, 'South Africa', 'ZA', 'ZAF');
INSERT INTO `GeoCountryReference` VALUES (194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS');
INSERT INTO `GeoCountryReference` VALUES (195, 'Spain', 'ES', 'ESP');
INSERT INTO `GeoCountryReference` VALUES (196, 'Sri Lanka', 'LK', 'LKA');
INSERT INTO `GeoCountryReference` VALUES (197, 'St. Helena', 'SH', 'SHN');
INSERT INTO `GeoCountryReference` VALUES (198, 'St. Pierre and Miquelon', 'PM', 'SPM');
INSERT INTO `GeoCountryReference` VALUES (199, 'Sudan', 'SD', 'SDN');
INSERT INTO `GeoCountryReference` VALUES (200, 'Suriname', 'SR', 'SUR');
INSERT INTO `GeoCountryReference` VALUES (201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM');
INSERT INTO `GeoCountryReference` VALUES (202, 'Swaziland', 'SZ', 'SWZ');
INSERT INTO `GeoCountryReference` VALUES (203, 'Sweden', 'SE', 'SWE');
INSERT INTO `GeoCountryReference` VALUES (204, 'Switzerland', 'CH', 'CHE');
INSERT INTO `GeoCountryReference` VALUES (205, 'Syrian Arab Republic', 'SY', 'SYR');
INSERT INTO `GeoCountryReference` VALUES (206, 'Taiwan,Province of China', 'TW', 'TWN');
INSERT INTO `GeoCountryReference` VALUES (207, 'Tajikistan', 'TJ', 'TJK');
INSERT INTO `GeoCountryReference` VALUES (208, 'Tanzania,United Republic of', 'TZ', 'TZA');
INSERT INTO `GeoCountryReference` VALUES (209, 'Thailand', 'TH', 'THA');
INSERT INTO `GeoCountryReference` VALUES (210, 'Togo', 'TG', 'TGO');
INSERT INTO `GeoCountryReference` VALUES (211, 'Tokelau', 'TK', 'TKL');
INSERT INTO `GeoCountryReference` VALUES (212, 'Tonga', 'TO', 'TON');
INSERT INTO `GeoCountryReference` VALUES (213, 'Trinidad and Tobago', 'TT', 'TTO');
INSERT INTO `GeoCountryReference` VALUES (214, 'Tunisia', 'TN', 'TUN');
INSERT INTO `GeoCountryReference` VALUES (215, 'Turkey', 'TR', 'TUR');
INSERT INTO `GeoCountryReference` VALUES (216, 'Turkmenistan', 'TM', 'TKM');
INSERT INTO `GeoCountryReference` VALUES (217, 'Turks and Caicos Islands', 'TC', 'TCA');
INSERT INTO `GeoCountryReference` VALUES (218, 'Tuvalu', 'TV', 'TUV');
INSERT INTO `GeoCountryReference` VALUES (219, 'Uganda', 'UG', 'UGA');
INSERT INTO `GeoCountryReference` VALUES (220, 'Ukraine', 'UA', 'UKR');
INSERT INTO `GeoCountryReference` VALUES (221, 'United Arab Emirates', 'AE', 'ARE');
INSERT INTO `GeoCountryReference` VALUES (222, 'United Kingdom', 'GB', 'GBR');
INSERT INTO `GeoCountryReference` VALUES (223, 'United States', 'US', 'USA');
INSERT INTO `GeoCountryReference` VALUES (224, 'United States Minor Outlying Islands', 'UM', 'UMI');
INSERT INTO `GeoCountryReference` VALUES (225, 'Uruguay', 'UY', 'URY');
INSERT INTO `GeoCountryReference` VALUES (226, 'Uzbekistan', 'UZ', 'UZB');
INSERT INTO `GeoCountryReference` VALUES (227, 'Vanuatu', 'VU', 'VUT');
INSERT INTO `GeoCountryReference` VALUES (228, 'Vatican City State (Holy See)', 'VA', 'VAT');
INSERT INTO `GeoCountryReference` VALUES (229, 'Venezuela', 'VE', 'VEN');
INSERT INTO `GeoCountryReference` VALUES (230, 'Viet Nam', 'VN', 'VNM');
INSERT INTO `GeoCountryReference` VALUES (231, 'Virgin Islands (British)', 'VG', 'VGB');
INSERT INTO `GeoCountryReference` VALUES (232, 'Virgin Islands (U.S.)', 'VI', 'VIR');
INSERT INTO `GeoCountryReference` VALUES (233, 'Wallis and Futuna Islands', 'WF', 'WLF');
INSERT INTO `GeoCountryReference` VALUES (234, 'Western Sahara', 'EH', 'ESH');
INSERT INTO `GeoCountryReference` VALUES (235, 'Yemen', 'YE', 'YEM');
INSERT INTO `GeoCountryReference` VALUES (236, 'Yugoslavia', 'YU', 'YUG');
INSERT INTO `GeoCountryReference` VALUES (237, 'Zaire', 'ZR', 'ZAR');
INSERT INTO `GeoCountryReference` VALUES (238, 'Zambia', 'ZM', 'ZMB');
INSERT INTO `GeoCountryReference` VALUES (239, 'Zimbabwe', 'ZW', 'ZWE');

-- --------------------------------------------------------

-- 
-- Table structure for table `GeoZoneReference`
-- 

DROP TABLE IF EXISTS `GeoZoneReference`;
CREATE TABLE `GeoZoneReference` (
  `ZoneId` int(5) NOT NULL AUTO_INCREMENT,
  `ZoneCountryId` int(5) NOT NULL default '0',
  `ZoneCode` varchar(5) default NULL,
  `ZoneName` varchar(32) default NULL,
  PRIMARY KEY  (`ZoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 ;

-- 
-- Dumping data for table `GeoZoneReference`
-- 

INSERT INTO `GeoZoneReference` VALUES (1, 223, 'AL', 'Alabama');
INSERT INTO `GeoZoneReference` VALUES (2, 223, 'AK', 'Alaska');
INSERT INTO `GeoZoneReference` VALUES (3, 223, 'AS', 'American Samoa');
INSERT INTO `GeoZoneReference` VALUES (4, 223, 'AZ', 'Arizona');
INSERT INTO `GeoZoneReference` VALUES (5, 223, 'AR', 'Arkansas');
INSERT INTO `GeoZoneReference` VALUES (6, 223, 'AF', 'Armed Forces Africa');
INSERT INTO `GeoZoneReference` VALUES (7, 223, 'AA', 'Armed Forces Americas');
INSERT INTO `GeoZoneReference` VALUES (8, 223, 'AC', 'Armed Forces Canada');
INSERT INTO `GeoZoneReference` VALUES (9, 223, 'AE', 'Armed Forces Europe');
INSERT INTO `GeoZoneReference` VALUES (10, 223, 'AM', 'Armed Forces Middle East');
INSERT INTO `GeoZoneReference` VALUES (11, 223, 'AP', 'Armed Forces Pacific');
INSERT INTO `GeoZoneReference` VALUES (12, 223, 'CA', 'California');
INSERT INTO `GeoZoneReference` VALUES (13, 223, 'CO', 'Colorado');
INSERT INTO `GeoZoneReference` VALUES (14, 223, 'CT', 'Connecticut');
INSERT INTO `GeoZoneReference` VALUES (15, 223, 'DE', 'Delaware');
INSERT INTO `GeoZoneReference` VALUES (16, 223, 'DC', 'District of Columbia');
INSERT INTO `GeoZoneReference` VALUES (17, 223, 'FM', 'Federated States Of Micronesia');
INSERT INTO `GeoZoneReference` VALUES (18, 223, 'FL', 'Florida');
INSERT INTO `GeoZoneReference` VALUES (19, 223, 'GA', 'Georgia');
INSERT INTO `GeoZoneReference` VALUES (20, 223, 'GU', 'Guam');
INSERT INTO `GeoZoneReference` VALUES (21, 223, 'HI', 'Hawaii');
INSERT INTO `GeoZoneReference` VALUES (22, 223, 'ID', 'Idaho');
INSERT INTO `GeoZoneReference` VALUES (23, 223, 'IL', 'Illinois');
INSERT INTO `GeoZoneReference` VALUES (24, 223, 'IN', 'Indiana');
INSERT INTO `GeoZoneReference` VALUES (25, 223, 'IA', 'Iowa');
INSERT INTO `GeoZoneReference` VALUES (26, 223, 'KS', 'Kansas');
INSERT INTO `GeoZoneReference` VALUES (27, 223, 'KY', 'Kentucky');
INSERT INTO `GeoZoneReference` VALUES (28, 223, 'LA', 'Louisiana');
INSERT INTO `GeoZoneReference` VALUES (29, 223, 'ME', 'Maine');
INSERT INTO `GeoZoneReference` VALUES (30, 223, 'MH', 'Marshall Islands');
INSERT INTO `GeoZoneReference` VALUES (31, 223, 'MD', 'Maryland');
INSERT INTO `GeoZoneReference` VALUES (32, 223, 'MA', 'Massachusetts');
INSERT INTO `GeoZoneReference` VALUES (33, 223, 'MI', 'Michigan');
INSERT INTO `GeoZoneReference` VALUES (34, 223, 'MN', 'Minnesota');
INSERT INTO `GeoZoneReference` VALUES (35, 223, 'MS', 'Mississippi');
INSERT INTO `GeoZoneReference` VALUES (36, 223, 'MO', 'Missouri');
INSERT INTO `GeoZoneReference` VALUES (37, 223, 'MT', 'Montana');
INSERT INTO `GeoZoneReference` VALUES (38, 223, 'NE', 'Nebraska');
INSERT INTO `GeoZoneReference` VALUES (39, 223, 'NV', 'Nevada');
INSERT INTO `GeoZoneReference` VALUES (40, 223, 'NH', 'New Hampshire');
INSERT INTO `GeoZoneReference` VALUES (41, 223, 'NJ', 'New Jersey');
INSERT INTO `GeoZoneReference` VALUES (42, 223, 'NM', 'New Mexico');
INSERT INTO `GeoZoneReference` VALUES (43, 223, 'NY', 'New York');
INSERT INTO `GeoZoneReference` VALUES (44, 223, 'NC', 'North Carolina');
INSERT INTO `GeoZoneReference` VALUES (45, 223, 'ND', 'North Dakota');
INSERT INTO `GeoZoneReference` VALUES (46, 223, 'MP', 'Northern Mariana Islands');
INSERT INTO `GeoZoneReference` VALUES (47, 223, 'OH', 'Ohio');
INSERT INTO `GeoZoneReference` VALUES (48, 223, 'OK', 'Oklahoma');
INSERT INTO `GeoZoneReference` VALUES (49, 223, 'OR', 'Oregon');
INSERT INTO `GeoZoneReference` VALUES (50, 223, 'PW', 'Palau');
INSERT INTO `GeoZoneReference` VALUES (51, 223, 'PA', 'Pennsylvania');
INSERT INTO `GeoZoneReference` VALUES (52, 223, 'PR', 'Puerto Rico');
INSERT INTO `GeoZoneReference` VALUES (53, 223, 'RI', 'Rhode Island');
INSERT INTO `GeoZoneReference` VALUES (54, 223, 'SC', 'South Carolina');
INSERT INTO `GeoZoneReference` VALUES (55, 223, 'SD', 'South Dakota');
INSERT INTO `GeoZoneReference` VALUES (56, 223, 'TN', 'Tenessee');
INSERT INTO `GeoZoneReference` VALUES (57, 223, 'TX', 'Texas');
INSERT INTO `GeoZoneReference` VALUES (58, 223, 'UT', 'Utah');
INSERT INTO `GeoZoneReference` VALUES (59, 223, 'VT', 'Vermont');
INSERT INTO `GeoZoneReference` VALUES (60, 223, 'VI', 'Virgin Islands');
INSERT INTO `GeoZoneReference` VALUES (61, 223, 'VA', 'Virginia');
INSERT INTO `GeoZoneReference` VALUES (62, 223, 'WA', 'Washington');
INSERT INTO `GeoZoneReference` VALUES (63, 223, 'WV', 'West Virginia');
INSERT INTO `GeoZoneReference` VALUES (64, 223, 'WI', 'Wisconsin');
INSERT INTO `GeoZoneReference` VALUES (65, 223, 'WY', 'Wyoming');
INSERT INTO `GeoZoneReference` VALUES (66, 38, 'AB', 'Alberta');
INSERT INTO `GeoZoneReference` VALUES (67, 38, 'BC', 'British Columbia');
INSERT INTO `GeoZoneReference` VALUES (68, 38, 'MB', 'Manitoba');
INSERT INTO `GeoZoneReference` VALUES (69, 38, 'NF', 'Newfoundland');
INSERT INTO `GeoZoneReference` VALUES (70, 38, 'NB', 'New Brunswick');
INSERT INTO `GeoZoneReference` VALUES (71, 38, 'NS', 'Nova Scotia');
INSERT INTO `GeoZoneReference` VALUES (72, 38, 'NT', 'Northwest Territories');
INSERT INTO `GeoZoneReference` VALUES (73, 38, 'NU', 'Nunavut');
INSERT INTO `GeoZoneReference` VALUES (74, 38, 'ON', 'Ontario');
INSERT INTO `GeoZoneReference` VALUES (75, 38, 'PE', 'Prince Edward Island');
INSERT INTO `GeoZoneReference` VALUES (76, 38, 'QC', 'Quebec');
INSERT INTO `GeoZoneReference` VALUES (77, 38, 'SK', 'Saskatchewan');
INSERT INTO `GeoZoneReference` VALUES (78, 38, 'YT', 'Yukon Territory');
INSERT INTO `GeoZoneReference` VALUES (79, 61, 'QLD', 'Queensland');
INSERT INTO `GeoZoneReference` VALUES (80, 61, 'SA', 'South Australia');
INSERT INTO `GeoZoneReference` VALUES (81, 61, 'ACT', 'Australian Capital Territory');
INSERT INTO `GeoZoneReference` VALUES (82, 61, 'VIC', 'Victoria');

-- --------------------------------------------------------

-- 
-- Table structure for table `Groups`
-- 

DROP TABLE IF EXISTS `Groups`;
CREATE TABLE `Groups` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `User` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `HistoryData`
-- 

DROP TABLE IF EXISTS `HistoryData`;
CREATE TABLE `HistoryData` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Coffee` longtext,
  `Tobacco` longtext,
  `Alcohol` longtext,
  `SleepPatterns` longtext,
  `ExercisePatterns` longtext,
  `SeatbeltUse` longtext,
  `Counseling` longtext,
  `HazardousActivities` longtext,
  `RecreationalDrugs` longtext,
  `LastBreastExam` varchar(255) default NULL,
  `LastMammogram` varchar(255) default NULL,
  `LastGynocologicalExam` varchar(255) default NULL,
  `LastRectalExam` varchar(255) default NULL,
  `LastProstateExam` varchar(255) default NULL,
  `LastPhysicalExam` varchar(255) default NULL,
  `LastSigmoidoscopyColonoscopy` varchar(255) default NULL,
  `LastEcg` varchar(255) default NULL,
  `LastCardiacEcho` varchar(255) default NULL,
  `LastRetinal` varchar(255) default NULL,
  `LastFluvax` varchar(255) default NULL,
  `LastPneuvax` varchar(255) default NULL,
  `LastLdl` varchar(255) default NULL,
  `LastHemoglobin` varchar(255) default NULL,
  `LastPsa` varchar(255) default NULL,
  `LastExamResults` varchar(255) default NULL,
  `HistoryMother` longtext,
  `DcMother` text,
  `HistoryFather` longtext,
  `DcFather`  text,
  `HistorySiblings` longtext,
  `DcSiblings` text,
  `HistoryOffspring` longtext,
  `DcOffspring` text,
  `HistorySpouse` longtext,
  `DcSpouse` text,
  `RelativesCancer` longtext,
  `RelativesTuberculosis` longtext,
  `RelativesDiabetes` longtext,
  `RelativesHighBloodPressure` longtext,
  `RelativesHeartProblems` longtext,
  `RelativesStroke` longtext,
  `RelativesEpilepsy` longtext,
  `RelativesMentalIllness` longtext,
  `RelativesSuicide` longtext,
  `CataractSurgery` datetime default NULL,
  `Tonsillectomy` datetime default NULL,
  `Cholecystestomy` datetime default NULL,
  `HeartSurgery` datetime default NULL,
  `Hysterectomy` datetime default NULL,
  `HerniaRepair` datetime default NULL,
  `HipReplacement` datetime default NULL,
  `KneeReplacement` datetime default NULL,
  `Appendectomy` datetime default NULL,
  `Date` datetime default NULL,
  `Pid` bigint(20) NOT NULL default '0',
  `Name1` varchar(255) default NULL,
  `Value1` varchar(255) default NULL,
  `Name2` varchar(255) default NULL,
  `Value2` varchar(255) default NULL,
  `AdditionalHistory` text,
  `Exams` text,
  `Usertext11` TEXT,
  `Usertext12` varchar(255) NOT NULL DEFAULT '',
  `Usertext13` varchar(255) NOT NULL DEFAULT '',
  `Usertext14` varchar(255) NOT NULL DEFAULT '',
  `Usertext15` varchar(255) NOT NULL DEFAULT '',
  `Usertext16` varchar(255) NOT NULL DEFAULT '',
  `Usertext17` varchar(255) NOT NULL DEFAULT '',
  `Usertext18` varchar(255) NOT NULL DEFAULT '',
  `Usertext19` varchar(255) NOT NULL DEFAULT '',
  `Usertext20` varchar(255) NOT NULL DEFAULT '',
  `Usertext21` varchar(255) NOT NULL DEFAULT '',
  `Usertext22` varchar(255) NOT NULL DEFAULT '',
  `Usertext23` varchar(255) NOT NULL DEFAULT '',
  `Usertext24` varchar(255) NOT NULL DEFAULT '',
  `Usertext25` varchar(255) NOT NULL DEFAULT '',
  `Usertext26` varchar(255) NOT NULL DEFAULT '',
  `Usertext27` varchar(255) NOT NULL DEFAULT '',
  `Usertext28` varchar(255) NOT NULL DEFAULT '',
  `Usertext29` varchar(255) NOT NULL DEFAULT '',
  `Usertext30` varchar(255) NOT NULL DEFAULT '',
  `Userdate11` date DEFAULT NULL,
  `Userdate12` date DEFAULT NULL,
  `Userdate13` date DEFAULT NULL,
  `Userdate14` date DEFAULT NULL,
  `Userdate15` date DEFAULT NULL,
  `Userarea11` text,
  `Userarea12` text,
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Icd9DxCode`
--

DROP TABLE IF EXISTS `Icd9DxCode`;
CREATE TABLE `Icd9DxCode` (
  `DxId` SERIAL,
  `DxCode`             varchar(5),
  `FormattedDxCode`   varchar(6),
  `ShortDesc`          varchar(60),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0,
  KEY `DxCode` (`DxCode`),
  KEY `FormattedDxCode` (`FormattedDxCode`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd9SgCode`
--

DROP TABLE IF EXISTS `Icd9SgCode`;
CREATE TABLE `Icd9SgCode` (
  `SgId` SERIAL,
  `SgCode`             varchar(5),
  `FormattedSgCode`   varchar(6),
  `ShortDesc`          varchar(60),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0,
  KEY `SgCode` (`SgCode`),
  KEY `FormattedSgCode` (`FormattedSgCode`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd9DxLongCode`
--

DROP TABLE IF EXISTS `Icd9DxLongCode`;
CREATE TABLE `Icd9DxLongCode` (
  `DxId` SERIAL,
  `DxCode`             varchar(5),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd9SgLongCode`
--

DROP TABLE IF EXISTS `Icd9SgLongCode`;
CREATE TABLE `Icd9SgLongCode` (
  `SqId` SERIAL,
  `SgCode`             varchar(5),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10DxOrderCode`
--

DROP TABLE IF EXISTS `Icd10DxOrderCode`;
CREATE TABLE `Icd10DxOrderCode` (
  `DxId`               SERIAL,
  `DxCode`             varchar(7),
  `FormattedDxCode`   varchar(10),
  `ValidForCoding`    char,
  `ShortDesc`          varchar(60),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0,
  KEY `FormattedDxCode` (`FormattedDxCode`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10PcsOrderCode`
--

DROP TABLE IF EXISTS `Icd10PcsOrderCode`;
CREATE TABLE `Icd10PcsOrderCode` (
  `PcsId`              SERIAL,
  `PcsCode`            varchar(7),
  `ValidForCoding`    char,
  `ShortDesc`          varchar(60),
  `LongDesc`           varchar(300),
  `Active` tinyint default 0,
  `Revision` int default 0,
  KEY `PcsCode` (`PcsCode`),
  KEY `Active` (`Active`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10GemPcs910`
--

DROP TABLE IF EXISTS `Icd10GemPcs910`;
CREATE TABLE `Icd10GemPcs910` (
  `MapId` SERIAL,
  `PcsIcd9Source` varchar(5) default NULL,
  `PcsIcd10Target` varchar(7) default NULL,
  `Flags` varchar(5) default NULL,
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10GemPcs109`
--

DROP TABLE IF EXISTS `Icd10GemPcs109`;
CREATE TABLE `Icd10GemPcs109` (
  `MapId` SERIAL,
  `PcsIcd10Source` varchar(7) default NULL,
  `PcsIcd9Target` varchar(5) default NULL,
  `Flags` varchar(5) default NULL,
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10GemDx910`
--

DROP TABLE IF EXISTS `Icd10GemDx910`;
CREATE TABLE `Icd10GemDx910` (
  `MapId` SERIAL,
  `DxIcd9Source` varchar(5) default NULL,
  `DxIcd10Target` varchar(7) default NULL,
  `Flags` varchar(5) default NULL,
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10GemDx109`
--

DROP TABLE IF EXISTS `Icd10GemDx109`;
CREATE TABLE `Icd10GemDx109` (
  `MapId` SERIAL,
  `DxIcd10Source` varchar(7) default NULL,
  `DxIcd9Target` varchar(5) default NULL,
  `Flags` varchar(5) default NULL,
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10ReimbrDx910`
--

DROP TABLE IF EXISTS `Icd10ReimbrDx910`;
CREATE TABLE `Icd10ReimbrDx910` (
  `MapId` SERIAL,
  `Code`        varchar(8),
  `CodeCnt`    tinyint,
  `ICD901`     varchar(5),
  `ICD902`     varchar(5),
  `ICD903`     varchar(5),
  `ICD904`     varchar(5),
  `ICD905`     varchar(5),
  `ICD906`     varchar(5),
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `Icd10ReimbrPcs910`
--

DROP TABLE IF EXISTS `Icd10ReimbrPcs910`;
CREATE TABLE `Icd10ReimbrPcs910` (
  `MapId`      SERIAL,
  `Code`        varchar(8),
  `CodeCnt`    tinyint,
  `ICD901`     varchar(5),
  `ICD902`     varchar(5),
  `ICD903`     varchar(5),
  `ICD904`     varchar(5),
  `ICD905`     varchar(5),
  `ICD906`     varchar(5),
  `Active` tinyint default 0,
  `Revision` int default 0
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Immunizations`
-- 

DROP TABLE IF EXISTS `Immunizations`;
CREATE TABLE `Immunizations` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) default NULL,
  `AdministeredDate` datetime default NULL,
  `ImmunizationId` int(11) default NULL,
  `CvxCode` varchar(10) default NULL,
  `Manufacturer` varchar(100) default NULL,
  `LotNumber` varchar(50) default NULL,
  `AdministeredById` bigint(20) default NULL,
  `AdministeredBy` VARCHAR( 255 ) default NULL COMMENT 'Alternative to administeredById',
  `EducationDate` date default NULL,
  `VisDate` date default NULL COMMENT 'Date of VIS Statement', 
  `Note` text,
  `CreateDate` datetime default NULL,
  `UpdateDate` timestamp NOT NULL,
  `CreatedBy` bigint(20) default NULL,
  `UpdatedBy` bigint(20) default NULL,
  `AmountAdministered` float DEFAULT NULL,			
  `AmountAdministeredUnit` varchar(50) DEFAULT NULL,			
  `ExpirationDate` date DEFAULT NULL,			
  `Route` varchar(100) DEFAULT NULL,			
  `AdministrationSite` varchar(100) DEFAULT NULL,			
  `AddedErroneously` tinyint(1) NOT NULL DEFAULT '0',  
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  `CompletionStatus` VARCHAR(50) DEFAULT NULL,
  `InformationSource` VARCHAR(31) DEFAULT NULL,
  `RefusalReason` VARCHAR(31) DEFAULT NULL,
  `OrderingProvider` INT(11) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `InsuranceCompanies`
-- 

DROP TABLE IF EXISTS `InsuranceCompanies`;
CREATE TABLE `InsuranceCompanies` (
  `Id` int(11) NOT NULL default '0',
  `Name` varchar(255) default NULL,
  `Attn` varchar(255) default NULL,
  `CmsId` varchar(15) default NULL,
  `FreebType` tinyint(2) default NULL,
  `X12ReceiverId` varchar(25) default NULL,
  `X12DefaultPartnerId` int(11) default NULL,
  `AltCmsId` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `InsuranceData`
-- 

DROP TABLE IF EXISTS `InsuranceData`;
CREATE TABLE `InsuranceData` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` enum('Primary','Secondary','Tertiary') default NULL,
  `Provider` varchar(255) default NULL,
  `PlanName` varchar(255) default NULL,
  `PolicyNumber` varchar(255) default NULL,
  `GroupNumber` varchar(255) default NULL,
  `SubscriberLname` varchar(255) default NULL,
  `SubscriberMname` varchar(255) default NULL,
  `SubscriberFname` varchar(255) default NULL,
  `SubscriberRelationship` varchar(255) default NULL,
  `SubscriberSs` varchar(255) default NULL,
  `SubscriberDOB` date default NULL,
  `SubscriberStreet` varchar(255) default NULL,
  `SubscriberPostalCode` varchar(255) default NULL,
  `SubscriberCity` varchar(255) default NULL,
  `SubscriberState` varchar(255) default NULL,
  `SubscriberCountry` varchar(255) default NULL,
  `SubscriberPhone` varchar(255) default NULL,
  `SubscriberEmployer` varchar(255) default NULL,
  `SubscriberEmployerStreet` varchar(255) default NULL,
  `SubscriberEmployerPostalCode` varchar(255) default NULL,
  `SubscriberEmployerState` varchar(255) default NULL,
  `SubscriberEmployerCountry` varchar(255) default NULL,
  `SubscriberEmployerCity` varchar(255) default NULL,
  `Copay` varchar(255) default NULL,
  `Date` date NOT NULL default '0000-00-00',
  `Pid` bigint(20) NOT NULL default '0',
  `SubscriberSex` varchar(25) default NULL,
  `AcceptAssignment` varchar(5) NOT NULL DEFAULT 'TRUE',
  `PolicyType` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `PidTypeDate` (`Pid`,`Type`,`Date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `InsuranceNumbers`
-- 

DROP TABLE IF EXISTS `InsuranceNumbers`;
CREATE TABLE `InsuranceNumbers` (
  `Id` int(11) NOT NULL default '0',
  `ProviderId` int(11) NOT NULL default '0',
  `InsuranceCompanyId` int(11) default NULL,
  `ProviderNumber` varchar(20) default NULL,
  `RenderingProviderNumber` varchar(20) default NULL,
  `GroupNumber` varchar(20) default NULL,
  `ProviderNumberType` varchar(4) default NULL,
  `RenderingProviderNumberType` varchar(4) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `IntegrationMapping`
-- 

DROP TABLE IF EXISTS `IntegrationMapping`;
CREATE TABLE `IntegrationMapping` (
  `Id` int(11) NOT NULL default '0',
  `ForeignId` int(11) NOT NULL default '0',
  `ForeignTable` varchar(125) default NULL,
  `LocalId` int(11) NOT NULL default '0',
  `LocalTable` varchar(125) default NULL,
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `ForeignId` (`ForeignId`,`ForeignTable`,`LocalId`,`LocalTable`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `IssueEncounter`
-- 

DROP TABLE IF EXISTS `IssueEncounter`;
CREATE TABLE `IssueEncounter` (
  `Pid` int(11) NOT NULL,
  `ListId` int(11) NOT NULL,
  `Encounter` int(11) NOT NULL,
  `Resolved` tinyint(1) NOT NULL,
  PRIMARY KEY  (`Pid`,`ListId`,`Encounter`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `IssueTypes`
--

DROP TABLE IF EXISTS `IssueTypes`;
CREATE TABLE `IssueTypes` (
    `Active` tinyint(1) NOT NULL DEFAULT '1',
    `Category` varchar(75) NOT NULL DEFAULT '',
    `Type` varchar(75) NOT NULL DEFAULT '',
    `Plural` varchar(75) NOT NULL DEFAULT '',
    `Singular` varchar(75) NOT NULL DEFAULT '',
    `Abbreviation` varchar(75) NOT NULL DEFAULT '',
    `Style` smallint(6) NOT NULL DEFAULT '0',
    `ForceShow` smallint(6) NOT NULL DEFAULT '0',
    `Ordering` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`Category`,`Type`)
) ENGINE=InnoDB;

--
-- Dumping data for table `IssueTypes`
--

INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('10','Default','MedicalProblem','Medical Problems','Problem','P','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('30','Default','Medication','Medications','Medication','M','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('20','Default','Allergy','Allergies','Allergy','A','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('40','Default','Surgery','Surgeries','Surgery','S','0','0');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('50','Default','Dental','Dental Issues','Dental','D','0','0');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('10','IppfSpecific','MedicalProblem','Medical Problems','Problem','P','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('30','IppfSpecific','Medication','Medications','Medication','M','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('20','IppfSpecific','Allergy','Allergies','Allergy','Y','0','1');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('40','IppfSpecific','Surgery','Surgeries','Surgery','S','0','0');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('50','IppfSpecific','IppfGcac','Abortions','Abortion','A','3','0');
INSERT INTO issueTypes(`Ordering`,`Category`,`Type`,`Plural`,`Singular`,`Abbreviation`,`Style`,`ForceShow`) VALUES ('60','IppfSpecific','Contraceptive','Contraception','Contraception','C','4','0');

-- --------------------------------------------------------

-- 
-- Table structure for table `LangConstants`
-- 

DROP TABLE IF EXISTS `LangConstants`;
CREATE TABLE `LangConstants` (
  `ConsId` int(11) NOT NULL AUTO_INCREMENT,
  `ConstantName` mediumtext BINARY,
  UNIQUE KEY `ConsId` (`ConsId`),
  KEY `ConstantName` (`ConstantName`(100))
) ENGINE=InnoDB ;

-- 
-- Table structure for table `LangDefinitions`
-- 

DROP TABLE IF EXISTS `LangDefinitions`;
CREATE TABLE `LangDefinitions` (
  `DefId` int(11) NOT NULL AUTO_INCREMENT,
  `ConsId` int(11) NOT NULL default '0',
  `LangId` int(11) NOT NULL default '0',
  `Definition` mediumtext,
  UNIQUE KEY `DefId` (`DefId`),
  KEY `ConsId` (`ConsId`)
) ENGINE=InnoDB ;

-- 
-- Table structure for table `LangLanguages`
-- 

DROP TABLE IF EXISTS `LangLanguages`;
CREATE TABLE `LangLanguages` (
  `LangId` int(11) NOT NULL AUTO_INCREMENT,
  `LangCode` char(2) NOT NULL default '',
  `LangDescription` varchar(100) default NULL,
  `LangIsRtl` TINYINT DEFAULT 0 COMMENT 'Set this to 1 for RTL languages Arabic,Farsi,Hebrew,Urdu etc.',
  UNIQUE KEY `LangId` (`LangId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `LangLanguages`
-- 

INSERT INTO `LangLanguages` VALUES (1, 'En', 'English', 0);

-- --------------------------------------------------------

--
-- Table structure for table `LangCustom`
--

DROP TABLE IF EXISTS `LangCustom`;
CREATE TABLE `LangCustom` (
  `LangDescription` varchar(100) NOT NULL default '',
  `LangCode` char(2) NOT NULL default '',
  `ConstantName` mediumtext,
  `Definition` mediumtext
) ENGINE=InnoDB ;

-- --------------------------------------------------------

-- 
-- Table structure for table `LayoutOptions`
-- 

DROP TABLE IF EXISTS `LayoutOptions`;
CREATE TABLE `LayoutOptions` (
  `FormId` varchar(31) NOT NULL default '',
  `FieldId` varchar(31) NOT NULL default '',
  `GroupName` varchar(31) NOT NULL default '',
  `Title` varchar(63) NOT NULL default '',
  `Seq` int(11) NOT NULL default '0',
  `DataType` tinyint(3) NOT NULL default '0',
  `Uor` tinyint(1) NOT NULL default '1',
  `FldLength` int(11) NOT NULL default '15',
  `MaxLength` int(11) NOT NULL default '0',
  `ListId` varchar(31) NOT NULL default '',
  `Titlecols` tinyint(3) NOT NULL default '1',
  `Datacols` tinyint(3) NOT NULL default '1',
  `DefaultValue` varchar(255) NOT NULL default '',
  `EditOptions` varchar(36) NOT NULL default '',
  `Description` text,
  `FldRows` int(11) NOT NULL default '0',
  `ListBackupId` varchar(31) NOT NULL default '',
  `Source` char(1) NOT NULL default 'F' COMMENT 'F=Form,D=Demographics,H=History,E=Encounter',
  `Conditions` text COMMENT 'Serialized array of skip conditions',
  PRIMARY KEY  (`FormId`,`FieldId`,`Seq`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `LayoutOptions`
-- 

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Title', '1Who', 'Name', 1, 1, 1, 0, 0, 'Titles', 1, 1, '', 'N', 'Title', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Fname', '1Who', '', 2, 2, 2, 10, 63, '', 0, 0, '', 'CD', 'First Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Mname', '1Who', '', 3, 2, 1, 2, 63, '', 0, 0, '', 'C', 'Middle Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Lname', '1Who', '', 4, 2, 2, 10, 63, '', 0, 0, '', 'CD', 'Last Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Pubpid', '1Who', 'External ID', 5, 2, 1, 10, 15, '', 1, 1, '', 'ND', 'External identifier', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'DOB', '1Who', 'DOB', 6, 4, 2, 10, 10, '', 1, 1, '', 'D', 'Date of Birth', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Sex', '1Who', 'Sex', 7, 1, 2, 0, 0, 'Sex', 1, 1, '', 'N', 'Sex', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Ss', '1Who', 'S.S.', 8, 2, 1, 11, 11, '', 1, 1, '', '', 'Social Security Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'DriversLicense', '1Who', 'License/ID', 9, 2, 1, 15, 63, '', 1, 1, '', '', 'Drivers License or State ID', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Status', '1Who', 'Marital Status', 10, 1, 1, 0, 0, 'Marital', 1, 3, '', '', 'Marital Status', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Genericname1', '1Who', 'User Defined', 11, 2, 1, 15, 63, '', 1, 3, '', '', 'User Defined Field', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Genericval1', '1Who', '', 12, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Genericname2', '1Who', '', 13, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Genericval2', '1Who', '', 14, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Squad', '1Who', 'Squad', 15, 13, 0, 0, 0, '', 1, 3, '', '', 'Squad Membership', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Pricelevel', '1Who', 'Price Level', 16, 1, 0, 0, 0, 'Pricelevel', 1, 1, '', '', 'Discount Level', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'BillingNote', '1Who', 'Billing Note', 17, 2, 1, 60, 0, '', 1, 3, '', '', 'Patient Level Billing Note (Collections)', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Street', '2Contact', 'Address', 1, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Street and Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'City', '2Contact', 'City', 2, 2, 1, 15, 63, '', 1, 1, '', 'C', 'City Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'State', '2Contact', 'State', 3, 26, 1, 0, 0, 'State', 1, 1, '', '', 'State/Locality', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PostalCode', '2Contact', 'Postal Code', 4, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'CountryCode', '2Contact', 'Country', 5, 26, 1, 0, 0, 'Country', 1, 1, '', '', 'Country', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'County', '2Contact', 'County', 5, 26, 1, 0, 0, 'County', 1, 1, '', '', 'County', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Mothersname', '2Contact', 'Mother''S Name', 6, 2, 1, 20, 63, '', 1, 1, '', '', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ContactRelationship', '2Contact', 'Emergency Contact', 8, 2, 1, 10, 63, '', 1, 1, '', 'C', 'Emergency Contact Person', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PhoneContact', '2Contact', 'Emergency Phone', 9, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Emergency Contact Phone Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PhoneHome', '2Contact', 'Home Phone', 10, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Home Phone Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PhoneBiz', '2Contact', 'Work Phone', 11, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Work Phone Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PhoneCell', '2Contact', 'Mobile Phone', 12, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Cell Phone Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Email', '2Contact', 'Contact Email', 13, 2, 1, 30, 95, '', 1, 1, '', '', 'Contact Email Address', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmailDirect', '2Contact', 'Trusted Email', 14, 2, 1, 30, 95, '', 1, 1, '', '', 'Trusted Direct Email Address', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ProviderID', '3Choices', 'Provider', 1, 11, 1, 0, 0, '', 1, 3, '', '', 'Provider', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'RefProviderID', '3Choices', 'Referring Provider', 2, 11, 1, 0, 0, '', 1, 3, '', '', 'Referring Provider', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PharmacyId', '3Choices', 'Pharmacy', 3, 12, 1, 0, 0, '', 1, 3, '', '', 'Preferred Pharmacy', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaNotice', '3Choices', 'HIPAA Notice Received', 4, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', 'Did you receive a copy of the HIPAA Notice?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaVoice', '3Choices', 'Allow Voice Message', 5, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', 'Allow telephone messages?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaMessage', '3Choices', 'Leave Message With', 6, 2, 1, 20, 63, '', 1, 1, '', '', 'With whom may we leave a message?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaMail', '3Choices', 'Allow Mail Message', 7, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', 'Allow email messages?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaAllowsms'  , '3Choices', 'Allow SMS'  , 8, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', 'Allow SMS (Text messages)?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'HipaaAllowemail', '3Choices', 'Allow Email', 9, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', 'Allow Email?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'AllowImmRegUse', '3Choices', 'Allow Immunization Registry Use', 10, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'AllowImmInfoShare', '3Choices', 'Allow Immunization Info Sharing', 11, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'AllowHealthInfoEx', '3Choices', 'Allow Health Information Exchange', 12, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'AllowPatientPortal', '3Choices', 'Allow Patient Portal', 13, 1, 1, 0, 0, 'Yesno', 1, 1, '', '', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'CareTeam', '3Choices', 'Care Team', 14, 11, 1, 0, 0, '', 1, 1, '', '', '', 0) ;
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'CmsportalLogin', '3Choices', 'CMS Portal Login', 15, 2, 1, 30, 60, '', 1, 1, '', '', 'CMS Portal Login ID', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ImmRegStatus'  , '3Choices', 'Immunization Registry Status'  ,16, 1, 1,1,0, 'ImmunizationRegistryStatus', 1, 1, '', '', 'Immunization Registry Status', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ImmRegStatEffdate'  , '3Choices', 'Immunization Registry Status Effective Date'  ,17, 4, 1,10,10, '', 1, 1, '', '', 'Immunization Registry Status Effective Date', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PublicityCode'  , '3Choices', 'Publicity Code'  ,18, 1, 1,1,0, 'PublicityCode', 1, 1, '', '', 'Publicity Code', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'PublCodeEffDate'  , '3Choices', 'Publicity Code Effective Date'  ,19, 4, 1,10,10, '', 1, 1, '', '', 'Publicity Code Effective Date', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ProtectIndicator'  , '3Choices', 'Protection Indicator'  ,20, 1, 1,1,0, 'Yesno', 1, 1, '', '', 'Protection Indicator', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ProtIndiEffdate'  , '3Choices', 'Protection Indicator Effective Date'  ,21, 4, 1,10,10, '', 1, 1, '', '', 'Protection Indicator Effective Date', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Occupation', '4Employer', 'Occupation', 1, 26, 1, 0, 0, 'Occupation', 1, 1, '', '', 'Occupation', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Industry', '4Employer', 'Industry', 1, 26, 1, 0, 0, 'Industry', 1, 1, '', '', 'Industry', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmName', '4Employer', 'Employer Name', 2, 2, 1, 20, 63, '', 1, 1, '', 'C', 'Employer Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmStreet', '4Employer', 'Employer Address', 3, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Street and Number', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmCity', '4Employer', 'City', 4, 2, 1, 15, 63, '', 1, 1, '', 'C', 'City Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmState', '4Employer', 'State', 5, 26, 1, 0, 0, 'State', 1, 1, '', '', 'State/Locality', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmPostalCode', '4Employer', 'Postal Code', 6, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'EmCountry', '4Employer', 'Country', 7, 26, 1, 0, 0, 'Country', 1, 1, '', '', 'Country', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Language', '5Stats', 'Language', 1, 1, 1, 0, 0, 'Language', 1, 3, '', '', 'Preferred Language', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`,`ListBackupId`) VALUES ('DEM', 'Ethnicity', '5Stats', 'Ethnicity', 2, 33, 1, 0, 0, 'Ethnicity', 1, 1, '', '', 'Ethnicity', 0, 'Ethrace');
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`,`ListBackupId`) VALUES ('DEM', 'Race', '5Stats', 'Race', 3, 36, 1, 0, 0, 'Race', 1, 1, '', '', 'Race', 0, 'Ethrace');
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'FinancialReview', '5Stats', 'Financial Review Date', 4, 2, 1, 10, 20, '', 1, 1, '', 'D', 'Financial Review Date', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'FamilySize', '5Stats', 'Family Size', 4, 2, 1, 20, 63, '', 1, 1, '', '', 'Family Size', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'MonthlyIncome', '5Stats', 'Monthly Income', 5, 2, 1, 20, 63, '', 1, 1, '', '', 'Monthly Income', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Homeless', '5Stats', 'Homeless,Etc.', 6, 2, 1, 20, 63, '', 1, 1, '', '', 'Homeless or similar?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Interpretter', '5Stats', 'Interpreter', 7, 2, 1, 20, 63, '', 1, 1, '', '', 'Interpreter needed?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Migrantseasonal', '5Stats', 'Migrant/Seasonal', 8, 2, 1, 20, 63, '', 1, 1, '', '', 'Migrant or seasonal worker?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Contrastart', '5Stats', 'Contraceptives Start',9,4,0,10,10,'',1,1,'','','Date contraceptive services initially provided', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'ReferralSource', '5Stats', 'Referral Source',10, 26, 1, 0, 0, 'Refsource', 1, 1, '', '', 'How did they hear about us', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Vfc', '5Stats', 'VFC', 12, 1, 1, 20, 0, 'Eligibility', 1, 1, '', '', 'Eligibility status for Vaccine for Children supplied vaccine', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Religion', '5Stats', 'Religion', 13, 1, 1, 0, 0, 'ReligiousAffiliation', 1, 3, '', '', 'Patient Religion', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'DeceasedDate', '6Misc', 'Date Deceased', 1, 4, 1, 20, 20, '', 1, 3, '', 'D', 'If person is deceased,Then enter date of death.', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'DeceasedReason', '6Misc', 'Reason Deceased', 2, 2, 1, 30, 255, '', 1, 3, '', '', 'Reason for Death', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext1', '6Misc', 'User Defined Text 1', 3, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext2', '6Misc', 'User Defined Text 2', 4, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext3', '6Misc', 'User Defined Text 3', 5,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext4', '6Misc', 'User Defined Text 4', 6,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext5', '6Misc', 'User Defined Text 5', 7,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext6', '6Misc', 'User Defined Text 6', 8,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext7', '6Misc', 'User Defined Text 7', 9,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Usertext8', '6Misc', 'User Defined Text 8',10,2,0,10,63,'',1,1,'','','User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist1', '6Misc', 'User Defined List 1',11, 1, 0, 0, 0, 'Userlist1', 1, 1, '', '', 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist2', '6Misc', 'User Defined List 2',12, 1, 0, 0, 0, 'Userlist2', 1, 1, '', '', 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist3', '6Misc', 'User Defined List 3',13, 1, 0, 0, 0, 'Userlist3', 1, 1, '', '' , 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist4', '6Misc', 'User Defined List 4',14, 1, 0, 0, 0, 'Userlist4', 1, 1, '', '' , 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist5', '6Misc', 'User Defined List 5',15, 1, 0, 0, 0, 'Userlist5', 1, 1, '', '' , 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist6', '6Misc', 'User Defined List 6',16, 1, 0, 0, 0, 'Userlist6', 1, 1, '', '' , 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Userlist7', '6Misc', 'User Defined List 7',17, 1, 0, 0, 0, 'Userlist7', 1, 1, '', '' , 'User Defined', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Regdate'  , '6Misc', 'Registration Date'  ,18, 4, 0,10,10, ''         , 1, 1, '', 'D', 'Start Date at This Clinic', 0);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferDate'      ,'1Referral','Referral Date'                  , 1, 4,2, 0,  0,''         ,1,1,'C','D','Date of referral', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferFrom'      ,'1Referral','Refer By'                       , 2,10,2, 0,  0,''         ,1,1,'' ,'' ,'Referral By', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferExternal'  ,'1Referral','External Referral'              , 3, 1,1, 0,  0,'Boolean'  ,1,1,'' ,'' ,'External referral?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferTo'        ,'1Referral','Refer To'                       , 4,14,2, 0,  0,''         ,1,1,'' ,'' ,'Referral To', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','Body'            ,'1Referral','Reason'                         , 5, 3,2,30,  0,''         ,1,1,'' ,'' ,'Reason for referral', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferDiag'      ,'1Referral','Referrer Diagnosis'             , 6, 2,1,30,255,''         ,1,1,'' ,'X','Referrer diagnosis', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferRiskLevel','1Referral','Risk Level'                     , 7, 1,1, 0,  0,'Risklevel',1,1,'' ,'' ,'Level of urgency', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferVitals'    ,'1Referral','Include Vitals'                 , 8, 1,1, 0,  0,'Boolean'  ,1,1,'' ,'' ,'Include vitals data?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReferRelatedCode','1Referral','Requested Service'            , 9,15,1,30,255,''         ,1,1,'' ,'' ,'Billing Code for Requested Service', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyDate'      ,'2Counter-Referral','Reply Date'             ,10, 4,1, 0,  0,''         ,1,1,'' ,'D','Date of reply', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyFrom'      ,'2Counter-Referral','Reply From'             ,11, 2,1,30,255,''         ,1,1,'' ,'' ,'Who replied?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyInitDiag' ,'2Counter-Referral','Presumed Diagnosis'     ,12, 2,1,30,255,''         ,1,1,'' ,'' ,'Presumed diagnosis by specialist', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyFinalDiag','2Counter-Referral','Final Diagnosis'        ,13, 2,1,30,255,''         ,1,1,'' ,'' ,'Final diagnosis by specialist', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyDocuments' ,'2Counter-Referral','Documents'              ,14, 2,1,30,255,''         ,1,1,'' ,'' ,'Where may related scanned or paper documents be found?', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyFindings'  ,'2Counter-Referral','Findings'               ,15, 3,1,30,  0,''         ,1,1,'' ,'' ,'Findings by specialist', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyServices'  ,'2Counter-Referral','Services Provided'      ,16, 3,1,30,  0,''         ,1,1,'' ,'' ,'Service provided by specialist', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyRecommend' ,'2Counter-Referral','Recommendations'        ,17, 3,1,30,  0,''         ,1,1,'' ,'' ,'Recommendations by specialist', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTref','ReplyRxRefer'  ,'2Counter-Referral','Prescriptions/Referrals',18, 3,1,30,  0,''         ,1,1,'' ,'' ,'Prescriptions and/or referrals by specialist', 3);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTptreq','Body','1','Details',10,3,2,30,0,'',1,3,'','','Content',5);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTphreq','Body','1','Details',10,3,2,30,0,'',1,3,'','','Content',5);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTlegal','Body','1','Details',10,3,2,30,0,'',1,3,'','','Content',5);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('LBTbill' ,'Body','1','Details',10,3,2,30,0,'',1,3,'','','Content',5);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Usertext11'       ,'1General'       ,'Risk Factors',1,21,1,0,0,'Riskfactors',1,1,'','' ,'Risk Factors', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Exams'            ,'1General'       ,'Exams/Tests' ,2,23,1,0,0,'Exams'      ,1,1,'','' ,'Exam and test results', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HistoryFather'   ,'2Family History','Father'                 , 1, 2,1,20,  0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','DcFather'        ,'2Family History','Diagnosis Code'         , 2,15,1, 0,255,'',1,1,'','', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HistoryMother'   ,'2Family History','Mother'                 , 3, 2,1,20,  0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','DcMother'        ,'2Family History','Diagnosis Code'         , 4,15,1, 0,255,'',1,1,'','', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HistorySiblings' ,'2Family History','Siblings'               , 5, 2,1,20,  0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','DcSiblings'      ,'2Family History','Diagnosis Code'         , 6,15,1, 0,255,'',1,1,'','', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HistorySpouse'   ,'2Family History','Spouse'                 , 7, 2,1,20,  0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','DcSpouse'        ,'2Family History','Diagnosis Code'         , 8,15,1, 0,255,'',1,1,'','', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HistoryOffspring','2Family History','Offspring'              , 9, 2,1,20,  0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','DcOffspring'     ,'2Family History','Diagnosis Code'         ,10,15,1, 0,255,'',1,1,'','', '', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesCancer'             ,'3Relatives','Cancer'             ,1, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesTuberculosis'       ,'3Relatives','Tuberculosis'       ,2, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesDiabetes'           ,'3Relatives','Diabetes'           ,3, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesHighBloodPressure','3Relatives','High Blood Pressure',4, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesHeartProblems'     ,'3Relatives','Heart Problems'     ,5, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesStroke'             ,'3Relatives','Stroke'             ,6, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesEpilepsy'           ,'3Relatives','Epilepsy'           ,7, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesMentalIllness'     ,'3Relatives','Mental Illness'     ,8, 2,1,20,0,'',1,1,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RelativesSuicide'            ,'3Relatives','Suicide'            ,9, 2,1,20,0,'',1,3,'','' ,'', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Coffee'              ,'4Lifestyle','Coffee'              ,2,28,1,20,0,'',1,3,'','' ,'Caffeine consumption', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Tobacco'             ,'4Lifestyle','Tobacco'             ,1,32,1,0,0,'SmokingStatus',1,3,'','' ,'Tobacco use', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Alcohol'             ,'4Lifestyle','Alcohol'             ,3,28,1,20,0,'',1,3,'','' ,'Alcohol consumption', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','RecreationalDrugs'  ,'4Lifestyle','Recreational Drugs'  ,4,28,1,20,0,'',1,3,'','' ,'Recreational drug use', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Counseling'          ,'4Lifestyle','Counseling'          ,5,28,1,20,0,'',1,3,'','' ,'Counseling activities', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','ExercisePatterns'   ,'4Lifestyle','Exercise Patterns'   ,6,28,1,20,0,'',1,3,'','' ,'Exercise patterns', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','HazardousActivities','4Lifestyle','Hazardous Activities',7,28,1,20,0,'',1,3,'','' ,'Hazardous activities', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','SleepPatterns'      ,'4Lifestyle','Sleep Patterns'      ,8, 2,1,20,0,'',1,3,'','' ,'Sleep patterns', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','SeatbeltUse'        ,'4Lifestyle','Seatbelt Use'        ,9, 2,1,20,0,'',1,3,'','' ,'Seatbelt use', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Name1'            ,'5Other','Name/Value'        ,1, 2,1,10,255,'',1,1,'','' ,'Name 1', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Value1'           ,'5Other',''                  ,2, 2,1,10,255,'',0,0,'','' ,'Value 1', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Name2'            ,'5Other','Name/Value'        ,3, 2,1,10,255,'',1,1,'','' ,'Name 2', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Value2'           ,'5Other',''                  ,4, 2,1,10,255,'',0,0,'','' ,'Value 2', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','AdditionalHistory','5Other','Additional History',5, 3,1,30,  0,'',1,3,'' ,'' ,'Additional history notes', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Userarea11'        ,'5Other','User Defined Area 11',6,3,0,30,0,'',1,3,'','','User Defined', 3);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('HIS','Userarea12'        ,'5Other','User Defined Area 12',7,3,0,30,0,'',1,3,'','','User Defined', 3);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('FACUSR', 'ProviderId', '1General', 'Provider ID', 1, 2, 1, 15, 63, '', 1, 1, '', '', 'Provider ID at Specified Facility', 0);

INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardiansname'  , '8Guardian', 'Name'  ,10, 2, 1,25,63, '', 1, 1, '', '', 'Guardian Name', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianrelationship'  , '8Guardian', 'Relationship'  ,20, 1, 1,0,0, 'NextOfKinRelationship', 1, 1, '', '', 'Relationship', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardiansex'  , '8Guardian', 'Sex'  ,30, 1, 1,0,0, 'Sex', 1, 1, '', '', 'Sex', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianaddress'  , '8Guardian', 'Address'  ,40, 2, 1,25,63, '', 1, 1, '', '', 'Address', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardiancity'  , '8Guardian', 'City'  ,50, 2, 1,15,63, '', 1, 1, '', '', 'City', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianstate'  , '8Guardian', 'State'  ,60, 26, 1,0,0, 'State', 1, 1, '', '', 'State', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianpostalcode'  , '8Guardian', 'Postal Code'  ,70, 2, 1,6,63, '', 1, 1, '', '', 'Postal Code', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardiancountry'  , '8Guardian', 'Country'  ,80, 26, 1,0,0, 'Country', 1, 1, '', '', 'Country', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianphone'  , '8Guardian', 'Phone'  ,90, 2, 1,20,63, '', 1, 1, '', '', 'Phone', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianworkphone'  , '8Guardian', 'Work Phone'  ,100, 2, 1,20,63, '', 1, 1, '', '', 'Work Phone', 0);
INSERT INTO `LayoutOptions` (`FormId`,`FieldId`,`GroupName`,`Title`,`Seq`,`DataType`,`Uor`,`FldLength`,`MaxLength`,`ListId`,`Titlecols`,`Datacols`,`DefaultValue`,`EditOptions`,`Description`,`FldRows`) VALUES ('DEM', 'Guardianemail'  , '8Guardian', 'Email'  ,110, 2, 1,20,63, '', 1, 1, '', '', 'Guardian Email Address', 0);
-- --------------------------------------------------------

-- 
-- Table structure for table `ListOptions`
-- 

DROP TABLE IF EXISTS `ListOptions`;
CREATE TABLE `ListOptions` (
  `ListId` varchar(31) NOT NULL default '',
  `OptionId` varchar(31) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `Seq` int(11) NOT NULL default '0',
  `IsDefault` tinyint(1) NOT NULL default '0',
  `OptionValue` float NOT NULL default '0',
  `Mapping` varchar(31) NOT NULL DEFAULT '',
  `Notes` varchar(255) NOT NULL DEFAULT '',
  `Codes` varchar(255) NOT NULL DEFAULT '',
  `ToggleSetting1` tinyint(1) NOT NULL default '0',
  `ToggleSetting2` tinyint(1) NOT NULL default '0',
  `Activity` TINYINT DEFAULT 1 NOT NULL,
  `Subtype` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY  (`ListId`,`OptionId`)
) ENGINE=InnoDB;

-- 
-- Dumping data for table `ListOptions`
-- 

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Yesno', 'NO', 'NO', 1, 0, 'N');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Yesno', 'YES', 'YES', 2, 0, 'Y');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Titles', 'Mr.', 'Mr.', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Titles', 'Mrs.', 'Mrs.', 2, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Titles', 'Ms.', 'Ms.', 3, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Titles', 'Dr.', 'Dr.', 4, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Sex', 'Female', 'Female', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Sex', 'Male', 'Male', 2, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Married', 'Married', 1, 0, 'M');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Single', 'Single', 2, 0, 'S');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Divorced', 'Divorced', 3, 0, 'D');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Widowed', 'Widowed', 4, 0, 'W');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Separated', 'Separated', 5, 0, 'L');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Marital', 'Domestic partner', 'Domestic Partner', 6, 0, 'T');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue ) VALUES ('Language', 'DeclneToSpecfy', 'Declined To Specify', 0, 0, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Abkhazian', 'Abkhazian', 10, 0, 0, 'Abk');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Afar', 'Afar', 20, 0, 0, 'Aar');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Afrikaans', 'Afrikaans', 30, 0, 0, 'Afr');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Akan', 'Akan', 40, 0, 0, 'Aka');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Albanian', 'Albanian', 50, 0, 0, 'Alb(B)|sqi(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Amharic', 'Amharic', 60, 0, 0, 'Amh');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Arabic', 'Arabic', 70, 0, 0, 'Ara');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Aragonese', 'Aragonese', 80, 0, 0, 'Arg');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Armenian', 'Armenian', 90, 0, 0, 'Arm(B)|hye(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Assamese', 'Assamese', 100, 0, 0, 'Asm');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Avaric', 'Avaric', 110, 0, 0, 'Ava');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Avestan', 'Avestan', 120, 0, 0, 'Ave');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Aymara', 'Aymara', 130, 0, 0, 'Aym');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Azerbaijani', 'Azerbaijani', 140, 0, 0, 'Aze');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bambara', 'Bambara', 150, 0, 0, 'Bam');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bashkir', 'Bashkir', 160, 0, 0, 'Bak');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Basque', 'Basque', 170, 0, 0, 'Baq(B)|eus(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Belarusian', 'Belarusian', 180, 0, 0, 'Bel');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bengali', 'Bengali', 190, 0, 0, 'Ben');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'BihariLanguages', 'Bihari languages', 200, 0, 0, 'Bih');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bislama', 'Bislama', 210, 0, 0, 'Bis');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'BokmalNorwegianNorwegianBok', 'BokmÜl,Norwegian; Norwegian BokmÜl', 220, 0, 0, 'Nob');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bosnian', 'Bosnian', 230, 0, 0, 'Bos');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Breton', 'Breton', 240, 0, 0, 'Bre');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Bulgarian', 'Bulgarian', 250, 0, 0, 'Bul');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Burmese', 'Burmese', 260, 0, 0, 'Bur(B)|mya(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'CatalanValencian', 'Catalan; Valencian', 270, 0, 0, 'Cat');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'CentralKhmer', 'Central Khmer', 280, 0, 0, 'Khm');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Chamorro', 'Chamorro', 290, 0, 0, 'Cha');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Chechen', 'Chechen', 300, 0, 0, 'Che');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'ChichewaChewaNyanja', 'Chichewa; Chewa; Nyanja', 310, 0, 0, 'Nya');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Chinese', 'Chinese', 320, 0, 0, 'Chi(B)|zho(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'ChurchSlavicOldSlavonicChu', 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic', 330, 0, 0, 'Chu');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Chuvash', 'Chuvash', 340, 0, 0, 'Chv');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Cornish', 'Cornish', 350, 0, 0, 'Cor');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Corsican', 'Corsican', 360, 0, 0, 'Cos');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Cree', 'Cree', 370, 0, 0, 'Cre');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Croatian', 'Croatian', 380, 0, 0, 'Hrv');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Czech', 'Czech', 390, 0, 0, 'Cze(B)|ces(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Danish', 'Danish', 400, 0, 0, 'Dan');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'DivehiDhivehiMaldivian', 'Divehi; Dhivehi; Maldivian', 410, 0, 0, 'Div');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'DutchFlemish', 'Dutch; Flemish', 420, 0, 0, 'Dut(B)|nld(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Dzongkha', 'Dzongkha', 430, 0, 0, 'Dzo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'English', 'English', 440, 0, 0, 'Eng');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Esperanto', 'Esperanto', 450, 0, 0, 'Epo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Estonian', 'Estonian', 460, 0, 0, 'Est');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ewe', 'Ewe', 470, 0, 0, 'Ewe');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Faroese', 'Faroese', 480, 0, 0, 'Fao');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Fijian', 'Fijian', 490, 0, 0, 'Fij');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Finnish', 'Finnish', 500, 0, 0, 'Fin');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'French', 'French', 510, 0, 0, 'Fre(B)|fra(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Fulah', 'Fulah', 520, 0, 0, 'Ful');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'GaelicScottishGaelic', 'Gaelic; Scottish Gaelic', 530, 0, 0, 'Gla');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Galician', 'Galician', 540, 0, 0, 'Glg');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ganda', 'Ganda', 550, 0, 0, 'Lug');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Georgian', 'Georgian', 560, 0, 0, 'Geo(B)|kat(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'German', 'German', 570, 0, 0, 'Ger(B)|deu(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Greek', 'Greek,Modern (1453-)', 580, 0, 0, 'Gre(B)|ell(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Guarani', 'Guarani', 590, 0, 0, 'Grn');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Gujarati', 'Gujarati', 600, 0, 0, 'Guj');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'HaitianHaitianCreole', 'Haitian; Haitian Creole', 610, 0, 0, 'Hat');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Hausa', 'Hausa', 620, 0, 0, 'Hau');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Hebrew', 'Hebrew', 630, 0, 0, 'Heb');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Herero', 'Herero', 640, 0, 0, 'Her');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Hindi', 'Hindi', 650, 0, 0, 'Hin');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'HiriMotu', 'Hiri Motu', 660, 0, 0, 'Hmo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Hungarian', 'Hungarian', 670, 0, 0, 'Hun');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Icelandic', 'Icelandic', 680, 0, 0, 'Ice(B)|isl(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ido', 'Ido', 690, 0, 0, 'Ido');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Igbo', 'Igbo', 700, 0, 0, 'Ibo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Indonesian', 'Indonesian', 710, 0, 0, 'Ind');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'InterlinguaInternationalAuxi', 'Interlingua (International Auxiliary Language Association)', 720, 0, 0, 'Ina');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'InterlingueOccidental', 'Interlingue; Occidental', 730, 0, 0, 'Ile');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Inuktitut', 'Inuktitut', 740, 0, 0, 'Iku');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Inupiaq', 'Inupiaq', 750, 0, 0, 'Ipk');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Irish', 'Irish', 760, 0, 0, 'Gle');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Italian', 'Italian', 770, 0, 0, 'Ita');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Japanese', 'Japanese', 780, 0, 0, 'Jpn');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Javanese', 'Javanese', 790, 0, 0, 'Jav');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'KalaallisutGreenlandic', 'Kalaallisut; Greenlandic', 800, 0, 0, 'Kal');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kannada', 'Kannada', 810, 0, 0, 'Kan');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kanuri', 'Kanuri', 820, 0, 0, 'Kau');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kashmiri', 'Kashmiri', 830, 0, 0, 'Kas');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kazakh', 'Kazakh', 840, 0, 0, 'Kaz');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'KikuyuGikuyu', 'Kikuyu; Gikuyu', 850, 0, 0, 'Kik');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kinyarwanda', 'Kinyarwanda', 860, 0, 0, 'Kin');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'KirghizKyrgyz', 'Kirghiz; Kyrgyz', 870, 0, 0, 'Kir');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Komi', 'Komi', 880, 0, 0, 'Kom');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kongo', 'Kongo', 890, 0, 0, 'Kon');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Korean', 'Korean', 900, 0, 0, 'Kor');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'KuanyamaKwanyama', 'Kuanyama; Kwanyama', 910, 0, 0, 'Kua');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Kurdish', 'Kurdish', 920, 0, 0, 'Kur');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Laotian', 'Lao', 930, 0, 0, 'Lao');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Latin', 'Latin', 940, 0, 0, 'Lat');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Latvian', 'Latvian', 950, 0, 0, 'Lav');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'LimburganLimburgerLimburgish', 'Limburgan; Limburger; Limburgish', 960, 0, 0, 'Lim');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Lingala', 'Lingala', 970, 0, 0, 'Lin');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Lithuanian', 'Lithuanian', 980, 0, 0, 'Lit');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Luba-katanga', 'Luba-Katanga', 990, 0, 0, 'Lub');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'LuxembourgishLetzeburgesch', 'Luxembourgish; Letzeburgesch', 1000, 0, 0, 'Ltz');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Macedonian', 'Macedonian', 1010, 0, 0, 'Mac(B)|mkd(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Malagasy', 'Malagasy', 1020, 0, 0, 'Mlg');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Malay', 'Malay', 1030, 0, 0, 'May(B)|msa(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Malayalam', 'Malayalam', 1040, 0, 0, 'Mal');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Maltese', 'Maltese', 1050, 0, 0, 'Mlt');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Manx', 'Manx', 1060, 0, 0, 'Glv');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Maori', 'Maori', 1070, 0, 0, 'Mao(B)|mri(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Marathi', 'Marathi', 1080, 0, 0, 'Mar');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Marshallese', 'Marshallese', 1090, 0, 0, 'Mah');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Mongolian', 'Mongolian', 1100, 0, 0, 'Mon');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Nauru', 'Nauru', 1110, 0, 0, 'Nau');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'NavajoNavaho', 'Navajo; Navaho', 1120, 0, 0, 'Nav');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'NdebeleNorthNorthNdebele', 'Ndebele,North; North Ndebele', 1130, 0, 0, 'Nde');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'NdebeleSouthSouthNdebele', 'Ndebele,South; South Ndebele', 1140, 0, 0, 'Nbl');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ndonga', 'Ndonga', 1150, 0, 0, 'Ndo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Nepali', 'Nepali', 1160, 0, 0, 'Nep');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'NorthernSami', 'Northern Sami', 1170, 0, 0, 'Sme');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Norwegian', 'Norwegian', 1180, 0, 0, 'Nor');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'NorwegianNynorskNynorskNorw', 'Norwegian Nynorsk; Nynorsk,Norwegian', 1190, 0, 0, 'Nno');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'OccitanPost1500', 'Occitan (Post 1500)', 1200, 0, 0, 'Oci');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ojibwa', 'Ojibwa', 1210, 0, 0, 'Oji');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Oriya', 'Oriya', 1220, 0, 0, 'Ori');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Oromo', 'Oromo', 1230, 0, 0, 'Orm');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'OssetianOssetic', 'Ossetian; Ossetic', 1240, 0, 0, 'Oss');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Pali', 'Pali', 1250, 0, 0, 'Pli');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Persian', 'Persian', 1260, 0, 0, 'Per(B)|fas(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Polish', 'Polish', 1270, 0, 0, 'Pol');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Portuguese', 'Portuguese', 1280, 0, 0, 'Por');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Punjabi', 'Punjabi', 1290, 0, 0, 'Pan');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'PushtoPashto', 'Pushto; Pashto', 1300, 0, 0, 'Pus');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Quechua', 'Quechua', 1310, 0, 0, 'Que');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'RomanianMoldavianMoldovan', 'Romanian; Moldavian; Moldovan', 1320, 0, 0, 'Rum(B)|ron(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Romansh', 'Romansh', 1330, 0, 0, 'Roh');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Rundi', 'Rundi', 1340, 0, 0, 'Run');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Russian', 'Russian', 1350, 0, 0, 'Rus');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Samoan', 'Samoan', 1360, 0, 0, 'Smo');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Sango', 'Sango', 1370, 0, 0, 'Sag');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Sanskrit', 'Sanskrit', 1380, 0, 0, 'San');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Sardinian', 'Sardinian', 1390, 0, 0, 'Srd');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Serbian', 'Serbian', 1400, 0, 0, 'Srp');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Shona', 'Shona', 1410, 0, 0, 'Sna');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'SichuanYiNuosu', 'Sichuan Yi; Nuosu', 1420, 0, 0, 'Iii');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Sindhi', 'Sindhi', 1430, 0, 0, 'Snd');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'SinhalaSinhalese', 'Sinhala; Sinhalese', 1440, 0, 0, 'Sin');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Slovak', 'Slovak', 1450, 0, 0, 'Slo(B)|slk(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Slovenian', 'Slovenian', 1460, 0, 0, 'Slv');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Somali', 'Somali', 1470, 0, 0, 'Som');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'SothoSouthern', 'Sotho,Southern', 1480, 0, 0, 'Sot');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Spanish', 'Spanish', 1490, 0, 0, 'Spa');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Sundanese', 'Sundanese', 1500, 0, 0, 'Sun');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Swahili', 'Swahili', 1510, 0, 0, 'Swa');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Swati', 'Swati', 1520, 0, 0, 'Ssw');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Swedish', 'Swedish', 1530, 0, 0, 'Swe');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tagalog', 'Tagalog', 1540, 0, 0, 'Tgl');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tahitian', 'Tahitian', 1550, 0, 0, 'Tah');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tajik', 'Tajik', 1560, 0, 0, 'Tgk');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tamil', 'Tamil', 1570, 0, 0, 'Tam');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tatar', 'Tatar', 1580, 0, 0, 'Tat');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Telugu', 'Telugu', 1590, 0, 0, 'Tel');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Thai', 'Thai', 1600, 0, 0, 'Tha');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tibetan', 'Tibetan', 1610, 0, 0, 'Tib(B)|bod(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tigrinya', 'Tigrinya', 1620, 0, 0, 'Tir');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'TongaTongaIslands', 'Tonga (Tonga Islands)', 1630, 0, 0, 'Ton');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tsonga', 'Tsonga', 1640, 0, 0, 'Tso');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Tswana', 'Tswana', 1650, 0, 0, 'Tsn');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Turkish', 'Turkish', 1660, 0, 0, 'Tur');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Turkmen', 'Turkmen', 1670, 0, 0, 'Tuk');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Twi', 'Twi', 1680, 0, 0, 'Twi');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'UighurUyghur', 'Uighur; Uyghur', 1690, 0, 0, 'Uig');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Ukrainian', 'Ukrainian', 1700, 0, 0, 'Ukr');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Urdu', 'Urdu', 1710, 0, 0, 'Urd');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Uzbek', 'Uzbek', 1720, 0, 0, 'Uzb');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Venda', 'Venda', 1730, 0, 0, 'Ven');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Vietnamese', 'Vietnamese', 1740, 0, 0, 'Vie');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Volapuk', 'VolapÅk', 1750, 0, 0, 'Vol');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Walloon', 'Walloon', 1760, 0, 0, 'Wln');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Welsh', 'Welsh', 1770, 0, 0, 'Wel(B)|cym(T)');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'WesternFrisian', 'Western Frisian', 1780, 0, 0, 'Fry');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Wolof', 'Wolof', 1790, 0, 0, 'Wol');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Xhosa', 'Xhosa', 1800, 0, 0, 'Xho');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Yiddish', 'Yiddish', 1810, 0, 0, 'Yid');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Yoruba', 'Yoruba', 1820, 0, 0, 'Yor');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'ZhuangChuang', 'Zhuang; Chuang', 1830, 0, 0, 'Zha');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue,Notes ) VALUES ('Language', 'Zulu', 'Zulu', 1840, 0, 0, 'Zul');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue ) VALUES ('Ethrace', 'DeclneToSpecfy', 'Declined To Specify', 0, 0, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Aleut', 'ALEUT', 10,  0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'AmerIndian', 'American Indian', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Asian', 'Asian', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Black', 'Black', 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Cambodian', 'Cambodian', 50, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Caucasian', 'Caucasian', 60, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'CsAmerican', 'Central/South American', 70, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Chinese', 'Chinese', 80, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Cuban', 'Cuban', 90, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Eskimo', 'Eskimo', 100, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Filipino', 'Filipino', 110, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Guamanian', 'Guamanian', 120, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Hawaiian', 'Hawaiian', 130, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Hispanic', 'Hispanic', 140, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'OthrUs', 'Hispanic - Other (Born in US)', 150, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'OthrNonUs', 'Hispanic - Other (Born outside US)', 160, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Hmong', 'Hmong', 170, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Indian', 'Indian', 180, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Japanese', 'Japanese', 190, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Korean', 'Korean', 200, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Laotian', 'Laotian', 210, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Mexican', 'Mexican/MexAmer/Chicano', 220, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Mlt-race', 'Multiracial', 230, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Othr', 'Other', 240, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'OthrSpec', 'Other - Specified', 250, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'PacIsland', 'Pacific Islander', 260, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'PuertoRican', 'Puerto Rican', 270, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Refused', 'Refused To State', 280, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Samoan', 'Samoan', 290, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Spec', 'Specified', 300, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Thai', 'Thai', 310, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Unknown', 'Unknown', 320, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Unspec', 'Unspecified', 330, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Vietnamese', 'Vietnamese', 340, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'White', 'White', 350, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Ethrace', 'Withheld', 'Withheld', 360, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist1', 'Sample', 'Sample', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist2', 'Sample', 'Sample', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist3','Sample','Sample',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist4','Sample','Sample',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist5','Sample','Sample',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist6','Sample','Sample',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Userlist7','Sample','Sample',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Pricelevel', 'Standard', 'Standard', 1, 1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Risklevel', 'Low', 'Low', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Risklevel', 'Medium', 'Medium', 2, 1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Risklevel', 'High', 'High', 3, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Boolean', '0', 'No', 1, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Boolean', '1', 'Yes', 2, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Country', 'USA', 'USA', 1, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','AL','Alabama'             , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','AK','Alaska'              , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','AZ','Arizona'             , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','AR','Arkansas'            , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','CA','California'          , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','CO','Colorado'            , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','CT','Connecticut'         , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','DE','Delaware'            , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','DC','District of Columbia', 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','FL','Florida'             ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','GA','Georgia'             ,11,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','HI','Hawaii'              ,12,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','ID','Idaho'               ,13,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','IL','Illinois'            ,14,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','IN','Indiana'             ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','IA','Iowa'                ,16,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','KS','Kansas'              ,17,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','KY','Kentucky'            ,18,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','LA','Louisiana'           ,19,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','ME','Maine'               ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MD','Maryland'            ,21,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MA','Massachusetts'       ,22,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MI','Michigan'            ,23,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MN','Minnesota'           ,24,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MS','Mississippi'         ,25,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MO','Missouri'            ,26,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','MT','Montana'             ,27,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NE','Nebraska'            ,28,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NV','Nevada'              ,29,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NH','New Hampshire'       ,30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NJ','New Jersey'          ,31,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NM','New Mexico'          ,32,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NY','New York'            ,33,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','NC','North Carolina'      ,34,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','ND','North Dakota'        ,35,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','OH','Ohio'                ,36,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','OK','Oklahoma'            ,37,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','OR','Oregon'              ,38,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','PA','Pennsylvania'        ,39,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','RI','Rhode Island'        ,40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','SC','South Carolina'      ,41,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','SD','South Dakota'        ,42,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','TN','Tennessee'           ,43,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','TX','Texas'               ,44,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','UT','Utah'                ,45,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','VT','Vermont'             ,46,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','VA','Virginia'            ,47,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','WA','Washington'          ,48,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','WV','West Virginia'       ,49,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','WI','Wisconsin'           ,50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('State','WY','Wyoming'             ,51,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Patient'      ,'Patient'      , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Employee'     ,'Employee'     , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Walk-In'      ,'Walk-In'      , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Newspaper'    ,'Newspaper'    , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Radio'        ,'Radio'        , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','T.V.'         ,'T.V.'         , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Direct Mail'  ,'Direct Mail'  , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Coupon'       ,'Coupon'       , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Referral Card','Referral Card', 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Refsource','Other'        ,'Other'        ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Vv' ,'Varicose Veins'                      , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Ht' ,'Hypertension'                        , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Db' ,'Diabetes'                            , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Sc' ,'Sickle Cell'                         , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Fib','Fibroids'                            , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Pid','PID (Pelvic Inflammatory Disease)'   , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Mig','Severe Migraine'                     , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Hd' ,'Heart Disease'                       , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Str','Thrombosis/Stroke'                   , 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Hep','Hepatitis'                           ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Gb' ,'Gall Bladder Condition'              ,11,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Br' ,'Breast Disease'                      ,12,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Dpr','Depression'                          ,13,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','All','Allergies'                           ,14,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Inf','Infertility'                         ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Ast','Asthma'                              ,16,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Ep' ,'Epilepsy'                            ,17,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Cl' ,'Contact Lenses'                      ,18,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Coc','Contraceptive Complication (Specify)',19,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Riskfactors','Oth','Other (Specify)'                     ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Brs','Breast Exam'          , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Cec','Cardiac Echo'         , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Ecg','ECG'                  , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Gyn','Gynecological Exam'   , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Mam','Mammogram'            , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Phy','Physical Exam'        , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Pro','Prostate Exam'        , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Rec','Rectal Exam'          , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Sic','Sigmoid/Colonoscopy'  , 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Ret','Retinal Exam'         ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Flu','Flu Vaccination'      ,11,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Pne','Pneumonia Vaccination',12,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Ldl','LDL'                  ,13,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Hem','Hemoglobin'           ,14,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Exams' ,'Psa','PSA'                  ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugForm','0',''           ,0,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','1','Suspension' ,1,0,'NCI-CONCEPT-ID:C60928');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','2','Tablet'     ,2,0,'NCI-CONCEPT-ID:C42998');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','3','Capsule'    ,3,0,'NCI-CONCEPT-ID:C25158');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','4','Solution'   ,4,0,'NCI-CONCEPT-ID:C42986');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','5','Tsp'        ,5,0,'NCI-CONCEPT-ID:C48544');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','6','Ml'         ,6,0,'NCI-CONCEPT-ID:C28254');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','7','Units'      ,7,0,'NCI-CONCEPT-ID:C44278');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','8','Inhalations',8,0,'NCI-CONCEPT-ID:C42944');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','9','Gtts(Drops)',9,0,'NCI-CONCEPT-ID:C48491');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','10','Cream'   ,10,0,'NCI-CONCEPT-ID:C28944');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','11','Ointment',11,0,'NCI-CONCEPT-ID:C42966');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugForm','12','Puff',12,0,'NCI-CONCEPT-ID:C42944');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','0',''          ,0,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('DrugUnits','1','Mg'    ,1,0,'NCI-CONCEPT-ID:C28253');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','2','Mg/1cc',2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','3','Mg/2cc',3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','4','Mg/3cc',4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','5','Mg/4cc',5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','6','Mg/5cc',6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','7','Mcg'   ,7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','8','Grams' ,8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugUnits','9','ML' ,9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugRoute', '0',''                 , 0,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,Codes ) VALUES ('DrugRoute', '1','Per Oris'         , 1,0, 'PO', 'NCI-CONCEPT-ID:C38288');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '2','Per Rectum'       , 2,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '3','To Skin'          , 3,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '4','To Affected Area' , 4,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '5','Sublingual'       , 5,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '6','OS'               , 6,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '7','OD'               , 7,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '8','OU'               , 8,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', '9','SQ'               , 9,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','10','IM'               ,10,0, 'IM');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','11','IV'               ,11,0, 'IV');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','12','Per Nostril'      ,12,0, 'NS');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','13','Both Ears',13,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','14','Left Ear' ,14,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute','15','Right Ear',15,0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', 'Intradermal', 'Intradermal', 16, 0, 'ID');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', 'Other', 'Other/Miscellaneous', 18, 0, 'OTH');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('DrugRoute', 'Transdermal', 'Transdermal', 19, 0, 'TD');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,Codes ) VALUES ('DrugRoute','Intramuscular','Intramuscular' ,20, 0, 'IM', 'NCI-CONCEPT-ID:C28161');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,Codes ) VALUES ('DrugRoute','Inhale','Inhale' ,16, 0, 'RESPIR', 'NCI-CONCEPT-ID:C38216');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','0',''      ,0,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','1','B.i.d.',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','2','T.i.d.',2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','3','Q.i.d.',3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','4','Q.3h'  ,4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','5','Q.4h'  ,5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','6','Q.5h'  ,6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','7','Q.6h'  ,7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','8','Q.8h'  ,8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','9','Q.d.'  ,9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','10','A.c.'  ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','11','P.c.'  ,11,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','12','A.m.'  ,12,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','13','P.m.'  ,13,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','14','Ante'  ,14,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','15','H'     ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','16','H.s.'  ,16,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','17','P.r.n.',17,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DrugInterval','18','Stat'  ,18,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Chartloc','Fileroom','File Room'              ,1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Boolean'      ,'Boolean'            , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Chartloc'     ,'Chart Storage Locations',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Country'      ,'Country'            , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'DrugForm'    ,'Drug Forms'         , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'DrugUnits'   ,'Drug Units'         , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'DrugRoute'   ,'Drug Routes'        , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'DrugInterval','Drug Intervals'     , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Exams'        ,'Exams/Tests'        , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Feesheet'     ,'Fee Sheet'          , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Language'     ,'Language'           , 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Lbfnames'     ,'Layout-Based Visit Forms',9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Marital'      ,'Marital Status'     ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Pricelevel'   ,'Price Level'        ,11,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Ethrace'      ,'Race/Ethnicity'     ,12,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Refsource'    ,'Referral Source'    ,13,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Riskfactors'  ,'Risk Factors'       ,14,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Risklevel'    ,'Risk Level'         ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Superbill'    ,'Service Category'   ,16,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Sex'          ,'Sex'                ,17,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'State'        ,'State'              ,18,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Taxrate'      ,'Tax Rate'           ,19,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Titles'       ,'Titles'             ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Yesno'        ,'Yes/No'             ,21,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist1'    ,'User Defined List 1',22,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist2'    ,'User Defined List 2',23,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist3'    ,'User Defined List 3',24,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist4'    ,'User Defined List 4',25,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist5'    ,'User Defined List 5',26,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist6'    ,'User Defined List 6',27,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists' ,'Userlist7'    ,'User Defined List 7',28,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'    ,'Adjreason'      ,'Adjustment Reasons',1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Adm adjust'     ,'Adm adjust'     , 5,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','After hrs calls','After hrs calls',10,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Bad check'      ,'Bad check'      ,15,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Bad debt'       ,'Bad debt'       ,20,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Coll w/o'       ,'Coll w/o'       ,25,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Discount'       ,'Discount'       ,30,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Hardship w/o'   ,'Hardship w/o'   ,35,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Ins adjust'     ,'Ins adjust'     ,40,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Ins bundling'   ,'Ins bundling'   ,45,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Ins overpaid'   ,'Ins overpaid'   ,50,5);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Ins refund'     ,'Ins refund'     ,55,5);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Pt overpaid'    ,'Pt overpaid'    ,60,5);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Pt refund'      ,'Pt refund'      ,65,5);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Pt released'    ,'Pt released'    ,70,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Sm debt w/o'    ,'Sm debt w/o'    ,75,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','To copay'       ,'To copay'       ,80,2);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','To ded\'Ble'    ,'To ded\'Ble'    ,85,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('Adjreason','Untimely filing','Untimely filing',90,1);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'       ,'SubRelation','Subscriber Relationship',18,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('SubRelation','Self'        ,'Self'                   , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('SubRelation','Spouse'      ,'Spouse'                 , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('SubRelation','Child'       ,'Child'                  , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('SubRelation','Other'       ,'Other'                  , 4,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'     ,'Occurrence','Occurrence'                  ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','0'         ,'Unknown or N/A'              , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','1'         ,'First'                       ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','6'         ,'Early Recurrence (<2 Mo)'    ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','7'         ,'Late Recurrence (2-12 Mo)'   ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','8'         ,'Delayed Recurrence (> 12 Mo)',25,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','4'         ,'Chronic/Recurrent'           ,30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Occurrence','5'         ,'Acute on Chronic'            ,35,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'  ,'Outcome','Outcome'         ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','0'      ,'Unassigned'      , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','1'      ,'Resolved'        , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','2'      ,'Improved'        ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','3'      ,'Status quo'      ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','4'      ,'Worse'           ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Outcome','5'      ,'Pending followup',25,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'    ,'NoteType'      ,'Patient Note Types',10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Unassigned'     ,'Unassigned'        , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Chart Note'     ,'Chart Note'        , 2,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Insurance'      ,'Insurance'         , 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','New Document'   ,'New Document'      , 4,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Pharmacy'       ,'Pharmacy'          , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Prior Auth'     ,'Prior Auth'        , 6,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Referral'       ,'Referral'          , 7,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Test Scheduling','Test Scheduling'   , 8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Bill/Collect'   ,'Bill/Collect'      , 9,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Other'          ,'Other'             ,10,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'        ,'Immunizations','Immunizations'           ,  8,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','1'            ,'DTaP 1'                  , 30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','2'            ,'DTaP 2'                  , 35,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','3'            ,'DTaP 3'                  , 40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','4'            ,'DTaP 4'                  , 45,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','5'            ,'DTaP 5'                  , 50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','6'            ,'DT 1'                    ,  5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','7'            ,'DT 2'                    , 10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','8'            ,'DT 3'                    , 15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','9'            ,'DT 4'                    , 20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','10'           ,'DT 5'                    , 25,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','11'           ,'IPV 1'                   ,110,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','12'           ,'IPV 2'                   ,115,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','13'           ,'IPV 3'                   ,120,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','14'           ,'IPV 4'                   ,125,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','15'           ,'Hib 1'                   , 80,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','16'           ,'Hib 2'                   , 85,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','17'           ,'Hib 3'                   , 90,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','18'           ,'Hib 4'                   , 95,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','19'           ,'Pneumococcal Conjugate 1',140,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','20'           ,'Pneumococcal Conjugate 2',145,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','21'           ,'Pneumococcal Conjugate 3',150,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','22'           ,'Pneumococcal Conjugate 4',155,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','23'           ,'MMR 1'                   ,130,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','24'           ,'MMR 2'                   ,135,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','25'           ,'Varicella 1'             ,165,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','26'           ,'Varicella 2'             ,170,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','27'           ,'Hepatitis B 1'           , 65,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','28'           ,'Hepatitis B 2'           , 70,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','29'           ,'Hepatitis B 3'           , 75,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','30'           ,'Influenza 1'             ,100,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','31'           ,'Influenza 2'             ,105,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','32'           ,'Td'                      ,160,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','33'           ,'Hepatitis A 1'           , 55,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','34'           ,'Hepatitis A 2'           , 60,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Immunizations','35'           ,'Other'                   ,175,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'Apptstat','Appointment Statuses', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','-'       ,'- None'              , 5,0,'FEFDCF|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','*'       ,'* Reminder done'     ,10,0,'FFC9F8|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','+'       ,'+ Chart pulled'      ,15,0,'87FF1F|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','X'       ,'X Canceled'          ,20,0,'BFBFBF|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','?'       ,'? No show'           ,25,0,'BFBFBF|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,ToggleSetting1 ) VALUES ('Apptstat','@'       ,'@ Arrived'           ,30,0,'FF2414|10','1');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,ToggleSetting1 ) VALUES ('Apptstat','~'       ,'~ Arrived late'      ,35,0,'FF6619|10','1');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,ToggleSetting2 ) VALUES ('Apptstat','!'       ,'! Left w/o visit'    ,40,0,'0BBA34|0','1');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','#'       ,'# Ins/fin issue'     ,45,0,'FFFF2B|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','<'       ,'< In exam room'      ,50,0,'52D9DE|10');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes,ToggleSetting2 ) VALUES ('Apptstat','>'       ,'> Checked out'       ,55,0,'FEFDCF|0','1');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','$'       ,'$ Coding done'       ,60,0,'C0FF96|0');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Apptstat','%'       ,'% Canceled < 24h'    ,65,0,'BFBFBF|0');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'    ,'Warehouse','Warehouses',21,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Warehouse','Onsite'   ,'On Site'   , 5,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','AbookType'  ,'Address Book Types'  , 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','OrdImg','Imaging Service'     , 5,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','OrdImm','Immunization Service',10,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','OrdLab','Lab Service'         ,15,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','Spe'    ,'Specialist'          ,20,2);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','Vendor' ,'Vendor'              ,25,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','Dist'   ,'Distributor'         ,30,3);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','Oth'    ,'Other'               ,95,1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,OptionValue ) VALUES ('AbookType','Ccda', 'Care Coordination', 35, 2);
INSERT INTO listOptions (ListId,OptionId,Title ,Seq,OptionValue ) VALUES ('AbookType','EmrDirect', 'EMR Direct' ,105,4);
INSERT INTO listOptions (ListId,OptionId,Title ,Seq,OptionValue ) VALUES ('AbookType','ExternalProvider', 'External Provider' ,110,1);
INSERT INTO listOptions (ListId,OptionId,Title ,Seq,OptionValue ) VALUES ('AbookType','ExternalOrg', 'External Organization' ,120,1);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcType','Procedure Types', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcType','Grp','Group'          ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcType','Ord','Procedure Order',20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcType','Res','Discrete Result',30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcType','Rec','Recommendation' ,40,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcBodySite','Procedure Body Sites', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcBodySite','Arm'    ,'Arm'    ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcBodySite','Buttock','Buttock',20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcBodySite','Oth'    ,'Other'  ,90,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcSpecimen','Procedure Specimen Types', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcSpecimen','Blood' ,'Blood' ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcSpecimen','Saliva','Saliva',20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcSpecimen','Urine' ,'Urine' ,30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcSpecimen','Oth'   ,'Other' ,90,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcRoute','Procedure Routes', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRoute','Inj' ,'Injection',10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRoute','Oral','Oral'     ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRoute','Oth' ,'Other'    ,90,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcLat','Procedure Lateralities', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcLat','Left' ,'Left'     ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcLat','Right','Right'    ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcLat','Bilat','Bilateral',30,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Lists','ProcUnit','Procedure Units', 1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Bool'       ,'Boolean'    ,  5);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','CuMm'      ,'CU.MM'      , 10);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Fl'         ,'FL'         , 20);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','GDl'       ,'G/DL'       , 30);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','GmDl'      ,'GM/DL'      , 40);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','HmolL'     ,'HMOL/L'     , 50);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','IuL'       ,'IU/L'       , 60);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','MgDl'      ,'MG/DL'      , 70);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','MilCuMm'  ,'Mil/CU.MM'  , 80);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Percent'    ,'Percent'    , 90);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Percentile' ,'Percentile' ,100);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Pg'         ,'PG'         ,110);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Ratio'      ,'Ratio'      ,120);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','ThousCuMm','Thous/CU.MM',130);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Units'      ,'Units'      ,140);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','UnitsL'    ,'Units/L'    ,150);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Days'       ,'Days'       ,600);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Weeks'      ,'Weeks'      ,610);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Months'     ,'Months'     ,620);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('ProcUnit','Oth'        ,'Other'      ,990);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','OrdPriority','Order Priorities', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdPriority','High'  ,'High'  ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdPriority','Normal','Normal',20,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','OrdStatus','Order Statuses', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdStatus','Pending' ,'Pending' ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdStatus','Routed'  ,'Routed'  ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdStatus','Complete','Complete',30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrdStatus','Canceled','Canceled',40,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcRepStatus','Procedure Report Statuses', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Final'  ,'Final'      ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Review' ,'Reviewed'   ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Prelim' ,'Preliminary',30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Cancel' ,'Canceled'   ,40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Error'  ,'Error'      ,50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcRepStatus','Correct','Corrected'  ,60,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcResAbnormal','Procedure Result Abnormal', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal','No'  ,'No'  ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal','Yes' ,'Yes' ,20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal','High','High',30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal','Low' ,'Low' ,40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal', 'Vhigh', 'Above upper panic limits', 50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResAbnormal', 'Vlow', 'Below lower panic limits', 60,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcResStatus','Procedure Result Statuses', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Final'     ,'Final'      ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Prelim'    ,'Preliminary',20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Cancel'    ,'Canceled'   ,30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Error'     ,'Error'      ,40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Correct'   ,'Corrected'  ,50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResStatus','Incomplete','Incomplete' ,60,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','ProcResBool','Procedure Boolean Results', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResBool','Neg' ,'Negative',10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('ProcResBool','Pos' ,'Positive',20,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'         ,'MessageStatus','Message Status',45,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('MessageStatus','Done'           ,'Done'         , 5,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('MessageStatus','Forwarded'      ,'Forwarded'    ,10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('MessageStatus','New'            ,'New'          ,15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('MessageStatus','Read'           ,'Read'         ,20,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Lab Results' ,'Lab Results', 15,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','New Orders' ,'New Orders', 20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('NoteType','Patient Reminders' ,'Patient Reminders', 25,0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'Irnpool','Invoice Reference Number Pools', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Irnpool','Main','Main',1,1,'000001');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists', 'Eligibility', 'Eligibility', 60, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Eligibility', 'Eligible', 'Eligible', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Eligibility', 'Ineligible', 'Ineligible', 20, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists', 'Transactions', 'Layout-Based Transaction Forms', 9, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Transactions', 'LBTref'  , 'Referral'         , 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Transactions', 'LBTptreq', 'Patient Request'  , 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Transactions', 'LBTphreq', 'Physician Request', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Transactions', 'LBTlegal', 'Legal'            , 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Transactions', 'LBTbill' , 'Billing'          , 50, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentAdjustmentCode','Payment Adjustment Code', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentAdjustmentCode', 'FamilyPayment', 'Family Payment', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentAdjustmentCode', 'GroupPayment', 'Group Payment', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentAdjustmentCode', 'InsurancePayment', 'Insurance Payment', 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentAdjustmentCode', 'PatientPayment', 'Patient Payment', 50, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentAdjustmentCode', 'PrePayment', 'Pre Payment', 60, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentIns','Payment Ins', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentIns', '0', 'Pat', 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentIns', '1', 'Ins1', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentIns', '2', 'Ins2', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentIns', '3', 'Ins3', 30, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentMethod','Payment Method', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentMethod', 'BankDraft', 'Bank Draft', 50, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentMethod', 'Cash', 'Cash', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentMethod', 'CheckPayment', 'Check Payment', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentMethod', 'CreditCard', 'Credit Card', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentMethod', 'Electronic', 'Electronic', 40, 0);
insert into `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) values('PaymentMethod','AuthorizeNet','Authorize.net','60','0','0','','');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentSortBy','Payment Sort By', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'CheckDate', 'Check Date', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'PayerId', 'Ins Code', 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'PaymentMethod', 'Payment Method', 50, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'PaymentType', 'Paying Entity', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'PayTotal', 'Amount', 70, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'Reference', 'Check Number', 60, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentSortBy', 'SessionId', 'Id', 10, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentStatus','Payment Status', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentStatus', 'FullyPaid', 'Fully Paid', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentStatus', 'Unapplied', 'Unapplied', 20, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentType','Payment Type', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentType', 'Insurance', 'Insurance', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentType', 'Patient', 'Patient', 20, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists', 'DateMasterCriteria', 'Date Master Criteria', 33, 1);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'All', 'All', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'Today', 'Today', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'ThisMonthToDate', 'This Month to Date', 30, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'LastMonth', 'Last Month', 40, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'ThisWeekToDate', 'This Week to Date', 50, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'ThisCalendarYear', 'This Calendar Year', 60, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'LastCalendarYear', 'Last Calendar Year', 70, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DateMasterCriteria', 'Custom', 'Custom', 80, 0);

-- Clinical Plan Titles
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'ClinicalPlans','Clinical Plans', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'DmPlanCqm', 'Diabetes Mellitus', 5, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'CkdPlanCqm', 'Chronic Kidney Disease (CKD)', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'PreventPlanCqm', 'Preventative Care', 15, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'PeriopPlanCqm', 'Perioperative Care', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'RheumArthPlanCqm', 'Rheumatoid Arthritis', 25, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'BackPainPlanCqm', 'Back Pain', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'CabgPlanCqm', 'Coronary Artery Bypass Graft (CABG)', 35, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'DmPlan', 'Diabetes Mellitus', 500, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalPlans', 'PreventPlan', 'Preventative Care', 510, 0);

-- Clinical Rule Titles
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'ClinicalRules','Clinical Rules', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'ProblemListAmc', 'Maintain an up-to-date problem list of current and active diagnoses.', 5, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'MedListAmc', 'Maintain active medication list.', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'MedAllergyListAmc', 'Maintain active medication allergy list.', 15, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RecordVitalsAmc', 'Record and chart changes in vital signs.', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RecordSmokeAmc', 'Record smoking status for patients 13 years old or older.', 25, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'LabResultAmc', 'Incorporate clinical lab-test results into certified EHR technology as structured data.', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'MedReconcAmc', 'The EP,Eligible hospital or CAH who receives a patient from another setting of care or provider of care or believes an encounter is relevant should perform medication reconciliation.', 35, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'PatientEduAmc', 'Use certified EHR technology to identify patient-specific education resources and provide those resources to the patient if appropriate.', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'CpoeMedAmc', 'Use CPOE for medication orders directly entered by any licensed healthcare professional who can enter orders into the medical record per state,Local and professional guidelines.', 45, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'EPrescribeAmc', 'Generate and transmit permissible prescriptions electronically.', 50, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RecordDemAmc', 'Record demographics.', 55, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'SendReminderAmc', 'Send reminders to patients per patient preference for preventive/follow up care.', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'ProvideRecPatAmc', 'Provide patients with an electronic copy of their health information (Including diagnostic test results,Problem list,Medication lists,Medication allergies),Upon request.', 65, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'TimelyAccessAmc', 'Provide patients with timely electronic access to their health information (Including lab results,Problem list,Medication lists,Medication allergies) within four business days of the information being available to the EP.', 70, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'ProvideSumPatAmc', 'Provide clinical summaries for patients for each office visit.', 75, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'SendSumAmc', 'The EP,Eligible hospital or CAH who transitions their patient to another setting of care or provider of care or refers their patient to another provider of care should provide summary of care record for each transition of care or referral.', 80, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleHtnBpMeasureCqm', 'Hypertension: Blood Pressure Measurement (CQM)', 200, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleTobUseAssessCqm', 'Tobacco Use Assessment (CQM)', 205, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleTobCessInterCqm', 'Tobacco Cessation Intervention (CQM)', 210, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleAdultWtScreenFuCqm', 'Adult Weight Screening and Follow-Up (CQM)', 220, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleWtAssessCounsChildCqm', 'Weight Assessment and Counseling for Children and Adolescents (CQM)', 230, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleInfluenzaGe50Cqm', 'Influenza Immunization for Patients >= 50 Years Old (CQM)', 240, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleChildImmunStatCqm', 'Childhood immunization Status (CQM)', 250, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RulePneumovaccGe65Cqm', 'Pneumonia Vaccination Status for Older Adults (CQM)', 260, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmEyeCqm', 'Diabetes: Eye Exam (CQM)', 270, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmFootCqm', 'Diabetes: Foot Exam (CQM)', 280, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmA1cCqm', 'Diabetes: HbA1c Poor Control (CQM)', 285, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmBpControlCqm', 'Diabetes: Blood Pressure Management (CQM)', 290, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmLdlCqm', 'Diabetes: LDL Management & Control (CQM)', 300, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RuleChildrenPharyngitisCqm', 'Appropriate Testing for Children with Pharyngitis (CQM)', 502, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RuleFallScreeningCqm', 'Falls: Screening,Risk-Assessment,And Plan of Care to Prevent Future Falls (CQM)', 504, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RulePainIntensityCqm', 'Oncology: Medical and Radiation - Pain Intensity Quantified (CQM)', 506, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RuleChildImmunStat2014Cqm', 'Childhood immunization Status (CQM)', 250, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RuleTobUse2014Cqm', 'Preventive Care and Screening: Tobacco Use: Screening and Cessation Intervention (CQM)', 210, 0, 0, '', '', '', 0, 0);

INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleHtnBpMeasure', 'Hypertension: Blood Pressure Measurement', 500, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleTobUseAssess', 'Tobacco Use Assessment', 510, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleTobCessInter', 'Tobacco Cessation Intervention', 520, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleAdultWtScreenFu', 'Adult Weight Screening and Follow-Up', 530, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleWtAssessCounsChild', 'Weight Assessment and Counseling for Children and Adolescents', 540, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleInfluenzaGe50', 'Influenza Immunization for Patients >= 50 Years Old', 550, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RulePneumovaccGe65', 'Pneumonia Vaccination Status for Older Adults', 570, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmHemoA1c', 'Diabetes: Hemoglobin A1C', 570, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmUrineAlb', 'Diabetes: Urine Microalbumin', 590, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmEye', 'Diabetes: Eye Exam', 600, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleDmFoot', 'Diabetes: Foot Exam', 610, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleCsMammo', 'Cancer Screening: Mammogram', 620, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleCsPap', 'Cancer Screening: Pap Smear', 630, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleCsColon', 'Cancer Screening: Colon Cancer Screening', 640, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleCsProstate', 'Cancer Screening: Prostate Cancer Screening', 650, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleInrMonitor', 'Coumadin Management - INR Monitoring', 1000, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleSocsecEntry', 'Data Entry - Social Security Number', 1500, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RulePenicillinAllergy', 'Assess Penicillin Allergy', 1600, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleBloodPressure', 'Measure Blood Pressure', 1610, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleInrMeasure', 'Measure INR', 1620, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('ClinicalRules', 'RuleApptReminder', 'Appointment Reminder Rule', 2000, 0);



INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'ImageResultsAmc', 'Image Results', 3000, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'FamilyHealthHistoryAmc', 'Family Health History', 3100, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'ElectronicNotesAmc', 'Electronic Notes', 3200, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'SecureMessagingAmc', 'Secure Electronic Messaging', 3400, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'ViewDownloadTransmitAmc', 'View,Download,Transmit (VDT)  (Measure B)', 3500, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'CpoeRadiologyAmc', 'Use CPOE for radiology orders.', 46, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'CpoeProcOrdersAmc', 'Use CPOE for procedure orders.', 47, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'SendReminderStage2Amc', 'Send reminders to patients per patient preference for preventive/follow up care.', 60, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'CpoeMedStage2Amc', 'Use CPOE for medication orders.(Alternative)', 47, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'PatientEduStage2Amc', 'Use certified EHR technology to identify patient-specific education resources and provide those resources to the patient if appropriate(New).', 40, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RecordVitals1Stage1Amc', 'Record and chart changes in vital signs (SET 1).', 20, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RecordVitals2Stage1Amc', 'Record and chart changes in vital signs (BP out of scope).', 20, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RecordVitals3Stage1Amc', 'Record and chart changes in vital signs (Height / Weight out of scope).', 20, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RecordVitals4Stage1Amc', 'Record and chart changes in vital signs ( Height / Weight / BP with in scope ).', 20, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'RecordVitalsStage2Amc', 'Record and chart changes in vital signs (New).', 20, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'ProvideSumPatStage2Amc', 'Provide clinical summaries for patients for each office visit (New).', 75, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'VdtStage2Amc', 'View,Download,Transmit (VDT) (Measure A)', 3500, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'SendSumStage1Amc', 'The EP,Eligible hospital or CAH who transitions their patient to another setting of care or provider of care or refers their patient to another provider of care should provide summary of care record for each transition of care or referral.', 80, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'SendSum1Stage2Amc', 'The EP,Eligible hospital or CAH who transitions their patient to another setting of care or provider of care or refers their patient to another provider of care should provide summary of care record for each transition of care or referral (Measure A).', 80, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'SendSumStage2Amc', 'The EP,Eligible hospital or CAH who transitions their patient to another setting of care or provider of care or refers their patient to another provider of care should provide summary of care record for each transition of care or referral (Measure B).', 80, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'EPrescribeStage1Amc', 'Generate and transmit permissible prescriptions electronically (Not including controlled substances).', 50, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'EPrescribe1Stage2Amc', 'Generate and transmit permissible prescriptions electronically (All Prescriptions).', 50, 0, 0, '', '', '', 0, 0);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`, `Codes`, `ToggleSetting1`, `ToggleSetting2`) VALUES
('ClinicalRules', 'EPrescribe2Stage2Amc', 'Generate and transmit permissible prescriptions electronically (Not including controlled substances).', 50, 0, 0, '', '', '', 0, 0);

-- order types
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists','OrderType','Order Types', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','Procedure','Procedure',10,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','Intervention','Intervention',20,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','LaboratoryTest','Laboratory Test',30,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','PhysicalExam','Physical Exam',40,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','RiskCategory','Risk Category Assessment',50,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','PatientCharacteristics','Patient Characteristics',60,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','Imaging','Imaging',70,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('OrderType','EncCheckupProcedure','Encounter Checkup Procedure',80,0);


-- Clinical Rule Target Methods
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleTargets', 'Clinical Rule Target Methods', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargets' ,'TargetDatabase', 'Database', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargets' ,'TargetInterval', 'Interval', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargets' ,'TargetProc', 'Procedure', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargets' ,'TargetAppt', 'Appointment', 30, 0);

-- Clinical Rule Target Intervals
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleTargetIntervals', 'Clinical Rules Target Intervals', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Year', 'Year', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Month', 'Month', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Week', 'Week', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Day', 'Day', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Hour', 'Hour', 50, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Minute', 'Minute', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'Second', 'Second', 70, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleTargetIntervals' ,'FluSeason', 'Flu Season', 80, 0);

-- Clinical Rule Comparisons
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleComparisons', 'Clinical Rules Comparisons', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleComparisons' ,'EXIST', 'Exist', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleComparisons' ,'Lt', 'Less Than', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleComparisons' ,'Le', 'Less Than or Equal To', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleComparisons' ,'Gt', 'Greater Than', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleComparisons' ,'Ge', 'Greater Than or Equal To', 50, 0);

-- Clinical Rule Filter Methods
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleFilters','Clinical Rule Filter Methods', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltDatabase', 'Database', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltDiagnosis', 'Diagnosis', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltSex', 'Gender', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltAgeMax', 'Maximum Age', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltAgeMin', 'Minimum Age', 50, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltProc', 'Procedure', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleFilters', 'FiltLists', 'Lists', 70, 0);

-- Clinical Rule Age Intervals
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleAgeIntervals', 'Clinical Rules Age Intervals', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAgeIntervals' ,'Year', 'Year', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAgeIntervals' ,'Month', 'Month', 20, 0);

-- Encounter Types (Needed for mapping encounters for CQM rules)
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleEncTypes', 'Clinical Rules Encounter Types', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncOutpatient', 'Encounter outpatient', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncNursFac', 'Encounter nursing facility', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncOffVis', 'Encounter office visit', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncHeaAndBeh', 'Encounter health and behavior assessment', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncOccTher', 'Encounter occupational therapy', 50, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPsychAndPsych', 'Encounter psychiatric & psychologic', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPreMedSer18Older', 'Encounter preventive medicine services 18 and older', 70, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPreMedSer40Older', 'Encounter preventive medicine 40 and older', 75, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPreIndCounsel', 'Encounter preventive medicine - individual counseling', 80, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPreMedGroupCounsel', 'Encounter preventive medicine group counseling', 90, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPreMedOtherServ', 'Encounter preventive medicine other services', 100, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncOutPcpObgyn', 'Encounter outpatient w/PCP & obgyn', 110, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncPregnancy', 'Encounter pregnancy', 120, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncNursDischarge', 'Encounter nursing discharge', 130, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncAcuteInpOrEd', 'Encounter acute inpatient or ED', 130, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncNonacInpOutOrOpth', 'Encounter: encounter non-acute inpt,Outpatient,Or ophthalmology', 140, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleEncTypes' ,'EncInfluenza', 'Encounter influenza', 150, 0);

-- Clinical Rule Action Categories
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleActionCategory', 'Clinical Rule Action Category', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatAssess', 'Assessment', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatEdu', 'Education', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatExam', 'Examination', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatInter', 'Intervention', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatMeasure', 'Measurement', 50, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatTreat', 'Treatment', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleActionCategory' ,'ActCatRemind', 'Reminder', 70, 0);

-- Clinical Rule Action Items
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleAction', 'Clinical Rule Action Item', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActBp', 'Blood Pressure', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActInfluvacc', 'Influenza Vaccine', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActTobacco', 'Tobacco', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActWt', 'Weight', 40, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActBmi', 'BMI', 43, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActNutrition', 'Nutrition', 45, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActExercise', 'Exercise', 47, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActPneumovacc', 'Pneumococcal Vaccine', 60, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActHemoA1c', 'Hemoglobin A1C', 70, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActUrineAlb', 'Urine Microalbumin', 80, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActEye', 'Opthalmic', 90, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActFoot', 'Podiatric', 100, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActMammo', 'Mammogram', 110, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActPap', 'Pap Smear', 120, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActColonCancerScreen', 'Colon Cancer Screening', 130, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActProstateCancerScreen', 'Prostate Cancer Screening', 140, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActLabInr', 'INR', 150, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActSocSec', 'Social Security Number', 155, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActPenicillinAllergy', 'Penicillin Allergy', 157, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleAction' ,'ActAppointment', 'Appointment', 160, 0);

-- Clinical Rule Reminder Intervals
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleReminderIntervals', 'Clinical Rules Reminder Intervals', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderIntervals' ,'Month', 'Month', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderIntervals' ,'Week', 'Week', 20, 0);

-- Clinical Rule Reminder Methods
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleReminderMethods', 'Clinical Rules Reminder Methods', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderMethods' ,'ClinicalReminderPre', 'Past Due Interval (Clinical Reminders)', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderMethods' ,'PatientReminderPre', 'Past Due Interval (Patient Reminders)', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderMethods' ,'ClinicalReminderPost', 'Soon Due Interval (Clinical Reminders)', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderMethods' ,'PatientReminderPost', 'Soon Due Interval (Patient Reminders)', 40, 0);

-- Clinical Rule Reminder Due Options
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleReminderDueOpt', 'Clinical Rules Reminder Due Options', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderDueOpt' ,'Due', 'Due', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderDueOpt' ,'SoonDue', 'Due Soon', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderDueOpt' ,'PastDue', 'Past Due', 30, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderDueOpt' ,'NotDue', 'Not Due', 30, 0);

-- Clinical Rule Reminder Inactivate Options
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('Lists' ,'RuleReminderInactiveOpt', 'Clinical Rules Reminder Inactivation Options', 3, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderInactiveOpt' ,'Auto', 'Automatic', 10, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderInactiveOpt' ,'DueStatusUpdate', 'Due Status Update', 20, 0);
INSERT INTO `ListOptions` ( `ListId`, `OptionId`, `Title`, `Seq`, `IsDefault` ) VALUES ('RuleReminderInactiveOpt' ,'Manual', 'Manual', 20, 0);

-- eRx User Roles
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','Erxadmin','NewCrop Admin','5','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','Erxdoctor','NewCrop Doctor','20','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','Erxmanager','NewCrop Manager','15','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','ErxmidlevelPrescriber','NewCrop Midlevel Prescriber','25','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','Erxnurse','NewCrop Nurse','10','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('NewcropErxRole','ErxsupervisingDoctor','NewCrop Supervising Doctor','30','0','0','','');
INSERT INTO listOptions (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('Lists','NewcropErxRole','NewCrop eRx Role','221','0','0','','');

-- MSP remit codes
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('Lists','MspRemitCodes','MSP Remit Codes','221','0','0','','');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '1', '1', 1, 0, 0, '', 'Deductible Amount');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '2', '2', 2, 0, 0, '', 'Coinsurance Amount');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '3', '3', 3, 0, 0, '', 'Co-payment Amount');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '4', '4', 4, 0, 0, '', 'The procedure code is inconsistent with the modifier used or a required modifier is missing. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '9', '9', 9, 0, 0, '', 'The diagnosis is inconsistent with the patient''S age. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '10', '10', 10, 0, 0, '', 'The diagnosis is inconsistent with the patient''S gender. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '11', '11', 11, 0, 0, '', 'The diagnosis is inconsistent with the procedure. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '12', '12', 12, 0, 0, '', 'The diagnosis is inconsistent with the provider type. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '13', '13', 13, 0, 0, '', 'The date of death precedes the date of service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '14', '14', 14, 0, 0, '', 'The date of birth follows the date of service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '15', '15', 15, 0, 0, '', 'The authorization number is missing,Invalid,Or does not apply to the billed services or provider.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '16', '16', 16, 0, 0, '', 'Claim/service lacks information which is needed for adjudication. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '18', '18', 17, 0, 0, '', 'Duplicate claim/service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '19', '19', 18, 0, 0, '', 'This is a work-related injury/illness and thus the liability of the Worker''S Compensation Carrier.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '20', '20', 19, 0, 0, '', 'This injury/illness is covered by the liability carrier.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '21', '21', 20, 0, 0, '', 'This injury/illness is the liability of the no-fault carrier.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '22', '22', 21, 0, 0, '', 'This care may be covered by another payer per coordination of benefits.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '23', '23', 22, 0, 0, '', 'The impact of prior payer(S) adjudication including payments and/or adjustments.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '24', '24', 23, 0, 0, '', 'Charges are covered under a capitation agreement/managed care plan.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '26', '26', 24, 0, 0, '', 'Expenses incurred prior to coverage.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '27', '27', 25, 0, 0, '', 'Expenses incurred after coverage terminated.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '29', '29', 26, 0, 0, '', 'The time limit for filing has expired.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '31', '31', 27, 0, 0, '', 'Patient cannot be identified as our insured.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '32', '32', 28, 0, 0, '', 'Our records indicate that this dependent is not an eligible dependent as defined.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '33', '33', 29, 0, 0, '', 'Insured has no dependent coverage.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '34', '34', 30, 0, 0, '', 'Insured has no coverage for newborns.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '35', '35', 31, 0, 0, '', 'Lifetime benefit maximum has been reached.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '38', '38', 32, 0, 0, '', 'Services not provided or authorized by designated (Network/primary care) providers.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '39', '39', 33, 0, 0, '', 'Services denied at the time authorization/pre-certification was requested.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '40', '40', 34, 0, 0, '', 'Charges do not meet qualifications for emergent/urgent care. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '44', '44', 35, 0, 0, '', 'Prompt-pay discount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '45', '45', 36, 0, 0, '', 'Charge exceeds fee schedule/maximum allowable or contracted/legislated fee arrangement. (Use Group Codes PR or CO depending upon liability).');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '49', '49', 37, 0, 0, '', 'These are non-covered services because this is a routine exam or screening procedure done in conjunction with a routine exam. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '50', '50', 38, 0, 0, '', 'These are non-covered services because this is not deemed a ''Medical necessity'' by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '51', '51', 39, 0, 0, '', 'These are non-covered services because this is a pre-existing condition. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '53', '53', 40, 0, 0, '', 'Services by an immediate relative or a member of the same household are not covered.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '54', '54', 41, 0, 0, '', 'Multiple physicians/assistants are not covered in this case. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '55', '55', 42, 0, 0, '', 'Procedure/treatment is deemed experimental/investigational by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '56', '56', 43, 0, 0, '', 'Procedure/treatment has not been deemed ''Proven to be effective'' by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '58', '58', 44, 0, 0, '', 'Treatment was deemed by the payer to have been rendered in an inappropriate or invalid place of service. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '59', '59', 45, 0, 0, '', 'Processed based on multiple or concurrent procedure rules. (For example multiple surgery or diagnostic imaging,Concurrent anesthesia.) Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '60', '60', 46, 0, 0, '', 'Charges for outpatient services are not covered when performed within a period of time prior to or after inpatient services.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '61', '61', 47, 0, 0, '', 'Penalty for failure to obtain second surgical opinion. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '66', '66', 48, 0, 0, '', 'Blood Deductible.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '69', '69', 49, 0, 0, '', 'Day outlier amount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '70', '70', 50, 0, 0, '', 'Cost outlier - Adjustment to compensate for additional costs.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '74', '74', 51, 0, 0, '', 'Indirect Medical Education Adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '75', '75', 52, 0, 0, '', 'Direct Medical Education Adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '76', '76', 53, 0, 0, '', 'Disproportionate Share Adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '78', '78', 54, 0, 0, '', 'Non-Covered days/Room charge adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '85', '85', 55, 0, 0, '', 'Patient Interest Adjustment (Use Only Group code PR)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '87', '87', 56, 0, 0, '', 'Transfer amount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '89', '89', 57, 0, 0, '', 'Professional fees removed from charges.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '90', '90', 58, 0, 0, '', 'Ingredient cost adjustment. Note: To be used for pharmaceuticals only.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '91', '91', 59, 0, 0, '', 'Dispensing fee adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '94', '94', 60, 0, 0, '', 'Processed in Excess of charges.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '95', '95', 61, 0, 0, '', 'Plan procedures not followed.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '96', '96', 62, 0, 0, '', 'Non-covered charge(S). At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.) Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 S');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '97', '97', 63, 0, 0, '', 'The benefit for this service is included in the payment/allowance for another service/procedure that has already been adjudicated. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '100', '100', 64, 0, 0, '', 'Payment made to patient/insured/responsible party/employer.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '101', '101', 65, 0, 0, '', 'Predetermination: anticipated payment upon completion of services or claim adjudication.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '102', '102', 66, 0, 0, '', 'Major Medical Adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '103', '103', 67, 0, 0, '', 'Provider promotional discount (E.g.,Senior citizen discount).');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '104', '104', 68, 0, 0, '', 'Managed care withholding.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '105', '105', 69, 0, 0, '', 'Tax withholding.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '106', '106', 70, 0, 0, '', 'Patient payment option/election not in effect.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '107', '107', 71, 0, 0, '', 'The related or qualifying claim/service was not identified on this claim. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '108', '108', 72, 0, 0, '', 'Rent/purchase guidelines were not met. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '109', '109', 73, 0, 0, '', 'Claim not covered by this payer/contractor. You must send the claim to the correct payer/contractor.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '110', '110', 74, 0, 0, '', 'Billing date predates service date.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '111', '111', 75, 0, 0, '', 'Not covered unless the provider accepts assignment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '112', '112', 76, 0, 0, '', 'Service not furnished directly to the patient and/or not documented.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '114', '114', 77, 0, 0, '', 'Procedure/product not approved by the Food and Drug Administration.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '115', '115', 78, 0, 0, '', 'Procedure postponed,Canceled,Or delayed.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '116', '116', 79, 0, 0, '', 'The advance indemnification notice signed by the patient did not comply with requirements.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '117', '117', 80, 0, 0, '', 'Transportation is only covered to the closest facility that can provide the necessary care.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '118', '118', 81, 0, 0, '', 'ESRD network support adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '119', '119', 82, 0, 0, '', 'Benefit maximum for this time period or occurrence has been reached.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '121', '121', 83, 0, 0, '', 'Indemnification adjustment - compensation for outstanding member responsibility.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '122', '122', 84, 0, 0, '', 'Psychiatric reduction.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '125', '125', 85, 0, 0, '', 'Submission/billing error(S). At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '128', '128', 86, 0, 0, '', 'Newborn''S services are covered in the mother''S Allowance.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '129', '129', 87, 0, 0, '', 'Prior processing information appears incorrect. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '130', '130', 88, 0, 0, '', 'Claim submission fee.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '131', '131', 89, 0, 0, '', 'Claim specific negotiated discount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '132', '132', 90, 0, 0, '', 'Prearranged demonstration project adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '133', '133', 91, 0, 0, '', 'The disposition of this claim/service is pending further review.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '134', '134', 92, 0, 0, '', 'Technical fees removed from charges.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '135', '135', 93, 0, 0, '', 'Interim bills cannot be processed.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '136', '136', 94, 0, 0, '', 'Failure to follow prior payer''S coverage rules. (Use Group Code OA).');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '137', '137', 95, 0, 0, '', 'Regulatory Surcharges,Assessments,Allowances or Health Related Taxes.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '138', '138', 96, 0, 0, '', 'Appeal procedures not followed or time limits not met.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '139', '139', 97, 0, 0, '', 'Contracted funding agreement - Subscriber is employed by the provider of services.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '140', '140', 98, 0, 0, '', 'Patient/Insured health identification number and name do not match.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '141', '141', 99, 0, 0, '', 'Claim spans eligible and ineligible periods of coverage.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '142', '142', 100, 0, 0, '', 'Monthly Medicaid patient liability amount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '143', '143', 101, 0, 0, '', 'Portion of payment deferred.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '144', '144', 102, 0, 0, '', 'Incentive adjustment,E.g. preferred product/service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '146', '146', 103, 0, 0, '', 'Diagnosis was invalid for the date(S) of service reported.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '147', '147', 104, 0, 0, '', 'Provider contracted/negotiated rate expired or not on file.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '148', '148', 105, 0, 0, '', 'Information from another provider was not provided or was insufficient/incomplete. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '149', '149', 106, 0, 0, '', 'Lifetime benefit maximum has been reached for this service/benefit category.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '150', '150', 107, 0, 0, '', 'Payer deems the information submitted does not support this level of service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '151', '151', 108, 0, 0, '', 'Payment adjusted because the payer deems the information submitted does not support this many/frequency of services.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '152', '152', 109, 0, 0, '', 'Payer deems the information submitted does not support this length of service. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '153', '153', 110, 0, 0, '', 'Payer deems the information submitted does not support this dosage.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '154', '154', 111, 0, 0, '', 'Payer deems the information submitted does not support this day''S supply.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '155', '155', 112, 0, 0, '', 'Patient refused the service/procedure.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '157', '157', 113, 0, 0, '', 'Service/procedure was provided as a result of an act of war.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '158', '158', 114, 0, 0, '', 'Service/procedure was provided outside of the United States.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '159', '159', 115, 0, 0, '', 'Service/procedure was provided as a result of terrorism.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '160', '160', 116, 0, 0, '', 'Injury/illness was the result of an activity that is a benefit exclusion.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '161', '161', 117, 0, 0, '', 'Provider performance bonus');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '162', '162', 118, 0, 0, '', 'State-mandated Requirement for Property and Casualty,See Claim Payment Remarks Code for specific explanation.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '163', '163', 119, 0, 0, '', 'Attachment referenced on the claim was not received.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '164', '164', 120, 0, 0, '', 'Attachment referenced on the claim was not received in a timely fashion.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '165', '165', 121, 0, 0, '', 'Referral absent or exceeded.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '166', '166', 122, 0, 0, '', 'These services were submitted after this payers responsibility for processing claims under this plan ended.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '167', '167', 123, 0, 0, '', 'This (These) diagnosis(Es) is (Are) not covered. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '168', '168', 124, 0, 0, '', 'Service(S) have been considered under the patient''S medical plan. Benefits are not available under this dental plan.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '169', '169', 125, 0, 0, '', 'Alternate benefit has been provided.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '170', '170', 126, 0, 0, '', 'Payment is denied when performed/billed by this type of provider. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '171', '171', 127, 0, 0, '', 'Payment is denied when performed/billed by this type of provider in this type of facility. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '172', '172', 128, 0, 0, '', 'Payment is adjusted when performed/billed by a provider of this specialty. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '173', '173', 129, 0, 0, '', 'Service was not prescribed by a physician.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '174', '174', 130, 0, 0, '', 'Service was not prescribed prior to delivery.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '175', '175', 131, 0, 0, '', 'Prescription is incomplete.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '176', '176', 132, 0, 0, '', 'Prescription is not current.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '177', '177', 133, 0, 0, '', 'Patient has not met the required eligibility requirements.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '178', '178', 134, 0, 0, '', 'Patient has not met the required spend down requirements.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '179', '179', 135, 0, 0, '', 'Patient has not met the required waiting requirements. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '180', '180', 136, 0, 0, '', 'Patient has not met the required residency requirements.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '181', '181', 137, 0, 0, '', 'Procedure code was invalid on the date of service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '182', '182', 138, 0, 0, '', 'Procedure modifier was invalid on the date of service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '183', '183', 139, 0, 0, '', 'The referring provider is not eligible to refer the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '184', '184', 140, 0, 0, '', 'The prescribing/ordering provider is not eligible to prescribe/order the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '185', '185', 141, 0, 0, '', 'The rendering provider is not eligible to perform the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '186', '186', 142, 0, 0, '', 'Level of care change adjustment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '187', '187', 143, 0, 0, '', 'Consumer Spending Account payments (Includes but is not limited to Flexible Spending Account,Health Savings Account,Health Reimbursement Account,Etc.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '188', '188', 144, 0, 0, '', 'This product/procedure is only covered when used according to FDA recommendations.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '189', '189', 145, 0, 0, '', '''''Not otherwise classified'' or ''Unlisted'' procedure code (CPT/HCPCS) was billed when there is a specific procedure code for this procedure/service''');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '190', '190', 146, 0, 0, '', 'Payment is included in the allowance for a Skilled Nursing Facility (SNF) qualified stay.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '191', '191', 147, 0, 0, '', 'Not a work related injury/illness and thus not the liability of the workers'' compensation carrier Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Clai');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '192', '192', 148, 0, 0, '', 'Non standard adjustment code from paper remittance. Note: This code is to be used by providers/payers providing Coordination of Benefits information to another payer in the 837 transaction only. This code is only used when the non-standard code cannot be ');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '193', '193', 149, 0, 0, '', 'Original payment decision is being maintained. Upon review,It was determined that this claim was processed properly.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '194', '194', 150, 0, 0, '', 'Anesthesia performed by the operating physician,The assistant surgeon or the attending physician.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '195', '195', 151, 0, 0, '', 'Refund issued to an erroneous priority payer for this claim/service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '197', '197', 152, 0, 0, '', 'Precertification/authorization/notification absent.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '198', '198', 153, 0, 0, '', 'Precertification/authorization exceeded.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '199', '199', 154, 0, 0, '', 'Revenue code and Procedure code do not match.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '200', '200', 155, 0, 0, '', 'Expenses incurred during lapse in coverage');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '201', '201', 156, 0, 0, '', 'Workers Compensation case settled. Patient is responsible for amount of this claim/service through WC ''Medicare set aside arrangement'' or other agreement. (Use group code PR).');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '202', '202', 157, 0, 0, '', 'Non-covered personal comfort or convenience services.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '203', '203', 158, 0, 0, '', 'Discontinued or reduced service.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '204', '204', 159, 0, 0, '', 'This service/equipment/drug is not covered under the patient?s current benefit plan');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '205', '205', 160, 0, 0, '', 'Pharmacy discount card processing fee');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '206', '206', 161, 0, 0, '', 'National Provider Identifier - missing.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '207', '207', 162, 0, 0, '', 'National Provider identifier - Invalid format');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '208', '208', 163, 0, 0, '', 'National Provider Identifier - Not matched.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '209', '209', 164, 0, 0, '', 'Per regulatory or other agreement. The provider cannot collect this amount from the patient. However,This amount may be billed to subsequent payer. Refund to patient if collected. (Use Group code OA)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '210', '210', 165, 0, 0, '', 'Payment adjusted because pre-certification/authorization not received in a timely fashion');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '211', '211', 166, 0, 0, '', 'National Drug Codes (NDC) not eligible for rebate,Are not covered.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '212', '212', 167, 0, 0, '', 'Administrative surcharges are not covered');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '213', '213', 168, 0, 0, '', 'Non-compliance with the physician self referral prohibition legislation or payer policy.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '214', '214', 169, 0, 0, '', 'Workers'' Compensation claim adjudicated as non-compensable. This Payer not liable for claim or service/treatment. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '215', '215', 170, 0, 0, '', 'Based on subrogation of a third party settlement');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '216', '216', 171, 0, 0, '', 'Based on the findings of a review organization');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '217', '217', 172, 0, 0, '', 'Based on payer reasonable and customary fees. No maximum allowable defined by legislated fee arrangement. (Note: To be used for Workers'' Compensation only)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '218', '218', 173, 0, 0, '', 'Based on entitlement to benefits. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for the jurisdictional');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '219', '219', 174, 0, 0, '', 'Based on extent of injury. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for the jurisdictional regula');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '220', '220', 175, 0, 0, '', 'The applicable fee schedule does not contain the billed code. Please resubmit a bill with the appropriate fee schedule code(S) that best describe the service(S) provided and supporting documentation if required. (Note: To be used for Workers'' Compensation');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '221', '221', 176, 0, 0, '', 'Workers'' Compensation claim is under investigation. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for ');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '222', '222', 177, 0, 0, '', 'Exceeds the contracted maximum number of hours/days/units by this provider for this period. This is not patient specific. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '223', '223', 178, 0, 0, '', 'Adjustment code for mandated federal,State or local law/regulation that is not already covered by another code and is mandated before a new code can be created.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '224', '224', 179, 0, 0, '', 'Patient identification compromised by identity theft. Identity verification required for processing this and future claims.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '225', '225', 180, 0, 0, '', 'Penalty or Interest Payment by Payer (Only used for plan to plan encounter reporting within the 837)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '226', '226', 181, 0, 0, '', 'Information requested from the Billing/Rendering Provider was not provided or was insufficient/incomplete. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '227', '227', 182, 0, 0, '', 'Information requested from the patient/insured/responsible party was not provided or was insufficient/incomplete. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is ');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '228', '228', 183, 0, 0, '', 'Denied for failure of this provider,Another provider or the subscriber to supply requested information to a previous payer for their adjudication');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '229', '229', 184, 0, 0, '', 'Partial charge amount not considered by Medicare due to the initial claim Type of Bill being 12X. Note: This code can only be used in the 837 transaction to convey Coordination of Benefits information when the secondary payer?s cost avoidance policy allow');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '230', '230', 185, 0, 0, '', 'No available or correlating CPT/HCPCS code to describe this service. Note: Used only by Property and Casualty.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '231', '231', 186, 0, 0, '', 'Mutually exclusive procedures cannot be done in the same day/setting. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '232', '232', 187, 0, 0, '', 'Institutional Transfer Amount. Note - Applies to institutional claims only and explains the DRG amount difference when the patient care crosses multiple institutions.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '233', '233', 188, 0, 0, '', 'Services/charges related to the treatment of a hospital-acquired condition or preventable medical error.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '234', '234', 189, 0, 0, '', 'This procedure is not paid separately. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '235', '235', 190, 0, 0, '', 'Sales Tax');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '236', '236', 191, 0, 0, '', 'This procedure or procedure/modifier combination is not compatible with another procedure or procedure/modifier combination provided on the same day according to the National Correct Coding Initiative.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', '237', '237', 192, 0, 0, '', 'Legislated/Regulatory Penalty. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A0', 'A0', 193, 0, 0, '', 'Patient refund amount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A1', 'A1', 194, 0, 0, '', 'Claim/Service denied. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A5', 'A5', 195, 0, 0, '', 'Medicare Claim PPS Capital Cost Outlier Amount.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A6', 'A6', 196, 0, 0, '', 'Prior hospitalization or 30 day transfer requirement not met.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A7', 'A7', 197, 0, 0, '', 'Presumptive Payment Adjustment');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'A8', 'A8', 198, 0, 0, '', 'Ungroupable DRG.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B1', 'B1', 199, 0, 0, '', 'Non-covered visits.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B10', 'B10', 200, 0, 0, '', 'Allowed amount has been reduced because a component of the basic procedure/test was paid. The beneficiary is not liable for more than the charge limit for the basic procedure/test.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B11', 'B11', 201, 0, 0, '', 'The claim/service has been transferred to the proper payer/processor for processing. Claim/service not covered by this payer/processor.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B12', 'B12', 202, 0, 0, '', 'Services not documented in patients'' medical records.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B13', 'B13', 203, 0, 0, '', 'Previously paid. Payment for this claim/service may have been provided in a previous payment.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B14', 'B14', 204, 0, 0, '', 'Only one visit or consultation per physician per day is covered.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B15', 'B15', 205, 0, 0, '', 'This service/procedure requires that a qualifying service/procedure be received and covered. The qualifying other service/procedure has not been received/adjudicated. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payme');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B16', 'B16', 206, 0, 0, '', '''''New Patient'' qualifications were not met.''');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B20', 'B20', 207, 0, 0, '', 'Procedure/service was partially or fully furnished by another provider.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B22', 'B22', 208, 0, 0, '', 'This payment is adjusted based on the diagnosis.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B23', 'B23', 209, 0, 0, '', 'Procedure billed is not authorized per your Clinical Laboratory Improvement Amendment (CLIA) proficiency test.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B4', 'B4', 210, 0, 0, '', 'Late filing penalty.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B5', 'B5', 211, 0, 0, '', 'Coverage/program guidelines were not met or were exceeded.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B7', 'B7', 212, 0, 0, '', 'This provider was not certified/eligible to be paid for this procedure/service on this date of service. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B8', 'B8', 213, 0, 0, '', 'Alternative services were available,And should have been utilized. Note: Refer to the 835 Healthcare Policy Identification Segment (Loop 2110 Service Payment Information REF),If present.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'B9', 'B9', 214, 0, 0, '', 'Patient is enrolled in a Hospice.');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'D23', 'D23', 215, 0, 0, '', 'This dual eligible patient is covered by Medicare Part D per Medicare Retro-Eligibility. At least one Remark Code must be provided (May be comprised of either the NCPDP Reject Reason Code,Or Remittance Advice Remark Code that is not an ALERT.)');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'W1', 'W1', 216, 0, 0, '', 'Workers'' compensation jurisdictional fee schedule adjustment. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Class of Contract Code Identification Segment (Loop 2100 Other Claim Related Information ');
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) VALUES ('MspRemitCodes', 'W2', 'W2', 217, 0, 0, '', 'Payment reduced or denied based on workers'' compensation jurisdictional regulations or payment policies,Use only if no other code is applicable. Note: If adjustment is at the Claim Level,The payer must send and the provider should refer to the 835 Insur');

INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('Lists','NationNotesReplaceButtons','Nation Notes Replace Buttons',1);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('NationNotesReplaceButtons','Yes','Yes',10);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('NationNotesReplaceButtons','No','No',20);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('NationNotesReplaceButtons','Normal','Normal',30);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('NationNotesReplaceButtons','Abnormal','Abnormal',40);
insert into `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) values('Lists','PaymentGateways','Payment Gateways','297','1','0','','');
insert into `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`, `IsDefault`, `OptionValue`, `Mapping`, `Notes`) values('PaymentGateways','AuthorizeNet','Authorize.net','1','0','0','','');

insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Lists','Ptlistcols','Patient List Columns','1','0','','');
insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Ptlistcols','Name'      ,'Full Name'     ,'10','3','','');
insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Ptlistcols','PhoneHome','Home Phone'    ,'20','3','','');
insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Ptlistcols','Ss'        ,'SSN'           ,'30','3','','');
insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Ptlistcols','DOB'       ,'Date of Birth' ,'40','3','','');
insert into listOptions (ListId,OptionId,Title,Seq,OptionValue,Mapping,Notes) values('Ptlistcols','Pubpid'    ,'External ID'   ,'50','3','','');

-- Medical Problem Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','MedicalProblemIssueList','Medical Problem Issue List');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicalProblemIssueList', 'HTN', 'HTN', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicalProblemIssueList', 'Asthma', 'Asthma', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicalProblemIssueList', 'Diabetes', 'Diabetes', 30);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicalProblemIssueList', 'Hyperlipidemia', 'Hyperlipidemia', 40);

-- Medication Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','MedicationIssueList','Medication Issue List');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicationIssueList', 'Norvasc', 'Norvasc', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicationIssueList', 'Lipitor', 'Lipitor', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('MedicationIssueList', 'Metformin', 'Metformin', 30);

-- Allergy Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','AllergyIssueList','Allergy Issue List');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AllergyIssueList', 'Penicillin', 'Penicillin', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AllergyIssueList', 'Sulfa', 'Sulfa', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AllergyIssueList', 'Iodine', 'Iodine', 30);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AllergyIssueList', 'Codeine', 'Codeine', 40);

-- Surgery Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','SurgeryIssueList','Surgery Issue List');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('SurgeryIssueList', 'Tonsillectomy', 'Tonsillectomy', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('SurgeryIssueList', 'Appendectomy', 'Appendectomy', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('SurgeryIssueList', 'Cholecystectomy', 'Cholecystectomy', 30);

-- Dental Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','DentalIssueList','Dental Issue List');

-- General Issue List
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','GeneralIssueList','General Issue List');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Osteopathy', 'Osteopathy', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Chiropractic', 'Chiropractic', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Prevention Rehab', 'Prevention Rehab', 30);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Podiatry', 'Podiatry', 40);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Strength and Conditioning', 'Strength and Conditioning', 50);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Nutritional', 'Nutritional', 60);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Fitness Testing', 'Fitness Testing', 70);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Pre Participation Assessment', 'Pre Participation Assessment', 80);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('GeneralIssueList', 'Screening / Testing', 'Screening / Testing', 90);

-- Issue Types List
INSERT INTO listOptions (`ListId`,`OptionId`,`Title`) VALUES ('Lists','IssueTypes','Issue Types');

-- Issue Subtypes List
INSERT INTO listOptions (ListId,optionId,title) VALUES ('Lists','IssueSubtypes','Issue Subtypes');
INSERT INTO listOptions (ListId,OptionId,title,Seq) VALUES ('IssueSubtypes', 'Eye', 'Eye',10);

-- Insurance Types List
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('Lists','InsuranceTypes','Insurance Types',1);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('InsuranceTypes','Primary'  ,'Primary'  ,10);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('InsuranceTypes','Secondary','Secondary',20);
INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`, `Seq`) VALUES ('InsuranceTypes','Tertiary' ,'Tertiary' ,30);

-- Amendment Statuses
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists' ,'AmendmentStatus','Amendment Status');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AmendmentStatus' ,'Approved','Approved', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AmendmentStatus' ,'Rejected','Rejected', 20);
	
-- Amendment request from
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists' ,'AmendmentFrom','Amendment From');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AmendmentFrom' ,'Patient','Patient', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('AmendmentFrom' ,'Insurance','Insurance', 20);

-- Patient Flow Board Rooms
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','PatientFlowBoardRooms','Patient Flow Board Rooms');
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('PatientFlowBoardRooms', '1', 'Room 1', 10);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('PatientFlowBoardRooms', '2', 'Room 2', 20);
INSERT INTO listOptions(ListId,optionId,title,seq) VALUES ('PatientFlowBoardRooms', '3', 'Room 3', 30);

-- Religious Affiliation
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','ReligiousAffiliation','Religious Affiliation');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Adventist','1001','Adventist','5');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','AfricanReligions','1002','African Religions','15');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Afro-caribbeanReligions','1003','Afro-Caribbean Religions','25');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Agnosticism','1004','Agnosticism','35');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Anglican','1005','Anglican','45');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Animism','1006','Animism','55');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','AssemblyOfGod','1061','Assembly of God','65');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Atheism','1007','Atheism','75');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','BabiBahaiFaiths','1008','Babi & Baha\'I faiths','85');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Baptist','1009','Baptist','95');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Bon','1010','Bon','105');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Brethren','1062','Brethren','115');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','CaoDai','1011','Cao Dai','125');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Celticism','1012','Celticism','135');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Christiannoncatholicnonspecifc','1013','Christian (Non-Catholic,Non-specific)','145');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ChristianScientist','1063','Christian Scientist','155');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ChurchOfChrist','1064','Church of Christ','165');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ChurchOfGod','1065','Church of God','175');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Confucianism','1014','Confucianism','185');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Congregational','1066','Congregational','195');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','CybercultureReligions','1015','Cyberculture Religions','205');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','DisciplesOfChrist','1067','Disciples of Christ','215');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Divination','1016','Divination','225');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','EasternOrthodox','1068','Eastern Orthodox','235');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Episcopalian','1069','Episcopalian','245');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','EvangelicalCovenant','1070','Evangelical Covenant','255');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','FourthWay','1017','Fourth Way','265');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','FreeDaism','1018','Free Daism','275');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Friends','1071','Friends','285');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','FullGospel','1072','Full Gospel','295');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Gnosis','1019','Gnosis','305');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Hinduism','1020','Hinduism','315');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Humanism','1021','Humanism','325');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Independent','1022','Independent','335');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Islam','1023','Islam','345');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Jainism','1024','Jainism','355');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','JehovahsWitnesses','1025','Jehovah\'S Witnesses','365');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Judaism','1026','Judaism','375');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','LatterDaySaints','1027','Latter Day Saints','385');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Lutheran','1028','Lutheran','395');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Mahayana','1029','Mahayana','405');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Meditation','1030','Meditation','415');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','MessianicJudaism','1031','Messianic Judaism','425');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Methodist','1073','Methodist','435');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Mitraism','1032','Mitraism','445');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','NativeAmerican','1074','Native American','455');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Nazarene','1075','Nazarene','465');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','NewAge','1033','New Age','475');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Non-romanCatholic','1034','Non-Roman Catholic','485');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Occult','1035','Occult','495');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Orthodox','1036','Orthodox','505');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Paganism','1037','Paganism','515');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Pentecostal','1038','Pentecostal','525');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Presbyterian','1076','Presbyterian','535');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ProcessThe','1039','Process,The','545');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Protestant','1077','Protestant','555');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ProtestantNoDenomination','1078','Protestant,No Denomination','565');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Reformed','1079','Reformed','575');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ReformedPresbyterian','1040','Reformed/Presbyterian','585');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','RomanCatholicChurch','1041','Roman Catholic Church','595');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','SalvationArmy','1080','Salvation Army','605');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Satanism','1042','Satanism','615');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Scientology','1043','Scientology','625');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Shamanism','1044','Shamanism','635');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ShiiteIslam','1045','Shiite (Islam)','645');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Shinto','1046','Shinto','655');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Sikism','1047','Sikism','665');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Spiritualism','1048','Spiritualism','675');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','SunniIslam','1049','Sunni (Islam)','685');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Taoism','1050','Taoism','695');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Theravada','1051','Theravada','705');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','UnitarianUniversalist','1081','Unitarian Universalist','715');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Unitarian-universalism','1052','Unitarian-Universalism','725');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','UnitedChurchOfChrist','1082','United Church of Christ','735');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','UniversalLifeChurch','1053','Universal Life Church','745');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','VajrayanaTibetan','1054','Vajrayana (Tibetan)','755');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Veda','1055','Veda','765');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Voodoo','1056','Voodoo','775');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Wicca','1057','Wicca','785');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Yaohushua','1058','Yaohushua','795');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','ZenBuddhism','1059','Zen Buddhism','805');
INSERT INTO listOptions (ListId,OptionId,Notes,title,Seq) VALUES ('ReligiousAffiliation','Zoroastrianism','1060','Zoroastrianism','815');

-- Relationship
INSERT INTO listOptions(ListId,optionId,title) VALUES ('Lists','PersonalRelationship','Relationship');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','ADOPT','Adopted Child','ADOPT','10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','AUNT','Aunt','AUNT','20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','CHILD','Child','CHILD','30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','CHLDINLAW','Child in-law','CHLDINLAW','40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','COUSN','Cousin','COUSN','50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','DOMPART','Domestic Partner','DOMPART','60');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','FAMMEMB','Family Member','FAMMEMB','70');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','CHLDFOST','Foster Child','CHLDFOST','80');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','GRNDCHILD','Grandchild','GRNDCHILD','90');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','GPARNT','Grandparent','GPARNT','100');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','GRPRN','Grandparent','GRPRN','110');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','GGRPRN','Great Grandparent','GGRPRN','120');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','HSIB','Half-Sibling','HSIB','130');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','MAUNT','MaternalAunt','MAUNT','140');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','MCOUSN','MaternalCousin','MCOUSN','150');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','MGRPRN','MaternalGrandparent','MGRPRN','160');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','MGGRPRN','MaternalGreatgrandparent','MGGRPRN','170');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','MUNCLE','MaternalUncle','MUNCLE','180');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','NCHILD','Natural Child','NCHILD','190');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','NPRN','Natural Parent','NPRN','200');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','NSIB','Natural Sibling','NSIB','210');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','NBOR','Neighbor','NBOR','220');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','NIENEPH','Niece/Nephew','NIENEPH','230');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PRN','Parent','PRN','240');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PRNINLAW','Parent in-law','PRNINLAW','250');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PAUNT','PaternalAunt','PAUNT','260');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PCOUSN','PaternalCousin','PCOUSN','270');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PGRPRN','PaternalGrandparent','PGRPRN','280');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PGGRPRN','PaternalGreatgrandparent','PGGRPRN','290');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','PUNCLE','PaternalUncle','PUNCLE','300');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','ROOM','Roommate','ROOM','310');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','SIB','Sibling','SIB','320');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','SIBINLAW','Sibling in-law','SIBINLAW','330');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','SIGOTHR','Significant Other','SIGOTHR','340');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','SPS','Spouse','SPS','350');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','STEP','Step Child','STEP','360');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','STPPRN','Step Parent','STPPRN','370');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','STPSIB','Step Sibling','STPSIB','380');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','UNCLE','Uncle','UNCLE','390');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PersonalRelationship','FRND','Unrelated Friend','FRND','400');

-- Severity
INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','SeverityCcda','Severity');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','Unassigned','Unassigned','','10');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','Mild','Mild','SNOMED-CT:255604002','20');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','MildToModerate','Mild to moderate','SNOMED-CT:371923003','30');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','Moderate','Moderate','SNOMED-CT:6736007','40');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','ModerateToSevere','Moderate to severe','SNOMED-CT:371924009','50');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','Severe','Severe','SNOMED-CT:24484000','60');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','LifeThreateningSeverity','Life threatening severity','SNOMED-CT:442452003','70');
INSERT INTO listOptions (ListId,OptionId,Title,Codes,Seq) values ('SeverityCcda','Fatal','Fatal','SNOMED-CT:399166001','80');

-- Physician Type

INSERT INTO listOptions (ListId,optionId,title) VALUES ('Lists','PhysicianType','Physician Type');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','AttendingPhysician','SNOMED-CT:405279007','Attending physician', '10');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','AudiologicalPhysician','SNOMED-CT:310172001','Audiological physician', '20');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','ChestPhysician','SNOMED-CT:309345004','Chest physician', '30');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','CommunityHealthPhysician','SNOMED-CT:23278007','Community health physician', '40');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','ConsultantPhysician','SNOMED-CT:158967008','Consultant physician', '50');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','GeneralPhysician','SNOMED-CT:59058001','General physician', '60');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','Genitourinarymedicinephysician','SNOMED-CT:309358003','Genitourinary medicine physician', '70');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','OccupationalPhysician','SNOMED-CT:158973009','Occupational physician', '80');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','PalliativeCarePhysician','SNOMED-CT:309359006','Palliative care physician', '90');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','Physician','SNOMED-CT:309343006','Physician', '100');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','PublicHealthPhysician','SNOMED-CT:56466003','Public health physician', '110');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','RehabilitationPhysician','SNOMED-CT:309360001','Rehabilitation physician', '120');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','ResidentPhysician','SNOMED-CT:405277009','Resident physician', '130');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','SpecializedPhysician','SNOMED-CT:69280009','Specialized physician', '140');
INSERT INTO listOptions (ListId,OptionId,Codes,title,Seq) VALUES ('PhysicianType','ThoracicPhysician','SNOMED-CT:309346003','Thoracic physician', '150');

-- Industry

INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`) VALUES('Lists','Industry','Industry');
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Industry', 'LawFirm', 'Law Firm', 10);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Industry', 'EngineeringFirm', 'Engineering Firm', 20);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Industry', 'ConstructionFirm', 'Construction Firm', 30);

-- Occupation

INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`) VALUES('Lists','Occupation','Occupation');
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Occupation', 'Lawyer', 'Lawyer', 10);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Occupation', 'Engineer', 'Engineer', 20);
INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Occupation', 'SiteWorker', 'Site Worker', 30);

-- Reaction

INSERT INTO `ListOptions` (`ListId`, `OptionId`, `Title`) VALUES('Lists','Reaction','Reaction');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,Codes ) VALUES ('Reaction', 'Unassigned', 'Unassigned', 10, '');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,Codes ) VALUES ('Reaction', 'Hives', 'Hives', 20, 'SNOMED-CT:247472004');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,Codes ) VALUES ('Reaction', 'Nausea', 'Nausea', 30, 'SNOMED-CT:422587007');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,Codes ) VALUES ('Reaction', 'ShortnessOfBreath', 'Shortness of Breath', 40, 'SNOMED-CT:267036007');

-- County

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','County','County');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('County','Adair','ADAIR','001', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('County','Andrew','ANDREW','003', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('County','Atchison','ATCHISON','005', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('County','Audrain','AUDRAIN','007', '40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('County','Barry','BARRY','009', '50');

-- Immunization Manufacturers

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationManufacturer','Immunization Manufacturer');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AB','Abbott Laboratories','AB','10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','ACA','Acambis,Inc','ACA','20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AD','Adams Laboratories,Inc.','AD','30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AKR','Akorn,Inc','AKR','40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','ALP','Alpha Therapeutic Corporation','ALP','50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AR','Armour','AR','60');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AVB','Aventis Behring L.L.C.','AVB','70');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','AVI','Aviron','AVI','80');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BRR','Barr Laboratories','BRR','90');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BAH','Baxter Healthcare Corporation','BAH','100');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BA','Baxter Healthcare Corporation-inactive','BA','110');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BAY','Bayer Corporation','BAY','120');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BP','Berna Products','BP','130');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BPC','Berna Products Corporation','BPC','140');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','BTP','Biotest Pharmaceuticals Corporation','BTP','150');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CNJ','Cangene Corporation','CNJ','160');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CMP','Celltech Medeva Pharmaceuticals','CMP','170');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CEN','Centeon L.L.C.','CEN','180');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CHI','Chiron Corporation','CHI','190');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CON','Connaught','CON','200');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CRU','Crucell','CRU','210');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','CSL','CSL Behring,Inc','CSL','220');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','DVC','DynPort Vaccine Company,LLC','DVC','230');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MIP','Emergent BioDefense Operations Lansing','MIP','240');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','EVN','Evans Medical Limited','EVN','250');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','GEO','GeoVax Labs,Inc.','GEO','260');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','SKB','GlaxoSmithKline','SKB','270');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','GRE','Greer Laboratories,Inc.','GRE','280');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','GRF','Grifols','GRF','290');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','IDB','ID Biomedical','IDB','300');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','IAG','Immuno International AG','IAG','310');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','IUS','Immuno-U.S.,Inc.','IUS','320');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','INT','Intercell Biomedical','INT','330');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','JNJ','Johnson and Johnson','JNJ','340');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','KGC','Korea Green Cross Corporation','KGC','350');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','LED','Lederle','LED','360');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MBL','Massachusetts Biologic Laboratories','MBL','370');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MA','Massachusetts Public Health Biologic Laboratories','MA','380');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MED','MedImmune,Inc.','MED','390');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MSD','Merck and Co.,Inc.','MSD','400');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','IM','Merieux','IM','410');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','MIL','Miles','MIL','420');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','NAB','NABI','NAB','430');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','NYB','New York Blood Center','NYB','440');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','NAV','North American Vaccine,Inc.','NAV','450');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','NOV','Novartis Pharmaceutical Corporation','NOV','460');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','NVX','Novavax,Inc.','NVX','470');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','OTC','Organon Teknika Corporation','OTC','480');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','ORT','Ortho-clinical Diagnostics','ORT','490');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','OTH','Other manufacturer','OTH','500');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PD','Parkedale Pharmaceuticals','PD','510');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PFR','Pfizer,Inc','PFR','520');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PWJ','PowderJect Pharmaceuticals','PWJ','530');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PRX','Praxis Biologics','PRX','540');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PSC','Protein Sciences','PSC','550');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','PMC','Sanofi pasteur','PMC','560');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','SCL','Sclavo,Inc.','SCL','570');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','SOL','Solvay Pharmaceuticals','SOL','580');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','SI','Swiss Serum and Vaccine Inst.','SI','590');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','TAL','Talecris Biotherapeutics','TAL','600');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','JPN','The Research Foundation for Microbial Diseases of Osaka University (BIKEN)','JPN','610');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','USA','United States Army Medical Research and Material Command','USA','620');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','UNK','Unknown manufacturer','UNK','630');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','VXG','VaxGen','VXG','640');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','WAL','Wyeth','WAL','650');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','WA','Wyeth-Ayerst','WA','660');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationManufacturer','ZLB','ZLB Behring','ZLB','670');

-- Immunization Completion Status

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationCompletionStatus','Immunization Completion Status');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationCompletionStatus','Completed','Completed','CP', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationCompletionStatus','Refused','Refused','RE', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationCompletionStatus','NotAdministered','Not Administered','NA', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationCompletionStatus','PartiallyAdministered','Partially Administered','PA', '40');

-- Immunization Registry Status

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationRegistryStatus','Immunization Registry Status');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','Active','Active','A', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','InactiveLostToFollowUp','Inactive - Lost to follow - up','L', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','InactiveMovedGoneElsewhere','Inactive - Moved or gone elsewhere','M', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','InactivePermanentlyInactive','Inactive - Permanently inactive','P', '40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','InactiveUnspecified','Inactive - Unspecified','I', '50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRegistryStatus','Unknown','Unknown','U', '60');

-- Publicity Code

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','PublicityCode','Publicity Code');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','NoReminderRecall','No reminder/recall','SI', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderRecallAnyMethod','Reminder/recall - any method','02', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderRecallNoCalls','Reminder/recall - no calls','03', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderOnlyAnyMethod','Reminder only - any method','04', '40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderOnlyNoCalls','Reminder only - no calls','05', '50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','RecallOnlyAnyMethod','Recall only - any method','06', '60');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','RecallOnlyNoCalls','Recall only - no calls','07', '70');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderRecallToProvider','Reminder/recall - to provider','08', '80');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderToProvider','Reminder to provider','09', '90');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','ReminderToProviderNoRecall','Only reminder to provider,No recall','10', '100');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','RecallToProvider','Recall to provider','11', '110');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('PublicityCode','RecallToProviderNoReminder','Only recall to provider,No reminder','12', '120');

-- Immunization Refusal Reason

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationRefusalReason','Immunization Refusal Reason');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRefusalReason','ParentalDecision','Parental decision','00', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRefusalReason','ReligiousExemption','Religious exemption','01', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRefusalReason','Other','Other','02', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationRefusalReason','PatientDecision','Patient decision','03', '40');

-- Immunization Information Source

INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationInformationsource','Immunization Information Source');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','NewImmunizationRecord','New Immunization Record','00', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','HistInfSrcUnspecified','Historical information -source unspecified','01', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','OtherProvider','Other Provider','02', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','ParentWrittenRecord','Parent Written Record','03', '40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','ParentRecall','Parent Recall','04', '50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','OtherRegistry','Other Registry','05', '60');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','BirthCertificate','Birth Certificate','06', '70');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','SchoolRecord','School Record','07', '80');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationInformationsource','PublicAgency','Public Agency','08', '90');

-- Next of kin Relationship
INSERT INTO `ListOptions` (ListId,OptionId,Title) VALUES ('Lists','NextOfKinRelationship','Next of Kin Relationship');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Associate','Associate','10','ASC');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) values ('NextOfKinRelationship','Brother','Brother','20','BRO');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','CareGiver','Care giver','30','CGV');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Child','Child','40','CHD');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','HandicappedDependent','Handicapped dependent','50','DEP');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','LifePartner','Life partner','60','DOM');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','EmergencyContact','Emergency contact','70','EMC');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Employee','Employee','80','EME');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Employer','Employer','90','EMR');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','ExtendedFamily','Extended family','100','EXF');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','FosterChild','Foster Child','110','FCH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Friend','Friend','120','FND');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Father','Father','130','FTH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Grandchild','Grandchild','140','GCH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Guardian','Guardian','150','GRD');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Grandparent','Grandparent','160','GRP');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Manager','Manager','170','MGR');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Mother','Mother','180','MTH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','NaturalChild','Natural child','190','NCH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','None','None','200','NON');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','OtherAdult','Other adult','210','OAD');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Other','Other','220','OTH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Owner','Owner','230','OWN');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Parent','Parent','240','PAR');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Stepchild','Stepchild','250','SCH');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Self','Self','260','SEL');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Sibling','Sibling','270','SIB');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Sister','Sister','280','SIS');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Spouse','Spouse','290','SPO');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Trainer','Trainer','300','TRA');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','Unknown','Unknown','310','UNK');
INSERT INTO `ListOptions` (ListId,OptionId,Title,Seq,Notes) VALUES ('NextOfKinRelationship','WardOfCourt','Ward of court','320','WRD');

-- Immunization Administered Site
INSERT INTO listOptions (ListId,OptionId,Title) VALUES ('Lists','ImmunizationAdministeredSite','Immunization Administered Site');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftThigh','Left Thigh','LT', '10');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftArm','Left Arm','LA', '20');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftDeltoid','Left Deltoid','LD', '30');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftGluteusMedius','Left Gluteus Medius','LG', '40');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftVastusLateralis','Left Vastus Lateralis','LVL', '50');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','LeftLowerForearm','Left Lower Forearm','LLFA', '60');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','Nose','Nose','Nose', '70');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightArm','Right Arm','RA', '80');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightThigh','Right Thigh','RT', '90');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightVastusLateralis','Right Vastus Lateralis','RVL', '100');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightGluteusMedius','Right Gluteus Medius','RG', '110');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightDeltoid','Right Deltoid','RD', '120');
INSERT INTO listOptions (ListId,OptionId,Title,Notes,Seq) VALUES ('ImmunizationAdministeredSite','RightLowerForearm','Right Lower Forearm','RLFA', '130');

-- Immunization Observation Criteria
INSERT INTO `ListOptions`(`ListId`, `OptionId`, `Title`) VALUES ('Lists','ImmunizationObservation','Immunization Observation Criteria');
INSERT INTO `ListOptions`(`ListId`, `OptionId`, `Title`, `Seq`, `Notes`, `Codes`) VALUES ('ImmunizationObservation','FundingProgramEligibility','Vaccine funding program eligibility category','10','LN','LOINC:64994-7');
INSERT INTO `ListOptions`(`ListId`, `OptionId`, `Title`, `Seq`, `Notes`, `Codes`) VALUES ('ImmunizationObservation','VaccineType','Vaccine Type','20','LN','LOINC:30956-7');
INSERT INTO `ListOptions`(`ListId`, `OptionId`, `Title`, `Seq`, `Notes`, `Codes`) VALUES ('ImmunizationObservation','DiseaseWithPresumedImmunity','Disease with presumed immunity','30','LN','LOINC:59784-9');

-- Immunization Vaccine Eligibility Results
INSERT INTO `ListOptions`(`ListId`, `OptionId`, `Title`) VALUES ('Lists','ImmVacEligibilityResults','Immunization Vaccine Eligibility Results');
INSERT INTO `ListOptions`(ListId,OptionId,Title,Seq,Notes) VALUES ('ImmVacEligibilityResults','NotVfcEligible','Not VFC eligible','10','V01');
INSERT INTO `ListOptions`(ListId,OptionId,Title,Seq,Notes) VALUES ('ImmVacEligibilityResults','MedicaidManagedCare','VFC eligible-Medicaid/Medicaid Managed Care','20','V02');
INSERT INTO `ListOptions`(ListId,OptionId,Title,Seq,Notes) VALUES ('ImmVacEligibilityResults','Uninsured','VFC eligible- Uninsured','30','V03');
INSERT INTO `ListOptions`(ListId,OptionId,Title,Seq,Notes) VALUES ('ImmVacEligibilityResults','AmericanIndianAlaskanNative','VFC eligible- American Indian/Alaskan Native','40','V04');
INSERT INTO `ListOptions`(ListId,OptionId,Title,Seq,Notes) VALUES ('ImmVacEligibilityResults','HealthCenterPatient','VFC eligible-Federally Qualified Health Center Patient (Under-insured)','50','V05');

-- --------------------------------------------------------

-- 
-- Table structure for table `Lists`
-- 

DROP TABLE IF EXISTS `Lists`;
CREATE TABLE `Lists` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Type` varchar(255) default NULL,
  `Subtype` varchar(31) NOT NULL DEFAULT '',
  `Title` varchar(255) default NULL,
  `Begdate` date default NULL,
  `Enddate` date default NULL,
  `Returndate` date default NULL,
  `Occurrence` int(11) default '0',
  `Classification` int(11) default '0',
  `Referredby` varchar(255) default NULL,
  `Extrainfo` varchar(255) default NULL,
  `Diagnosis` varchar(255) default NULL,
  `Activity` tinyint(4) default NULL,
  `Comments` longtext,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Outcome` int(11) NOT NULL default '0',
  `Destination` varchar(255) default NULL,
  `ReinjuryId` bigint(20)  NOT NULL DEFAULT 0,
  `InjuryPart` varchar(31) NOT NULL DEFAULT '',
  `InjuryType` varchar(31) NOT NULL DEFAULT '',
  `InjuryGrade` varchar(31) NOT NULL DEFAULT '',
  `Reaction` varchar(255) NOT NULL DEFAULT '',
  `ExternalAllergyid` INT(11) DEFAULT NULL,
  `ErxSource` ENUM('0','1') DEFAULT '0' NOT NULL  COMMENT '0-OpenEMR 1-External',
  `ErxUploaded` ENUM('0','1') DEFAULT '0' NOT NULL  COMMENT '0-Pending NewCrop upload 1-Uploaded TO NewCrop',
  `Modifydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SeverityAl` VARCHAR( 50 ) DEFAULT NULL,
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`),
  KEY `Type` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ListsTouch`
--

DROP TABLE IF EXISTS `ListsTouch`;
CREATE TABLE `ListsTouch` (
  `Pid` bigint(20) NOT NULL default '0',
  `Type` varchar(255) NOT NULL default '',
  `Date` datetime default NULL,
  PRIMARY KEY  (`Pid`,`Type`)
) ENGINE=InnoDB ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Log`
-- 

DROP TABLE IF EXISTS `Log`;
CREATE TABLE `Log` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Event` varchar(255) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Comments` longtext,
  `UserNotes` longtext,
  `PatientId` bigint(20) default NULL,
  `Success` tinyint(1) default 1,
  `Checksum` longtext,
  `CrtUser` varchar(255) default NULL,
  `LogFrom` VARCHAR(20) DEFAULT 'Open-emr',
  `MenuItemId` INT(11) DEFAULT NULL,
  `CcdaDocId` INT(11) DEFAULT NULL COMMENT 'CCDA document id from ccda',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--
CREATE TABLE `Modules` (
  `ModId` INT(11) NOT NULL AUTO_INCREMENT,
  `ModName` VARCHAR(64) NOT NULL DEFAULT '0',
  `ModDirectory` VARCHAR(64) NOT NULL DEFAULT '',
  `ModParent` VARCHAR(64) NOT NULL DEFAULT '',
  `ModType` VARCHAR(64) NOT NULL DEFAULT '',
  `ModActive` INT(1) UNSIGNED NOT NULL DEFAULT '0',
  `ModUiName` VARCHAR(20) NOT NULL DEFAULT '''',
  `ModRelativeLink` VARCHAR(64) NOT NULL DEFAULT '',
  `ModUiOrder` TINYINT(3) NOT NULL DEFAULT '0',
  `ModUiActive` INT(1) UNSIGNED NOT NULL DEFAULT '0',
  `ModDescription` VARCHAR(255) NOT NULL DEFAULT '',
  `ModNickName` VARCHAR(25) NOT NULL DEFAULT '',
  `ModEncMenu` VARCHAR(10) NOT NULL DEFAULT 'No',
  `PermissionsItemTable` CHAR(100) DEFAULT NULL,
  `Directory` VARCHAR(255) NOT NULL,
  `Date` DATETIME NOT NULL,
  `SqlRun` TINYINT(4) DEFAULT '0',
  `Type` TINYINT(4) DEFAULT '0',
  PRIMARY KEY (`ModId`,`ModDirectory`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModuleAclGroupSettings`
--
CREATE TABLE `ModuleAclGroupSettings` (
  `ModuleId` int(11) NOT NULL,
  `GroupId` int(11) NOT NULL,
  `SectionId` int(11) NOT NULL,
  `Allowed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ModuleId`,`GroupId`,`SectionId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModuleAclSections`
--
CREATE TABLE `ModuleAclSections` (
  `SectionId` int(11) DEFAULT NULL,
  `SectionName` varchar(255) DEFAULT NULL,
  `ParentSection` int(11) DEFAULT NULL,
  `SectionIdentifier` varchar(50) DEFAULT NULL,
  `ModuleId` int(11) DEFAULT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModuleAclUserSettings`
--
CREATE TABLE `ModuleAclUserSettings` (
  `ModuleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `SectionId` int(11) NOT NULL,
  `Allowed` int(1) DEFAULT NULL,
  PRIMARY KEY (`ModuleId`,`UserId`,`SectionId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModuleConfiguration`
--
CREATE TABLE `ModuleConfiguration` (
  `ModuleConfigId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ModuleId` int(10) unsigned NOT NULL,
  `FieldName` varchar(45) NOT NULL,
  `FieldValue` varchar(255) NOT NULL,
  PRIMARY KEY (`ModuleConfigId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModulesHooksSettings`
--
CREATE TABLE `ModulesHooksSettings` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModId` int(11) DEFAULT NULL,
  `EnabledHooks` varchar(255) DEFAULT NULL,
  `AttachedTo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ModulesSettings`
--
CREATE TABLE `ModulesSettings` (
  `ModId` INT(11) DEFAULT NULL,
  `FldType` SMALLINT(6) DEFAULT NULL COMMENT '1=>ACL,2=>preferences,3=>hooks',
  `ObjName` VARCHAR(255) DEFAULT NULL,
  `MenuName` VARCHAR(255) DEFAULT NULL,
  `Path` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Notes`
-- 

DROP TABLE IF EXISTS `Notes`;
CREATE TABLE `Notes` (
  `Id` int(11) NOT NULL default '0',
  `ForeignId` int(11) NOT NULL default '0',
  `Note` varchar(255) default NULL,
  `Owner` int(11) default NULL,
  `Date` datetime default NULL,
  `Revision` timestamp NOT NULL,
  PRIMARY KEY  (`Id`),
  KEY `ForeignId` (`Owner`),
  KEY `ForeignId2` (`ForeignId`),
  KEY `Date` (`Date`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Onotes`
-- 

DROP TABLE IF EXISTS `Onotes`;
CREATE TABLE `Onotes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Body` longtext,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Activity` tinyint(4) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrModuleVars`
-- 

DROP TABLE IF EXISTS `OpenemrModuleVars`;
CREATE TABLE `OpenemrModuleVars` (
  `PnId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PnModname` varchar(64) default NULL,
  `PnName` varchar(64) default NULL,
  `PnValue` longtext,
  PRIMARY KEY  (`PnId`),
  KEY `PnModname` (`PnModname`),
  KEY `PnName` (`PnName`)
) ENGINE=InnoDB AUTO_INCREMENT=235 ;

-- 
-- Dumping data for table `OpenemrModuleVars`
-- 

INSERT INTO `OpenemrModuleVars` VALUES (234, 'PostCalendar', 'PcNotifyEmail', '');
INSERT INTO `OpenemrModuleVars` VALUES (233, 'PostCalendar', 'PcNotifyAdmin', '0');
INSERT INTO `OpenemrModuleVars` VALUES (232, 'PostCalendar', 'PcCacheLifetime', '3600');
INSERT INTO `OpenemrModuleVars` VALUES (231, 'PostCalendar', 'PcUseCache', '0');
INSERT INTO `OpenemrModuleVars` VALUES (230, 'PostCalendar', 'PcDefaultView', 'Day');
INSERT INTO `OpenemrModuleVars` VALUES (229, 'PostCalendar', 'PcTimeIncrement', '5');
INSERT INTO `OpenemrModuleVars` VALUES (228, 'PostCalendar', 'PcAllowUserCalendar', '1');
INSERT INTO `OpenemrModuleVars` VALUES (227, 'PostCalendar', 'PcAllowSiteWide', '1');
INSERT INTO `OpenemrModuleVars` VALUES (226, 'PostCalendar', 'PcTemplate', 'Default');
INSERT INTO `OpenemrModuleVars` VALUES (225, 'PostCalendar', 'PcEventDateFormat', '%Y-%m-%d');
INSERT INTO `OpenemrModuleVars` VALUES (224, 'PostCalendar', 'PcDisplayTopics', '0');
INSERT INTO `OpenemrModuleVars` VALUES (223, 'PostCalendar', 'PcListHowManyEvents', '15');
INSERT INTO `OpenemrModuleVars` VALUES (222, 'PostCalendar', 'PcAllowDirectSubmit', '1');
INSERT INTO `OpenemrModuleVars` VALUES (221, 'PostCalendar', 'PcUsePopups', '0');
INSERT INTO `OpenemrModuleVars` VALUES (220, 'PostCalendar', 'PcDayHighlightColor', '#EEEEEE');
INSERT INTO `OpenemrModuleVars` VALUES (219, 'PostCalendar', 'PcFirstDayOfWeek', '1');
INSERT INTO `OpenemrModuleVars` VALUES (218, 'PostCalendar', 'PcUseInternationalDates', '0');
INSERT INTO `OpenemrModuleVars` VALUES (217, 'PostCalendar', 'PcEventsOpenInNewWindow', '0');
INSERT INTO `OpenemrModuleVars` VALUES (216, 'PostCalendar', 'PcTime24Hours', '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrModules`
-- 

DROP TABLE IF EXISTS `OpenemrModules`;
CREATE TABLE `OpenemrModules` (
  `PnId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PnName` varchar(64) default NULL,
  `PnType` int(6) NOT NULL default '0',
  `PnDisplayname` varchar(64) default NULL,
  `PnDescription` varchar(255) default NULL,
  `PnRegid` int(11) unsigned NOT NULL default '0',
  `PnDirectory` varchar(64) default NULL,
  `PnVersion` varchar(10) default NULL,
  `PnAdminCapable` tinyint(1) NOT NULL default '0',
  `PnUserCapable` tinyint(1) NOT NULL default '0',
  `PnState` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`PnId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 ;

-- 
-- Dumping data for table `OpenemrModules`
-- 

INSERT INTO `OpenemrModules` VALUES (46, 'PostCalendar', 2, 'PostCalendar', 'PostNuke Calendar Module', 0, 'PostCalendar', '4.0.0', 1, 1, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrPostcalendarCategories`
-- 

DROP TABLE IF EXISTS `OpenemrPostcalendarCategories`;
CREATE TABLE `OpenemrPostcalendarCategories` (
  `PcCatid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PcCatname` varchar(100) default NULL,
  `PcCatcolor` varchar(50) default NULL,
  `PcCatdesc` text,
  `PcRecurrtype` int(1) NOT NULL default '0',
  `PcEnddate` date default NULL,
  `PcRecurrspec` text,
  `PcRecurrfreq` int(3) NOT NULL default '0',
  `PcDuration` bigint(20) NOT NULL default '0',
  `PcEndDateFlag` tinyint(1) NOT NULL default '0',
  `PcEndDateType` int(2) default NULL,
  `PcEndDateFreq` int(11) NOT NULL default '0',
  `PcEndAllDay` tinyint(1) NOT NULL default '0',
  `PcDailylimit` int(2) NOT NULL default '0',
  `PcCattype` INT( 11 ) NOT NULL COMMENT 'Used in grouping categories',
  `PcActive` tinyint(1) NOT NULL default 1,
  `PcSeq` int(11) NOT NULL default '0',
  PRIMARY KEY  (`PcCatid`),
  KEY `BasicCat` (`PcCatname`,`PcCatcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `OpenemrPostcalendarCategories`
-- 

INSERT INTO `OpenemrPostcalendarCategories` VALUES (5, 'Office Visit', '#FFFFCC', 'Normal Office Visit', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0,0,1,5);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (4, 'Vacation', '#EFEFEF', 'Reserved for use to define Scheduled Vacation Time', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 0, 0, 0, 0, 1, 0, 1,1,4);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (1, 'No Show', '#DDDDDD', 'Reserved to define when an event did not occur as specified.', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 0, 0, 0, 0, 0, 0, 0,1,1);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (2, 'In Office', '#99CCFF', 'Reserved todefine when a provider may haveavailable appointments after.', 1,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"1";s:22:"eventRepeatFreqType";s:1:"4";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 0, 1, 3, 2, 0, 0, 1,1,2);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (3, 'Out Of Office', '#99FFFF', 'Reserved to define when a provider may not have available appointments after.', 1,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"1";s:22:"eventRepeatFreqType";s:1:"4";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 0, 1, 3, 2, 0, 0, 1,1,3);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (8, 'Lunch', '#FFFF33', 'Lunch', 1,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"1";s:22:"eventRepeatFreqType";s:1:"4";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 3600, 0, 3, 2, 0, 0, 1,1,8);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (9, 'Established Patient', '#CCFF33', '', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0, 0,1,9);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (10,'New Patient', '#CCFFFF', '', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 1800, 0, 0, 0, 0, 0, 0,1,10);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (11,'Reserved','#FF7777','Reserved',1,NULL,'A:5:{s:17:\"eventRepeatFreq\";s:1:\"1\";s:22:\"eventRepeatFreqType\";s:1:\"4\";s:19:\"eventRepeatOnNum\";s:1:\"1\";s:19:\"eventRepeatOnDay\";s:1:\"0\";s:20:\"eventRepeatOnFreq\";s:1:\"0\";}',0,900,0,3,2,0,0, 1,1,11);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (12, 'Health and Behavioral Assessment', '#C7C7C7', 'Health and Behavioral Assessment', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0,0,1,12);
INSERT INTO `OpenemrPostcalendarCategories` VALUES (13, 'Preventive Care Services', '#CCCCFF', 'Preventive Care Services', 0,NULL, 'A:5:{s:17:"eventRepeatFreq";s:1:"0";s:22:"eventRepeatFreqType";s:1:"0";s:19:"eventRepeatOnNum";s:1:"1";s:19:"eventRepeatOnDay";s:1:"0";s:20:"eventRepeatOnFreq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0,0,1,13);

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrPostcalendarEvents`
-- 

DROP TABLE IF EXISTS `OpenemrPostcalendarEvents`;
CREATE TABLE `OpenemrPostcalendarEvents` (
  `PcEid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PcCatid` int(11) NOT NULL default '0',
  `PcMultiple` int(10) unsigned NOT NULL,
  `PcAid` varchar(30) default NULL,
  `PcPid` varchar(11) default NULL,
  `PcTitle` varchar(150) default NULL,
  `PcTime` datetime default NULL,
  `PcHometext` text,
  `PcComments` int(11) default '0',
  `PcCounter` mediumint(8) unsigned default '0',
  `PcTopic` int(3) NOT NULL default '1',
  `PcInformant` varchar(20) default NULL,
  `PcEventDate` date NOT NULL default '0000-00-00',
  `PcEndDate` date NOT NULL default '0000-00-00',
  `PcDuration` bigint(20) NOT NULL default '0',
  `PcRecurrtype` int(1) NOT NULL default '0',
  `PcRecurrspec` text,
  `PcRecurrfreq` int(3) NOT NULL default '0',
  `PcStartTime` time default NULL,
  `PcEndTime` time default NULL,
  `PcAlldayevent` int(1) NOT NULL default '0',
  `PcLocation` text,
  `PcConttel` varchar(50) default NULL,
  `PcContname` varchar(50) default NULL,
  `PcContemail` varchar(255) default NULL,
  `PcWebsite` varchar(255) default NULL,
  `PcFee` varchar(50) default NULL,
  `PcEventstatus` int(11) NOT NULL default '0',
  `PcSharing` int(11) NOT NULL default '0',
  `PcLanguage` varchar(30) default NULL,
  `PcApptstatus` varchar(15) NOT NULL default '-',
  `PcPrefcatid` int(11) NOT NULL default '0',
  `PcFacility` smallint(6) NOT NULL default '0' COMMENT 'Facility id for this event',
  `PcSendalertsms` VARCHAR(3) NOT NULL DEFAULT 'NO',
  `PcSendalertemail` VARCHAR( 3 ) NOT NULL DEFAULT 'NO',
  `PcBillingLocation` SMALLINT (6) NOT NULL DEFAULT '0',
  `PcRoom` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY  (`PcEid`),
  KEY `BasicEvent` (`PcCatid`,`PcAid`,`PcEventDate`,`PcEndDate`,`PcEventstatus`,`PcSharing`,`PcTopic`),
  KEY `PcEventDate` (`PcEventDate`)
) ENGINE=InnoDB AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrPostcalendarLimits`
-- 

DROP TABLE IF EXISTS `OpenemrPostcalendarLimits`;
CREATE TABLE `OpenemrPostcalendarLimits` (
  `PcLimitid` int(11) NOT NULL AUTO_INCREMENT,
  `PcCatid` int(11) NOT NULL default '0',
  `PcStarttime` time NOT NULL default '00:00:00',
  `PcEndtime` time NOT NULL default '00:00:00',
  `PcLimit` int(11) NOT NULL default '1',
  PRIMARY KEY  (`PcLimitid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrPostcalendarTopics`
-- 

DROP TABLE IF EXISTS `OpenemrPostcalendarTopics`;
CREATE TABLE `OpenemrPostcalendarTopics` (
  `PcCatid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PcCatname` varchar(100) default NULL,
  `PcCatcolor` varchar(50) default NULL,
  `PcCatdesc` text,
  PRIMARY KEY  (`PcCatid`),
  KEY `BasicCat` (`PcCatname`,`PcCatcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `OpenemrSessionInfo`
-- 

DROP TABLE IF EXISTS `OpenemrSessionInfo`;
CREATE TABLE `OpenemrSessionInfo` (
  `PnSessid` varchar(32) NOT NULL default '',
  `PnIpaddr` varchar(20) default NULL,
  `PnFirstused` int(11) NOT NULL default '0',
  `PnLastused` int(11) NOT NULL default '0',
  `PnUid` int(11) NOT NULL default '0',
  `PnVars` blob,
  PRIMARY KEY  (`PnSessid`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `PatientAccessOnsite`
--

DROP TABLE IF EXISTS `PatientAccessOnsite`;
CREATE TABLE `PatientAccessOnsite`(
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Pid` INT(11),
  `PortalUsername` VARCHAR(100) ,
  `PortalPwd` VARCHAR(100) ,
  `PortalPwdStatus` TINYINT DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
  `PortalSalt` VARCHAR(100) ,
  PRIMARY KEY (`Id`)
)ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

-- 
-- Table structure for table `PatientData`
-- 

DROP TABLE IF EXISTS `PatientData`;
CREATE TABLE `PatientData` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TenantId` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL default '',
  `Language` varchar(255) NOT NULL default '',
  `Financial` varchar(255) NOT NULL default '',
  `Fname` varchar(255) NOT NULL default '',
  `Lname` varchar(255) NOT NULL default '',
  `Mname` varchar(255) NOT NULL default '',
  `DOB` date default NULL,
  `Street` varchar(255) NOT NULL default '',
  `PostalCode` varchar(255) NOT NULL default '',
  `City` varchar(255) NOT NULL default '',
  `State` varchar(255) NOT NULL default '',
  `CountryCode` varchar(255) NOT NULL default '',
  `DriversLicense` varchar(255) NOT NULL default '',
  `Ss` varchar(255) NOT NULL default '',
  `Occupation` longtext,
  `PhoneHome` varchar(255) NOT NULL default '',
  `PhoneBiz` varchar(255) NOT NULL default '',
  `PhoneContact` varchar(255) NOT NULL default '',
  `PhoneCell` varchar(255) NOT NULL default '',
  `PharmacyId` int(11) NOT NULL default '0',
  `Status` varchar(255) NOT NULL default '',
  `ContactRelationship` varchar(255) NOT NULL default '',
  `Date` datetime default NULL,
  `Sex` varchar(255) NOT NULL default '',
  `Referrer` varchar(255) NOT NULL default '',
  `ReferrerID` varchar(255) NOT NULL default '',
  `ProviderID` int(11) default NULL,
  `RefProviderID` int(11) default NULL,
  `Email` varchar(255) NOT NULL default '',
  `EmailDirect` varchar(255) NOT NULL default '',
  `Ethnoracial` varchar(255) NOT NULL default '',
  `Race` varchar(255) NOT NULL default '',
  `Ethnicity` varchar(255) NOT NULL default '',
  `Religion` varchar(40) NOT NULL default '',
  `Interpretter` varchar(255) NOT NULL default '',
  `Migrantseasonal` varchar(255) NOT NULL default '',
  `FamilySize` varchar(255) NOT NULL default '',
  `MonthlyIncome` varchar(255) NOT NULL default '',
  `BillingNote` text,
  `Homeless` varchar(255) NOT NULL default '',
  `FinancialReview` datetime default NULL,
  `Pubpid` varchar(255) NOT NULL default '',
  `Pid` bigint(20) NOT NULL default '0',
  `Genericname1` varchar(255) NOT NULL default '',
  `Genericval1` varchar(255) NOT NULL default '',
  `Genericname2` varchar(255) NOT NULL default '',
  `Genericval2` varchar(255) NOT NULL default '',
  `HipaaMail` varchar(3) NOT NULL default '',
  `HipaaVoice` varchar(3) NOT NULL default '',
  `HipaaNotice` varchar(3) NOT NULL default '',
  `HipaaMessage` varchar(20) NOT NULL default '',
  `HipaaAllowsms` VARCHAR(3) NOT NULL DEFAULT 'NO',
  `HipaaAllowemail` VARCHAR(3) NOT NULL DEFAULT 'NO',
  `Squad` varchar(32) NOT NULL default '',
  `Fitness` int(11) NOT NULL default '0',
  `ReferralSource` varchar(30) NOT NULL default '',
  `Pricelevel` varchar(255) NOT NULL default 'Standard',
  `Regdate`     date DEFAULT NULL COMMENT 'Registration Date',
  `Contrastart` date DEFAULT NULL COMMENT 'Date contraceptives initially used',
  `CompletedAd` VARCHAR(3) NOT NULL DEFAULT 'NO',
  `AdReviewed` date DEFAULT NULL,
  `Vfc` varchar(255) NOT NULL DEFAULT '',
  `Mothersname` varchar(255) NOT NULL DEFAULT '',
  `Guardiansname` TEXT,
  `AllowImmRegUse` varchar(255) NOT NULL DEFAULT '',
  `AllowImmInfoShare` varchar(255) NOT NULL DEFAULT '',
  `AllowHealthInfoEx` varchar(255) NOT NULL DEFAULT '',
  `AllowPatientPortal` varchar(31) NOT NULL DEFAULT '',
  `DeceasedDate` datetime default NULL,
  `DeceasedReason` varchar(255) NOT NULL default '',
  `SoapImportStatus` TINYINT(4) DEFAULT NULL COMMENT '1-Prescription Press 2-Prescription Import 3-Allergy Press 4-Allergy Import',
  `CmsportalLogin` varchar(60) NOT NULL default '',
  `CareTeam` int(11) DEFAULT NULL,
  `County` varchar(40) NOT NULL default '',
  `Industry` TEXT,
  `ImmRegStatus` TEXT,
  `ImmRegStatEffdate` TEXT,
  `PublicityCode` TEXT,
  `PublCodeEffDate` TEXT,
  `ProtectIndicator` TEXT,
  `ProtIndiEffdate` TEXT,
  `Guardianrelationship` TEXT,
  `Guardiansex` TEXT,
  `Guardianaddress` TEXT,
  `Guardiancity` TEXT,
  `Guardianstate` TEXT,
  `Guardianpostalcode` TEXT,
  `Guardiancountry` TEXT,
  `Guardianphone` TEXT,
  `Guardianworkphone` TEXT,
  `Guardianemail` TEXT,
  UNIQUE KEY `Pid` (`Pid`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;
-- --------------------------------------------------------

--
-- Table structure for table `PatientPortalMenu`
--

CREATE TABLE `PatientPortalMenu` (
  `PatientPortalMenuId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientPortalMenuGroupId` INT(11) DEFAULT NULL,
  `MenuName` VARCHAR(40) DEFAULT NULL,
  `MenuOrder` SMALLINT(4) DEFAULT NULL,
  `MenuStatus` TINYINT(2) DEFAULT '1',
  PRIMARY KEY (`PatientPortalMenuId`)
) ENGINE=INNODB AUTO_INCREMENT=14;

INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (1,1,'Dashboard',3,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (2,1,'My Profile',6,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (3,1,'Appointments',9,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (4,1,'Documents',12,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (5,1,'Med Records',15,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (6,1,'My Account',18,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (7,1,'Mailbox',21,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (8,1,'Password',24,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (9,1,'View Log',27,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (10,1,'Logout',30,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (11,1,'View Health Information',33,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (12,1,'Download Health Information',36,1);
INSERT  INTO `PatientPortalMenu`(`PatientPortalMenuId`,`PatientPortalMenuGroupId`,`MenuName`,`MenuOrder`,`MenuStatus`) VALUES (13,1,'Transmit Health Information',39,1);
-- --------------------------------------------------------

--
-- Table structure for table `PatientReminders`
--

DROP TABLE IF EXISTS `PatientReminders`;
CREATE TABLE `PatientReminders` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Active` tinyint(1) NOT NULL default 1 COMMENT '1 if active and 0 if not active',
  `DateInactivated` datetime DEFAULT NULL,
  `ReasonInactivated` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleReminderInactiveOpt',
  `DueStatus` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleReminderDueOpt',
  `Pid` bigint(20) NOT NULL COMMENT 'Id from patientData table',
  `Category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the ruleActionItem table',
  `Item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the ruleActionItem table',
  `DateCreated` datetime DEFAULT NULL,
  `DateSent` datetime DEFAULT NULL,
  `VoiceStatus` tinyint(1) NOT NULL default 0 COMMENT '0 if not sent and 1 if sent',
  `SmsStatus` tinyint(1) NOT NULL default 0 COMMENT '0 if not sent and 1 if sent',
  `EmailStatus` tinyint(1) NOT NULL default 0 COMMENT '0 if not sent and 1 if sent',
  `MailStatus` tinyint(1) NOT NULL default 0 COMMENT '0 if not sent and 1 if sent',
  PRIMARY KEY (`Id`),
  KEY `Pid` (`Pid`),
  KEY (`Category`,`Item`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `PatientAccessOffsite`
--

DROP TABLE IF EXISTS `PatientAccessOffsite`;
CREATE TABLE  `PatientAccessOffsite` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pid` int(11) NOT NULL,
  `PortalUsername` varchar(100) NOT NULL,
  `PortalPwd` varchar(100) NOT NULL,
  `PortalPwdStatus` tinyint(4) DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself',
  `AuthorizeNetId` VARCHAR(20) COMMENT 'Authorize.net profile id',
  `PortalRelation` VARCHAR(100) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- 
-- Table structure for table `PatientTracker`
-- 

DROP TABLE IF EXISTS `PatientTracker`;
CREATE TABLE IF NOT EXISTS `PatientTracker` (
  `Id`                     bigint(20)   NOT NULL AUTO_INCREMENT,
  `Date`                   datetime     DEFAULT NULL,
  `Apptdate`               date         DEFAULT NULL,
  `Appttime`               time         DEFAULT NULL,
  `Eid`                    bigint(20)   NOT NULL default '0',
  `Pid`                    bigint(20)   NOT NULL default '0',
  `OriginalUser`          varchar(255) NOT NULL default '' COMMENT 'This is the user that created the original record',
  `Encounter`              bigint(20)   NOT NULL default '0',
  `Lastseq`                varchar(4)   NOT NULL default '' COMMENT 'The element file should contain this number of elements',
  `RandomDrugTest`       TINYINT(1)   DEFAULT NULL COMMENT 'NULL if not randomized. If randomized, 0 is no, 1 is yes',
  `DrugScreenCompleted`  TINYINT(1)   NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY (`Eid`),
  KEY (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- 
-- Table structure for table `PatientTrackerElement`
-- 

DROP TABLE IF EXISTS `PatientTrackerElement`;
CREATE TABLE IF NOT EXISTS `PatientTrackerElement` (
  `PtTrackerId`      bigint(20)   NOT NULL default '0' COMMENT 'Maps to id column in patientTracker table',
  `StartDatetime`     datetime     DEFAULT NULL,
  `Room`               varchar(20)  NOT NULL default '',
  `Status`             varchar(31)  NOT NULL default '',
  `Seq`                varchar(4)   NOT NULL default '' COMMENT 'This is a numerical sequence for this ptTrackerId events',
  `User`               varchar(255) NOT NULL default '' COMMENT 'This is the user that created this element',
  KEY  (`PtTrackerId`,`Seq`)
) ENGINE=InnoDB;

-- 
-- Table structure for table `Payments`
-- 

DROP TABLE IF EXISTS `Payments`;
CREATE TABLE `Payments` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Pid` bigint(20) NOT NULL default '0',
  `Dtime` datetime NOT NULL,
  `Encounter` bigint(20) NOT NULL default '0',
  `User` varchar(255) default NULL,
  `Method` varchar(255) default NULL,
  `Source` varchar(255) default NULL,
  `Amount1` decimal(12,2) NOT NULL default '0.00',
  `Amount2` decimal(12,2) NOT NULL default '0.00',
  `Posted1` decimal(12,2) NOT NULL default '0.00',
  `Posted2` decimal(12,2) NOT NULL default '0.00',
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PaymentGatewayDetails`
--
CREATE TABLE `PaymentGatewayDetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(100) DEFAULT NULL,
  `LoginId` varchar(255) DEFAULT NULL,
  `TransactionKey` varchar(255) DEFAULT NULL,
  `Md5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Pharmacies`
-- 

DROP TABLE IF EXISTS `Pharmacies`;
CREATE TABLE `Pharmacies` (
  `Id` int(11) NOT NULL default '0',
  `Name` varchar(255) default NULL,
  `TransmitMethod` int(11) NOT NULL default '1',
  `Email` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `PhoneNumbers`
-- 

DROP TABLE IF EXISTS `PhoneNumbers`;
CREATE TABLE `PhoneNumbers` (
  `Id` int(11) NOT NULL default '0',
  `CountryCode` varchar(5) default NULL,
  `AreaCode` char(3) default NULL,
  `Prefix` char(3) default NULL,
  `Number` varchar(4) default NULL,
  `Type` int(11) default NULL,
  `ForeignId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `ForeignId` (`ForeignId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaBookmark`
-- 

DROP TABLE IF EXISTS `PmaBookmark`;
CREATE TABLE `PmaBookmark` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dbase` varchar(255) default NULL,
  `User` varchar(255) default NULL,
  `Label` varchar(255) default NULL,
  `Query` text,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB COMMENT='Bookmarks' AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `PmaBookmark`
-- 

INSERT INTO `PmaBookmark` VALUES (2, 'Openemr', 'Openemr', 'Aggregate Race Statistics', 'SELECT ethnoracial as "Race/Ethnicity",Count(*) as Count FROM  `PatientData` WHERE 1 group by ethnoracial');
INSERT INTO `PmaBookmark` VALUES (9, 'Openemr', 'Openemr', 'Search by Code', 'SELECT  b.code,Concat(Pd.fname," ",Pd.lname) as "Patient Name",Concat(U.fname," ",U.lname) as "Provider Name",En.reason as "Encounter Desc.",En.date\r\nFROM billing as b\r\nLEFT JOIN users AS u ON b.user = u.id\r\nLEFT JOIN patientData as pd on b.pid = pd.pid\r\nLEFT JOIN formEncounter as en on b.encounter = en.encounter and b.pid = en.pid\r\nWHERE 1 /* and b.code like ''%[VARIABLE]%'' */ ORDER BY b.code');
INSERT INTO `PmaBookmark` VALUES (8, 'Openemr', 'Openemr', 'Count No Shows By Provider since Interval ago', 'SELECT concat( u.fname,  " ",U.lname )  AS  "Provider Name",U.id AS  "Provider ID",Count(  DISTINCT ev.pcEid )  AS  "Number of No Shows"/* ,Concat(DATEFORMAT(NOW(),''%Y-%m-%d''), '' and '',DATEFORMAT(DATEADD(Now(),INTERVAL [VARIABLE]),''%Y-%m-%d'') ) as "Between Dates" */ FROM  `OpenemrPostcalendarEvents`  AS ev LEFT  JOIN users AS u ON ev.pcAid = u.id WHERE ev.pcCatid =1/* and ( ev.pcEventDate >= DATESUB(Now(),INTERVAL [VARIABLE]) )  */\r\nGROUP  BY u.id;');
INSERT INTO `PmaBookmark` VALUES (6, 'Openemr', 'Openemr', 'Appointments By Race/Ethnicity from today plus interval', 'SELECT  count(Pd.ethnoracial) as "Number of Appointments",Pd.ethnoracial AS  "Race/Ethnicity" /* ,Concat(DATEFORMAT(NOW(),''%Y-%m-%d''), '' and '',DATEFORMAT(DATEADD(Now(),INTERVAL [VARIABLE]),''%Y-%m-%d'') ) as "Between Dates" */ FROM openemrPostcalendarEvents AS ev LEFT  JOIN   `PatientData`  AS pd ON  pd.pid = ev.pcPid where ev.pcEventstatus=1 and ev.pcCatid = 5 and ev.pcEventDate >= now()  /* and ( ev.pcEventDate <= DATEADD(Now(),INTERVAL [VARIABLE]) )  */ group by pd.ethnoracial');

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaColumnInfo`
-- 

DROP TABLE IF EXISTS `PmaColumnInfo`;
CREATE TABLE `PmaColumnInfo` (
  `Id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `DbName` varchar(64) default NULL,
  `TableName` varchar(64) default NULL,
  `ColumnName` varchar(64) default NULL,
  `Comment` varchar(255) default NULL,
  `Mimetype` varchar(255) default NULL,
  `Transformation` varchar(255) default NULL,
  `TransformationOptions` varchar(255) default NULL,
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `DbName` (`DbName`,`TableName`,`ColumnName`)
) ENGINE=InnoDB COMMENT='Column Information for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaHistory`
-- 

DROP TABLE IF EXISTS `PmaHistory`;
CREATE TABLE `PmaHistory` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(64) default NULL,
  `Db` varchar(64) default NULL,
  `Table` varchar(64) default NULL,
  `Timevalue` timestamp NOT NULL,
  `Sqlquery` text,
  PRIMARY KEY  (`Id`),
  KEY `Username` (`Username`,`Db`,`Table`,`Timevalue`)
) ENGINE=InnoDB COMMENT='SQL history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaPdfPages`
-- 

DROP TABLE IF EXISTS `PmaPdfPages`;
CREATE TABLE `PmaPdfPages` (
  `DbName` varchar(64) default NULL,
  `PageNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PageDescr` varchar(50) default NULL,
  PRIMARY KEY  (`PageNr`),
  KEY `DbName` (`DbName`)
) ENGINE=InnoDB COMMENT='PDF Relationpages for PMA' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaRelation`
-- 

DROP TABLE IF EXISTS `PmaRelation`;
CREATE TABLE `PmaRelation` (
  `MasterDb` varchar(64) NOT NULL default '',
  `MasterTable` varchar(64) NOT NULL default '',
  `MasterField` varchar(64) NOT NULL default '',
  `ForeignDb` varchar(64) default NULL,
  `ForeignTable` varchar(64) default NULL,
  `ForeignField` varchar(64) default NULL,
  PRIMARY KEY  (`MasterDb`,`MasterTable`,`MasterField`),
  KEY `ForeignField` (`ForeignDb`,`ForeignTable`)
) ENGINE=InnoDB COMMENT='Relation table';

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaTableCoords`
-- 

DROP TABLE IF EXISTS `PmaTableCoords`;
CREATE TABLE `PmaTableCoords` (
  `DbName` varchar(64) NOT NULL default '',
  `TableName` varchar(64) NOT NULL default '',
  `PdfPageNumber` int(11) NOT NULL default '0',
  `X` float unsigned NOT NULL default '0',
  `Y` float unsigned NOT NULL default '0',
  PRIMARY KEY  (`DbName`,`TableName`,`PdfPageNumber`)
) ENGINE=InnoDB COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

-- 
-- Table structure for table `PmaTableInfo`
-- 

DROP TABLE IF EXISTS `PmaTableInfo`;
CREATE TABLE `PmaTableInfo` (
  `DbName` varchar(64) NOT NULL default '',
  `TableName` varchar(64) NOT NULL default '',
  `DisplayField` varchar(64) default NULL,
  PRIMARY KEY  (`DbName`,`TableName`)
) ENGINE=InnoDB COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

-- 
-- Table structure for table `Pnotes`
-- 

DROP TABLE IF EXISTS `Pnotes`;
CREATE TABLE `Pnotes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Body` longtext,
  `Pid` bigint(20) default NULL,
  `User` varchar(255) default NULL,
  `Groupname` varchar(255) default NULL,
  `Activity` tinyint(4) default NULL,
  `Authorized` tinyint(4) default NULL,
  `Title` varchar(255) default NULL,
  `AssignedTo` varchar(255) default NULL,
  `Deleted` tinyint(4) default 0 COMMENT 'Flag indicates note is deleted',
  `MessageStatus` VARCHAR(20) NOT NULL DEFAULT 'New',
  `PortalRelation` VARCHAR(100) NULL,
  `IsMsgEncrypted` TINYINT(2) DEFAULT '0' COMMENT 'Whether messsage encrypted 0-Not encrypted, 1-Encrypted',
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Prescriptions`
-- 

DROP TABLE IF EXISTS `Prescriptions`;
CREATE TABLE `Prescriptions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) default NULL,
  `FilledById` int(11) default NULL,
  `PharmacyId` int(11) default NULL,
  `DateAdded` date default NULL,
  `DateModified` date default NULL,
  `ProviderId` int(11) default NULL,
  `Encounter` int(11) default NULL,
  `StartDate` date default NULL,
  `Drug` varchar(150) default NULL,
  `DrugId` int(11) NOT NULL default '0',
  `RxnormDrugcode` INT(11) DEFAULT NULL,
  `Form` int(3) default NULL,
  `Dosage` varchar(100) default NULL,
  `Quantity` varchar(31) default NULL,
  `Size` varchar(16) DEFAULT NULL,
  `Unit` int(11) default NULL,
  `Route` int(11) default NULL,
  `Interval` int(11) default NULL,
  `Substitute` int(11) default NULL,
  `Refills` int(11) default NULL,
  `PerRefill` int(11) default NULL,
  `FilledDate` date default NULL,
  `Medication` int(11) default NULL,
  `Note` text,
  `Active` int(11) NOT NULL default '1',
  `Datetime` DATETIME DEFAULT NULL,
  `User` VARCHAR(50) DEFAULT NULL,
  `Site` VARCHAR(50) DEFAULT NULL,
  `Prescriptionguid` VARCHAR(50) DEFAULT NULL,
  `ErxSource` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-OpenEMR 1-External',
  `ErxUploaded` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded to NewCrop',
  `DrugInfoErx` TEXT,
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  `EndDate` date default NULL,
  `Indication` text,
  `Prn` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Prices`
-- 

DROP TABLE IF EXISTS `Prices`;
CREATE TABLE `Prices` (
  `PrId` varchar(11) NOT NULL default '',
  `PrSelector` varchar(255) NOT NULL default '' COMMENT 'Template selector for drugs,Empty for codes',
  `PrLevel` varchar(31) NOT NULL default '',
  `PrPrice` decimal(12,2) NOT NULL default '0.00' COMMENT 'Price in local currency',
  PRIMARY KEY  (`PrId`,`PrSelector`,`PrLevel`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Table structure for table `Registry`
-- 

DROP TABLE IF EXISTS `Registry`;
CREATE TABLE `Registry` (
  `Name` varchar(255) default NULL,
  `State` tinyint(4) default NULL,
  `Directory` varchar(255) default NULL,
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SqlRun` tinyint(4) default NULL,
  `Unpackaged` tinyint(4) default NULL,
  `Date` datetime default NULL,
  `Priority` int(11) default '0',
  `Category` varchar(255) default NULL,
  `Nickname` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 ;

-- 
-- Dumping data for table `Registry`
-- 

INSERT INTO `Registry` VALUES ('New Encounter Form', 1, 'Newpatient', 1, 1, 1, '2003-09-14 15:16:45', 0, 'Administrative', '');
INSERT INTO `Registry` VALUES ('Review of Systems Checks', 1, 'Reviewofs', 9, 1, 1, '2003-09-14 15:16:45', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Speech Dictation', 1, 'Dictation', 10, 1, 1, '2003-09-14 15:16:45', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('SOAP', 1, 'Soap', 11, 1, 1, '2005-03-03 00:16:35', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Vitals', 1, 'Vitals', 12, 1, 1, '2005-03-03 00:16:34', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Review Of Systems', 1, 'Ros', 13, 1, 1, '2005-03-03 00:16:30', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Fee Sheet', 1, 'FeeSheet', 14, 1, 1, '2007-07-28 00:00:00', 0, 'Administrative', '');
INSERT INTO `Registry` VALUES ('Misc Billing Options HCFA', 1, 'MiscBillingOptions', 15, 1, 1, '2007-07-28 00:00:00', 0, 'Administrative', '');
INSERT INTO `Registry` VALUES ('Procedure Order', 1, 'ProcedureOrder', 16, 1, 1, '2010-02-25 00:00:00', 0, 'Administrative', '');
INSERT INTO `Registry` VALUES ('Observation', 1, 'Observation', 17, 1, 1, '2015-09-09 00:00:00', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Care Plan', 1, 'CarePlan', 18, 1, 1, '2015-09-09 00:00:00', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Functional and Cognitive Status', 1, 'FunctionalCognitiveStatus', 19, 1, 1, '2015-09-09 00:00:00', 0, 'Clinical', '');
INSERT INTO `Registry` VALUES ('Clinical Instructions', 1, 'ClinicalInstructions', 20, 1, 1, '2015-09-09 00:00:00', 0, 'Clinical', '');

-- --------------------------------------------------------

--
-- Table structure for table `ReportItemized`
-- (Goal is optimize insert performance,So only one key)

DROP TABLE IF EXISTS `ReportItemized`;
CREATE TABLE `ReportItemized` (
  `ReportId` bigint(20) NOT NULL,
  `ItemizedTestId` smallint(6) NOT NULL,
  `NumeratorLabel` varchar(25) NOT NULL DEFAULT '' COMMENT 'Only used in special cases',
  `Pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is fail, 1 is pass, 2 is excluded',
  `Pid` bigint(20) NOT NULL,
  KEY (`ReportId`,`ItemizedTestId`,`NumeratorLabel`,`Pass`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `ReportResults`
--

DROP TABLE IF EXISTS `ReportResults`;
CREATE TABLE `ReportResults` (
  `ReportId` bigint(20) NOT NULL,
  `FieldId` varchar(31) NOT NULL default '',
  `FieldValue` text,
  PRIMARY KEY (`ReportId`,`FieldId`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `RuleAction`
--

DROP TABLE IF EXISTS `RuleAction`;
CREATE TABLE `RuleAction` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinicalRules table',
  `GroupId` bigint(20) NOT NULL DEFAULT 1 COMMENT 'Contains group id to identify collection of targets in a rule',
  `Category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the ruleActionItem table',
  `Item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the ruleActionItem table',
  KEY  (`Id`)
) ENGINE=InnoDB ;

--
-- Standard clinical rule actions
--
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleHtnBpMeasure', 1, 'ActCatMeasure', 'ActBp');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleTobUseAssess', 1, 'ActCatAssess', 'ActTobacco');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleTobCessInter', 1, 'ActCatInter', 'ActTobacco');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleAdultWtScreenFu', 1, 'ActCatMeasure', 'ActWt');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleWtAssessCounsChild', 1, 'ActCatMeasure', 'ActWt');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleWtAssessCounsChild', 2, 'ActCatEdu', 'ActWt');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleWtAssessCounsChild', 3, 'ActCatEdu', 'ActNutrition');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleWtAssessCounsChild', 4, 'ActCatEdu', 'ActExercise');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleWtAssessCounsChild', 5, 'ActCatMeasure', 'ActBmi');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleInfluenzaGe50', 1, 'ActCatTreat', 'ActInfluvacc');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RulePneumovaccGe65', 1, 'ActCatTreat', 'ActPneumovacc');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleDmHemoA1c', 1, 'ActCatMeasure', 'ActHemoA1c');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleDmUrineAlb', 1, 'ActCatMeasure', 'ActUrineAlb');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleDmEye', 1, 'ActCatExam', 'ActEye');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleDmFoot', 1, 'ActCatExam', 'ActFoot');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleCsMammo', 1, 'ActCatMeasure', 'ActMammo');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleCsPap', 1, 'ActCatExam', 'ActPap');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleCsColon', 1, 'ActCatAssess', 'ActColonCancerScreen');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleCsProstate', 1, 'ActCatAssess', 'ActProstateCancerScreen');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleInrMonitor', 1, 'ActCatMeasure', 'ActLabInr');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleSocsecEntry', 1, 'ActCatAssess', 'ActSocSec');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RulePenicillinAllergy', 1, 'ActCatAssess', 'ActPenicillinAllergy');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleBloodPressure', 1, 'ActCatMeasure', 'ActBp');
INSERT INTO `RuleAction` ( `Id`, `GroupId`, `Category`, `Item` ) VALUES ('RuleInrMeasure', 1, 'ActCatMeasure', 'ActLabInr');

-- --------------------------------------------------------

--
-- Table structure for table `RuleActionItem`
--

DROP TABLE IF EXISTS `RuleActionItem`;
CREATE TABLE `RuleActionItem` (
  `Category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleActionCategory',
  `Item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleAction',
  `ClinRemLink` varchar(255) NOT NULL DEFAULT '' COMMENT 'Custom html link in clinical reminder widget',
  `ReminderMessage` TEXT COMMENT 'Custom message in patient reminder',
  `CustomFlag` tinyint(1) NOT NULL default 0 COMMENT '1 indexed to rulePatientData, 0 indexed within main schema',
  PRIMARY KEY  (`Category`,`Item`)
) ENGINE=InnoDB ;

INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActBp', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatAssess', 'ActTobacco', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatInter', 'ActTobacco', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActWt', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatEdu', 'ActWt', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActBmi', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatEdu', 'ActNutrition', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatEdu', 'ActExercise', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatTreat', 'ActInfluvacc', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatTreat', 'ActPneumovacc', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActHemoA1c', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActUrineAlb', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatExam', 'ActEye', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatExam', 'ActFoot', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActMammo', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatExam', 'ActPap', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatAssess', 'ActColonCancerScreen', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatAssess', 'ActProstateCancerScreen', '', '', 1);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatMeasure', 'ActLabInr', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatAssess', 'ActSocSec', '', '', 0);
INSERT INTO `RuleActionItem` ( `Category`, `Item`, `ClinRemLink`, `ReminderMessage`, `CustomFlag` ) VALUES ('ActCatAssess', 'ActPenicillinAllergy', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `RuleFilter`
--

DROP TABLE IF EXISTS `RuleFilter`;
CREATE TABLE `RuleFilter` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinicalRules table',
  `IncludeFlag` tinyint(1) NOT NULL default 0 COMMENT '0 is exclude and 1 is include',
  `RequiredFlag` tinyint(1) NOT NULL default 0 COMMENT '0 is required and 1 is optional',
  `Method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleFilters',
  `MethodDetail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions lists ruleIntervals',
  `Value` varchar(255) NOT NULL DEFAULT '',
  KEY  (`Id`)
) ENGINE=InnoDB ;

--
-- Standard clinical rule filters
--
-- Hypertension: Blood Pressure Measurement
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'CUSTOM::HTN');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::401.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::401.1');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::401.9');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::402.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::403.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.12');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.13');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.92');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::404.93');
-- Tobacco Use Assessment
-- no filters
-- Tobacco Cessation Intervention
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobCessInter', 1, 1, 'FiltDatabase', '', 'LIFESTYLE::tobacco::current');
-- Adult Weight Screening and Follow-Up
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleAdultWtScreenFu', 1, 1, 'FiltAgeMin', 'Year', '18');
-- Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 1, 1, 'FiltAgeMax', 'Year', '18');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 1, 1, 'FiltAgeMin', 'Year', '2');
-- Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInfluenzaGe50', 1, 1, 'FiltAgeMin', 'Year', '50');
-- Pneumonia Vaccination Status for Older Adults
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePneumovaccGe65', 1, 1, 'FiltAgeMin', 'Year', '65');
-- Diabetes: Hemoglobin A1C
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'CUSTOM::diabetes');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.12');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.13');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.20');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.21');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.22');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.23');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.30');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.31');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.32');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.33');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.4');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.40');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.42');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.43');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.50');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.51');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.52');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.53');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.60');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.61');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.62');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.63');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.7');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.70');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.71');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.72');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.73');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.80');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.81');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.82');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.83');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.9');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.92');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.93');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::357.2');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.04');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.05');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.06');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::366.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.04');
-- Diabetes: Urine Microalbumin
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'CUSTOM::diabetes');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.12');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.13');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.20');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.21');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.22');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.23');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.30');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.31');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.32');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.33');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.4');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.40');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.42');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.43');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.50');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.51');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.52');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.53');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.60');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.61');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.62');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.63');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.7');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.70');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.71');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.72');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.73');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.80');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.81');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.82');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.83');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.9');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.92');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.93');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::357.2');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.04');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.05');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.06');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::366.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.04');
-- Diabetes: Eye Exam
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'CUSTOM::diabetes');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.12');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.13');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.20');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.21');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.22');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.23');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.30');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.31');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.32');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.33');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.4');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.40');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.42');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.43');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.50');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.51');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.52');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.53');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.60');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.61');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.62');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.63');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.7');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.70');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.71');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.72');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.73');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.80');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.81');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.82');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.83');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.9');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.92');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.93');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::357.2');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.04');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.05');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.06');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::366.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.04');
-- Diabetes: Foot Exam
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'CUSTOM::diabetes');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.10');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.11');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.12');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.13');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.20');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.21');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.22');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.23');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.30');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.31');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.32');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.33');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.4');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.40');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.42');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.43');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.50');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.51');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.52');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.53');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.60');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.61');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.62');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.63');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.7');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.70');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.71');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.72');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.73');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.80');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.81');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.82');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.83');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.9');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.90');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.91');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.92');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::250.93');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::357.2');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.04');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.05');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::362.06');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::366.41');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.0');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.00');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.01');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.02');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.03');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 1, 0, 'FiltLists', 'MedicalProblem', 'ICD9::648.04');
-- Cancer Screening: Mammogram
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 1, 1, 'FiltAgeMin', 'Year', '40');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 1, 1, 'FiltSex', '', 'Female');
-- Cancer Screening: Pap Smear
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 1, 1, 'FiltAgeMin', 'Year', '18');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 1, 1, 'FiltSex', '', 'Female');
-- Cancer Screening: Colon Cancer Screening
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsColon', 1, 1, 'FiltAgeMin', 'Year', '50');
-- Cancer Screening: Prostate Cancer Screening
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 1, 1, 'FiltAgeMin', 'Year', '50');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 1, 1, 'FiltSex', '', 'Male');
--
-- Rule filters to specifically demonstrate passing of NIST criteria
--
-- Coumadin Management - INR Monitoring
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 1, 0, 'FiltLists', 'Medication', 'Coumadin');
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 1, 0, 'FiltLists', 'Medication', 'Warfarin');
-- Penicillin Allergy Assessment
INSERT INTO `RuleFilter` ( `Id`, `IncludeFlag`, `RequiredFlag`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePenicillinAllergy', 1, 0, 'FiltLists', 'Allergy', 'Penicillin');

-- --------------------------------------------------------

--
-- Table structure for table `RulePatientData`
--

DROP TABLE IF EXISTS `RulePatientData`;
CREATE TABLE `RulePatientData` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Pid` bigint(20) NOT NULL,
  `Category` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the ruleActionItem table',
  `Item` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the ruleActionItem table',
  `Complete` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list yesno',
  `Result` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (`Id`),
  KEY (`Pid`),
  KEY (`Category`,`Item`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RuleReminder`
--

DROP TABLE IF EXISTS `RuleReminder`;
CREATE TABLE `RuleReminder` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinicalRules table',
  `Method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleReminderMethods',
  `MethodDetail` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleReminderIntervals',
  `Value` varchar(255) NOT NULL DEFAULT '',
  KEY  (`Id`)
) ENGINE=InnoDB ;

-- Hypertension: Blood Pressure Measurement
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleHtnBpMeasure', 'PatientReminderPost', 'Month', '1');
-- Tobacco Use Assessment
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobUseAssess', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobUseAssess', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobUseAssess', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobUseAssess', 'PatientReminderPost', 'Month', '1');
-- Tobacco Cessation Intervention
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobCessInter', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobCessInter', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobCessInter', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleTobCessInter', 'PatientReminderPost', 'Month', '1');
-- Adult Weight Screening and Follow-Up
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleAdultWtScreenFu', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleAdultWtScreenFu', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleAdultWtScreenFu', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleAdultWtScreenFu', 'PatientReminderPost', 'Month', '1');
-- Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleWtAssessCounsChild', 'PatientReminderPost', 'Month', '1');
-- Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInfluenzaGe50', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInfluenzaGe50', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInfluenzaGe50', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInfluenzaGe50', 'PatientReminderPost', 'Month', '1');
-- Pneumonia Vaccination Status for Older Adults
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePneumovaccGe65', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePneumovaccGe65', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePneumovaccGe65', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePneumovaccGe65', 'PatientReminderPost', 'Month', '1');
-- Diabetes: Hemoglobin A1C
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmHemoA1c', 'PatientReminderPost', 'Month', '1');
-- Diabetes: Urine Microalbumin
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmUrineAlb', 'PatientReminderPost', 'Month', '1');
-- Diabetes: Eye Exam
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmEye', 'PatientReminderPost', 'Month', '1');
-- Diabetes: Foot Exam
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleDmFoot', 'PatientReminderPost', 'Month', '1');
-- Cancer Screening: Mammogram
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsMammo', 'PatientReminderPost', 'Month', '1');
-- Cancer Screening: Pap Smear
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsPap', 'PatientReminderPost', 'Month', '1');
-- Cancer Screening: Colon Cancer Screening
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsColon', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsColon', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsColon', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsColon', 'PatientReminderPost', 'Month', '1');
-- Cancer Screening: Prostate Cancer Screening
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleCsProstate', 'PatientReminderPost', 'Month', '1');
-- Coumadin Management - INR Monitoring
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMonitor', 'PatientReminderPost', 'Month', '1');
-- Data Entry - Social Security Number
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleSocsecEntry', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleSocsecEntry', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleSocsecEntry', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleSocsecEntry', 'PatientReminderPost', 'Month', '1');
-- Penicillin Allergy Assessment
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePenicillinAllergy', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePenicillinAllergy', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePenicillinAllergy', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RulePenicillinAllergy', 'PatientReminderPost', 'Month', '1');
-- Blood Pressure Measurement
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleBloodPressure', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleBloodPressure', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleBloodPressure', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleBloodPressure', 'PatientReminderPost', 'Month', '1');
-- INR Measurement
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMeasure', 'ClinicalReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMeasure', 'ClinicalReminderPost', 'Month', '1');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMeasure', 'PatientReminderPre', 'Week', '2');
INSERT INTO `RuleReminder` ( `Id`, `Method`, `MethodDetail`, `Value` ) VALUES ('RuleInrMeasure', 'PatientReminderPost', 'Month', '1');

-- --------------------------------------------------------

--
-- Table structure for table `RuleTarget`
--

DROP TABLE IF EXISTS `RuleTarget`;
CREATE TABLE `RuleTarget` (
  `Id` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinicalRules table',
  `GroupId` bigint(20) NOT NULL DEFAULT 1 COMMENT 'Contains group id to identify collection of targets in a rule',
  `IncludeFlag` tinyint(1) NOT NULL default 0 COMMENT '0 is exclude and 1 is include',
  `RequiredFlag` tinyint(1) NOT NULL default 0 COMMENT '0 is required and 1 is optional',
  `Method` varchar(31) NOT NULL DEFAULT '' COMMENT 'Maps to listOptions list ruleTargets', 
  `Value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Data is dependent on the method',
  `Interval` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Only used in interval entries', 
  KEY  (`Id`)
) ENGINE=InnoDB ;

--
-- Standard clinical rule targets
--
-- Hypertension: Blood Pressure Measurement
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleHtnBpMeasure', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleHtnBpMeasure', 1, 1, 1, 'TargetDatabase', '::formVitals::bps::::::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleHtnBpMeasure', 1, 1, 1, 'TargetDatabase', '::formVitals::bpd::::::ge::1', 0);
-- Tobacco Use Assessment
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleTobUseAssess', 1, 1, 1, 'TargetDatabase', 'LIFESTYLE::tobacco::', 0);
-- Tobacco Cessation Intervention
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleTobCessInter', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleTobCessInter', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatInter::actTobacco::YES::ge::1', 0);
-- Adult Weight Screening and Follow-Up
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleAdultWtScreenFu', 1, 1, 1, 'TargetDatabase', '::formVitals::weight::::::ge::1', 0);
-- Weight Assessment and Counseling for Children and Adolescents
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 1, 1, 1, 'TargetDatabase', '::formVitals::weight::::::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 1, 1, 1, 'TargetInterval', 'Year', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 2, 1, 1, 'TargetDatabase', 'CUSTOM::actCatEdu::actWt::YES::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 2, 1, 1, 'TargetInterval', 'Year', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 3, 1, 1, 'TargetDatabase', 'CUSTOM::actCatEdu::actNutrition::YES::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 3, 1, 1, 'TargetInterval', 'Year', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 4, 1, 1, 'TargetDatabase', 'CUSTOM::actCatEdu::actExercise::YES::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 4, 1, 1, 'TargetInterval', 'Year', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 5, 1, 1, 'TargetDatabase', '::formVitals::BMI::::::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleWtAssessCounsChild', 5, 1, 1, 'TargetInterval', 'Year', 3);
-- Influenza Immunization for Patients >= 50 Years Old
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 1, 'TargetInterval', 'FluSeason', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::15::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::16::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::88::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::111::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::125::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::126::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::127::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::128::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::135::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::140::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::141::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInfluenzaGe50', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::144::ge::1', 0);
-- Pneumonia Vaccination Status for Older Adults
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePneumovaccGe65', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::33::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePneumovaccGe65', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::100::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePneumovaccGe65', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::109::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePneumovaccGe65', 1, 1, 0, 'TargetDatabase', '::immunizations::cvxCode::eq::133::ge::1', 0);
-- Diabetes: Hemoglobin A1C
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmHemoA1c', 1, 1, 1, 'TargetInterval', 'Month', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmHemoA1c', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatMeasure::actHemoA1c::YES::ge::1', 0);
-- Diabetes: Urine Microalbumin
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmUrineAlb', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmUrineAlb', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatMeasure::actUrineAlb::YES::ge::1', 0);
-- Diabetes: Eye Exam
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmEye', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmEye', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatExam::actEye::YES::ge::1', 0);
-- Diabetes: Foot Exam
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmFoot', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleDmFoot', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatExam::actFoot::YES::ge::1', 0);
-- Cancer Screening: Mammogram
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsMammo', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsMammo', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatMeasure::actMammo::YES::ge::1', 0);
-- Cancer Screening: Pap Smear
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsPap', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsPap', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatExam::actPap::YES::ge::1', 0);
-- Cancer Screening: Colon Cancer Screening
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsColon', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatAssess::actColonCancerScreen::YES::ge::1', 0);
-- Cancer Screening: Prostate Cancer Screening
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleCsProstate', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatAssess::actProstateCancerScreen::YES::ge::1', 0);
--
-- Rule targets to specifically demonstrate passing of NIST criteria
--
-- Coumadin Management - INR Monitoring
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInrMonitor', 1, 1, 1, 'TargetInterval', 'Week', 3);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInrMonitor', 1, 1, 1, 'TargetProc', 'INR::CPT4:85610::::::ge::1', 0);
-- Data entry - Social security number.
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleSocsecEntry', 1, 1, 1, 'TargetDatabase', '::patientData::ss::::::ge::1', 0);
-- Penicillin allergy assessment.
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePenicillinAllergy', 1, 1, 1, 'TargetInterval', 'Year', 1);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RulePenicillinAllergy', 1, 1, 1, 'TargetDatabase', 'CUSTOM::actCatAssess::actPenicillinAllergy::YES::ge::1', 0);
-- Blood Pressure Measurement
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleBloodPressure', 1, 1, 1, 'TargetDatabase', '::formVitals::bps::::::ge::1', 0);
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleBloodPressure', 1, 1, 1, 'TargetDatabase', '::formVitals::bpd::::::ge::1', 0);
-- INR Measurement
INSERT INTO `RuleTarget` ( `Id`, `GroupId`, `IncludeFlag`, `RequiredFlag`, `Method`, `Value`, `Interval` ) VALUES ('RuleInrMeasure', 1, 1, 1, 'TargetProc', 'INR::CPT4:85610::::::ge::1', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `Sequences`
-- 

DROP TABLE IF EXISTS `Sequences`;
CREATE TABLE `Sequences` (
  `Id` int(11) unsigned NOT NULL default '0'
) ENGINE=InnoDB;

-- 
-- Dumping data for table `Sequences`
-- 

INSERT INTO `Sequences` VALUES (1);

-- --------------------------------------------------------

--
-- Table structure for table `SupportedExternalDataloads`
--

DROP TABLE IF EXISTS `SupportedExternalDataloads`;
CREATE TABLE `SupportedExternalDataloads` (
  `LoadId` SERIAL,
  `LoadType` varchar(24) NOT NULL DEFAULT '',
  `LoadSource` varchar(24) NOT NULL DEFAULT 'CMS',
  `LoadReleaseDate` date NOT NULL,
  `LoadFilename` varchar(256) NOT NULL DEFAULT '',
  `LoadChecksum` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB;

--
-- Dumping data for table `SupportedExternalDataloads`
--

INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD9', 'CMS', '2011-10-01', 'Cmsv29MasterDescriptions.zip', 'C360c2b5a29974d6c58617c7378dd7c4');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD9', 'CMS', '2012-10-01', 'Cmsv30MasterDescriptions.zip', 'Eb26446536435f5f5e677090a7976b15');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD9', 'CMS', '2013-10-01', 'Cmsv31-master-descriptions.zip', 'Fe0d7f9a5338f5ff187683b4737ad2b7');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2011-10-01', '2012PCSLongAndAbbreviatedTitles.zip', '201a732b649d8c7fba807cc4c083a71a');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2011-10-01', 'DiagnosisGEMs2012.zip', '6758c4a3384c47161ce24f13a2464b53');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2011-10-01', 'ICD10OrderFiles2012.zip', 'A76601df7a9f5270d8229828a833f6a1');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2011-10-01', 'ProcedureGEMs2012.zip', 'F37416d8fab6cd2700b634ca5025295d');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2011-10-01', 'ReimbursementMapping2012.zip', '8b438d1fd1f34a9bb0e423c15e89744b');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', '2013PCSLongAndAbbreviatedTitles.zip', '04458ed0631c2c122624ee0a4ca1c475');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', '2013-DiagnosisGEMs.zip', '773aac2a675d6aefd1d7dd149883be51');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', 'ICD10CMOrderFiles2013.zip', '1c175a858f833485ef8f9d3e66b4d8bd');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', 'ProcedureGEMs2013.zip', '92aa7640e5ce29b9629728f7d4fc81db');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', '2013-ReimbursementMappingDx.zip', '0d5d36e3f4519bbba08a9508576787fb');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2012-10-01', 'ReimbursementMappingPr2013.zip', '4c3920fedbcd9f6af54a1dc9069a11ca');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', '2014-Reimbursement-Mappings-PR.zip', 'F306a0e8c9edb34d28fd6ce8af82b646');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', '2014-Reimbursement-Mappings-DX.zip', '614b3957304208e3ef7d3ba8b3618888');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', 'ProcedureGEMs-2014.zip', 'Be46de29f4f40f97315d04821273acf9');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', '2014-ICD10-Code-Descriptions.zip', '5458b95f6f37228b5cdfa03aefc6c8bb');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', 'DiagnosisGEMs-2014.zip', '3ed7b7c5a11c766102b12d97d777a11b');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES
('ICD10', 'CMS', '2013-10-01', '2014-PCS-long-and-abbreviated-titles.zip', '2d03514a0c66d92cf022a0bc28c83d38');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD9', 'CMS', '2014-10-01', 'ICD-9-CM-v32-master-descriptions.zip', 'B852b85f770c83433201dc8ae2c59074');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', '2015-PCS-long-and-abbreviated-titles.zip', 'D1504d6cbc40e008e52dbc50600a4b66');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', 'DiagnosisGEMs2015.zip', 'A4505805edf25ba4eacda07f23934e63');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', '2015-code-descriptions.zip', '6a8c0ab630d5afa7482daa417950846a');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', 'ProcedureGEMs2015.zip', 'Fcba4e4c96851f4c900345bc557483e2');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', 'ReimbursementMappingDx2015.zip', '0990d5bcac13ccf5e288249be5261fd7');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2014-10-01', 'ReimbursementMappingPr2015.zip', '493c022db17a70fcdcbb41bf0ad61a47');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', '2016-PCS-Long-Abbrev-Titles.zip', 'D5ea519d0257db0ed7deb0406a4d0503');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', '2016-General-Equivalence-Mappings.zip', '3324a45b6040be7e48ab770a0d3ca695');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', '2016-Code-Descriptions-in-Tabular-Order.zip', '518a47fe9e268e4fb72fecf633d15f17');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', '2016-ProcedureGEMs.zip', '45a8d9da18d8aed57f0c6ea91e3e8fe4');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', 'ReimbursementMappingDx2016.zip', '1b53b512e10c1fdf7ae4cfd1baa8dfbb');
INSERT INTO `SupportedExternalDataloads` (`LoadType`, `LoadSource`, `LoadReleaseDate`, `LoadFilename`, `LoadChecksum`) VALUES 
('ICD10', 'CMS', '2015-10-01', 'ReimbursementMappingPr2016.zip', '3c780dd103d116aa57980decfddd4f19');
-- --------------------------------------------------------

-- 
-- Table structure for table `Transactions`
-- 

DROP TABLE IF EXISTS `Transactions`;
CREATE TABLE `Transactions` (
  `Id`                      bigint(20)   NOT NULL AUTO_INCREMENT,
  `Date`                    datetime     default NULL,
  `Title`                   varchar(255) NOT NULL DEFAULT '',
  `Pid`                     bigint(20)   default NULL,
  `User`                    varchar(255) NOT NULL DEFAULT '',
  `Groupname`               varchar(255) NOT NULL DEFAULT '',
  `Authorized`              tinyint(4)   default NULL,
  PRIMARY KEY  (`Id`),
  KEY `Pid` (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `Users`
-- 

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) default NULL,
  `Password` longtext,
  `Authorized` tinyint(4) default NULL,
  `Info` longtext,
  `Source` tinyint(4) default NULL,
  `Fname` varchar(255) default NULL,
  `Mname` varchar(255) default NULL,
  `Lname` varchar(255) default NULL,
  `Federaltaxid` varchar(255) default NULL,
  `Federaldrugid` varchar(255) default NULL,
  `Upin` varchar(255) default NULL,
  `Facility` varchar(255) default NULL,
  `FacilityId` int(11) NOT NULL default '0',
  `SeeAuth` int(11) NOT NULL default '1',
  `Active` tinyint(1) NOT NULL default '1',
  `Npi` varchar(15) default NULL,
  `Title` varchar(30) default NULL,
  `Specialty` varchar(255) default NULL,
  `Billname` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  `EmailDirect` varchar(255) NOT NULL default '',
  `Url` varchar(255) default NULL,
  `Assistant` varchar(255) default NULL,
  `Organization` varchar(255) default NULL,
  `Valedictory` varchar(255) default NULL,
  `Street` varchar(60) default NULL,
  `Streetb` varchar(60) default NULL,
  `City` varchar(30) default NULL,
  `State` varchar(30) default NULL,
  `Zip` varchar(20) default NULL,
  `Street2` varchar(60) default NULL,
  `Streetb2` varchar(60) default NULL,
  `City2` varchar(30) default NULL,
  `State2` varchar(30) default NULL,
  `Zip2` varchar(20) default NULL,
  `Phone` varchar(30) default NULL,
  `Fax` varchar(30) default NULL,
  `Phonew1` varchar(30) default NULL,
  `Phonew2` varchar(30) default NULL,
  `Phonecell` varchar(30) default NULL,
  `Notes` text,
  `CalUi` tinyint(4) NOT NULL default '1',
  `Taxonomy` varchar(30) NOT NULL DEFAULT '207Q00000X',
  `SsiRelayhealth` varchar(64) NULL,
  `Calendar` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 = appears in calendar',
  `AbookType` varchar(31) NOT NULL DEFAULT '',
  `PwdExpirationDate` date default NULL,
  `PwdHistory1` longtext,
  `PwdHistory2` longtext,
  `DefaultWarehouse` varchar(31) NOT NULL DEFAULT '',
  `Irnpool` varchar(31) NOT NULL DEFAULT '',
  `StateLicenseNumber` VARCHAR(25) DEFAULT NULL,
  `NewcropUserRole` VARCHAR(30) DEFAULT NULL,
  `Cpoe` tinyint(1) NULL DEFAULT NULL,
  `PhysicianType` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Users`
--
-- NOTE THIS IS DONE AFTER INSTALLATION WHERE THE sql/officialAdditionalUsers.sql script is called durig setup
--  (So these inserts can be found in the sql/officialAdditionalUsers.sql script)


-- --------------------------------------------------------

--
-- Table structure for table `UserSecure`
--
CREATE TABLE `UsersSecure` (
  `Id` bigint(20) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255),
  `Salt` varchar(255),
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PasswordHistory1` varchar(255),
  `SaltHistory1` varchar(255),
  `PasswordHistory2` varchar(255),
  `SaltHistory2` varchar(255),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `USERNAMEID` (`Id`,`Username`)
) ENGINE=InnoDb;

-- --------------------------------------------------------

--
-- Table structure for table `UserSettings`
--

CREATE TABLE `UserSettings` (
  `SettingUser`  bigint(20)   NOT NULL DEFAULT 0,
  `SettingLabel` varchar(63)  NOT NULL,
  `SettingValue` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`SettingUser`, `SettingLabel`)
) ENGINE=InnoDB;

--
-- Dumping data for table `UserSettings`
--

INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'AllergyPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'AppointmentsPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'BillingPsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'ClinicalRemindersPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'DemographicsPsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'DentalPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'DirectivesPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'DisclosuresPsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'ImmunizationsPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'InsurancePsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'MedicalProblemPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'MedicationPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'PatientRemindersPsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'PnotesPsExpand', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'PrescriptionsPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'SurgeryPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'VitalsPsExpand', '1');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (0, 'GaclProtect', '0');
INSERT INTO userSettings ( settingUser,SettingLabel,SettingValue ) VALUES (1, 'GaclProtect', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `X12Partners`
-- 

DROP TABLE IF EXISTS `X12Partners`;
CREATE TABLE `X12Partners` (
  `Id` int(11) NOT NULL default '0',
  `Name` varchar(255) default NULL,
  `IdNumber` varchar(255) default NULL,
  `X12SenderId` varchar(255) default NULL,
  `X12ReceiverId` varchar(255) default NULL,
  `X12Version` varchar(255) default NULL,
  `ProcessingFormat` enum('Standard','Medi-cal','Cms','Proxymed') default NULL,
  `X12Isa01` VARCHAR( 2 ) NOT NULL DEFAULT '00' COMMENT 'User logon Required Indicator',
  `X12Isa02` VARCHAR( 10 ) NOT NULL DEFAULT '          ' COMMENT 'User Logon',
  `X12Isa03` VARCHAR( 2 ) NOT NULL DEFAULT '00' COMMENT 'User password required Indicator',
  `X12Isa04` VARCHAR( 10 ) NOT NULL DEFAULT '          ' COMMENT 'User Password',
  `X12Isa05` char(2)     NOT NULL DEFAULT 'ZZ',
  `X12Isa07` char(2)     NOT NULL DEFAULT 'ZZ',
  `X12Isa14` char(1)     NOT NULL DEFAULT '0',
  `X12Isa15` char(1)     NOT NULL DEFAULT 'P',
  `X12Gs02`  varchar(15) NOT NULL DEFAULT '',
  `X12Per06` varchar(80) NOT NULL DEFAULT '',
  `X12Gs03`  varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------------
-- Table structure for table `AutomaticNotification`
-- 

DROP TABLE IF EXISTS `AutomaticNotification`;
CREATE TABLE `AutomaticNotification` (
  `NotificationId` int(5) NOT NULL AUTO_INCREMENT,
  `SmsGatewayType` varchar(255) NOT NULL,
  `NextAppDate` date NOT NULL,
  `NextAppTime` varchar(10) NOT NULL,
  `ProviderName` varchar(100) NOT NULL,
  `Message` text,
  `EmailSender` varchar(100) NOT NULL,
  `EmailSubject` varchar(100) NOT NULL,
  `Type` enum('SMS','Email') NOT NULL default 'SMS',
  `NotificationSentDate` datetime NOT NULL,
  PRIMARY KEY  (`NotificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `AutomaticNotification`
-- 

INSERT INTO `AutomaticNotification` (`NotificationId`, `SmsGatewayType`, `NextAppDate`, `NextAppTime`, `ProviderName`, `Message`, `EmailSender`, `EmailSubject`, `Type`, `NotificationSentDate`) VALUES (1, 'CLICKATELL', '0000-00-00', ':', 'EMR GROUP 1 .. SMS', 'Welcome to EMR GROUP 1.. SMS', '', '', 'SMS', '0000-00-00 00:00:00'),
(2, '', '2007-10-02', '05:50', 'EMR GROUP', 'Welcome to EMR GROUP . Email', 'EMR Group', 'Welcome to EMR GROUP', 'Email', '2007-09-30 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `NotificationLog`
-- 

DROP TABLE IF EXISTS `NotificationLog`;
CREATE TABLE `NotificationLog` (
  `ILogId` int(11) NOT NULL AUTO_INCREMENT,
  `Pid` int(7) NOT NULL,
  `PcEid` int(11) unsigned NULL,
  `SmsGatewayType` varchar(50) NOT NULL,
  `SmsgatewayInfo` varchar(255) NOT NULL,
  `Message` text,
  `EmailSender` varchar(255) NOT NULL,
  `EmailSubject` varchar(255) NOT NULL,
  `Type` enum('SMS','Email') NOT NULL,
  `PatientInfo` text,
  `PcEventDate` date NOT NULL,
  `PcEndDate` date NOT NULL,
  `PcStartTime` time NOT NULL,
  `PcEndTime` time NOT NULL,
  `DSentDateTime` datetime NOT NULL,
  PRIMARY KEY  (`ILogId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `NotificationSettings`
-- 

DROP TABLE IF EXISTS `NotificationSettings`;
CREATE TABLE `NotificationSettings` (
  `SettingsId` int(3) NOT NULL AUTO_INCREMENT,
  `SendSMSBeforeHours` int(3) NOT NULL,
  `SendEmailBeforeHours` int(3) NOT NULL,
  `SMSGatewayUsername` varchar(100) NOT NULL,
  `SMSGatewayPassword` varchar(100) NOT NULL,
  `SMSGatewayApikey` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY  (`SettingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `NotificationSettings`
-- 

INSERT INTO `NotificationSettings` (`SettingsId`, `SendSMSBeforeHours`, `SendEmailBeforeHours`, `SMSGatewayUsername`, `SMSGatewayPassword`, `SMSGatewayApikey`, `Type`) VALUES (1, 150, 150, 'Sms username', 'Sms password', 'Sms api key', 'SMS/Email Settings');

-- -------------------------------------------------------------------

CREATE TABLE chartTracker (
  ctPid            int(11)       NOT NULL,
  ctWhen           datetime      NOT NULL,
  ctUserid         bigint(20)    NOT NULL DEFAULT 0,
  ctLocation       varchar(31)   NOT NULL DEFAULT '',
  PRIMARY KEY (CtPid,CtWhen)
) ENGINE=InnoDB;

CREATE TABLE arSession (
  sessionId     int unsigned  NOT NULL AUTO_INCREMENT,
  payerId       int(11)       NOT NULL            COMMENT '0=pt else references insuranceCompanies.id',
  userId        int(11)       NOT NULL            COMMENT 'References users.id for session owner',
  closed         tinyint(1)    NOT NULL DEFAULT 0  COMMENT '0=no, 1=yes',
  reference      varchar(255)  NOT NULL DEFAULT '' COMMENT 'Check or EOB number',
  checkDate     date          DEFAULT NULL,
  depositDate   date          DEFAULT NULL,
  payTotal      decimal(12,2) NOT NULL DEFAULT 0,
  createdTime timestamp NOT NULL default CURRENT_TIMESTAMP,
  modifiedTime datetime NOT NULL,
  globalAmount decimal( 12, 2 ) NOT NULL ,
  paymentType varchar( 50 ) NOT NULL ,
  description text,
  adjustmentCode varchar( 50 ) NOT NULL ,
  postToDate date NOT NULL ,
  patientId int( 11 ) NOT NULL ,
  paymentMethod varchar( 25 ) NOT NULL,
  PRIMARY KEY (SessionId),
  KEY userClosed (UserId,Closed),
  KEY depositDate (DepositDate)
) ENGINE=InnoDB;

CREATE TABLE arActivity (
  pid            int(11)       NOT NULL,
  encounter      int(11)       NOT NULL,
  sequenceNo    int unsigned  NOT NULL            COMMENT 'ArActivity sequenceNo,Incremented in code',
  `CodeType`    varchar(12)   NOT NULL DEFAULT '',
  code           varchar(20)   NOT NULL            COMMENT 'Empty means claim level',
  modifier       varchar(12)   NOT NULL DEFAULT '',
  payerType     int           NOT NULL            COMMENT '0=pt, 1=ins1, 2=ins2,Etc',
  postTime      datetime      NOT NULL,
  postUser      int(11)       NOT NULL            COMMENT 'References users.id',
  sessionId     int unsigned  NOT NULL            COMMENT 'References arSession.sessionId',
  memo           varchar(255)  NOT NULL DEFAULT '' COMMENT 'Adjustment reasons go here',
  payAmount     decimal(12,2) NOT NULL DEFAULT 0  COMMENT 'Either pay or adj will always be 0',
  adjAmount     decimal(12,2) NOT NULL DEFAULT 0,
  modifiedTime datetime NOT NULL,
  followUp char(1) NOT NULL,
  followUpNote text,
  accountCode varchar(15) NOT NULL,
  reasonCode varchar(255) DEFAULT NULL COMMENT 'Use as needed to show the primary payer adjustment reason code',
  PRIMARY KEY (Pid,Encounter,SequenceNo),
  KEY sessionId (SessionId)
) ENGINE=InnoDB;

CREATE TABLE `UsersFacility` (
  `Tablename` varchar(64) NOT NULL,
  `TableId` int(11) NOT NULL,
  `FacilityId` int(11) NOT NULL,
  PRIMARY KEY (`Tablename`,`TableId`,`FacilityId`)
) ENGINE=InnoDB COMMENT='Joins users or patientData to facility table';

CREATE TABLE `LbfData` (
  `FormId`     int(11)      NOT NULL AUTO_INCREMENT COMMENT 'References forms.formId',
  `FieldId`    varchar(31)  NOT NULL COMMENT 'References layoutOptions.fieldId',
  `FieldValue` TEXT,
  PRIMARY KEY (`FormId`,`FieldId`)
) ENGINE=InnoDB COMMENT='Contains all data from layout-based forms';

CREATE TABLE `LbtData` (
  `FormId`     bigint(20)   NOT NULL COMMENT 'References transactions.id',
  `FieldId`    varchar(31)  NOT NULL COMMENT 'References layoutOptions.fieldId',
  `FieldValue` TEXT,
  PRIMARY KEY (`FormId`,`FieldId`)
) ENGINE=InnoDB COMMENT='Contains all data from layout-based transactions';

CREATE TABLE gprelations (
  type1 int(2)     NOT NULL,
  id1   bigint(20) NOT NULL,
  type2 int(2)     NOT NULL,
  id2   bigint(20) NOT NULL,
  PRIMARY KEY (Type1,id1,type2,id2),
  KEY key2  (Type2,id2)
) ENGINE=InnoDB COMMENT='General purpose relations';

CREATE TABLE `ProcedureProviders` (
  `Ppid`         bigint(20)   NOT NULL AUTO_INCREMENT,
  `Name`         varchar(255) NOT NULL DEFAULT '',
  `Npi`          varchar(15)  NOT NULL DEFAULT '',
  `SendAppId`  varchar(255) NOT NULL DEFAULT ''  COMMENT 'Sending application ID (MSH-3.1)',
  `SendFacId`  varchar(255) NOT NULL DEFAULT ''  COMMENT 'Sending facility ID (MSH-4.1)',
  `RecvAppId`  varchar(255) NOT NULL DEFAULT ''  COMMENT 'Receiving application ID (MSH-5.1)',
  `RecvFacId`  varchar(255) NOT NULL DEFAULT ''  COMMENT 'Receiving facility ID (MSH-6.1)',
  `DorP`         char(1)      NOT NULL DEFAULT 'D' COMMENT 'Debugging or Production (MSH-11)',
  `Direction`    char(1)      NOT NULL DEFAULT 'B' COMMENT 'Bidirectional or Results-only',
  `Protocol`     varchar(15)  NOT NULL DEFAULT 'DL',
  `RemoteHost`  varchar(255) NOT NULL DEFAULT '',
  `Login`        varchar(255) NOT NULL DEFAULT '',
  `Password`     varchar(255) NOT NULL DEFAULT '',
  `OrdersPath`  varchar(255) NOT NULL DEFAULT '',
  `ResultsPath` varchar(255) NOT NULL DEFAULT '',
  `Notes`        text,
  `LabDirector` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Ppid`)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureType` (
  `ProcedureTypeId`   bigint(20)   NOT NULL AUTO_INCREMENT,
  `Parent`              bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References procedureType.procedureTypeId',
  `Name`                varchar(63)  NOT NULL DEFAULT '' COMMENT 'Name for this category,Procedure or result type',
  `LabId`              bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References procedureProviders.ppid, 0 means default to parent',
  `ProcedureCode`      varchar(31)  NOT NULL DEFAULT '' COMMENT 'Code identifying this procedure',
  `ProcedureType`      varchar(31)  NOT NULL DEFAULT '' COMMENT 'See list procType',
  `BodySite`           varchar(31)  NOT NULL DEFAULT '' COMMENT 'Where to do injection,E.g. arm,Buttok',
  `Specimen`            varchar(31)  NOT NULL DEFAULT '' COMMENT 'Blood,Urine,Saliva,Etc.',
  `RouteAdmin`         varchar(31)  NOT NULL DEFAULT '' COMMENT 'Oral,Injection',
  `Laterality`          varchar(31)  NOT NULL DEFAULT '' COMMENT 'Left,Right, ...',
  `Description`         varchar(255) NOT NULL DEFAULT '' COMMENT 'Descriptive text for procedureCode',
  `StandardCode`       varchar(255) NOT NULL DEFAULT '' COMMENT 'Industry standard code type and code (E.g. CPT4:12345)',
  `RelatedCode`        varchar(255) NOT NULL DEFAULT '' COMMENT 'Suggested code(S) for followup services if result is abnormal',
  `Units`               varchar(31)  NOT NULL DEFAULT '' COMMENT 'Default for procedureResult.units',
  `Range`               varchar(255) NOT NULL DEFAULT '' COMMENT 'Default for procedureResult.range',
  `Seq`                 int(11)      NOT NULL default 0  COMMENT 'Sequence number for ordering',
  `Activity`            tinyint(1)   NOT NULL default 1  COMMENT '1=active, 0=inactive',
  `Notes`               varchar(255) NOT NULL default '' COMMENT 'Additional notes to enhance description',
  PRIMARY KEY (`ProcedureTypeId`),
  KEY parent (Parent)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureQuestions` (
  `LabId`              bigint(20)   NOT NULL DEFAULT 0   COMMENT 'References procedureProviders.ppid to identify the lab',
  `ProcedureCode`      varchar(31)  NOT NULL DEFAULT ''  COMMENT 'References procedureType.procedureCode to identify this order type',
  `QuestionCode`       varchar(31)  NOT NULL DEFAULT ''  COMMENT 'Code identifying this question',
  `Seq`                 int(11)      NOT NULL default 0   COMMENT 'Sequence number for ordering',
  `QuestionText`       varchar(255) NOT NULL DEFAULT ''  COMMENT 'Descriptive text for questionCode',
  `Required`            tinyint(1)   NOT NULL DEFAULT 0   COMMENT '1 = required, 0 = not',
  `Maxsize`             int          NOT NULL DEFAULT 0   COMMENT 'Maximum length if text input field',
  `Fldtype`             char(1)      NOT NULL DEFAULT 'T' COMMENT 'Text,Number,Select,Multiselect,Date,Gestational-age',
  `Options`             text                              COMMENT 'Choices for fldtype S and T',
  `Tips`                varchar(255) NOT NULL DEFAULT ''  COMMENT 'Additional instructions for answering the question',
  `Activity`            tinyint(1)   NOT NULL DEFAULT 1   COMMENT '1 = active, 0 = inactive',
  PRIMARY KEY (`LabId`, `ProcedureCode`, `QuestionCode`)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureOrder` (
  `ProcedureOrderId`     bigint(20)   NOT NULL AUTO_INCREMENT,
  `ProviderId`            bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References users.id,The ordering provider',
  `PatientId`             bigint(20)   NOT NULL            COMMENT 'References patientData.pid',
  `EncounterId`           bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References formEncounter.encounter',
  `DateCollected`         datetime     DEFAULT NULL        COMMENT 'Time specimen collected',
  `DateOrdered`           date         DEFAULT NULL,
  `OrderPriority`         varchar(31)  NOT NULL DEFAULT '',
  `OrderStatus`           varchar(31)  NOT NULL DEFAULT '' COMMENT 'Pending,routed,complete,canceled',
  `PatientInstructions`   text,
  `Activity`               tinyint(1)   NOT NULL DEFAULT 1  COMMENT '0 if deleted',
  `ControlId`             varchar(255) NOT NULL DEFAULT '' COMMENT 'This is the CONTROL ID that is sent back from lab',
  `LabId`                 bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References procedureProviders.ppid',
  `SpecimenType`          varchar(31)  NOT NULL DEFAULT '' COMMENT 'From the SpecimenType list',
  `SpecimenLocation`      varchar(31)  NOT NULL DEFAULT '' COMMENT 'From the SpecimenLocation list',
  `SpecimenVolume`        varchar(30)  NOT NULL DEFAULT '' COMMENT 'From a text input field',
  `DateTransmitted`       datetime     DEFAULT NULL        COMMENT 'Time of order transmission,Null if unsent',
  `ClinicalHx`            varchar(255) NOT NULL DEFAULT '' COMMENT 'Clinical history text that may be relevant to the order',
  `ExternalId` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`ProcedureOrderId`),
  KEY datepid (DateOrdered,PatientId),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureOrderCode` (
  `ProcedureOrderId`  bigint(20)  NOT NULL                COMMENT 'References procedureOrder.procedureOrderId',
  `ProcedureOrderSeq` int(11)     NOT NULL COMMENT 'Supports multiple tests per order. ProcedureOrderSeq,Incremented in code',
  `ProcedureCode`      varchar(31) NOT NULL DEFAULT ''     COMMENT 'Like procedureType.procedureCode',
  `ProcedureName`      varchar(255) NOT NULL DEFAULT ''    COMMENT 'Descriptive name of the procedure code',
  `ProcedureSource`    char(1)     NOT NULL DEFAULT '1'    COMMENT '1=original order, 2=added after order sent',
  `Diagnoses`           text                                COMMENT 'Diagnoses and maybe other coding (E.g. ICD9:111.11)',
  `DoNotSend`         tinyint(1)  NOT NULL DEFAULT '0'    COMMENT '0 = normal, 1 = do not transmit to lab',
  `ProcedureOrderTitle` varchar( 255 ) NULL DEFAULT NULL,
  PRIMARY KEY (`ProcedureOrderId`, `ProcedureOrderSeq`)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureAnswers` (
  `ProcedureOrderId`  bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References procedureOrder.procedureOrderId',
  `ProcedureOrderSeq` int(11)      NOT NULL DEFAULT 0  COMMENT 'References procedureOrderCode.procedureOrderSeq',
  `QuestionCode`       varchar(31)  NOT NULL DEFAULT '' COMMENT 'References procedureQuestions.questionCode',
  `AnswerSeq`          int(11)      NOT NULL COMMENT 'Supports multiple-choice questions. answerSeq,Incremented in code',
  `Answer`              varchar(255) NOT NULL DEFAULT '' COMMENT 'Answer data',
  PRIMARY KEY (`ProcedureOrderId`, `ProcedureOrderSeq`, `QuestionCode`, `AnswerSeq`)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureReport` (
  `ProcedureReportId` bigint(20)     NOT NULL AUTO_INCREMENT,
  `ProcedureOrderId`  bigint(20)     DEFAULT NULL   COMMENT 'References procedureOrder.procedureOrderId',
  `ProcedureOrderSeq` int(11)        NOT NULL DEFAULT 1  COMMENT 'References procedureOrderCode.procedureOrderSeq',
  `DateCollected`      datetime       DEFAULT NULL,
  `DateCollectedTz`   varchar(5)     DEFAULT ''          COMMENT '+-hhmm offset from UTC',
  `DateReport`         datetime       DEFAULT NULL,
  `DateReportTz`      varchar(5)     DEFAULT ''          COMMENT '+-hhmm offset from UTC',
  `Source`              bigint(20)     NOT NULL DEFAULT 0  COMMENT 'References users.id,Who entered this data',
  `SpecimenNum`        varchar(63)    NOT NULL DEFAULT '',
  `ReportStatus`       varchar(31)    NOT NULL DEFAULT '' COMMENT 'Received,complete,error',
  `ReviewStatus`       varchar(31)    NOT NULL DEFAULT 'Received' COMMENT 'Pending review status: received,reviewed',  
  `ReportNotes`        text           COMMENT 'Notes from the lab',
  PRIMARY KEY (`ProcedureReportId`),
  KEY procedureOrderId (ProcedureOrderId)
) ENGINE=InnoDB;

CREATE TABLE `ProcedureResult` (
  `ProcedureResultId` bigint(20)   NOT NULL AUTO_INCREMENT,
  `ProcedureReportId` bigint(20)   NOT NULL            COMMENT 'References procedureReport.procedureReportId',
  `ResultDataType`    char(1)      NOT NULL DEFAULT 'S' COMMENT 'N=Numeric,S=String,F=Formatted,E=External,L=Long text as first line of comments',
  `ResultCode`         varchar(31)  NOT NULL DEFAULT '' COMMENT 'LOINC code,Might match a procedureType.procedureCode',
  `ResultText`         varchar(255) NOT NULL DEFAULT '' COMMENT 'Description of resultCode',
  `Date`                datetime     DEFAULT NULL        COMMENT 'Lab-provided date specific to this result',
  `Facility`            varchar(255) NOT NULL DEFAULT '' COMMENT 'Lab-provided testing facility ID',
  `Units`               varchar(31)  NOT NULL DEFAULT '',
  `Result`              varchar(255) NOT NULL DEFAULT '',
  `Range`               varchar(255) NOT NULL DEFAULT '',
  `Abnormal`            varchar(31)  NOT NULL DEFAULT '' COMMENT 'No,yes,high,low',
  `Comments`            text                             COMMENT 'Comments from the lab',
  `DocumentId`         bigint(20)   NOT NULL DEFAULT 0  COMMENT 'References documents.id if this result is a document',
  `ResultStatus`       varchar(31)  NOT NULL DEFAULT '' COMMENT 'Preliminary,Cannot be done,Final,Corrected,Incompete...etc.',
  PRIMARY KEY (`ProcedureResultId`),
  KEY procedureReportId (ProcedureReportId)
) ENGINE=InnoDB;

CREATE TABLE `Globals` (
  `GlName`             varchar(63)    NOT NULL,
  `GlIndex`            int(11)        NOT NULL DEFAULT 0,
  `GlValue`            varchar(255)   NOT NULL DEFAULT '',
  PRIMARY KEY (`GlName`, `GlIndex`)
) ENGINE=InnoDB;

CREATE TABLE codeTypes (
  ctKey  varchar(15) NOT NULL           COMMENT 'Short alphanumeric name',
  ctId   int(11)     UNIQUE NOT NULL    COMMENT 'Numeric identifier',
  ctSeq  int(11)     NOT NULL DEFAULT 0 COMMENT 'Sort order',
  ctMod  int(11)     NOT NULL DEFAULT 0 COMMENT 'Length of modifier field',
  ctJust varchar(15) NOT NULL DEFAULT ''COMMENT 'CtKey of justify type,If any',
  ctMask varchar(9)  NOT NULL DEFAULT ''COMMENT 'Formatting mask for code values',
  ctFee  tinyint(1)  NOT NULL default 0 COMMENT '1 if fees are used',
  ctRel  tinyint(1)  NOT NULL default 0 COMMENT '1 if can relate to other code types',
  ctNofs tinyint(1)  NOT NULL default 0 COMMENT '1 if to be hidden in the fee sheet',
  ctDiag tinyint(1)  NOT NULL default 0 COMMENT '1 if this is a diagnosis type',
  ctActive tinyint(1) NOT NULL default 1 COMMENT '1 if this is active',
  ctLabel varchar(31) NOT NULL default '' COMMENT 'Label of this code type',
  ctExternal tinyint(1) NOT NULL default 0 COMMENT '0 if stored codes in codes tables, 1 or greater if codes stored in external tables',
  ctClaim tinyint(1) NOT NULL default 0 COMMENT '1 if this is used in claims',
  ctProc tinyint(1) NOT NULL default 0 COMMENT '1 if this is a procedure type',
  ctTerm tinyint(1) NOT NULL default 0 COMMENT '1 if this is a clinical term',
  ctProblem tinyint(1) NOT NULL default 0 COMMENT '1 if this code type is used as a medical problem',
  ctDrug tinyint(1) NOT NULL default 0 COMMENT '1 if this code type is used as a medication',
  PRIMARY KEY (CtKey)
) ENGINE=InnoDB;

INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('ICD9' , 2, 1, 0, ''    , 0, 0, 0, 1, 1, 'ICD9 Diagnosis', 4, 1, 0, 0, 1);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('CPT4' , 1, 2, 12, 'ICD9', 1, 0, 0, 0, 1, 'CPT4 Procedure/Service', 0, 1, 1, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('HCPCS', 3, 3, 12, 'ICD9', 1, 0, 0, 0, 1, 'HCPCS Procedure/Service', 0, 1, 1, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('CVX'  , 100, 100, 0, '', 0, 0, 1, 0, 1, 'CVX Immunization', 0, 0, 0, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('DSMIV' , 101, 101, 0, '', 0, 0, 0, 1, 0, 'DSMIV Diagnosis', 0, 1, 0, 0, 1);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('ICD10' , 102, 102, 0, '', 0, 0, 0, 1, 1, 'ICD10 Diagnosis', 1, 1, 0, 0, 1);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('SNOMED' , 103, 103, 0, '', 0, 0, 0, 1, 0, 'SNOMED Diagnosis', 2, 1, 0, 0, 1);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('CPTII' , 104, 104, 0, 'ICD9', 0, 0, 0, 0, 0, 'CPTII Performance Measures', 0, 1, 0, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('ICD9-SG' , 105, 105, 12, 'ICD9', 1, 0, 0, 0, 0, 'ICD9 Procedure/Service', 5, 1, 1, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('ICD10-PCS' , 106, 106, 12, 'ICD10', 1, 0, 0, 0, 0, 'ICD10 Procedure/Service', 6, 1, 1, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('SNOMED-CT' , 107, 107, 0, '', 0, 0, 1, 0, 0, 'SNOMED Clinical Term', 7, 0, 0, 1, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('SNOMED-PR' , 108, 108, 0, 'SNOMED', 1, 0, 0, 0, 0, 'SNOMED Procedure', 9, 1, 1, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem,CtDrug ) VALUES ('RXCUI', 109, 109, 0, '', 0, 0, 1, 0, 0, 'RXCUI Medication', 0, 0, 0, 0, 0, 1);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('LOINC', 110, 110, 0, '', 0, 0, 1, 0, 1, 'LOINC', 0, 0, 0, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('PHIN Questions', 111, 111, 0, '', 0, 0, 1, 0, 1, 'PHIN Questions', 0, 0, 0, 0, 0);
INSERT INTO codeTypes (CtKey,CtId,CtSeq,CtMod,CtJust,CtFee,CtRel,CtNofs,CtDiag,CtActive,CtLabel,CtExternal,CtClaim,CtProc,CtTerm,CtProblem ) VALUES ('NCI-CONCEPT-ID', 112, 112, 0, '', 0, 0, 1, 0, 1, 'NCI CONCEPT ID', 0, 0, 0, 0, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq ) VALUES ('Lists', 'CodeTypes', 'Code Types', 1);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'DisclosureType','Disclosure Type', 3,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DisclosureType', 'Disclosure-treatment', 'Treatment', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DisclosureType', 'Disclosure-payment', 'Payment', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('DisclosureType', 'Disclosure-healthcareoperations', 'Health Care Operations', 30, 0);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'SmokingStatus','Smoking Status', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '1', 'Current every day smoker', 10, 0, 'SNOMED-CT:449868002');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '2', 'Current some day smoker', 20, 0, 'SNOMED-CT:428041000124106');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '3', 'Former smoker', 30, 0, 'SNOMED-CT:8517006');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '4', 'Never smoker', 40, 0, 'SNOMED-CT:266919005');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '5', 'Smoker,Current status unknown', 50, 0, 'SNOMED-CT:77176002');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '9', 'Unknown if ever smoked', 60, 0, 'SNOMED-CT:266927001');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '15', 'Heavy tobacco smoker', 70, 0, 'SNOMED-CT:428071000124103');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Codes ) VALUES ('SmokingStatus', '16', 'Light tobacco smoker', 80, 0, 'SNOMED-CT:428061000124105');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'Race','Race', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue ) VALUES ('Race', 'DeclneToSpecfy', 'Declined To Specify', 0, 0, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Race', 'AmerIndOrAlaskaNative', 'American Indian or Alaska Native', 10, 0, '1002-5');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Race', 'Asian', 'Asian',20,0, '2028-9');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Race', 'BlackOrAfriAmer', 'Black or African American',30,0, '2054-5');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Race', 'NativeHawaiOrPacIsland', 'Native Hawaiian or Other Pacific Islander',40,0, '2076-8');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Race', 'White', 'White',50,0, '2106-3');
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Abenaki','1006-6','Abenaki', '0',60);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AbsenteeShawnee','1579-2','Absentee Shawnee', '0',70);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Acoma','1490-2','Acoma', '0',80);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Afghanistani','2126-1','Afghanistani', '0',90);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','African','2060-2','African', '0',100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AfricanAmerican','2058-6','African American', '0',110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Agdaagux','1994-3','Agdaagux', '0',120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AguaCaliente','1212-0','Agua Caliente', '0',130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AguaCalienteCahuilla','1045-4','Agua Caliente Cahuilla', '0',140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ahtna','1740-0','Ahtna', '0',150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ak-chin','1654-3','Ak-Chin', '0',160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Akhiok','1993-5','Akhiok', '0',170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Akiachak','1897-8','Akiachak', '0',180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Akiak','1898-6','Akiak', '0',190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Akutan','2007-3','Akutan', '0',200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlabamaCoushatta','1187-4','Alabama Coushatta', '0',210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlabamaCreek','1194-0','Alabama Creek', '0',220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlabamaQuassarte','1195-7','Alabama Quassarte', '0',230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alakanuk','1899-4','Alakanuk', '0',240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlamoNavajo','1383-9','Alamo Navajo', '0',250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alanvik','1744-2','Alanvik', '0',260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlaskaIndian','1737-6','Alaska Indian', '0',270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlaskaNative','1735-0','Alaska Native', '0',280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlaskanAthabascan','1739-2','Alaskan Athabascan', '0',290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alatna','1741-8','Alatna', '0',300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Aleknagik','1900-0','Aleknagik', '0',310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Aleut','1966-1','Aleut', '0',320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AleutCorporation','2008-1','Aleut Corporation', '0',330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Aleutian','2009-9','Aleutian', '0',340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AleutianIslander','2010-7','Aleutian Islander', '0',350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alexander','1742-6','Alexander', '0',360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Algonquian','1008-2','Algonquian', '0',370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Allakaket','1743-4','Allakaket', '0',380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AllenCanyon','1671-7','Allen Canyon', '0',390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alpine','1688-1','Alpine', '0',400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Alsea','1392-0','Alsea', '0',410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AlutiiqAleut','1968-7','Alutiiq Aleut', '0',420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ambler','1845-7','Ambler', '0',430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AmericanIndian','1004-1','American Indian', '0',440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Anaktuvuk','1846-5','Anaktuvuk', '0',460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AnaktuvukPass','1847-3','Anaktuvuk Pass', '0',470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Andreafsky','1901-8','Andreafsky', '0',480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Angoon','1814-3','Angoon', '0',490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Aniak','1902-6','Aniak', '0',500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Anvik','1745-9','Anvik', '0',510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Apache','1010-8','Apache', '0',520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Arab','2129-5','Arab', '0',530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Arapaho','1021-5','Arapaho', '0',540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Arctic','1746-7','Arctic', '0',550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ArcticSlopeCorporation','1849-9','Arctic Slope Corporation', '0',560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ArcticSlopeInupiat','1848-1','Arctic Slope Inupiat', '0',570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Arikara','1026-4','Arikara', '0',580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ArizonaTewa','1491-0','Arizona Tewa', '0',590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Armenian','2109-7','Armenian', '0',600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Aroostook','1366-4','Aroostook', '0',610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AsianIndian','2029-7','Asian Indian', '0',630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Assiniboine','1028-0','Assiniboine', '0',640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','AssiniboineSioux','1030-6','Assiniboine Sioux', '0',650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Assyrian','2119-6','Assyrian', '0',660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Atka','2011-5','Atka', '0',670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Atmautluak','1903-4','Atmautluak', '0',680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Atqasuk','1850-7','Atqasuk', '0',690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Atsina','1265-8','Atsina', '0',700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Attacapa','1234-4','Attacapa', '0',710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Augustine','1046-2','Augustine', '0',720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BadRiver','1124-7','Bad River', '0',730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bahamian','2067-7','Bahamian', '0',740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bangladeshi','2030-5','Bangladeshi', '0',750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bannock','1033-0','Bannock', '0',760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Barbadian','2068-5','Barbadian', '0',770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BarrioLibre','1712-9','Barrio Libre', '0',780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Barrow','1851-5','Barrow', '0',790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BattleMountain','1587-5','Battle Mountain', '0',800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BayMillsChippewa','1125-4','Bay Mills Chippewa', '0',810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Beaver','1747-5','Beaver', '0',820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Belkofski','2012-3','Belkofski', '0',830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BeringStraitsInupiat','1852-3','Bering Straits Inupiat', '0',840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bethel','1904-2','Bethel', '0',850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bhutanese','2031-3','Bhutanese', '0',860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BigCypress','1567-7','Big Cypress', '0',870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BillMooresSlough','1905-9',"Bill Moore'S Slough", '0',880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Biloxi','1235-1','Biloxi', '0',890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BirchCreek','1748-3','Birch Creek', '0',900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bishop','1417-5','Bishop', '0',910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Black','2056-0','Black', '0',920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Blackfeet','1035-5','Blackfeet', '0',940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BlackfootSioux','1610-5','Blackfoot Sioux', '0',950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BoisForte','1126-2','Bois Forte', '0',960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Botswanan','2061-0','Botswanan', '0',970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BrevigMission','1853-1','Brevig Mission', '0',980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Bridgeport','1418-3','Bridgeport', '0',990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Brighton','1568-5','Brighton', '0',1000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BristolBayAleut','1972-9','Bristol Bay Aleut', '0',1010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BristolBayYupik','1906-7','Bristol Bay Yupik', '0',1020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Brotherton','1037-1','Brotherton', '0',1030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BruleSioux','1611-3','Brule Sioux', '0',1040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Buckland','1854-9','Buckland', '0',1050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Burmese','2032-1','Burmese', '0',1060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BurnsPaiute','1419-1','Burns Paiute', '0',1070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BurtLakeBand','1039-7','Burt Lake Band', '0',1080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BurtLakeChippewa','1127-0','Burt Lake Chippewa', '0',1090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','BurtLakeOttawa','1412-6','Burt Lake Ottawa', '0',1100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cabazon','1047-0','Cabazon', '0',1110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Caddo','1041-3','Caddo', '0',1120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cahto','1054-6','Cahto', '0',1130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cahuilla','1044-7','Cahuilla', '0',1140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CaliforniaTribes','1053-8','California Tribes', '0',1150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CalistaYupik','1907-5','Calista Yupik', '0',1160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cambodian','2033-9','Cambodian', '0',1170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Campo','1223-7','Campo', '0',1180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CanadianLatinamericanIndian','1068-6','Canadian and Latin American Indian', '0',1190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CanadianIndian','1069-4','Canadian Indian', '0',1200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CanoncitoNavajo','1384-7','Canoncito Navajo', '0',1210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cantwell','1749-1','Cantwell', '0',1220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CapitanGrande','1224-5','Capitan Grande', '0',1230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Carolinian','2092-5','Carolinian', '0',1240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Carson','1689-9','Carson', '0',1250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Catawba','1076-9','Catawba', '0',1260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cayuga','1286-4','Cayuga', '0',1270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cayuse','1078-5','Cayuse', '0',1280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cedarville','1420-9','Cedarville', '0',1290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Celilo','1393-8','Celilo', '0',1300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CentralAmericanIndian','1070-2','Central American Indian', '0',1310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TlingitAndHaidaTribes','1815-0','Central Council of Tlingit and Haida Tribes', '0',1320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CentralPomo','1465-4','Central Pomo', '0',1330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chalkyitsik','1750-9','Chalkyitsik', '0',1340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chamorro','2088-3','Chamorro', '0',1350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chefornak','1908-3','Chefornak', '0',1360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chehalis','1080-1','Chehalis', '0',1370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chemakuan','1082-7','Chemakuan', '0',1380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chemehuevi','1086-8','Chemehuevi', '0',1390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chenega','1985-1','Chenega', '0',1400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cherokee','1088-4','Cherokee', '0',1410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CherokeeAlabama','1089-2','Cherokee Alabama', '0',1420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CherokeeShawnee','1100-7','Cherokee Shawnee', '0',1430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CherokeesOfNortheastAlabama','1090-0','Cherokees of Northeast Alabama', '0',1440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CherokeesOfSoutheastAlabama','1091-8','Cherokees of Southeast Alabama', '0',1450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chevak','1909-1','Chevak', '0',1460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cheyenne','1102-3','Cheyenne', '0',1470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CheyenneRiverSioux','1612-1','Cheyenne River Sioux', '0',1480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cheyenne-arapaho','1106-4','Cheyenne-Arapaho', '0',1490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chickahominy','1108-0','Chickahominy', '0',1500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chickaloon','1751-7','Chickaloon', '0',1510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chickasaw','1112-2','Chickasaw', '0',1520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chignik','1973-7','Chignik', '0',1530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ChignikLagoon','2013-1','Chignik Lagoon', '0',1540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ChignikLake','1974-5','Chignik Lake', '0',1550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chilkat','1816-8','Chilkat', '0',1560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chilkoot','1817-6','Chilkoot', '0',1570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chimariko','1055-3','Chimariko', '0',1580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chinese','2034-7','Chinese', '0',1590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chinik','1855-6','Chinik', '0',1600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chinook','1114-8','Chinook', '0',1610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chippewa','1123-9','Chippewa', '0',1620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ChippewaCree','1150-2','Chippewa Cree', '0',1630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chiricahua','1011-6','Chiricahua', '0',1640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chistochina','1752-5','Chistochina', '0',1650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chitimacha','1153-6','Chitimacha', '0',1660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chitina','1753-3','Chitina', '0',1670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Choctaw','1155-1','Choctaw', '0',1680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chuathbaluk','1910-9','Chuathbaluk', '0',1690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ChugachAleut','1984-4','Chugach Aleut', '0',1700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ChugachCorporation','1986-9','Chugach Corporation', '0',1710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chukchansi','1718-6','Chukchansi', '0',1720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chumash','1162-7','Chumash', '0',1730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Chuukese','2097-4','Chuukese', '0',1740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Circle','1754-1','Circle', '0',1750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CitizenBandPotawatomi','1479-5','Citizen Band Potawatomi', '0',1760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ClarksPoint','1911-7',"Clark'S Point", '0',1770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Clatsop','1115-5','Clatsop', '0',1780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ClearLake','1165-0','Clear Lake', '0',1790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CliftonChoctaw','1156-9','Clifton Choctaw', '0',1800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CoastMiwok','1056-1','Coast Miwok', '0',1810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CoastYurok','1733-5','Coast Yurok', '0',1820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cochiti','1492-8','Cochiti', '0',1830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cocopah','1725-1','Cocopah', '0',1840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CoeurDalene','1167-6',"Coeur D'Alene", '0',1850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Coharie','1169-2','Coharie', '0',1860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ColoradoRiver','1171-8','Colorado River', '0',1870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Columbia','1394-6','Columbia', '0',1880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ColumbiaRiverChinook','1116-3','Columbia River Chinook', '0',1890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Colville','1173-4','Colville', '0',1900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Comanche','1175-9','Comanche', '0',1910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CookInlet','1755-8','Cook Inlet', '0',1920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Coos','1180-9','Coos', '0',1930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CoosLowerUmpquaSiuslaw','1178-3','Coos,Lower Umpqua,Siuslaw', '0',1940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CopperCenter','1756-6','Copper Center', '0',1950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CopperRiver','1757-4','Copper River', '0',1960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Coquilles','1182-5','Coquilles', '0',1970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Costanoan','1184-1','Costanoan', '0',1980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Council','1856-4','Council', '0',1990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Coushatta','1186-6','Coushatta', '0',2000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CowCreekUmpqua','1668-3','Cow Creek Umpqua', '0',2010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cowlitz','1189-0','Cowlitz', '0',2020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Craig','1818-4','Craig', '0',2030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cree','1191-6','Cree', '0',2040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Creek','1193-2','Creek', '0',2050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Croatan','1207-0','Croatan', '0',2060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CrookedCreek','1912-5','Crooked Creek', '0',2070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Crow','1209-6','Crow', '0',2080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','CrowCreekSioux','1613-9','Crow Creek Sioux', '0',2090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cupeno','1211-2','Cupeno', '0',2100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Cuyapaipe','1225-2','Cuyapaipe', '0',2110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','DakotaSioux','1614-7','Dakota Sioux', '0',2120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Deering','1857-2','Deering', '0',2130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Delaware','1214-6','Delaware', '0',2140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Diegueno','1222-9','Diegueno', '0',2150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Digger','1057-9','Digger', '0',2160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Dillingham','1913-3','Dillingham', '0',2170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','DominicaIslander','2070-1','Dominica Islander', '0',2180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Dominican','2069-3','Dominican', '0',2190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','DotLake','1758-2','Dot Lake', '0',2200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Douglas','1819-2','Douglas', '0',2210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Doyon','1759-0','Doyon', '0',2220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Dresslerville','1690-7','Dresslerville', '0',2230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','DryCreek','1466-2','Dry Creek', '0',2240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','DuckValley','1603-0','Duck Valley', '0',2250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Duckwater','1588-3','Duckwater', '0',2260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Duwamish','1519-8','Duwamish', '0',2270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Eagle','1760-8','Eagle', '0',2280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternCherokee','1092-6','Eastern Cherokee', '0',2290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternChickahominy','1109-8','Eastern Chickahominy', '0',2300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternCreek','1196-5','Eastern Creek', '0',2310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternDelaware','1215-3','Eastern Delaware', '0',2320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternMuscogee','1197-3','Eastern Muscogee', '0',2330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternPomo','1467-0','Eastern Pomo', '0',2340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternShawnee','1580-0','Eastern Shawnee', '0',2350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EasternTribes','1233-6','Eastern Tribes', '0',2360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EchotaCherokee','1093-4','Echota Cherokee', '0',2370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Eek','1914-1','Eek', '0',2380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Egegik','1975-2','Egegik', '0',2390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Egyptian','2120-4','Egyptian', '0',2400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Eklutna','1761-6','Eklutna', '0',2410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ekuk','1915-8','Ekuk', '0',2420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ekwok','1916-6','Ekwok', '0',2430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Elim','1858-0','Elim', '0',2440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Elko','1589-1','Elko', '0',2450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ely','1590-9','Ely', '0',2460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Emmonak','1917-4','Emmonak', '0',2470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','English','2110-5','English', '0',2480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EnglishBay','1987-7','English Bay', '0',2490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Eskimo','1840-8','Eskimo', '0',2500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Esselen','1250-0','Esselen', '0',2510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ethiopian','2062-8','Ethiopian', '0',2520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','EtowahCherokee','1094-2','Etowah Cherokee', '0',2530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','European','2108-9','European', '0',2540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Evansville','1762-4','Evansville', '0',2550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Eyak','1990-1','Eyak', '0',2560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Fallon','1604-8','Fallon', '0',2570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FalsePass','2015-6','False Pass', '0',2580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Fijian','2101-4','Fijian', '0',2590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Filipino','2036-2','Filipino', '0',2600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FlandreauSantee','1615-4','Flandreau Santee', '0',2610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FloridaSeminole','1569-3','Florida Seminole', '0',2620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FondDuLac','1128-8','Fond du Lac', '0',2630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ForestCounty','1480-3','Forest County', '0',2640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortBelknap','1252-6','Fort Belknap', '0',2650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortBerthold','1254-2','Fort Berthold', '0',2660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortBidwell','1421-7','Fort Bidwell', '0',2670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortHall','1258-3','Fort Hall', '0',2680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortIndependence','1422-5','Fort Independence', '0',2690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortMcdermitt','1605-5','Fort McDermitt', '0',2700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortMcdowell','1256-7','Fort Mcdowell', '0',2710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortPeck','1616-2','Fort Peck', '0',2720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortPeckAssiniboineSioux','1031-4','Fort Peck Assiniboine Sioux', '0',2730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortSillApache','1012-4','Fort Sill Apache', '0',2740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FortYukon','1763-2','Fort Yukon', '0',2750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','French','2111-3','French', '0',2760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','FrenchAmericanIndian','1071-0','French American Indian', '0',2770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Gabrieleno','1260-9','Gabrieleno', '0',2780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Gakona','1764-0','Gakona', '0',2790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Galena','1765-7','Galena', '0',2800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Gambell','1892-9','Gambell', '0',2810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GayHeadWampanoag','1680-8','Gay Head Wampanoag', '0',2820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GeorgetownEasternTribes','1236-9','Georgetown (Eastern Tribes)', '0',2830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GeorgetownYupik-eskimo','1962-0','Georgetown (Yupik-Eskimo)', '0',2840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','German','2112-1','German', '0',2850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GilaBend','1655-0','Gila Bend', '0',2860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GilaRiverPima-maricopa','1457-1','Gila River Pima-Maricopa', '0',2870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Golovin','1859-8','Golovin', '0',2880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GoodnewsBay','1918-2','Goodnews Bay', '0',2890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Goshute','1591-7','Goshute', '0',2900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GrandPortage','1129-6','Grand Portage', '0',2910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GrandRonde','1262-5','Grand Ronde', '0',2920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GrandTraverseBand','1130-4','Grand Traverse Band of Ottawa/Chippewa', '0',2930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Grayling','1766-5','Grayling', '0',2940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GreenlandEskimo','1842-4','Greenland Eskimo', '0',2950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GrosVentres','1264-1','Gros Ventres', '0',2960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Guamanian','2087-5','Guamanian', '0',2970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','GuamanianOrChamorro','2086-7','Guamanian or Chamorro', '0',2980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Gulkana','1767-3','Gulkana', '0',2990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Haida','1820-0','Haida', '0',3000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Haitian','2071-9','Haitian', '0',3010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Haliwa','1267-4','Haliwa', '0',3020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hannahville','1481-1','Hannahville', '0',3030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Havasupai','1726-9','Havasupai', '0',3040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HealyLake','1768-1','Healy Lake', '0',3050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hidatsa','1269-0','Hidatsa', '0',3060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hmong','2037-0','Hmong', '0',3070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ho-chunk','1697-2','Ho-chunk', '0',3080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hoh','1083-5','Hoh', '0',3090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HollywoodSeminole','1570-1','Hollywood Seminole', '0',3100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HolyCross','1769-9','Holy Cross', '0',3110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hoonah','1821-8','Hoonah', '0',3120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hoopa','1271-6','Hoopa', '0',3130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HoopaExtension','1275-7','Hoopa Extension', '0',3140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HooperBay','1919-0','Hooper Bay', '0',3150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hopi','1493-6','Hopi', '0',3160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Houma','1277-3','Houma', '0',3170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hualapai','1727-7','Hualapai', '0',3180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hughes','1770-7','Hughes', '0',3190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','HuronPotawatomi','1482-9','Huron Potawatomi', '0',3200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Huslia','1771-5','Huslia', '0',3210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Hydaburg','1822-6','Hydaburg', '0',3220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Igiugig','1976-0','Igiugig', '0',3230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Iliamna','1772-3','Iliamna', '0',3240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IllinoisMiami','1359-9','Illinois Miami', '0',3250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Inaja-cosmit','1279-9','Inaja-Cosmit', '0',3260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','InalikDiomede','1860-6','Inalik Diomede', '0',3270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IndianTownship','1442-3','Indian Township', '0',3280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IndianaMiami','1360-7','Indiana Miami', '0',3290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Indonesian','2038-8','Indonesian', '0',3300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Inupiaq','1861-4','Inupiaq', '0',3310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','InupiatEskimo','1844-0','Inupiat Eskimo', '0',3320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Iowa','1281-5','Iowa', '0',3330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IowaOfKansas-nebraska','1282-3','Iowa of Kansas-Nebraska', '0',3340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IowaOfOklahoma','1283-1','Iowa of Oklahoma', '0',3350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IowaSacAndFox','1552-9','Iowa Sac and Fox', '0',3360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IqurmuitRussianMission','1920-8','Iqurmuit (Russian Mission)', '0',3370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Iranian','2121-2','Iranian', '0',3380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Iraqi','2122-0','Iraqi', '0',3390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Irish','2113-9','Irish', '0',3400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Iroquois','1285-6','Iroquois', '0',3410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Isleta','1494-4','Isleta', '0',3420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Israeili','2127-9','Israeili', '0',3430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Italian','2114-7','Italian', '0',3440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IvanofBay','1977-8','Ivanof Bay', '0',3450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','IwoJiman','2048-7','Iwo Jiman', '0',3460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Jamaican','2072-7','Jamaican', '0',3470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Jamestown','1313-6','Jamestown', '0',3480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Japanese','2039-6','Japanese', '0',3490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Jemez','1495-1','Jemez', '0',3500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','JenaChoctaw','1157-7','Jena Choctaw', '0',3510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','JicarillaApache','1013-2','Jicarilla Apache', '0',3520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Juaneno','1297-1','Juaneno', '0',3530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kaibab','1423-3','Kaibab', '0',3540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kake','1823-4','Kake', '0',3550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kaktovik','1862-2','Kaktovik', '0',3560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kalapuya','1395-3','Kalapuya', '0',3570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kalispel','1299-7','Kalispel', '0',3580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kalskag','1921-6','Kalskag', '0',3590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kaltag','1773-1','Kaltag', '0',3600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Karluk','1995-0','Karluk', '0',3610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Karuk','1301-1','Karuk', '0',3620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kasaan','1824-2','Kasaan', '0',3630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kashia','1468-8','Kashia', '0',3640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kasigluk','1922-4','Kasigluk', '0',3650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kathlamet','1117-1','Kathlamet', '0',3660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kaw','1303-7','Kaw', '0',3670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kawaiisu','1058-7','Kawaiisu', '0',3680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kawerak','1863-0','Kawerak', '0',3690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kenaitze','1825-9','Kenaitze', '0',3700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Keres','1496-9','Keres', '0',3710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','KernRiver','1059-5','Kern River', '0',3720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ketchikan','1826-7','Ketchikan', '0',3730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Keweenaw','1131-2','Keweenaw', '0',3740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kialegee','1198-1','Kialegee', '0',3750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kiana','1864-8','Kiana', '0',3760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kickapoo','1305-2','Kickapoo', '0',3770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kikiallus','1520-6','Kikiallus', '0',3780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','KingCove','2014-9','King Cove', '0',3790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','KingSalmon','1978-6','King Salmon', '0',3800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kiowa','1309-4','Kiowa', '0',3810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kipnuk','1923-2','Kipnuk', '0',3820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kiribati','2096-6','Kiribati', '0',3830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kivalina','1865-5','Kivalina', '0',3840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Klallam','1312-8','Klallam', '0',3850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Klamath','1317-7','Klamath', '0',3860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Klawock','1827-5','Klawock', '0',3870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','KlutiKaah','1774-9','Kluti Kaah', '0',3880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Knik','1775-6','Knik', '0',3890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kobuk','1866-3','Kobuk', '0',3900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kodiak','1996-8','Kodiak', '0',3910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kokhanok','1979-4','Kokhanok', '0',3920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Koliganek','1924-0','Koliganek', '0',3930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kongiganak','1925-7','Kongiganak', '0',3940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','KoniagAleut','1992-7','Koniag Aleut', '0',3950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Konkow','1319-3','Konkow', '0',3960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kootenai','1321-9','Kootenai', '0',3970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Korean','2040-4','Korean', '0',3980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kosraean','2093-3','Kosraean', '0',3990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kotlik','1926-5','Kotlik', '0',4000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kotzebue','1867-1','Kotzebue', '0',4010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Koyuk','1868-9','Koyuk', '0',4020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Koyukuk','1776-4','Koyukuk', '0',4030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kwethluk','1927-3','Kwethluk', '0',4040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kwigillingok','1928-1','Kwigillingok', '0',4050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Kwiguk','1869-7','Kwiguk', '0',4060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LaJolla','1332-6','La Jolla', '0',4070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LaPosta','1226-0','La Posta', '0',4080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LacCourteOreilles','1132-0','Lac Courte Oreilles', '0',4090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LacDuFlambeau','1133-8','Lac du Flambeau', '0',4100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LacVieuxDesertChippewa','1134-6','Lac Vieux Desert Chippewa', '0',4110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Laguna','1497-7','Laguna', '0',4120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LakeMinchumina','1777-2','Lake Minchumina', '0',4130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LakeSuperior','1135-3','Lake Superior', '0',4140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LakeTraverseSioux','1617-0','Lake Traverse Sioux', '0',4150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Laotian','2041-2','Laotian', '0',4160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LarsenBay','1997-6','Larsen Bay', '0',4170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LasVegas','1424-1','Las Vegas', '0',4180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lassik','1323-5','Lassik', '0',4190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lebanese','2123-8','Lebanese', '0',4200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LeechLake','1136-1','Leech Lake', '0',4210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lenni-lenape','1216-1','Lenni-Lenape', '0',4220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Levelock','1929-9','Levelock', '0',4230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Liberian','2063-6','Liberian', '0',4240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lime','1778-0','Lime', '0',4250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LipanApache','1014-0','Lipan Apache', '0',4260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LittleShellChippewa','1137-9','Little Shell Chippewa', '0',4270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LonePine','1425-8','Lone Pine', '0',4280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LongIsland','1325-0','Long Island', '0',4290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LosCoyotes','1048-8','Los Coyotes', '0',4300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lovelock','1426-6','Lovelock', '0',4310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerBruleSioux','1618-8','Lower Brule Sioux', '0',4320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerElwha','1314-4','Lower Elwha', '0',4330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerKalskag','1930-7','Lower Kalskag', '0',4340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerMuscogee','1199-9','Lower Muscogee', '0',4350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerSioux','1619-6','Lower Sioux', '0',4360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','LowerSkagit','1521-4','Lower Skagit', '0',4370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Luiseno','1331-8','Luiseno', '0',4380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lumbee','1340-9','Lumbee', '0',4390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Lummi','1342-5','Lummi', '0',4400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MachisLowerCreekIndian','1200-5','Machis Lower Creek Indian', '0',4410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Madagascar','2052-9','Madagascar', '0',4420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Maidu','1344-1','Maidu', '0',4430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Makah','1348-2','Makah', '0',4440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Malaysian','2042-0','Malaysian', '0',4450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Maldivian','2049-5','Maldivian', '0',4460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MalheurPaiute','1427-4','Malheur Paiute', '0',4470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Maliseet','1350-8','Maliseet', '0',4480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mandan','1352-4','Mandan', '0',4490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ManleyHotSprings','1780-6','Manley Hot Springs', '0',4500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Manokotak','1931-5','Manokotak', '0',4510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Manzanita','1227-8','Manzanita', '0',4520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MarianaIslander','2089-1','Mariana Islander', '0',4530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Maricopa','1728-5','Maricopa', '0',4540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Marshall','1932-3','Marshall', '0',4550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Marshallese','2090-9','Marshallese', '0',4560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MarshantucketPequot','1454-8','Marshantucket Pequot', '0',4570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MarysIgloo','1889-5',"Mary'S Igloo", '0',4580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MashpeeWampanoag','1681-6','Mashpee Wampanoag', '0',4590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Matinecock','1326-8','Matinecock', '0',4600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mattaponi','1354-0','Mattaponi', '0',4610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mattole','1060-3','Mattole', '0',4620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MaunelukInupiat','1870-5','Mauneluk Inupiat', '0',4630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mcgrath','1779-8','Mcgrath', '0',4640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MdewakantonSioux','1620-4','Mdewakanton Sioux', '0',4650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mekoryuk','1933-1','Mekoryuk', '0',4660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Melanesian','2100-6','Melanesian', '0',4670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Menominee','1356-5','Menominee', '0',4680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MentastaLake','1781-4','Mentasta Lake', '0',4690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MesaGrande','1228-6','Mesa Grande', '0',4700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MescaleroApache','1015-7','Mescalero Apache', '0',4710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Metlakatla','1838-2','Metlakatla', '0',4720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MexicanAmericanIndian','1072-8','Mexican American Indian', '0',4730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Miami','1358-1','Miami', '0',4740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Miccosukee','1363-1','Miccosukee', '0',4750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MichiganOttawa','1413-4','Michigan Ottawa', '0',4760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Micmac','1365-6','Micmac', '0',4770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Micronesian','2085-9','Micronesian', '0',4780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MiddleEasternNorthAfrican','2118-8','Middle Eastern or North African', '0',4790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MilleLacs','1138-7','Mille Lacs', '0',4800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Miniconjou','1621-2','Miniconjou', '0',4810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MinnesotaChippewa','1139-5','Minnesota Chippewa', '0',4820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Minto','1782-2','Minto', '0',4830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MissionIndians','1368-0','Mission Indians', '0',4840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MississippiChoctaw','1158-5','Mississippi Choctaw', '0',4850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MissouriSacAndFox','1553-7','Missouri Sac and Fox', '0',4860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Miwok','1370-6','Miwok', '0',4870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Moapa','1428-2','Moapa', '0',4880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Modoc','1372-2','Modoc', '0',4890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mohave','1729-3','Mohave', '0',4900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mohawk','1287-2','Mohawk', '0',4910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mohegan','1374-8','Mohegan', '0',4920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Molala','1396-1','Molala', '0',4930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Mono','1376-3','Mono', '0',4940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Montauk','1327-6','Montauk', '0',4950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Moor','1237-7','Moor', '0',4960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Morongo','1049-6','Morongo', '0',4970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MountainMaidu','1345-8','Mountain Maidu', '0',4980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MountainVillage','1934-9','Mountain Village', '0',4990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','MowaBandOfChoctaw','1159-3','Mowa Band of Choctaw', '0',5000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Muckleshoot','1522-2','Muckleshoot', '0',5010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Munsee','1217-9','Munsee', '0',5020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Naknek','1935-6','Naknek', '0',5030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nambe','1498-5','Nambe', '0',5040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Namibian','2064-4','Namibian', '0',5050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NanaInupiat','1871-3','Nana Inupiat', '0',5060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nansemond','1238-5','Nansemond', '0',5070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nanticoke','1378-9','Nanticoke', '0',5080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Napakiak','1937-2','Napakiak', '0',5090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Napaskiak','1938-0','Napaskiak', '0',5100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Napaumute','1936-4','Napaumute', '0',5110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Narragansett','1380-5','Narragansett', '0',5120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Natchez','1239-3','Natchez', '0',5130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NativeHawaiian','2079-2','Native Hawaiian', '0',5140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NausuWaiwash','1240-1','Nausu Waiwash', '0',5160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Navajo','1382-1','Navajo', '0',5170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NebraskaPonca','1475-3','Nebraska Ponca', '0',5180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NebraskaWinnebago','1698-0','Nebraska Winnebago', '0',5190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NelsonLagoon','2016-4','Nelson Lagoon', '0',5200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nenana','1783-0','Nenana', '0',5210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nepalese','2050-3','Nepalese', '0',5220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NewHebrides','2104-8','New Hebrides', '0',5230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NewStuyahok','1940-6','New Stuyahok', '0',5240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Newhalen','1939-8','Newhalen', '0',5250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Newtok','1941-4','Newtok', '0',5260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NezPerce','1387-0','Nez Perce', '0',5270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nigerian','2065-1','Nigerian', '0',5280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nightmute','1942-2','Nightmute', '0',5290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nikolai','1784-8','Nikolai', '0',5300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nikolski','2017-2','Nikolski', '0',5310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ninilchik','1785-5','Ninilchik', '0',5320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nipmuc','1241-9','Nipmuc', '0',5330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nishinam','1346-6','Nishinam', '0',5340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nisqually','1523-0','Nisqually', '0',5350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Noatak','1872-1','Noatak', '0',5360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nomalaki','1389-6','Nomalaki', '0',5370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nome','1873-9','Nome', '0',5380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nondalton','1786-3','Nondalton', '0',5390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nooksack','1524-8','Nooksack', '0',5400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Noorvik','1874-7','Noorvik', '0',5410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthernArapaho','1022-3','Northern Arapaho', '0',5420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthernCherokee','1095-9','Northern Cherokee', '0',5430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthernCheyenne','1103-1','Northern Cheyenne', '0',5440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthernPaiute','1429-0','Northern Paiute', '0',5450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthernPomo','1469-6','Northern Pomo', '0',5460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Northway','1787-1','Northway', '0',5470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','NorthwestTribes','1391-2','Northwest Tribes', '0',5480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nuiqsut','1875-4','Nuiqsut', '0',5490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nulato','1788-9','Nulato', '0',5500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Nunapitchukv','1943-0','Nunapitchukv', '0',5510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OglalaSioux','1622-0','Oglala Sioux', '0',5520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Okinawan','2043-8','Okinawan', '0',5530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaApache','1016-5','Oklahoma Apache', '0',5540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaCado','1042-1','Oklahoma Cado', '0',5550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaChoctaw','1160-1','Oklahoma Choctaw', '0',5560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaComanche','1176-7','Oklahoma Comanche', '0',5570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaDelaware','1218-7','Oklahoma Delaware', '0',5580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaKickapoo','1306-0','Oklahoma Kickapoo', '0',5590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaKiowa','1310-2','Oklahoma Kiowa', '0',5600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaMiami','1361-5','Oklahoma Miami', '0',5610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaOttawa','1414-2','Oklahoma Ottawa', '0',5620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaPawnee','1446-4','Oklahoma Pawnee', '0',5630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaPeoria','1451-4','Oklahoma Peoria', '0',5640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaPonca','1476-1','Oklahoma Ponca', '0',5650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaSacAndFox','1554-5','Oklahoma Sac and Fox', '0',5660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OklahomaSeminole','1571-9','Oklahoma Seminole', '0',5670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OldHarbor','1998-4','Old Harbor', '0',5680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Omaha','1403-5','Omaha', '0',5690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Oneida','1288-0','Oneida', '0',5700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Onondaga','1289-8','Onondaga', '0',5710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ontonagon','1140-3','Ontonagon', '0',5720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OregonAthabaskan','1405-0','Oregon Athabaskan', '0',5730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Osage','1407-6','Osage', '0',5740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Oscarville','1944-8','Oscarville', '0',5750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OtherPacificIslander','2500-7','Other Pacific Islander', '0',5760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OtherRace','2131-1','Other Race', '0',5770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Otoe-missouria','1409-2','Otoe-Missouria', '0',5780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ottawa','1411-8','Ottawa', '0',5790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ouzinkie','1999-2','Ouzinkie', '0',5800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','OwensValley','1430-8','Owens Valley', '0',5810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Paiute','1416-7','Paiute', '0',5820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pakistani','2044-6','Pakistani', '0',5830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pala','1333-4','Pala', '0',5840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Palauan','2091-7','Palauan', '0',5850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Palestinian','2124-6','Palestinian', '0',5860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pamunkey','1439-9','Pamunkey', '0',5870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Panamint','1592-5','Panamint', '0',5880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PapuaNewGuinean','2102-2','Papua New Guinean', '0',5890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PascuaYaqui','1713-7','Pascua Yaqui', '0',5900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Passamaquoddy','1441-5','Passamaquoddy', '0',5910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Paugussett','1242-7','Paugussett', '0',5920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PauloffHarbor','2018-0','Pauloff Harbor', '0',5930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pauma','1334-2','Pauma', '0',5940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pawnee','1445-6','Pawnee', '0',5950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PaysonApache','1017-3','Payson Apache', '0',5960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pechanga','1335-9','Pechanga', '0',5970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PedroBay','1789-7','Pedro Bay', '0',5980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pelican','1828-3','Pelican', '0',5990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Penobscot','1448-0','Penobscot', '0',6000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Peoria','1450-6','Peoria', '0',6010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pequot','1453-0','Pequot', '0',6020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Perryville','1980-2','Perryville', '0',6030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Petersburg','1829-1','Petersburg', '0',6040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Picuris','1499-3','Picuris', '0',6050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PilotPoint','1981-0','Pilot Point', '0',6060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PilotStation','1945-5','Pilot Station', '0',6070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pima','1456-3','Pima', '0',6080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PineRidgeSioux','1623-8','Pine Ridge Sioux', '0',6090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PipestoneSioux','1624-6','Pipestone Sioux', '0',6100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Piro','1500-8','Piro', '0',6110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Piscataway','1460-5','Piscataway', '0',6120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PitRiver','1462-1','Pit River', '0',6130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PitkasPoint','1946-3','Pitkas Point', '0',6140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Platinum','1947-1','Platinum', '0',6150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PleasantPointPassamaquoddy','1443-1','Pleasant Point Passamaquoddy', '0',6160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PoarchBand','1201-3','Poarch Band', '0',6170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PocomokeAcohonock','1243-5','Pocomoke Acohonock', '0',6180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pohnpeian','2094-1','Pohnpeian', '0',6190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PointHope','1876-2','Point Hope', '0',6200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PointLay','1877-0','Point Lay', '0',6210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pojoaque','1501-6','Pojoaque', '0',6220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PokagonPotawatomi','1483-7','Pokagon Potawatomi', '0',6230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Polish','2115-4','Polish', '0',6240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Polynesian','2078-4','Polynesian', '0',6250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pomo','1464-7','Pomo', '0',6260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ponca','1474-6','Ponca', '0',6270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Poospatuck','1328-4','Poospatuck', '0',6280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortGambleKlallam','1315-1','Port Gamble Klallam', '0',6290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortGraham','1988-5','Port Graham', '0',6300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortHeiden','1982-8','Port Heiden', '0',6310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortLions','2000-8','Port Lions', '0',6320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortMadison','1525-5','Port Madison', '0',6330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PortageCreek','1948-9','Portage Creek', '0',6340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Potawatomi','1478-7','Potawatomi', '0',6350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Powhatan','1487-8','Powhatan', '0',6360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PrairieBand','1484-5','Prairie Band', '0',6370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PrairieIslandSioux','1625-3','Prairie Island Sioux', '0',6380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PrincipalCreekIndianNation','1202-1','Principal Creek Indian Nation', '0',6390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PriorLakeSioux','1626-1','Prior Lake Sioux', '0',6400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Pueblo','1489-4','Pueblo', '0',6410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PugetSoundSalish','1518-0','Puget Sound Salish', '0',6420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Puyallup','1526-3','Puyallup', '0',6430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','PyramidLake','1431-6','Pyramid Lake', '0',6440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','QaganToyagungin','2019-8','Qagan Toyagungin', '0',6450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Qawalangin','2020-6','Qawalangin', '0',6460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Quapaw','1541-2','Quapaw', '0',6470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Quechan','1730-1','Quechan', '0',6480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Quileute','1084-3','Quileute', '0',6490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Quinault','1543-8','Quinault', '0',6500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Quinhagak','1949-7','Quinhagak', '0',6510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RamahNavajo','1385-4','Ramah Navajo', '0',6520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Rampart','1790-5','Rampart', '0',6530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RampoughMountain','1219-5','Rampough Mountain', '0',6540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Rappahannock','1545-3','Rappahannock', '0',6550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RedCliffChippewa','1141-1','Red Cliff Chippewa', '0',6560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RedDevil','1950-5','Red Devil', '0',6570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RedLakeChippewa','1142-9','Red Lake Chippewa', '0',6580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RedWood','1061-1','Red Wood', '0',6590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Reno-sparks','1547-9','Reno-Sparks', '0',6600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RockyBoysChippewaCree','1151-0',"Rocky Boy'S Chippewa Cree", '0',6610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RosebudSioux','1627-9','Rosebud Sioux', '0',6620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RoundValley','1549-5','Round Valley', '0',6630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ruby','1791-3','Ruby', '0',6640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','RubyValley','1593-3','Ruby Valley', '0',6650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SacAndFox','1551-1','Sac and Fox', '0',6660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SaginawChippewa','1143-7','Saginaw Chippewa', '0',6670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Saipanese','2095-8','Saipanese', '0',6680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Salamatof','1792-1','Salamatof', '0',6690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Salinan','1556-0','Salinan', '0',6700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Salish','1558-6','Salish', '0',6710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SalishAndKootenai','1560-2','Salish and Kootenai', '0',6720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SaltRiverPima-maricopa','1458-9','Salt River Pima-Maricopa', '0',6730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Samish','1527-1','Samish', '0',6740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Samoan','2080-0','Samoan', '0',6750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanCarlosApache','1018-1','San Carlos Apache', '0',6760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanFelipe','1502-4','San Felipe', '0',6770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanIldefonso','1503-2','San Ildefonso', '0',6780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanJuan','1506-5','San Juan', '0',6790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanJuanDe','1505-7','San Juan De', '0',6800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanJuanPueblo','1504-0','San Juan Pueblo', '0',6810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanJuanSouthernPaiute','1432-4','San Juan Southern Paiute', '0',6820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanManual','1574-3','San Manual', '0',6830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanPasqual','1229-4','San Pasqual', '0',6840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanXavier','1656-8','San Xavier', '0',6850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SandHill','1220-3','Sand Hill', '0',6860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SandPoint','2023-0','Sand Point', '0',6870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sandia','1507-3','Sandia', '0',6880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SansArcSioux','1628-7','Sans Arc Sioux', '0',6890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaAna','1508-1','Santa Ana', '0',6900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaClara','1509-9','Santa Clara', '0',6910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaRosa','1062-9','Santa Rosa', '0',6920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaRosaCahuilla','1050-4','Santa Rosa Cahuilla', '0',6930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaYnez','1163-5','Santa Ynez', '0',6940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantaYsabel','1230-2','Santa Ysabel', '0',6950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SanteeSioux','1629-5','Santee Sioux', '0',6960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SantoDomingo','1510-7','Santo Domingo', '0',6970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sauk-suiattle','1528-9','Sauk-Suiattle', '0',6980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SaultSteMarieChippewa','1145-2','Sault Ste. Marie Chippewa', '0',6990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Savoonga','1893-7','Savoonga', '0',7000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Saxman','1830-9','Saxman', '0',7010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ScammonBay','1952-1','Scammon Bay', '0',7020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Schaghticoke','1562-8','Schaghticoke', '0',7030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ScottValley','1564-4','Scott Valley', '0',7040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Scottish','2116-2','Scottish', '0',7050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ScottsValley','1470-4','Scotts Valley', '0',7060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Selawik','1878-8','Selawik', '0',7070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Seldovia','1793-9','Seldovia', '0',7080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sells','1657-6','Sells', '0',7090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Seminole','1566-9','Seminole', '0',7100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Seneca','1290-6','Seneca', '0',7110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SenecaNation','1291-4','Seneca Nation', '0',7120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Seneca-cayuga','1292-2','Seneca-Cayuga', '0',7130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Serrano','1573-5','Serrano', '0',7140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Setauket','1329-2','Setauket', '0',7150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shageluk','1795-4','Shageluk', '0',7160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shaktoolik','1879-6','Shaktoolik', '0',7170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shasta','1576-8','Shasta', '0',7180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shawnee','1578-4','Shawnee', '0',7190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SheldonsPoint','1953-9',"Sheldon'S Point", '0',7200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shinnecock','1582-6','Shinnecock', '0',7210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shishmaref','1880-4','Shishmaref', '0',7220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ShoalwaterBay','1584-2','Shoalwater Bay', '0',7230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shoshone','1586-7','Shoshone', '0',7240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','ShoshonePaiute','1602-2','Shoshone Paiute', '0',7250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Shungnak','1881-2','Shungnak', '0',7260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SiberianEskimo','1891-1','Siberian Eskimo', '0',7270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SiberianYupik','1894-5','Siberian Yupik', '0',7280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Siletz','1607-1','Siletz', '0',7290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Singaporean','2051-1','Singaporean', '0',7300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sioux','1609-7','Sioux', '0',7310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SissetonSioux','1631-1','Sisseton Sioux', '0',7320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sisseton-wahpeton','1630-3','Sisseton-Wahpeton', '0',7330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sitka','1831-7','Sitka', '0',7340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Siuslaw','1643-6','Siuslaw', '0',7350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Skokomish','1529-7','Skokomish', '0',7360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SkullValley','1594-1','Skull Valley', '0',7370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Skykomish','1530-5','Skykomish', '0',7380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Slana','1794-7','Slana', '0',7390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sleetmute','1954-7','Sleetmute', '0',7400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Snohomish','1531-3','Snohomish', '0',7410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Snoqualmie','1532-1','Snoqualmie', '0',7420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Soboba','1336-7','Soboba', '0',7430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SokoagonChippewa','1146-0','Sokoagon Chippewa', '0',7440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Solomon','1882-0','Solomon', '0',7450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SolomonIslander','2103-0','Solomon Islander', '0',7460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthAmericanIndian','1073-6','South American Indian', '0',7470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthForkShoshone','1595-8','South Fork Shoshone', '0',7480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthNaknek','2024-8','South Naknek', '0',7490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SoutheastAlaska','1811-9','Southeast Alaska', '0',7500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SoutheasternIndians','1244-3','Southeastern Indians', '0',7510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthernArapaho','1023-1','Southern Arapaho', '0',7520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthernCheyenne','1104-9','Southern Cheyenne', '0',7530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SouthernPaiute','1433-2','Southern Paiute', '0',7540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SpanishAmericanIndian','1074-4','Spanish American Indian', '0',7550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SpiritLakeSioux','1632-9','Spirit Lake Sioux', '0',7560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Spokane','1645-1','Spokane', '0',7570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SquaxinIsland','1533-9','Squaxin Island', '0',7580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SriLankan','2045-3','Sri Lankan', '0',7590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StCroixChippewa','1144-5','St. Croix Chippewa', '0',7600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StGeorge','2021-4','St. George', '0',7610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StMarys','1963-8',"St. Mary'S", '0',7620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StMichael','1951-3','St. Michael', '0',7630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StPaul','2022-2','St. Paul', '0',7640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StandingRockSioux','1633-7','Standing Rock Sioux', '0',7650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StarClanOfMuscogeeCreeks','1203-9','Star Clan of Muscogee Creeks', '0',7660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stebbins','1955-4','Stebbins', '0',7670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Steilacoom','1534-7','Steilacoom', '0',7680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stevens','1796-2','Stevens', '0',7690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stewart','1647-7','Stewart', '0',7700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stillaguamish','1535-4','Stillaguamish', '0',7710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stockbridge','1649-3','Stockbridge', '0',7720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','StonyRiver','1797-0','Stony River', '0',7730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Stonyford','1471-2','Stonyford', '0',7740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sugpiaq','2002-4','Sugpiaq', '0',7750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SulphurBank','1472-0','Sulphur Bank', '0',7760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','SummitLake','1434-0','Summit Lake', '0',7770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Suqpigaq','2004-0','Suqpigaq', '0',7780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Suquamish','1536-2','Suquamish', '0',7790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Susanville','1651-9','Susanville', '0',7800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Susquehanock','1245-0','Susquehanock', '0',7810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Swinomish','1537-0','Swinomish', '0',7820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Sycuan','1231-0','Sycuan', '0',7830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Syrian','2125-3','Syrian', '0',7840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TableBluff','1705-3','Table Bluff', '0',7850);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tachi','1719-4','Tachi', '0',7860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tahitian','2081-8','Tahitian', '0',7870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Taiwanese','2035-4','Taiwanese', '0',7880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Takelma','1063-7','Takelma', '0',7890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Takotna','1798-8','Takotna', '0',7900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Talakamish','1397-9','Talakamish', '0',7910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tanacross','1799-6','Tanacross', '0',7920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tanaina','1800-2','Tanaina', '0',7930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tanana','1801-0','Tanana', '0',7940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TananaChiefs','1802-8','Tanana Chiefs', '0',7950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Taos','1511-5','Taos', '0',7960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tatitlek','1969-5','Tatitlek', '0',7970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tazlina','1803-6','Tazlina', '0',7980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Telida','1804-4','Telida', '0',7990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Teller','1883-8','Teller', '0',8000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Temecula','1338-3','Temecula', '0',8010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Te-moakWesternShoshone','1596-6','Te-Moak Western Shoshone', '0',8020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TenakeeSprings','1832-5','Tenakee Springs', '0',8030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tenino','1398-7','Tenino', '0',8040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tesuque','1512-3','Tesuque', '0',8050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tetlin','1805-1','Tetlin', '0',8060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TetonSioux','1634-5','Teton Sioux', '0',8070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tewa','1513-1','Tewa', '0',8080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TexasKickapoo','1307-8','Texas Kickapoo', '0',8090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Thai','2046-1','Thai', '0',8100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Thlopthlocco','1204-7','Thlopthlocco', '0',8110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tigua','1514-9','Tigua', '0',8120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tillamook','1399-5','Tillamook', '0',8130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Timbi-shaShoshone','1597-4','Timbi-Sha Shoshone', '0',8140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tlingit','1833-3','Tlingit', '0',8150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tlingit-haida','1813-5','Tlingit-Haida', '0',8160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tobagoan','2073-5','Tobagoan', '0',8170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Togiak','1956-2','Togiak', '0',8180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TohonoOodham','1653-5',"Tohono O'Odham", '0',8190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tok','1806-9','Tok', '0',8200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tokelauan','2083-4','Tokelauan', '0',8210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Toksook','1957-0','Toksook', '0',8220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tolowa','1659-2','Tolowa', '0',8230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TonawandaSeneca','1293-0','Tonawanda Seneca', '0',8240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tongan','2082-6','Tongan', '0',8250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tonkawa','1661-8','Tonkawa', '0',8260);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Torres-martinez','1051-2','Torres-Martinez', '0',8270);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Trinidadian','2074-3','Trinidadian', '0',8280);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Trinity','1272-4','Trinity', '0',8290);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tsimshian','1837-4','Tsimshian', '0',8300);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tuckabachee','1205-4','Tuckabachee', '0',8310);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tulalip','1538-8','Tulalip', '0',8320);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TuleRiver','1720-2','Tule River', '0',8330);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tulukskak','1958-8','Tulukskak', '0',8340);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TunicaBiloxi','1246-8','Tunica Biloxi', '0',8350);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tuntutuliak','1959-6','Tuntutuliak', '0',8360);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tununak','1960-4','Tununak', '0',8370);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TurtleMountain','1147-8','Turtle Mountain', '0',8380);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tuscarora','1294-8','Tuscarora', '0',8390);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tuscola','1096-7','Tuscola', '0',8400);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Twenty-ninePalms','1337-5','Twenty-Nine Palms', '0',8410);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TwinHills','1961-2','Twin Hills', '0',8420);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','TwoKettleSioux','1635-2','Two Kettle Sioux', '0',8430);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tygh','1663-4','Tygh', '0',8440);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Tyonek','1807-7','Tyonek', '0',8450);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ugashik','1970-3','Ugashik', '0',8460);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UintahUte','1672-5','Uintah Ute', '0',8470);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Umatilla','1665-9','Umatilla', '0',8480);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Umkumiate','1964-6','Umkumiate', '0',8490);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Umpqua','1667-5','Umpqua', '0',8500);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Unalakleet','1884-6','Unalakleet', '0',8510);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Unalaska','2025-5','Unalaska', '0',8520);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UnanganAleut','2006-5','Unangan Aleut', '0',8530);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Unga','2026-3','Unga', '0',8540);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UnitedKetowahBandOfCheroke','1097-5','United Keetowah Band of Cherokee', '0',8550);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UpperChinook','1118-9','Upper Chinook', '0',8560);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UpperSioux','1636-0','Upper Sioux', '0',8570);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UpperSkagit','1539-6','Upper Skagit', '0',8580);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Ute','1670-9','Ute', '0',8590);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UteMountainUte','1673-3','Ute Mountain Ute', '0',8600);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','UtuUtuGwaituPaiute','1435-7','Utu Utu Gwaitu Paiute', '0',8610);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Venetie','1808-5','Venetie', '0',8620);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Vietnamese','2047-9','Vietnamese', '0',8630);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Waccamaw-siousan','1247-6','Waccamaw-Siousan', '0',8640);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WahpekuteSioux','1637-8','Wahpekute Sioux', '0',8650);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WahpetonSioux','1638-6','Wahpeton Sioux', '0',8660);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wailaki','1675-8','Wailaki', '0',8670);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wainwright','1885-3','Wainwright', '0',8680);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WakiakumChinook','1119-7','Wakiakum Chinook', '0',8690);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wales','1886-1','Wales', '0',8700);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WalkerRiver','1436-5','Walker River', '0',8710);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Walla-walla','1677-4','Walla-Walla', '0',8720);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wampanoag','1679-0','Wampanoag', '0',8730);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wappo','1064-5','Wappo', '0',8740);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WarmSprings','1683-2','Warm Springs', '0',8750);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wascopum','1685-7','Wascopum', '0',8760);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Washakie','1598-2','Washakie', '0',8770);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Washoe','1687-3','Washoe', '0',8780);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WazhazaSioux','1639-4','Wazhaza Sioux', '0',8790);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wenatchee','1400-1','Wenatchee', '0',8800);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WestIndian','2075-0','West Indian', '0',8810);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WesternCherokee','1098-3','Western Cherokee', '0',8820);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WesternChickahominy','1110-6','Western Chickahominy', '0',8830);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Whilkut','1273-2','Whilkut', '0',8840);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WhiteEarth','1148-6','White Earth', '0',8860);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WhiteMountain','1887-9','White Mountain', '0',8870);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WhiteMountainApache','1019-9','White Mountain Apache', '0',8880);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WhiteMountainInupiat','1888-7','White Mountain Inupiat', '0',8890);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wichita','1692-3','Wichita', '0',8900);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wicomico','1248-4','Wicomico', '0',8910);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WillapaChinook','1120-5','Willapa Chinook', '0',8920);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WindRiver','1694-9','Wind River', '0',8930);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WindRiverArapaho','1024-9','Wind River Arapaho', '0',8940);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WindRiverShoshone','1599-0','Wind River Shoshone', '0',8950);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Winnebago','1696-4','Winnebago', '0',8960);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Winnemucca','1700-4','Winnemucca', '0',8970);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wintun','1702-0','Wintun', '0',8980);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','WisconsinPotawatomi','1485-2','Wisconsin Potawatomi', '0',8990);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wiseman','1809-3','Wiseman', '0',9000);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wishram','1121-3','Wishram', '0',9010);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wiyot','1704-6','Wiyot', '0',9020);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wrangell','1834-1','Wrangell', '0',9030);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Wyandotte','1295-5','Wyandotte', '0',9040);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yahooskin','1401-9','Yahooskin', '0',9050);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yakama','1707-9','Yakama', '0',9060);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YakamaCowlitz','1709-5','Yakama Cowlitz', '0',9070);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yakutat','1835-8','Yakutat', '0',9080);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yana','1065-2','Yana', '0',9090);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YanktonSioux','1640-2','Yankton Sioux', '0',9100);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YanktonaiSioux','1641-0','Yanktonai Sioux', '0',9110);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yapese','2098-2','Yapese', '0',9120);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yaqui','1711-1','Yaqui', '0',9130);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yavapai','1731-9','Yavapai', '0',9140);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YavapaiApache','1715-2','Yavapai Apache', '0',9150);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YeringtonPaiute','1437-3','Yerington Paiute', '0',9160);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yokuts','1717-8','Yokuts', '0',9170);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yomba','1600-6','Yomba', '0',9180);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yuchi','1722-8','Yuchi', '0',9190);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yuki','1066-0','Yuki', '0',9200);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yuman','1724-4','Yuman', '0',9210);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','YupikEskimo','1896-0','Yupik Eskimo', '0',9220);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Yurok','1732-7','Yurok', '0',9230);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Zairean','2066-9','Zairean', '0',9240);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Zia','1515-6','Zia', '0',9250);
INSERT INTO listOptions (ListId,OptionId,Notes,Title,Activity,Seq) VALUES ('Race','Zuni','1516-4','Zuni', '0',9260);

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'Ethnicity','Ethnicity', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,OptionValue ) VALUES ('Ethnicity', 'DeclneToSpecfy', 'Declined To Specify', 0, 0, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Ethnicity', 'HispOrLatin', 'Hispanic or Latino', 10, 0, '2135-2');
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault,Notes ) VALUES ('Ethnicity', 'NotHispOrLatin', 'Not Hispanic or Latino', 10, 0, '2186-5');

INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('Lists'   ,'PaymentDate','Payment Date', 1,0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentDate', 'DateVal', 'Date', 10, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentDate', 'PostToDate', 'Post To Date', 20, 0);
INSERT INTO listOptions ( listId,OptionId,Title,Seq,IsDefault ) VALUES ('PaymentDate', 'DepositDate', 'Deposit Date', 30, 0);
-- --------------------------------------------------------

-- 
-- Table structure for table `ExtendedLog`
--

DROP TABLE IF EXISTS `ExtendedLog`;
CREATE TABLE `ExtendedLog` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` datetime default NULL,
  `Event` varchar(255) default NULL,
  `User` varchar(255) default NULL,
  `Recipient` varchar(255) default NULL,
  `Description` longtext,
  `PatientId` bigint(20) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `PatientId` (`PatientId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

CREATE TABLE version (
  vMajor    int(11)     NOT NULL DEFAULT 0,
  vMinor    int(11)     NOT NULL DEFAULT 0,
  vPatch    int(11)     NOT NULL DEFAULT 0,
  vRealpatch int(11)    NOT NULL DEFAULT 0,
  vTag      varchar(31) NOT NULL DEFAULT '',
  vDatabase int(11)     NOT NULL DEFAULT 0,
  vAcl      int(11)     NOT NULL DEFAULT 0
) ENGINE=InnoDB;
INSERT INTO version (VMajor,VMinor,VPatch,VRealpatch,VTag,VDatabase,VAcl) VALUES (0, 0, 0, 0, '', 0, 0);
-- --------------------------------------------------------

--
-- Table structure for table `Customlists`
--

CREATE TABLE `Customlists` (
  `ClListSlno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClListId` int(10) unsigned NOT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(ClListId)+1',
  `ClListItemId` int(10) unsigned DEFAULT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(ClListItemId)+1',
  `ClListType` int(10) unsigned NOT NULL COMMENT '0=>List Name 1=>list items 2=>Context 3=>Template 4=>Sentence 5=> SavedTemplate 6=>CustomButton',
  `ClListItemShort` varchar(10) DEFAULT NULL,
  `ClListItemLong` text,
  `ClListItemLevel` int(11) DEFAULT NULL COMMENT 'Flow level for List Designation',
  `ClOrder` int(11) DEFAULT NULL,
  `ClDeleted` tinyint(1) DEFAULT '0',
  `ClCreator` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClListSlno`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
INSERT INTO customlists(ClListId,clListType,clListItemLong) VALUES (1,2,'Subjective');
INSERT INTO customlists(ClListId,clListType,clListItemLong) VALUES (2,2,'Objective');
INSERT INTO customlists(ClListId,clListType,clListItemLong) VALUES (3,2,'Assessment');
INSERT INTO customlists(ClListId,clListType,clListItemLong) VALUES (4,2,'Plan');
-- --------------------------------------------------------

--
-- Table structure for table `TemplateUsers`
--

CREATE TABLE `TemplateUsers` (
  `TuId` int(11) NOT NULL AUTO_INCREMENT,
  `TuUserId` int(11) DEFAULT NULL,
  `TuFacilityId` int(11) DEFAULT NULL,
  `TuTemplateId` int(11) DEFAULT NULL,
  `TuTemplateOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`TuId`),
  UNIQUE KEY `Templateuser` (`TuUserId`,`TuTemplateId`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE `ProductWarehouse` (
  `PwDrugId`   int(11) NOT NULL,
  `PwWarehouse` varchar(31) NOT NULL,
  `PwMinLevel` float       DEFAULT 0,
  `PwMaxLevel` float       DEFAULT 0,
  PRIMARY KEY  (`PwDrugId`,`PwWarehouse`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `MiscAddressBook`
--

CREATE TABLE `MiscAddressBook` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(255) DEFAULT NULL,
  `Mname` varchar(255) DEFAULT NULL,
  `Lname` varchar(255) DEFAULT NULL,
  `Street` varchar(60) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `EsignSignatures`
--

CREATE TABLE `EsignSignatures` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tid` int(11) NOT NULL COMMENT 'Table row ID for signature',
  `Table` varchar(255) NOT NULL COMMENT 'Table name for the signature',
  `Uid` int(11) NOT NULL COMMENT 'User id for the signing user',
  `Datetime` datetime NOT NULL COMMENT 'Datetime of the signature action',
  `IsLock` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Sig,Lock or amendment',
  `Amendment` text COMMENT 'Amendment text,If any',
  `Hash` varchar(255) NOT NULL COMMENT 'Hash of signed data',
  `SignatureHash` varchar(255) NOT NULL COMMENT 'Hash of signature itself',
  PRIMARY KEY (`Id`),
  KEY `Tid` (`Tid`),
  KEY `Table` (`Table`)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;

-- 
-- Table structure for table `LogCommentEncrypt`
-- 

DROP TABLE IF EXISTS `LogCommentEncrypt`;
CREATE TABLE IF NOT EXISTS `LogCommentEncrypt` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LogId` int(11) NOT NULL,
  `Encrypt` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Checksum` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

CREATE TABLE `SharedAttributes` (
  `Pid`          bigint(20)   NOT NULL,
  `Encounter`    bigint(20)   NOT NULL COMMENT '0 if patient attribute,Else encounter attribute',
  `FieldId`     varchar(31)  NOT NULL COMMENT 'References layoutOptions.fieldId',
  `LastUpdate`  datetime     NOT NULL COMMENT 'Time of last update',
  `UserId`      bigint(20)   NOT NULL COMMENT 'User who last updated',
  `FieldValue`  TEXT,
  PRIMARY KEY (`Pid`, `Encounter`, `FieldId`)
);

-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `CcdaComponents`
--
CREATE TABLE ccdaComponents (
  ccdaComponentsId int(11) NOT NULL AUTO_INCREMENT,
  ccdaComponentsField varchar(100) DEFAULT NULL,
  ccdaComponentsName varchar(100) DEFAULT NULL,
  ccdaType int(11) NOT NULL COMMENT '0=>sections,1=>components',
  PRIMARY KEY (CcdaComponentsId)
) ENGINE=InnoDB AUTO_INCREMENT=23 ;
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('1','ProgressNote','Progress Notes',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('2','ConsultationNote','Consultation Note',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('3','ContinuityCareDocument','Continuity Care Document',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('4','DiagnosticImageReporting','Diagnostic Image Reporting',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('5','DischargeSummary','Discharge Summary',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('6','HistoryPhysicalNote','History and Physical Note',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('7','OperativeNote','Operative Note',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('8','ProcedureNote','Procedure Note',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('9','UnstructuredDocument','Unstructured Document',0);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('10','Allergies','Allergies',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('11','Medications','Medications',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('12','Problems','Problems',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('13','Immunizations','Immunizations',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('14','Procedures','Procedures',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('15','Results','Results',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('16','PlanOfCare','Plan Of Care',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('17','Vitals','Vitals',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('18','SocialHistory','Social History',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('19','Encounters','Encounters',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('20','FunctionalStatus','Functional Status',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('21','Referral','Reason for Referral',1);
insert into ccdaComponents (CcdaComponentsId,CcdaComponentsField,CcdaComponentsName,CcdaType) values ('22','Instructions','Instructions',1);
-- --------------------------------------------------------


-- --------------------------------------------------------
--
-- Table structure for table `CcdaSections`
--
CREATE TABLE ccdaSections (
  ccdaSectionsId int(11) NOT NULL AUTO_INCREMENT,
  ccdaComponentsId int(11) DEFAULT NULL,
  ccdaSectionsField varchar(100) DEFAULT NULL,
  ccdaSectionsName varchar(100) DEFAULT NULL,
  ccdaSectionsReqMapping tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (CcdaSectionsId)
) ENGINE=InnoDB AUTO_INCREMENT=46 ;
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('1','1','AssessmentPlan','Assessment and Plan','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('2','2','AssessmentPlan','Assessment and Plan','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('3','2','HistoryOfPresentIllness','History of Present Illness','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('4','2','PhysicalExam','Physical Exam','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('5','2','ReasonOfVisit','Reason for Referral/Reason for Visit','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('6','3','Allergies','Allergies','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('7','3','Medications','Medications','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('8','3','ProblemList','Problem List','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('9','3','Procedures','Procedures','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('10','3','Results','Results','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('11','4','Report','Report','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('12','5','Allergies','Allergies','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('13','5','HospitalCourse','Hospital Course','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('14','5','HospitalDischargeDiagnosis','Hospital Discharge Diagnosis','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('15','5','HospitalDischargeMedications','Hospital Discharge Medications','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('16','5','PlanOfCare','Plan of Care','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('17','6','Allergies','Allergies','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('19','6','ChiefComplaint','Chief Complaint / Reason for Visit','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('21','6','FamilyHistory','Family History','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('22','6','GeneralStatus','General Status','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('23','6','HpiPastMed','History of Past Illness (Past Medical History)','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('24','6','Hpi','History of Present Illness','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('25','6','Medications','Medications','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('26','6','PhysicalExam','Physical Exam','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('28','6','Results','Results','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('29','6','ReviewOfSystems','Review of Systems','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('30','6','SocialHistory','Social History','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('31','6','VitalSigns','Vital Signs','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('32','7','Anesthesia','Anesthesia','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('33','7','Complications','Complications','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('34','7','PostOperativeDiagnosis','Post Operative Diagnosis','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('35','7','PreOperativeDiagnosis','Pre Operative Diagnosis','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('36','7','ProcedureEstimatedBloodLoss','Procedure Estimated Blood Loss','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('37','7','ProcedureFindings','Procedure Findings','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('38','7','ProcedureSpecimensTaken','Procedure Specimens Taken','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('39','7','ProcedureDescription','Procedure Description','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('40','8','AssessmentPlan','Assessment and Plan','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('41','8','Complications','Complications','1');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('42','8','PostprocedureDiagnosis','Postprocedure Diagnosis','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('43','8','ProcedureDescription','Procedure Description','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('44','8','ProcedureIndications','Procedure Indications','0');
insert into ccdaSections (CcdaSectionsId,CcdaComponentsId,CcdaSectionsField,CcdaSectionsName,CcdaSectionsReqMapping) values('45','9','UnstructuredDoc','Document','0');
-- --------------------------------------------------------


-- --------------------------------------------------------
--
-- Table structure for table `CcdaFieldMapping`
--
CREATE TABLE ccdaFieldMapping (
  id int(11) NOT NULL AUTO_INCREMENT,
  tableId int(11) DEFAULT NULL,
  ccdaField varchar(100) DEFAULT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;
-- --------------------------------------------------------


-- --------------------------------------------------------
--
-- Table structure for table `Ccda`
--
CREATE TABLE ccda (
  id INT(11) NOT NULL AUTO_INCREMENT,
  pid BIGINT(20) DEFAULT NULL,
  encounter BIGINT(20) DEFAULT NULL,
  ccdaData MEDIUMTEXT,
  time VARCHAR(50) DEFAULT NULL,
  status SMALLINT(6) DEFAULT NULL,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  userId VARCHAR(50) null,
  couchDocid VARCHAR(100) NULL,
  couchRevid VARCHAR(100) NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Transfer` tinyint(4) NOT NULL DEFAULT '0',
  `EmrTransfer` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (Id),
  UNIQUE KEY uniqueKey (Pid,encounter,time)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;
-- --------------------------------------------------------


-- --------------------------------------------------------
--
-- Table structure for table `CcdaTableMapping`
--
CREATE TABLE ccdaTableMapping (
  id int(11) NOT NULL AUTO_INCREMENT,
  ccdaComponent varchar(100) DEFAULT NULL,
  ccdaComponentSection varchar(100) DEFAULT NULL,
  formDir varchar(100) DEFAULT NULL,
  formType smallint(6) DEFAULT NULL,
  formTable varchar(100) DEFAULT NULL,
  userId int(11) DEFAULT NULL,
  deleted tinyint(4) NOT NULL DEFAULT '0',
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
) ENGINE=InnoDB AUTO_INCREMENT=1 ;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `ExternalProcedures`
--
CREATE TABLE `ExternalProcedures` (
  `EpId` int(11) NOT NULL AUTO_INCREMENT,
  `EpDate` date DEFAULT NULL,
  `EpCodeType` varchar(20) DEFAULT NULL,
  `EpCode` varchar(9) DEFAULT NULL,
  `EpPid` int(11) DEFAULT NULL,
  `EpEncounter` int(11) DEFAULT NULL,
  `EpCodeText` longtext,
  `EpFacilityId` varchar(255) DEFAULT NULL,
  `EpExternalId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EpId`)
) ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `ExternalEncounters`
--
CREATE TABLE `ExternalEncounters` (
  `EeId` int(11) NOT NULL AUTO_INCREMENT,
  `EeDate` date DEFAULT NULL,
  `EePid` int(11) DEFAULT NULL,
  `EeProviderId` varchar(255) DEFAULT NULL,
  `EeFacilityId` varchar(255) DEFAULT NULL,
  `EeEncounterDiagnosis` varchar(255) DEFAULT NULL,
  `EeExternalId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EeId`)
) ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `FormCarePlan`
--
CREATE TABLE `FormCarePlan` (
  `Id` bigint(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `Pid` bigint(20) DEFAULT NULL,
  `Encounter` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Groupname` varchar(255) DEFAULT NULL,
  `Authorized` tinyint(4) DEFAULT NULL,
  `Activity` tinyint(4) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Codetext` text,
  `Description` text,
  `ExternalId` varchar(30) DEFAULT NULL
) ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `FormFunctionalCognitiveStatus`
--
CREATE TABLE `FormFunctionalCognitiveStatus` (
  `Id` bigint(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `Pid` bigint(20) DEFAULT NULL,
  `Encounter` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Groupname` varchar(255) DEFAULT NULL,
  `Authorized` tinyint(4) DEFAULT NULL,
  `Activity` tinyint(4) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Codetext` text,
  `Description` text,
  `ExternalId` varchar(30) DEFAULT NULL
) ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `FormObservation`
--
CREATE TABLE `FormObservation` (
  `Id` bigint(20) NOT NULL,
  `Date` DATE DEFAULT NULL,
  `Pid` bigint(20) DEFAULT NULL,
  `Encounter` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Groupname` varchar(255) DEFAULT NULL,
  `Authorized` tinyint(4) DEFAULT NULL,
  `Activity` tinyint(4) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `ObValue` varchar(255),
  `ObUnit` varchar(255),
  `Description` varchar(255),
  `CodeType` varchar(255),
  `TableCode` varchar(255)
) ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table `FormClinicalInstructions`
--
CREATE TABLE `FormClinicalInstructions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pid` bigint(20) DEFAULT NULL,
  `Encounter` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Instruction` text,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Activity` TINYINT DEFAULT 1 NULL,
  PRIMARY KEY (`Id`)
)ENGINE=InnoDB;
-- --------------------------------------------------------

-- --------------------------------------------------------
--
-- Table structure for table 'Valueset'
--
CREATE TABLE `Valueset` (
  `NqfCode` varchar(255) NOT NULL DEFAULT '',
  `Code` varchar(255) NOT NULL DEFAULT '',
  `CodeSystem` varchar(255) NOT NULL DEFAULT '',
  `CodeType` varchar(255) DEFAULT NULL,
  `Valueset` varchar(255) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `ValuesetName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`NqfCode`,`Code`,`Valueset`)
) ENGINE=InnoDB;

----------------------------------------------------------
-- Table structure for table `ImmunizationObservation`
--
CREATE TABLE `ImmunizationObservation` (
  `ImoId` int(11) NOT NULL AUTO_INCREMENT,
  `ImoImId` int(11) NOT NULL,
  `ImoPid` int(11) DEFAULT NULL,
  `ImoCriteria` varchar(255) DEFAULT NULL,
  `ImoCriteriaValue` varchar(255) DEFAULT NULL,
  `ImoUser` int(11) DEFAULT NULL,
  `ImoCode` varchar(255) DEFAULT NULL,
  `ImoCodetext` varchar(255) DEFAULT NULL,
  `ImoCodetype` varchar(255) DEFAULT NULL,
  `ImoVisDatePublished` date DEFAULT NULL,
  `ImoVisDatePresented` date DEFAULT NULL,
  `ImoDateObservation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ImoId`)
) ENGINE=InnoDB;
-- --------------------------------------------------------


