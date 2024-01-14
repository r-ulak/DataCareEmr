USE [transfer]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Gs__72F0F4D3]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Pe__71FCD09A]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Gs__7108AC61]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__70148828]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6F2063EF]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6E2C3FB6]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6D381B7D]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6C43F744]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6B4FD30B]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__6A5BAED2]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Is__69678A99]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__Proce__68736660]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Ve__677F4227]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Re__668B1DEE]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__X12Se__6596F9B5]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partne__IdNum__64A2D57C]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partner__Name__63AEB143]
GO
ALTER TABLE [dbo].[X12Partners] DROP CONSTRAINT [DF__X12Partners__Id__62BA8D0A]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__ssma$ro__60D24498]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vAcl__5FDE205F]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vDataba__5EE9FC26]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vTag__5DF5D7ED]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vRealpa__5D01B3B4]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vPatch__5C0D8F7B]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vMinor__5B196B42]
GO
ALTER TABLE [dbo].[version] DROP CONSTRAINT [DF__version__vMajor__5A254709]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__Values__583CFE97]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__Descri__5748DA5E]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__Values__5654B625]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__CodeTy__556091EC]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__CodeSy__546C6DB3]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__Code__5378497A]
GO
ALTER TABLE [dbo].[Valueset] DROP CONSTRAINT [DF__Valueset__NqfCod__52842541]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__SaltH__509BDCCF]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__Passw__4FA7B896]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__SaltH__4EB3945D]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__Passw__4DBF7024]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__LastU__4CCB4BEB]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecur__Salt__4BD727B2]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__Passw__4AE30379]
GO
ALTER TABLE [dbo].[UsersSecure] DROP CONSTRAINT [DF__UsersSecu__Usern__49EEDF40]
GO
ALTER TABLE [dbo].[UserSettings] DROP CONSTRAINT [DF__UserSetti__Setti__47127295]
GO
ALTER TABLE [dbo].[UserSettings] DROP CONSTRAINT [DF__UserSetti__Setti__461E4E5C]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Physician__443605EA]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Cpoe__4341E1B1]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__NewcropUs__424DBD78]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__StateLice__4159993F]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Irnpool__40657506]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__DefaultWa__3F7150CD]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__PwdExpira__3E7D2C94]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__AbookType__3D89085B]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Calendar__3C94E422]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__SsiRelayh__3BA0BFE9]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Taxonomy__3AAC9BB0]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__CalUi__39B87777]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Phonecell__38C4533E]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Phonew2__37D02F05]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Phonew1__36DC0ACC]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Fax__35E7E693]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Phone__34F3C25A]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Zip2__33FF9E21]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__State2__330B79E8]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__City2__321755AF]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Streetb2__31233176]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Street2__302F0D3D]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Zip__2F3AE904]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__State__2E46C4CB]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__City__2D52A092]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Streetb__2C5E7C59]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Street__2B6A5820]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Valedicto__2A7633E7]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Organizat__29820FAE]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Assistant__288DEB75]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Url__2799C73C]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__EmailDire__26A5A303]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Email__25B17ECA]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Billname__24BD5A91]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Specialty__23C93658]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Title__22D5121F]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Npi__21E0EDE6]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Active__20ECC9AD]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__SeeAuth__1FF8A574]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__FacilityI__1F04813B]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Facility__1E105D02]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Upin__1D1C38C9]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Federaldr__1C281490]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Federalta__1B33F057]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Lname__1A3FCC1E]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Mname__194BA7E5]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Fname__185783AC]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Source__17635F73]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Authorize__166F3B3A]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF__Users__Username__157B1701]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transacti__Autho__1392CE8F]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transacti__Group__129EAA56]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transactio__User__11AA861D]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transaction__Pid__10B661E4]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transacti__Title__0FC23DAB]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [DF__Transactio__Date__0ECE1972]
GO
ALTER TABLE [dbo].[TemplateUsers] DROP CONSTRAINT [DF__TemplateU__TuTem__0CE5D100]
GO
ALTER TABLE [dbo].[TemplateUsers] DROP CONSTRAINT [DF__TemplateU__TuTem__0BF1ACC7]
GO
ALTER TABLE [dbo].[TemplateUsers] DROP CONSTRAINT [DF__TemplateU__TuFac__0AFD888E]
GO
ALTER TABLE [dbo].[TemplateUsers] DROP CONSTRAINT [DF__TemplateU__TuUse__0A096455]
GO
ALTER TABLE [dbo].[SyndromicSurveillance] DROP CONSTRAINT [DF__Syndromic__Filen__08211BE3]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] DROP CONSTRAINT [DF__Supported__LoadC__0638D371]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] DROP CONSTRAINT [DF__Supported__LoadF__0544AF38]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] DROP CONSTRAINT [DF__Supported__LoadS__04508AFF]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] DROP CONSTRAINT [DF__Supported__LoadT__035C66C6]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] DROP CONSTRAINT [DF__Standardi__FileC__01741E54]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] DROP CONSTRAINT [DF__Standardi__Revis__007FFA1B]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] DROP CONSTRAINT [DF__Standardi__Revis__7F8BD5E2]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] DROP CONSTRAINT [DF__Standardiz__Name__7E97B1A9]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] DROP CONSTRAINT [DF__Standardi__Impor__7DA38D70]
GO
ALTER TABLE [dbo].[Sequences] DROP CONSTRAINT [DF__Sequences__ssma$__7AC720C5]
GO
ALTER TABLE [dbo].[Sequences] DROP CONSTRAINT [DF__Sequences__Id__79D2FC8C]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__ssma$__77EAB41A]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Inter__76F68FE1]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Value__76026BA8]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Metho__750E476F]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Requi__741A2336]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Inclu__7325FEFD]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarge__Group__7231DAC4]
GO
ALTER TABLE [dbo].[RuleTarget] DROP CONSTRAINT [DF__RuleTarget__Id__713DB68B]
GO
ALTER TABLE [dbo].[RuleReminder] DROP CONSTRAINT [DF__RuleRemin__ssma$__6F556E19]
GO
ALTER TABLE [dbo].[RuleReminder] DROP CONSTRAINT [DF__RuleRemin__Value__6E6149E0]
GO
ALTER TABLE [dbo].[RuleReminder] DROP CONSTRAINT [DF__RuleRemin__Metho__6D6D25A7]
GO
ALTER TABLE [dbo].[RuleReminder] DROP CONSTRAINT [DF__RuleRemin__Metho__6C79016E]
GO
ALTER TABLE [dbo].[RuleReminder] DROP CONSTRAINT [DF__RuleReminder__Id__6B84DD35]
GO
ALTER TABLE [dbo].[RulePatientData] DROP CONSTRAINT [DF__RulePatie__Resul__699C94C3]
GO
ALTER TABLE [dbo].[RulePatientData] DROP CONSTRAINT [DF__RulePatie__Compl__68A8708A]
GO
ALTER TABLE [dbo].[RulePatientData] DROP CONSTRAINT [DF__RulePatien__Item__67B44C51]
GO
ALTER TABLE [dbo].[RulePatientData] DROP CONSTRAINT [DF__RulePatie__Categ__66C02818]
GO
ALTER TABLE [dbo].[RulePatientData] DROP CONSTRAINT [DF__RulePatien__Date__65CC03DF]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__ssma$__63E3BB6D]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__Value__62EF9734]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__Metho__61FB72FB]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__Metho__61074EC2]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__Requi__60132A89]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilte__Inclu__5F1F0650]
GO
ALTER TABLE [dbo].[RuleFilter] DROP CONSTRAINT [DF__RuleFilter__Id__5E2AE217]
GO
ALTER TABLE [dbo].[RuleActionItem] DROP CONSTRAINT [DF__RuleActio__Custo__5C4299A5]
GO
ALTER TABLE [dbo].[RuleActionItem] DROP CONSTRAINT [DF__RuleActio__ClinR__5B4E756C]
GO
ALTER TABLE [dbo].[RuleActionItem] DROP CONSTRAINT [DF__RuleAction__Item__5A5A5133]
GO
ALTER TABLE [dbo].[RuleActionItem] DROP CONSTRAINT [DF__RuleActio__Categ__59662CFA]
GO
ALTER TABLE [dbo].[RuleAction] DROP CONSTRAINT [DF__RuleActio__ssma$__577DE488]
GO
ALTER TABLE [dbo].[RuleAction] DROP CONSTRAINT [DF__RuleAction__Item__5689C04F]
GO
ALTER TABLE [dbo].[RuleAction] DROP CONSTRAINT [DF__RuleActio__Categ__55959C16]
GO
ALTER TABLE [dbo].[RuleAction] DROP CONSTRAINT [DF__RuleActio__Group__54A177DD]
GO
ALTER TABLE [dbo].[RuleAction] DROP CONSTRAINT [DF__RuleAction__Id__53AD53A4]
GO
ALTER TABLE [dbo].[ReportResults] DROP CONSTRAINT [DF__ReportRes__Field__51C50B32]
GO
ALTER TABLE [dbo].[ReportItemized] DROP CONSTRAINT [DF__ReportIte__ssma$__4FDCC2C0]
GO
ALTER TABLE [dbo].[ReportItemized] DROP CONSTRAINT [DF__ReportItem__Pass__4EE89E87]
GO
ALTER TABLE [dbo].[ReportItemized] DROP CONSTRAINT [DF__ReportIte__Numer__4DF47A4E]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Nickna__4C0C31DC]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Catego__4B180DA3]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Priori__4A23E96A]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Date__492FC531]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Unpack__483BA0F8]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__SqlRun__47477CBF]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Direct__46535886]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__State__455F344D]
GO
ALTER TABLE [dbo].[Registry] DROP CONSTRAINT [DF__Registry__Name__446B1014]
GO
ALTER TABLE [dbo].[ProductWarehouse] DROP CONSTRAINT [DF__ProductWa__PwMax__4282C7A2]
GO
ALTER TABLE [dbo].[ProductWarehouse] DROP CONSTRAINT [DF__ProductWa__PwMin__418EA369]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Notes__3FA65AF7]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Activ__3EB236BE]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__ProcedureTy__Seq__3DBE1285]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Range__3CC9EE4C]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Units__3BD5CA13]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Relat__3AE1A5DA]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Stand__39ED81A1]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Descr__38F95D68]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Later__3805392F]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Route__371114F6]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Speci__361CF0BD]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__BodyS__3528CC84]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Proce__3434A84B]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Proce__33408412]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__LabId__324C5FD9]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__ProcedureT__Name__31583BA0]
GO
ALTER TABLE [dbo].[ProcedureType] DROP CONSTRAINT [DF__Procedure__Paren__30641767]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Resul__2E7BCEF5]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Docum__2D87AABC]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Abnor__2C938683]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Range__2B9F624A]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Resul__2AAB3E11]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Units__29B719D8]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Facil__28C2F59F]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__ProcedureR__Date__27CED166]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Resul__26DAAD2D]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Resul__25E688F4]
GO
ALTER TABLE [dbo].[ProcedureResult] DROP CONSTRAINT [DF__Procedure__Resul__24F264BB]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Revie__230A1C49]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Repor__2215F810]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Speci__2121D3D7]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Sourc__202DAF9E]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__DateR__1F398B65]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__DateR__1E45672C]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__DateC__1D5142F3]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__DateC__1C5D1EBA]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Proce__1B68FA81]
GO
ALTER TABLE [dbo].[ProcedureReport] DROP CONSTRAINT [DF__Procedure__Proce__1A74D648]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Activ__188C8DD6]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__ProcedureQ__Tips__1798699D]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Fldty__16A44564]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Maxsi__15B0212B]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Requi__14BBFCF2]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Quest__13C7D8B9]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__ProcedureQu__Seq__12D3B480]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Quest__11DF9047]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__Proce__10EB6C0E]
GO
ALTER TABLE [dbo].[ProcedureQuestions] DROP CONSTRAINT [DF__Procedure__LabId__0FF747D5]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__LabDi__0E0EFF63]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Resul__0D1ADB2A]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Order__0C26B6F1]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Passw__0B3292B8]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Login__0A3E6E7F]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Remot__094A4A46]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Proto__0856260D]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__Direc__076201D4]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__ProcedureP__DorP__066DDD9B]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__RecvF__0579B962]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__RecvA__04859529]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__SendF__039170F0]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__Procedure__SendA__029D4CB7]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__ProcedurePr__Npi__01A9287E]
GO
ALTER TABLE [dbo].[ProcedureProviders] DROP CONSTRAINT [DF__ProcedureP__Name__00B50445]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] DROP CONSTRAINT [DF__Procedure__Proce__7ECCBBD3]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] DROP CONSTRAINT [DF__Procedure__DoNot__7DD8979A]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] DROP CONSTRAINT [DF__Procedure__Proce__7CE47361]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] DROP CONSTRAINT [DF__Procedure__Proce__7BF04F28]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] DROP CONSTRAINT [DF__Procedure__Proce__7AFC2AEF]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Exter__7913E27D]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Clini__781FBE44]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__DateT__772B9A0B]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Speci__763775D2]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Speci__75435199]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Speci__744F2D60]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__LabId__735B0927]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Contr__7266E4EE]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Activ__7172C0B5]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Order__707E9C7C]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Order__6F8A7843]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__DateO__6E96540A]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__DateC__6DA22FD1]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Encou__6CAE0B98]
GO
ALTER TABLE [dbo].[ProcedureOrder] DROP CONSTRAINT [DF__Procedure__Provi__6BB9E75F]
GO
ALTER TABLE [dbo].[ProcedureAnswers] DROP CONSTRAINT [DF__Procedure__Answe__69D19EED]
GO
ALTER TABLE [dbo].[ProcedureAnswers] DROP CONSTRAINT [DF__Procedure__Quest__68DD7AB4]
GO
ALTER TABLE [dbo].[ProcedureAnswers] DROP CONSTRAINT [DF__Procedure__Proce__67E9567B]
GO
ALTER TABLE [dbo].[ProcedureAnswers] DROP CONSTRAINT [DF__Procedure__Proce__66F53242]
GO
ALTER TABLE [dbo].[Prices] DROP CONSTRAINT [DF__Prices__PrPrice__650CE9D0]
GO
ALTER TABLE [dbo].[Prices] DROP CONSTRAINT [DF__Prices__PrLevel__6418C597]
GO
ALTER TABLE [dbo].[Prices] DROP CONSTRAINT [DF__Prices__PrSelect__6324A15E]
GO
ALTER TABLE [dbo].[Prices] DROP CONSTRAINT [DF__Prices__PrId__62307D25]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescriptio__Prn__604834B3]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__EndDa__5F54107A]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Exter__5E5FEC41]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__ErxUp__5D6BC808]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__ErxSo__5C77A3CF]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Presc__5B837F96]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__Site__5A8F5B5D]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__User__599B3724]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Datet__58A712EB]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Activ__57B2EEB2]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Medic__56BECA79]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Fille__55CAA640]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__PerRe__54D68207]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Refil__53E25DCE]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Subst__52EE3995]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Inter__51FA155C]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Route__5105F123]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__Unit__5011CCEA]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__Size__4F1DA8B1]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Quant__4E298478]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Dosag__4D35603F]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__Form__4C413C06]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Rxnor__4B4D17CD]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__DrugI__4A58F394]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescripti__Drug__4964CF5B]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Start__4870AB22]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Encou__477C86E9]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Provi__468862B0]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__DateM__45943E77]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__DateA__44A01A3E]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Pharm__43ABF605]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Fille__42B7D1CC]
GO
ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [DF__Prescript__Patie__41C3AD93]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__IsMsgEnc__3FDB6521]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__PortalRe__3EE740E8]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__MessageS__3DF31CAF]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Deleted__3CFEF876]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Assigned__3C0AD43D]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Title__3B16B004]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Authoriz__3A228BCB]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Activity__392E6792]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Groupnam__383A4359]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__User__37461F20]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Pid__3651FAE7]
GO
ALTER TABLE [dbo].[Pnotes] DROP CONSTRAINT [DF__Pnotes__Date__355DD6AE]
GO
ALTER TABLE [dbo].[PmaTableInfo] DROP CONSTRAINT [DF__PmaTableI__Displ__33758E3C]
GO
ALTER TABLE [dbo].[PmaTableInfo] DROP CONSTRAINT [DF__PmaTableI__Table__32816A03]
GO
ALTER TABLE [dbo].[PmaTableInfo] DROP CONSTRAINT [DF__PmaTableI__DbNam__318D45CA]
GO
ALTER TABLE [dbo].[PmaTableCoords] DROP CONSTRAINT [DF__PmaTableCoord__Y__2FA4FD58]
GO
ALTER TABLE [dbo].[PmaTableCoords] DROP CONSTRAINT [DF__PmaTableCoord__X__2EB0D91F]
GO
ALTER TABLE [dbo].[PmaTableCoords] DROP CONSTRAINT [DF__PmaTableC__PdfPa__2DBCB4E6]
GO
ALTER TABLE [dbo].[PmaTableCoords] DROP CONSTRAINT [DF__PmaTableC__Table__2CC890AD]
GO
ALTER TABLE [dbo].[PmaTableCoords] DROP CONSTRAINT [DF__PmaTableC__DbNam__2BD46C74]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Forei__29EC2402]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Forei__28F7FFC9]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Forei__2803DB90]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Maste__270FB757]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Maste__261B931E]
GO
ALTER TABLE [dbo].[PmaRelation] DROP CONSTRAINT [DF__PmaRelati__Maste__25276EE5]
GO
ALTER TABLE [dbo].[PmaPdfPages] DROP CONSTRAINT [DF__PmaPdfPag__PageD__233F2673]
GO
ALTER TABLE [dbo].[PmaPdfPages] DROP CONSTRAINT [DF__PmaPdfPag__DbNam__224B023A]
GO
ALTER TABLE [dbo].[PmaHistory] DROP CONSTRAINT [DF__PmaHistor__Timev__2062B9C8]
GO
ALTER TABLE [dbo].[PmaHistory] DROP CONSTRAINT [DF__PmaHistor__Table__1F6E958F]
GO
ALTER TABLE [dbo].[PmaHistory] DROP CONSTRAINT [DF__PmaHistory__Db__1E7A7156]
GO
ALTER TABLE [dbo].[PmaHistory] DROP CONSTRAINT [DF__PmaHistor__Usern__1D864D1D]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Trans__1B9E04AB]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Trans__1AA9E072]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Mimet__19B5BC39]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Comme__18C19800]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Colum__17CD73C7]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__Table__16D94F8E]
GO
ALTER TABLE [dbo].[PmaColumnInfo] DROP CONSTRAINT [DF__PmaColumn__DbNam__15E52B55]
GO
ALTER TABLE [dbo].[PmaBookmark] DROP CONSTRAINT [DF__PmaBookma__Label__13FCE2E3]
GO
ALTER TABLE [dbo].[PmaBookmark] DROP CONSTRAINT [DF__PmaBookmar__User__1308BEAA]
GO
ALTER TABLE [dbo].[PmaBookmark] DROP CONSTRAINT [DF__PmaBookma__Dbase__12149A71]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumb__Forei__102C51FF]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumbe__Type__0F382DC6]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumb__Numbe__0E44098D]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumb__Prefi__0D4FE554]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumb__AreaC__0C5BC11B]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumb__Count__0B679CE2]
GO
ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [DF__PhoneNumbers__Id__0A7378A9]
GO
ALTER TABLE [dbo].[Pharmacies] DROP CONSTRAINT [DF__Pharmacie__Email__088B3037]
GO
ALTER TABLE [dbo].[Pharmacies] DROP CONSTRAINT [DF__Pharmacie__Trans__07970BFE]
GO
ALTER TABLE [dbo].[Pharmacies] DROP CONSTRAINT [DF__Pharmacies__Name__06A2E7C5]
GO
ALTER TABLE [dbo].[Pharmacies] DROP CONSTRAINT [DF__Pharmacies__Id__05AEC38C]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Posted__03C67B1A]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Posted__02D256E1]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Amount__01DE32A8]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Amount__00EA0E6F]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Source__7FF5EA36]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Method__7F01C5FD]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__User__7E0DA1C4]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Encoun__7D197D8B]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [DF__Payments__Pid__7C255952]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] DROP CONSTRAINT [DF__PaymentGate__Md5__7A3D10E0]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] DROP CONSTRAINT [DF__PaymentGa__Trans__7948ECA7]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] DROP CONSTRAINT [DF__PaymentGa__Login__7854C86E]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] DROP CONSTRAINT [DF__PaymentGa__Servi__7760A435]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTr__ssma$__75785BC3]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTra__User__7484378A]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTrac__Seq__73901351]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTr__Statu__729BEF18]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTra__Room__71A7CADF]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTr__Start__70B3A6A6]
GO
ALTER TABLE [dbo].[PatientTrackerElement] DROP CONSTRAINT [DF__PatientTr__PtTra__6FBF826D]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__DrugS__6DD739FB]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Rando__6CE315C2]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Lasts__6BEEF189]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Encou__6AFACD50]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Origi__6A06A917]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTrac__Pid__691284DE]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTrac__Eid__681E60A5]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Apptt__672A3C6C]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTr__Apptd__66361833]
GO
ALTER TABLE [dbo].[PatientTracker] DROP CONSTRAINT [DF__PatientTra__Date__6541F3FA]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__MailS__6359AB88]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__Email__6265874F]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__SmsSt__61716316]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__Voice__607D3EDD]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__DateS__5F891AA4]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__DateC__5E94F66B]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRem__Item__5DA0D232]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__Categ__5CACADF9]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__DueSt__5BB889C0]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__Reaso__5AC46587]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__DateI__59D0414E]
GO
ALTER TABLE [dbo].[PatientReminders] DROP CONSTRAINT [DF__PatientRe__Activ__58DC1D15]
GO
ALTER TABLE [dbo].[PatientPortalMenu] DROP CONSTRAINT [DF__PatientPo__MenuS__56F3D4A3]
GO
ALTER TABLE [dbo].[PatientPortalMenu] DROP CONSTRAINT [DF__PatientPo__MenuO__55FFB06A]
GO
ALTER TABLE [dbo].[PatientPortalMenu] DROP CONSTRAINT [DF__PatientPo__MenuN__550B8C31]
GO
ALTER TABLE [dbo].[PatientPortalMenu] DROP CONSTRAINT [DF__PatientPo__Patie__541767F8]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Count__4F089A18]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__CareT__4E1475DF]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Cmspo__4D2051A6]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__SoapI__4C2C2D6D]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Decea__4B380934]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Decea__4A43E4FB]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Allow__494FC0C2]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Allow__485B9C89]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Allow__47677850]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Allow__46735417]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Mothe__457F2FDE]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientData__Vfc__448B0BA5]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__AdRev__4396E76C]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Compl__42A2C333]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Contr__41AE9EFA]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Regda__40BA7AC1]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Price__3FC65688]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Refer__3ED2324F]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Fitne__3DDE0E16]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Squad__3CE9E9DD]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__3BF5C5A4]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__3B01A16B]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__3A0D7D32]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__391958F9]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__382534C0]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Hipaa__37311087]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Gener__363CEC4E]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Gener__3548C815]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Gener__3454A3DC]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Gener__33607FA3]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientData__Pid__326C5B6A]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Pubpi__31783731]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Finan__308412F8]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Homel__2F8FEEBF]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Month__2E9BCA86]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Famil__2DA7A64D]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Migra__2CB38214]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Inter__2BBF5DDB]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Relig__2ACB39A2]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Ethni__29D71569]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDat__Race__28E2F130]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Ethno__27EECCF7]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Email__26FAA8BE]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Email__26068485]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__RefPr__2512604C]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Provi__241E3C13]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Refer__232A17DA]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Refer__2235F3A1]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientData__Sex__2141CF68]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDat__Date__204DAB2F]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Conta__1F5986F6]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Statu__1E6562BD]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Pharm__1D713E84]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Phone__1C7D1A4B]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Phone__1B88F612]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Phone__1A94D1D9]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Phone__19A0ADA0]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientData__Ss__18AC8967]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Drive__17B8652E]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Count__16C440F5]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__State__15D01CBC]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDat__City__14DBF883]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Posta__13E7D44A]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Stree__12F3B011]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientData__DOB__11FF8BD8]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Mname__110B679F]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Lname__10174366]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Fname__0F231F2D]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Finan__0E2EFAF4]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Langu__0D3AD6BB]
GO
ALTER TABLE [dbo].[PatientData] DROP CONSTRAINT [DF__PatientDa__Title__0C46B282]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] DROP CONSTRAINT [DF__PatientAc__Porta__0D84EF7E]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] DROP CONSTRAINT [DF__PatientAc__Porta__0C90CB45]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] DROP CONSTRAINT [DF__PatientAc__Porta__0B9CA70C]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] DROP CONSTRAINT [DF__PatientAc__Porta__0AA882D3]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] DROP CONSTRAINT [DF__PatientAcce__Pid__09B45E9A]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] DROP CONSTRAINT [DF__PatientAc__Porta__07CC1628]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] DROP CONSTRAINT [DF__PatientAc__Autho__06D7F1EF]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] DROP CONSTRAINT [DF__PatientAc__Porta__05E3CDB6]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] DROP CONSTRAINT [DF__OpendboSe__PnUid__03FB8544]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] DROP CONSTRAINT [DF__OpendboSe__PnLas__0307610B]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] DROP CONSTRAINT [DF__OpendboSe__PnFir__02133CD2]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] DROP CONSTRAINT [DF__OpendboSe__PnIpa__011F1899]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] DROP CONSTRAINT [DF__OpendboSe__PnSes__002AF460]
GO
ALTER TABLE [dbo].[OpendboPostcalendarTopics] DROP CONSTRAINT [DF__OpendboPo__PcCat__7E42ABEE]
GO
ALTER TABLE [dbo].[OpendboPostcalendarTopics] DROP CONSTRAINT [DF__OpendboPo__PcCat__7D4E87B5]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] DROP CONSTRAINT [DF__OpendboPo__PcLim__7B663F43]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] DROP CONSTRAINT [DF__OpendboPo__PcEnd__7A721B0A]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] DROP CONSTRAINT [DF__OpendboPo__PcSta__797DF6D1]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] DROP CONSTRAINT [DF__OpendboPo__PcCat__7889D298]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcRoo__76A18A26]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcBil__75AD65ED]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcSen__74B941B4]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcSen__73C51D7B]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcFac__72D0F942]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcPre__71DCD509]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcApp__70E8B0D0]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcLan__6FF48C97]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcSha__6F00685E]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcEve__6E0C4425]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcFee__6D181FEC]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcWeb__6C23FBB3]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCon__6B2FD77A]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCon__6A3BB341]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCon__69478F08]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcAll__68536ACF]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcEnd__675F4696]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcSta__666B225D]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcRec__6576FE24]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcRec__6482D9EB]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcDur__638EB5B2]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcEnd__629A9179]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcEve__61A66D40]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcInf__60B24907]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcTop__5FBE24CE]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCou__5ECA0095]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCom__5DD5DC5C]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcTim__5CE1B823]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcTit__5BED93EA]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcPid__5AF96FB1]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcAid__5A054B78]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] DROP CONSTRAINT [DF__OpendboPo__PcCat__5911273F]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcSeq__5728DECD]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcAct__5634BA94]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcDai__5540965B]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcEnd__544C7222]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcEnd__53584DE9]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcEnd__526429B0]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcEnd__51700577]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcDur__507BE13E]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcRec__4F87BD05]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcEnd__4E9398CC]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcRec__4D9F7493]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcCat__4CAB505A]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] DROP CONSTRAINT [DF__OpendboPo__PcCat__4BB72C21]
GO
ALTER TABLE [dbo].[OpendboModuleVars] DROP CONSTRAINT [DF__OpendboMo__PnNam__49CEE3AF]
GO
ALTER TABLE [dbo].[OpendboModuleVars] DROP CONSTRAINT [DF__OpendboMo__PnMod__48DABF76]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnSta__46F27704]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnUse__45FE52CB]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnAdm__450A2E92]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnVer__44160A59]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnDir__4321E620]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnReg__422DC1E7]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnDes__41399DAE]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnDis__40457975]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnTyp__3F51553C]
GO
ALTER TABLE [dbo].[OpendboModules] DROP CONSTRAINT [DF__OpendboMo__PnNam__3E5D3103]
GO
ALTER TABLE [dbo].[Onotes] DROP CONSTRAINT [DF__Onotes__Activity__3C74E891]
GO
ALTER TABLE [dbo].[Onotes] DROP CONSTRAINT [DF__Onotes__Groupnam__3B80C458]
GO
ALTER TABLE [dbo].[Onotes] DROP CONSTRAINT [DF__Onotes__User__3A8CA01F]
GO
ALTER TABLE [dbo].[Onotes] DROP CONSTRAINT [DF__Onotes__Date__39987BE6]
GO
ALTER TABLE [dbo].[NotificationLog] DROP CONSTRAINT [DF__Notificat__PcEid__36BC0F3B]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__Revision__34D3C6C9]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__Date__33DFA290]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__Owner__32EB7E57]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__Note__31F75A1E]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__ForeignId__310335E5]
GO
ALTER TABLE [dbo].[Notes] DROP CONSTRAINT [DF__Notes__Id__300F11AC]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSe__ssma$__2E26C93A]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSet__Path__2D32A501]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSe__MenuN__2C3E80C8]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSe__ObjNa__2B4A5C8F]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSe__FldTy__2A563856]
GO
ALTER TABLE [dbo].[ModulesSettings] DROP CONSTRAINT [DF__ModulesSe__ModId__2962141D]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] DROP CONSTRAINT [DF__ModulesHo__Attac__2779CBAB]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] DROP CONSTRAINT [DF__ModulesHo__Enabl__2685A772]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] DROP CONSTRAINT [DF__ModulesHo__ModId__25918339]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__Type__23A93AC7]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__SqlRun__22B5168E]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__Permiss__21C0F255]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModEncM__20CCCE1C]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModNick__1FD8A9E3]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModDesc__1EE485AA]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModUiAc__1DF06171]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModUiOr__1CFC3D38]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModRela__1C0818FF]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModUiNa__1B13F4C6]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModActi__1A1FD08D]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModType__192BAC54]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModPare__1837881B]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModDire__174363E2]
GO
ALTER TABLE [dbo].[Modules] DROP CONSTRAINT [DF__Modules__ModName__164F3FA9]
GO
ALTER TABLE [dbo].[ModuleAclUserSettings] DROP CONSTRAINT [DF__ModuleAcl__Allow__1372D2FE]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__ssma$__118A8A8C]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__Modul__10966653]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__Secti__0FA2421A]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__Paren__0EAE1DE1]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__Secti__0DB9F9A8]
GO
ALTER TABLE [dbo].[ModuleAclSections] DROP CONSTRAINT [DF__ModuleAcl__Secti__0CC5D56F]
GO
ALTER TABLE [dbo].[ModuleAclGroupSettings] DROP CONSTRAINT [DF__ModuleAcl__Allow__0ADD8CFD]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__Phone__08F5448B]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddress__Zip__08012052]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__State__070CFC19]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddres__City__0618D7E0]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__Stree__0524B3A7]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__Lname__04308F6E]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__Mname__033C6B35]
GO
ALTER TABLE [dbo].[MiscAddressBook] DROP CONSTRAINT [DF__MiscAddre__Fname__024846FC]
GO
ALTER TABLE [dbo].[LogCommentEncrypt] DROP CONSTRAINT [DF__LogCommen__Encry__005FFE8A]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__CcdaDocId__7E77B618]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__MenuItemId__7D8391DF]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__LogFrom__7C8F6DA6]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__CrtUser__7B9B496D]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__Success__7AA72534]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__PatientId__79B300FB]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__Groupname__78BEDCC2]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__User__77CAB889]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__Event__76D69450]
GO
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [DF__Log__Date__75E27017]
GO
ALTER TABLE [dbo].[ListsTouch] DROP CONSTRAINT [DF__ListsTouch__Date__73FA27A5]
GO
ALTER TABLE [dbo].[ListsTouch] DROP CONSTRAINT [DF__ListsTouch__Type__7306036C]
GO
ALTER TABLE [dbo].[ListsTouch] DROP CONSTRAINT [DF__ListsTouch__Pid__7211DF33]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__ExternalI__702996C1]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__SeverityA__6F357288]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Modifydat__6E414E4F]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__ErxUpload__6D4D2A16]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__ErxSource__6C5905DD]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__ExternalA__6B64E1A4]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Reaction__6A70BD6B]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__InjuryGra__697C9932]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__InjuryTyp__688874F9]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__InjuryPar__679450C0]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__ReinjuryI__66A02C87]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Destinati__65AC084E]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Outcome__64B7E415]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Groupname__63C3BFDC]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__User__62CF9BA3]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Pid__61DB776A]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Activity__60E75331]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Diagnosis__5FF32EF8]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Extrainfo__5EFF0ABF]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Referredb__5E0AE686]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Classific__5D16C24D]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Occurrenc__5C229E14]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Returndat__5B2E79DB]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Enddate__5A3A55A2]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Begdate__59463169]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Title__58520D30]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Subtype__575DE8F7]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Type__5669C4BE]
GO
ALTER TABLE [dbo].[Lists] DROP CONSTRAINT [DF__Lists__Date__5575A085]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Subty__538D5813]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Activ__529933DA]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Toggl__51A50FA1]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Toggl__50B0EB68]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Codes__4FBCC72F]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Notes__4EC8A2F6]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Mappi__4DD47EBD]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Optio__4CE05A84]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__IsDef__4BEC364B]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptions__Seq__4AF81212]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Title__4A03EDD9]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__Optio__490FC9A0]
GO
ALTER TABLE [dbo].[ListOptions] DROP CONSTRAINT [DF__ListOptio__ListI__481BA567]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Sourc__444B1483]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__ListB__4356F04A]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__FldRo__4262CC11]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__EditO__416EA7D8]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Defau__407A839F]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Datac__3F865F66]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Title__3E923B2D]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__ListI__3D9E16F4]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__MaxLe__3CA9F2BB]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__FldLe__3BB5CE82]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOptio__Uor__3AC1AA49]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__DataT__39CD8610]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOptio__Seq__38D961D7]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Title__37E53D9E]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Group__36F11965]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__Field__35FCF52C]
GO
ALTER TABLE [dbo].[LayoutOptions] DROP CONSTRAINT [DF__LayoutOpt__FormI__3508D0F3]
GO
ALTER TABLE [dbo].[LangLanguages] DROP CONSTRAINT [DF__LangLangu__LangI__33208881]
GO
ALTER TABLE [dbo].[LangLanguages] DROP CONSTRAINT [DF__LangLangu__LangD__322C6448]
GO
ALTER TABLE [dbo].[LangLanguages] DROP CONSTRAINT [DF__LangLangu__LangC__3138400F]
GO
ALTER TABLE [dbo].[LangDefinitions] DROP CONSTRAINT [DF__LangDefin__LangI__2F4FF79D]
GO
ALTER TABLE [dbo].[LangDefinitions] DROP CONSTRAINT [DF__LangDefin__ConsI__2E5BD364]
GO
ALTER TABLE [dbo].[LangCustom] DROP CONSTRAINT [DF__LangCusto__ssma$__2C738AF2]
GO
ALTER TABLE [dbo].[LangCustom] DROP CONSTRAINT [DF__LangCusto__LangC__2B7F66B9]
GO
ALTER TABLE [dbo].[LangCustom] DROP CONSTRAINT [DF__LangCusto__LangD__2A8B4280]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Order__27AED5D5]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Force__26BAB19C]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Style__25C68D63]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Abbre__24D2692A]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Singu__23DE44F1]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Plura__22EA20B8]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueTypes__Type__21F5FC7F]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Categ__2101D846]
GO
ALTER TABLE [dbo].[IssueTypes] DROP CONSTRAINT [DF__IssueType__Activ__200DB40D]
GO
ALTER TABLE [dbo].[IntegrationMapping] DROP CONSTRAINT [DF__Integrati__Local__1D314762]
GO
ALTER TABLE [dbo].[IntegrationMapping] DROP CONSTRAINT [DF__Integrati__Local__1C3D2329]
GO
ALTER TABLE [dbo].[IntegrationMapping] DROP CONSTRAINT [DF__Integrati__Forei__1B48FEF0]
GO
ALTER TABLE [dbo].[IntegrationMapping] DROP CONSTRAINT [DF__Integrati__Forei__1A54DAB7]
GO
ALTER TABLE [dbo].[IntegrationMapping] DROP CONSTRAINT [DF__IntegrationM__Id__1960B67E]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Rende__17786E0C]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Provi__168449D3]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Group__1590259A]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Rende__149C0161]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Provi__13A7DD28]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Insur__12B3B8EF]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__Insurance__Provi__11BF94B6]
GO
ALTER TABLE [dbo].[InsuranceNumbers] DROP CONSTRAINT [DF__InsuranceNum__Id__10CB707D]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Polic__0EE3280B]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Accep__0DEF03D2]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__0CFADF99]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__InsuranceDa__Pid__0C06BB60]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__InsuranceD__Date__0B129727]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Copay__0A1E72EE]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__092A4EB5]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__08362A7C]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__07420643]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__064DE20A]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__0559BDD1]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__04659998]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__0371755F]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__027D5126]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__01892CED]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__009508B4]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7FA0E47B]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7EACC042]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7DB89C09]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7CC477D0]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7BD05397]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__7ADC2F5E]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__79E80B25]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Subsc__78F3E6EC]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Group__77FFC2B3]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Polic__770B9E7A]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__PlanN__76177A41]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__Insurance__Provi__75235608]
GO
ALTER TABLE [dbo].[InsuranceData] DROP CONSTRAINT [DF__InsuranceD__Type__742F31CF]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__Insurance__AltCm__7246E95D]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__Insurance__X12De__7152C524]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__Insurance__X12Re__705EA0EB]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__Insurance__Freeb__6F6A7CB2]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__Insurance__CmsId__6E765879]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__InsuranceC__Attn__6D823440]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__InsuranceC__Name__6C8E1007]
GO
ALTER TABLE [dbo].[InsuranceCompanies] DROP CONSTRAINT [DF__InsuranceCom__Id__6B99EBCE]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Order__69B1A35C]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Refus__68BD7F23]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Infor__67C95AEA]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Compl__66D536B1]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Exter__65E11278]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Added__64ECEE3F]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Admin__63F8CA06]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Route__6304A5CD]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Expir__62108194]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Amoun__611C5D5B]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Amoun__60283922]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Updat__5F3414E9]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Creat__5E3FF0B0]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Updat__5D4BCC77]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Creat__5C57A83E]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__VisDa__5B638405]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Educa__5A6F5FCC]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Admin__597B3B93]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Admin__5887175A]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__LotNu__5792F321]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Manuf__569ECEE8]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__CvxCo__55AAAAAF]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Immun__54B68676]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Admin__53C2623D]
GO
ALTER TABLE [dbo].[Immunizations] DROP CONSTRAINT [DF__Immunizat__Patie__52CE3E04]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoDa__50E5F592]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoVi__4FF1D159]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoVi__4EFDAD20]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoCo__4E0988E7]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoCo__4D1564AE]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoCo__4C214075]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoUs__4B2D1C3C]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoCr__4A38F803]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoCr__4944D3CA]
GO
ALTER TABLE [dbo].[ImmunizationObservation] DROP CONSTRAINT [DF__Immunizat__ImoPi__4850AF91]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] DROP CONSTRAINT [DF__Icd9SgLon__Revis__4668671F]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] DROP CONSTRAINT [DF__Icd9SgLon__Activ__457442E6]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] DROP CONSTRAINT [DF__Icd9SgLon__LongD__44801EAD]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] DROP CONSTRAINT [DF__Icd9SgLon__SgCod__438BFA74]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__Revis__41A3B202]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__Activ__40AF8DC9]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__LongD__3FBB6990]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__Short__3EC74557]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__Forma__3DD3211E]
GO
ALTER TABLE [dbo].[Icd9SgCode] DROP CONSTRAINT [DF__Icd9SgCod__SgCod__3CDEFCE5]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] DROP CONSTRAINT [DF__Icd9DxLon__Revis__3AF6B473]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] DROP CONSTRAINT [DF__Icd9DxLon__Activ__3A02903A]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] DROP CONSTRAINT [DF__Icd9DxLon__LongD__390E6C01]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] DROP CONSTRAINT [DF__Icd9DxLon__DxCod__381A47C8]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__Revis__3631FF56]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__Activ__353DDB1D]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__LongD__3449B6E4]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__Short__335592AB]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__Forma__32616E72]
GO
ALTER TABLE [dbo].[Icd9DxCode] DROP CONSTRAINT [DF__Icd9DxCod__DxCod__316D4A39]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__Revis__2F8501C7]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__Activ__2E90DD8E]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2D9CB955]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2CA8951C]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2BB470E3]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2AC04CAA]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__29CC2871]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__28D80438]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reim__CodeC__27E3DFFF]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] DROP CONSTRAINT [DF__Icd10Reimb__Code__26EFBBC6]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__Revis__25077354]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__Activ__24134F1B]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__231F2AE2]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__222B06A9]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2136E270]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__2042BE37]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__1F4E99FE]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__ICD90__1E5A75C5]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reim__CodeC__1D66518C]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] DROP CONSTRAINT [DF__Icd10Reimb__Code__1C722D53]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__Revis__1A89E4E1]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__Activ__1995C0A8]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__LongD__18A19C6F]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__Short__17AD7836]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__Valid__16B953FD]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] DROP CONSTRAINT [DF__Icd10PcsO__PcsCo__15C52FC4]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] DROP CONSTRAINT [DF__Icd10GemP__Revis__13DCE752]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] DROP CONSTRAINT [DF__Icd10GemP__Activ__12E8C319]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] DROP CONSTRAINT [DF__Icd10GemP__Flags__11F49EE0]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] DROP CONSTRAINT [DF__Icd10GemP__PcsIc__11007AA7]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] DROP CONSTRAINT [DF__Icd10GemP__PcsIc__100C566E]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] DROP CONSTRAINT [DF__Icd10GemP__Revis__0E240DFC]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] DROP CONSTRAINT [DF__Icd10GemP__Activ__0D2FE9C3]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] DROP CONSTRAINT [DF__Icd10GemP__Flags__0C3BC58A]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] DROP CONSTRAINT [DF__Icd10GemP__PcsIc__0B47A151]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] DROP CONSTRAINT [DF__Icd10GemP__PcsIc__0A537D18]
GO
ALTER TABLE [dbo].[Icd10GemDx910] DROP CONSTRAINT [DF__Icd10GemD__Revis__086B34A6]
GO
ALTER TABLE [dbo].[Icd10GemDx910] DROP CONSTRAINT [DF__Icd10GemD__Activ__0777106D]
GO
ALTER TABLE [dbo].[Icd10GemDx910] DROP CONSTRAINT [DF__Icd10GemD__Flags__0682EC34]
GO
ALTER TABLE [dbo].[Icd10GemDx910] DROP CONSTRAINT [DF__Icd10GemD__DxIcd__058EC7FB]
GO
ALTER TABLE [dbo].[Icd10GemDx910] DROP CONSTRAINT [DF__Icd10GemD__DxIcd__049AA3C2]
GO
ALTER TABLE [dbo].[Icd10GemDx109] DROP CONSTRAINT [DF__Icd10GemD__Revis__02B25B50]
GO
ALTER TABLE [dbo].[Icd10GemDx109] DROP CONSTRAINT [DF__Icd10GemD__Activ__01BE3717]
GO
ALTER TABLE [dbo].[Icd10GemDx109] DROP CONSTRAINT [DF__Icd10GemD__Flags__00CA12DE]
GO
ALTER TABLE [dbo].[Icd10GemDx109] DROP CONSTRAINT [DF__Icd10GemD__DxIcd__7FD5EEA5]
GO
ALTER TABLE [dbo].[Icd10GemDx109] DROP CONSTRAINT [DF__Icd10GemD__DxIcd__7EE1CA6C]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__Revis__7CF981FA]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__Activ__7C055DC1]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__LongD__7B113988]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__Short__7A1D154F]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__Valid__7928F116]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__Forma__7834CCDD]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] DROP CONSTRAINT [DF__Icd10DxOr__DxCod__7740A8A4]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Userd__75586032]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Userd__74643BF9]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Userd__737017C0]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Userd__727BF387]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Userd__7187CF4E]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__7093AB15]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6F9F86DC]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6EAB62A3]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6DB73E6A]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6CC31A31]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6BCEF5F8]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6ADAD1BF]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__69E6AD86]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__68F2894D]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__67FE6514]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__670A40DB]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__66161CA2]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6521F869]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__642DD430]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__6339AFF7]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__62458BBE]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__61516785]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__605D434C]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Usert__5F691F13]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Value__5E74FADA]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Name2__5D80D6A1]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Value__5C8CB268]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Name1__5B988E2F]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryData__Pid__5AA469F6]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDat__Date__59B045BD]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Appen__58BC2184]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__KneeR__57C7FD4B]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__HipRe__56D3D912]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Herni__55DFB4D9]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Hyste__54EB90A0]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Heart__53F76C67]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Chole__5303482E]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Tonsi__520F23F5]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__Catar__511AFFBC]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastE__5026DB83]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastP__4F32B74A]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastH__4E3E9311]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastL__4D4A6ED8]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastP__4C564A9F]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastF__4B622666]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastR__4A6E022D]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastC__4979DDF4]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastE__4885B9BB]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastS__47919582]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastP__469D7149]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastP__45A94D10]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastR__44B528D7]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastG__43C1049E]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastM__42CCE065]
GO
ALTER TABLE [dbo].[HistoryData] DROP CONSTRAINT [DF__HistoryDa__LastB__41D8BC2C]
GO
ALTER TABLE [dbo].[Globals] DROP CONSTRAINT [DF__Globals__GlValue__3E082B48]
GO
ALTER TABLE [dbo].[Globals] DROP CONSTRAINT [DF__Globals__GlIndex__3D14070F]
GO
ALTER TABLE [dbo].[GeoZoneReference] DROP CONSTRAINT [DF__GeoZoneRe__ZoneN__3B2BBE9D]
GO
ALTER TABLE [dbo].[GeoZoneReference] DROP CONSTRAINT [DF__GeoZoneRe__ZoneC__3A379A64]
GO
ALTER TABLE [dbo].[GeoZoneReference] DROP CONSTRAINT [DF__GeoZoneRe__ZoneC__3943762B]
GO
ALTER TABLE [dbo].[GeoCountryReference] DROP CONSTRAINT [DF__GeoCountr__Count__375B2DB9]
GO
ALTER TABLE [dbo].[GeoCountryReference] DROP CONSTRAINT [DF__GeoCountr__Count__36670980]
GO
ALTER TABLE [dbo].[GeoCountryReference] DROP CONSTRAINT [DF__GeoCountr__Count__3572E547]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Exter__338A9CD5]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Oxyge__3296789C]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__HeadC__31A25463]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Waist__30AE302A]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__BMISt__2FBA0BF1]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__BMI__2EC5E7B8]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__Note__2DD1C37F]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Respi__2CDD9F46]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Pulse__2BE97B0D]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__TempM__2AF556D4]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Tempe__2A01329B]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Heigh__290D0E62]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Weigh__2818EA29]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__Bpd__2724C5F0]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__Bps__2630A1B7]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Activ__253C7D7E]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Autho__24485945]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVital__Group__2354350C]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__User__226010D3]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__Pid__216BEC9A]
GO
ALTER TABLE [dbo].[FormVitals] DROP CONSTRAINT [DF__FormVitals__Date__2077C861]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__Activi__1E8F7FEF]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__Author__1D9B5BB6]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__Groupn__1CA7377D]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__User__1BB31344]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__Pid__1ABEEF0B]
GO
ALTER TABLE [dbo].[FormSoap] DROP CONSTRAINT [DF__FormSoap__Date__19CACAD2]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Deleted__17E28260]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Authorize__16EE5E27]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Groupname__15FA39EE]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__User__150615B5]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Pid__1411F17C]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__FormId__131DCD43]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Encounter__1229A90A]
GO
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [DF__Forms__Date__113584D1]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__HaiStat__0F4D3C5F]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hiv__0E591826]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Frequen__0D64F3ED]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Allergi__0C70CFB4]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Bleedin__0B7CAB7B]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FhBlood__0A888742]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Anemia__09946309]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Abnorma__08A03ED0]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Diabete__07AC1A97]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Thyroid__06B7F65E]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SocialD__05C3D225]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Anxiety__04CFADEC]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Depress__03DB89B3]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__PMedica__02E7657A]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__PDiagno__01F34141]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SDiseas__00FF1D08]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SOther__000AF8CF]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SAcne__7F16D496]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Psorias__7E22B05D]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SCancer__7D2E8C24]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__NHeadac__7C3A67EB]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Dementi__7B4643B2]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__MemoryP__7A521F79]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Intelle__795DFB40]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Paralys__7869D707]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__NWeakne__7775B2CE]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__NNumbne__76818E95]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Tia__758D6A5C]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Stroke__74994623]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Seizure__73A521EA]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Loc__72B0FDB1]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Arthrit__71BCD978]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Fms__70C8B53F]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__MAches__6FD49106]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Muscle__6EE06CCD]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__MStiffn__6DEC4894]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__MWarm__6CF8245B]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__MRednes__6C040022]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Swellin__6B0FDBE9]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__JointPa__6A1BB7B0]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FHirsut__69279377]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Abnorma__68336F3E]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FSympto__673F4B05]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FFlow__664B26CC]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FFreque__65570293]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Lmp__6462DE5A]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Menopau__636EBA21]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Mearche__627A95E8]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Lc__618671AF]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Ap__60924D76]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__P__5F9E293D]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__G__5EAA0504]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Ejacula__5DB5E0CB]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Erectio__5CC1BC92]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Nocturi__5BCD9859]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Stream__5AD97420]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Dribbli__59E54FE7]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hesitan__58F12BAE]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Utis__57FD0775]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__RenalSt__5708E33C]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Inconti__5614BF03]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Urgency__55209ACA]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Frequen__542C7691]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hematur__53385258]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Dysuria__52442E1F]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Polydyp__515009E6]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Polyuri__505BE5AD]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Constip__4F67C174]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Diarrhe__4E739D3B]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Changed__4D7F7902]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hematoc__4C8B54C9]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Jaundic__4B973090]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hepatit__4AA30C57]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__FoodInt__49AEE81E]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__GastroP__48BAC3E5]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hematem__47C69FAC]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Vomitin__46D27B73]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Nausea__45DE573A]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Flatule__44EA3301]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Belchin__43F60EC8]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Bloatin__4301EA8F]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Heartbu__420DC656]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Dysphag__4119A21D]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__HeartPr__40257DE4]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Arrythm__3F3159AB]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__History__3E3D3572]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Legpain__3D491139]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Edema__3C54ED00]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Periphe__3B60C8C7]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Orthopn__3A6CA48E]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Doe__39788055]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Pnd__38845C1C]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Syncope__379037E3]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Palpita__369C13AA]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__ChestPa__35A7EF71]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Copd__34B3CB38]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Asthma__33BFA6FF]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hemopts__32CB82C6]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Wheezin__31D75E8D]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Shortne__30E33A54]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Sputum__2FEF161B]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Cough__2EFAF1E2]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Abnorma__2E06CDA9]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Biopsy__2D12A970]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__BreastD__2C1E8537]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__BreastM__2B2A60FE]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Apnea__2A363CC5]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Snoring__2942188C]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Noseble__284DF453]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__PostNas__2759D01A]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SinusPr__2665ABE1]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__SoreThr__257187A8]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Frequen__247D636F]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Tinnitu__23893F36]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Vertigo__22951AFD]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Pain__21A0F6C4]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Dischar__20ACD28B]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Hearing__1FB8AE52]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Photoph__1EC48A19]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__BlindSp__1DD065E0]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__DoubleV__1CDC41A7]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Excessi__1BE81D6E]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Redness__1AF3F935]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Irritat__19FFD4FC]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__EyePain__190BB0C3]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Glaucom__18178C8A]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__ChangeI__17236851]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Intoler__162F4418]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__HeatOrC__153B1FDF]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Irritab__1446FBA6]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Insomni__1352D76D]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__NightSw__125EB334]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Chills__116A8EFB]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Fever__10766AC2]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Anorexi__0F824689]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Fatigue__0E8E2250]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Weaknes__0D99FE17]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__WeightC__0CA5D9DE]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Date__0BB1B5A5]
GO
ALTER TABLE [dbo].[FormRos] DROP CONSTRAINT [DF__FormRos__Activit__0ABD916C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Addis__08D548FA]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Cushi__07E124C1]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Hyper__06ED0088]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Hypot__05F8DC4F]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Nonin__0504B816]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Insul__041093DD]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__FootP__031C6FA4]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Ankle__02284B6B]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__KneeP__01342732]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__HipPr__004002F9]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__HandP__7F4BDEC0]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Wrist__7E57BA87]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Elbow__7D63964E]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Shoul__7C6F7215]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Herni__7B7B4DDC]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Scoli__7A8729A3]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__BackS__7993056A]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__BackP__789EE131]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__NeckP__77AABCF8]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Broke__76B698BF]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Stiff__75C27486]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Swoll__74CE504D]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Ankyl__73DA2C14]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Lupus__72E607DB]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Rheum__71F1E3A2]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Oseto__70FDBF69]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Herpe__70099B30]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Pemph__6F1576F7]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Ulcer__6E2152BE]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Infec__6D2D2E85]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Rashe__6C390A4C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Disch__6B44E613]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Burni__6A50C1DA]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Sexua__695C9DA1]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Kidne__68687968]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Prost__6774552F]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Prost__668030F6]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Bladd__658C0CBD]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Bladd__6497E884]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Kidne__63A3C44B]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Kidne__62AFA012]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Kidne__61BB7BD9]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Kidne__60C757A0]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Splen__5FD33367]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Cirrh__5EDF0F2E]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Hepat__5DEAEAF5]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Chole__5CF6C6BC]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__GallS__5C02A283]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Divir__5B0E7E4A]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Divir__5A1A5A11]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Appen__592635D8]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Crohn__5832119F]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Ulcer__573DED66]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Colon__5649C92D]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Colon__5555A4F4]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Colon__546180BB]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Polyp__536D5C82]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Endos__52793849]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Gastr__51851410]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Pepti__5090EFD7]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Stoma__4F9CCB9E]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Pheum__4EA8A765]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__LungC__4DB4832C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__LungC__4CC05EF3]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Short__4BCC3ABA]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Inter__4AD81681]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Chron__49E3F248]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Emphy__48EFCE0F]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Stres__47FBA9D6]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Heart__4707859D]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Coron__46136164]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Cardi__451F3D2B]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Vascu__442B18F2]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__PoorC__4336F4B9]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Heart__4242D080]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__HighB__414EAC47]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Short__405A880E]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Chest__3F6663D5]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Irreg__3E723F9C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Heart__3D7E1B63]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Throa__3C89F72A]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Throa__3B95D2F1]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Swoll__3AA1AEB8]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Tonsi__39AD8A7F]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Strep__38B96646]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__DryMo__37C5420D]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Sinus__36D11DD4]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Sinus__35DCF99B]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Blood__34E8D562]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Ringi__33F4B129]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Heada__33008CF0]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__PoorH__320C68B7]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Blurr__3118447E]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Doubl__30242045]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Glauc__2F2FFC0C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Catar__2E3BD7D3]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Catar__2D47B39A]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Expos__2C538F61]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Hyper__2B5F6B28]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Depre__2A6B46EF]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Fatig__297722B6]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Insom__2882FE7D]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__PoorA__278EDA44]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Weigh__269AB60B]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Night__25A691D2]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Chill__24B26D99]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Fever__23BE4960]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Activ__22CA2527]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Autho__21D600EE]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormRevie__Group__20E1DCB5]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormReview__User__1FEDB87C]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormReviewo__Pid__1EF99443]
GO
ALTER TABLE [dbo].[FormReviewofs] DROP CONSTRAINT [DF__FormReview__Date__1E05700A]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__ssma$__1C1D2798]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Table__1B29035F]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__CodeT__1A34DF26]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Descr__1940BAED]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__ObUni__184C96B4]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__ObVal__1758727B]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Obser__16644E42]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObserv__Code__15702A09]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Activ__147C05D0]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Autho__1387E197]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Group__1293BD5E]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObserv__User__119F9925]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObser__Encou__10AB74EC]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObserva__Pid__0FB750B3]
GO
ALTER TABLE [dbo].[FormObservation] DROP CONSTRAINT [DF__FormObserv__Date__0EC32C7A]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Box15__0CDAE408]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Box14__0BE6BFCF]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Repla__0AF29B96]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Comme__09FE775D]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Prior__090A5324]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Medic__08162EEB]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Medic__07220AB2]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Hospi__062DE679]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Hospi__0539C240]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__IsHos__04459E07]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__OffWo__035179CE]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__OffWo__025D5595]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__DateI__0169315C]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__IsUna__00750D23]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__LabAm__7F80E8EA]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Outsi__7E8CC4B1]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Other__7D98A078]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Accid__7CA47C3F]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__AutoA__7BB05806]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Emplo__7ABC33CD]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Activ__79C80F94]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Autho__78D3EB5B]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscB__Group__77DFC722]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscBi__User__76EBA2E9]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscBil__Pid__75F77EB0]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] DROP CONSTRAINT [DF__FormMiscBi__Date__75035A77]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__ssma$__731B1205]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__Exter__7226EDCC]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFuncti__Code__7132C993]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__Activ__703EA55A]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__Autho__6F4A8121]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__Group__6E565CE8]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFuncti__User__6D6238AF]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunct__Encou__6C6E1476]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFunctio__Pid__6B79F03D]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] DROP CONSTRAINT [DF__FormFuncti__Date__6A85CC04]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Exter__689D8392]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Billi__67A95F59]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Refer__66B53B20]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Invoi__65C116E7]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Super__64CCF2AE]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Provi__63D8CE75]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__StmtC__62E4AA3C]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__LastS__61F08603]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__LastL__60FC61CA]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__LastL__60083D91]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__PcCat__5F141958]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Sensi__5E1FF51F]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Onset__5D2BD0E6]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Encou__5C37ACAD]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncount__Pid__5B438874]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncou__Facil__5A4F643B]
GO
ALTER TABLE [dbo].[FormEncounter] DROP CONSTRAINT [DF__FormEncoun__Date__595B4002]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDicta__Activ__5772F790]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDicta__Autho__567ED357]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDicta__Group__558AAF1E]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDictat__User__54968AE5]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDictati__Pid__53A266AC]
GO
ALTER TABLE [dbo].[FormDictation] DROP CONSTRAINT [DF__FormDictat__Date__52AE4273]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] DROP CONSTRAINT [DF__FormClini__Activ__50C5FA01]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] DROP CONSTRAINT [DF__FormClinic__Date__4FD1D5C8]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] DROP CONSTRAINT [DF__FormClinic__User__4EDDB18F]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] DROP CONSTRAINT [DF__FormClini__Encou__4DE98D56]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] DROP CONSTRAINT [DF__FormClinica__Pid__4CF5691D]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__ssma$__4B0D20AB]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__Exter__4A18FC72]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCarePl__Code__4924D839]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__Activ__4830B400]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__Autho__473C8FC7]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__Group__46486B8E]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCarePl__User__45544755]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCareP__Encou__4460231C]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCarePla__Pid__436BFEE3]
GO
ALTER TABLE [dbo].[FormCarePlan] DROP CONSTRAINT [DF__FormCarePl__Date__4277DAAA]
GO
ALTER TABLE [dbo].[FeeSheetOptions] DROP CONSTRAINT [DF__FeeSheetO__ssma$__408F9238]
GO
ALTER TABLE [dbo].[FeeSheetOptions] DROP CONSTRAINT [DF__FeeSheetO__FsCod__3F9B6DFF]
GO
ALTER TABLE [dbo].[FeeSheetOptions] DROP CONSTRAINT [DF__FeeSheetO__FsOpt__3EA749C6]
GO
ALTER TABLE [dbo].[FeeSheetOptions] DROP CONSTRAINT [DF__FeeSheetO__FsCat__3DB3258D]
GO
ALTER TABLE [dbo].[FacilityUserIds] DROP CONSTRAINT [DF__FacilityU__Facil__3BCADD1B]
GO
ALTER TABLE [dbo].[FacilityUserIds] DROP CONSTRAINT [DF__FacilityUse__Uid__3AD6B8E2]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Facili__38EE7070]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Primar__37FA4C37]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Color__370627FE]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__TaxIdT__361203C5]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Facili__351DDF8C]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Domain__3429BB53]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Attn__3335971A]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__X12Sen__324172E1]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__PosCod__314D4EA8]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Accept__30592A6F]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Billin__2F650636]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Servic__2E70E1FD]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Email__2D7CBDC4]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Websit__2C88998B]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Federa__2B947552]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Countr__2AA05119]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Postal__29AC2CE0]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__State__28B808A7]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__City__27C3E46E]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Street__26CFC035]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Fax__25DB9BFC]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Phone__24E777C3]
GO
ALTER TABLE [dbo].[Facility] DROP CONSTRAINT [DF__Facility__Name__23F3538A]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpExt__220B0B18]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpFac__2116E6DF]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpEnc__2022C2A6]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpPid__1F2E9E6D]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpCod__1E3A7A34]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpCod__1D4655FB]
GO
ALTER TABLE [dbo].[ExternalProcedures] DROP CONSTRAINT [DF__ExternalP__EpDat__1C5231C2]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EeExt__1A69E950]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EeEnc__1975C517]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EeFac__1881A0DE]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EePro__178D7CA5]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EePid__1699586C]
GO
ALTER TABLE [dbo].[ExternalEncounters] DROP CONSTRAINT [DF__ExternalE__EeDat__15A53433]
GO
ALTER TABLE [dbo].[ExtendedLog] DROP CONSTRAINT [DF__ExtendedL__Patie__13BCEBC1]
GO
ALTER TABLE [dbo].[ExtendedLog] DROP CONSTRAINT [DF__ExtendedL__Recip__12C8C788]
GO
ALTER TABLE [dbo].[ExtendedLog] DROP CONSTRAINT [DF__ExtendedLo__User__11D4A34F]
GO
ALTER TABLE [dbo].[ExtendedLog] DROP CONSTRAINT [DF__ExtendedL__Event__10E07F16]
GO
ALTER TABLE [dbo].[ExtendedLog] DROP CONSTRAINT [DF__ExtendedLo__Date__0FEC5ADD]
GO
ALTER TABLE [dbo].[EsignSignatures] DROP CONSTRAINT [DF__EsignSign__IsLoc__0E04126B]
GO
ALTER TABLE [dbo].[EncCategoryMap] DROP CONSTRAINT [DF__EncCatego__ssma$__0B27A5C0]
GO
ALTER TABLE [dbo].[EncCategoryMap] DROP CONSTRAINT [DF__EncCatego__MainC__0A338187]
GO
ALTER TABLE [dbo].[EncCategoryMap] DROP CONSTRAINT [DF__EncCatego__RuleE__093F5D4E]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerDat__Pid__075714DC]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerDa__Date__0662F0A3]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerD__Count__056ECC6A]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerD__State__047AA831]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerDa__City__038683F8]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerD__Posta__02925FBF]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerD__Stree__019E3B86]
GO
ALTER TABLE [dbo].[EmployerData] DROP CONSTRAINT [DF__EmployerDa__Name__00AA174D]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Creat__7EC1CEDB]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Deduc__7DCDAAA2]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Deduc__7CD98669]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Copay__7BE56230]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Eligi__7AF13DF7]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Insur__79FD19BE]
GO
ALTER TABLE [dbo].[EligibilityVerification] DROP CONSTRAINT [DF__Eligibili__Respo__7908F585]
GO
ALTER TABLE [dbo].[EligibilityResponse] DROP CONSTRAINT [DF__Eligibili__Respo__7720AD13]
GO
ALTER TABLE [dbo].[EligibilityResponse] DROP CONSTRAINT [DF__Eligibili__Respo__762C88DA]
GO
ALTER TABLE [dbo].[EligibilityResponse] DROP CONSTRAINT [DF__Eligibili__Respo__753864A1]
GO
ALTER TABLE [dbo].[EligibilityResponse] DROP CONSTRAINT [DF__Eligibili__Respo__74444068]
GO
ALTER TABLE [dbo].[EligibilityResponse] DROP CONSTRAINT [DF__Eligibili__Respo__73501C2F]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Taxra__7167D3BD]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Refil__7073AF84]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Quant__6F7F8B4B]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Perio__6E8B6712]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Dosag__6D9742D9]
GO
ALTER TABLE [dbo].[DrugTemplates] DROP CONSTRAINT [DF__DrugTempl__Selec__6CA31EA0]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Notes__6ABAD62E]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Distr__69C6B1F5]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__XferI__68D28DBC]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Bille__67DE6983]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Fee__66EA454A]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Quant__65F62111]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__User__6501FCD8]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Encou__640DD89F]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Pid__6319B466]
GO
ALTER TABLE [dbo].[DrugSales] DROP CONSTRAINT [DF__DrugSales__Presc__6225902D]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__DrugCode__603D47BB]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__AllowMult__5F492382]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__AllowComb__5E54FF49]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Active__5D60DB10]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__CypFactor__5C6CB6D7]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__RelatedCo__5B78929E]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Substitut__5A846E65]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Route__59904A2C]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Unit__589C25F3]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Size__57A801BA]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Form__56B3DD81]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__LastNotif__55BFB948]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__MaxLevel__54CB950F]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__ReorderPo__53D770D6]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__OnOrder__52E34C9D]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__NdcNumber__51EF2864]
GO
ALTER TABLE [dbo].[Drugs] DROP CONSTRAINT [DF__Drugs__Name__50FB042B]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Destr__4F12BBB9]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Destr__4E1E9780]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Destr__4D2A7347]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Destr__4C364F0E]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__LastN__4B422AD5]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Vendo__4A4E069C]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Wareh__4959E263]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__OnHan__4865BE2A]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Manuf__477199F1]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__Expir__467D75B8]
GO
ALTER TABLE [dbo].[DrugInventory] DROP CONSTRAINT [DF__DrugInven__LotNu__4589517F]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmUp__43A1090D]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmRe__42ACE4D4]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmSa__41B8C09B]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmPr__40C49C62]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmFa__3FD07829]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmSu__3EDC53F0]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] DROP CONSTRAINT [DF__Documents__DlmCa__3DE82FB7]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldMo__3BFFE745]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldFi__3B0BC30C]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldSi__3A179ED3]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldEn__39237A9A]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldPr__382F5661]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldFa__373B3228]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] DROP CONSTRAINT [DF__Documents__DldPi__36470DEF]
GO
ALTER TABLE [dbo].[DocumentsLegalCategories] DROP CONSTRAINT [DF__Documents__DlcCa__345EC57D]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Docum__32767D0B]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Audit__318258D2]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Audit__308E3499]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Encou__2F9A1060]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Encou__2EA5EC27]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Impor__2DB1C7EE]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__PathD__2CBDA3B5]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Stora__2BC97F7C]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Couch__2AD55B43]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Couch__29E1370A]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__ListI__28ED12D1]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Hash__27F8EE98]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Docda__2704CA5F]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Forei__2610A626]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Revis__251C81ED]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Owner__24285DB4]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Pages__2334397B]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Mimet__22401542]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Url__214BF109]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Date__2057CCD0]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Size__1F63A897]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Type__1E6F845E]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [DF__Documents__Id__1D7B6025]
GO
ALTER TABLE [dbo].[DirectMessageLog] DROP CONSTRAINT [DF__DirectMes__UserI__1B9317B3]
GO
ALTER TABLE [dbo].[DirectMessageLog] DROP CONSTRAINT [DF__DirectMes__Patie__1A9EF37A]
GO
ALTER TABLE [dbo].[DirectMessageLog] DROP CONSTRAINT [DF__DirectMes__Statu__19AACF41]
GO
ALTER TABLE [dbo].[DirectMessageLog] DROP CONSTRAINT [DF__DirectMes__Statu__18B6AB08]
GO
ALTER TABLE [dbo].[DirectMessageLog] DROP CONSTRAINT [DF__DirectMes__Creat__17C286CF]
GO
ALTER TABLE [dbo].[DatedReminders] DROP CONSTRAINT [DF__DatedRemi__Proce__14E61A24]
GO
ALTER TABLE [dbo].[DatedReminders] DROP CONSTRAINT [DF__DatedRemi__Messa__13F1F5EB]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClCre__1209AD79]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClDel__11158940]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClOrd__10216507]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClLis__0F2D40CE]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClLis__0E391C95]
GO
ALTER TABLE [dbo].[Customlists] DROP CONSTRAINT [DF__Customlis__ClLis__0D44F85C]
GO
ALTER TABLE [dbo].[ConfigSeq] DROP CONSTRAINT [DF__ConfigSeq__Id__0B5CAFEA]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Rght__09746778]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Lft__0880433F]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Parent__078C1F06]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Value__0697FACD]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Name__05A3D694]
GO
ALTER TABLE [dbo].[Config] DROP CONSTRAINT [DF__Config__Id__04AFB25B]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctDru__02C769E9]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctPro__01D345B0]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctTer__00DF2177]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctPro__7FEAFD3E]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctCla__7EF6D905]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctExt__7E02B4CC]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctLab__7D0E9093]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctAct__7C1A6C5A]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctDia__7B264821]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctNof__7A3223E8]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctRel__793DFFAF]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctFee__7849DB76]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctMas__7755B73D]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctJus__76619304]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctMod__756D6ECB]
GO
ALTER TABLE [dbo].[codeTypes] DROP CONSTRAINT [DF__codeTypes__ctSeq__74794A92]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Financial__72910220]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Reportabl__719CDDE7]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Active__70A8B9AE]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__CypFactor__6FB49575]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Taxrates__6EC0713C]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__RelatedCo__6DCC4D03]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Superbill__6CD828CA]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Fee__6BE40491]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Units__6AEFE058]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Modifier__69FBBC1F]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__CodeType__690797E6]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__Code__681373AD]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__CodeTextS__671F4F74]
GO
ALTER TABLE [dbo].[Codes] DROP CONSTRAINT [DF__Codes__CodeText__662B2B3B]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] DROP CONSTRAINT [DF__ClinicalR__Categ__6442E2C9]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] DROP CONSTRAINT [DF__ClinicalRul__Uid__634EBE90]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] DROP CONSTRAINT [DF__ClinicalRul__Pid__625A9A57]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] DROP CONSTRAINT [DF__ClinicalRu__Date__6166761E]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Acces__5F7E2DAC]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__WebRe__5E8A0973]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Relea__5D95E53A]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Fundi__5CA1C101]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Devel__5BAD9CC8]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Patie__5AB9788F]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Amc20__59C55456]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Amc20__58D1301D]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__AmcCo__57DD0BE4]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__AmcCo__56E8E7AB]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Amc20__55F4C372]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Amc20__55009F39]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__AmcFl__540C7B00]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__CqmPq__531856C7]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__CqmNq__5224328E]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Cqm20__51300E55]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Cqm20__503BEA1C]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__CqmFl__4F47C5E3]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Passi__4E53A1AA]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalR__Activ__4D5F7D71]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalRul__Pid__4C6B5938]
GO
ALTER TABLE [dbo].[ClinicalRules] DROP CONSTRAINT [DF__ClinicalRule__Id__4B7734FF]
GO
ALTER TABLE [dbo].[ClinicalPlansRules] DROP CONSTRAINT [DF__ClinicalP__RuleI__498EEC8D]
GO
ALTER TABLE [dbo].[ClinicalPlansRules] DROP CONSTRAINT [DF__ClinicalP__PlanI__489AC854]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalP__CqmMe__46B27FE2]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalP__Cqm20__45BE5BA9]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalP__Cqm20__44CA3770]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalP__CqmFl__43D61337]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalP__Norma__42E1EEFE]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalPla__Pid__41EDCAC5]
GO
ALTER TABLE [dbo].[ClinicalPlans] DROP CONSTRAINT [DF__ClinicalPlan__Id__40F9A68C]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__X12Partn__3F115E1A]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__Target__3E1D39E1]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__ProcessF__3D2915A8]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__ProcessT__3C34F16F]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__BillTime__3B40CD36]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__BillProc__3A4CA8FD]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__PayerTyp__395884C4]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__Status__3864608B]
GO
ALTER TABLE [dbo].[Claims] DROP CONSTRAINT [DF__Claims__PayerId__37703C52]
GO
ALTER TABLE [dbo].[chartTracker] DROP CONSTRAINT [DF__chartTrac__ctLoc__3587F3E0]
GO
ALTER TABLE [dbo].[chartTracker] DROP CONSTRAINT [DF__chartTrac__ctUse__3493CFA7]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__times__32AB8735]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__delet__31B762FC]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__userI__30C33EC3]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__formT__2FCF1A8A]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__formT__2EDAF651]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__formD__2DE6D218]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__ccdaC__2CF2ADDF]
GO
ALTER TABLE [dbo].[ccdaTableMapping] DROP CONSTRAINT [DF__ccdaTable__ccdaC__2BFE89A6]
GO
ALTER TABLE [dbo].[ccdaSections] DROP CONSTRAINT [DF__ccdaSecti__ccdaS__2A164134]
GO
ALTER TABLE [dbo].[ccdaSections] DROP CONSTRAINT [DF__ccdaSecti__ccdaS__29221CFB]
GO
ALTER TABLE [dbo].[ccdaSections] DROP CONSTRAINT [DF__ccdaSecti__ccdaS__282DF8C2]
GO
ALTER TABLE [dbo].[ccdaSections] DROP CONSTRAINT [DF__ccdaSecti__ccdaC__2739D489]
GO
ALTER TABLE [dbo].[ccdaFieldMapping] DROP CONSTRAINT [DF__ccdaField__ccdaF__25518C17]
GO
ALTER TABLE [dbo].[ccdaFieldMapping] DROP CONSTRAINT [DF__ccdaField__table__245D67DE]
GO
ALTER TABLE [dbo].[ccdaComponents] DROP CONSTRAINT [DF__ccdaCompo__ccdaC__22751F6C]
GO
ALTER TABLE [dbo].[ccdaComponents] DROP CONSTRAINT [DF__ccdaCompo__ccdaC__2180FB33]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__dboTransfe__1F98B2C1]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__Transfer__1EA48E88]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__View__1DB06A4F]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__couchRevid__1CBC4616]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__couchDocid__1BC821DD]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__userId__1AD3FDA4]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__updatedDat__19DFD96B]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__status__18EBB532]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__time__17F790F9]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__encounter__17036CC0]
GO
ALTER TABLE [dbo].[ccda] DROP CONSTRAINT [DF__ccda__pid__160F4887]
GO
ALTER TABLE [dbo].[CategoriesToDocuments] DROP CONSTRAINT [DF__Categorie__Docum__14270015]
GO
ALTER TABLE [dbo].[CategoriesToDocuments] DROP CONSTRAINT [DF__Categorie__Categ__1332DBDC]
GO
ALTER TABLE [dbo].[CategoriesSeq] DROP CONSTRAINT [DF__CategoriesSe__Id__114A936A]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categories__Rght__0F624AF8]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categories__Lft__0E6E26BF]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categorie__Paren__0D7A0286]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categorie__Value__0C85DE4D]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categories__Name__0B91BA14]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [DF__Categories__Id__0A9D95DB]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Externa__08B54D69]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Notecod__07C12930]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__NdcInfo__06CD04F7]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__X12Part__05D8E0BE]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Target__04E4BC85]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Justify__03F0984C]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Fee__02FC7413]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Units__02084FDA]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Modifie__01142BA1]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Process__00200768]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Process__7F2BE32F]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__BillDat__7E37BEF6]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__BillPro__7D439ABD]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__PayerId__7C4F7684]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Activit__7B5B524B]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Billed__7A672E12]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Encount__797309D9]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Authori__787EE5A0]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Groupna__778AC167]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__User__76969D2E]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Provide__75A278F5]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Pid__74AE54BC]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Code__73BA3083]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__CodeTyp__72C60C4A]
GO
ALTER TABLE [dbo].[Billing] DROP CONSTRAINT [DF__Billing__Date__71D1E811]
GO
ALTER TABLE [dbo].[Batchcom] DROP CONSTRAINT [DF__Batchcom__MsgDat__6FE99F9F]
GO
ALTER TABLE [dbo].[Batchcom] DROP CONSTRAINT [DF__Batchcom__MsgSub__6EF57B66]
GO
ALTER TABLE [dbo].[Batchcom] DROP CONSTRAINT [DF__Batchcom__MsgTyp__6E01572D]
GO
ALTER TABLE [dbo].[Batchcom] DROP CONSTRAINT [DF__Batchcom__SentBy__6D0D32F4]
GO
ALTER TABLE [dbo].[Batchcom] DROP CONSTRAINT [DF__Batchcom__Patien__6C190EBB]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__SortO__6A30C649]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__Requi__693CA210]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__Execu__68487DD7]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__NextR__6754599E]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__Runni__66603565]
GO
ALTER TABLE [dbo].[BackgroundServices] DROP CONSTRAINT [DF__Backgroun__Activ__656C112C]
GO
ALTER TABLE [dbo].[AutomaticNotification] DROP CONSTRAINT [DF__AutomaticN__Type__6383C8BA]
GO
ALTER TABLE [dbo].[AuditMaster] DROP CONSTRAINT [DF__AuditMast__Creat__619B8048]
GO
ALTER TABLE [dbo].[AuditDetails] DROP CONSTRAINT [DF__AuditDeta__Entry__5FB337D6]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__creat__5DCAEF64]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__payTo__5CD6CB2B]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__depos__5BE2A6F2]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__check__5AEE82B9]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__refer__59FA5E80]
GO
ALTER TABLE [dbo].[arSession] DROP CONSTRAINT [DF__arSession__close__59063A47]
GO
ALTER TABLE [dbo].[Array] DROP CONSTRAINT [DF__Array__ssma$rowi__571DF1D5]
GO
ALTER TABLE [dbo].[Array] DROP CONSTRAINT [DF__Array__ArrayKey__5629CD9C]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivit__reaso__5441852A]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivit__adjAm__534D60F1]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivit__payAm__52593CB8]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivity__memo__5165187F]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivit__modif__5070F446]
GO
ALTER TABLE [dbo].[arActivity] DROP CONSTRAINT [DF__arActivit__CodeT__4F7CD00D]
GO
ALTER TABLE [dbo].[AmendmentsHistory] DROP CONSTRAINT [DF__Amendment__ssma$__4D94879B]
GO
ALTER TABLE [dbo].[AmendmentsHistory] DROP CONSTRAINT [DF__Amendment__Creat__4CA06362]
GO
ALTER TABLE [dbo].[AmendmentsHistory] DROP CONSTRAINT [DF__Amendment__Amend__4BAC3F29]
GO
ALTER TABLE [dbo].[Amendments] DROP CONSTRAINT [DF__Amendment__Modif__49C3F6B7]
GO
ALTER TABLE [dbo].[Amendments] DROP CONSTRAINT [DF__Amendment__Creat__48CFD27E]
GO
ALTER TABLE [dbo].[Amendments] DROP CONSTRAINT [DF__Amendment__Modif__47DBAE45]
GO
ALTER TABLE [dbo].[Amendments] DROP CONSTRAINT [DF__Amendment__Amend__46E78A0C]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__ssma$__44FF419A]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__DateC__440B1D61]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__DateC__4316F928]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__MapId__4222D4EF]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__MapCa__412EB0B6]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscData__Pid__403A8C7D]
GO
ALTER TABLE [dbo].[AmcMiscData] DROP CONSTRAINT [DF__AmcMiscDa__AmcId__3F466844]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Forei__3D5E1FD2]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Count__3C69FB99]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__PlusF__3B75D760]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Zip__3A81B327]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__State__398D8EEE]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__City__38996AB5]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Line2__37A5467C]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Line1__36B12243]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [DF__Addresses__Id__35BCFE0A]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[Transactions]
GO
/****** Object:  Index [ListsId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ListsId] ON [dbo].[SyndromicSurveillance]
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Id] ON [dbo].[RuleTarget]
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Id] ON [dbo].[RuleReminder]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[RulePatientData]
GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Category] ON [dbo].[RulePatientData]
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Id] ON [dbo].[RuleFilter]
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Id] ON [dbo].[RuleAction]
GO
/****** Object:  Index [ReportId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ReportId] ON [dbo].[ReportItemized]
GO
/****** Object:  Index [parent]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [parent] ON [dbo].[ProcedureType]
GO
/****** Object:  Index [procedureReportId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [procedureReportId] ON [dbo].[ProcedureResult]
GO
/****** Object:  Index [procedureOrderId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [procedureOrderId] ON [dbo].[ProcedureReport]
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PatientId] ON [dbo].[ProcedureOrder]
GO
/****** Object:  Index [datepid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [datepid] ON [dbo].[ProcedureOrder]
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PatientId] ON [dbo].[Prescriptions]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[Pnotes]
GO
/****** Object:  Index [ForeignField]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignField] ON [dbo].[PmaRelation]
GO
/****** Object:  Index [DbName]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [DbName] ON [dbo].[PmaPdfPages]
GO
/****** Object:  Index [Username]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Username] ON [dbo].[PmaHistory]
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignId] ON [dbo].[PhoneNumbers]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[Payments]
GO
/****** Object:  Index [PtTrackerId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PtTrackerId] ON [dbo].[PatientTrackerElement]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[PatientTracker]
GO
/****** Object:  Index [Eid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Eid] ON [dbo].[PatientTracker]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[PatientReminders]
GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Category] ON [dbo].[PatientReminders]
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Id] ON [dbo].[PatientData]
GO
/****** Object:  Index [BasicCat]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [BasicCat] ON [dbo].[OpendboPostcalendarTopics]
GO
/****** Object:  Index [PcEventDate]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PcEventDate] ON [dbo].[OpendboPostcalendarEvents]
GO
/****** Object:  Index [BasicEvent]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [BasicEvent] ON [dbo].[OpendboPostcalendarEvents]
GO
/****** Object:  Index [BasicCat]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [BasicCat] ON [dbo].[OpendboPostcalendarCategories]
GO
/****** Object:  Index [PnName]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PnName] ON [dbo].[OpendboModuleVars]
GO
/****** Object:  Index [PnModname]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PnModname] ON [dbo].[OpendboModuleVars]
GO
/****** Object:  Index [ForeignId2]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignId2] ON [dbo].[Notes]
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignId] ON [dbo].[Notes]
GO
/****** Object:  Index [Date]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Date] ON [dbo].[Notes]
GO
/****** Object:  Index [Type]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Type] ON [dbo].[Lists]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[Lists]
GO
/****** Object:  Index [ConsId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ConsId] ON [dbo].[LangDefinitions]
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PatientId] ON [dbo].[Immunizations]
GO
/****** Object:  Index [SgCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [SgCode] ON [dbo].[Icd9SgCode]
GO
/****** Object:  Index [FormattedSgCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [FormattedSgCode] ON [dbo].[Icd9SgCode]
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Active] ON [dbo].[Icd9SgCode]
GO
/****** Object:  Index [FormattedDxCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [FormattedDxCode] ON [dbo].[Icd9DxCode]
GO
/****** Object:  Index [DxCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [DxCode] ON [dbo].[Icd9DxCode]
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Active] ON [dbo].[Icd9DxCode]
GO
/****** Object:  Index [PcsCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PcsCode] ON [dbo].[Icd10PcsOrderCode]
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Active] ON [dbo].[Icd10PcsOrderCode]
GO
/****** Object:  Index [FormattedDxCode]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [FormattedDxCode] ON [dbo].[Icd10DxOrderCode]
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Active] ON [dbo].[Icd10DxOrderCode]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[HistoryData]
GO
/****** Object:  Index [key2]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [key2] ON [dbo].[gprelations]
GO
/****** Object:  Index [IDXCOUNTRIESNAME]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [IDXCOUNTRIESNAME] ON [dbo].[GeoCountryReference]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[FormVitals]
GO
/****** Object:  Index [PidEncounter]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PidEncounter] ON [dbo].[Forms]
GO
/****** Object:  Index [FormId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [FormId] ON [dbo].[Forms]
GO
/****** Object:  Index [PidEncounter]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PidEncounter] ON [dbo].[FormEncounter]
GO
/****** Object:  Index [EncounterDate]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [EncounterDate] ON [dbo].[FormEncounter]
GO
/****** Object:  Index [Uid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Uid] ON [dbo].[FacilityUserIds]
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PatientId] ON [dbo].[ExtendedLog]
GO
/****** Object:  Index [Tid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Tid] ON [dbo].[EsignSignatures]
GO
/****** Object:  Index [Table]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Table] ON [dbo].[EsignSignatures]
GO
/****** Object:  Index [RuleEncId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [RuleEncId] ON [dbo].[EncCategoryMap]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[EmployerData]
GO
/****** Object:  Index [InsuranceId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [InsuranceId] ON [dbo].[EligibilityVerification]
GO
/****** Object:  Index [Revision]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Revision] ON [dbo].[Documents]
GO
/****** Object:  Index [Owner]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Owner] ON [dbo].[Documents]
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignId] ON [dbo].[Documents]
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [PatientId] ON [dbo].[DirectMessageLog]
GO
/****** Object:  Index [MsgId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [MsgId] ON [dbo].[DirectMessageLog]
GO
/****** Object:  Index [ToId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ToId] ON [dbo].[DatedRemindersLink]
GO
/****** Object:  Index [DrId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [DrId] ON [dbo].[DatedRemindersLink]
GO
/****** Object:  Index [DrFromID]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [DrFromID] ON [dbo].[DatedReminders]
GO
/****** Object:  Index [Parent]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Parent] ON [dbo].[Config]
GO
/****** Object:  Index [Lft]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Lft] ON [dbo].[Config]
GO
/****** Object:  Index [CodeType]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [CodeType] ON [dbo].[Codes]
GO
/****** Object:  Index [Code]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Code] ON [dbo].[Codes]
GO
/****** Object:  Index [Uid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Uid] ON [dbo].[ClinicalRulesLog]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[ClinicalRulesLog]
GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Category] ON [dbo].[ClinicalRulesLog]
GO
/****** Object:  Index [Parent]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Parent] ON [dbo].[Categories]
GO
/****** Object:  Index [Lft]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Lft] ON [dbo].[Categories]
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [Pid] ON [dbo].[Billing]
GO
/****** Object:  Index [userClosed]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [userClosed] ON [dbo].[arSession]
GO
/****** Object:  Index [depositDate]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [depositDate] ON [dbo].[arSession]
GO
/****** Object:  Index [sessionId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [sessionId] ON [dbo].[arActivity]
GO
/****** Object:  Index [amendmentHistoryId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [amendmentHistoryId] ON [dbo].[AmendmentsHistory]
GO
/****** Object:  Index [amendmentPid]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [amendmentPid] ON [dbo].[Amendments]
GO
/****** Object:  Index [AmcId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [AmcId] ON [dbo].[AmcMiscData]
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP INDEX [ForeignId] ON [dbo].[Addresses]
GO
/****** Object:  Table [dbo].[X12Partners]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[X12Partners]
GO
/****** Object:  Table [dbo].[version]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[version]
GO
/****** Object:  Table [dbo].[Valueset]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[Valueset]
GO
/****** Object:  Table [dbo].[UsersSecure]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[UsersSecure]
GO
/****** Object:  Table [dbo].[UsersFacility]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[UsersFacility]
GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[UserSettings]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[TemplateUsers]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[TemplateUsers]
GO
/****** Object:  Table [dbo].[SyndromicSurveillance]    Script Date: 6/25/2016 11:22:39 PM ******/
DROP TABLE [dbo].[SyndromicSurveillance]
GO
/****** Object:  Table [dbo].[SupportedExternalDataloads]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[SupportedExternalDataloads]
GO
/****** Object:  Table [dbo].[StandardizedTablesTrack]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[StandardizedTablesTrack]
GO
/****** Object:  Table [dbo].[SharedAttributes]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[SharedAttributes]
GO
/****** Object:  Table [dbo].[Sequences]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[Sequences]
GO
/****** Object:  Table [dbo].[RuleTarget]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RuleTarget]
GO
/****** Object:  Table [dbo].[RuleReminder]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RuleReminder]
GO
/****** Object:  Table [dbo].[RulePatientData]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RulePatientData]
GO
/****** Object:  Table [dbo].[RuleFilter]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RuleFilter]
GO
/****** Object:  Table [dbo].[RuleActionItem]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RuleActionItem]
GO
/****** Object:  Table [dbo].[RuleAction]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[RuleAction]
GO
/****** Object:  Table [dbo].[ReportResults]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[ReportResults]
GO
/****** Object:  Table [dbo].[ReportItemized]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[ReportItemized]
GO
/****** Object:  Table [dbo].[Registry]    Script Date: 6/25/2016 11:22:40 PM ******/
DROP TABLE [dbo].[Registry]
GO
/****** Object:  Table [dbo].[ProductWarehouse]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProductWarehouse]
GO
/****** Object:  Table [dbo].[ProcedureType]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureType]
GO
/****** Object:  Table [dbo].[ProcedureResult]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureResult]
GO
/****** Object:  Table [dbo].[ProcedureReport]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureReport]
GO
/****** Object:  Table [dbo].[ProcedureQuestions]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureQuestions]
GO
/****** Object:  Table [dbo].[ProcedureProviders]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureProviders]
GO
/****** Object:  Table [dbo].[ProcedureOrderCode]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureOrderCode]
GO
/****** Object:  Table [dbo].[ProcedureOrder]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureOrder]
GO
/****** Object:  Table [dbo].[ProcedureAnswers]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[ProcedureAnswers]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[Prices]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[Prescriptions]
GO
/****** Object:  Table [dbo].[Pnotes]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[Pnotes]
GO
/****** Object:  Table [dbo].[PmaTableInfo]    Script Date: 6/25/2016 11:22:41 PM ******/
DROP TABLE [dbo].[PmaTableInfo]
GO
/****** Object:  Table [dbo].[PmaTableCoords]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaTableCoords]
GO
/****** Object:  Table [dbo].[PmaRelation]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaRelation]
GO
/****** Object:  Table [dbo].[PmaPdfPages]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaPdfPages]
GO
/****** Object:  Table [dbo].[PmaHistory]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaHistory]
GO
/****** Object:  Table [dbo].[PmaColumnInfo]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaColumnInfo]
GO
/****** Object:  Table [dbo].[PmaBookmark]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PmaBookmark]
GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PhoneNumbers]
GO
/****** Object:  Table [dbo].[Pharmacies]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[Pharmacies]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[Payments]
GO
/****** Object:  Table [dbo].[PaymentGatewayDetails]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PaymentGatewayDetails]
GO
/****** Object:  Table [dbo].[PatientTrackerElement]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientTrackerElement]
GO
/****** Object:  Table [dbo].[PatientTracker]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientTracker]
GO
/****** Object:  Table [dbo].[PatientReminders]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientReminders]
GO
/****** Object:  Table [dbo].[PatientPortalMenu]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientPortalMenu]
GO
/****** Object:  Table [dbo].[PatientData]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientData]
GO
/****** Object:  Table [dbo].[PatientAccessOnsite]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientAccessOnsite]
GO
/****** Object:  Table [dbo].[PatientAccessOffsite]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[PatientAccessOffsite]
GO
/****** Object:  Table [dbo].[OpendboSessionInfo]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboSessionInfo]
GO
/****** Object:  Table [dbo].[OpendboPostcalendarTopics]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboPostcalendarTopics]
GO
/****** Object:  Table [dbo].[OpendboPostcalendarLimits]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboPostcalendarLimits]
GO
/****** Object:  Table [dbo].[OpendboPostcalendarEvents]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboPostcalendarEvents]
GO
/****** Object:  Table [dbo].[OpendboPostcalendarCategories]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboPostcalendarCategories]
GO
/****** Object:  Table [dbo].[OpendboModuleVars]    Script Date: 6/25/2016 11:22:42 PM ******/
DROP TABLE [dbo].[OpendboModuleVars]
GO
/****** Object:  Table [dbo].[OpendboModules]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[OpendboModules]
GO
/****** Object:  Table [dbo].[Onotes]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[Onotes]
GO
/****** Object:  Table [dbo].[NotificationSettings]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[NotificationSettings]
GO
/****** Object:  Table [dbo].[NotificationLog]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[NotificationLog]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[Notes]
GO
/****** Object:  Table [dbo].[ModulesSettings]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[ModulesSettings]
GO
/****** Object:  Table [dbo].[ModulesHooksSettings]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[ModulesHooksSettings]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 6/25/2016 11:22:43 PM ******/
DROP TABLE [dbo].[Modules]
GO
/****** Object:  Table [dbo].[ModuleConfiguration]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[ModuleConfiguration]
GO
/****** Object:  Table [dbo].[ModuleAclUserSettings]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[ModuleAclUserSettings]
GO
/****** Object:  Table [dbo].[ModuleAclSections]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[ModuleAclSections]
GO
/****** Object:  Table [dbo].[ModuleAclGroupSettings]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[ModuleAclGroupSettings]
GO
/****** Object:  Table [dbo].[MiscAddressBook]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[MiscAddressBook]
GO
/****** Object:  Table [dbo].[LogCommentEncrypt]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[LogCommentEncrypt]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/25/2016 11:22:44 PM ******/
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ListsTouch]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[ListsTouch]
GO
/****** Object:  Table [dbo].[Lists]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[Lists]
GO
/****** Object:  Table [dbo].[ListOptions]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[ListOptions]
GO
/****** Object:  Table [dbo].[LbtData]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LbtData]
GO
/****** Object:  Table [dbo].[LbfData]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LbfData]
GO
/****** Object:  Table [dbo].[LayoutOptions]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LayoutOptions]
GO
/****** Object:  Table [dbo].[LangLanguages]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LangLanguages]
GO
/****** Object:  Table [dbo].[LangDefinitions]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LangDefinitions]
GO
/****** Object:  Table [dbo].[LangCustom]    Script Date: 6/25/2016 11:22:45 PM ******/
DROP TABLE [dbo].[LangCustom]
GO
/****** Object:  Table [dbo].[LangConstants]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[LangConstants]
GO
/****** Object:  Table [dbo].[IssueTypes]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[IssueTypes]
GO
/****** Object:  Table [dbo].[IssueEncounter]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[IssueEncounter]
GO
/****** Object:  Table [dbo].[IntegrationMapping]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[IntegrationMapping]
GO
/****** Object:  Table [dbo].[InsuranceNumbers]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[InsuranceNumbers]
GO
/****** Object:  Table [dbo].[InsuranceData]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[InsuranceData]
GO
/****** Object:  Table [dbo].[InsuranceCompanies]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[InsuranceCompanies]
GO
/****** Object:  Table [dbo].[Immunizations]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[Immunizations]
GO
/****** Object:  Table [dbo].[ImmunizationObservation]    Script Date: 6/25/2016 11:22:46 PM ******/
DROP TABLE [dbo].[ImmunizationObservation]
GO
/****** Object:  Table [dbo].[Icd9SgLongCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd9SgLongCode]
GO
/****** Object:  Table [dbo].[Icd9SgCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd9SgCode]
GO
/****** Object:  Table [dbo].[Icd9DxLongCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd9DxLongCode]
GO
/****** Object:  Table [dbo].[Icd9DxCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd9DxCode]
GO
/****** Object:  Table [dbo].[Icd10ReimbrPcs910]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10ReimbrPcs910]
GO
/****** Object:  Table [dbo].[Icd10ReimbrDx910]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10ReimbrDx910]
GO
/****** Object:  Table [dbo].[Icd10PcsOrderCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10PcsOrderCode]
GO
/****** Object:  Table [dbo].[Icd10GemPcs910]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10GemPcs910]
GO
/****** Object:  Table [dbo].[Icd10GemPcs109]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10GemPcs109]
GO
/****** Object:  Table [dbo].[Icd10GemDx910]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10GemDx910]
GO
/****** Object:  Table [dbo].[Icd10GemDx109]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10GemDx109]
GO
/****** Object:  Table [dbo].[Icd10DxOrderCode]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[Icd10DxOrderCode]
GO
/****** Object:  Table [dbo].[HistoryData]    Script Date: 6/25/2016 11:22:47 PM ******/
DROP TABLE [dbo].[HistoryData]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[Groups]
GO
/****** Object:  Table [dbo].[gprelations]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[gprelations]
GO
/****** Object:  Table [dbo].[Globals]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[Globals]
GO
/****** Object:  Table [dbo].[GeoZoneReference]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[GeoZoneReference]
GO
/****** Object:  Table [dbo].[GeoCountryReference]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[GeoCountryReference]
GO
/****** Object:  Table [dbo].[FormVitals]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[FormVitals]
GO
/****** Object:  Table [dbo].[FormSoap]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[FormSoap]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[Forms]
GO
/****** Object:  Table [dbo].[FormRos]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[FormRos]
GO
/****** Object:  Table [dbo].[FormReviewofs]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[FormReviewofs]
GO
/****** Object:  Table [dbo].[FormObservation]    Script Date: 6/25/2016 11:22:48 PM ******/
DROP TABLE [dbo].[FormObservation]
GO
/****** Object:  Table [dbo].[FormMiscBillingOptions]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormMiscBillingOptions]
GO
/****** Object:  Table [dbo].[FormFunctionalCognitiveStatus]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormFunctionalCognitiveStatus]
GO
/****** Object:  Table [dbo].[FormEncounter]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormEncounter]
GO
/****** Object:  Table [dbo].[FormDictation]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormDictation]
GO
/****** Object:  Table [dbo].[FormClinicalInstructions]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormClinicalInstructions]
GO
/****** Object:  Table [dbo].[FormCarePlan]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FormCarePlan]
GO
/****** Object:  Table [dbo].[FeeSheetOptions]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FeeSheetOptions]
GO
/****** Object:  Table [dbo].[FacilityUserIds]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[FacilityUserIds]
GO
/****** Object:  Table [dbo].[Facility]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[Facility]
GO
/****** Object:  Table [dbo].[ExternalProcedures]    Script Date: 6/25/2016 11:22:49 PM ******/
DROP TABLE [dbo].[ExternalProcedures]
GO
/****** Object:  Table [dbo].[ExternalEncounters]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[ExternalEncounters]
GO
/****** Object:  Table [dbo].[ExtendedLog]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[ExtendedLog]
GO
/****** Object:  Table [dbo].[EsignSignatures]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[EsignSignatures]
GO
/****** Object:  Table [dbo].[ErxTtlTouch]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[ErxTtlTouch]
GO
/****** Object:  Table [dbo].[EncCategoryMap]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[EncCategoryMap]
GO
/****** Object:  Table [dbo].[EmployerData]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[EmployerData]
GO
/****** Object:  Table [dbo].[EligibilityVerification]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[EligibilityVerification]
GO
/****** Object:  Table [dbo].[EligibilityResponse]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[EligibilityResponse]
GO
/****** Object:  Table [dbo].[DrugTemplates]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[DrugTemplates]
GO
/****** Object:  Table [dbo].[DrugSales]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[DrugSales]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[Drugs]
GO
/****** Object:  Table [dbo].[DrugInventory]    Script Date: 6/25/2016 11:22:50 PM ******/
DROP TABLE [dbo].[DrugInventory]
GO
/****** Object:  Table [dbo].[DocumentsLegalMaster]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DocumentsLegalMaster]
GO
/****** Object:  Table [dbo].[DocumentsLegalDetail]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DocumentsLegalDetail]
GO
/****** Object:  Table [dbo].[DocumentsLegalCategories]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DocumentsLegalCategories]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[Documents]
GO
/****** Object:  Table [dbo].[DirectMessageLog]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DirectMessageLog]
GO
/****** Object:  Table [dbo].[DatedRemindersLink]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DatedRemindersLink]
GO
/****** Object:  Table [dbo].[DatedReminders]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[DatedReminders]
GO
/****** Object:  Table [dbo].[Customlists]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[Customlists]
GO
/****** Object:  Table [dbo].[ConfigSeq]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[ConfigSeq]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[Config]
GO
/****** Object:  Table [dbo].[codeTypes]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[codeTypes]
GO
/****** Object:  Table [dbo].[Codes]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[Codes]
GO
/****** Object:  Table [dbo].[ClinicalRulesLog]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[ClinicalRulesLog]
GO
/****** Object:  Table [dbo].[ClinicalRules]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[ClinicalRules]
GO
/****** Object:  Table [dbo].[ClinicalPlansRules]    Script Date: 6/25/2016 11:22:51 PM ******/
DROP TABLE [dbo].[ClinicalPlansRules]
GO
/****** Object:  Table [dbo].[ClinicalPlans]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ClinicalPlans]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[Claims]
GO
/****** Object:  Table [dbo].[chartTracker]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[chartTracker]
GO
/****** Object:  Table [dbo].[ccdaTableMapping]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ccdaTableMapping]
GO
/****** Object:  Table [dbo].[ccdaSections]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ccdaSections]
GO
/****** Object:  Table [dbo].[ccdaFieldMapping]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ccdaFieldMapping]
GO
/****** Object:  Table [dbo].[ccdaComponents]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ccdaComponents]
GO
/****** Object:  Table [dbo].[ccda]    Script Date: 6/25/2016 11:22:52 PM ******/
DROP TABLE [dbo].[ccda]
GO
/****** Object:  Table [dbo].[CategoriesToDocuments]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[CategoriesToDocuments]
GO
/****** Object:  Table [dbo].[CategoriesSeq]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[CategoriesSeq]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Billing]
GO
/****** Object:  Table [dbo].[Batchcom]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Batchcom]
GO
/****** Object:  Table [dbo].[BackgroundServices]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[BackgroundServices]
GO
/****** Object:  Table [dbo].[AutomaticNotification]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[AutomaticNotification]
GO
/****** Object:  Table [dbo].[AuditMaster]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[AuditMaster]
GO
/****** Object:  Table [dbo].[AuditDetails]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[AuditDetails]
GO
/****** Object:  Table [dbo].[arSession]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[arSession]
GO
/****** Object:  Table [dbo].[Array]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Array]
GO
/****** Object:  Table [dbo].[arActivity]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[arActivity]
GO
/****** Object:  Table [dbo].[AmendmentsHistory]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[AmendmentsHistory]
GO
/****** Object:  Table [dbo].[Amendments]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Amendments]
GO
/****** Object:  Table [dbo].[AmcMiscData]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[AmcMiscData]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP TABLE [dbo].[Addresses]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$X12Partners$ProcessingFormat]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$NotificationLog$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$NotificationLog$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$LogCommentEncrypt$Encrypt]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$Lists$ErxUploaded]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Lists$ErxSource]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$Lists$ErxSource]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$InsuranceData$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$InsuranceData$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$ErxTtlTouch$Process]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$EligibilityVerification$Deductiblemet]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$EligibilityResponse$ResponseStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Documents$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$Documents$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[str2enum$AutomaticNotification$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$X12Partners$ProcessingFormat]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$NotificationLog$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$NotificationLog$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$LogCommentEncrypt$Encrypt]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$Lists$ErxUploaded]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Lists$ErxSource]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$Lists$ErxSource]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$InsuranceData$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$InsuranceData$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$ErxTtlTouch$Process]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$EligibilityVerification$Deductiblemet]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$EligibilityResponse$ResponseStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Documents$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$Documents$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[norm_enum$AutomaticNotification$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$X12Partners$ProcessingFormat]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$NotificationLog$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$NotificationLog$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$LogCommentEncrypt$Encrypt]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$Lists$ErxUploaded]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Lists$ErxSource]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$Lists$ErxSource]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$InsuranceData$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$InsuranceData$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$ErxTtlTouch$Process]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$EligibilityVerification$Deductiblemet]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$EligibilityResponse$ResponseStatus]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Documents$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$Documents$Type]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP FUNCTION [dbo].[enum2str$AutomaticNotification$Type]
GO
USE [master]
GO
/****** Object:  Database [transfer]    Script Date: 6/25/2016 11:22:53 PM ******/
DROP DATABASE [transfer]
GO
/****** Object:  Database [transfer]    Script Date: 6/25/2016 11:22:53 PM ******/
CREATE DATABASE [transfer]
GO
ALTER DATABASE [transfer] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transfer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transfer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transfer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transfer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transfer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transfer] SET ARITHABORT OFF 
GO
ALTER DATABASE [transfer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transfer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transfer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transfer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transfer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transfer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transfer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transfer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transfer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transfer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [transfer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transfer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transfer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transfer] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [transfer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transfer] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [transfer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transfer] SET RECOVERY FULL 
GO
ALTER DATABASE [transfer] SET  MULTI_USER 
GO
ALTER DATABASE [transfer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transfer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transfer] SET QUERY_STORE = OFF
GO
USE [transfer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [transfer]
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$AutomaticNotification$Type] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'SMS'
            WHEN 2 THEN 'Email'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Documents$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$Documents$Type] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'FileUrl'
            WHEN 2 THEN 'Blob'
            WHEN 3 THEN 'WebUrl'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$EligibilityResponse$ResponseStatus] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'A'
            WHEN 2 THEN 'D'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$EligibilityVerification$Deductiblemet] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Y'
            WHEN 2 THEN 'N'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$ErxTtlTouch$Process] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Allergies'
            WHEN 2 THEN 'Medications'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$InsuranceData$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$InsuranceData$Type] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Primary'
            WHEN 2 THEN 'Secondary'
            WHEN 3 THEN 'Tertiary'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Lists$ErxSource]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$Lists$ErxSource] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN '0'
            WHEN 2 THEN '1'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$Lists$ErxUploaded] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN '0'
            WHEN 2 THEN '1'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$LogCommentEncrypt$Encrypt] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Yes'
            WHEN 2 THEN 'No'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$NotificationLog$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$NotificationLog$Type] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'SMS'
            WHEN 2 THEN 'Email'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[enum2str$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[enum2str$X12Partners$ProcessingFormat] 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Standard'
            WHEN 2 THEN 'Medi-cal'
            WHEN 3 THEN 'Cms'
            WHEN 4 THEN 'Proxymed'
            ELSE ''
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$AutomaticNotification$Type] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$AutomaticNotification$Type(dbo.str2enum$AutomaticNotification$Type(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Documents$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$Documents$Type] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$Documents$Type(dbo.str2enum$Documents$Type(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$EligibilityResponse$ResponseStatus] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$EligibilityResponse$ResponseStatus(dbo.str2enum$EligibilityResponse$ResponseStatus(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$EligibilityVerification$Deductiblemet] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$EligibilityVerification$Deductiblemet(dbo.str2enum$EligibilityVerification$Deductiblemet(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$ErxTtlTouch$Process] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$ErxTtlTouch$Process(dbo.str2enum$ErxTtlTouch$Process(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$InsuranceData$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$InsuranceData$Type] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$InsuranceData$Type(dbo.str2enum$InsuranceData$Type(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Lists$ErxSource]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$Lists$ErxSource] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$Lists$ErxSource(dbo.str2enum$Lists$ErxSource(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$Lists$ErxUploaded] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$Lists$ErxUploaded(dbo.str2enum$Lists$ErxUploaded(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$LogCommentEncrypt$Encrypt] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$LogCommentEncrypt$Encrypt(dbo.str2enum$LogCommentEncrypt$Encrypt(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$NotificationLog$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$NotificationLog$Type] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$NotificationLog$Type(dbo.str2enum$NotificationLog$Type(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[norm_enum$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[norm_enum$X12Partners$ProcessingFormat] 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$X12Partners$ProcessingFormat(dbo.str2enum$X12Partners$ProcessingFormat(@setval))
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$AutomaticNotification$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$AutomaticNotification$Type] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'SMS' THEN 1
            WHEN 'Email' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Documents$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$Documents$Type] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'FileUrl' THEN 1
            WHEN 'Blob' THEN 2
            WHEN 'WebUrl' THEN 3
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$EligibilityResponse$ResponseStatus]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$EligibilityResponse$ResponseStatus] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'A' THEN 1
            WHEN 'D' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$EligibilityVerification$Deductiblemet]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$EligibilityVerification$Deductiblemet] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Y' THEN 1
            WHEN 'N' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$ErxTtlTouch$Process]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$ErxTtlTouch$Process] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Allergies' THEN 1
            WHEN 'Medications' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$InsuranceData$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$InsuranceData$Type] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Primary' THEN 1
            WHEN 'Secondary' THEN 2
            WHEN 'Tertiary' THEN 3
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Lists$ErxSource]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$Lists$ErxSource] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN '0' THEN 1
            WHEN '1' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$Lists$ErxUploaded]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$Lists$ErxUploaded] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN '0' THEN 1
            WHEN '1' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$LogCommentEncrypt$Encrypt]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$LogCommentEncrypt$Encrypt] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Yes' THEN 1
            WHEN 'No' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$NotificationLog$Type]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$NotificationLog$Type] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'SMS' THEN 1
            WHEN 'Email' THEN 2
            ELSE 0
         END
   END
GO
/****** Object:  UserDefinedFunction [dbo].[str2enum$X12Partners$ProcessingFormat]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[str2enum$X12Partners$ProcessingFormat] 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Standard' THEN 1
            WHEN 'Medi-cal' THEN 2
            WHEN 'Cms' THEN 3
            WHEN 'Proxymed' THEN 4
            ELSE 0
         END
   END
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/25/2016 11:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[Line1] [nvarchar](255) NULL,
	[Line2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](35) NULL,
	[Zip] [nvarchar](10) NULL,
	[PlusFour] [nvarchar](4) NULL,
	[Country] [nvarchar](255) NULL,
	[ForeignId] [int] NULL,
 CONSTRAINT [PK_Addresses_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AmcMiscData]    Script Date: 6/25/2016 11:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmcMiscData](
	[AmcId] [nvarchar](31) NOT NULL,
	[Pid] [bigint] NULL,
	[MapCategory] [nvarchar](255) NOT NULL,
	[MapId] [bigint] NOT NULL,
	[DateCreated] [datetime2](0) NULL,
	[DateCompleted] [datetime2](0) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AmcMiscData_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Amendments]    Script Date: 6/25/2016 11:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amendments](
	[AmendmentId] [int] IDENTITY(1,1) NOT NULL,
	[AmendmentDate] [date] NOT NULL,
	[AmendmentBy] [nvarchar](50) NOT NULL,
	[AmendmentStatus] [nvarchar](50) NULL,
	[Pid] [int] NOT NULL,
	[AmendmentDesc] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_Amendments_AmendmentId] PRIMARY KEY CLUSTERED 
(
	[AmendmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AmendmentsHistory]    Script Date: 6/25/2016 11:23:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmendmentsHistory](
	[AmendmentId] [int] IDENTITY(1,1) NOT NULL,
	[AmendmentNote] [nvarchar](max) NULL,
	[AmendmentStatus] [nvarchar](50) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AmendmentsHistory_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[arActivity]    Script Date: 6/25/2016 11:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arActivity](
	[pid] [int] NOT NULL,
	[encounter] [int] NOT NULL,
	[sequenceNo] [bigint] NOT NULL,
	[CodeType] [nvarchar](12) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[modifier] [nvarchar](12) NOT NULL,
	[payerType] [int] NOT NULL,
	[postTime] [datetime2](0) NOT NULL,
	[postUser] [int] NOT NULL,
	[sessionId] [bigint] NOT NULL,
	[memo] [nvarchar](255) NOT NULL,
	[payAmount] [decimal](12, 2) NOT NULL,
	[adjAmount] [decimal](12, 2) NOT NULL,
	[modifiedTime] [datetime2](0) NOT NULL,
	[followUp] [nchar](1) NOT NULL,
	[followUpNote] [nvarchar](max) NULL,
	[accountCode] [nvarchar](15) NOT NULL,
	[reasonCode] [nvarchar](255) NULL,
 CONSTRAINT [PK_arActivity_pid] PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[encounter] ASC,
	[sequenceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Array]    Script Date: 6/25/2016 11:23:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Array](
	[ArrayKey] [nvarchar](255) NULL,
	[ArrayValue] [nvarchar](max) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Array_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[arSession]    Script Date: 6/25/2016 11:23:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arSession](
	[sessionId] [bigint] IDENTITY(1,1) NOT NULL,
	[payerId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[closed] [smallint] NOT NULL,
	[reference] [nvarchar](255) NOT NULL,
	[checkDate] [date] NULL,
	[depositDate] [date] NULL,
	[payTotal] [decimal](12, 2) NOT NULL,
	[createdTime] [datetime] NOT NULL,
	[modifiedTime] [datetime2](0) NOT NULL,
	[globalAmount] [decimal](12, 2) NOT NULL,
	[paymentType] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[adjustmentCode] [nvarchar](50) NOT NULL,
	[postToDate] [date] NOT NULL,
	[patientId] [int] NOT NULL,
	[paymentMethod] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_arSession_sessionId] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AuditDetails]    Script Date: 6/25/2016 11:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[FieldName] [nvarchar](100) NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
	[AuditMasterId] [bigint] NOT NULL,
	[EntryIdentification] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AuditDetails_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AuditMaster]    Script Date: 6/25/2016 11:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ApprovalStatus] [smallint] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime2](0) NOT NULL,
	[IpAddress] [nvarchar](100) NOT NULL,
	[Type] [smallint] NOT NULL,
 CONSTRAINT [PK_AuditMaster_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[AutomaticNotification]    Script Date: 6/25/2016 11:23:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomaticNotification](
	[NotificationId] [int] IDENTITY(3,1) NOT NULL,
	[SmsGatewayType] [nvarchar](255) NOT NULL,
	[NextAppDate] [date] NOT NULL,
	[NextAppTime] [nvarchar](10) NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[EmailSender] [nvarchar](100) NOT NULL,
	[EmailSubject] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](5) NOT NULL,
	[NotificationSentDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_AutomaticNotification_NotificationId] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[BackgroundServices]    Script Date: 6/25/2016 11:23:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackgroundServices](
	[Name] [nvarchar](31) NOT NULL,
	[Title] [nvarchar](127) NOT NULL,
	[Active] [smallint] NOT NULL,
	[Running] [smallint] NOT NULL,
	[NextRun] [datetime] NOT NULL,
	[ExecuteInterval] [int] NOT NULL,
	[Function] [nvarchar](127) NOT NULL,
	[RequireOnce] [nvarchar](255) NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_BackgroundServices_Name] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Batchcom]    Script Date: 6/25/2016 11:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batchcom](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[SentBy] [bigint] NOT NULL,
	[MsgType] [nvarchar](60) NULL,
	[MsgSubject] [nvarchar](255) NULL,
	[MsgText] [nvarchar](max) NULL,
	[MsgDateSent] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Batchcom_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Billing]    Script Date: 6/25/2016 11:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[CodeType] [nvarchar](15) NULL,
	[Code] [nvarchar](20) NULL,
	[Pid] [int] NULL,
	[ProviderId] [int] NULL,
	[User] [int] NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Encounter] [int] NULL,
	[CodeText] [nvarchar](max) NULL,
	[Billed] [smallint] NULL,
	[Activity] [smallint] NULL,
	[PayerId] [int] NULL,
	[BillProcess] [smallint] NOT NULL,
	[BillDate] [datetime2](0) NULL,
	[ProcessDate] [datetime2](0) NULL,
	[ProcessFile] [nvarchar](255) NULL,
	[Modifier] [nvarchar](12) NULL,
	[Units] [int] NULL,
	[Fee] [decimal](12, 2) NULL,
	[Justify] [nvarchar](255) NULL,
	[Target] [nvarchar](30) NULL,
	[X12PartnerId] [int] NULL,
	[NdcInfo] [nvarchar](255) NULL,
	[Notecodes] [nvarchar](25) NOT NULL,
	[ExternalId] [nvarchar](20) NULL,
 CONSTRAINT [PK_Billing_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/25/2016 11:23:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Parent] [int] NOT NULL,
	[Lft] [int] NOT NULL,
	[Rght] [int] NOT NULL,
 CONSTRAINT [PK_Categories_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[CategoriesSeq]    Script Date: 6/25/2016 11:23:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesSeq](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_CategoriesSeq_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[CategoriesToDocuments]    Script Date: 6/25/2016 11:23:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesToDocuments](
	[CategoryId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
 CONSTRAINT [PK_CategoriesToDocuments_CategoryId] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ccda]    Script Date: 6/25/2016 11:23:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [bigint] NULL,
	[encounter] [bigint] NULL,
	[ccdaData] [nvarchar](max) NULL,
	[time] [nvarchar](50) NULL,
	[status] [smallint] NULL,
	[updatedDate] [datetime] NOT NULL,
	[userId] [nvarchar](50) NULL,
	[couchDocid] [nvarchar](100) NULL,
	[couchRevid] [nvarchar](100) NULL,
	[View] [smallint] NOT NULL,
	[Transfer] [smallint] NOT NULL,
	[dboTransfer] [smallint] NOT NULL,
 CONSTRAINT [PK_ccda_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [ccda$uniqueKey] UNIQUE NONCLUSTERED 
(
	[pid] ASC,
	[encounter] ASC,
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ccdaComponents]    Script Date: 6/25/2016 11:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccdaComponents](
	[ccdaComponentsId] [int] IDENTITY(23,1) NOT NULL,
	[ccdaComponentsField] [nvarchar](100) NULL,
	[ccdaComponentsName] [nvarchar](100) NULL,
	[ccdaType] [int] NOT NULL,
 CONSTRAINT [PK_ccdaComponents_ccdaComponentsId] PRIMARY KEY CLUSTERED 
(
	[ccdaComponentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ccdaFieldMapping]    Script Date: 6/25/2016 11:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccdaFieldMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tableId] [int] NULL,
	[ccdaField] [nvarchar](100) NULL,
 CONSTRAINT [PK_ccdaFieldMapping_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ccdaSections]    Script Date: 6/25/2016 11:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccdaSections](
	[ccdaSectionsId] [int] IDENTITY(46,1) NOT NULL,
	[ccdaComponentsId] [int] NULL,
	[ccdaSectionsField] [nvarchar](100) NULL,
	[ccdaSectionsName] [nvarchar](100) NULL,
	[ccdaSectionsReqMapping] [smallint] NOT NULL,
 CONSTRAINT [PK_ccdaSections_ccdaSectionsId] PRIMARY KEY CLUSTERED 
(
	[ccdaSectionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ccdaTableMapping]    Script Date: 6/25/2016 11:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ccdaTableMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ccdaComponent] [nvarchar](100) NULL,
	[ccdaComponentSection] [nvarchar](100) NULL,
	[formDir] [nvarchar](100) NULL,
	[formType] [smallint] NULL,
	[formTable] [nvarchar](100) NULL,
	[userId] [int] NULL,
	[deleted] [smallint] NOT NULL,
	[timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_ccdaTableMapping_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[chartTracker]    Script Date: 6/25/2016 11:23:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chartTracker](
	[ctPid] [int] NOT NULL,
	[ctWhen] [datetime2](0) NOT NULL,
	[ctUserid] [bigint] NOT NULL,
	[ctLocation] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_chartTracker_ctPid] PRIMARY KEY CLUSTERED 
(
	[ctPid] ASC,
	[ctWhen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Claims]    Script Date: 6/25/2016 11:23:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[PatientId] [int] NOT NULL,
	[EncounterId] [int] NOT NULL,
	[Version] [bigint] NOT NULL,
	[PayerId] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[PayerType] [smallint] NOT NULL,
	[BillProcess] [smallint] NOT NULL,
	[BillTime] [datetime2](0) NULL,
	[ProcessTime] [datetime2](0) NULL,
	[ProcessFile] [nvarchar](255) NULL,
	[Target] [nvarchar](30) NULL,
	[X12PartnerId] [int] NOT NULL,
 CONSTRAINT [PK_Claims_PatientId] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[EncounterId] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ClinicalPlans]    Script Date: 6/25/2016 11:23:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalPlans](
	[Id] [nvarchar](31) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[NormalFlag] [smallint] NULL,
	[CqmFlag] [smallint] NULL,
	[Cqm2011Flag] [smallint] NULL,
	[Cqm2014Flag] [smallint] NULL,
	[CqmMeasureGroup] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ClinicalPlans_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ClinicalPlansRules]    Script Date: 6/25/2016 11:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalPlansRules](
	[PlanId] [nvarchar](31) NOT NULL,
	[RuleId] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_ClinicalPlansRules_PlanId] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC,
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ClinicalRules]    Script Date: 6/25/2016 11:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalRules](
	[Id] [nvarchar](31) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[ActiveAlertFlag] [smallint] NULL,
	[PassiveAlertFlag] [smallint] NULL,
	[CqmFlag] [smallint] NULL,
	[Cqm2011Flag] [smallint] NULL,
	[Cqm2014Flag] [smallint] NULL,
	[CqmNqfCode] [nvarchar](10) NOT NULL,
	[CqmPqriCode] [nvarchar](10) NOT NULL,
	[AmcFlag] [smallint] NULL,
	[Amc2011Flag] [smallint] NULL,
	[Amc2014Flag] [smallint] NULL,
	[AmcCode] [nvarchar](10) NOT NULL,
	[AmcCode2014] [nvarchar](30) NOT NULL,
	[Amc2014Stage1Flag] [smallint] NULL,
	[Amc2014Stage2Flag] [smallint] NULL,
	[PatientReminderFlag] [smallint] NULL,
	[Developer] [nvarchar](255) NOT NULL,
	[FundingSource] [nvarchar](255) NOT NULL,
	[ReleaseVersion] [nvarchar](255) NOT NULL,
	[WebReference] [nvarchar](255) NOT NULL,
	[AccessControl] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ClinicalRules_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ClinicalRulesLog]    Script Date: 6/25/2016 11:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalRulesLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NOT NULL,
	[Uid] [bigint] NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClinicalRulesLog_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Codes]    Script Date: 6/25/2016 11:23:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Codes](
	[Id] [int] IDENTITY(16,1) NOT NULL,
	[CodeText] [nvarchar](255) NOT NULL,
	[CodeTextShort] [nvarchar](24) NOT NULL,
	[Code] [nvarchar](25) NOT NULL,
	[CodeType] [smallint] NULL,
	[Modifier] [nvarchar](12) NOT NULL,
	[Units] [int] NULL,
	[Fee] [decimal](12, 2) NULL,
	[Superbill] [nvarchar](31) NOT NULL,
	[RelatedCode] [nvarchar](255) NOT NULL,
	[Taxrates] [nvarchar](255) NOT NULL,
	[CypFactor] [real] NOT NULL,
	[Active] [smallint] NULL,
	[Reportable] [smallint] NULL,
	[FinancialReporting] [smallint] NULL,
 CONSTRAINT [PK_Codes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[codeTypes]    Script Date: 6/25/2016 11:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codeTypes](
	[ctKey] [nvarchar](15) NOT NULL,
	[ctId] [int] NOT NULL,
	[ctSeq] [int] NOT NULL,
	[ctMod] [int] NOT NULL,
	[ctJust] [nvarchar](15) NOT NULL,
	[ctMask] [nvarchar](9) NOT NULL,
	[ctFee] [smallint] NOT NULL,
	[ctRel] [smallint] NOT NULL,
	[ctNofs] [smallint] NOT NULL,
	[ctDiag] [smallint] NOT NULL,
	[ctActive] [smallint] NOT NULL,
	[ctLabel] [nvarchar](31) NOT NULL,
	[ctExternal] [smallint] NOT NULL,
	[ctClaim] [smallint] NOT NULL,
	[ctProc] [smallint] NOT NULL,
	[ctTerm] [smallint] NOT NULL,
	[ctProblem] [smallint] NOT NULL,
	[ctDrug] [smallint] NOT NULL,
 CONSTRAINT [PK_codeTypes_ctKey] PRIMARY KEY CLUSTERED 
(
	[ctKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [codeTypes$ctId] UNIQUE NONCLUSTERED 
(
	[ctId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Config]    Script Date: 6/25/2016 11:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Parent] [int] NOT NULL,
	[Lft] [int] NOT NULL,
	[Rght] [int] NOT NULL,
 CONSTRAINT [PK_Config_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ConfigSeq]    Script Date: 6/25/2016 11:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigSeq](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_ConfigSeq_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Customlists]    Script Date: 6/25/2016 11:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customlists](
	[ClListSlno] [bigint] IDENTITY(5,1) NOT NULL,
	[ClListId] [bigint] NOT NULL,
	[ClListItemId] [bigint] NULL,
	[ClListType] [bigint] NOT NULL,
	[ClListItemShort] [nvarchar](10) NULL,
	[ClListItemLong] [nvarchar](max) NULL,
	[ClListItemLevel] [int] NULL,
	[ClOrder] [int] NULL,
	[ClDeleted] [smallint] NULL,
	[ClCreator] [int] NULL,
 CONSTRAINT [PK_Customlists_ClListSlno] PRIMARY KEY CLUSTERED 
(
	[ClListSlno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DatedReminders]    Script Date: 6/25/2016 11:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatedReminders](
	[DrId] [int] IDENTITY(1,1) NOT NULL,
	[DrFromID] [int] NOT NULL,
	[DrMessageText] [nvarchar](160) NOT NULL,
	[DrMessageSentDate] [datetime2](0) NOT NULL,
	[DrMessageDueDate] [date] NOT NULL,
	[Pid] [int] NOT NULL,
	[MessagePriority] [smallint] NOT NULL,
	[MessageProcessed] [smallint] NOT NULL,
	[ProcessedDate] [datetime] NULL,
	[DrProcessedBy] [int] NOT NULL,
 CONSTRAINT [PK_DatedReminders_DrId] PRIMARY KEY CLUSTERED 
(
	[DrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DatedRemindersLink]    Script Date: 6/25/2016 11:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatedRemindersLink](
	[DrLinkId] [int] IDENTITY(1,1) NOT NULL,
	[DrId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
 CONSTRAINT [PK_DatedRemindersLink_DrLinkId] PRIMARY KEY CLUSTERED 
(
	[DrLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DirectMessageLog]    Script Date: 6/25/2016 11:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectMessageLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MsgType] [nchar](1) NOT NULL,
	[MsgId] [nvarchar](127) NOT NULL,
	[Sender] [nvarchar](255) NOT NULL,
	[Recipient] [nvarchar](255) NOT NULL,
	[CreateTs] [datetime] NOT NULL,
	[Status] [nchar](1) NOT NULL,
	[StatusInfo] [nvarchar](511) NULL,
	[StatusTs] [datetime] NULL,
	[PatientId] [bigint] NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_DirectMessageLog_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 6/25/2016 11:24:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](7) NULL,
	[Size] [int] NULL,
	[Date] [datetime2](0) NULL,
	[Url] [nvarchar](255) NULL,
	[Mimetype] [nvarchar](255) NULL,
	[Pages] [int] NULL,
	[Owner] [int] NULL,
	[Revision] [datetime] NOT NULL,
	[ForeignId] [int] NULL,
	[Docdate] [date] NULL,
	[Hash] [nvarchar](40) NULL,
	[ListId] [bigint] NOT NULL,
	[CouchDocid] [nvarchar](100) NULL,
	[CouchRevid] [nvarchar](100) NULL,
	[Storagemethod] [smallint] NOT NULL,
	[PathDepth] [smallint] NULL,
	[Imported] [smallint] NULL,
	[EncounterId] [bigint] NOT NULL,
	[EncounterCheck] [smallint] NOT NULL,
	[AuditMasterApprovalStatus] [smallint] NOT NULL,
	[AuditMasterId] [int] NULL,
	[DocumentationOf] [nvarchar](255) NULL,
 CONSTRAINT [PK_Documents_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DocumentsLegalCategories]    Script Date: 6/25/2016 11:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentsLegalCategories](
	[DlcId] [bigint] IDENTITY(7,1) NOT NULL,
	[DlcCategoryType] [bigint] NOT NULL,
	[DlcCategoryName] [nvarchar](45) NOT NULL,
	[DlcCategoryParent] [bigint] NULL,
 CONSTRAINT [PK_DocumentsLegalCategories_DlcId] PRIMARY KEY CLUSTERED 
(
	[DlcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DocumentsLegalDetail]    Script Date: 6/25/2016 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentsLegalDetail](
	[DldId] [bigint] IDENTITY(1,1) NOT NULL,
	[DldPid] [bigint] NULL,
	[DldFacility] [bigint] NULL,
	[DldProvider] [bigint] NULL,
	[DldEncounter] [bigint] NULL,
	[DldMasterDocid] [bigint] NOT NULL,
	[DldSigned] [int] NOT NULL,
	[DldSignedTime] [datetime] NOT NULL,
	[DldFilepath] [nvarchar](75) NULL,
	[DldFilename] [nvarchar](45) NOT NULL,
	[DldSigningPerson] [nvarchar](50) NOT NULL,
	[DldSignLevel] [int] NOT NULL,
	[DldContent] [nvarchar](50) NOT NULL,
	[DldFileForPdfGeneration] [varbinary](max) NOT NULL,
	[DldDenialReason] [nvarchar](max) NULL,
	[DldMoved] [smallint] NOT NULL,
	[DldPatientComments] [nvarchar](max) NULL,
 CONSTRAINT [PK_DocumentsLegalDetail_DldId] PRIMARY KEY CLUSTERED 
(
	[DldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentsLegalMaster]    Script Date: 6/25/2016 11:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentsLegalMaster](
	[DlmCategory] [bigint] NULL,
	[DlmSubcategory] [bigint] NULL,
	[DlmDocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[DlmDocumentName] [nvarchar](75) NOT NULL,
	[DlmFilepath] [nvarchar](75) NOT NULL,
	[DlmFacility] [bigint] NULL,
	[DlmProvider] [bigint] NULL,
	[DlmSignHeight] [float] NOT NULL,
	[DlmSignWidth] [float] NOT NULL,
	[DlmFilename] [nvarchar](45) NOT NULL,
	[DlmEffectiveDate] [datetime2](0) NOT NULL,
	[DlmVersion] [bigint] NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
	[DlmSavedsign] [nvarchar](255) NULL,
	[DlmReview] [nvarchar](255) NULL,
	[DlmUploadType] [smallint] NULL,
 CONSTRAINT [PK_DocumentsLegalMaster_DlmDocumentId] PRIMARY KEY CLUSTERED 
(
	[DlmDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DrugInventory]    Script Date: 6/25/2016 11:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugInventory](
	[InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NOT NULL,
	[LotNumber] [nvarchar](20) NULL,
	[Expiration] [date] NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[OnHand] [int] NOT NULL,
	[WarehouseId] [nvarchar](31) NOT NULL,
	[VendorId] [bigint] NOT NULL,
	[LastNotify] [date] NOT NULL,
	[DestroyDate] [date] NULL,
	[DestroyMethod] [nvarchar](255) NULL,
	[DestroyWitness] [nvarchar](255) NULL,
	[DestroyNotes] [nvarchar](255) NULL,
 CONSTRAINT [PK_DrugInventory_InventoryId] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 6/25/2016 11:24:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[NdcNumber] [nvarchar](20) NOT NULL,
	[OnOrder] [int] NOT NULL,
	[ReorderPoint] [real] NOT NULL,
	[MaxLevel] [real] NOT NULL,
	[LastNotify] [date] NOT NULL,
	[Reactions] [nvarchar](max) NULL,
	[Form] [int] NOT NULL,
	[Size] [real] NOT NULL,
	[Unit] [int] NOT NULL,
	[Route] [int] NOT NULL,
	[Substitute] [int] NOT NULL,
	[RelatedCode] [nvarchar](255) NOT NULL,
	[CypFactor] [real] NOT NULL,
	[Active] [smallint] NULL,
	[AllowCombining] [smallint] NOT NULL,
	[AllowMultiple] [smallint] NOT NULL,
	[DrugCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_Drugs_DrugId] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DrugSales]    Script Date: 6/25/2016 11:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugSales](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[DrugId] [int] NOT NULL,
	[InventoryId] [int] NOT NULL,
	[PrescriptionId] [int] NOT NULL,
	[Pid] [int] NOT NULL,
	[Encounter] [int] NOT NULL,
	[User] [nvarchar](255) NULL,
	[SaleDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Fee] [decimal](12, 2) NOT NULL,
	[Billed] [smallint] NOT NULL,
	[XferInventoryId] [int] NOT NULL,
	[DistributorId] [bigint] NOT NULL,
	[Notes] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_DrugSales_SaleId] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DrugTemplates]    Script Date: 6/25/2016 11:24:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugTemplates](
	[DrugId] [int] NOT NULL,
	[Selector] [nvarchar](255) NOT NULL,
	[Dosage] [nvarchar](10) NULL,
	[Period] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Refills] [int] NOT NULL,
	[Taxrates] [nvarchar](255) NULL,
 CONSTRAINT [PK_DrugTemplates_DrugId] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC,
	[Selector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EligibilityResponse]    Script Date: 6/25/2016 11:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EligibilityResponse](
	[ResponseId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResponseDescription] [nvarchar](255) NULL,
	[ResponseStatus] [nvarchar](1) NOT NULL,
	[ResponseVendorId] [bigint] NULL,
	[ResponseCreateDate] [date] NULL,
	[ResponseModifyDate] [date] NULL,
 CONSTRAINT [PK_EligibilityResponse_ResponseId] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EligibilityVerification]    Script Date: 6/25/2016 11:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EligibilityVerification](
	[VerificationId] [bigint] IDENTITY(1,1) NOT NULL,
	[ResponseId] [bigint] NULL,
	[InsuranceId] [bigint] NULL,
	[EligibilityCheckDate] [datetime2](0) NULL,
	[Copay] [int] NULL,
	[Deductible] [int] NULL,
	[Deductiblemet] [nvarchar](1) NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_EligibilityVerification_VerificationId] PRIMARY KEY CLUSTERED 
(
	[VerificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EmployerData]    Script Date: 6/25/2016 11:24:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployerData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NOT NULL,
 CONSTRAINT [PK_EmployerData_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EncCategoryMap]    Script Date: 6/25/2016 11:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncCategoryMap](
	[RuleEncId] [nvarchar](31) NOT NULL,
	[MainCatId] [int] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EncCategoryMap_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ErxTtlTouch]    Script Date: 6/25/2016 11:24:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErxTtlTouch](
	[PatientId] [bigint] NOT NULL,
	[Process] [nvarchar](11) NOT NULL,
	[Updated] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_ErxTtlTouch_PatientId] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[Process] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EsignSignatures]    Script Date: 6/25/2016 11:24:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsignSignatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tid] [int] NOT NULL,
	[Table] [nvarchar](255) NOT NULL,
	[Uid] [int] NOT NULL,
	[Datetime] [datetime2](0) NOT NULL,
	[IsLock] [smallint] NOT NULL,
	[Amendment] [nvarchar](max) NULL,
	[Hash] [nvarchar](255) NOT NULL,
	[SignatureHash] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_EsignSignatures_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ExtendedLog]    Script Date: 6/25/2016 11:24:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendedLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Event] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Recipient] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[PatientId] [bigint] NULL,
 CONSTRAINT [PK_ExtendedLog_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ExternalEncounters]    Script Date: 6/25/2016 11:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalEncounters](
	[EeId] [int] IDENTITY(1,1) NOT NULL,
	[EeDate] [date] NULL,
	[EePid] [int] NULL,
	[EeProviderId] [nvarchar](255) NULL,
	[EeFacilityId] [nvarchar](255) NULL,
	[EeEncounterDiagnosis] [nvarchar](255) NULL,
	[EeExternalId] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExternalEncounters_EeId] PRIMARY KEY CLUSTERED 
(
	[EeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ExternalProcedures]    Script Date: 6/25/2016 11:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalProcedures](
	[EpId] [int] IDENTITY(1,1) NOT NULL,
	[EpDate] [date] NULL,
	[EpCodeType] [nvarchar](20) NULL,
	[EpCode] [nvarchar](9) NULL,
	[EpPid] [int] NULL,
	[EpEncounter] [int] NULL,
	[EpCodeText] [nvarchar](max) NULL,
	[EpFacilityId] [nvarchar](255) NULL,
	[EpExternalId] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExternalProcedures_EpId] PRIMARY KEY CLUSTERED 
(
	[EpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Facility]    Script Date: 6/25/2016 11:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facility](
	[Id] [int] IDENTITY(4,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](11) NULL,
	[CountryCode] [nvarchar](10) NULL,
	[FederalEin] [nvarchar](15) NULL,
	[Website] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[ServiceLocation] [smallint] NOT NULL,
	[BillingLocation] [smallint] NOT NULL,
	[AcceptsAssignment] [smallint] NOT NULL,
	[PosCode] [smallint] NULL,
	[X12SenderId] [nvarchar](25) NULL,
	[Attn] [nvarchar](65) NULL,
	[DomainIdentifier] [nvarchar](60) NULL,
	[FacilityNpi] [nvarchar](15) NULL,
	[TaxIdType] [nvarchar](31) NOT NULL,
	[Color] [nvarchar](7) NOT NULL,
	[PrimaryBusinessEntity] [int] NOT NULL,
	[FacilityCode] [nvarchar](31) NULL,
 CONSTRAINT [PK_Facility_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FacilityUserIds]    Script Date: 6/25/2016 11:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityUserIds](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Uid] [bigint] NULL,
	[FacilityId] [bigint] NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_FacilityUserIds_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FeeSheetOptions]    Script Date: 6/25/2016 11:24:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeSheetOptions](
	[FsCategory] [nvarchar](63) NULL,
	[FsOption] [nvarchar](63) NULL,
	[FsCodes] [nvarchar](255) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FeeSheetOptions_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormCarePlan]    Script Date: 6/25/2016 11:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormCarePlan](
	[Id] [bigint] NOT NULL,
	[Date] [date] NULL,
	[Pid] [bigint] NULL,
	[Encounter] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Code] [nvarchar](255) NULL,
	[Codetext] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ExternalId] [nvarchar](30) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FormCarePlan_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormClinicalInstructions]    Script Date: 6/25/2016 11:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormClinicalInstructions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NULL,
	[Encounter] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Instruction] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Activity] [smallint] NULL,
 CONSTRAINT [PK_FormClinicalInstructions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormDictation]    Script Date: 6/25/2016 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormDictation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Dictation] [nvarchar](max) NULL,
	[AdditionalNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_FormDictation_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormEncounter]    Script Date: 6/25/2016 11:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormEncounter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Reason] [nvarchar](max) NULL,
	[Facility] [nvarchar](max) NULL,
	[FacilityId] [int] NOT NULL,
	[Pid] [bigint] NULL,
	[Encounter] [bigint] NULL,
	[OnsetDate] [datetime2](0) NULL,
	[Sensitivity] [nvarchar](30) NULL,
	[BillingNote] [nvarchar](max) NULL,
	[PcCatid] [int] NOT NULL,
	[LastLevelBilled] [int] NOT NULL,
	[LastLevelClosed] [int] NOT NULL,
	[LastStmtDate] [date] NULL,
	[StmtCount] [int] NOT NULL,
	[ProviderId] [int] NULL,
	[SupervisorId] [int] NULL,
	[InvoiceRefno] [nvarchar](31) NOT NULL,
	[ReferralSource] [nvarchar](31) NOT NULL,
	[BillingFacility] [int] NOT NULL,
	[ExternalId] [nvarchar](20) NULL,
 CONSTRAINT [PK_FormEncounter_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormFunctionalCognitiveStatus]    Script Date: 6/25/2016 11:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormFunctionalCognitiveStatus](
	[Id] [bigint] NOT NULL,
	[Date] [date] NULL,
	[Pid] [bigint] NULL,
	[Encounter] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Code] [nvarchar](255) NULL,
	[Codetext] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ExternalId] [nvarchar](30) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FormFunctionalCognitiveStatus_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormMiscBillingOptions]    Script Date: 6/25/2016 11:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormMiscBillingOptions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[EmploymentRelated] [smallint] NULL,
	[AutoAccident] [smallint] NULL,
	[AccidentState] [nvarchar](2) NULL,
	[OtherAccident] [smallint] NULL,
	[OutsideLab] [smallint] NULL,
	[LabAmount] [decimal](5, 2) NULL,
	[IsUnableToWork] [smallint] NULL,
	[DateInitialTreatment] [date] NULL,
	[OffWorkFrom] [date] NULL,
	[OffWorkTo] [date] NULL,
	[IsHospitalized] [smallint] NULL,
	[HospitalizationDateFrom] [date] NULL,
	[HospitalizationDateTo] [date] NULL,
	[MedicaidResubmissionCode] [nvarchar](10) NULL,
	[MedicaidOriginalReference] [nvarchar](15) NULL,
	[PriorAuthNumber] [nvarchar](20) NULL,
	[Comments] [nvarchar](255) NULL,
	[ReplacementClaim] [smallint] NULL,
	[Box14DateQual] [nchar](3) NULL,
	[Box15DateQual] [nchar](3) NULL,
 CONSTRAINT [PK_FormMiscBillingOptions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormObservation]    Script Date: 6/25/2016 11:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormObservation](
	[Id] [bigint] NOT NULL,
	[Date] [date] NULL,
	[Pid] [bigint] NULL,
	[Encounter] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Code] [nvarchar](255) NULL,
	[Observation] [nvarchar](255) NULL,
	[ObValue] [nvarchar](255) NULL,
	[ObUnit] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CodeType] [nvarchar](255) NULL,
	[TableCode] [nvarchar](255) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FormObservation_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormReviewofs]    Script Date: 6/25/2016 11:25:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormReviewofs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Fever] [nvarchar](5) NULL,
	[Chills] [nvarchar](5) NULL,
	[NightSweats] [nvarchar](5) NULL,
	[WeightLoss] [nvarchar](5) NULL,
	[PoorAppetite] [nvarchar](5) NULL,
	[Insomnia] [nvarchar](5) NULL,
	[Fatigued] [nvarchar](5) NULL,
	[Depressed] [nvarchar](5) NULL,
	[Hyperactive] [nvarchar](5) NULL,
	[ExposureToForeignCountries] [nvarchar](5) NULL,
	[Cataracts] [nvarchar](5) NULL,
	[CataractSurgery] [nvarchar](5) NULL,
	[Glaucoma] [nvarchar](5) NULL,
	[DoubleVision] [nvarchar](5) NULL,
	[BlurredVision] [nvarchar](5) NULL,
	[PoorHearing] [nvarchar](5) NULL,
	[Headaches] [nvarchar](5) NULL,
	[RingingInEars] [nvarchar](5) NULL,
	[BloodyNose] [nvarchar](5) NULL,
	[Sinusitis] [nvarchar](5) NULL,
	[SinusSurgery] [nvarchar](5) NULL,
	[DryMouth] [nvarchar](5) NULL,
	[StrepThroat] [nvarchar](5) NULL,
	[Tonsillectomy] [nvarchar](5) NULL,
	[SwollenLymphNodes] [nvarchar](5) NULL,
	[ThroatCancer] [nvarchar](5) NULL,
	[ThroatCancerSurgery] [nvarchar](5) NULL,
	[HeartAttack] [nvarchar](5) NULL,
	[IrregularHeartBeat] [nvarchar](5) NULL,
	[ChestPains] [nvarchar](5) NULL,
	[ShortnessOfBreath] [nvarchar](5) NULL,
	[HighBloodPressure] [nvarchar](5) NULL,
	[HeartFailure] [nvarchar](5) NULL,
	[PoorCirculation] [nvarchar](5) NULL,
	[VascularSurgery] [nvarchar](5) NULL,
	[CardiacCatheterization] [nvarchar](5) NULL,
	[CoronaryArteryBypass] [nvarchar](5) NULL,
	[HeartTransplant] [nvarchar](5) NULL,
	[StressTest] [nvarchar](5) NULL,
	[Emphysema] [nvarchar](5) NULL,
	[ChronicBronchitis] [nvarchar](5) NULL,
	[InterstitialLungDisease] [nvarchar](5) NULL,
	[ShortnessOfBreath2] [nvarchar](5) NULL,
	[LungCancer] [nvarchar](5) NULL,
	[LungCancerSurgery] [nvarchar](5) NULL,
	[Pheumothorax] [nvarchar](5) NULL,
	[StomachPains] [nvarchar](5) NULL,
	[PepticUlcerDisease] [nvarchar](5) NULL,
	[Gastritis] [nvarchar](5) NULL,
	[Endoscopy] [nvarchar](5) NULL,
	[Polyps] [nvarchar](5) NULL,
	[Colonoscopy] [nvarchar](5) NULL,
	[ColonCancer] [nvarchar](5) NULL,
	[ColonCancerSurgery] [nvarchar](5) NULL,
	[UlcerativeColitis] [nvarchar](5) NULL,
	[CrohnsDisease] [nvarchar](5) NULL,
	[Appendectomy] [nvarchar](5) NULL,
	[Divirticulitis] [nvarchar](5) NULL,
	[DivirticulitisSurgery] [nvarchar](5) NULL,
	[GallStones] [nvarchar](5) NULL,
	[Cholecystectomy] [nvarchar](5) NULL,
	[Hepatitis] [nvarchar](5) NULL,
	[CirrhosisOfTheLiver] [nvarchar](5) NULL,
	[Splenectomy] [nvarchar](5) NULL,
	[KidneyFailure] [nvarchar](5) NULL,
	[KidneyStones] [nvarchar](5) NULL,
	[KidneyCancer] [nvarchar](5) NULL,
	[KidneyInfections] [nvarchar](5) NULL,
	[BladderInfections] [nvarchar](5) NULL,
	[BladderCancer] [nvarchar](5) NULL,
	[ProstateProblems] [nvarchar](5) NULL,
	[ProstateCancer] [nvarchar](5) NULL,
	[KidneyTransplant] [nvarchar](5) NULL,
	[SexuallyTransmittedDisease] [nvarchar](5) NULL,
	[BurningWithUrination] [nvarchar](5) NULL,
	[DischargeFromUrethra] [nvarchar](5) NULL,
	[Rashes] [nvarchar](5) NULL,
	[Infections] [nvarchar](5) NULL,
	[Ulcerations] [nvarchar](5) NULL,
	[Pemphigus] [nvarchar](5) NULL,
	[Herpes] [nvarchar](5) NULL,
	[Osetoarthritis] [nvarchar](5) NULL,
	[RheumotoidArthritis] [nvarchar](5) NULL,
	[Lupus] [nvarchar](5) NULL,
	[AnkylosingSondlilitis] [nvarchar](5) NULL,
	[SwollenJoints] [nvarchar](5) NULL,
	[StiffJoints] [nvarchar](5) NULL,
	[BrokenBones] [nvarchar](5) NULL,
	[NeckProblems] [nvarchar](5) NULL,
	[BackProblems] [nvarchar](5) NULL,
	[BackSurgery] [nvarchar](5) NULL,
	[Scoliosis] [nvarchar](5) NULL,
	[HerniatedDisc] [nvarchar](5) NULL,
	[ShoulderProblems] [nvarchar](5) NULL,
	[ElbowProblems] [nvarchar](5) NULL,
	[WristProblems] [nvarchar](5) NULL,
	[HandProblems] [nvarchar](5) NULL,
	[HipProblems] [nvarchar](5) NULL,
	[KneeProblems] [nvarchar](5) NULL,
	[AnkleProblems] [nvarchar](5) NULL,
	[FootProblems] [nvarchar](5) NULL,
	[InsulinDependentDiabetes] [nvarchar](5) NULL,
	[NoninsulinDependentDiabetes] [nvarchar](5) NULL,
	[Hypothyroidism] [nvarchar](5) NULL,
	[Hyperthyroidism] [nvarchar](5) NULL,
	[CushingSyndrom] [nvarchar](5) NULL,
	[AddisonSyndrom] [nvarchar](5) NULL,
	[AdditionalNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_FormReviewofs_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormRos]    Script Date: 6/25/2016 11:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormRos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NOT NULL,
	[Activity] [int] NOT NULL,
	[Date] [datetime2](0) NULL,
	[WeightChange] [nvarchar](3) NULL,
	[Weakness] [nvarchar](3) NULL,
	[Fatigue] [nvarchar](3) NULL,
	[Anorexia] [nvarchar](3) NULL,
	[Fever] [nvarchar](3) NULL,
	[Chills] [nvarchar](3) NULL,
	[NightSweats] [nvarchar](3) NULL,
	[Insomnia] [nvarchar](3) NULL,
	[Irritability] [nvarchar](3) NULL,
	[HeatOrCold] [nvarchar](3) NULL,
	[Intolerance] [nvarchar](3) NULL,
	[ChangeInVision] [nvarchar](3) NULL,
	[GlaucomaHistory] [nvarchar](3) NULL,
	[EyePain] [nvarchar](3) NULL,
	[Irritation] [nvarchar](3) NULL,
	[Redness] [nvarchar](3) NULL,
	[ExcessiveTearing] [nvarchar](3) NULL,
	[DoubleVision] [nvarchar](3) NULL,
	[BlindSpots] [nvarchar](3) NULL,
	[Photophobia] [nvarchar](3) NULL,
	[HearingLoss] [nvarchar](3) NULL,
	[Discharge] [nvarchar](3) NULL,
	[Pain] [nvarchar](3) NULL,
	[Vertigo] [nvarchar](3) NULL,
	[Tinnitus] [nvarchar](3) NULL,
	[FrequentColds] [nvarchar](3) NULL,
	[SoreThroat] [nvarchar](3) NULL,
	[SinusProblems] [nvarchar](3) NULL,
	[PostNasalDrip] [nvarchar](3) NULL,
	[Nosebleed] [nvarchar](3) NULL,
	[Snoring] [nvarchar](3) NULL,
	[Apnea] [nvarchar](3) NULL,
	[BreastMass] [nvarchar](3) NULL,
	[BreastDischarge] [nvarchar](3) NULL,
	[Biopsy] [nvarchar](3) NULL,
	[AbnormalMammogram] [nvarchar](3) NULL,
	[Cough] [nvarchar](3) NULL,
	[Sputum] [nvarchar](3) NULL,
	[ShortnessOfBreath] [nvarchar](3) NULL,
	[Wheezing] [nvarchar](3) NULL,
	[Hemoptsyis] [nvarchar](3) NULL,
	[Asthma] [nvarchar](3) NULL,
	[Copd] [nvarchar](3) NULL,
	[ChestPain] [nvarchar](3) NULL,
	[Palpitation] [nvarchar](3) NULL,
	[Syncope] [nvarchar](3) NULL,
	[Pnd] [nvarchar](3) NULL,
	[Doe] [nvarchar](3) NULL,
	[Orthopnea] [nvarchar](3) NULL,
	[Peripheal] [nvarchar](3) NULL,
	[Edema] [nvarchar](3) NULL,
	[LegpainCramping] [nvarchar](3) NULL,
	[HistoryMurmur] [nvarchar](3) NULL,
	[Arrythmia] [nvarchar](3) NULL,
	[HeartProblem] [nvarchar](3) NULL,
	[Dysphagia] [nvarchar](3) NULL,
	[Heartburn] [nvarchar](3) NULL,
	[Bloating] [nvarchar](3) NULL,
	[Belching] [nvarchar](3) NULL,
	[Flatulence] [nvarchar](3) NULL,
	[Nausea] [nvarchar](3) NULL,
	[Vomiting] [nvarchar](3) NULL,
	[Hematemesis] [nvarchar](3) NULL,
	[GastroPain] [nvarchar](3) NULL,
	[FoodIntolerance] [nvarchar](3) NULL,
	[Hepatitis] [nvarchar](3) NULL,
	[Jaundice] [nvarchar](3) NULL,
	[Hematochezia] [nvarchar](3) NULL,
	[ChangedBowel] [nvarchar](3) NULL,
	[Diarrhea] [nvarchar](3) NULL,
	[Constipation] [nvarchar](3) NULL,
	[Polyuria] [nvarchar](3) NULL,
	[Polydypsia] [nvarchar](3) NULL,
	[Dysuria] [nvarchar](3) NULL,
	[Hematuria] [nvarchar](3) NULL,
	[Frequency] [nvarchar](3) NULL,
	[Urgency] [nvarchar](3) NULL,
	[Incontinence] [nvarchar](3) NULL,
	[RenalStones] [nvarchar](3) NULL,
	[Utis] [nvarchar](3) NULL,
	[Hesitancy] [nvarchar](3) NULL,
	[Dribbling] [nvarchar](3) NULL,
	[Stream] [nvarchar](3) NULL,
	[Nocturia] [nvarchar](3) NULL,
	[Erections] [nvarchar](3) NULL,
	[Ejaculations] [nvarchar](3) NULL,
	[G] [nvarchar](3) NULL,
	[P] [nvarchar](3) NULL,
	[Ap] [nvarchar](3) NULL,
	[Lc] [nvarchar](3) NULL,
	[Mearche] [nvarchar](3) NULL,
	[Menopause] [nvarchar](3) NULL,
	[Lmp] [nvarchar](3) NULL,
	[FFrequency] [nvarchar](3) NULL,
	[FFlow] [nvarchar](3) NULL,
	[FSymptoms] [nvarchar](3) NULL,
	[AbnormalHairGrowth] [nvarchar](3) NULL,
	[FHirsutism] [nvarchar](3) NULL,
	[JointPain] [nvarchar](3) NULL,
	[Swelling] [nvarchar](3) NULL,
	[MRedness] [nvarchar](3) NULL,
	[MWarm] [nvarchar](3) NULL,
	[MStiffness] [nvarchar](3) NULL,
	[Muscle] [nvarchar](3) NULL,
	[MAches] [nvarchar](3) NULL,
	[Fms] [nvarchar](3) NULL,
	[Arthritis] [nvarchar](3) NULL,
	[Loc] [nvarchar](3) NULL,
	[Seizures] [nvarchar](3) NULL,
	[Stroke] [nvarchar](3) NULL,
	[Tia] [nvarchar](3) NULL,
	[NNumbness] [nvarchar](3) NULL,
	[NWeakness] [nvarchar](3) NULL,
	[Paralysis] [nvarchar](3) NULL,
	[IntellectualDecline] [nvarchar](3) NULL,
	[MemoryProblems] [nvarchar](3) NULL,
	[Dementia] [nvarchar](3) NULL,
	[NHeadache] [nvarchar](3) NULL,
	[SCancer] [nvarchar](3) NULL,
	[Psoriasis] [nvarchar](3) NULL,
	[SAcne] [nvarchar](3) NULL,
	[SOther] [nvarchar](3) NULL,
	[SDisease] [nvarchar](3) NULL,
	[PDiagnosis] [nvarchar](3) NULL,
	[PMedication] [nvarchar](3) NULL,
	[Depression] [nvarchar](3) NULL,
	[Anxiety] [nvarchar](3) NULL,
	[SocialDifficulties] [nvarchar](3) NULL,
	[ThyroidProblems] [nvarchar](3) NULL,
	[Diabetes] [nvarchar](3) NULL,
	[AbnormalBlood] [nvarchar](3) NULL,
	[Anemia] [nvarchar](3) NULL,
	[FhBloodProblems] [nvarchar](3) NULL,
	[BleedingProblems] [nvarchar](3) NULL,
	[Allergies] [nvarchar](3) NULL,
	[FrequentIllness] [nvarchar](3) NULL,
	[Hiv] [nvarchar](3) NULL,
	[HaiStatus] [nvarchar](3) NULL,
 CONSTRAINT [PK_FormRos_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Forms]    Script Date: 6/25/2016 11:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Encounter] [bigint] NULL,
	[FormName] [nvarchar](max) NULL,
	[FormId] [bigint] NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Deleted] [smallint] NOT NULL,
	[Formdir] [nvarchar](max) NULL,
 CONSTRAINT [PK_Forms_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormSoap]    Script Date: 6/25/2016 11:26:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormSoap](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Subjective] [nvarchar](max) NULL,
	[Objective] [nvarchar](max) NULL,
	[Assessment] [nvarchar](max) NULL,
	[Plan] [nvarchar](max) NULL,
 CONSTRAINT [PK_FormSoap_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[FormVitals]    Script Date: 6/25/2016 11:26:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormVitals](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Authorized] [smallint] NULL,
	[Activity] [smallint] NULL,
	[Bps] [nvarchar](40) NULL,
	[Bpd] [nvarchar](40) NULL,
	[Weight] [numeric](5, 2) NULL,
	[Height] [numeric](5, 2) NULL,
	[Temperature] [numeric](5, 2) NULL,
	[TempMethod] [nvarchar](255) NULL,
	[Pulse] [numeric](5, 2) NULL,
	[Respiration] [numeric](5, 2) NULL,
	[Note] [nvarchar](255) NULL,
	[BMI] [numeric](4, 1) NULL,
	[BMIStatus] [nvarchar](255) NULL,
	[WaistCirc] [numeric](5, 2) NULL,
	[HeadCirc] [numeric](4, 2) NULL,
	[OxygenSaturation] [numeric](5, 2) NULL,
	[ExternalId] [nvarchar](20) NULL,
 CONSTRAINT [PK_FormVitals_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[GeoCountryReference]    Script Date: 6/25/2016 11:26:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoCountryReference](
	[CountriesId] [int] IDENTITY(240,1) NOT NULL,
	[CountriesName] [nvarchar](64) NULL,
	[CountriesIsoCode2] [nchar](2) NOT NULL,
	[CountriesIsoCode3] [nchar](3) NOT NULL,
 CONSTRAINT [PK_GeoCountryReference_CountriesId] PRIMARY KEY CLUSTERED 
(
	[CountriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[GeoZoneReference]    Script Date: 6/25/2016 11:26:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoZoneReference](
	[ZoneId] [int] IDENTITY(83,1) NOT NULL,
	[ZoneCountryId] [int] NOT NULL,
	[ZoneCode] [nvarchar](5) NULL,
	[ZoneName] [nvarchar](32) NULL,
 CONSTRAINT [PK_GeoZoneReference_ZoneId] PRIMARY KEY CLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Globals]    Script Date: 6/25/2016 11:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Globals](
	[GlName] [nvarchar](63) NOT NULL,
	[GlIndex] [int] NOT NULL,
	[GlValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Globals_GlName] PRIMARY KEY CLUSTERED 
(
	[GlName] ASC,
	[GlIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[gprelations]    Script Date: 6/25/2016 11:26:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gprelations](
	[type1] [int] NOT NULL,
	[id1] [bigint] NOT NULL,
	[type2] [int] NOT NULL,
	[id2] [bigint] NOT NULL,
 CONSTRAINT [PK_gprelations_type1] PRIMARY KEY CLUSTERED 
(
	[type1] ASC,
	[id1] ASC,
	[type2] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 6/25/2016 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[User] [nvarchar](max) NULL,
 CONSTRAINT [PK_Groups_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[HistoryData]    Script Date: 6/25/2016 11:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Coffee] [nvarchar](max) NULL,
	[Tobacco] [nvarchar](max) NULL,
	[Alcohol] [nvarchar](max) NULL,
	[SleepPatterns] [nvarchar](max) NULL,
	[ExercisePatterns] [nvarchar](max) NULL,
	[SeatbeltUse] [nvarchar](max) NULL,
	[Counseling] [nvarchar](max) NULL,
	[HazardousActivities] [nvarchar](max) NULL,
	[RecreationalDrugs] [nvarchar](max) NULL,
	[LastBreastExam] [nvarchar](255) NULL,
	[LastMammogram] [nvarchar](255) NULL,
	[LastGynocologicalExam] [nvarchar](255) NULL,
	[LastRectalExam] [nvarchar](255) NULL,
	[LastProstateExam] [nvarchar](255) NULL,
	[LastPhysicalExam] [nvarchar](255) NULL,
	[LastSigmoidoscopyColonoscopy] [nvarchar](255) NULL,
	[LastEcg] [nvarchar](255) NULL,
	[LastCardiacEcho] [nvarchar](255) NULL,
	[LastRetinal] [nvarchar](255) NULL,
	[LastFluvax] [nvarchar](255) NULL,
	[LastPneuvax] [nvarchar](255) NULL,
	[LastLdl] [nvarchar](255) NULL,
	[LastHemoglobin] [nvarchar](255) NULL,
	[LastPsa] [nvarchar](255) NULL,
	[LastExamResults] [nvarchar](255) NULL,
	[HistoryMother] [nvarchar](max) NULL,
	[DcMother] [nvarchar](max) NULL,
	[HistoryFather] [nvarchar](max) NULL,
	[DcFather] [nvarchar](max) NULL,
	[HistorySiblings] [nvarchar](max) NULL,
	[DcSiblings] [nvarchar](max) NULL,
	[HistoryOffspring] [nvarchar](max) NULL,
	[DcOffspring] [nvarchar](max) NULL,
	[HistorySpouse] [nvarchar](max) NULL,
	[DcSpouse] [nvarchar](max) NULL,
	[RelativesCancer] [nvarchar](max) NULL,
	[RelativesTuberculosis] [nvarchar](max) NULL,
	[RelativesDiabetes] [nvarchar](max) NULL,
	[RelativesHighBloodPressure] [nvarchar](max) NULL,
	[RelativesHeartProblems] [nvarchar](max) NULL,
	[RelativesStroke] [nvarchar](max) NULL,
	[RelativesEpilepsy] [nvarchar](max) NULL,
	[RelativesMentalIllness] [nvarchar](max) NULL,
	[RelativesSuicide] [nvarchar](max) NULL,
	[CataractSurgery] [datetime2](0) NULL,
	[Tonsillectomy] [datetime2](0) NULL,
	[Cholecystestomy] [datetime2](0) NULL,
	[HeartSurgery] [datetime2](0) NULL,
	[Hysterectomy] [datetime2](0) NULL,
	[HerniaRepair] [datetime2](0) NULL,
	[HipReplacement] [datetime2](0) NULL,
	[KneeReplacement] [datetime2](0) NULL,
	[Appendectomy] [datetime2](0) NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NOT NULL,
	[Name1] [nvarchar](255) NULL,
	[Value1] [nvarchar](255) NULL,
	[Name2] [nvarchar](255) NULL,
	[Value2] [nvarchar](255) NULL,
	[AdditionalHistory] [nvarchar](max) NULL,
	[Exams] [nvarchar](max) NULL,
	[Usertext11] [nvarchar](max) NULL,
	[Usertext12] [nvarchar](255) NOT NULL,
	[Usertext13] [nvarchar](255) NOT NULL,
	[Usertext14] [nvarchar](255) NOT NULL,
	[Usertext15] [nvarchar](255) NOT NULL,
	[Usertext16] [nvarchar](255) NOT NULL,
	[Usertext17] [nvarchar](255) NOT NULL,
	[Usertext18] [nvarchar](255) NOT NULL,
	[Usertext19] [nvarchar](255) NOT NULL,
	[Usertext20] [nvarchar](255) NOT NULL,
	[Usertext21] [nvarchar](255) NOT NULL,
	[Usertext22] [nvarchar](255) NOT NULL,
	[Usertext23] [nvarchar](255) NOT NULL,
	[Usertext24] [nvarchar](255) NOT NULL,
	[Usertext25] [nvarchar](255) NOT NULL,
	[Usertext26] [nvarchar](255) NOT NULL,
	[Usertext27] [nvarchar](255) NOT NULL,
	[Usertext28] [nvarchar](255) NOT NULL,
	[Usertext29] [nvarchar](255) NOT NULL,
	[Usertext30] [nvarchar](255) NOT NULL,
	[Userdate11] [date] NULL,
	[Userdate12] [date] NULL,
	[Userdate13] [date] NULL,
	[Userdate14] [date] NULL,
	[Userdate15] [date] NULL,
	[Userarea11] [nvarchar](max) NULL,
	[Userarea12] [nvarchar](max) NULL,
 CONSTRAINT [PK_HistoryData_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10DxOrderCode]    Script Date: 6/25/2016 11:26:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10DxOrderCode](
	[DxId] [bigint] IDENTITY(1,1) NOT NULL,
	[DxCode] [nvarchar](7) NULL,
	[FormattedDxCode] [nvarchar](10) NULL,
	[ValidForCoding] [nchar](1) NULL,
	[ShortDesc] [nvarchar](60) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10DxOrderCode$DxId] UNIQUE CLUSTERED 
(
	[DxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10GemDx109]    Script Date: 6/25/2016 11:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10GemDx109](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[DxIcd10Source] [nvarchar](7) NULL,
	[DxIcd9Target] [nvarchar](5) NULL,
	[Flags] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10GemDx109$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10GemDx910]    Script Date: 6/25/2016 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10GemDx910](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[DxIcd9Source] [nvarchar](5) NULL,
	[DxIcd10Target] [nvarchar](7) NULL,
	[Flags] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10GemDx910$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10GemPcs109]    Script Date: 6/25/2016 11:27:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10GemPcs109](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[PcsIcd10Source] [nvarchar](7) NULL,
	[PcsIcd9Target] [nvarchar](5) NULL,
	[Flags] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10GemPcs109$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10GemPcs910]    Script Date: 6/25/2016 11:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10GemPcs910](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[PcsIcd9Source] [nvarchar](5) NULL,
	[PcsIcd10Target] [nvarchar](7) NULL,
	[Flags] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10GemPcs910$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10PcsOrderCode]    Script Date: 6/25/2016 11:27:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10PcsOrderCode](
	[PcsId] [bigint] IDENTITY(1,1) NOT NULL,
	[PcsCode] [nvarchar](7) NULL,
	[ValidForCoding] [nchar](1) NULL,
	[ShortDesc] [nvarchar](60) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10PcsOrderCode$PcsId] UNIQUE CLUSTERED 
(
	[PcsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10ReimbrDx910]    Script Date: 6/25/2016 11:27:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10ReimbrDx910](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](8) NULL,
	[CodeCnt] [smallint] NULL,
	[ICD901] [nvarchar](5) NULL,
	[ICD902] [nvarchar](5) NULL,
	[ICD903] [nvarchar](5) NULL,
	[ICD904] [nvarchar](5) NULL,
	[ICD905] [nvarchar](5) NULL,
	[ICD906] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10ReimbrDx910$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd10ReimbrPcs910]    Script Date: 6/25/2016 11:27:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd10ReimbrPcs910](
	[MapId] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](8) NULL,
	[CodeCnt] [smallint] NULL,
	[ICD901] [nvarchar](5) NULL,
	[ICD902] [nvarchar](5) NULL,
	[ICD903] [nvarchar](5) NULL,
	[ICD904] [nvarchar](5) NULL,
	[ICD905] [nvarchar](5) NULL,
	[ICD906] [nvarchar](5) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd10ReimbrPcs910$MapId] UNIQUE CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd9DxCode]    Script Date: 6/25/2016 11:27:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd9DxCode](
	[DxId] [bigint] IDENTITY(1,1) NOT NULL,
	[DxCode] [nvarchar](5) NULL,
	[FormattedDxCode] [nvarchar](6) NULL,
	[ShortDesc] [nvarchar](60) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd9DxCode$DxId] UNIQUE CLUSTERED 
(
	[DxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd9DxLongCode]    Script Date: 6/25/2016 11:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd9DxLongCode](
	[DxId] [bigint] IDENTITY(1,1) NOT NULL,
	[DxCode] [nvarchar](5) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd9DxLongCode$DxId] UNIQUE CLUSTERED 
(
	[DxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd9SgCode]    Script Date: 6/25/2016 11:27:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd9SgCode](
	[SgId] [bigint] IDENTITY(1,1) NOT NULL,
	[SgCode] [nvarchar](5) NULL,
	[FormattedSgCode] [nvarchar](6) NULL,
	[ShortDesc] [nvarchar](60) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd9SgCode$SgId] UNIQUE CLUSTERED 
(
	[SgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Icd9SgLongCode]    Script Date: 6/25/2016 11:27:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Icd9SgLongCode](
	[SqId] [bigint] IDENTITY(1,1) NOT NULL,
	[SgCode] [nvarchar](5) NULL,
	[LongDesc] [nvarchar](300) NULL,
	[Active] [smallint] NULL,
	[Revision] [int] NULL,
 CONSTRAINT [Icd9SgLongCode$SqId] UNIQUE CLUSTERED 
(
	[SqId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ImmunizationObservation]    Script Date: 6/25/2016 11:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImmunizationObservation](
	[ImoId] [int] IDENTITY(1,1) NOT NULL,
	[ImoImId] [int] NOT NULL,
	[ImoPid] [int] NULL,
	[ImoCriteria] [nvarchar](255) NULL,
	[ImoCriteriaValue] [nvarchar](255) NULL,
	[ImoUser] [int] NULL,
	[ImoCode] [nvarchar](255) NULL,
	[ImoCodetext] [nvarchar](255) NULL,
	[ImoCodetype] [nvarchar](255) NULL,
	[ImoVisDatePublished] [date] NULL,
	[ImoVisDatePresented] [date] NULL,
	[ImoDateObservation] [datetime] NOT NULL,
 CONSTRAINT [PK_ImmunizationObservation_ImoId] PRIMARY KEY CLUSTERED 
(
	[ImoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Immunizations]    Script Date: 6/25/2016 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Immunizations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[AdministeredDate] [datetime2](0) NULL,
	[ImmunizationId] [int] NULL,
	[CvxCode] [nvarchar](10) NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[LotNumber] [nvarchar](50) NULL,
	[AdministeredById] [bigint] NULL,
	[AdministeredBy] [nvarchar](255) NULL,
	[EducationDate] [date] NULL,
	[VisDate] [date] NULL,
	[Note] [nvarchar](max) NULL,
	[CreateDate] [datetime2](0) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[AmountAdministered] [real] NULL,
	[AmountAdministeredUnit] [nvarchar](50) NULL,
	[ExpirationDate] [date] NULL,
	[Route] [nvarchar](100) NULL,
	[AdministrationSite] [nvarchar](100) NULL,
	[AddedErroneously] [smallint] NOT NULL,
	[ExternalId] [nvarchar](20) NULL,
	[CompletionStatus] [nvarchar](50) NULL,
	[InformationSource] [nvarchar](31) NULL,
	[RefusalReason] [nvarchar](31) NULL,
	[OrderingProvider] [int] NULL,
 CONSTRAINT [PK_Immunizations_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[InsuranceCompanies]    Script Date: 6/25/2016 11:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceCompanies](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Attn] [nvarchar](255) NULL,
	[CmsId] [nvarchar](15) NULL,
	[FreebType] [smallint] NULL,
	[X12ReceiverId] [nvarchar](25) NULL,
	[X12DefaultPartnerId] [int] NULL,
	[AltCmsId] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_InsuranceCompanies_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[InsuranceData]    Script Date: 6/25/2016 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](9) NULL,
	[Provider] [nvarchar](255) NULL,
	[PlanName] [nvarchar](255) NULL,
	[PolicyNumber] [nvarchar](255) NULL,
	[GroupNumber] [nvarchar](255) NULL,
	[SubscriberLname] [nvarchar](255) NULL,
	[SubscriberMname] [nvarchar](255) NULL,
	[SubscriberFname] [nvarchar](255) NULL,
	[SubscriberRelationship] [nvarchar](255) NULL,
	[SubscriberSs] [nvarchar](255) NULL,
	[SubscriberDOB] [date] NULL,
	[SubscriberStreet] [nvarchar](255) NULL,
	[SubscriberPostalCode] [nvarchar](255) NULL,
	[SubscriberCity] [nvarchar](255) NULL,
	[SubscriberState] [nvarchar](255) NULL,
	[SubscriberCountry] [nvarchar](255) NULL,
	[SubscriberPhone] [nvarchar](255) NULL,
	[SubscriberEmployer] [nvarchar](255) NULL,
	[SubscriberEmployerStreet] [nvarchar](255) NULL,
	[SubscriberEmployerPostalCode] [nvarchar](255) NULL,
	[SubscriberEmployerState] [nvarchar](255) NULL,
	[SubscriberEmployerCountry] [nvarchar](255) NULL,
	[SubscriberEmployerCity] [nvarchar](255) NULL,
	[Copay] [nvarchar](255) NULL,
	[Date] [date] NOT NULL,
	[Pid] [bigint] NOT NULL,
	[SubscriberSex] [nvarchar](25) NULL,
	[AcceptAssignment] [nvarchar](5) NOT NULL,
	[PolicyType] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_InsuranceData_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [InsuranceData$PidTypeDate] UNIQUE NONCLUSTERED 
(
	[Pid] ASC,
	[Type] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[InsuranceNumbers]    Script Date: 6/25/2016 11:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceNumbers](
	[Id] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[InsuranceCompanyId] [int] NULL,
	[ProviderNumber] [nvarchar](20) NULL,
	[RenderingProviderNumber] [nvarchar](20) NULL,
	[GroupNumber] [nvarchar](20) NULL,
	[ProviderNumberType] [nvarchar](4) NULL,
	[RenderingProviderNumberType] [nvarchar](4) NULL,
 CONSTRAINT [PK_InsuranceNumbers_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[IntegrationMapping]    Script Date: 6/25/2016 11:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntegrationMapping](
	[Id] [int] NOT NULL,
	[ForeignId] [int] NOT NULL,
	[ForeignTable] [nvarchar](125) NULL,
	[LocalId] [int] NOT NULL,
	[LocalTable] [nvarchar](125) NULL,
 CONSTRAINT [PK_IntegrationMapping_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [IntegrationMapping$ForeignId] UNIQUE NONCLUSTERED 
(
	[ForeignId] ASC,
	[ForeignTable] ASC,
	[LocalId] ASC,
	[LocalTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[IssueEncounter]    Script Date: 6/25/2016 11:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueEncounter](
	[Pid] [int] NOT NULL,
	[ListId] [int] NOT NULL,
	[Encounter] [int] NOT NULL,
	[Resolved] [smallint] NOT NULL,
 CONSTRAINT [PK_IssueEncounter_Pid] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC,
	[ListId] ASC,
	[Encounter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[IssueTypes]    Script Date: 6/25/2016 11:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueTypes](
	[Active] [smallint] NOT NULL,
	[Category] [nvarchar](75) NOT NULL,
	[Type] [nvarchar](75) NOT NULL,
	[Plural] [nvarchar](75) NOT NULL,
	[Singular] [nvarchar](75) NOT NULL,
	[Abbreviation] [nvarchar](75) NOT NULL,
	[Style] [smallint] NOT NULL,
	[ForceShow] [smallint] NOT NULL,
	[Ordering] [int] NOT NULL,
 CONSTRAINT [PK_IssueTypes_Category] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LangConstants]    Script Date: 6/25/2016 11:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangConstants](
	[ConsId] [int] IDENTITY(1,1) NOT NULL,
	[ConstantName] [nvarchar](max) NULL,
 CONSTRAINT [LangConstants$ConsId] UNIQUE CLUSTERED 
(
	[ConsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LangCustom]    Script Date: 6/25/2016 11:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangCustom](
	[LangDescription] [nvarchar](100) NOT NULL,
	[LangCode] [nchar](2) NOT NULL,
	[ConstantName] [nvarchar](max) NULL,
	[Definition] [nvarchar](max) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LangCustom_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LangDefinitions]    Script Date: 6/25/2016 11:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangDefinitions](
	[DefId] [int] IDENTITY(1,1) NOT NULL,
	[ConsId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[Definition] [nvarchar](max) NULL,
 CONSTRAINT [LangDefinitions$DefId] UNIQUE CLUSTERED 
(
	[DefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LangLanguages]    Script Date: 6/25/2016 11:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangLanguages](
	[LangId] [int] IDENTITY(2,1) NOT NULL,
	[LangCode] [nchar](2) NOT NULL,
	[LangDescription] [nvarchar](100) NULL,
	[LangIsRtl] [smallint] NULL,
 CONSTRAINT [LangLanguages$LangId] UNIQUE CLUSTERED 
(
	[LangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LayoutOptions]    Script Date: 6/25/2016 11:27:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutOptions](
	[FormId] [nvarchar](31) NOT NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[GroupName] [nvarchar](31) NOT NULL,
	[Title] [nvarchar](63) NOT NULL,
	[Seq] [int] NOT NULL,
	[DataType] [smallint] NOT NULL,
	[Uor] [smallint] NOT NULL,
	[FldLength] [int] NOT NULL,
	[MaxLength] [int] NOT NULL,
	[ListId] [nvarchar](31) NOT NULL,
	[Titlecols] [smallint] NOT NULL,
	[Datacols] [smallint] NOT NULL,
	[DefaultValue] [nvarchar](255) NOT NULL,
	[EditOptions] [nvarchar](36) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FldRows] [int] NOT NULL,
	[ListBackupId] [nvarchar](31) NOT NULL,
	[Source] [nchar](1) NOT NULL,
	[Conditions] [nvarchar](max) NULL,
 CONSTRAINT [PK_LayoutOptions_FormId] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC,
	[FieldId] ASC,
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LbfData]    Script Date: 6/25/2016 11:27:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LbfData](
	[FormId] [int] IDENTITY(1,1) NOT NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_LbfData_FormId] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LbtData]    Script Date: 6/25/2016 11:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LbtData](
	[FormId] [bigint] NOT NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_LbtData_FormId] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ListOptions]    Script Date: 6/25/2016 11:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOptions](
	[ListId] [nvarchar](31) NOT NULL,
	[OptionId] [nvarchar](31) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Seq] [int] NOT NULL,
	[IsDefault] [smallint] NOT NULL,
	[OptionValue] [real] NOT NULL,
	[Mapping] [nvarchar](31) NOT NULL,
	[Notes] [nvarchar](255) NOT NULL,
	[Codes] [nvarchar](255) NOT NULL,
	[ToggleSetting1] [smallint] NOT NULL,
	[ToggleSetting2] [smallint] NOT NULL,
	[Activity] [smallint] NOT NULL,
	[Subtype] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_ListOptions_ListId] PRIMARY KEY CLUSTERED 
(
	[ListId] ASC,
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Lists]    Script Date: 6/25/2016 11:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lists](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](31) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Begdate] [date] NULL,
	[Enddate] [date] NULL,
	[Returndate] [date] NULL,
	[Occurrence] [int] NULL,
	[Classification] [int] NULL,
	[Referredby] [nvarchar](255) NULL,
	[Extrainfo] [nvarchar](255) NULL,
	[Diagnosis] [nvarchar](255) NULL,
	[Activity] [smallint] NULL,
	[Comments] [nvarchar](max) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Outcome] [int] NOT NULL,
	[Destination] [nvarchar](255) NULL,
	[ReinjuryId] [bigint] NOT NULL,
	[InjuryPart] [nvarchar](31) NOT NULL,
	[InjuryType] [nvarchar](31) NOT NULL,
	[InjuryGrade] [nvarchar](31) NOT NULL,
	[Reaction] [nvarchar](255) NOT NULL,
	[ExternalAllergyid] [int] NULL,
	[ErxSource] [nvarchar](1) NOT NULL,
	[ErxUploaded] [nvarchar](1) NOT NULL,
	[Modifydate] [datetime] NOT NULL,
	[SeverityAl] [nvarchar](50) NULL,
	[ExternalId] [nvarchar](20) NULL,
 CONSTRAINT [PK_Lists_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ListsTouch]    Script Date: 6/25/2016 11:27:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListsTouch](
	[Pid] [bigint] NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[Date] [datetime2](0) NULL,
 CONSTRAINT [PK_ListsTouch_Pid] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/25/2016 11:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Event] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Comments] [nvarchar](max) NULL,
	[UserNotes] [nvarchar](max) NULL,
	[PatientId] [bigint] NULL,
	[Success] [smallint] NULL,
	[Checksum] [nvarchar](max) NULL,
	[CrtUser] [nvarchar](255) NULL,
	[LogFrom] [nvarchar](20) NULL,
	[MenuItemId] [int] NULL,
	[CcdaDocId] [int] NULL,
 CONSTRAINT [PK_Log_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[LogCommentEncrypt]    Script Date: 6/25/2016 11:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCommentEncrypt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogId] [int] NOT NULL,
	[Encrypt] [nvarchar](3) NOT NULL,
	[Checksum] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogCommentEncrypt_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[MiscAddressBook]    Script Date: 6/25/2016 11:28:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiscAddressBook](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](255) NULL,
	[Mname] [nvarchar](255) NULL,
	[Lname] [nvarchar](255) NULL,
	[Street] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[Zip] [nvarchar](20) NULL,
	[Phone] [nvarchar](30) NULL,
 CONSTRAINT [PK_MiscAddressBook_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModuleAclGroupSettings]    Script Date: 6/25/2016 11:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAclGroupSettings](
	[ModuleId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Allowed] [smallint] NULL,
 CONSTRAINT [PK_ModuleAclGroupSettings_ModuleId] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC,
	[GroupId] ASC,
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModuleAclSections]    Script Date: 6/25/2016 11:28:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAclSections](
	[SectionId] [int] NULL,
	[SectionName] [nvarchar](255) NULL,
	[ParentSection] [int] NULL,
	[SectionIdentifier] [nvarchar](50) NULL,
	[ModuleId] [int] NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ModuleAclSections_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModuleAclUserSettings]    Script Date: 6/25/2016 11:28:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAclUserSettings](
	[ModuleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Allowed] [int] NULL,
 CONSTRAINT [PK_ModuleAclUserSettings_ModuleId] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC,
	[UserId] ASC,
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModuleConfiguration]    Script Date: 6/25/2016 11:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleConfiguration](
	[ModuleConfigId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModuleId] [bigint] NOT NULL,
	[FieldName] [nvarchar](45) NOT NULL,
	[FieldValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ModuleConfiguration_ModuleConfigId] PRIMARY KEY CLUSTERED 
(
	[ModuleConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Modules]    Script Date: 6/25/2016 11:28:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[ModId] [int] IDENTITY(1,1) NOT NULL,
	[ModName] [nvarchar](64) NOT NULL,
	[ModDirectory] [nvarchar](64) NOT NULL,
	[ModParent] [nvarchar](64) NOT NULL,
	[ModType] [nvarchar](64) NOT NULL,
	[ModActive] [bigint] NOT NULL,
	[ModUiName] [nvarchar](20) NOT NULL,
	[ModRelativeLink] [nvarchar](64) NOT NULL,
	[ModUiOrder] [smallint] NOT NULL,
	[ModUiActive] [bigint] NOT NULL,
	[ModDescription] [nvarchar](255) NOT NULL,
	[ModNickName] [nvarchar](25) NOT NULL,
	[ModEncMenu] [nvarchar](10) NOT NULL,
	[PermissionsItemTable] [nchar](100) NULL,
	[Directory] [nvarchar](255) NOT NULL,
	[Date] [datetime2](0) NOT NULL,
	[SqlRun] [smallint] NULL,
	[Type] [smallint] NULL,
 CONSTRAINT [PK_Modules_ModId] PRIMARY KEY CLUSTERED 
(
	[ModId] ASC,
	[ModDirectory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModulesHooksSettings]    Script Date: 6/25/2016 11:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulesHooksSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModId] [int] NULL,
	[EnabledHooks] [nvarchar](255) NULL,
	[AttachedTo] [nvarchar](45) NULL,
 CONSTRAINT [PK_ModulesHooksSettings_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ModulesSettings]    Script Date: 6/25/2016 11:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulesSettings](
	[ModId] [int] NULL,
	[FldType] [smallint] NULL,
	[ObjName] [nvarchar](255) NULL,
	[MenuName] [nvarchar](255) NULL,
	[Path] [nvarchar](255) NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ModulesSettings_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Notes]    Script Date: 6/25/2016 11:28:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] NOT NULL,
	[ForeignId] [int] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Owner] [int] NULL,
	[Date] [datetime2](0) NULL,
	[Revision] [datetime] NOT NULL,
 CONSTRAINT [PK_Notes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[NotificationLog]    Script Date: 6/25/2016 11:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationLog](
	[ILogId] [int] IDENTITY(5,1) NOT NULL,
	[Pid] [int] NOT NULL,
	[PcEid] [bigint] NULL,
	[SmsGatewayType] [nvarchar](50) NOT NULL,
	[SmsgatewayInfo] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[EmailSender] [nvarchar](255) NOT NULL,
	[EmailSubject] [nvarchar](255) NOT NULL,
	[Type] [nvarchar](5) NOT NULL,
	[PatientInfo] [nvarchar](max) NULL,
	[PcEventDate] [date] NOT NULL,
	[PcEndDate] [date] NOT NULL,
	[PcStartTime] [time](7) NOT NULL,
	[PcEndTime] [time](7) NOT NULL,
	[DSentDateTime] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_NotificationLog_ILogId] PRIMARY KEY CLUSTERED 
(
	[ILogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[NotificationSettings]    Script Date: 6/25/2016 11:28:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationSettings](
	[SettingsId] [int] IDENTITY(2,1) NOT NULL,
	[SendSMSBeforeHours] [int] NOT NULL,
	[SendEmailBeforeHours] [int] NOT NULL,
	[SMSGatewayUsername] [nvarchar](100) NOT NULL,
	[SMSGatewayPassword] [nvarchar](100) NOT NULL,
	[SMSGatewayApikey] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationSettings_SettingsId] PRIMARY KEY CLUSTERED 
(
	[SettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Onotes]    Script Date: 6/25/2016 11:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Onotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Body] [nvarchar](max) NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Activity] [smallint] NULL,
 CONSTRAINT [PK_Onotes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboModules]    Script Date: 6/25/2016 11:28:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboModules](
	[PnId] [bigint] IDENTITY(47,1) NOT NULL,
	[PnName] [nvarchar](64) NULL,
	[PnType] [int] NOT NULL,
	[PnDisplayname] [nvarchar](64) NULL,
	[PnDescription] [nvarchar](255) NULL,
	[PnRegid] [bigint] NOT NULL,
	[PnDirectory] [nvarchar](64) NULL,
	[PnVersion] [nvarchar](10) NULL,
	[PnAdminCapable] [smallint] NOT NULL,
	[PnUserCapable] [smallint] NOT NULL,
	[PnState] [smallint] NOT NULL,
 CONSTRAINT [PK_OpendboModules_PnId] PRIMARY KEY CLUSTERED 
(
	[PnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboModuleVars]    Script Date: 6/25/2016 11:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboModuleVars](
	[PnId] [bigint] IDENTITY(235,1) NOT NULL,
	[PnModname] [nvarchar](64) NULL,
	[PnName] [nvarchar](64) NULL,
	[PnValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_OpendboModuleVars_PnId] PRIMARY KEY CLUSTERED 
(
	[PnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboPostcalendarCategories]    Script Date: 6/25/2016 11:28:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboPostcalendarCategories](
	[PcCatid] [bigint] IDENTITY(14,1) NOT NULL,
	[PcCatname] [nvarchar](100) NULL,
	[PcCatcolor] [nvarchar](50) NULL,
	[PcCatdesc] [nvarchar](max) NULL,
	[PcRecurrtype] [int] NOT NULL,
	[PcEnddate] [date] NULL,
	[PcRecurrspec] [nvarchar](max) NULL,
	[PcRecurrfreq] [int] NOT NULL,
	[PcDuration] [bigint] NOT NULL,
	[PcEndDateFlag] [smallint] NOT NULL,
	[PcEndDateType] [int] NULL,
	[PcEndDateFreq] [int] NOT NULL,
	[PcEndAllDay] [smallint] NOT NULL,
	[PcDailylimit] [int] NOT NULL,
	[PcCattype] [int] NOT NULL,
	[PcActive] [smallint] NOT NULL,
	[PcSeq] [int] NOT NULL,
 CONSTRAINT [PK_OpendboPostcalendarCategories_PcCatid] PRIMARY KEY CLUSTERED 
(
	[PcCatid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboPostcalendarEvents]    Script Date: 6/25/2016 11:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboPostcalendarEvents](
	[PcEid] [bigint] IDENTITY(7,1) NOT NULL,
	[PcCatid] [int] NOT NULL,
	[PcMultiple] [bigint] NOT NULL,
	[PcAid] [nvarchar](30) NULL,
	[PcPid] [nvarchar](11) NULL,
	[PcTitle] [nvarchar](150) NULL,
	[PcTime] [datetime2](0) NULL,
	[PcHometext] [nvarchar](max) NULL,
	[PcComments] [int] NULL,
	[PcCounter] [int] NULL,
	[PcTopic] [int] NOT NULL,
	[PcInformant] [nvarchar](20) NULL,
	[PcEventDate] [date] NOT NULL,
	[PcEndDate] [date] NOT NULL,
	[PcDuration] [bigint] NOT NULL,
	[PcRecurrtype] [int] NOT NULL,
	[PcRecurrspec] [nvarchar](max) NULL,
	[PcRecurrfreq] [int] NOT NULL,
	[PcStartTime] [time](7) NULL,
	[PcEndTime] [time](7) NULL,
	[PcAlldayevent] [int] NOT NULL,
	[PcLocation] [nvarchar](max) NULL,
	[PcConttel] [nvarchar](50) NULL,
	[PcContname] [nvarchar](50) NULL,
	[PcContemail] [nvarchar](255) NULL,
	[PcWebsite] [nvarchar](255) NULL,
	[PcFee] [nvarchar](50) NULL,
	[PcEventstatus] [int] NOT NULL,
	[PcSharing] [int] NOT NULL,
	[PcLanguage] [nvarchar](30) NULL,
	[PcApptstatus] [nvarchar](15) NOT NULL,
	[PcPrefcatid] [int] NOT NULL,
	[PcFacility] [smallint] NOT NULL,
	[PcSendalertsms] [nvarchar](3) NOT NULL,
	[PcSendalertemail] [nvarchar](3) NOT NULL,
	[PcBillingLocation] [smallint] NOT NULL,
	[PcRoom] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_OpendboPostcalendarEvents_PcEid] PRIMARY KEY CLUSTERED 
(
	[PcEid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboPostcalendarLimits]    Script Date: 6/25/2016 11:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboPostcalendarLimits](
	[PcLimitid] [int] IDENTITY(1,1) NOT NULL,
	[PcCatid] [int] NOT NULL,
	[PcStarttime] [time](7) NOT NULL,
	[PcEndtime] [time](7) NOT NULL,
	[PcLimit] [int] NOT NULL,
 CONSTRAINT [PK_OpendboPostcalendarLimits_PcLimitid] PRIMARY KEY CLUSTERED 
(
	[PcLimitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboPostcalendarTopics]    Script Date: 6/25/2016 11:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpendboPostcalendarTopics](
	[PcCatid] [bigint] IDENTITY(1,1) NOT NULL,
	[PcCatname] [nvarchar](100) NULL,
	[PcCatcolor] [nvarchar](50) NULL,
	[PcCatdesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_OpendboPostcalendarTopics_PcCatid] PRIMARY KEY CLUSTERED 
(
	[PcCatid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OpendboSessionInfo]    Script Date: 6/25/2016 11:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpendboSessionInfo](
	[PnSessid] [nvarchar](32) NOT NULL,
	[PnIpaddr] [nvarchar](20) NULL,
	[PnFirstused] [int] NOT NULL,
	[PnLastused] [int] NOT NULL,
	[PnUid] [int] NOT NULL,
	[PnVars] [varbinary](max) NULL,
 CONSTRAINT [PK_OpendboSessionInfo_PnSessid] PRIMARY KEY CLUSTERED 
(
	[PnSessid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientAccessOffsite]    Script Date: 6/25/2016 11:28:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAccessOffsite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NOT NULL,
	[PortalUsername] [nvarchar](100) NOT NULL,
	[PortalPwd] [nvarchar](100) NOT NULL,
	[PortalPwdStatus] [smallint] NULL,
	[AuthorizeNetId] [nvarchar](20) NULL,
	[PortalRelation] [nvarchar](100) NULL,
 CONSTRAINT [PK_PatientAccessOffsite_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [PatientAccessOffsite$Pid] UNIQUE NONCLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientAccessOnsite]    Script Date: 6/25/2016 11:28:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAccessOnsite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[PortalUsername] [nvarchar](100) NULL,
	[PortalPwd] [nvarchar](100) NULL,
	[PortalPwdStatus] [smallint] NULL,
	[PortalSalt] [nvarchar](100) NULL,
 CONSTRAINT [PK_PatientAccessOnsite_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientData]    Script Date: 6/25/2016 11:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Language] [nvarchar](255) NOT NULL,
	[Financial] [nvarchar](255) NOT NULL,
	[Fname] [nvarchar](255) NOT NULL,
	[Lname] [nvarchar](255) NOT NULL,
	[Mname] [nvarchar](255) NOT NULL,
	[DOB] [date] NULL,
	[Street] [nvarchar](255) NOT NULL,
	[PostalCode] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NOT NULL,
	[CountryCode] [nvarchar](255) NOT NULL,
	[DriversLicense] [nvarchar](255) NOT NULL,
	[Ss] [nvarchar](255) NOT NULL,
	[Occupation] [nvarchar](max) NULL,
	[PhoneHome] [nvarchar](255) NOT NULL,
	[PhoneBiz] [nvarchar](255) NOT NULL,
	[PhoneContact] [nvarchar](255) NOT NULL,
	[PhoneCell] [nvarchar](255) NOT NULL,
	[PharmacyId] [int] NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
	[ContactRelationship] [nvarchar](255) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Sex] [nvarchar](255) NOT NULL,
	[Referrer] [nvarchar](255) NOT NULL,
	[ReferrerID] [nvarchar](255) NOT NULL,
	[ProviderID] [int] NULL,
	[RefProviderID] [int] NULL,
	[Email] [nvarchar](255) NOT NULL,
	[EmailDirect] [nvarchar](255) NOT NULL,
	[Ethnoracial] [nvarchar](255) NOT NULL,
	[Race] [nvarchar](255) NOT NULL,
	[Ethnicity] [nvarchar](255) NOT NULL,
	[Religion] [nvarchar](40) NOT NULL,
	[Interpretter] [nvarchar](255) NOT NULL,
	[Migrantseasonal] [nvarchar](255) NOT NULL,
	[FamilySize] [nvarchar](255) NOT NULL,
	[MonthlyIncome] [nvarchar](255) NOT NULL,
	[BillingNote] [nvarchar](max) NULL,
	[Homeless] [nvarchar](255) NOT NULL,
	[FinancialReview] [datetime2](0) NULL,
	[Pubpid] [nvarchar](255) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[Genericname1] [nvarchar](255) NOT NULL,
	[Genericval1] [nvarchar](255) NOT NULL,
	[Genericname2] [nvarchar](255) NOT NULL,
	[Genericval2] [nvarchar](255) NOT NULL,
	[HipaaMail] [nvarchar](3) NOT NULL,
	[HipaaVoice] [nvarchar](3) NOT NULL,
	[HipaaNotice] [nvarchar](3) NOT NULL,
	[HipaaMessage] [nvarchar](20) NOT NULL,
	[HipaaAllowsms] [nvarchar](3) NOT NULL,
	[HipaaAllowemail] [nvarchar](3) NOT NULL,
	[Squad] [nvarchar](32) NOT NULL,
	[Fitness] [int] NOT NULL,
	[ReferralSource] [nvarchar](30) NOT NULL,
	[Pricelevel] [nvarchar](255) NOT NULL,
	[Regdate] [date] NULL,
	[Contrastart] [date] NULL,
	[CompletedAd] [nvarchar](3) NOT NULL,
	[AdReviewed] [date] NULL,
	[Vfc] [nvarchar](255) NOT NULL,
	[Mothersname] [nvarchar](255) NOT NULL,
	[Guardiansname] [nvarchar](max) NULL,
	[AllowImmRegUse] [nvarchar](255) NOT NULL,
	[AllowImmInfoShare] [nvarchar](255) NOT NULL,
	[AllowHealthInfoEx] [nvarchar](255) NOT NULL,
	[AllowPatientPortal] [nvarchar](31) NOT NULL,
	[DeceasedDate] [datetime2](0) NULL,
	[DeceasedReason] [nvarchar](255) NOT NULL,
	[SoapImportStatus] [smallint] NULL,
	[CmsportalLogin] [nvarchar](60) NOT NULL,
	[CareTeam] [int] NULL,
	[County] [nvarchar](40) NOT NULL,
	[Industry] [nvarchar](max) NULL,
	[ImmRegStatus] [nvarchar](max) NULL,
	[ImmRegStatEffdate] [nvarchar](max) NULL,
	[PublicityCode] [nvarchar](max) NULL,
	[PublCodeEffDate] [nvarchar](max) NULL,
	[ProtectIndicator] [nvarchar](max) NULL,
	[ProtIndiEffdate] [nvarchar](max) NULL,
	[Guardianrelationship] [nvarchar](max) NULL,
	[Guardiansex] [nvarchar](max) NULL,
	[Guardianaddress] [nvarchar](max) NULL,
	[Guardiancity] [nvarchar](max) NULL,
	[Guardianstate] [nvarchar](max) NULL,
	[Guardianpostalcode] [nvarchar](max) NULL,
	[Guardiancountry] [nvarchar](max) NULL,
	[Guardianphone] [nvarchar](max) NULL,
	[Guardianworkphone] [nvarchar](max) NULL,
	[Guardianemail] [nvarchar](max) NULL,
 CONSTRAINT [PatientData$Pid] UNIQUE CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientPortalMenu]    Script Date: 6/25/2016 11:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientPortalMenu](
	[PatientPortalMenuId] [int] IDENTITY(14,1) NOT NULL,
	[PatientPortalMenuGroupId] [int] NULL,
	[MenuName] [nvarchar](40) NULL,
	[MenuOrder] [smallint] NULL,
	[MenuStatus] [smallint] NULL,
 CONSTRAINT [PK_PatientPortalMenu_PatientPortalMenuId] PRIMARY KEY CLUSTERED 
(
	[PatientPortalMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientReminders]    Script Date: 6/25/2016 11:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientReminders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Active] [smallint] NOT NULL,
	[DateInactivated] [datetime2](0) NULL,
	[ReasonInactivated] [nvarchar](31) NOT NULL,
	[DueStatus] [nvarchar](31) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[Category] [nvarchar](31) NOT NULL,
	[Item] [nvarchar](31) NOT NULL,
	[DateCreated] [datetime2](0) NULL,
	[DateSent] [datetime2](0) NULL,
	[VoiceStatus] [smallint] NOT NULL,
	[SmsStatus] [smallint] NOT NULL,
	[EmailStatus] [smallint] NOT NULL,
	[MailStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_PatientReminders_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientTracker]    Script Date: 6/25/2016 11:29:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTracker](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Apptdate] [date] NULL,
	[Appttime] [time](7) NULL,
	[Eid] [bigint] NOT NULL,
	[Pid] [bigint] NOT NULL,
	[OriginalUser] [nvarchar](255) NOT NULL,
	[Encounter] [bigint] NOT NULL,
	[Lastseq] [nvarchar](4) NOT NULL,
	[RandomDrugTest] [smallint] NULL,
	[DrugScreenCompleted] [smallint] NOT NULL,
 CONSTRAINT [PK_PatientTracker_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PatientTrackerElement]    Script Date: 6/25/2016 11:29:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTrackerElement](
	[PtTrackerId] [bigint] NOT NULL,
	[StartDatetime] [datetime2](0) NULL,
	[Room] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](31) NOT NULL,
	[Seq] [nvarchar](4) NOT NULL,
	[User] [nvarchar](255) NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientTrackerElement_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PaymentGatewayDetails]    Script Date: 6/25/2016 11:29:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGatewayDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NULL,
	[LoginId] [nvarchar](255) NULL,
	[TransactionKey] [nvarchar](255) NULL,
	[Md5] [nvarchar](255) NULL,
 CONSTRAINT [PK_PaymentGatewayDetails_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/25/2016 11:29:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pid] [bigint] NOT NULL,
	[Dtime] [datetime2](0) NOT NULL,
	[Encounter] [bigint] NOT NULL,
	[User] [nvarchar](255) NULL,
	[Method] [nvarchar](255) NULL,
	[Source] [nvarchar](255) NULL,
	[Amount1] [decimal](12, 2) NOT NULL,
	[Amount2] [decimal](12, 2) NOT NULL,
	[Posted1] [decimal](12, 2) NOT NULL,
	[Posted2] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_Payments_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Pharmacies]    Script Date: 6/25/2016 11:29:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacies](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[TransmitMethod] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_Pharmacies_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 6/25/2016 11:29:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[Id] [int] NOT NULL,
	[CountryCode] [nvarchar](5) NULL,
	[AreaCode] [nchar](3) NULL,
	[Prefix] [nchar](3) NULL,
	[Number] [nvarchar](4) NULL,
	[Type] [int] NULL,
	[ForeignId] [int] NULL,
 CONSTRAINT [PK_PhoneNumbers_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaBookmark]    Script Date: 6/25/2016 11:29:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaBookmark](
	[Id] [int] IDENTITY(10,1) NOT NULL,
	[Dbase] [nvarchar](255) NULL,
	[User] [nvarchar](255) NULL,
	[Label] [nvarchar](255) NULL,
	[Query] [nvarchar](max) NULL,
 CONSTRAINT [PK_PmaBookmark_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaColumnInfo]    Script Date: 6/25/2016 11:29:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaColumnInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DbName] [nvarchar](64) NULL,
	[TableName] [nvarchar](64) NULL,
	[ColumnName] [nvarchar](64) NULL,
	[Comment] [nvarchar](255) NULL,
	[Mimetype] [nvarchar](255) NULL,
	[Transformation] [nvarchar](255) NULL,
	[TransformationOptions] [nvarchar](255) NULL,
 CONSTRAINT [PK_PmaColumnInfo_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [PmaColumnInfo$DbName] UNIQUE NONCLUSTERED 
(
	[DbName] ASC,
	[TableName] ASC,
	[ColumnName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaHistory]    Script Date: 6/25/2016 11:29:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](64) NULL,
	[Db] [nvarchar](64) NULL,
	[Table] [nvarchar](64) NULL,
	[Timevalue] [datetime] NOT NULL,
	[Sqlquery] [nvarchar](max) NULL,
 CONSTRAINT [PK_PmaHistory_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaPdfPages]    Script Date: 6/25/2016 11:29:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaPdfPages](
	[DbName] [nvarchar](64) NULL,
	[PageNr] [bigint] IDENTITY(1,1) NOT NULL,
	[PageDescr] [nvarchar](50) NULL,
 CONSTRAINT [PK_PmaPdfPages_PageNr] PRIMARY KEY CLUSTERED 
(
	[PageNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaRelation]    Script Date: 6/25/2016 11:29:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaRelation](
	[MasterDb] [nvarchar](64) NOT NULL,
	[MasterTable] [nvarchar](64) NOT NULL,
	[MasterField] [nvarchar](64) NOT NULL,
	[ForeignDb] [nvarchar](64) NULL,
	[ForeignTable] [nvarchar](64) NULL,
	[ForeignField] [nvarchar](64) NULL,
 CONSTRAINT [PK_PmaRelation_MasterDb] PRIMARY KEY CLUSTERED 
(
	[MasterDb] ASC,
	[MasterTable] ASC,
	[MasterField] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaTableCoords]    Script Date: 6/25/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaTableCoords](
	[DbName] [nvarchar](64) NOT NULL,
	[TableName] [nvarchar](64) NOT NULL,
	[PdfPageNumber] [int] NOT NULL,
	[X] [real] NOT NULL,
	[Y] [real] NOT NULL,
 CONSTRAINT [PK_PmaTableCoords_DbName] PRIMARY KEY CLUSTERED 
(
	[DbName] ASC,
	[TableName] ASC,
	[PdfPageNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PmaTableInfo]    Script Date: 6/25/2016 11:29:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PmaTableInfo](
	[DbName] [nvarchar](64) NOT NULL,
	[TableName] [nvarchar](64) NOT NULL,
	[DisplayField] [nvarchar](64) NULL,
 CONSTRAINT [PK_PmaTableInfo_DbName] PRIMARY KEY CLUSTERED 
(
	[DbName] ASC,
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Pnotes]    Script Date: 6/25/2016 11:29:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pnotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Body] [nvarchar](max) NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NULL,
	[Groupname] [nvarchar](255) NULL,
	[Activity] [smallint] NULL,
	[Authorized] [smallint] NULL,
	[Title] [nvarchar](255) NULL,
	[AssignedTo] [nvarchar](255) NULL,
	[Deleted] [smallint] NULL,
	[MessageStatus] [nvarchar](20) NOT NULL,
	[PortalRelation] [nvarchar](100) NULL,
	[IsMsgEncrypted] [smallint] NULL,
 CONSTRAINT [PK_Pnotes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 6/25/2016 11:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[FilledById] [int] NULL,
	[PharmacyId] [int] NULL,
	[DateAdded] [date] NULL,
	[DateModified] [date] NULL,
	[ProviderId] [int] NULL,
	[Encounter] [int] NULL,
	[StartDate] [date] NULL,
	[Drug] [nvarchar](150) NULL,
	[DrugId] [int] NOT NULL,
	[RxnormDrugcode] [int] NULL,
	[Form] [int] NULL,
	[Dosage] [nvarchar](100) NULL,
	[Quantity] [nvarchar](31) NULL,
	[Size] [nvarchar](16) NULL,
	[Unit] [int] NULL,
	[Route] [int] NULL,
	[Interval] [int] NULL,
	[Substitute] [int] NULL,
	[Refills] [int] NULL,
	[PerRefill] [int] NULL,
	[FilledDate] [date] NULL,
	[Medication] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Active] [int] NOT NULL,
	[Datetime] [datetime2](0) NULL,
	[User] [nvarchar](50) NULL,
	[Site] [nvarchar](50) NULL,
	[Prescriptionguid] [nvarchar](50) NULL,
	[ErxSource] [smallint] NOT NULL,
	[ErxUploaded] [smallint] NOT NULL,
	[DrugInfoErx] [nvarchar](max) NULL,
	[ExternalId] [nvarchar](20) NULL,
	[EndDate] [date] NULL,
	[Indication] [nvarchar](max) NULL,
	[Prn] [nvarchar](30) NULL,
 CONSTRAINT [PK_Prescriptions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Prices]    Script Date: 6/25/2016 11:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PrId] [nvarchar](11) NOT NULL,
	[PrSelector] [nvarchar](255) NOT NULL,
	[PrLevel] [nvarchar](31) NOT NULL,
	[PrPrice] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_Prices_PrId] PRIMARY KEY CLUSTERED 
(
	[PrId] ASC,
	[PrSelector] ASC,
	[PrLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureAnswers]    Script Date: 6/25/2016 11:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureAnswers](
	[ProcedureOrderId] [bigint] NOT NULL,
	[ProcedureOrderSeq] [int] NOT NULL,
	[QuestionCode] [nvarchar](31) NOT NULL,
	[AnswerSeq] [int] NOT NULL,
	[Answer] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ProcedureAnswers_ProcedureOrderId] PRIMARY KEY CLUSTERED 
(
	[ProcedureOrderId] ASC,
	[ProcedureOrderSeq] ASC,
	[QuestionCode] ASC,
	[AnswerSeq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureOrder]    Script Date: 6/25/2016 11:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureOrder](
	[ProcedureOrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderId] [bigint] NOT NULL,
	[PatientId] [bigint] NOT NULL,
	[EncounterId] [bigint] NOT NULL,
	[DateCollected] [datetime2](0) NULL,
	[DateOrdered] [date] NULL,
	[OrderPriority] [nvarchar](31) NOT NULL,
	[OrderStatus] [nvarchar](31) NOT NULL,
	[PatientInstructions] [nvarchar](max) NULL,
	[Activity] [smallint] NOT NULL,
	[ControlId] [nvarchar](255) NOT NULL,
	[LabId] [bigint] NOT NULL,
	[SpecimenType] [nvarchar](31) NOT NULL,
	[SpecimenLocation] [nvarchar](31) NOT NULL,
	[SpecimenVolume] [nvarchar](30) NOT NULL,
	[DateTransmitted] [datetime2](0) NULL,
	[ClinicalHx] [nvarchar](255) NOT NULL,
	[ExternalId] [nvarchar](20) NULL,
 CONSTRAINT [PK_ProcedureOrder_ProcedureOrderId] PRIMARY KEY CLUSTERED 
(
	[ProcedureOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureOrderCode]    Script Date: 6/25/2016 11:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureOrderCode](
	[ProcedureOrderId] [bigint] NOT NULL,
	[ProcedureOrderSeq] [int] NOT NULL,
	[ProcedureCode] [nvarchar](31) NOT NULL,
	[ProcedureName] [nvarchar](255) NOT NULL,
	[ProcedureSource] [nchar](1) NOT NULL,
	[Diagnoses] [nvarchar](max) NULL,
	[DoNotSend] [smallint] NOT NULL,
	[ProcedureOrderTitle] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderCode_ProcedureOrderId] PRIMARY KEY CLUSTERED 
(
	[ProcedureOrderId] ASC,
	[ProcedureOrderSeq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureProviders]    Script Date: 6/25/2016 11:29:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureProviders](
	[Ppid] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Npi] [nvarchar](15) NOT NULL,
	[SendAppId] [nvarchar](255) NOT NULL,
	[SendFacId] [nvarchar](255) NOT NULL,
	[RecvAppId] [nvarchar](255) NOT NULL,
	[RecvFacId] [nvarchar](255) NOT NULL,
	[DorP] [nchar](1) NOT NULL,
	[Direction] [nchar](1) NOT NULL,
	[Protocol] [nvarchar](15) NOT NULL,
	[RemoteHost] [nvarchar](255) NOT NULL,
	[Login] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[OrdersPath] [nvarchar](255) NOT NULL,
	[ResultsPath] [nvarchar](255) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[LabDirector] [bigint] NOT NULL,
 CONSTRAINT [PK_ProcedureProviders_Ppid] PRIMARY KEY CLUSTERED 
(
	[Ppid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureQuestions]    Script Date: 6/25/2016 11:29:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureQuestions](
	[LabId] [bigint] NOT NULL,
	[ProcedureCode] [nvarchar](31) NOT NULL,
	[QuestionCode] [nvarchar](31) NOT NULL,
	[Seq] [int] NOT NULL,
	[QuestionText] [nvarchar](255) NOT NULL,
	[Required] [smallint] NOT NULL,
	[Maxsize] [int] NOT NULL,
	[Fldtype] [nchar](1) NOT NULL,
	[Options] [nvarchar](max) NULL,
	[Tips] [nvarchar](255) NOT NULL,
	[Activity] [smallint] NOT NULL,
 CONSTRAINT [PK_ProcedureQuestions_LabId] PRIMARY KEY CLUSTERED 
(
	[LabId] ASC,
	[ProcedureCode] ASC,
	[QuestionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureReport]    Script Date: 6/25/2016 11:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureReport](
	[ProcedureReportId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProcedureOrderId] [bigint] NULL,
	[ProcedureOrderSeq] [int] NOT NULL,
	[DateCollected] [datetime2](0) NULL,
	[DateCollectedTz] [nvarchar](5) NULL,
	[DateReport] [datetime2](0) NULL,
	[DateReportTz] [nvarchar](5) NULL,
	[Source] [bigint] NOT NULL,
	[SpecimenNum] [nvarchar](63) NOT NULL,
	[ReportStatus] [nvarchar](31) NOT NULL,
	[ReviewStatus] [nvarchar](31) NOT NULL,
	[ReportNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProcedureReport_ProcedureReportId] PRIMARY KEY CLUSTERED 
(
	[ProcedureReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureResult]    Script Date: 6/25/2016 11:29:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureResult](
	[ProcedureResultId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProcedureReportId] [bigint] NOT NULL,
	[ResultDataType] [nchar](1) NOT NULL,
	[ResultCode] [nvarchar](31) NOT NULL,
	[ResultText] [nvarchar](255) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Facility] [nvarchar](255) NOT NULL,
	[Units] [nvarchar](31) NOT NULL,
	[Result] [nvarchar](255) NOT NULL,
	[Range] [nvarchar](255) NOT NULL,
	[Abnormal] [nvarchar](31) NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[DocumentId] [bigint] NOT NULL,
	[ResultStatus] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_ProcedureResult_ProcedureResultId] PRIMARY KEY CLUSTERED 
(
	[ProcedureResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProcedureType]    Script Date: 6/25/2016 11:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureType](
	[ProcedureTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Parent] [bigint] NOT NULL,
	[Name] [nvarchar](63) NOT NULL,
	[LabId] [bigint] NOT NULL,
	[ProcedureCode] [nvarchar](31) NOT NULL,
	[ProcedureType] [nvarchar](31) NOT NULL,
	[BodySite] [nvarchar](31) NOT NULL,
	[Specimen] [nvarchar](31) NOT NULL,
	[RouteAdmin] [nvarchar](31) NOT NULL,
	[Laterality] [nvarchar](31) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[StandardCode] [nvarchar](255) NOT NULL,
	[RelatedCode] [nvarchar](255) NOT NULL,
	[Units] [nvarchar](31) NOT NULL,
	[Range] [nvarchar](255) NOT NULL,
	[Seq] [int] NOT NULL,
	[Activity] [smallint] NOT NULL,
	[Notes] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ProcedureType_ProcedureTypeId] PRIMARY KEY CLUSTERED 
(
	[ProcedureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ProductWarehouse]    Script Date: 6/25/2016 11:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWarehouse](
	[PwDrugId] [int] NOT NULL,
	[PwWarehouse] [nvarchar](31) NOT NULL,
	[PwMinLevel] [real] NULL,
	[PwMaxLevel] [real] NULL,
 CONSTRAINT [PK_ProductWarehouse_PwDrugId] PRIMARY KEY CLUSTERED 
(
	[PwDrugId] ASC,
	[PwWarehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Registry]    Script Date: 6/25/2016 11:30:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registry](
	[Name] [nvarchar](255) NULL,
	[State] [smallint] NULL,
	[Directory] [nvarchar](255) NULL,
	[Id] [bigint] IDENTITY(21,1) NOT NULL,
	[SqlRun] [smallint] NULL,
	[Unpackaged] [smallint] NULL,
	[Date] [datetime2](0) NULL,
	[Priority] [int] NULL,
	[Category] [nvarchar](255) NULL,
	[Nickname] [nvarchar](255) NULL,
 CONSTRAINT [PK_Registry_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ReportItemized]    Script Date: 6/25/2016 11:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportItemized](
	[ReportId] [bigint] NOT NULL,
	[ItemizedTestId] [smallint] NOT NULL,
	[NumeratorLabel] [nvarchar](25) NOT NULL,
	[Pass] [smallint] NOT NULL,
	[Pid] [bigint] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ReportItemized_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ReportResults]    Script Date: 6/25/2016 11:30:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportResults](
	[ReportId] [bigint] NOT NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportResults_ReportId] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RuleAction]    Script Date: 6/25/2016 11:30:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleAction](
	[Id] [nvarchar](31) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[Category] [nvarchar](31) NOT NULL,
	[Item] [nvarchar](31) NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RuleAction_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RuleActionItem]    Script Date: 6/25/2016 11:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleActionItem](
	[Category] [nvarchar](31) NOT NULL,
	[Item] [nvarchar](31) NOT NULL,
	[ClinRemLink] [nvarchar](255) NOT NULL,
	[ReminderMessage] [nvarchar](max) NULL,
	[CustomFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_RuleActionItem_Category] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RuleFilter]    Script Date: 6/25/2016 11:30:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleFilter](
	[Id] [nvarchar](31) NOT NULL,
	[IncludeFlag] [smallint] NOT NULL,
	[RequiredFlag] [smallint] NOT NULL,
	[Method] [nvarchar](31) NOT NULL,
	[MethodDetail] [nvarchar](31) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RuleFilter_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RulePatientData]    Script Date: 6/25/2016 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RulePatientData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Pid] [bigint] NOT NULL,
	[Category] [nvarchar](31) NOT NULL,
	[Item] [nvarchar](31) NOT NULL,
	[Complete] [nvarchar](31) NOT NULL,
	[Result] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_RulePatientData_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RuleReminder]    Script Date: 6/25/2016 11:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleReminder](
	[Id] [nvarchar](31) NOT NULL,
	[Method] [nvarchar](31) NOT NULL,
	[MethodDetail] [nvarchar](31) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RuleReminder_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[RuleTarget]    Script Date: 6/25/2016 11:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleTarget](
	[Id] [nvarchar](31) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[IncludeFlag] [smallint] NOT NULL,
	[RequiredFlag] [smallint] NOT NULL,
	[Method] [nvarchar](31) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[Interval] [bigint] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RuleTarget_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Sequences]    Script Date: 6/25/2016 11:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sequences](
	[Id] [bigint] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sequences_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SharedAttributes]    Script Date: 6/25/2016 11:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharedAttributes](
	[Pid] [bigint] NOT NULL,
	[Encounter] [bigint] NOT NULL,
	[FieldId] [nvarchar](31) NOT NULL,
	[LastUpdate] [datetime2](0) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_SharedAttributes_Pid] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC,
	[Encounter] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[StandardizedTablesTrack]    Script Date: 6/25/2016 11:30:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardizedTablesTrack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportedDate] [datetime2](0) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[RevisionVersion] [nvarchar](255) NOT NULL,
	[RevisionDate] [datetime2](0) NULL,
	[FileChecksum] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_StandardizedTablesTrack_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SupportedExternalDataloads]    Script Date: 6/25/2016 11:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportedExternalDataloads](
	[LoadId] [bigint] IDENTITY(34,1) NOT NULL,
	[LoadType] [nvarchar](24) NOT NULL,
	[LoadSource] [nvarchar](24) NOT NULL,
	[LoadReleaseDate] [date] NOT NULL,
	[LoadFilename] [nvarchar](256) NOT NULL,
	[LoadChecksum] [nvarchar](32) NOT NULL,
 CONSTRAINT [SupportedExternalDataloads$LoadId] UNIQUE CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SyndromicSurveillance]    Script Date: 6/25/2016 11:30:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyndromicSurveillance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ListsId] [bigint] NOT NULL,
	[SubmissionDate] [datetime2](0) NOT NULL,
	[Filename] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SyndromicSurveillance_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TemplateUsers]    Script Date: 6/25/2016 11:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemplateUsers](
	[TuId] [int] IDENTITY(1,1) NOT NULL,
	[TuUserId] [int] NULL,
	[TuFacilityId] [int] NULL,
	[TuTemplateId] [int] NULL,
	[TuTemplateOrder] [int] NULL,
 CONSTRAINT [PK_TemplateUsers_TuId] PRIMARY KEY CLUSTERED 
(
	[TuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [TemplateUsers$Templateuser] UNIQUE NONCLUSTERED 
(
	[TuUserId] ASC,
	[TuTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/25/2016 11:30:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](0) NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Pid] [bigint] NULL,
	[User] [nvarchar](255) NOT NULL,
	[Groupname] [nvarchar](255) NOT NULL,
	[Authorized] [smallint] NULL,
 CONSTRAINT [PK_Transactions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/25/2016 11:30:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](max) NULL,
	[Authorized] [smallint] NULL,
	[Info] [nvarchar](max) NULL,
	[Source] [smallint] NULL,
	[Fname] [nvarchar](255) NULL,
	[Mname] [nvarchar](255) NULL,
	[Lname] [nvarchar](255) NULL,
	[Federaltaxid] [nvarchar](255) NULL,
	[Federaldrugid] [nvarchar](255) NULL,
	[Upin] [nvarchar](255) NULL,
	[Facility] [nvarchar](255) NULL,
	[FacilityId] [int] NOT NULL,
	[SeeAuth] [int] NOT NULL,
	[Active] [smallint] NOT NULL,
	[Npi] [nvarchar](15) NULL,
	[Title] [nvarchar](30) NULL,
	[Specialty] [nvarchar](255) NULL,
	[Billname] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[EmailDirect] [nvarchar](255) NOT NULL,
	[Url] [nvarchar](255) NULL,
	[Assistant] [nvarchar](255) NULL,
	[Organization] [nvarchar](255) NULL,
	[Valedictory] [nvarchar](255) NULL,
	[Street] [nvarchar](60) NULL,
	[Streetb] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](30) NULL,
	[Zip] [nvarchar](20) NULL,
	[Street2] [nvarchar](60) NULL,
	[Streetb2] [nvarchar](60) NULL,
	[City2] [nvarchar](30) NULL,
	[State2] [nvarchar](30) NULL,
	[Zip2] [nvarchar](20) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Phonew1] [nvarchar](30) NULL,
	[Phonew2] [nvarchar](30) NULL,
	[Phonecell] [nvarchar](30) NULL,
	[Notes] [nvarchar](max) NULL,
	[CalUi] [smallint] NOT NULL,
	[Taxonomy] [nvarchar](30) NOT NULL,
	[SsiRelayhealth] [nvarchar](64) NULL,
	[Calendar] [smallint] NOT NULL,
	[AbookType] [nvarchar](31) NOT NULL,
	[PwdExpirationDate] [date] NULL,
	[PwdHistory1] [nvarchar](max) NULL,
	[PwdHistory2] [nvarchar](max) NULL,
	[DefaultWarehouse] [nvarchar](31) NOT NULL,
	[Irnpool] [nvarchar](31) NOT NULL,
	[StateLicenseNumber] [nvarchar](25) NULL,
	[NewcropUserRole] [nvarchar](30) NULL,
	[Cpoe] [smallint] NULL,
	[PhysicianType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 6/25/2016 11:30:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSettings](
	[SettingUser] [bigint] NOT NULL,
	[SettingLabel] [nvarchar](63) NOT NULL,
	[SettingValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_UserSettings_SettingUser] PRIMARY KEY CLUSTERED 
(
	[SettingUser] ASC,
	[SettingLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[UsersFacility]    Script Date: 6/25/2016 11:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersFacility](
	[Tablename] [nvarchar](64) NOT NULL,
	[TableId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
 CONSTRAINT [PK_UsersFacility_Tablename] PRIMARY KEY CLUSTERED 
(
	[Tablename] ASC,
	[TableId] ASC,
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[UsersSecure]    Script Date: 6/25/2016 11:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersSecure](
	[Id] [bigint] NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Salt] [nvarchar](255) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[PasswordHistory1] [nvarchar](255) NULL,
	[SaltHistory1] [nvarchar](255) NULL,
	[PasswordHistory2] [nvarchar](255) NULL,
	[SaltHistory2] [nvarchar](255) NULL,
 CONSTRAINT [PK_UsersSecure_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [UsersSecure$USERNAMEID] UNIQUE NONCLUSTERED 
(
	[Id] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Valueset]    Script Date: 6/25/2016 11:30:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valueset](
	[NqfCode] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[CodeSystem] [nvarchar](255) NOT NULL,
	[CodeType] [nvarchar](255) NULL,
	[Valueset] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[ValuesetName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Valueset_NqfCode] PRIMARY KEY CLUSTERED 
(
	[NqfCode] ASC,
	[Code] ASC,
	[Valueset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[version]    Script Date: 6/25/2016 11:30:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version](
	[vMajor] [int] NOT NULL,
	[vMinor] [int] NOT NULL,
	[vPatch] [int] NOT NULL,
	[vRealpatch] [int] NOT NULL,
	[vTag] [nvarchar](31) NOT NULL,
	[vDatabase] [int] NOT NULL,
	[vAcl] [int] NOT NULL,
	[ssma$rowid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_version_ssma$rowid] PRIMARY KEY CLUSTERED 
(
	[ssma$rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[X12Partners]    Script Date: 6/25/2016 11:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[X12Partners](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IdNumber] [nvarchar](255) NULL,
	[X12SenderId] [nvarchar](255) NULL,
	[X12ReceiverId] [nvarchar](255) NULL,
	[X12Version] [nvarchar](255) NULL,
	[ProcessingFormat] [nvarchar](8) NULL,
	[X12Isa01] [nvarchar](2) NOT NULL,
	[X12Isa02] [nvarchar](10) NOT NULL,
	[X12Isa03] [nvarchar](2) NOT NULL,
	[X12Isa04] [nvarchar](10) NOT NULL,
	[X12Isa05] [nchar](2) NOT NULL,
	[X12Isa07] [nchar](2) NOT NULL,
	[X12Isa14] [nchar](1) NOT NULL,
	[X12Isa15] [nchar](1) NOT NULL,
	[X12Gs02] [nvarchar](15) NOT NULL,
	[X12Per06] [nvarchar](80) NOT NULL,
	[X12Gs03] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_X12Partners_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignId] ON [dbo].[Addresses]
(
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [AmcId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [AmcId] ON [dbo].[AmcMiscData]
(
	[AmcId] ASC,
	[Pid] ASC,
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [amendmentPid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [amendmentPid] ON [dbo].[Amendments]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [amendmentHistoryId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [amendmentHistoryId] ON [dbo].[AmendmentsHistory]
(
	[AmendmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [sessionId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [sessionId] ON [dbo].[arActivity]
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [depositDate]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [depositDate] ON [dbo].[arSession]
(
	[depositDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [userClosed]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [userClosed] ON [dbo].[arSession]
(
	[userId] ASC,
	[closed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[Billing]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Lft]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Lft] ON [dbo].[Categories]
(
	[Lft] ASC,
	[Rght] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Parent]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Parent] ON [dbo].[Categories]
(
	[Parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Category] ON [dbo].[ClinicalRulesLog]
(
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[ClinicalRulesLog]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Uid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Uid] ON [dbo].[ClinicalRulesLog]
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Code]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Code] ON [dbo].[Codes]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [CodeType]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [CodeType] ON [dbo].[Codes]
(
	[CodeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Lft]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Lft] ON [dbo].[Config]
(
	[Lft] ASC,
	[Rght] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Parent]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Parent] ON [dbo].[Config]
(
	[Parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [DrFromID]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [DrFromID] ON [dbo].[DatedReminders]
(
	[DrFromID] ASC,
	[DrMessageDueDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [DrId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [DrId] ON [dbo].[DatedRemindersLink]
(
	[DrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ToId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ToId] ON [dbo].[DatedRemindersLink]
(
	[ToId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [MsgId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [MsgId] ON [dbo].[DirectMessageLog]
(
	[MsgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PatientId] ON [dbo].[DirectMessageLog]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignId] ON [dbo].[Documents]
(
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Owner]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Owner] ON [dbo].[Documents]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Revision]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Revision] ON [dbo].[Documents]
(
	[Revision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [InsuranceId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [InsuranceId] ON [dbo].[EligibilityVerification]
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[EmployerData]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RuleEncId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [RuleEncId] ON [dbo].[EncCategoryMap]
(
	[RuleEncId] ASC,
	[MainCatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Table]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Table] ON [dbo].[EsignSignatures]
(
	[Table] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Tid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Tid] ON [dbo].[EsignSignatures]
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PatientId] ON [dbo].[ExtendedLog]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Uid] ON [dbo].[FacilityUserIds]
(
	[Uid] ASC,
	[FacilityId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [EncounterDate]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [EncounterDate] ON [dbo].[FormEncounter]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PidEncounter]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PidEncounter] ON [dbo].[FormEncounter]
(
	[Pid] ASC,
	[Encounter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [FormId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [FormId] ON [dbo].[Forms]
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PidEncounter]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PidEncounter] ON [dbo].[Forms]
(
	[Pid] ASC,
	[Encounter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[FormVitals]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDXCOUNTRIESNAME]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [IDXCOUNTRIESNAME] ON [dbo].[GeoCountryReference]
(
	[CountriesName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [key2]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [key2] ON [dbo].[gprelations]
(
	[type2] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[HistoryData]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Active] ON [dbo].[Icd10DxOrderCode]
(
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FormattedDxCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [FormattedDxCode] ON [dbo].[Icd10DxOrderCode]
(
	[FormattedDxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Active] ON [dbo].[Icd10PcsOrderCode]
(
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PcsCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PcsCode] ON [dbo].[Icd10PcsOrderCode]
(
	[PcsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Active] ON [dbo].[Icd9DxCode]
(
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [DxCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [DxCode] ON [dbo].[Icd9DxCode]
(
	[DxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FormattedDxCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [FormattedDxCode] ON [dbo].[Icd9DxCode]
(
	[FormattedDxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Active]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Active] ON [dbo].[Icd9SgCode]
(
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FormattedSgCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [FormattedSgCode] ON [dbo].[Icd9SgCode]
(
	[FormattedSgCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SgCode]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [SgCode] ON [dbo].[Icd9SgCode]
(
	[SgCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PatientId] ON [dbo].[Immunizations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ConsId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ConsId] ON [dbo].[LangDefinitions]
(
	[ConsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[Lists]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Type]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Type] ON [dbo].[Lists]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Date]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Date] ON [dbo].[Notes]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignId] ON [dbo].[Notes]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ForeignId2]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignId2] ON [dbo].[Notes]
(
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PnModname]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PnModname] ON [dbo].[OpendboModuleVars]
(
	[PnModname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PnName]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PnName] ON [dbo].[OpendboModuleVars]
(
	[PnName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [BasicCat]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [BasicCat] ON [dbo].[OpendboPostcalendarCategories]
(
	[PcCatname] ASC,
	[PcCatcolor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [BasicEvent]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [BasicEvent] ON [dbo].[OpendboPostcalendarEvents]
(
	[PcCatid] ASC,
	[PcAid] ASC,
	[PcEventDate] ASC,
	[PcEndDate] ASC,
	[PcEventstatus] ASC,
	[PcSharing] ASC,
	[PcTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PcEventDate]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PcEventDate] ON [dbo].[OpendboPostcalendarEvents]
(
	[PcEventDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [BasicCat]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [BasicCat] ON [dbo].[OpendboPostcalendarTopics]
(
	[PcCatname] ASC,
	[PcCatcolor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Id] ON [dbo].[PatientData]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Category] ON [dbo].[PatientReminders]
(
	[Category] ASC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[PatientReminders]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Eid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Eid] ON [dbo].[PatientTracker]
(
	[Eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[PatientTracker]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PtTrackerId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PtTrackerId] ON [dbo].[PatientTrackerElement]
(
	[PtTrackerId] ASC,
	[Seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[Payments]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ForeignId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignId] ON [dbo].[PhoneNumbers]
(
	[ForeignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Username]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Username] ON [dbo].[PmaHistory]
(
	[Username] ASC,
	[Db] ASC,
	[Table] ASC,
	[Timevalue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [DbName]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [DbName] ON [dbo].[PmaPdfPages]
(
	[DbName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ForeignField]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ForeignField] ON [dbo].[PmaRelation]
(
	[ForeignDb] ASC,
	[ForeignTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[Pnotes]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PatientId] ON [dbo].[Prescriptions]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [datepid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [datepid] ON [dbo].[ProcedureOrder]
(
	[DateOrdered] ASC,
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [PatientId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [PatientId] ON [dbo].[ProcedureOrder]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [procedureOrderId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [procedureOrderId] ON [dbo].[ProcedureReport]
(
	[ProcedureOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [procedureReportId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [procedureReportId] ON [dbo].[ProcedureResult]
(
	[ProcedureReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [parent]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [parent] ON [dbo].[ProcedureType]
(
	[Parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ReportId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ReportId] ON [dbo].[ReportItemized]
(
	[ReportId] ASC,
	[ItemizedTestId] ASC,
	[NumeratorLabel] ASC,
	[Pass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Id] ON [dbo].[RuleAction]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Id] ON [dbo].[RuleFilter]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Category]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Category] ON [dbo].[RulePatientData]
(
	[Category] ASC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[RulePatientData]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Id] ON [dbo].[RuleReminder]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Id]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Id] ON [dbo].[RuleTarget]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [ListsId]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [ListsId] ON [dbo].[SyndromicSurveillance]
(
	[ListsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Pid]    Script Date: 6/25/2016 11:30:50 PM ******/
CREATE NONCLUSTERED INDEX [Pid] ON [dbo].[Transactions]
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [Line1]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [Line2]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [Zip]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [PlusFour]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [Country]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [ForeignId]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (N'') FOR [AmcId]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (N'') FOR [MapCategory]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT ((0)) FOR [MapId]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (NULL) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (NULL) FOR [DateCompleted]
GO
ALTER TABLE [dbo].[AmcMiscData] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[Amendments] ADD  DEFAULT (NULL) FOR [AmendmentStatus]
GO
ALTER TABLE [dbo].[Amendments] ADD  DEFAULT (NULL) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Amendments] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Amendments] ADD  DEFAULT (NULL) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[AmendmentsHistory] ADD  DEFAULT (NULL) FOR [AmendmentStatus]
GO
ALTER TABLE [dbo].[AmendmentsHistory] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[AmendmentsHistory] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT (N'') FOR [CodeType]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT (N'') FOR [modifier]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT (N'') FOR [memo]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT ((0.00)) FOR [payAmount]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT ((0.00)) FOR [adjAmount]
GO
ALTER TABLE [dbo].[arActivity] ADD  DEFAULT (NULL) FOR [reasonCode]
GO
ALTER TABLE [dbo].[Array] ADD  DEFAULT (NULL) FOR [ArrayKey]
GO
ALTER TABLE [dbo].[Array] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT ((0)) FOR [closed]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT (N'') FOR [reference]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT (NULL) FOR [checkDate]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT (NULL) FOR [depositDate]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT ((0.00)) FOR [payTotal]
GO
ALTER TABLE [dbo].[arSession] ADD  DEFAULT (getdate()) FOR [createdTime]
GO
ALTER TABLE [dbo].[AuditDetails] ADD  DEFAULT (N'1') FOR [EntryIdentification]
GO
ALTER TABLE [dbo].[AuditMaster] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[AutomaticNotification] ADD  DEFAULT (N'SMS') FOR [Type]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT ((-1)) FOR [Running]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT (getdate()) FOR [NextRun]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT ((0)) FOR [ExecuteInterval]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT (NULL) FOR [RequireOnce]
GO
ALTER TABLE [dbo].[BackgroundServices] ADD  DEFAULT ((100)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Batchcom] ADD  DEFAULT ((0)) FOR [PatientId]
GO
ALTER TABLE [dbo].[Batchcom] ADD  DEFAULT ((0)) FOR [SentBy]
GO
ALTER TABLE [dbo].[Batchcom] ADD  DEFAULT (NULL) FOR [MsgType]
GO
ALTER TABLE [dbo].[Batchcom] ADD  DEFAULT (NULL) FOR [MsgSubject]
GO
ALTER TABLE [dbo].[Batchcom] ADD  DEFAULT (getdate()) FOR [MsgDateSent]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [CodeType]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [ProviderId]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Billed]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [PayerId]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT ((0)) FOR [BillProcess]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [BillDate]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [ProcessFile]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Modifier]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Units]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Fee]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Justify]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [Target]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [X12PartnerId]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [NdcInfo]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (N'') FOR [Notecodes]
GO
ALTER TABLE [dbo].[Billing] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (NULL) FOR [Value]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [Parent]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [Lft]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [Rght]
GO
ALTER TABLE [dbo].[CategoriesSeq] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[CategoriesToDocuments] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[CategoriesToDocuments] ADD  DEFAULT ((0)) FOR [DocumentId]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [pid]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [encounter]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [time]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (getdate()) FOR [updatedDate]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [userId]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [couchDocid]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT (NULL) FOR [couchRevid]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT ((0)) FOR [View]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT ((0)) FOR [Transfer]
GO
ALTER TABLE [dbo].[ccda] ADD  DEFAULT ((0)) FOR [dboTransfer]
GO
ALTER TABLE [dbo].[ccdaComponents] ADD  DEFAULT (NULL) FOR [ccdaComponentsField]
GO
ALTER TABLE [dbo].[ccdaComponents] ADD  DEFAULT (NULL) FOR [ccdaComponentsName]
GO
ALTER TABLE [dbo].[ccdaFieldMapping] ADD  DEFAULT (NULL) FOR [tableId]
GO
ALTER TABLE [dbo].[ccdaFieldMapping] ADD  DEFAULT (NULL) FOR [ccdaField]
GO
ALTER TABLE [dbo].[ccdaSections] ADD  DEFAULT (NULL) FOR [ccdaComponentsId]
GO
ALTER TABLE [dbo].[ccdaSections] ADD  DEFAULT (NULL) FOR [ccdaSectionsField]
GO
ALTER TABLE [dbo].[ccdaSections] ADD  DEFAULT (NULL) FOR [ccdaSectionsName]
GO
ALTER TABLE [dbo].[ccdaSections] ADD  DEFAULT ((1)) FOR [ccdaSectionsReqMapping]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [ccdaComponent]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [ccdaComponentSection]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [formDir]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [formType]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [formTable]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (NULL) FOR [userId]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[ccdaTableMapping] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[chartTracker] ADD  DEFAULT ((0)) FOR [ctUserid]
GO
ALTER TABLE [dbo].[chartTracker] ADD  DEFAULT (N'') FOR [ctLocation]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT ((0)) FOR [PayerId]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT ((0)) FOR [PayerType]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT ((0)) FOR [BillProcess]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT (NULL) FOR [BillTime]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT (NULL) FOR [ProcessTime]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT (NULL) FOR [ProcessFile]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT (NULL) FOR [Target]
GO
ALTER TABLE [dbo].[Claims] ADD  DEFAULT ((0)) FOR [X12PartnerId]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (NULL) FOR [NormalFlag]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (NULL) FOR [CqmFlag]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (NULL) FOR [Cqm2011Flag]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (NULL) FOR [Cqm2014Flag]
GO
ALTER TABLE [dbo].[ClinicalPlans] ADD  DEFAULT (N'') FOR [CqmMeasureGroup]
GO
ALTER TABLE [dbo].[ClinicalPlansRules] ADD  DEFAULT (N'') FOR [PlanId]
GO
ALTER TABLE [dbo].[ClinicalPlansRules] ADD  DEFAULT (N'') FOR [RuleId]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [ActiveAlertFlag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [PassiveAlertFlag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [CqmFlag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Cqm2011Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Cqm2014Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [CqmNqfCode]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [CqmPqriCode]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [AmcFlag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Amc2011Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Amc2014Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [AmcCode]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [AmcCode2014]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Amc2014Stage1Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [Amc2014Stage2Flag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (NULL) FOR [PatientReminderFlag]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [Developer]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [FundingSource]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [ReleaseVersion]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'') FOR [WebReference]
GO
ALTER TABLE [dbo].[ClinicalRules] ADD  DEFAULT (N'Patients:med') FOR [AccessControl]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] ADD  DEFAULT ((0)) FOR [Uid]
GO
ALTER TABLE [dbo].[ClinicalRulesLog] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [CodeText]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [CodeTextShort]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (NULL) FOR [CodeType]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [Modifier]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (NULL) FOR [Units]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (NULL) FOR [Fee]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [Superbill]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [RelatedCode]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT (N'') FOR [Taxrates]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT ((0)) FOR [CypFactor]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT ((0)) FOR [Reportable]
GO
ALTER TABLE [dbo].[Codes] ADD  DEFAULT ((0)) FOR [FinancialReporting]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctSeq]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctMod]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT (N'') FOR [ctJust]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT (N'') FOR [ctMask]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctFee]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctRel]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctNofs]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctDiag]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((1)) FOR [ctActive]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT (N'') FOR [ctLabel]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctExternal]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctClaim]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctProc]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctTerm]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctProblem]
GO
ALTER TABLE [dbo].[codeTypes] ADD  DEFAULT ((0)) FOR [ctDrug]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (NULL) FOR [Value]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT ((0)) FOR [Parent]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT ((0)) FOR [Lft]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT ((0)) FOR [Rght]
GO
ALTER TABLE [dbo].[ConfigSeq] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT (NULL) FOR [ClListItemId]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT (NULL) FOR [ClListItemShort]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT (NULL) FOR [ClListItemLevel]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT (NULL) FOR [ClOrder]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT ((0)) FOR [ClDeleted]
GO
ALTER TABLE [dbo].[Customlists] ADD  DEFAULT (NULL) FOR [ClCreator]
GO
ALTER TABLE [dbo].[DatedReminders] ADD  DEFAULT ((0)) FOR [MessageProcessed]
GO
ALTER TABLE [dbo].[DatedReminders] ADD  DEFAULT (NULL) FOR [ProcessedDate]
GO
ALTER TABLE [dbo].[DirectMessageLog] ADD  DEFAULT (getdate()) FOR [CreateTs]
GO
ALTER TABLE [dbo].[DirectMessageLog] ADD  DEFAULT (NULL) FOR [StatusInfo]
GO
ALTER TABLE [dbo].[DirectMessageLog] ADD  DEFAULT (NULL) FOR [StatusTs]
GO
ALTER TABLE [dbo].[DirectMessageLog] ADD  DEFAULT (NULL) FOR [PatientId]
GO
ALTER TABLE [dbo].[DirectMessageLog] ADD  DEFAULT (NULL) FOR [UserId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Size]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Url]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Mimetype]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Pages]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Owner]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (getdate()) FOR [Revision]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [ForeignId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Docdate]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [Hash]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [ListId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [CouchDocid]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [CouchRevid]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [Storagemethod]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((1)) FOR [PathDepth]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [Imported]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [EncounterId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((0)) FOR [EncounterCheck]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((1)) FOR [AuditMasterApprovalStatus]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [AuditMasterId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT (NULL) FOR [DocumentationOf]
GO
ALTER TABLE [dbo].[DocumentsLegalCategories] ADD  DEFAULT (NULL) FOR [DlcCategoryParent]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (NULL) FOR [DldPid]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (NULL) FOR [DldFacility]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (NULL) FOR [DldProvider]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (NULL) FOR [DldEncounter]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (getdate()) FOR [DldSignedTime]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT (NULL) FOR [DldFilepath]
GO
ALTER TABLE [dbo].[DocumentsLegalDetail] ADD  DEFAULT ((0)) FOR [DldMoved]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmCategory]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmSubcategory]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmFacility]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmProvider]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmSavedsign]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT (NULL) FOR [DlmReview]
GO
ALTER TABLE [dbo].[DocumentsLegalMaster] ADD  DEFAULT ((0)) FOR [DlmUploadType]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [LotNumber]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [Expiration]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [Manufacturer]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT ((0)) FOR [OnHand]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (N'') FOR [WarehouseId]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT ((0)) FOR [VendorId]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (getdate()) FOR [LastNotify]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [DestroyDate]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [DestroyMethod]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [DestroyWitness]
GO
ALTER TABLE [dbo].[DrugInventory] ADD  DEFAULT (NULL) FOR [DestroyNotes]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT (N'') FOR [NdcNumber]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [OnOrder]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [ReorderPoint]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [MaxLevel]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT (getdate()) FOR [LastNotify]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [Form]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [Unit]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [Route]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [Substitute]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT (N'') FOR [RelatedCode]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [CypFactor]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((0)) FOR [AllowCombining]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT ((1)) FOR [AllowMultiple]
GO
ALTER TABLE [dbo].[Drugs] ADD  DEFAULT (NULL) FOR [DrugCode]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [PrescriptionId]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [Encounter]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0.00)) FOR [Fee]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [Billed]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [XferInventoryId]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT ((0)) FOR [DistributorId]
GO
ALTER TABLE [dbo].[DrugSales] ADD  DEFAULT (N'') FOR [Notes]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT (N'') FOR [Selector]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT (NULL) FOR [Dosage]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT ((0)) FOR [Period]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT ((0)) FOR [Refills]
GO
ALTER TABLE [dbo].[DrugTemplates] ADD  DEFAULT (NULL) FOR [Taxrates]
GO
ALTER TABLE [dbo].[EligibilityResponse] ADD  DEFAULT (NULL) FOR [ResponseDescription]
GO
ALTER TABLE [dbo].[EligibilityResponse] ADD  DEFAULT (N'A') FOR [ResponseStatus]
GO
ALTER TABLE [dbo].[EligibilityResponse] ADD  DEFAULT (NULL) FOR [ResponseVendorId]
GO
ALTER TABLE [dbo].[EligibilityResponse] ADD  DEFAULT (NULL) FOR [ResponseCreateDate]
GO
ALTER TABLE [dbo].[EligibilityResponse] ADD  DEFAULT (NULL) FOR [ResponseModifyDate]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [ResponseId]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [InsuranceId]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [EligibilityCheckDate]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [Copay]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [Deductible]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (N'Y') FOR [Deductiblemet]
GO
ALTER TABLE [dbo].[EligibilityVerification] ADD  DEFAULT (NULL) FOR [CreateDate]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [Street]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [PostalCode]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [Country]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[EmployerData] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[EncCategoryMap] ADD  DEFAULT (N'') FOR [RuleEncId]
GO
ALTER TABLE [dbo].[EncCategoryMap] ADD  DEFAULT ((0)) FOR [MainCatId]
GO
ALTER TABLE [dbo].[EncCategoryMap] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[EsignSignatures] ADD  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[ExtendedLog] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[ExtendedLog] ADD  DEFAULT (NULL) FOR [Event]
GO
ALTER TABLE [dbo].[ExtendedLog] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[ExtendedLog] ADD  DEFAULT (NULL) FOR [Recipient]
GO
ALTER TABLE [dbo].[ExtendedLog] ADD  DEFAULT (NULL) FOR [PatientId]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EeDate]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EePid]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EeProviderId]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EeFacilityId]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EeEncounterDiagnosis]
GO
ALTER TABLE [dbo].[ExternalEncounters] ADD  DEFAULT (NULL) FOR [EeExternalId]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpDate]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpCodeType]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpCode]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpPid]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpEncounter]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpFacilityId]
GO
ALTER TABLE [dbo].[ExternalProcedures] ADD  DEFAULT (NULL) FOR [EpExternalId]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Fax]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Street]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [PostalCode]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [CountryCode]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [FederalEin]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Website]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT ((1)) FOR [ServiceLocation]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT ((0)) FOR [BillingLocation]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT ((0)) FOR [AcceptsAssignment]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [PosCode]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [X12SenderId]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [Attn]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [DomainIdentifier]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [FacilityNpi]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (N'') FOR [TaxIdType]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (N'') FOR [Color]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT ((0)) FOR [PrimaryBusinessEntity]
GO
ALTER TABLE [dbo].[Facility] ADD  DEFAULT (NULL) FOR [FacilityCode]
GO
ALTER TABLE [dbo].[FacilityUserIds] ADD  DEFAULT (NULL) FOR [Uid]
GO
ALTER TABLE [dbo].[FacilityUserIds] ADD  DEFAULT (NULL) FOR [FacilityId]
GO
ALTER TABLE [dbo].[FeeSheetOptions] ADD  DEFAULT (NULL) FOR [FsCategory]
GO
ALTER TABLE [dbo].[FeeSheetOptions] ADD  DEFAULT (NULL) FOR [FsOption]
GO
ALTER TABLE [dbo].[FeeSheetOptions] ADD  DEFAULT (NULL) FOR [FsCodes]
GO
ALTER TABLE [dbo].[FeeSheetOptions] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[FormCarePlan] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[FormClinicalInstructions] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormDictation] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [FacilityId]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [OnsetDate]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [Sensitivity]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((5)) FOR [PcCatid]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [LastLevelBilled]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [LastLevelClosed]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [LastStmtDate]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [StmtCount]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [ProviderId]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [SupervisorId]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (N'') FOR [InvoiceRefno]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (N'') FOR [ReferralSource]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT ((0)) FOR [BillingFacility]
GO
ALTER TABLE [dbo].[FormEncounter] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[FormFunctionalCognitiveStatus] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [EmploymentRelated]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [AutoAccident]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [AccidentState]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [OtherAccident]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [OutsideLab]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [LabAmount]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [IsUnableToWork]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [DateInitialTreatment]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [OffWorkFrom]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [OffWorkTo]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [IsHospitalized]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [HospitalizationDateFrom]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [HospitalizationDateTo]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [MedicaidResubmissionCode]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [MedicaidOriginalReference]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [PriorAuthNumber]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Comments]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT ((0)) FOR [ReplacementClaim]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Box14DateQual]
GO
ALTER TABLE [dbo].[FormMiscBillingOptions] ADD  DEFAULT (NULL) FOR [Box15DateQual]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Observation]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [ObValue]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [ObUnit]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [CodeType]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (NULL) FOR [TableCode]
GO
ALTER TABLE [dbo].[FormObservation] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Fever]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Chills]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [NightSweats]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [WeightLoss]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [PoorAppetite]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Insomnia]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Fatigued]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Depressed]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Hyperactive]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ExposureToForeignCountries]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Cataracts]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CataractSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Glaucoma]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [DoubleVision]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BlurredVision]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [PoorHearing]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Headaches]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [RingingInEars]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BloodyNose]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Sinusitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [SinusSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [DryMouth]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [StrepThroat]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Tonsillectomy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [SwollenLymphNodes]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ThroatCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ThroatCancerSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HeartAttack]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [IrregularHeartBeat]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ChestPains]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ShortnessOfBreath]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HighBloodPressure]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HeartFailure]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [PoorCirculation]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [VascularSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CardiacCatheterization]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CoronaryArteryBypass]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HeartTransplant]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [StressTest]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Emphysema]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ChronicBronchitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [InterstitialLungDisease]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ShortnessOfBreath2]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [LungCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [LungCancerSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Pheumothorax]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [StomachPains]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [PepticUlcerDisease]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Gastritis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Endoscopy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Polyps]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Colonoscopy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ColonCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ColonCancerSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [UlcerativeColitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CrohnsDisease]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Appendectomy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Divirticulitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [DivirticulitisSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [GallStones]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Cholecystectomy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Hepatitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CirrhosisOfTheLiver]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Splenectomy]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KidneyFailure]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KidneyStones]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KidneyCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KidneyInfections]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BladderInfections]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BladderCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ProstateProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ProstateCancer]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KidneyTransplant]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [SexuallyTransmittedDisease]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BurningWithUrination]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [DischargeFromUrethra]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Rashes]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Infections]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Ulcerations]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Pemphigus]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Herpes]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Osetoarthritis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [RheumotoidArthritis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Lupus]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [AnkylosingSondlilitis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [SwollenJoints]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [StiffJoints]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BrokenBones]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [NeckProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BackProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [BackSurgery]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Scoliosis]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HerniatedDisc]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ShoulderProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [ElbowProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [WristProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HandProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [HipProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [KneeProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [AnkleProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [FootProblems]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [InsulinDependentDiabetes]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [NoninsulinDependentDiabetes]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Hypothyroidism]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [Hyperthyroidism]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [CushingSyndrom]
GO
ALTER TABLE [dbo].[FormReviewofs] ADD  DEFAULT (NULL) FOR [AddisonSyndrom]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [WeightChange]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Weakness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Fatigue]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Anorexia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Fever]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Chills]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [NightSweats]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Insomnia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Irritability]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [HeatOrCold]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Intolerance]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ChangeInVision]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [GlaucomaHistory]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [EyePain]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Irritation]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Redness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ExcessiveTearing]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [DoubleVision]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [BlindSpots]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Photophobia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [HearingLoss]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Discharge]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Pain]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Vertigo]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Tinnitus]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FrequentColds]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SoreThroat]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SinusProblems]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [PostNasalDrip]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Nosebleed]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Snoring]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Apnea]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [BreastMass]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [BreastDischarge]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Biopsy]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [AbnormalMammogram]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Cough]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Sputum]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ShortnessOfBreath]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Wheezing]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hemoptsyis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Asthma]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Copd]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ChestPain]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Palpitation]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Syncope]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Pnd]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Doe]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Orthopnea]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Peripheal]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Edema]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [LegpainCramping]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [HistoryMurmur]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Arrythmia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [HeartProblem]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Dysphagia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Heartburn]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Bloating]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Belching]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Flatulence]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Nausea]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Vomiting]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hematemesis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [GastroPain]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FoodIntolerance]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hepatitis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Jaundice]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hematochezia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ChangedBowel]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Diarrhea]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Constipation]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Polyuria]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Polydypsia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Dysuria]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hematuria]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Frequency]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Urgency]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Incontinence]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [RenalStones]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Utis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hesitancy]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Dribbling]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Stream]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Nocturia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Erections]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Ejaculations]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [G]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [P]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Ap]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Lc]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Mearche]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Menopause]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Lmp]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FFrequency]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FFlow]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FSymptoms]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [AbnormalHairGrowth]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FHirsutism]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [JointPain]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Swelling]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [MRedness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [MWarm]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [MStiffness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Muscle]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [MAches]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Fms]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Arthritis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Loc]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Seizures]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Stroke]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Tia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [NNumbness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [NWeakness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Paralysis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [IntellectualDecline]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [MemoryProblems]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Dementia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [NHeadache]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SCancer]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Psoriasis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SAcne]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SOther]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SDisease]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [PDiagnosis]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [PMedication]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Depression]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Anxiety]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [SocialDifficulties]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [ThyroidProblems]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Diabetes]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [AbnormalBlood]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Anemia]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FhBloodProblems]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [BleedingProblems]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Allergies]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [FrequentIllness]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [Hiv]
GO
ALTER TABLE [dbo].[FormRos] ADD  DEFAULT (NULL) FOR [HaiStatus]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [FormId]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[Forms] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT ((0)) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormSoap] ADD  DEFAULT ((0)) FOR [Activity]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0)) FOR [Authorized]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0)) FOR [Activity]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [Bps]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [Bpd]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [Weight]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [Height]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [Temperature]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [TempMethod]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [Pulse]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [Respiration]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [Note]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.0)) FOR [BMI]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [BMIStatus]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [WaistCirc]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [HeadCirc]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT ((0.00)) FOR [OxygenSaturation]
GO
ALTER TABLE [dbo].[FormVitals] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[GeoCountryReference] ADD  DEFAULT (NULL) FOR [CountriesName]
GO
ALTER TABLE [dbo].[GeoCountryReference] ADD  DEFAULT (N'') FOR [CountriesIsoCode2]
GO
ALTER TABLE [dbo].[GeoCountryReference] ADD  DEFAULT (N'') FOR [CountriesIsoCode3]
GO
ALTER TABLE [dbo].[GeoZoneReference] ADD  DEFAULT ((0)) FOR [ZoneCountryId]
GO
ALTER TABLE [dbo].[GeoZoneReference] ADD  DEFAULT (NULL) FOR [ZoneCode]
GO
ALTER TABLE [dbo].[GeoZoneReference] ADD  DEFAULT (NULL) FOR [ZoneName]
GO
ALTER TABLE [dbo].[Globals] ADD  DEFAULT ((0)) FOR [GlIndex]
GO
ALTER TABLE [dbo].[Globals] ADD  DEFAULT (N'') FOR [GlValue]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastBreastExam]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastMammogram]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastGynocologicalExam]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastRectalExam]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastProstateExam]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastPhysicalExam]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastSigmoidoscopyColonoscopy]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastEcg]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastCardiacEcho]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastRetinal]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastFluvax]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastPneuvax]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastLdl]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastHemoglobin]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastPsa]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [LastExamResults]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [CataractSurgery]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Tonsillectomy]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Cholecystestomy]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [HeartSurgery]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Hysterectomy]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [HerniaRepair]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [HipReplacement]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [KneeReplacement]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Appendectomy]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Name1]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Value1]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Name2]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Value2]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext12]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext13]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext14]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext15]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext16]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext17]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext18]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext19]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext20]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext21]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext22]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext23]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext24]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext25]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext26]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext27]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext28]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext29]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (N'') FOR [Usertext30]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Userdate11]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Userdate12]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Userdate13]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Userdate14]
GO
ALTER TABLE [dbo].[HistoryData] ADD  DEFAULT (NULL) FOR [Userdate15]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT (NULL) FOR [DxCode]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT (NULL) FOR [FormattedDxCode]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT (NULL) FOR [ValidForCoding]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT (NULL) FOR [ShortDesc]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10DxOrderCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10GemDx109] ADD  DEFAULT (NULL) FOR [DxIcd10Source]
GO
ALTER TABLE [dbo].[Icd10GemDx109] ADD  DEFAULT (NULL) FOR [DxIcd9Target]
GO
ALTER TABLE [dbo].[Icd10GemDx109] ADD  DEFAULT (NULL) FOR [Flags]
GO
ALTER TABLE [dbo].[Icd10GemDx109] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10GemDx109] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10GemDx910] ADD  DEFAULT (NULL) FOR [DxIcd9Source]
GO
ALTER TABLE [dbo].[Icd10GemDx910] ADD  DEFAULT (NULL) FOR [DxIcd10Target]
GO
ALTER TABLE [dbo].[Icd10GemDx910] ADD  DEFAULT (NULL) FOR [Flags]
GO
ALTER TABLE [dbo].[Icd10GemDx910] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10GemDx910] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] ADD  DEFAULT (NULL) FOR [PcsIcd10Source]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] ADD  DEFAULT (NULL) FOR [PcsIcd9Target]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] ADD  DEFAULT (NULL) FOR [Flags]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10GemPcs109] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] ADD  DEFAULT (NULL) FOR [PcsIcd9Source]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] ADD  DEFAULT (NULL) FOR [PcsIcd10Target]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] ADD  DEFAULT (NULL) FOR [Flags]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10GemPcs910] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT (NULL) FOR [PcsCode]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT (NULL) FOR [ValidForCoding]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT (NULL) FOR [ShortDesc]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10PcsOrderCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [CodeCnt]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD901]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD902]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD903]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD904]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD905]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT (NULL) FOR [ICD906]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10ReimbrDx910] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [Code]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [CodeCnt]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD901]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD902]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD903]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD904]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD905]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT (NULL) FOR [ICD906]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd10ReimbrPcs910] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT (NULL) FOR [DxCode]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT (NULL) FOR [FormattedDxCode]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT (NULL) FOR [ShortDesc]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd9DxCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] ADD  DEFAULT (NULL) FOR [DxCode]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd9DxLongCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT (NULL) FOR [SgCode]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT (NULL) FOR [FormattedSgCode]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT (NULL) FOR [ShortDesc]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd9SgCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] ADD  DEFAULT (NULL) FOR [SgCode]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] ADD  DEFAULT (NULL) FOR [LongDesc]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Icd9SgLongCode] ADD  DEFAULT ((0)) FOR [Revision]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoPid]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoCriteria]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoCriteriaValue]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoUser]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoCode]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoCodetext]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoCodetype]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoVisDatePublished]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (NULL) FOR [ImoVisDatePresented]
GO
ALTER TABLE [dbo].[ImmunizationObservation] ADD  DEFAULT (getdate()) FOR [ImoDateObservation]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [PatientId]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AdministeredDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [ImmunizationId]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [CvxCode]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [Manufacturer]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [LotNumber]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AdministeredById]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AdministeredBy]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [EducationDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [VisDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AmountAdministered]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AmountAdministeredUnit]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [ExpirationDate]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [Route]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [AdministrationSite]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT ((0)) FOR [AddedErroneously]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [CompletionStatus]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [InformationSource]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [RefusalReason]
GO
ALTER TABLE [dbo].[Immunizations] ADD  DEFAULT (NULL) FOR [OrderingProvider]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [Attn]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [CmsId]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [FreebType]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [X12ReceiverId]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (NULL) FOR [X12DefaultPartnerId]
GO
ALTER TABLE [dbo].[InsuranceCompanies] ADD  DEFAULT (N'') FOR [AltCmsId]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [Provider]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [PlanName]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [PolicyNumber]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [GroupNumber]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberLname]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberMname]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberFname]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberRelationship]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberSs]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberDOB]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberStreet]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberPostalCode]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberCity]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberState]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberCountry]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberPhone]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployer]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployerStreet]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployerPostalCode]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployerState]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployerCountry]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberEmployerCity]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [Copay]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (NULL) FOR [SubscriberSex]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (N'TRUE') FOR [AcceptAssignment]
GO
ALTER TABLE [dbo].[InsuranceData] ADD  DEFAULT (N'') FOR [PolicyType]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT ((0)) FOR [ProviderId]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [InsuranceCompanyId]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [ProviderNumber]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [RenderingProviderNumber]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [GroupNumber]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [ProviderNumberType]
GO
ALTER TABLE [dbo].[InsuranceNumbers] ADD  DEFAULT (NULL) FOR [RenderingProviderNumberType]
GO
ALTER TABLE [dbo].[IntegrationMapping] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[IntegrationMapping] ADD  DEFAULT ((0)) FOR [ForeignId]
GO
ALTER TABLE [dbo].[IntegrationMapping] ADD  DEFAULT (NULL) FOR [ForeignTable]
GO
ALTER TABLE [dbo].[IntegrationMapping] ADD  DEFAULT ((0)) FOR [LocalId]
GO
ALTER TABLE [dbo].[IntegrationMapping] ADD  DEFAULT (NULL) FOR [LocalTable]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT (N'') FOR [Type]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT (N'') FOR [Plural]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT (N'') FOR [Singular]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT (N'') FOR [Abbreviation]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT ((0)) FOR [Style]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT ((0)) FOR [ForceShow]
GO
ALTER TABLE [dbo].[IssueTypes] ADD  DEFAULT ((0)) FOR [Ordering]
GO
ALTER TABLE [dbo].[LangCustom] ADD  DEFAULT (N'') FOR [LangDescription]
GO
ALTER TABLE [dbo].[LangCustom] ADD  DEFAULT (N'') FOR [LangCode]
GO
ALTER TABLE [dbo].[LangCustom] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[LangDefinitions] ADD  DEFAULT ((0)) FOR [ConsId]
GO
ALTER TABLE [dbo].[LangDefinitions] ADD  DEFAULT ((0)) FOR [LangId]
GO
ALTER TABLE [dbo].[LangLanguages] ADD  DEFAULT (N'') FOR [LangCode]
GO
ALTER TABLE [dbo].[LangLanguages] ADD  DEFAULT (NULL) FOR [LangDescription]
GO
ALTER TABLE [dbo].[LangLanguages] ADD  DEFAULT ((0)) FOR [LangIsRtl]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [FormId]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [FieldId]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [GroupName]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((0)) FOR [Seq]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((0)) FOR [DataType]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((1)) FOR [Uor]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((15)) FOR [FldLength]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((0)) FOR [MaxLength]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [ListId]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((1)) FOR [Titlecols]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((1)) FOR [Datacols]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [DefaultValue]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [EditOptions]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT ((0)) FOR [FldRows]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'') FOR [ListBackupId]
GO
ALTER TABLE [dbo].[LayoutOptions] ADD  DEFAULT (N'F') FOR [Source]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [ListId]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [OptionId]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((0)) FOR [Seq]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((0)) FOR [OptionValue]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [Mapping]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [Notes]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [Codes]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((0)) FOR [ToggleSetting1]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((0)) FOR [ToggleSetting2]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[ListOptions] ADD  DEFAULT (N'') FOR [Subtype]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'') FOR [Subtype]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Begdate]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Enddate]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Returndate]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT ((0)) FOR [Occurrence]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT ((0)) FOR [Classification]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Referredby]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Extrainfo]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Diagnosis]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT ((0)) FOR [Outcome]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [Destination]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT ((0)) FOR [ReinjuryId]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'') FOR [InjuryPart]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'') FOR [InjuryType]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'') FOR [InjuryGrade]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'') FOR [Reaction]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [ExternalAllergyid]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'0') FOR [ErxSource]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (N'0') FOR [ErxUploaded]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (getdate()) FOR [Modifydate]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [SeverityAl]
GO
ALTER TABLE [dbo].[Lists] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[ListsTouch] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[ListsTouch] ADD  DEFAULT (N'') FOR [Type]
GO
ALTER TABLE [dbo].[ListsTouch] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [Event]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [PatientId]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT ((1)) FOR [Success]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [CrtUser]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (N'Open-dbo') FOR [LogFrom]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [MenuItemId]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (NULL) FOR [CcdaDocId]
GO
ALTER TABLE [dbo].[LogCommentEncrypt] ADD  DEFAULT (N'No') FOR [Encrypt]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Fname]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Mname]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Lname]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Street]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Zip]
GO
ALTER TABLE [dbo].[MiscAddressBook] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[ModuleAclGroupSettings] ADD  DEFAULT (NULL) FOR [Allowed]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (NULL) FOR [SectionId]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (NULL) FOR [SectionName]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (NULL) FOR [ParentSection]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (NULL) FOR [SectionIdentifier]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (NULL) FOR [ModuleId]
GO
ALTER TABLE [dbo].[ModuleAclSections] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[ModuleAclUserSettings] ADD  DEFAULT (NULL) FOR [Allowed]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'0') FOR [ModName]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModDirectory]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModParent]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModType]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((0)) FOR [ModActive]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'''') FOR [ModUiName]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModRelativeLink]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((0)) FOR [ModUiOrder]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((0)) FOR [ModUiActive]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModDescription]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'') FOR [ModNickName]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (N'No') FOR [ModEncMenu]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT (NULL) FOR [PermissionsItemTable]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((0)) FOR [SqlRun]
GO
ALTER TABLE [dbo].[Modules] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] ADD  DEFAULT (NULL) FOR [ModId]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] ADD  DEFAULT (NULL) FOR [EnabledHooks]
GO
ALTER TABLE [dbo].[ModulesHooksSettings] ADD  DEFAULT (NULL) FOR [AttachedTo]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (NULL) FOR [ModId]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (NULL) FOR [FldType]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (NULL) FOR [ObjName]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (NULL) FOR [MenuName]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (NULL) FOR [Path]
GO
ALTER TABLE [dbo].[ModulesSettings] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT ((0)) FOR [ForeignId]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (NULL) FOR [Note]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (NULL) FOR [Owner]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Notes] ADD  DEFAULT (getdate()) FOR [Revision]
GO
ALTER TABLE [dbo].[NotificationLog] ADD  DEFAULT (NULL) FOR [PcEid]
GO
ALTER TABLE [dbo].[Onotes] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Onotes] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Onotes] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Onotes] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT (NULL) FOR [PnName]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT ((0)) FOR [PnType]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT (NULL) FOR [PnDisplayname]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT (NULL) FOR [PnDescription]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT ((0)) FOR [PnRegid]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT (NULL) FOR [PnDirectory]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT (NULL) FOR [PnVersion]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT ((0)) FOR [PnAdminCapable]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT ((0)) FOR [PnUserCapable]
GO
ALTER TABLE [dbo].[OpendboModules] ADD  DEFAULT ((0)) FOR [PnState]
GO
ALTER TABLE [dbo].[OpendboModuleVars] ADD  DEFAULT (NULL) FOR [PnModname]
GO
ALTER TABLE [dbo].[OpendboModuleVars] ADD  DEFAULT (NULL) FOR [PnName]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT (NULL) FOR [PcCatname]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT (NULL) FOR [PcCatcolor]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcRecurrtype]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT (NULL) FOR [PcEnddate]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcRecurrfreq]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcDuration]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcEndDateFlag]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT (NULL) FOR [PcEndDateType]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcEndDateFreq]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcEndAllDay]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcDailylimit]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((1)) FOR [PcActive]
GO
ALTER TABLE [dbo].[OpendboPostcalendarCategories] ADD  DEFAULT ((0)) FOR [PcSeq]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcCatid]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcAid]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcPid]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcTitle]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcTime]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcComments]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcCounter]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((1)) FOR [PcTopic]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcInformant]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (getdate()) FOR [PcEventDate]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (getdate()) FOR [PcEndDate]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcDuration]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcRecurrtype]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcRecurrfreq]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcStartTime]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcEndTime]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcAlldayevent]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcConttel]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcContname]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcContemail]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcWebsite]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcFee]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcEventstatus]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcSharing]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (NULL) FOR [PcLanguage]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (N'-') FOR [PcApptstatus]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcPrefcatid]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcFacility]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (N'NO') FOR [PcSendalertsms]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (N'NO') FOR [PcSendalertemail]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT ((0)) FOR [PcBillingLocation]
GO
ALTER TABLE [dbo].[OpendboPostcalendarEvents] ADD  DEFAULT (N'') FOR [PcRoom]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] ADD  DEFAULT ((0)) FOR [PcCatid]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] ADD  DEFAULT ('00:00:00') FOR [PcStarttime]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] ADD  DEFAULT ('00:00:00') FOR [PcEndtime]
GO
ALTER TABLE [dbo].[OpendboPostcalendarLimits] ADD  DEFAULT ((1)) FOR [PcLimit]
GO
ALTER TABLE [dbo].[OpendboPostcalendarTopics] ADD  DEFAULT (NULL) FOR [PcCatname]
GO
ALTER TABLE [dbo].[OpendboPostcalendarTopics] ADD  DEFAULT (NULL) FOR [PcCatcolor]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] ADD  DEFAULT (N'') FOR [PnSessid]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] ADD  DEFAULT (NULL) FOR [PnIpaddr]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] ADD  DEFAULT ((0)) FOR [PnFirstused]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] ADD  DEFAULT ((0)) FOR [PnLastused]
GO
ALTER TABLE [dbo].[OpendboSessionInfo] ADD  DEFAULT ((0)) FOR [PnUid]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] ADD  DEFAULT ((1)) FOR [PortalPwdStatus]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] ADD  DEFAULT (NULL) FOR [AuthorizeNetId]
GO
ALTER TABLE [dbo].[PatientAccessOffsite] ADD  DEFAULT (NULL) FOR [PortalRelation]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] ADD  DEFAULT (NULL) FOR [PortalUsername]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] ADD  DEFAULT (NULL) FOR [PortalPwd]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] ADD  DEFAULT ((1)) FOR [PortalPwdStatus]
GO
ALTER TABLE [dbo].[PatientAccessOnsite] ADD  DEFAULT (NULL) FOR [PortalSalt]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Language]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Financial]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Fname]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Lname]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Mname]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [DOB]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Street]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PostalCode]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [City]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [State]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [CountryCode]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [DriversLicense]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Ss]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneHome]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneBiz]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneContact]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [PhoneCell]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT ((0)) FOR [PharmacyId]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Status]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [ContactRelationship]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Sex]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Referrer]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [ReferrerID]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [ProviderID]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [RefProviderID]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [EmailDirect]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Ethnoracial]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Race]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Ethnicity]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Religion]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Interpretter]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Migrantseasonal]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [FamilySize]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [MonthlyIncome]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Homeless]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [FinancialReview]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Pubpid]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Genericname1]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Genericval1]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Genericname2]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Genericval2]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [HipaaMail]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [HipaaVoice]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [HipaaNotice]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [HipaaMessage]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'NO') FOR [HipaaAllowsms]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'NO') FOR [HipaaAllowemail]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Squad]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT ((0)) FOR [Fitness]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [ReferralSource]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'Standard') FOR [Pricelevel]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [Regdate]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [Contrastart]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'NO') FOR [CompletedAd]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [AdReviewed]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Vfc]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [Mothersname]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [AllowImmRegUse]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [AllowImmInfoShare]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [AllowHealthInfoEx]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [AllowPatientPortal]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [DeceasedDate]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [DeceasedReason]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [SoapImportStatus]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [CmsportalLogin]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (NULL) FOR [CareTeam]
GO
ALTER TABLE [dbo].[PatientData] ADD  DEFAULT (N'') FOR [County]
GO
ALTER TABLE [dbo].[PatientPortalMenu] ADD  DEFAULT (NULL) FOR [PatientPortalMenuGroupId]
GO
ALTER TABLE [dbo].[PatientPortalMenu] ADD  DEFAULT (NULL) FOR [MenuName]
GO
ALTER TABLE [dbo].[PatientPortalMenu] ADD  DEFAULT (NULL) FOR [MenuOrder]
GO
ALTER TABLE [dbo].[PatientPortalMenu] ADD  DEFAULT ((1)) FOR [MenuStatus]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (NULL) FOR [DateInactivated]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (N'') FOR [ReasonInactivated]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (N'') FOR [DueStatus]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (N'') FOR [Item]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (NULL) FOR [DateCreated]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT (NULL) FOR [DateSent]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT ((0)) FOR [VoiceStatus]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT ((0)) FOR [SmsStatus]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT ((0)) FOR [EmailStatus]
GO
ALTER TABLE [dbo].[PatientReminders] ADD  DEFAULT ((0)) FOR [MailStatus]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (NULL) FOR [Apptdate]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (NULL) FOR [Appttime]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT ((0)) FOR [Eid]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (N'') FOR [OriginalUser]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT ((0)) FOR [Encounter]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (N'') FOR [Lastseq]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT (NULL) FOR [RandomDrugTest]
GO
ALTER TABLE [dbo].[PatientTracker] ADD  DEFAULT ((0)) FOR [DrugScreenCompleted]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT ((0)) FOR [PtTrackerId]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (NULL) FOR [StartDatetime]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (N'') FOR [Room]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (N'') FOR [Status]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (N'') FOR [Seq]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (N'') FOR [User]
GO
ALTER TABLE [dbo].[PatientTrackerElement] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] ADD  DEFAULT (NULL) FOR [ServiceName]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] ADD  DEFAULT (NULL) FOR [LoginId]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] ADD  DEFAULT (NULL) FOR [TransactionKey]
GO
ALTER TABLE [dbo].[PaymentGatewayDetails] ADD  DEFAULT (NULL) FOR [Md5]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0)) FOR [Pid]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0)) FOR [Encounter]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (NULL) FOR [Method]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (NULL) FOR [Source]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0.00)) FOR [Amount1]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0.00)) FOR [Amount2]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0.00)) FOR [Posted1]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0.00)) FOR [Posted2]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  DEFAULT ((1)) FOR [TransmitMethod]
GO
ALTER TABLE [dbo].[Pharmacies] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [CountryCode]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [AreaCode]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [Prefix]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [Number]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [Type]
GO
ALTER TABLE [dbo].[PhoneNumbers] ADD  DEFAULT (NULL) FOR [ForeignId]
GO
ALTER TABLE [dbo].[PmaBookmark] ADD  DEFAULT (NULL) FOR [Dbase]
GO
ALTER TABLE [dbo].[PmaBookmark] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[PmaBookmark] ADD  DEFAULT (NULL) FOR [Label]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [DbName]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [TableName]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [ColumnName]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [Comment]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [Mimetype]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [Transformation]
GO
ALTER TABLE [dbo].[PmaColumnInfo] ADD  DEFAULT (NULL) FOR [TransformationOptions]
GO
ALTER TABLE [dbo].[PmaHistory] ADD  DEFAULT (NULL) FOR [Username]
GO
ALTER TABLE [dbo].[PmaHistory] ADD  DEFAULT (NULL) FOR [Db]
GO
ALTER TABLE [dbo].[PmaHistory] ADD  DEFAULT (NULL) FOR [Table]
GO
ALTER TABLE [dbo].[PmaHistory] ADD  DEFAULT (getdate()) FOR [Timevalue]
GO
ALTER TABLE [dbo].[PmaPdfPages] ADD  DEFAULT (NULL) FOR [DbName]
GO
ALTER TABLE [dbo].[PmaPdfPages] ADD  DEFAULT (NULL) FOR [PageDescr]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (N'') FOR [MasterDb]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (N'') FOR [MasterTable]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (N'') FOR [MasterField]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (NULL) FOR [ForeignDb]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (NULL) FOR [ForeignTable]
GO
ALTER TABLE [dbo].[PmaRelation] ADD  DEFAULT (NULL) FOR [ForeignField]
GO
ALTER TABLE [dbo].[PmaTableCoords] ADD  DEFAULT (N'') FOR [DbName]
GO
ALTER TABLE [dbo].[PmaTableCoords] ADD  DEFAULT (N'') FOR [TableName]
GO
ALTER TABLE [dbo].[PmaTableCoords] ADD  DEFAULT ((0)) FOR [PdfPageNumber]
GO
ALTER TABLE [dbo].[PmaTableCoords] ADD  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[PmaTableCoords] ADD  DEFAULT ((0)) FOR [Y]
GO
ALTER TABLE [dbo].[PmaTableInfo] ADD  DEFAULT (N'') FOR [DbName]
GO
ALTER TABLE [dbo].[PmaTableInfo] ADD  DEFAULT (N'') FOR [TableName]
GO
ALTER TABLE [dbo].[PmaTableInfo] ADD  DEFAULT (NULL) FOR [DisplayField]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Groupname]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Activity]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [AssignedTo]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (N'New') FOR [MessageStatus]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT (NULL) FOR [PortalRelation]
GO
ALTER TABLE [dbo].[Pnotes] ADD  DEFAULT ((0)) FOR [IsMsgEncrypted]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [PatientId]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [FilledById]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [PharmacyId]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [DateModified]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [ProviderId]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Encounter]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [StartDate]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Drug]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT ((0)) FOR [DrugId]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [RxnormDrugcode]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Form]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Dosage]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Size]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Unit]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Route]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Interval]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Substitute]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Refills]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [PerRefill]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [FilledDate]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Medication]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Datetime]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [User]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Site]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Prescriptionguid]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT ((0)) FOR [ErxSource]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT ((0)) FOR [ErxUploaded]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Prescriptions] ADD  DEFAULT (NULL) FOR [Prn]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (N'') FOR [PrId]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (N'') FOR [PrSelector]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT (N'') FOR [PrLevel]
GO
ALTER TABLE [dbo].[Prices] ADD  DEFAULT ((0.00)) FOR [PrPrice]
GO
ALTER TABLE [dbo].[ProcedureAnswers] ADD  DEFAULT ((0)) FOR [ProcedureOrderId]
GO
ALTER TABLE [dbo].[ProcedureAnswers] ADD  DEFAULT ((0)) FOR [ProcedureOrderSeq]
GO
ALTER TABLE [dbo].[ProcedureAnswers] ADD  DEFAULT (N'') FOR [QuestionCode]
GO
ALTER TABLE [dbo].[ProcedureAnswers] ADD  DEFAULT (N'') FOR [Answer]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT ((0)) FOR [ProviderId]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT ((0)) FOR [EncounterId]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (NULL) FOR [DateCollected]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (NULL) FOR [DateOrdered]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [OrderPriority]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [ControlId]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT ((0)) FOR [LabId]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [SpecimenType]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [SpecimenLocation]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [SpecimenVolume]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (NULL) FOR [DateTransmitted]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (N'') FOR [ClinicalHx]
GO
ALTER TABLE [dbo].[ProcedureOrder] ADD  DEFAULT (NULL) FOR [ExternalId]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] ADD  DEFAULT (N'') FOR [ProcedureCode]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] ADD  DEFAULT (N'') FOR [ProcedureName]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] ADD  DEFAULT (N'1') FOR [ProcedureSource]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] ADD  DEFAULT ((0)) FOR [DoNotSend]
GO
ALTER TABLE [dbo].[ProcedureOrderCode] ADD  DEFAULT (NULL) FOR [ProcedureOrderTitle]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [Npi]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [SendAppId]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [SendFacId]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [RecvAppId]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [RecvFacId]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'D') FOR [DorP]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'B') FOR [Direction]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'DL') FOR [Protocol]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [RemoteHost]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [Login]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [OrdersPath]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT (N'') FOR [ResultsPath]
GO
ALTER TABLE [dbo].[ProcedureProviders] ADD  DEFAULT ((0)) FOR [LabDirector]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT ((0)) FOR [LabId]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT (N'') FOR [ProcedureCode]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT (N'') FOR [QuestionCode]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT ((0)) FOR [Seq]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT (N'') FOR [QuestionText]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT ((0)) FOR [Required]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT ((0)) FOR [Maxsize]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT (N'T') FOR [Fldtype]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT (N'') FOR [Tips]
GO
ALTER TABLE [dbo].[ProcedureQuestions] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (NULL) FOR [ProcedureOrderId]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT ((1)) FOR [ProcedureOrderSeq]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (NULL) FOR [DateCollected]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (N'') FOR [DateCollectedTz]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (NULL) FOR [DateReport]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (N'') FOR [DateReportTz]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT ((0)) FOR [Source]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (N'') FOR [SpecimenNum]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (N'') FOR [ReportStatus]
GO
ALTER TABLE [dbo].[ProcedureReport] ADD  DEFAULT (N'Received') FOR [ReviewStatus]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'S') FOR [ResultDataType]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [ResultCode]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [ResultText]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [Facility]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [Units]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [Result]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [Range]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [Abnormal]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT ((0)) FOR [DocumentId]
GO
ALTER TABLE [dbo].[ProcedureResult] ADD  DEFAULT (N'') FOR [ResultStatus]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT ((0)) FOR [Parent]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT ((0)) FOR [LabId]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [ProcedureCode]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [ProcedureType]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [BodySite]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Specimen]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [RouteAdmin]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Laterality]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [StandardCode]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [RelatedCode]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Units]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Range]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT ((0)) FOR [Seq]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT ((1)) FOR [Activity]
GO
ALTER TABLE [dbo].[ProcedureType] ADD  DEFAULT (N'') FOR [Notes]
GO
ALTER TABLE [dbo].[ProductWarehouse] ADD  DEFAULT ((0)) FOR [PwMinLevel]
GO
ALTER TABLE [dbo].[ProductWarehouse] ADD  DEFAULT ((0)) FOR [PwMaxLevel]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Directory]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [SqlRun]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Unpackaged]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Category]
GO
ALTER TABLE [dbo].[Registry] ADD  DEFAULT (NULL) FOR [Nickname]
GO
ALTER TABLE [dbo].[ReportItemized] ADD  DEFAULT (N'') FOR [NumeratorLabel]
GO
ALTER TABLE [dbo].[ReportItemized] ADD  DEFAULT ((0)) FOR [Pass]
GO
ALTER TABLE [dbo].[ReportItemized] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[ReportResults] ADD  DEFAULT (N'') FOR [FieldId]
GO
ALTER TABLE [dbo].[RuleAction] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[RuleAction] ADD  DEFAULT ((1)) FOR [GroupId]
GO
ALTER TABLE [dbo].[RuleAction] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[RuleAction] ADD  DEFAULT (N'') FOR [Item]
GO
ALTER TABLE [dbo].[RuleAction] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[RuleActionItem] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[RuleActionItem] ADD  DEFAULT (N'') FOR [Item]
GO
ALTER TABLE [dbo].[RuleActionItem] ADD  DEFAULT (N'') FOR [ClinRemLink]
GO
ALTER TABLE [dbo].[RuleActionItem] ADD  DEFAULT ((0)) FOR [CustomFlag]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT ((0)) FOR [IncludeFlag]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT ((0)) FOR [RequiredFlag]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT (N'') FOR [Method]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT (N'') FOR [MethodDetail]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT (N'') FOR [Value]
GO
ALTER TABLE [dbo].[RuleFilter] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[RulePatientData] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[RulePatientData] ADD  DEFAULT (N'') FOR [Category]
GO
ALTER TABLE [dbo].[RulePatientData] ADD  DEFAULT (N'') FOR [Item]
GO
ALTER TABLE [dbo].[RulePatientData] ADD  DEFAULT (N'') FOR [Complete]
GO
ALTER TABLE [dbo].[RulePatientData] ADD  DEFAULT (N'') FOR [Result]
GO
ALTER TABLE [dbo].[RuleReminder] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[RuleReminder] ADD  DEFAULT (N'') FOR [Method]
GO
ALTER TABLE [dbo].[RuleReminder] ADD  DEFAULT (N'') FOR [MethodDetail]
GO
ALTER TABLE [dbo].[RuleReminder] ADD  DEFAULT (N'') FOR [Value]
GO
ALTER TABLE [dbo].[RuleReminder] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT (N'') FOR [Id]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT ((1)) FOR [GroupId]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT ((0)) FOR [IncludeFlag]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT ((0)) FOR [RequiredFlag]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT (N'') FOR [Method]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT (N'') FOR [Value]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT ((0)) FOR [Interval]
GO
ALTER TABLE [dbo].[RuleTarget] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[Sequences] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[Sequences] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] ADD  DEFAULT (NULL) FOR [ImportedDate]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] ADD  DEFAULT (N'') FOR [RevisionVersion]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] ADD  DEFAULT (NULL) FOR [RevisionDate]
GO
ALTER TABLE [dbo].[StandardizedTablesTrack] ADD  DEFAULT (N'') FOR [FileChecksum]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] ADD  DEFAULT (N'') FOR [LoadType]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] ADD  DEFAULT (N'CMS') FOR [LoadSource]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] ADD  DEFAULT (N'') FOR [LoadFilename]
GO
ALTER TABLE [dbo].[SupportedExternalDataloads] ADD  DEFAULT (N'') FOR [LoadChecksum]
GO
ALTER TABLE [dbo].[SyndromicSurveillance] ADD  DEFAULT (N'') FOR [Filename]
GO
ALTER TABLE [dbo].[TemplateUsers] ADD  DEFAULT (NULL) FOR [TuUserId]
GO
ALTER TABLE [dbo].[TemplateUsers] ADD  DEFAULT (NULL) FOR [TuFacilityId]
GO
ALTER TABLE [dbo].[TemplateUsers] ADD  DEFAULT (NULL) FOR [TuTemplateId]
GO
ALTER TABLE [dbo].[TemplateUsers] ADD  DEFAULT (NULL) FOR [TuTemplateOrder]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (NULL) FOR [Date]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (NULL) FOR [Pid]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (N'') FOR [User]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (N'') FOR [Groupname]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Username]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Authorized]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Source]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Fname]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Mname]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Lname]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Federaltaxid]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Federaldrugid]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Upin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Facility]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [FacilityId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [SeeAuth]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Npi]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Specialty]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Billname]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [EmailDirect]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Url]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Assistant]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Organization]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Valedictory]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Street]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Streetb]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [City]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [State]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Zip]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Street2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Streetb2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [City2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [State2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Zip2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Fax]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Phonew1]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Phonew2]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Phonecell]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [CalUi]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'207Q00000X') FOR [Taxonomy]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [SsiRelayhealth]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Calendar]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [AbookType]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [PwdExpirationDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [DefaultWarehouse]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Irnpool]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [StateLicenseNumber]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [NewcropUserRole]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Cpoe]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [PhysicianType]
GO
ALTER TABLE [dbo].[UserSettings] ADD  DEFAULT ((0)) FOR [SettingUser]
GO
ALTER TABLE [dbo].[UserSettings] ADD  DEFAULT (N'') FOR [SettingValue]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [Username]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [Password]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [Salt]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [PasswordHistory1]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [SaltHistory1]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [PasswordHistory2]
GO
ALTER TABLE [dbo].[UsersSecure] ADD  DEFAULT (NULL) FOR [SaltHistory2]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (N'') FOR [NqfCode]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (N'') FOR [CodeSystem]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (NULL) FOR [CodeType]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (N'') FOR [Valueset]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[Valueset] ADD  DEFAULT (NULL) FOR [ValuesetName]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vMajor]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vMinor]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vPatch]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vRealpatch]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT (N'') FOR [vTag]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vDatabase]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT ((0)) FOR [vAcl]
GO
ALTER TABLE [dbo].[version] ADD  DEFAULT (newid()) FOR [ssma$rowid]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT ((0)) FOR [Id]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [IdNumber]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [X12SenderId]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [X12ReceiverId]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [X12Version]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (NULL) FOR [ProcessingFormat]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'00') FOR [X12Isa01]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'          ') FOR [X12Isa02]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'00') FOR [X12Isa03]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'          ') FOR [X12Isa04]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'ZZ') FOR [X12Isa05]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'ZZ') FOR [X12Isa07]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'0') FOR [X12Isa14]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'P') FOR [X12Isa15]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'') FOR [X12Gs02]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'') FOR [X12Per06]
GO
ALTER TABLE [dbo].[X12Partners] ADD  DEFAULT (N'') FOR [X12Gs03]
GO
USE [master]
GO
ALTER DATABASE [transfer] SET  READ_WRITE 
GO
GO

/****** Object:  Table [dbo].[WebJobHistory]    Script Date: 6/26/2016 6:43:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebJobHistory](
	[JobId] [smallint] NOT NULL,
	[RunId] [int] IDENTITY(1,1) NOT NULL,
	[CreationTime] [DateTime] NOT NULL,
 CONSTRAINT [PK_WebJobHistory_RunId] PRIMARY KEY CLUSTERED 
(
	[RunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

SET ANSI_PADDING OFF
GO

GO

/****** Object:  Table [dbo].[WebJob]    Script Date: 6/26/2016 6:42:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebJob](
	[JobId] [smallint] NOT NULL,
	[JobName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_WebJob_JobId] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

SET ANSI_PADDING OFF
GO




