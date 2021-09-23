create database custom;
go

create database service;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table service.status persistent
(
	Name varchar(255) primary key,
	CurrentState int,
	StateChange utc,
	LastGoodAt utc,
	LastBadAt utc,
	LastMarginalAt utc,
	LastReportAt utc
);
go


create database master;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.permissions persistent
(
	UID int primary key,
	AllowISQLWrite int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.profiles persistent
(
	UID int primary key,
	HasRestriction int,
	Restrict1 varchar(255),
	Restrict2 varchar(255),
	Restrict3 varchar(255),
	Restrict4 varchar(255),
	AllowISQL int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.servergroups persistent
(
	ServerName varchar(64) primary key,
	GroupID int,
	Weight int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.class_membership persistent
(
	Class int primary key,
	Parent int primary key,
	ClassName varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.stats persistent
(
	StatTime utc primary key,
	NumClients int,
	NumRealtime int,
	NumProbes int,
	NumGateways int,
	NumMonitors int,
	NumProxys int,
	EventCount int,
	JournalCount int,
	DetailCount int,
	StatusInserts int,
	StatusNewInserts int,
	StatusDedups int,
	JournalInserts int,
	DetailsInserts int,
	StatusUpdates int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.activity_stats persistent
(
	DatabaseName varchar(40) primary key,
	StatusNewInserts int,
	StatusDedups int,
	JournalInserts int,
	DetailsInserts int,
	StatusUpdates int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.device_types persistent
(
	Class int primary key,
	Conversion varchar(255),
	DeviceType int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.devices persistent
(
	Node varchar(64) primary key,
	Class int,
	DeviceType int,
	LastReceived utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.sm_activity persistent
(
	ReportTrigger char(255) primary key,
	ProbeStatsLastSeqNos int,
	MasterStatsLast utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.sm_thresholds persistent
(
	ThresholdName char(64) primary key,
	DisplayName char(64),
	Sev1 int,
	Sev2 int,
	Sev3 int,
	Sev4 int,
	Sev5 int,
	EnableInfo int,
	DeduplicateInfo int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_nodes virtual
(
	Node varchar(64) primary key,
	Tally int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_probes virtual
(
	Identifier varchar(255) primary key,
	Probe varchar(64),
	Hostname varchar(64),
	ConnectionID int,
	Tally int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_classes virtual
(
	Class int primary key,
	Tally int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.properties persistent
(
	Name varchar(40) primary key,
	CharValue varchar(255),
	IntValue int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.correlation_sitename persistent
(
	SiteName varchar(255) primary key,
	ScopeID varchar(255) primary key,
	Identifier varchar(255),
	CustomText varchar(4096),
	CustomTimestamp utc,
	CustomWeight int,
	HighImpactWeight int,
	HighImpactText varchar(255),
	HighCauseWeight int,
	HighCauseText varchar(255)
);
go

CREATE INDEX SiteNameIdentifierIdx ON master.correlation_sitename USING HASH (Identifier);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.correlation_scopeid persistent
(
	ScopeID varchar(255) primary key,
	LastOccurrence utc,
	Identifier varchar(255),
	ExpireTime utc,
	CustomText varchar(4096),
	CustomTimestamp utc,
	CustomWeight int,
	HighImpactWeight int,
	HighImpactText varchar(255),
	HighCauseWeight int,
	HighCauseText varchar(255)
);
go

CREATE INDEX ScopeIDIdentifierIdx ON master.correlation_scopeid USING HASH (Identifier);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.correlation_scopealias_members persistent
(
	ScopeID varchar(255) primary key,
	ScopeAlias varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.correlation_priority_children persistent
(
	Identifier varchar(255) primary key,
	CustomText varchar(4096),
	CustomTimestamp utc,
	CustomWeight int,
	HighImpactWeight int,
	HighImpactText varchar(255),
	HighCauseWeight int,
	HighCauseText varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.correlation_scope_based_policies persistent
(
	PolicyId varchar(255) primary key,
	PolicyData varchar(8192),
	CreatedBy varchar(255),
	TriggerName varchar(255),
	LastRun utc
);
go


create view master.names as select UserName as Name, UserID as UID, UserID - UserID as GID, Passwd, SystemUser as Type from security.users;
go

create view master.groups as select GroupName as Name, GroupID as GID from security.groups;
go

create view master.members as select Compat as KeyField, UserID as UID, GroupID as GID from security.group_members;
go

create database registry;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.probes persistent
(
	Name varchar(128) primary key,
	Hostname varchar(64) primary key,
	HTTP_port int,
	HTTPS_port int,
	PID int,
	Status int,
	StartTime utc,
	RulesChecksum char(40),
	ProbeType varchar(128),
	ApiVersion varchar(20),
	ApiReleaseID varchar(20),
	ConnectionID int,
	LastUpdate utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.oslcsp persistent
(
	Name varchar(64),
	RegistryURI varchar(1024) primary key,
	RegistryUsername varchar(64),
	RegistryPassword varchar(64),
	Registered int,
	RegistrationURI varchar(1024),
	LastRegistered utc
);
go


create database alerts;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.status persistent
(
	Identifier varchar(255) primary key,
	Serial incr,
	Node varchar(64),
	NodeAlias varchar(64),
	Manager varchar(64),
	Agent varchar(64),
	AlertGroup varchar(255),
	AlertKey varchar(255),
	Severity int,
	Summary varchar(255),
	StateChange utc,
	FirstOccurrence utc,
	LastOccurrence utc,
	InternalLast utc,
	Poll int,
	Type int,
	Tally int,
	Class int,
	Grade int,
	Location varchar(64),
	OwnerUID int,
	OwnerGID int,
	Acknowledged int,
	Flash int,
	EventId varchar(255),
	ExpireTime int,
	ProcessReq int,
	SuppressEscl int,
	Customer varchar(64),
	Service varchar(64),
	PhysicalSlot int,
	PhysicalPort int,
	PhysicalCard varchar(64),
	TaskList int,
	NmosSerial varchar(64),
	NmosObjInst int,
	NmosCauseType int,
	NmosDomainName varchar(64),
	NmosEntityId int,
	NmosManagedStatus int,
	NmosEventMap varchar(64),
	LocalNodeAlias varchar(64),
	LocalPriObj varchar(255),
	LocalSecObj varchar(255),
	LocalRootObj varchar(255),
	RemoteNodeAlias varchar(64),
	RemotePriObj varchar(255),
	RemoteSecObj varchar(255),
	RemoteRootObj varchar(255),
	X733EventType int,
	X733ProbableCause int,
	X733SpecificProb varchar(64),
	X733CorrNotif varchar(255),
	ServerName varchar(64),
	ServerSerial int,
	URL varchar(1024),
	ExtendedAttr varchar(4096),
	OldRow int,
	ProbeSubSecondId int,
	BSM_Identity varchar(1024),
	CollectionFirst utc,
	AggregationFirst utc,
	DisplayFirst utc,
	LocalTertObj varchar(255),
	LocalObjRelate int,
	RemoteTertObj varchar(255),
	RemoteObjRelate int,
	CorrScore int,
	CauseType int,
	AdvCorrCauseType int,
	AdvCorrServerName varchar(64),
	AdvCorrServerSerial int,
	NetworkAssureAlarmId int,
	NetworkAssureHost varchar(64),
	NetworkAssurePort int,
	EmailFlag int,
	SRMStatus int,
	PrevOwnerGID int,
	PrevOwnerUID int,
	EmailGroup int,
	SRMTicketId varchar(64),
	SRMTicketStatus varchar(64),
	SRMTicketStatusDate utc,
	SRMInstance int,
	ActionArgs varchar(128),
	X int,
	Y int,
	ActionFlag int,
	TTNumber varchar(64),
	TTState int,
	TicketStatus varchar(32),
	LogTicket int,
	TSRMErrorCode int,
	TTReportedBy varchar(64),
	ShortSummary varchar(100),
	IfAlias varchar(255),
	CustomerInfo varchar(255),
	SystemID varchar(64),
	CircuitID varchar(64),
	CircuitType varchar(64),
	CircuitStatus varchar(64),
	AdditionalField01 varchar(64),
	AdditionalField02 varchar(64),
	AdditionalField03 varchar(64),
	AdditionalField04 varchar(64),
	AdditionalField05 varchar(64),
	ResolveStatus int,
	ResolveRunbookId varchar(300),
	ResolveX int,
	ResolveY int,
	GroupCorrId int,
	RootSourceId int,
	IncidentNumber varchar(24),
	TECHostname varchar(64),
	TECFQHostname varchar(64),
	TECDate varchar(64),
	TECRepeatCount int,
	ITMStatus varchar(1),
	ITMDisplayItem varchar(128),
	ITMEventData varchar(3096),
	ITMTime varchar(23),
	ITMHostname varchar(64),
	ITMPort varchar(64),
	ITMIntType varchar(1),
	ITMResetFlag varchar(1),
	ITMSitType varchar(1),
	ITMThruNode varchar(64),
	ITMSitGroup varchar(1284),
	ITMSitFullName varchar(256),
	ITMApplLabel varchar(8),
	ITMSitOrigin varchar(32),
	FastTrack int,
	XinY varchar(4096),
	NumXinY int,
	XEvents int,
	YSeconds int,
	ParentIdentifier varchar(255),
	IBMExtractedType varchar(2048),
	IBMProcessingStage int,
	Company varchar(16),
	NormalisedAlarmName varchar(255),
	NormalisedAlarmGroup varchar(255),
	NormalisedAlarmCode int,
	ScopeID varchar(255),
	SiteName varchar(255),
	CauseWeight int,
	ImpactWeight int,
	QuietPeriod int,
	CustomText varchar(4096),
	JournalSent int
);
go

CREATE INDEX serverserial ON alerts.status USING HASH (ServerSerial);
go

CREATE INDEX IBMExtractedTypeIndex ON alerts.status USING HASH (IBMExtractedType);
go

CREATE INDEX ScopeIDIdx ON alerts.status USING HASH (ScopeID);
go

CREATE INDEX AlertGroupIdx ON alerts.status USING HASH (AlertGroup);
go

CREATE INDEX IBMProcessingStageIndex ON alerts.status USING HASH (IBMProcessingStage);
go

CREATE INDEX SiteNameIdx ON alerts.status USING HASH (SiteName);
go

CREATE INDEX localobjrelateIdx ON alerts.status USING HASH (LocalObjRelate);
go

CREATE INDEX serial ON alerts.status USING HASH (Serial);
go

CREATE INDEX ParentIdentifierIndex ON alerts.status USING HASH (ParentIdentifier);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.journal persistent
(
	KeyField varchar(255) primary key,
	Serial int,
	UID int,
	Chrono utc,
	Text1 varchar(255),
	Text2 varchar(255),
	Text3 varchar(255),
	Text4 varchar(255),
	Text5 varchar(255),
	Text6 varchar(255),
	Text7 varchar(255),
	Text8 varchar(255),
	Text9 varchar(255),
	Text10 varchar(255),
	Text11 varchar(255),
	Text12 varchar(255),
	Text13 varchar(255),
	Text14 varchar(255),
	Text15 varchar(255),
	Text16 varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.details persistent
(
	KeyField varchar(255) primary key,
	Identifier varchar(255),
	AttrVal int,
	Sequence int,
	Name varchar(255),
	Detail varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objclass persistent
(
	Tag int primary key,
	Name varchar(64),
	Icon varchar(255),
	Menu varchar(64)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objmenus persistent
(
	Menu varchar(64) primary key,
	Columns int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objmenuitems persistent
(
	KeyField varchar(255) primary key,
	Menu varchar(64),
	Sequence int,
	Title varchar(64),
	Command1 varchar(255),
	Command2 varchar(255),
	Command3 varchar(255),
	Command4 varchar(255),
	RedirectStdin int,
	RedirectStdout int,
	RedirectStderr int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.resolutions persistent
(
	KeyField varchar(255) primary key,
	Tag int,
	Sequence int,
	Title varchar(64),
	Resolution1 varchar(255),
	Resolution2 varchar(255),
	Resolution3 varchar(255),
	Resolution4 varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.conversions persistent
(
	KeyField varchar(255) primary key,
	Colname varchar(255),
	Value int,
	Conversion varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.col_visuals persistent
(
	Colname varchar(255) primary key,
	Title varchar(255),
	DefWidth int,
	MaxWidth int,
	TitleJustify int,
	DataJustify int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.colors persistent
(
	Severity int primary key,
	AckedRed int,
	AckedGreen int,
	AckedBlue int,
	UnackedRed int,
	UnackedGreen int,
	UnackedBlue int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.iduc_messages virtual
(
	MsgID int primary key,
	MsgText varchar(4096),
	MsgTime utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.application_types persistent
(
	application varchar(64) primary key,
	description varchar(64),
	connect_type int,
	connect_severity int,
	disconnect_type int,
	disconnect_severity int,
	expire_time int,
	discard boolean
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.problem_events virtual
(
	Identifier varchar(255) primary key,
	LastOccurrence utc,
	AlertKey varchar(255),
	AlertGroup varchar(255),
	Node varchar(64),
	Manager varchar(64),
	Resolved boolean
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.backup_state persistent
(
	KeyField int primary key,
	CurrentBackup unsigned
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.login_failures persistent
(
	UserName varchar(64) primary key,
	LastFailure utc,
	LastGood utc,
	FailureCount int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.resync_complete virtual
(
	GatewayName varchar(64) primary key
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.AdvCorrLpcSymCand virtual
(
	Identifier varchar(255) primary key,
	AdvCorrServerName varchar(64),
	AdvCorrServerSerial int,
	Node varchar(64),
	AdvCorrCauseType int,
	LocalNodeAlias varchar(64),
	LocalPriObj varchar(255),
	LocalSecObj varchar(255),
	LocalTertObj varchar(255),
	LocalRootObj varchar(255),
	LocalObjRelate int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.AdvCorrLpcRcCand virtual
(
	Identifier varchar(255) primary key,
	ServerName varchar(64),
	ServerSerial int,
	Node varchar(64),
	AdvCorrCauseType int,
	LocalNodeAlias varchar(64),
	LocalPriObj varchar(255),
	LocalSecObj varchar(255),
	LocalTertObj varchar(255),
	LocalRootObj varchar(255),
	LocalObjRelate int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.itm_loopback_events virtual
(
	Identifier varchar(255) primary key,
	itmstatus varchar(1)
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.itm_problem_events virtual
(
	Identifier varchar(255) primary key,
	LastOccurrence utc,
	ITMHostname varchar(64),
	ITMStatus varchar(1),
	ITMTime varchar(32),
	ITMEventData varchar(64),
	ITMResetFlag varchar(1),
	ITMThruNode varchar(64),
	ITMApplLabel varchar(8),
	ITMSitType varchar(1),
	AlertGroup varchar(64),
	AlertKey varchar(64),
	ITMSitOrigin varchar(32),
	Class int,
	Resolved boolean
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.itm_send_events virtual
(
	Identifier varchar(255) primary key,
	itmeventdata varchar(1024)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.itm_situation_timeouts persistent
(
	ITMSitName varchar(64) primary key,
	ITMExpireTime varchar(10)
);
go


create database relatedevents;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table relatedevents.cacheupdates persistent
(
	name varchar(255) primary key,
	updates int
);
go


create database iduc_system;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel persistent
(
	Name varchar(64) primary key,
	ChannelID int primary key,
	Description varchar(2048)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_interest persistent
(
	InterestID int primary key,
	ElementName varchar(64),
	IsGroup int,
	Hostname varchar(255),
	AppName varchar(255),
	AppDescription varchar(255),
	ChannelID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_summary persistent
(
	DatabaseName varchar(64) primary key,
	TableName varchar(64) primary key,
	ChannelID int primary key,
	SummaryID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_summary_cols persistent
(
	ColumnName varchar(64) primary key,
	SummaryID int primary key,
	Position int,
	ChannelID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.iduc_stats persistent
(
	ServerName varchar(40) primary key,
	AppName varchar(40),
	AppDesc varchar(128) primary key,
	ConnectionId int primary key,
	LastIducTime utc
);
go


create database tools;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.actions persistent
(
	ActionID int primary key,
	Name varchar(64),
	Owner int,
	Enabled int,
	Description1 varchar(255),
	Description2 varchar(255),
	Description3 varchar(255),
	Description4 varchar(255),
	HasInternal int,
	InternalEffect1 varchar(255),
	InternalEffect2 varchar(255),
	InternalEffect3 varchar(255),
	InternalEffect4 varchar(255),
	InternalForEach int,
	HasExternal int,
	ExternalEffect1 varchar(255),
	ExternalEffect2 varchar(255),
	ExternalEffect3 varchar(255),
	ExternalEffect4 varchar(255),
	ExternalForEach int,
	RedirectOut int,
	RedirectErr int,
	Platform varchar(255),
	JournalText1 varchar(255),
	JournalText2 varchar(255),
	JournalText3 varchar(255),
	JournalText4 varchar(255),
	JournalForEach int,
	HasForcedJournal int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.action_access persistent
(
	ActionID int,
	GID int,
	ClassID int,
	ActionAccessID int primary key
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menus persistent
(
	MenuID int primary key,
	Name varchar(64),
	Owner int,
	Enabled int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menu_items persistent
(
	KeyField varchar(32) primary key,
	MenuID int,
	MenuItemID int,
	Title varchar(64),
	Description varchar(255),
	Enabled int,
	InvokeType int,
	InvokeID int,
	Position int,
	Accelerator varchar(32)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menu_defs persistent
(
	Name varchar(64) primary key,
	DatabaseName varchar(64),
	TableName varchar(64),
	ShowField varchar(64),
	AssignField varchar(64),
	OrderbyField varchar(64),
	WhereClause varchar(255),
	Direction int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.prompt_defs persistent
(
	Name varchar(64) primary key,
	Prompt varchar(64),
	Default varchar(64),
	Value varchar(255),
	Type int
);
go


create database precision;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table precision.entity_service persistent
(
	NmosEntityId int primary key,
	ServiceEntityId int primary key,
	NmosDomainName varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table precision.service_details persistent
(
	ServiceEntityId int primary key,
	Type varchar(255),
	Name varchar(255),
	Customer varchar(255),
	NmosDomainName varchar(255)
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table precision.service_affecting_event virtual
(
	ServiceEntityId int primary key
);
go


