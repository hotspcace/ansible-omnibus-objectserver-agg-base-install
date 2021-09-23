create or replace procedure send_email (in node character(1), in severity integer, in subject character(1), in email character(1), in summary character(1), in hostname character(1)) executable '$OMNIHOME/utils/nco_mail' host hostname user 0 group 0 arguments '\''+node+'\'', severity,'\''+subject+'\'','\''+email+'\'','\''+summary+'\'';
go

create or replace procedure eventcmd
( in send_event_cmd character(1000), in send_event_args character(8192) )
executable 'C:\\Program Files (x86)\\IBM\\SitForwarder/omnibus/eventcmd.bat'
host 'localhost'
user 0
group 54
arguments send_event_cmd + ' ' + send_event_args
go

create or replace signal stats_reset 
comment 'Statistics reset signal';
go

create or replace trigger group correlation_triggers;
go

create or replace trigger group compatibility_triggers;
go

create or replace trigger group housekeeping_triggers;
go
alter trigger group housekeeping_triggers set enabled false;
go

create or replace trigger group system_watch;
go

create or replace trigger group failback_triggers;
go

create or replace trigger group self_monitoring_group;
go

create or replace trigger group ibm_re_triggers;
go

create or replace trigger group sae;
go

create or replace trigger group default_triggers;
go

create or replace trigger group connection_watch;
go

create or replace trigger group lumos_triggers;
go

create or replace trigger group primary_only;
go

create or replace trigger group security_watch;
go

create or replace trigger group audit_config;
go
alter trigger group audit_config set enabled false;
go

create or replace trigger group profiler_triggers;
go

create or replace trigger group trigger_stat_reports;
go

create or replace trigger group stats_triggers;
go

create or replace trigger group itnm_triggers;
go

create or replace trigger group registry_triggers;
go

create or replace trigger group iduc_triggers;
go

create or replace trigger group scala_triggers;
go

create or replace trigger group AdvCorr;
go

create or replace trigger group automatic_backup_system;
go

create or replace trigger group gateway_triggers;
go

create or replace file self_monitoring '/opt/IBM/tivoli/netcool/omnibus/log/AGG_P_selfmonitoring.log' maxfiles 2 maxsize 1048576 B;
go

create or replace file device_counter_log '/opt/IBM/tivoli/netcool/omnibus/log/AGG_P_device_counter.log' maxfiles 2 maxsize 1048576 B;
go

create or replace file profiler_report '/opt/IBM/tivoli/netcool/omnibus/log/AGG_P_profiler_report.log' maxfiles 4 maxsize 10485760 B;
go

create or replace file trigger_stats_report '/opt/IBM/tivoli/netcool/omnibus/log/AGG_P_trigger_stats.log' maxfiles 4 maxsize 10485760 B;
go

create or replace procedure get_sit_timeout (in situation_name char(64), out situation_timeout char(10))
begin
	cancel;
end;
go

create or replace procedure correlation_construct_impactcause (in identifier char(255), in out summary char(255))
begin
	cancel;
end;
go

create or replace procedure correlation_clear_expired_parents ()
begin
	cancel;
end;
go

create or replace procedure device_counter_log_nodes ()
begin
	cancel;
end;
go

create or replace procedure jinsert (in serial int, in uid int, in tstamp utc, in msg char(4080))
begin
	cancel;
end;
go

create or replace procedure sm_insert (in identifier char(255), in node char(64), in alertgroup char(255), in severity int, in summary_string char(255), in event_metric int, in expiretime int, in event_type int)
begin
	cancel;
end;
go

create or replace procedure device_counter_copy_classes_to_devices ()
begin
	cancel;
end;
go

create or replace procedure get_config_parms (out sit_ack_expired_def_action char(10), out sit_ack_expired_def_timeout char(10), out sit_resurface_def_action char(10), out situpdate_conf_file char(20))
begin
	cancel;
end;
go

create or replace procedure get_debug_itmsync (out debug_itmsync int)
begin
	cancel;
end;
go

create or replace procedure correlation_process_superparents ()
begin
	cancel;
end;
go

create or replace procedure correlation_dismantle_small_groups ()
begin
	cancel;
end;
go

create or replace procedure get_install_loc (out install_loc char(255))
begin
	cancel;
end;
go

create or replace procedure correlation_process_scopeidparents ()
begin
	cancel;
end;
go

create or replace procedure resolve_itm_action (in itmactiontype char(15), out acceptchanges int)
begin
	cancel;
end;
go

create or replace procedure automation_enable ()
begin
	cancel;
end;
go

create or replace procedure automation_disable ()
begin
	cancel;
end;
go

create or replace procedure correlation_update_priority_child (in identifier char(255), in propagatetexttoparentcause int, in highcauseweight int, in highcausetext char(255), in propagatetexttoparentimpact int, in highimpactweight int, in highimpacttext char(255), in propagatetexttoparentfirst int, in lowfirstoccurrence int, in propagatetexttoparentlast int, in highlastoccurrence int, in customtext char(4096))
begin
	cancel;
end;
go

create or replace procedure sm_log (in summary_string char(255))
begin
	cancel;
end;
go

create or replace procedure correlation_process_sitenameparents ()
begin
	cancel;
end;
go

create or replace procedure xiny_add_timestamp (in out XinY char(4096), in out NumXinY int, in XEvents int, in YSeconds int, in ValueToAdd int)
begin
	cancel;
end;
go

create or replace procedure xiny_calculate_breach (in XinY char(4096), in NumXinY int, in XEvents int, in YSeconds int, in out BreachDetected int)
begin
	cancel;
end;
go

create or replace trigger correlation_process_existing_parents
group correlation_triggers
priority 15
comment 'Update any existing synthetic parent events that are present'
every 17 seconds
begin
	cancel;
end;
go

create or replace trigger correlation_new_row
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger correlation_update
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger correlation_deduplication
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger correlation_delete_row
group correlation_triggers
priority 15
comment 'Deletes from the master.correlation_* tables where needed'
before delete on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger webtop_compatibility
group compatibility_triggers
priority 10
comment 'Populates the master.profiles table for the WebGUI to read.\nNote the \n         trigger can be be disabled if no users are permitted to use the interactive SQL tool within the WebGUI'
every 3600 seconds
begin
	cancel;
end;
go

create or replace trigger hk_set_expiretime
group housekeeping_triggers
enabled false
priority 1
comment 'TRIGGER hk_set_expiretime\n--\nThis trigger sets the ExpireTime field for all events where it is\nnot yet set.  It works in conjunction with the default expire\ntrigger to provide an automated event expiry mechanism.\nDefault expiry thresholds:\n\nCritical events - threshold: HKExpireTimeSev5 (master.properties)\nMajor events - threshold: HKExpireTimeSev4 (master.properties)\nMinor events - threshold: HKExpireTimeSev3 (master.properties)\nWarning events - threshold: HKExpireTimeSev2 (master.properties)\nIndeterminate events - threshold: HKExpireTimeSev1 (master.properties)\n\nClear events are to be ignored by this trigger.\n'
every 599 seconds
begin
	cancel;
end;
go

create or replace trigger system_watch_shutdown
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer is being shutdown'
on signal shutdown
begin
	cancel;
end;
go

create or replace trigger system_watch_startup
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer has started'
on signal startup
begin
	cancel;
end;
go

create or replace trigger resync_old_events
group failback_triggers
priority 1
comment 'This trigger processes the contents of the table alerts.resync_complete.  For each entry found, this trigger\nwill initiate a flush of all events over the next IDUC cycle.  This is to ensure synchronicity across all ObjectServers\nin particular between the Aggregation ObjectServers.'
every 15 seconds
begin
	cancel;
end;
go

create or replace trigger detect_agg_gate_resync_complete
group failback_triggers
priority 1
comment 'This trigger detects the moment the faiover Gateway AGG_GATE completes its resychronisation step.\nIt then inserts a row in the table alerts.resync_complete.  The contents of this table is processed by the\ntemporal trigger resync_old_events which updates all events causing them to be flushed to the counterpart\nObjectServer to ensure synchronicity.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger disconnect_all_clients
group failback_triggers
enabled false
priority 2
comment 'Once bidirectional Gateway resynchronisation has completed, disconnect all clients\nexcept for the bidirectional Gateway, Administrator and Web GUI clients.\nThis will cause all connected clients to fail back to the primary ObjectServer AGG_P.\nThis trigger should only be enabled on the backup ObjectServer AGG_B.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_process_top_probes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Probes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_db_stats
group self_monitoring_group
priority 11
comment 'Creates synthetic events for ObjectServer DB stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_client_time
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer time spent executing client SQL'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_process_top_classes
group self_monitoring_group
enabled false
priority 10
comment 'Creates synthetic events for top Classes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_block_events_from_gateway
group self_monitoring_group
priority 1
comment 'TRIGGER: block_sm_events_from_gateway\n--\nThis trigger prevents the self monitoring events from being inserted into the\nDisplay layer ObjectServers from the layers below.  This is to prevent\nduplication of events within the GUI.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_connections
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer client connections stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_delete_clears_display
group self_monitoring_group
priority 10
comment 'Delete clear synthetic alerts over 2 minutes old on Display ObjectServers.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_memstore
group self_monitoring_group
priority 10
comment 'Creates synthetic events for memstore stats.'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_triggers
group self_monitoring_group
priority 10
comment 'Creates synthetic events for Objectserver Trigger stats.'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_classes table.'
before reinsert on master.sm_top_classes for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_probes table.'
before reinsert on master.sm_top_probes for each row
begin
	cancel;
end;
go

create or replace trigger sm_expire_display_events
group self_monitoring_group
priority 10
comment 'Expire local self monitoring events on Display ObjectServers.'
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger sm_dbops_stats
group self_monitoring_group
priority 10
comment 'Creates synthetic events for DB operations stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_deduplication_grade
group self_monitoring_group
priority 10
comment 'Updates Grade, ExpireTime and Acknowledged fields on deduplication\nof self-monitoring events.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_log_alert_inserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_process_top_nodes
group self_monitoring_group
enabled false
priority 10
comment 'Creates synthetic events for top Nodes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_nodes table.'
before reinsert on master.sm_top_nodes for each row
begin
	cancel;
end;
go

create or replace trigger sm_check_probe_heartbeats
group self_monitoring_group
priority 10
comment 'Check Probe heartbeat events and raise Severity of ones that have not heartbeated for more than 3 minutes.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_create_journal_on_severity_change
group self_monitoring_group
priority 1
comment 'Inserts a journal for ALERT events if the Severity is updated.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_time_to_display_severity
group self_monitoring_group
priority 10
comment 'This trigger adjusts the Severity of time to display events based on the metric.'
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger sm_log_alert_reinserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger re_remove_dangling_parentEvent
group ibm_re_triggers
priority 20
comment 'drop the severity of a synthetic event from impact that have no children'
every 20 seconds
begin
	cancel;
end;
go

create or replace trigger update_service_affecting_events
group sae
enabled false
priority 1
comment 'Update Service Affecting Events'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger deduplication
group default_triggers
enabled false
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger accelerated_inserts
group default_triggers
priority 1
comment 'Fast track inserts from alerts.status to higher tiers in a tiered environment'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger agg_deduplication
group default_triggers
priority 2
comment 'Replacement reinsert trigger (alerts.status) for multi-ObjectServer environments.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_recopy_classes_to_devices
group default_triggers
priority 20
comment 'Recopy classes to the device_types table after creation of a new class.'
before insert on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_types_table_deduplication
group default_triggers
priority 2
comment 'Gracefully handles attempted deduplications into the master.device_types table.'
before reinsert on master.device_types for each row
begin
	cancel;
end;
go

create or replace trigger service_update
group default_triggers
priority 1
comment 'Service processing for service.status'
before update on service.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_process_counter_events
group default_triggers
priority 20
comment 'Periodically process the event counter events received from the Collection layer.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger xiny_on_insert
group default_triggers
priority 3
comment '\nX IN Y - INSERT CHECK\n---------------------\nThis trigger causes timestamps to be collected every time an occurrence of an\nevent is received where all of the following are true:\n\n - this ObjectServer is the current acting primary\n - the field XEvents contains a valid non-zero value\n - the field YSeconds contains a valid non-zero value\n - the incoming event is not clear (Severity = 0)\n - the insert is not coming from an ObjectServer Gateway\n\nX in Y thresholding calculations are then done on the values stored in XinY.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_new_row
group default_triggers
priority 20
comment 'Inserts into master.devices on insert into alerts.status.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_table_deduplication
group default_triggers
priority 2
comment 'Update the last received timestamp on deduplication in the master.devices table.'
before reinsert on master.devices for each row
begin
	cancel;
end;
go

create or replace trigger xiny_on_reinsert
group default_triggers
priority 3
comment '\nX IN Y - REINSERT CHECK\n-----------------------\nThis trigger causes timestamps to be collected every time an occurrence of an\nevent is received where all of the following are true:\n\n - this ObjectServer is the current acting primary\n - the field XEvents contains a valid value\n - the field YSeconds contains a valid value\n - the incoming event is not clear (Severity = 0)\n\nValues coming from from the Collection layer must be merged with the existing\nvalue set stored in XinY.\n\nValues coming from the failover Gateway will replace the existing row via the\nagg_deduplication trigger.\n\nX in Y thresholding calculations are then done on the values stored in XinY.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_expire_nodes
group default_triggers
priority 20
comment 'Periodically expire device nodes from master.devices.'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger clean_journal_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.JOURNAL'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger service_insert
group default_triggers
priority 1
comment 'Service processing for service.status'
before insert on service.status for each row
begin
	cancel;
end;
go

create or replace trigger service_reinsert
group default_triggers
priority 1
comment 'Service processing for service.status'
before reinsert on service.status for each row
begin
	cancel;
end;
go

create or replace trigger clean_details_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.DETAILS'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger state_change
group default_triggers
priority 1
comment 'State change processing for ALERTS.STATUS'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_daily_log_count
group default_triggers
priority 20
comment 'Daily write to log a summary of counts of device types.'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger agg_new_row
group default_triggers
priority 2
comment 'Replacement insert trigger (alerts.status) for multi-ObjectServer environments.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger device_counter_deduplication
group default_triggers
priority 20
comment 'Inserts into master.devices on reinsert into alerts.status.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger update_company
group default_triggers
priority 10
comment 'Updates Company field if value is null on insert'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger new_row
group default_triggers
enabled false
priority 1
comment 'Set default values for new alerts in ALERTS.STATUS'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger deduplicate_details
group default_triggers
priority 1
comment 'Deduplicate rows on alerts.details'
before reinsert on alerts.details for each row
begin
	cancel;
end;
go

create or replace trigger timestamp_inserts
group default_triggers
priority 3
comment 'Records timestamps for insertion into each tier (alerts.status) in multi-ObjectServer environments.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger connection_watch_connect
group connection_watch
priority 1
comment 'Create an alert when a new client connects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the connect.\nA gateway connection for example is treated as a resolution (clearing a disconnect), whereas an eventlist connect is a Type 1 event which will be resolved by a disconnect) '
on signal connect
begin
	cancel;
end;
go

create or replace trigger connection_watch_disconnect
group connection_watch
priority 1
comment 'Create an alert when a client disconnects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the disconnect.\nA gateway disconnection for example is treated as a problem, where as an eventlist disconnect is a resolution'
on signal disconnect
begin
	cancel;
end;
go

create or replace trigger delete_minor
group lumos_triggers
priority 1
comment 'Delete all minor alarms older than 30 days.'
every 43200 seconds
begin
	cancel;
end;
go

create or replace trigger set_flash_act
group lumos_triggers
priority 1
comment 'Take all alarms that have FastTrack set to 1 that have not been acted on by the NOC, and set Flash = 1'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger probe_mail_on_critical
group lumos_triggers
enabled false
priority 3
comment 'Send email about critical Probe alerts that are unacknowledged after 5 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 180 seconds
begin
	cancel;
end;
go

create or replace trigger delete_Sev1
group lumos_triggers
priority 1
comment 'Delete any Sev1 alarms older than a week'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger pronx_heartbeat
group lumos_triggers
priority 3
comment 'Watchdog for heartbeat messages from proNx poller'
every 1200 seconds
begin
	cancel;
end;
go

create or replace trigger gateway_mail_on_critical
group lumos_triggers
enabled false
priority 4
comment 'Send email about critical jdbc gateway alerts that are unacknowledged after 5 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 240 seconds
begin
	cancel;
end;
go

create or replace trigger delete_informational
group lumos_triggers
priority 1
comment 'Remove Sev2 alarms that havent counted up in a month'
every 43200 seconds
begin
	cancel;
end;
go

create or replace trigger generic_clear
group primary_only
priority 1
comment 'Generic Problem/Resolution'
every 5 seconds
begin
	cancel;
end;
go

create or replace trigger escalate_off
group primary_only
priority 1
comment 'Will set Flash field to 0 (not flashing) and SuppressEscl to 0 (not escalated in this example) when an event that has previously had the Flash field set to 1 is Acknowledged or if the event is Cleared (Severity = 0).'
every 5 seconds
begin
	cancel;
end;
go

create or replace trigger expire
group primary_only
priority 1
comment 'Expiration'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger delete_clears
group primary_only
priority 1
comment 'Delete clear alerts over 5 minutes old in ALERTS.STATUS every 60 seconds'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger mail_on_critical
group primary_only
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 10 seconds
begin
	cancel;
end;
go

create or replace trigger check_suf_status
group primary_only
enabled false
priority 20
comment 'Check SUF Status'
every 600 seconds
begin
	cancel;
end;
go

create or replace trigger flash_not_ack
group primary_only
enabled false
priority 1
comment 'Will set Flashing on (Flash=1) for events that are Critical (Severity=5) and are 10 minutes old but have not been acknowledged by a user yet (Acknowledge = 0). It sets SuppressEscl to 1 as a further indication of the events escalation status.'
every 31 seconds
begin
	cancel;
end;
go

create or replace trigger resync_complete
group primary_only
priority 1
comment 'Creates synthetic events to indicate when Gateways have completed resynchronisation.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger disable_user
group security_watch
priority 1
comment 'Disable users when they fail to log on after n consecutive failures'
on signal login_failed
begin
	cancel;
end;
go

create or replace trigger disable_inactive_users
group security_watch
enabled false
priority 1
comment 'Disable users that have not logged on to the objectserver within a defined period'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger reset_user
group security_watch
priority 1
comment 'Reset the users failure count when they logon successfully.'
on signal connect
begin
	cancel;
end;
go

create or replace trigger security_watch_security_failure
group security_watch
priority 1
comment 'Create an alert when a client fails to authenticate'
on signal login_failed
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been altered'
on signal alter_object
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been dropped'
before delete on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been dropped'
on signal drop_object
begin
	cancel;
end;
go

create or replace trigger audit_config_create_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been created'
before insert on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been altered'
before update on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been altered'
before update on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been altered'
before update on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been dropped'
before delete on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been dropped'
before delete on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been created'
before insert on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been altered'
before update on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been altered'
before update on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been created'
before insert on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been created'
before insert on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been altered'
before update on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been created'
before insert on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been created'
before insert on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_property
group audit_config
priority 1
comment 'Create an alert indicating that a property has been altered'
on signal alter_property
begin
	cancel;
end;
go

create or replace trigger audit_config_permission_denied
group audit_config
priority 1
comment 'Create an alert indicating that a permission denied'
on signal permission_denied
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been dropped'
before delete on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been dropped'
before delete on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been dropped'
before delete on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been created'
on signal create_object
begin
	cancel;
end;
go

create or replace trigger profiler_group_report
group profiler_triggers
priority 2
comment 'Profiler application group reporting trigger'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger profiler_report
group profiler_triggers
priority 1
comment 'Profiler reporting trigger'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger profiler_toggle
group profiler_triggers
priority 1
comment 'Report that the profiler has been toggled'
on signal profiler_toggle
begin
	cancel;
end;
go

create or replace trigger trigger_stats_report
group trigger_stat_reports
priority 1
comment 'Trigger statistic report trigger'
on signal trigger_stats_report
begin
	cancel;
end;
go

create or replace trigger delete_stats
group stats_triggers
priority 20
comment 'keep up to 120 days of records in the master.stats table'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger details_inserts
group stats_triggers
priority 20
comment 'Counts details table inserts'
before insert on alerts.details for each row
begin
	cancel;
end;
go

create or replace trigger stats_reset
group stats_triggers
priority 1
comment 'Reset the statistics data'
on signal stats_reset
begin
	cancel;
end;
go

create or replace trigger new_status_inserts
group stats_triggers
priority 20
comment 'Counts new status table inserts'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger journal_inserts
group stats_triggers
priority 20
comment 'Counts journal table inserts'
before insert on alerts.journal for each row
begin
	cancel;
end;
go

create or replace trigger status_updates
group stats_triggers
priority 20
comment 'Counts status table updates'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger dedup_status_inserts
group stats_triggers
priority 20
comment 'Counts deduplicated status table inserts'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger statistics_cleanup
group stats_triggers
priority 20
comment 'Delete statistics over an hour old'
every 3600 seconds
begin
	cancel;
end;
go

create or replace trigger statistics_gather
group stats_triggers
priority 20
comment 'Create some v3.x ObjectServer statistics'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger suppress_cross_domain_connections
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger severity_from_causetype
group itnm_triggers
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger registry_new_probe
group registry_triggers
priority 10
comment 'Set defaults for new entry in REGISTRY.PROBES'
before insert on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_reinsert_probe
group registry_triggers
priority 10
comment 'Treat inserts to existing PROBE.REGISTRY entry as though they were updates. Time stamp the record to keep track of the last time this entry was updated. Only probes directly connected, or connected via a proxy server, as well as gateways are allowed to re-insert into the table. Other applications must use UPDATE to modify the probe registry.'
before reinsert on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_update_probe
group registry_triggers
priority 10
comment 'Set the LastUpdate column for updates coming from all clients except gateways. Only permit updates from gateways if the LastUpdate time is more recent than the existing entry'
before update on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_probe_disconnect
group registry_triggers
priority 10
comment 'Reset ConnectionID in probe registry when probe or proxy server disconnects.'
on signal disconnect
begin
	cancel;
end;
go

create or replace trigger disconnect_iduc_missed
group iduc_triggers
priority 1
comment 'Disconnects real-time clients that have not communicated with objectserver for 100 granularity periods'
on signal iduc_missed
begin
	cancel;
end;
go

create or replace trigger iduc_stats_update
group iduc_triggers
priority 1
comment 'update LastIducTime in iduc_system.iduc_stats table on signal iduc_data_fetch'
on signal iduc_data_fetch
begin
	cancel;
end;
go

create or replace trigger iduc_messages_tblclean
group iduc_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.IDUC_MESSAGES'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger iduc_stats_disconnect
group iduc_triggers
priority 1
comment 'Update client entry failure time on disconnect'
on signal iduc_disconnect
begin
	cancel;
end;
go

create or replace trigger deduplicate_iduc_stats
group iduc_triggers
priority 1
comment 'Deduplicate rows on iduc_system.iduc_stats'
before reinsert on iduc_system.iduc_stats for each row
begin
	cancel;
end;
go

create or replace trigger iduc_stats_insert
group iduc_triggers
priority 1
comment 'Insert client entry into iduc_system.iduc_stats table on signal iduc_connect'
on signal iduc_connect
begin
	cancel;
end;
go

create or replace trigger scala_reinsert
group scala_triggers
priority 20
comment 'Fast Track an event reinsert for alerts.status to message bus Gateway running in SCALA mode'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger scala_insert
group scala_triggers
priority 20
comment 'Fast Track an event insert for alerts.status to message bus Gateway running in SCALA mode'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger AdvCorr_SetCauseType
group AdvCorr
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger AdvCorr_LPC_RC
group AdvCorr
priority 1
comment ''
every 17 seconds
begin
	cancel;
end;
go

create or replace trigger AdvCorr_LPC_Sym
group AdvCorr
priority 1
comment ''
every 17 seconds
begin
	cancel;
end;
go

create or replace trigger backup_succeeded
group automatic_backup_system
priority 1
comment 'Action to perform on a successful backup operation'
on signal backup_succeeded
begin
	cancel;
end;
go

create or replace trigger automatic_backup
group automatic_backup_system
enabled false
priority 1
comment 'The automatic backup trigger\n\nBacks up all ObjectServer memory stores to a sequence of locations dependent on "num_backups"\n'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger backup_failed
group automatic_backup_system
priority 1
comment 'Action to perform on a failed backup operation'
on signal backup_failed
begin
	cancel;
end;
go

create or replace trigger backup_state_integrity
group automatic_backup_system
priority 1
comment ''
before insert on alerts.backup_state for each row
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_down
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server is down'
on signal gw_counterpart_down
begin
	cancel;
end;
go

create or replace trigger backup_startup
group gateway_triggers
enabled false
priority 1
comment 'On startup dont start the automations'
on signal startup
begin
	cancel;
end;
go

create or replace trigger resync_finished
group gateway_triggers
priority 1
comment 'Resync finished'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger pass_deletes
group gateway_triggers
enabled false
priority 1
comment 'Delete rows in destination server that do not exist in source after resync'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_up
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server has come up'
on signal gw_counterpart_up
begin
	cancel;
end;
go

create or replace procedure get_sit_timeout (in situation_name char(64), out situation_timeout char(10))
declare sit_resurface_def_action character(10); sit_ack_expired_def_action character(10);sit_ack_expired_def_timeout character(10);situpdate_file character(20);sittimeout character(10)
begin


	execute get_config_parms(sit_ack_expired_def_action,sit_ack_expired_def_timeout,sit_resurface_def_action,situpdate_file);

   -- Find the timeout in the table, or use the default
	for each row timeout in alerts.itm_situation_timeouts
		where timeout.ITMSitName = situation_name
	begin
      set sittimeout = timeout.ITMExpireTime;
	end;

   if (sittimeout = '')
   then
      set sittimeout = sit_ack_expired_def_timeout;
   end if;

   set situation_timeout = sittimeout;


end;
go

create or replace procedure correlation_construct_impactcause (in identifier char(255), in out summary char(255))
begin

--
-- Procedure constructs the impact cause text in the summary for the parent event based on the priority child events.
--
-- Called by: correlation_process_sitenameparents, correlation_process_scopeidparents
--
-- Usage:  EXECUTE correlation_construct_impactcause (site.Identifier, summary);
--

	-- APPEND A COLON IF summary NOT BLANK
	if (summary != '') then
		set summary = summary + ': ';
	end if;

	-- FETCH THE CURRENT HIGHEST CAUSE AND IMPACT INFORMATION AND THEN
	-- BUILD THE IMPACT/CAUSE TEXT BASED ON THE HIGHEST WEIGHTED ITEMS
	for each row parentrec in master.correlation_priority_children where parentrec.Identifier = identifier
	begin

		-- NO CAUSE OR IMPACT ARE CURRENTLY PRESENT OR STORED
		if (parentrec.HighCauseText = 'UNKNOWN' and parentrec.HighImpactText = 'UNKNOWN') then

			set summary = summary + 'CAUSE AND IMPACT: UNKNOWN';

		-- THE IMPACT IS KNOWN BUT CAUSE IS NOT
		elseif (parentrec.HighCauseText = 'UNKNOWN' and parentrec.HighImpactText != 'UNKNOWN') then

			set summary = summary + parentrec.HighImpactText + ' UNKNOWN CAUSE';

		-- THE CAUSE IS KNOWN BUT IMPACT IS NOT
		elseif (parentrec.HighCauseText != 'UNKNOWN' and parentrec.HighImpactText = 'UNKNOWN') then

			set summary = summary + parentrec.HighCauseText + ' UNKNOWN IMPACT';

		-- THE HIGHEST CAUSE AND IMPACT ARE THE SAME PROBLEM
		elseif (parentrec.HighCauseText != 'UNKNOWN' and parentrec.HighCauseText = parentrec.HighImpactText) then

			set summary = summary + 'CAUSE AND IMPACT: ' + parentrec.HighCauseText;

		-- BOTH THE CAUSE AND IMPACT ARE KNOWN
		else

			set summary = summary + parentrec.HighImpactText + ' caused by ' + parentrec.HighCauseText;
		end if;
	end;

end;
go

create or replace procedure correlation_clear_expired_parents ()
declare parentfound INTEGER;
begin


	-- INITIALISE VARIABLES
	set parentfound = 0;

	-- TARGET PARENT EVENTS THAT ARE NOT CLEAR AND THAT HAVE NO CHILDREN EVENTS
	for each row parent in alerts.status where
		parent.Severity != 0 and
		parent.AlertGroup in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent') and
		parent.Identifier not in (select ParentIdentifier from alerts.status)
	begin

		-- DEAL WITH ANALYTICS BASED PARENTS FIRST
		if (parent.AlertGroup in ('Synthetic Event - Parent', 'ASMParent', 'CustomParent')) then

			-- CLEAR THE CHILDLESS PARENT
			set parent.Severity = 0;

		-- DEAL WITH SCOPE BASED PARENTS NEXT
		else

			-- MARK GROUPING ENTRY AS NOT FOUND INITIALLY
			set parentfound = 0;

			-- LOOK IN THE master.correlation_scopeid TABLE TO SEE IF THE ScopeID
			-- GROUPING HAS EXPIRED.  IF IT IS NOT FOUND, IT HAS ALREADY EXPIRED.
			for each row scopeidentry in master.correlation_scopeid where
				scopeidentry.ScopeID = parent.ScopeID
			begin

				-- IF CURRENT EVENT IS A SiteNameParent EVENT, CHECK THAT THE ACTIVE ScopeIDParent
				-- PRESENT IS ACTUALLY ITS DIRECT PARENT.  IF IT IS, THEN MARK IT AS FOUND.
				if (parent.AlertGroup = 'SiteNameParent' and
					parent.ParentIdentifier = scopeidentry.Identifier) then

					set parentfound = 1;

					-- CHECK IF ScopeID HAS EXPIRED
					if (scopeidentry.ExpireTime < getdate()) then

						-- CLEAR PARENT EVENT DUE TO GROUP EXPIRATION
						set parent.Severity = 0;
					end if;

				-- ELSE CHECK IF THE CURRENT PARENT IS THE CURRENT ACTIVE GROUPING
				elseif (parent.Identifier = scopeidentry.Identifier) then

					-- MARK ScopeID ENTRY AS HAVING BEEN FOUND
					set parentfound = 1;

					-- CHECK IF ScopeID HAS EXPIRED
					if (scopeidentry.ExpireTime < getdate()) then

						-- CLEAR PARENT EVENT DUE TO GROUP EXPIRATION
						set parent.Severity = 0;
					end if;
				end if;
			end;

			-- IF ScopeID GROUPING IS NOT FOUND, CLEAR IT AS IT HAS ALREADY EXPIRED
			if (parentfound = 0) then

				set parent.Severity = 0;
			end if;
		end if;
	end;

end;
go

create or replace procedure device_counter_log_nodes ()
declare num_network_devices int;
	num_server_devices int;
	num_client_devices int;
begin



	-- INITIALISE VARIABLES
	set num_network_devices = 0;
	set num_server_devices = 0;
	set num_client_devices = 0;

	-- COUNT UP DIFFERENT DEVICES TYPES
	for each row DeviceRow in master.devices
	begin

		if (DeviceRow.DeviceType = 0) then

			set num_network_devices = num_network_devices + 1;

		elseif (DeviceRow.DeviceType = 1) then

			set num_server_devices = num_server_devices + 1;

		elseif (DeviceRow.DeviceType = 2) then

			set num_client_devices = num_client_devices + 1;
		end if;
	end;

	write into device_counter_log values (
		to_char(getdate), ': ',
		'Network devices: ', to_char(num_network_devices), ', ',
		'Server devices: ', to_char(num_server_devices), ', ',
		'Client devices: ', to_char(num_client_devices));



end;
go

create or replace procedure jinsert (in serial int, in uid int, in tstamp utc, in msg char(4080))
begin


--
-- Procedure inserts a record into the alerts.journal table. Automations that 
-- require journal entries should execute this procedure.
--
-- Usage:  
--  call procedure jinsert( old.Serial, %user.user_id, getdate, 'This is my journal entry');
--
        insert into alerts.journal values (
		journal_keyfield( to_int( serial ), to_int( uid ), tstamp ), -- KeyField
                serial,                         -- Serial
                uid,                            -- UID
                tstamp,                         -- Chrono
                split_multibyte(msg, 1, 255),   -- Text1
                split_multibyte(msg, 2, 255),   -- Text2
                split_multibyte(msg, 3, 255),   -- Text3
                split_multibyte(msg, 4, 255),   -- Text4
                split_multibyte(msg, 5, 255),   -- Text5
                split_multibyte(msg, 6, 255),   -- Text6
                split_multibyte(msg, 7, 255),   -- Text7
                split_multibyte(msg, 8, 255),   -- Text8 
                split_multibyte(msg, 9, 255),   -- Text9 
                split_multibyte(msg, 10, 255),  -- Text10
                split_multibyte(msg, 11, 255),  -- Text11
                split_multibyte(msg, 12, 255),  -- Text12
                split_multibyte(msg, 13, 255),  -- Text13
                split_multibyte(msg, 14, 255),  -- Text14
                split_multibyte(msg, 15, 255),  -- Text15
                split_multibyte(msg, 16, 255)   -- Text16
	);


end;
go

create or replace procedure sm_insert (in identifier char(255), in node char(64), in alertgroup char(255), in severity int, in summary_string char(255), in event_metric int, in expiretime int, in event_type int)
begin


	-- INSERT A SYNTHETIC EVENT for Self Monitoring
	insert into alerts.status (
		Identifier, Node, Summary, Class, Type, Severity, FirstOccurrence, LastOccurrence,
		Tally, ExpireTime, AlertGroup, OwnerUID, Manager, Agent, ServerName, Grade) 
        values (
		identifier, node, summary_string, 99999, event_type, severity, getdate(), getdate(),
		1, expiretime + 30, alertgroup, 65534, 'OMNIbus Self Monitoring @' + getservername(),
		'OMNIbus SelfMonitoring', getservername(), event_metric) updating (Severity); 

end;
go

create or replace procedure device_counter_copy_classes_to_devices ()
begin



	-- THIS PROCEDURE WILL COPY ALL REGISTERED CLASSES TO THE
	-- master.device_types TABLE WITH A DEFAULT TYPE OF 0

	for each row ThisRow in alerts.conversions where
		ThisRow.Colname = 'Class'
	begin

		insert into master.device_types (
			Class,
			Conversion,
			DeviceType)
		values (
			ThisRow.Value,
			ThisRow.Conversion,
			0);
	end;


end;
go

create or replace procedure get_config_parms (out sit_ack_expired_def_action char(10), out sit_ack_expired_def_timeout char(10), out sit_resurface_def_action char(10), out situpdate_conf_file char(20))
begin


	set sit_ack_expired_def_action = 'REJECT';
   set sit_ack_expired_def_timeout = '59';
	set sit_resurface_def_action = 'ACCEPT';
	set situpdate_conf_file = 'situpdate.conf';

	for each row timeout in alerts.itm_situation_timeouts
		where timeout.ITMSitName = 'DEFAULT_SIT_EXPIRE_TIME'
	begin
      set sit_ack_expired_def_timeout = timeout.ITMExpireTime;
	end;


end;
go

create or replace procedure get_debug_itmsync (out debug_itmsync int)
begin


	set debug_itmsync = 0;


end;
go

create or replace procedure correlation_process_superparents ()
declare journaltositenameparent INTEGER;	-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO JOURNAL TO SiteNameParent EVENTS

	journaltoscopeidparent INTEGER;		-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO JOURNAL TO ScopeIDParent EVENTS
	scopeidserial INTEGER;			-- USED TO STORE THE Serial OF THE CURRENT ScopeIDParent EVENT
	scopeidparentidentifier CHAR(255);	-- USED TO STORE THE ParentIdentifier OF THE CURRENT ScopeIDParent EVENT

	journaltosuperparent INTEGER;		-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO JOURNAL TO SuperParent EVENTS
	superparentserial INTEGER;		-- USED TO STORE THE Serial OF THE CURRENT SuperParent EVENT
	superparentidentifier CHAR(255);		-- USED TO STORE THE ParentIdentifier OF THE CURRENT SuperParent EVENT
	superparentjournalcount INTEGER;	-- USED TO STORE THE NUMBER OF JOURNALS WRITTEN TO THE CURRENT SuperParent EVENT
	superparentjournalcounter INTEGER;	-- USED TO STORE HOW MANY EVENTS HAVE BEEN WRITTEN TO THE CURRENT superparentjournalentry
	maxsuperparentjournals INTEGER;		-- USED TO STORE THE MAXIMUM NUMBER OF JOURNALS ALLOWED IN THE CURRENT SuperParent EVENT

	journalmaxeventsperentry INTEGER;	-- USED TO STORE THE MAXIMUM NUMBER OF EVENTS THAT CAN BE WRITTEN IN EACH JOURNAL ENTRY

	journalservernameserverserial INTEGER;	-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO WRITE AN EVENT ServerName AND ServerSerial TO JOURNAL
	journalnode INTEGER;			-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO WRITE AN EVENT Node TO JOURNAL
	journalsummary INTEGER;			-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO WRITE AN EVENT Summary TO JOURNAL
	journalalertkey INTEGER;		-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO WRITE AN EVENT AlertKey TO JOURNAL
	journalcustomtext INTEGER;		-- USED TO STORE PROPERTY FOR WHETHER OR NOT TO WRITE AN EVENT CustomText TO JOURNAL

	thisjournalentry CHAR(4080);		-- USED TO CONSTRUCT THE ENTRY FOR THE CURRENT EVENT
	sitenameparentjournalentry CHAR(4080);	-- USED TO STORE THE CUMULATIVE JOURNAL ENTRY FOR A SiteNameParent EVENT
	sitenamejournalcounter INTEGER;		-- USED TO STORE HOW MANY EVENTS HAVE BEEN WRITTEN TO THE CURRENT sitenameparentjournalentry
	scopeidparentjournalentry CHAR(4080);	-- USED TO STORE THE CUMULATIVE JOURNAL ENTRY FOR A ScopeIDParent EVENT
	scopeidjournalcounter INTEGER;		-- USED TO STORE HOW MANY EVENTS HAVE BEEN WRITTEN TO THE CURRENT scopeidparentjournalentry
	sitenamejournaloffset INTEGER;		-- USED TO STORE THE CURRENT UID OFFSET TO USE WHEN WRITING SiteNameParent JOURNALS
	scopeidjournaloffset INTEGER;		-- USED TO STORE THE CURRENT UID OFFSET TO USE WHEN WRITING ScopeIDParent JOURNALS
begin

--
-- Procedure updates SuperParent like those created by NOI analytics to add journals of underlying child events.
-- This procedures uses properties stored in master.properties to drive its behaviour.
--
-- Called by: correlation_process_existing_parents
--
-- Usage:  EXECUTE correlation_process_superparents ( );
--

	-- INITIALISE LOCAL VARIABLES
	set journaltositenameparent = 0;

	set journaltoscopeidparent = 0;
	set scopeidserial = 0;
	set scopeidparentidentifier = '';

	set journaltosuperparent = 0;
	set superparentserial = 0;
	set superparentidentifier = '';
	set superparentjournalcount = 0;
	set superparentjournalcounter = 0;
	set maxsuperparentjournals = 100;

	set journalmaxeventsperentry = 20;

	set journalservernameserverserial = 1;
	set journalnode = 1;
	set journalsummary = 1;
	set journalalertkey = 1;
	set journalcustomtext = 1;

	set maxsuperparentjournals = 100;
	set superparentserial = 0;

	set thisjournalentry = '';
	set sitenameparentjournalentry = '';
	set scopeidparentjournalentry = '';
	set sitenamejournalcounter = 0;
	set scopeidjournalcounter = 0;
	set sitenamejournaloffset = 0;
	set scopeidjournaloffset = 0;

	-- LOAD UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGJournalToSiteNameParent',
		'SEGJournalToScopeIDParent',
		'SEGJournalToSuperParent',
		'SEGJournalMaxEventsPerEntry',
		'SEGJournalServerNameServerSerial',
		'SEGJournalNode',
		'SEGJournalSummary',
		'SEGJournalAlertKey',
		'SEGJournalCustomText',
		'SEGMaxSiteNameJournals',
		'SEGMaxScopeIDJournals',
		'SEGMaxSuperParentJournals')
	begin


		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE SiteNameParent EVENT
		if (property.Name = 'SEGJournalToSiteNameParent') then

			set journaltositenameparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGJournalToScopeIDParent') then

			set journaltoscopeidparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE SuperParent EVENT
		elseif (property.Name = 'SEGJournalToSuperParent') then

			set journaltosuperparent = property.IntValue;

		-- SPECIFIES HOW MANY EVENTS TO ROLL UP INTO A SINGLE JOURNAL ENTRY
		elseif (property.Name = 'SEGJournalMaxEventsPerEntry') then

			set journalmaxeventsperentry = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE ServerName:ServerSerial FIELDS TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalServerNameServerSerial') then

			set journalservernameserverserial = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Node FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalNode') then

			set journalnode = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Summary FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalSummary') then

			set journalsummary = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE AlertKey FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalAlertKey') then

			set journalalertkey = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE CustomText FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalCustomText') then

			set journalcustomtext = property.IntValue;

		-- SPECIFIES MAXIMUM NUMBER OF EVENTS TO SEND TO THE SUPER PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGMaxSuperParentJournals') then

			set maxsuperparentjournals = property.IntValue;
		end if;
	end;

	-- ONLY WRITE JOURNALS TO SUPER PARENT IF SEGJournalToScopeIDParent = 1
	if (journaltosuperparent = 1) then

		-- FOR EACH ScopeIDParent
		for each row scopeid in alerts.status where scopeid.AlertGroup in ('ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent')
		begin

			-- RESET VARIABLE
			set superparentjournalcounter = 0;

			-- ONLY PROCESS ScopeIDParent EVENTS THAT ARE THEMSELVES CHILDREN EVENTS
			if (scopeid.ParentIdentifier != '') then

				-- LOCATE SUPER PARENT AND STORE Serial VALUE
				for each row superparent in alerts.status where superparent.Identifier = scopeid.ParentIdentifier
				begin

					set superparentserial = superparent.Serial;
					set superparentidentifier = superparent.Identifier;
					set superparentjournalcount = superparent.Poll;
				end;

				-- INITIALISE VARIABLES
				set scopeidjournalcounter = 0;
				set scopeidparentjournalentry = '';

				-- ITERATE OVER CHILD EVENTS
				for each row child in alerts.status where child.ParentIdentifier = scopeid.Identifier
				begin

					-- DEAL WITH CASE WHERE CHILD IS A SiteNameParent EVENT
					if (child.AlertGroup = 'SiteNameParent') then

						-- INITIALISE VARIABLES
						set sitenamejournalcounter = 0;
						set sitenameparentjournalentry = '';

						-- ITERATE OVER GRANDCHILD EVENTS
						for each row grandchild in alerts.status where grandchild.ParentIdentifier = child.Identifier
						begin

							-- ADD GRANDCHILD TO JOURNAL ENTRY IF FLAGGED APPROPRIATELY - EITHER:
							-- - JOURNALLING TO SiteNameParent IS ENABLED AND IT HAS HAPPENED ALREADY
							-- - JOURNALLING TO SiteNameParent IS DISABLED AND HAS NOT BEEN JOURNALLED YET
							if (	(journaltositenameparent = 1 and grandchild.JournalSent = 1) OR
								(journaltositenameparent = 0 and grandchild.JournalSent = 0)) then

								-- CLEAR thisjournalentry CONTENTS AND counter VARIABLES
								set thisjournalentry = '';

								-- CONSTRUCT A JOURNAL ENTRY FOR CURRENT EVENT IF THE MAXIMUM NUMBER
								-- OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
								if (sitenamejournalcounter < journalmaxeventsperentry) then

									-- CHECK WHETHER OR NOT TO INCLUDE THE ServerName:ServerSerial IN THIS JOURNAL ENTRY
									if (journalservernameserverserial = 1) then

										set thisjournalentry = thisjournalentry + grandchild.ServerName +
											':' + to_char(grandchild.ServerSerial);
									end if;

									-- CHECK WHETHER OR NOT TO INCLUDE THE Node IN THIS JOURNAL ENTRY
									if (journalnode = 1 and grandchild.Node != '') then

										-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
										if (thisjournalentry != '') then
											set thisjournalentry = thisjournalentry + ': ';
										end if;

										set thisjournalentry = thisjournalentry + grandchild.Node;
									end if;

									-- CHECK WHETHER OR NOT TO INCLUDE THE Summary IN THIS JOURNAL ENTRY
									if (journalsummary = 1 and grandchild.Summary != '') then

										-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
										if (thisjournalentry != '') then
											set thisjournalentry = thisjournalentry + ': ';
										end if;

										set thisjournalentry = thisjournalentry + grandchild.Summary;
									end if;

									-- CHECK WHETHER OR NOT TO INCLUDE THE AlertKey IN THIS JOURNAL ENTRY
									if (journalalertkey = 1 and grandchild.AlertKey != '') then

										-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
										if (thisjournalentry != '') then
											set thisjournalentry = thisjournalentry + ': ';
										end if;

										set thisjournalentry = thisjournalentry + grandchild.AlertKey;
									end if;

									-- CHECK WHETHER OR NOT TO INCLUDE THE CustomText IN THIS JOURNAL ENTRY
									if (journalcustomtext = 1 and grandchild.CustomText != '') then

										-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
										if (thisjournalentry != '') then
											set thisjournalentry = thisjournalentry + ': ';
										end if;

										set thisjournalentry = thisjournalentry + grandchild.CustomText;
									end if;
								end if;

								-- ADD CURRENT EVENT thisjournalentry TO sitenameparentjournalentry IF:
								-- - IF THE MAXIMUM NUMBER OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
								-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS SuperParent HAS NOT BEEN EXCEEDED
								-- - THE CURRENT JOURNAL ENTRY IS NOT NULL
								if (	sitenamejournalcounter < journalmaxeventsperentry and
									(superparentjournalcount + superparentjournalcounter + sitenamejournalcounter) < maxsuperparentjournals and
									thisjournalentry != '') then

									-- APPEND A NEW LINE CHARACTER IF THERE IS ALREADY TEXT TO ADD
									if (sitenameparentjournalentry != '') then
										set sitenameparentjournalentry = sitenameparentjournalentry + '\n';
									end if;

									-- ADD THE CURRENT JOURNAL ENTRY TO THE EXISTING
									set sitenameparentjournalentry = sitenameparentjournalentry + thisjournalentry;

									-- INCREMENT sitenamejournalcounter
									set sitenamejournalcounter = sitenamejournalcounter + 1;

									-- MARK CHILD EVENT AS HAVING BEEN JOURNALLED TO SUPER PARENT
									set grandchild.JournalSent = 2;
				 				end if;

								-- ADD A JOURNAL ENTRY TO THE CURRENT SuperParent NOW IF MAX EVENTS PER ENTRY IS REACHED, UPDATE COUNT, RESET VARS
								if (sitenamejournalcounter = journalmaxeventsperentry) then

									EXECUTE jinsert(superparentserial, 1100000 + sitenamejournaloffset, getdate,
										child.ScopeID + ': ' + child.SiteName + ': CHILD EVENTS:\n' + sitenameparentjournalentry);

									-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
									set superparentjournalcounter = superparentjournalcounter + sitenamejournalcounter;

									-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SuperParent
									-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
									if (superparentjournalcount + superparentjournalcounter = maxsuperparentjournals) then

										EXECUTE jinsert(superparentserial, 1100000 + sitenamejournaloffset, getdate + 1,
											'*** MAXIMUM OF ' + to_char(maxsuperparentjournals) +
											' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
									end if;

									-- INCREMENT THE JOURNAL UID OFFSET
									set sitenamejournaloffset = sitenamejournaloffset + 1;

									-- RESET SOME VARIABLES
									set sitenameparentjournalentry = '';
									set sitenamejournalcounter = 0;
								end if;
							end if;

						end; -- ITERATE OVER GRANDCHILD EVENTS

						-- WRITE sitenamejournalentry TO SUPER PARENT IF NOT NULL
						if (sitenameparentjournalentry != '') then

							EXECUTE jinsert(superparentserial, 1100000 + sitenamejournaloffset, getdate,
								child.ScopeID + ': ' + child.SiteName + ': CHILD EVENTS:\n' + sitenameparentjournalentry);

							-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
							set superparentjournalcounter = superparentjournalcounter + sitenamejournalcounter;

							-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SiteNameParent
							-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
							if (superparentjournalcount + superparentjournalcounter = maxsuperparentjournals) then

								EXECUTE jinsert(superparentserial, 1100000 + sitenamejournaloffset, getdate + 1,
									'*** MAXIMUM OF ' + to_char(maxsuperparentjournals) +
									' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
							end if;

							-- INCREMENT THE JOURNAL UID OFFSET
							set sitenamejournaloffset = sitenamejournaloffset + 1;
						end if;

					-- ELSE ScopeID CHILD EVENT IS A REGULAR EVENT
					else

						-- ADD CHILD TO JOURNAL ENTRY IF FLAGGED APPROPRIATELY - EITHER:
						-- - JOURNALLING TO ScopeIDParent IS ENABLED AND IT HAS HAPPENED ALREADY
						-- - JOURNALLING TO ScopeIDParent IS DISABLED AND HAS NOT BEEN JOURNALLED YET
						if (	(journaltoscopeidparent = 1 and child.JournalSent = 1) OR
							(journaltoscopeidparent = 0 and child.JournalSent = 0)) then

							-- CLEAR thisjournalentry VARIABLE
							set thisjournalentry = '';

							-- CONSTRUCT A JOURNAL ENTRY FOR CURRENT EVENT IF THE MAXIMUM NUMBER
							-- OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
							if (scopeidjournalcounter < journalmaxeventsperentry) then

								-- CHECK WHETHER OR NOT TO INCLUDE THE ServerName:ServerSerial IN THIS JOURNAL ENTRY
								if (journalservernameserverserial = 1) then

									set thisjournalentry = thisjournalentry + child.ServerName +
										':' + to_char(child.ServerSerial);
								end if;

								-- CHECK WHETHER OR NOT TO INCLUDE THE Node IN THIS JOURNAL ENTRY
								if (journalnode = 1 and child.Node != '') then

									-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
									if (thisjournalentry != '') then
										set thisjournalentry = thisjournalentry + ': ';
									end if;

									set thisjournalentry = thisjournalentry + child.Node;
								end if;

								-- CHECK WHETHER OR NOT TO INCLUDE THE Summary IN THIS JOURNAL ENTRY
								if (journalsummary = 1 and child.Summary != '') then

									-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
									if (thisjournalentry != '') then
										set thisjournalentry = thisjournalentry + ': ';
									end if;

									set thisjournalentry = thisjournalentry + child.Summary;
								end if;

								-- CHECK WHETHER OR NOT TO INCLUDE THE AlertKey IN THIS JOURNAL ENTRY
								if (journalalertkey = 1 and child.AlertKey != '') then

									-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
									if (thisjournalentry != '') then
										set thisjournalentry = thisjournalentry + ': ';
									end if;

									set thisjournalentry = thisjournalentry + child.AlertKey;
								end if;

								-- CHECK WHETHER OR NOT TO INCLUDE THE CustomText IN THIS JOURNAL ENTRY
								if (journalcustomtext = 1 and child.CustomText != '') then

									-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
									if (thisjournalentry != '') then
										set thisjournalentry = thisjournalentry + ': ';
									end if;

									set thisjournalentry = thisjournalentry + child.CustomText;
								end if;
							end if;

							-- ADD CURRENT EVENT thisjournalentry TO scopeidparentjournalentry IF:
							-- - IF THE MAXIMUM NUMBER OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
							-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS SuperParent HAS NOT BEEN EXCEEDED
							-- - THE CURRENT JOURNAL ENTRY IS NOT NULL
							if (	scopeidjournalcounter < journalmaxeventsperentry and
								(superparentjournalcount + superparentjournalcounter + scopeidjournalcounter) < maxsuperparentjournals and
								thisjournalentry != '') then

								-- APPEND A NEW LINE CHARACTER IF THERE IS ALREADY TEXT TO ADD
								if (scopeidparentjournalentry != '') then
									set scopeidparentjournalentry = scopeidparentjournalentry + '\n';
								end if;

								-- ADD THE CURRENT JOURNAL ENTRY TO THE EXISTING
								set scopeidparentjournalentry = scopeidparentjournalentry + thisjournalentry;

								-- INCREMENT sitenamejournalcounter
								set scopeidjournalcounter = scopeidjournalcounter + 1;

								-- MARK CHILD EVENT AS HAVING BEEN JOURNALLED TO SUPER PARENT
								set child.JournalSent = 2;
			 				end if;

							-- ADD A JOURNAL ENTRY TO THE CURRENT SuperParent NOW IF MAX EVENTS PER ENTRY IS REACHED, UPDATE COUNT, RESET VARS
							if (scopeidjournalcounter = journalmaxeventsperentry) then

								EXECUTE jinsert(superparentserial, 1000000 + scopeidjournaloffset, getdate,
									scopeid.ScopeID + ': CHILD EVENTS:\n' + scopeidparentjournalentry);

								-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
								set superparentjournalcounter = superparentjournalcounter + scopeidjournalcounter;

								-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SiteNameParent
								-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
								if (superparentjournalcount + superparentjournalcounter = maxsuperparentjournals) then

									EXECUTE jinsert(superparentserial, 1000000 + scopeidjournaloffset, getdate + 1,
										'*** MAXIMUM OF ' + to_char(maxsuperparentjournals) +
										' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
								end if;

								-- INCREMENT THE JOURNAL UID OFFSET
								set scopeidjournaloffset = scopeidjournaloffset + 1;

								-- RESET SOME VARIABLES
								set scopeidparentjournalentry = '';
								set scopeidjournalcounter = 0;
							end if;
						end if;
					end if;

				end; -- ITERATE OVER CHILD EVENTS

				-- WRITE scopeidjournalentry TO SUPER PARENT IF NOT NULL
				if (scopeidparentjournalentry != '') then

					EXECUTE jinsert(superparentserial, 1000000 + scopeidjournaloffset, getdate,
						scopeid.ScopeID + ': CHILD EVENTS:\n' + scopeidparentjournalentry);

					-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
					set superparentjournalcounter = superparentjournalcounter + scopeidjournalcounter;

					-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SiteNameParent
					-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
					if (superparentjournalcount + superparentjournalcounter = maxsuperparentjournals) then

						EXECUTE jinsert(superparentserial, 1000000 + scopeidjournaloffset, getdate + 1,
							'*** MAXIMUM OF ' + to_char(maxsuperparentjournals) +
							' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
					end if;

					-- INCREMENT THE JOURNAL UID OFFSET
					set scopeidjournaloffset = scopeidjournaloffset + 1;
				end if;
			end if;

			-- UPDATE TOTAL NUMBER OF JOURNALS STORED IN SUPER PARENT IF ANY HAVE BEEN ADDED
			if (superparentjournalcounter != 0) then

				update alerts.status set Poll = Poll + superparentjournalcounter where Identifier = superparentidentifier;
			end if;

		end; -- FOR EACH ScopeIDParent
	end if;

end;
go

create or replace procedure correlation_dismantle_small_groups ()
declare minimumchildren INTEGER;
	minimumttl INTEGER;
	clearttnumber INTEGER;
	activescopeid INTEGER;
begin


	-- INITIALISE LOCAL VARIABLES
	set minimumchildren = 0;
	set minimumttl = 120;
	set clearttnumber = 0;
	set activescopeid = 0;

	-- LOAD UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGMinimumChildren', 'SEGMinimumScopeIDTTL', 'SEGClearTTNumber')
	begin

		-- SPECIFIES THE MINIMUM NUMBER OF CHILDREN A ScopeIDParent MUST HAVE TO LIVE BEYOND ITS EXPIRETIME
		if (property.Name = 'SEGMinimumChildren') then

			set minimumchildren = property.IntValue;

		-- SPECIFIES THE MINIMUM TIME TO LIVE OF ScopeIDParent EVENTS
		elseif (property.Name = 'SEGMinimumScopeIDTTL') then

			set minimumttl = property.IntValue;

		-- SPECIFIES THAT INHERITED TICKET NUMBER SHOULD BE CLEARED FROM CHILDREN IF DISMANTLING
		elseif (property.Name = 'SEGClearTTNumber') then

			set clearttnumber = property.IntValue;
		end if;
	end;

	-- FOR EACH ScopeIDParent THAT HAS HAD LESS THAN THE THRESHOLD NUMBER OF CHILDREN
	for each row smallparent in alerts.status where
		smallparent.Poll < minimumchildren and
		smallparent.InternalLast < (getdate() - minimumttl) and
		smallparent.AlertGroup = 'ScopeIDParent' and
		smallparent.Identifier in (select ParentIdentifier from alerts.status)
	begin

		-- RESET ACTIVESCOPEID
		set activescopeid = 0;

		-- LOOK FOR A VALID ENTRY IN THE master.correlation_scopeid TABLE
		for each row scopeidentry in master.correlation_scopeid where
			scopeidentry.Identifier = smallparent.Identifier and
			scopeidentry.ExpireTime > getdate()
		begin

			-- MARK THIS AS AN ACTIVE ScopeID
			set activescopeid = 1;
		end;

		-- IF THE ScopeIDParent EVENT IS NOT ACTIVE, DISMANTLE IT
		if (activescopeid = 0) then

			-- UNLINK EACH CHILD EVENT
			for each row child in alerts.status where child.ParentIdentifier = smallparent.Identifier
			begin

				-- IF THE CHILD IS A SiteNameParent, UNLINK ITS CHILDREN
				if (child.AlertGroup = 'SiteNameParent') then

					for each row grandchild in alerts.status where 
						grandchild.ParentIdentifier = child.Identifier
					begin

						-- UNLINK GRANDCHILD FROM SiteNameParent
						set grandchild.ParentIdentifier = '';

						-- CLEAR CHILD INHERITED TTNumber IF OPTION TO CLEAR IS SET
						if (clearttnumber = 1 and
							grandchild.TTNumber != '' and
							grandchild.TTNumber = child.TTNumber) then

							set grandchild.TTNumber = '';
						end if;
					end;
				end if;

				-- UNLINK CHILD FROM ScopeIDParent
				set child.ParentIdentifier = '';

				-- CLEAR CHILD INHERITED TTNumber IF OPTION TO CLEAR IS SET
				if (clearttnumber = 1 and
					child.TTNumber != '' and
					child.TTNumber = smallparent.TTNumber) then

					set child.TTNumber = '';
				end if;
			end;
		end if;
	end;

end;
go

create or replace procedure get_install_loc (out install_loc char(255))
begin


	 set install_loc = 'C:\\Program Files (x86)\\IBM\\SitForwarder'


end;
go

create or replace procedure correlation_process_scopeidparents ()
declare propagatettnumber INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE TTNumber TO CHILD EVENTS
	propagateacknowledged INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE Acknowledged TO CHILD EVENTS
	propagateowneruid INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE OwnerUID TO CHILD EVENTS
	propagateownergid INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE OwnerGID TO CHILD EVENTS

	usescopeidprefix INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE ScopeID PREFIX IN THE SUMMARY
	scopeidprefix CHAR(255);			-- PROPERTY FOR THE ScopeID PREFIX
	usescopeidlabel INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE ScopeID IN THE SUMMARY
	usescopeidimpactcause INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE IMPACT CAUSE TEXT IN THE SUMMARY
	usescopeidcustomtext INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE CustomText IN THE SUMMARY
	propagatetexttoscopeidparentcause INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON CauseWeight
	propagatetexttoscopeidparentimpact INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON ImpactWeight
	propagatetexttoscopeidparentfirst INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON FirstOccurrence
	propagatetexttoscopeidparentlast INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON LastOccurrence
	customtext CHAR(4096);				-- VARIABLE TO STORE CustomText FROM PRIORITY CHILD
	usescopeidsitesaffected INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO SHOW NUMBER OF SITES AFFECTED IN THE SUMMARY
	scopeidsitesaffectedlabel CHAR(255);		-- PROPERTY FOR WHAT THE site LABEL SHOULD BE
	usescopeidnumactivealarms INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO SHOW NUMBER OF ACTIVE ALARMS AT END OF SUMMARY

	highcauseweight INTEGER;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST CauseWeight
	highcausetext CHAR(255);			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST CauseWeight CustomText
	highimpactweight INTEGER;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST ImpactWeight
	highimpacttext CHAR(255);			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST ImpactWeight CustomText
	highseverity INTEGER;				-- VARIABLE USED TO STORE CHILD EVENT HIGHEST Severity
	lowfirstoccurrence TIME;			-- VARIABLE USED TO STORE CHILD EVENT LOWEST FirstOccurrence
	highlastoccurrence TIME;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST LastOccurrence
	alarmcounter INTEGER;				-- VARIABLE USED TO TALLY UP THE NUMBER OF SUB-GROUPS
	alarmcounter2 INTEGER;				-- VARIABLE USED TO TALLY UP THE NUMBER OF GRANDCHILD EVENTS
	alarmcounter3 INTEGER;				-- VARIABLE USED TO TALLY UP THE NUMBER OF DIRECT CHILD EVENTS
	summary CHAR(255);				-- VARIABLE USED TO CONSTRUCT THE Summary FIELD FOR EACH ScopeIDParent EVENT

	journaltoscopeidparent INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO JOURNAL TO ScopeIDParent EVENTS
	journalmaxeventsperentry INTEGER;		-- PROPERTY FOR WHAT THE MAXIMUM NUMBER OF EVENTS IS PER JOURNAL ENTRY
	journalservernameserverserial INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD ServerName AND ServerSerial IN JOURNAL ENTRIES
	journalnode INTEGER;				-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD Node IN JOURNAL ENTRIES
	journalsummary INTEGER;				-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD Summary IN JOURNAL ENTRIES
	journalalertkey INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD AlertKey IN JOURNAL ENTRIES
	journalcustomtext INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD CustomText IN JOURNAL ENTRIES
	maxscopeidjournals INTEGER;			-- PROPERTY FOR THE MAXIMUM ALLOWABLE NUMBER OF CHILD EVENTS TO JOURNAL TO ScopeIDParent EVENTS
	thisjournalentry CHAR(4080);			-- VARIABLE USED TO CONSTRUCT THE JOURNAL ENTRY FOR THE CURRENT EVENT
	scopeidparentjournalentry CHAR(4080);		-- VARIABLE USED TO STORE THE CUMULATIVE CHILD ENTRIES FOR EACH JOURNAL ENTRY
	journalcounter INTEGER;				-- VARIABLE USED TO COUNT THE NUMBER OF CHILD ENTRIES THAT HAVE BEEN ADDED TO THE CURRENT JOURNAL ENTRY
	journaloffset INTEGER;				-- VARIABLE USED TO INCREMENT THE UID VALUE USED WHEN CREATING JOURNALS TO AVOID PRIMARY KEY CLASH

	scopeidsummaryactivefirst INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO SHOW NUMBER OF ACTIVE ALARMS AT BEGINNING OF SUMMARY
	prioritytext CHAR(255);				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT CustomText DATA
	prioritytimestamp TIME;				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT TIMESTAMP DATA
	priorityweight INTEGER;				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT WEIGHTING DATA
begin

--
-- Procedure updates ScopeIDParent and synthetic parent events created by NOI analytics.
-- This procedures uses properties stored in master.properties to drive its behaviour.
--
-- Called by: correlation_process_existing_parents
--
-- Usage:  EXECUTE correlation_process_scopeidparents ( );
--

	-- INITIALISE LOCAL VARIABLES
	set propagatettnumber = 1;
	set propagateacknowledged = 1;
	set propagateowneruid = 1;
	set propagateownergid = 1;

	set usescopeidprefix = 1;
	set scopeidprefix = '';
	set usescopeidlabel = 1;
	set usescopeidimpactcause = 0;
	set usescopeidcustomtext = 0;
	set propagatetexttoscopeidparentcause = 0;
	set propagatetexttoscopeidparentimpact = 0;
	set propagatetexttoscopeidparentfirst = 0;
	set propagatetexttoscopeidparentlast = 0;
	set customtext = '';
	set usescopeidsitesaffected = 1;
	set scopeidsitesaffectedlabel = 'site';
	set usescopeidnumactivealarms = 0;

	set highcauseweight = 0;
	set highcausetext = 'UNKNOWN';
	set highimpactweight = 0;
	set highimpacttext  = 'UNKNOWN';
	set highseverity = 0;
	set lowfirstoccurrence = 0;
	set highlastoccurrence = 0;
	set alarmcounter= 0;
	set alarmcounter2 = 0;
	set alarmcounter3 = 0;
	set summary = '';

	set journaltoscopeidparent = 0;
	set journalmaxeventsperentry = 20;
	set journalservernameserverserial = 1;
	set journalnode = 1;
	set journalsummary = 1;
	set journalalertkey = 0;
	set journalcustomtext = 0;
	set maxscopeidjournals = 50;
	set thisjournalentry = '';
	set scopeidparentjournalentry = '';
	set journalcounter = 0;
	set journaloffset = 0;

	set scopeidsummaryactivefirst = 0;

	-- LOAD UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGPropagateTTNumber',
		'SEGPropagateAcknowledged',
		'SEGPropagateOwnerUID',
		'SEGPropagateOwnerGID',
		'SEGUseScopeIDPrefix',
		'SEGScopeIDPrefix',
		'SEGUseScopeIDLabel',
		'SEGUseScopeIDImpactCause',
		'SEGUseScopeIDCustomText',
		'SEGPropagateTextToScopeIDParentCause',
		'SEGPropagateTextToScopeIDParentImpact',
		'SEGPropagateTextToScopeIDParentFirst',
		'SEGPropagateTextToScopeIDParentLast',
		'SEGUseScopeIDSitesAffected',
		'SEGScopeIDSitesAffectedLabel',
		'SEGUseScopeIDNumActiveAlarms',
		'SEGJournalUID',
		'SEGJournalToScopeIDParent',
		'SEGJournalMaxEventsPerEntry',
		'SEGJournalServerNameServerSerial',
		'SEGJournalNode',
		'SEGJournalSummary',
		'SEGJournalAlertKey',
		'SEGJournalCustomText',
		'SEGMaxScopeIDJournals',
		'SEGScopeIDSummaryActiveFirst')
	begin

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE TTNumber TO CHILD EVENTS
		if (property.Name = 'SEGPropagateTTNumber') then

			set propagatettnumber = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE Acknowledged STATUS TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateAcknowledged') then

			set propagateacknowledged = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE OwnerUID TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateOwnerUID') then

			set propagateowneruid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE OwnerGID TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateOwnerGID') then

			set propagateownergid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO USE THE ScopeID PREFIX IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDPrefix') then

			set usescopeidprefix = property.IntValue;

		-- SPECIFIES THE ScopeID PREFIX TO USE IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGScopeIDPrefix') then

			set scopeidprefix = property.CharValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE ScopeID LABEL IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDLabel') then

			set usescopeidlabel = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE IMPACT AND CAUSE INFO IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDImpactCause') then

			set usescopeidimpactcause = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE CUSTOM TEXT IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDCustomText') then

			set usescopeidcustomtext = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST CauseWeight
		elseif (property.Name = 'SEGPropagateTextToScopeIDParentCause') then

			set propagatetexttoscopeidparentcause = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST ImpactWeight
		elseif (property.Name = 'SEGPropagateTextToScopeIDParentImpact') then

			set propagatetexttoscopeidparentimpact = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE LOWEST FirstOccurrence
		elseif (property.Name = 'SEGPropagateTextToScopeIDParentFirst') then

			set propagatetexttoscopeidparentfirst = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST LastOccurrence
		elseif (property.Name = 'SEGPropagateTextToScopeIDParentLast') then

			set propagatetexttoscopeidparentlast = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE NUMBER OF AFFECTED SITES IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDSitesAffected') then

			set usescopeidsitesaffected = property.IntValue;

		-- SPECIFIES THE LABEL TO USE WHEN REFERRING TO THE NUMBER OF SUB-GROUPS AFFECTED IN THE ScopeIDParent SUMMARY FIELD
		elseif (property.Name = 'SEGScopeIDSitesAffectedLabel') then

			set scopeidsitesaffectedlabel = property.CharValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE NUMBER OF ACTIVE ALARMS IN THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseScopeIDNumActiveAlarms') then

			set usescopeidnumactivealarms = property.IntValue;

		-- SPECIFIES THE UID TO USE WHEN INSERTING JOURNALS INTO SYNTHETIC PARENT EVENTS - DEFAULT IS ROOT
--		elseif (property.Name = 'SEGJournalUID') then
--
--			set journaluid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGJournalToScopeIDParent') then

			set journaltoscopeidparent = property.IntValue;

		-- SPECIFIES HOW MANY EVENTS TO ROLL UP INTO A SINGLE JOURNAL ENTRY
		elseif (property.Name = 'SEGJournalMaxEventsPerEntry') then

			set journalmaxeventsperentry = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE ServerName:ServerSerial FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalServerNameServerSerial') then

			set journalservernameserverserial = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Node FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalNode') then

			set journalnode = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Summary FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalSummary') then

			set journalsummary = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE AlertKey FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalAlertKey') then

			set journalalertkey = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE CustomText FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalCustomText') then

			set journalcustomtext = property.IntValue;

		-- SPECIFIES MAXIMUM NUMBER OF EVENTS TO SEND TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGMaxScopeIDJournals') then

			set maxscopeidjournals = property.IntValue;

		-- SPECIFIES WHETHER OR NOT THE NUMBER OF ACTIVE ALARMS IS TOWARDS THE FRONT OF THE SUMMARY
		elseif (property.Name = 'SEGScopeIDSummaryActiveFirst') then

			set scopeidsummaryactivefirst = property.IntValue;
		end if;
	end;

	-- IN CASE MULTIPLE CustomText PROPAGATION OPTIONS ARE INADVERTENTLY SELECTED,
	-- ENFORCE AN ORDER OF PRECEDENCE TO ENSURE UNDEFINED RESULTS ARE AVOIDED
	--
	-- ORDER OF PRECEDENCE IS:
	-- 1 PROPAGATE CustomText OF HIGHEST CauseWeight
	-- 2 PROPAGATE CustomText OF HIGHEST ImpactWeight
	-- 3 PROPAGATE CustomText OF LOWEST FirstOccurrence
	-- 4 PROPAGATE CustomText OF HIGHEST LastOccurrence
	--
	if (propagatetexttoscopeidparentcause = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttoscopeidparentimpact = 0;
		set propagatetexttoscopeidparentfirst = 0;
		set propagatetexttoscopeidparentlast = 0;

	elseif (propagatetexttoscopeidparentimpact = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttoscopeidparentfirst = 0;
		set propagatetexttoscopeidparentlast = 0;

	elseif (propagatetexttoscopeidparentfirst = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttoscopeidparentlast = 0;

	end if;

	-- UPDATE EACH ScopeIDParent EVENT
	for each row scopeid in alerts.status where scopeid.AlertGroup in ('ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent')
	begin

		-- RESET LOCAL VARIABLES
		-- alarmcounter: USED TO COUNT UP NUMBER OF AFFECTED SITES
		-- alarmcounter2: USED TO COUNT UP NUMBER OF SITE EVENT CHILDREN
		-- alarmcounter3: USED TO COUNT UP NUMBER OF EVENTS DIRECTLY UNDER ScopeIDParent
		set highcauseweight = 0;
		set highcausetext = 'UNKNOWN';
		set highimpactweight = 0;
		set highimpacttext  = 'UNKNOWN';
		set highseverity = 0;
		set lowfirstoccurrence = 0;
		set highlastoccurrence = 0;
		set customtext = '';
		set alarmcounter  = 0;
		set alarmcounter2  = 0;
		set alarmcounter3  = 0;
		set summary = '';
		set thisjournalentry = '';
		set scopeidparentjournalentry = '';
		set journalcounter = 0;
		set journaloffset = 0;

		-- EXAMINE EACH CHILD OF THE CURRENT ScopeIDParent EVENT
		for each row child in alerts.status where child.ParentIdentifier = scopeid.Identifier
		begin

			-- ONLY CONSIDER NON-CLEARED CHILD EVENTS
			if (child.Severity > 0) then

				-- INCLUDE CURRENT CHILD EVENT IN COUNTS
				-- PROCESS SiteNameParent EVENTS
				if (child.AlertGroup in ('SiteNameParent', 'ScopeIDParent')) then

					-- EXCLUDE SiteNameParent EVENTS THAT HAVE NO SiteName
					if (child.AlertGroup = 'SiteNameParent' and child.SiteName != 'NO SITENAME') then

						-- INCREMENT NUMBER OF AFFECTED SITES
						set alarmcounter = alarmcounter + 1;
					end if;

					-- ADD TO EVENT COUNTER THE NUMBER OF UNDERLYING EVENTS
					set alarmcounter2 = alarmcounter2 + child.Grade;

					-- FETCH STORED PRIORITY CHILD INFORMATION
					for each row parentrec in master.correlation_priority_children where parentrec.Identifier = child.Identifier
					begin

						-- STORE THE HIGHEST CauseWeight OF THE CHILDREN EVENTS
						-- AND ITS ASSOCIATED NormalisedAlarmName
						if (child.CauseWeight > highcauseweight) then
	
							set highcauseweight = child.CauseWeight;
							set highcausetext = parentrec.HighCauseText;

							-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM HIGHEST
							-- CauseWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
							if (propagatetexttoscopeidparentcause = 1) then

								set customtext = child.CustomText;
							end if;
						end if;

						-- STORE THE HIGHEST ImpactWeight OF THE CHILDREN EVENTS
						-- AND ITS ASSOCIATED NormalisedAlarmName
						if (child.ImpactWeight > highimpactweight) then
	
							set highimpactweight = child.ImpactWeight;
							set highimpacttext = parentrec.HighImpactText;

							-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM HIGHEST
							-- ImpactWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
							if (propagatetexttoscopeidparentimpact = 1) then

								set customtext = child.CustomText;
							end if;
						end if;
					end;

				-- ELSE EVENT IS A REAL EVENT AND NOT A SYNTHETIC ONE
				else

					-- STORE THE HIGHEST CauseWeight OF THE CHILDREN EVENTS
					-- AND ITS ASSOCIATED NormalisedAlarmName
					if (child.CauseWeight > highcauseweight) then
	
						set highcauseweight = child.CauseWeight;
						set highcausetext = child.NormalisedAlarmName;

						-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM HIGHEST
						-- CauseWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
						if (propagatetexttoscopeidparentcause = 1) then

							set customtext = child.CustomText;
						end if;
					end if;

					-- STORE THE HIGHEST ImpactWeight OF THE CHILDREN EVENTS
					-- AND ITS ASSOCIATED NormalisedAlarmName
					if (child.ImpactWeight > highimpactweight) then
	
						set highimpactweight = child.ImpactWeight;
						set highimpacttext = child.NormalisedAlarmName;

						-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM HIGHEST
						-- ImpactWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
						if (propagatetexttoscopeidparentimpact = 1) then

							set customtext = child.CustomText;
						end if;
					end if;

					-- INCREMENT EVENT COUNTER
					set alarmcounter3 = alarmcounter3 + 1;
				end if;

				-- STORE THE HIGHEST Severity OF THE CHILDREN EVENTS
				if (highseverity < child.Severity) then

					set highseverity = child.Severity;
				end if;

				-- STORE THE LOWEST NON-ZERO FirstOccurrence OF THE CHILDREN EVENTS
				if (lowfirstoccurrence > child.FirstOccurrence or lowfirstoccurrence = 0) then

					set lowfirstoccurrence = child.FirstOccurrence;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM LOWEST
					-- FirstOccurrence CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttoscopeidparentfirst = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- STORE THE HIGHEST LastOccurrence OF THE CHILDREN EVENTS
				if (highlastoccurrence < child.LastOccurrence) then

					set highlastoccurrence = child.LastOccurrence;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO ScopeIDParent EVENT FROM HIGHEST
					-- LastOccurrence CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttoscopeidparentlast = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- PROPAGATE THE TICKET NUMBER FROM THE ScopeIDParent EVENT TO
				-- THE CURRENT CHILD IF THE CURRENT CHILD IS UNTICKETED,
				-- UNSUPPRESSED AND THE OPTION TO PROPAGATE TICKET NUMBER IS ENABLED
				if (scopeid.TTNumber != '' and child.TTNumber = '' and
					child.SuppressEscl != 4 and propagatettnumber = 1) then

					set child.TTNumber = scopeid.TTNumber;
				end if;

				-- PROPAGATE THE ACKNOWLEDGED STATUS FROM THE ScopeIDParent EVENT TO
				-- THE CURRENT CHILD IF THE CURRENT CHILD IS UNACKNOWLEDGED AND THE
				-- OPTION TO PROPAGATE ACKNOWLEDGED STATUS IS ENABLED
				if (scopeid.Acknowledged = 1 and child.Acknowledged != 1
					and propagateacknowledged = 1) then

					set child.Acknowledged = scopeid.Acknowledged;
				end if;

				-- PROPAGATE THE OwnerUID FROM THE ScopeIDParent EVENT TO THE
				-- CURRENT CHILD EVENT IF THE OWNER OF THE ScopeIDParent EVENT
				-- IS DIFFERENT TO THAT OF THE CHILD EVENT AND THE
				-- OPTION TO PROPAGATE OwnerUID IS ENABLED
				-- A VALUE OF 2 WILL ONLY PROPAGATE OWNERSHIP IF IT IS OWNED BY
				-- UID = Nobody 65534
				if (scopeid.OwnerUID != child.OwnerUID and (
					 propagateowneruid = 1 or
					(propagateowneruid = 2 and child.OwnerUID = 65534))) then

					set child.OwnerUID = scopeid.OwnerUID;
				end if;

				-- PROPAGATE THE OwnerGID FROM THE ScopeIDParent EVENT TO THE
				-- CURRENT CHILD EVENT IF THE GROUP OF THE ScopeIDParent EVENT
				-- IS DIFFERENT TO THAT OF THE CHILD EVENT AND THE
				-- OPTION TO PROPAGATE OwnerGID IS ENABLED
				-- A VALUE OF 2 WILL ONLY PROPAGATE OWNERSHIP IF IT IS OWNED BY
				-- GID = Public 0
				if (scopeid.OwnerGID != child.OwnerGID and (
					 propagateownergid = 1 or
					(propagateownergid = 2 and child.OwnerGID = 0))) then

					set child.OwnerGID = scopeid.OwnerGID;
				end if;

				-- CLEAR thisjournalentry VARIABLE
				set thisjournalentry = '';

				-- CONSTRUCT A JOURNAL ENTRY FOR CURRENT EVENT IF
				-- - THE CURRENT EVENT HAS NOT ALREADY BEEN JOURNALED
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO ScopeIDParent IS ENABLED
				-- - IF THE MAXIMUM NUMBER OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
				-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS ScopeIDParent HAS NOT BEEN EXCEEDED
				-- - THE CURRENT EVENT IS NOT A SiteNameParent EVENT
				-- - THE CURRENT EVENT IS NOT A ScopeIDParent EVENT
				-- - THE CURRENT EVENT IS NOT A ASMParent EVENT
				-- - THE CURRENT EVENT IS NOT A CustomParent EVENT
				if (child.JournalSent = 0 and journaltoscopeidparent = 1 and
					journalcounter < journalmaxeventsperentry and
					(scopeid.Poll + journalcounter) < maxscopeidjournals and
					child.AlertGroup != 'SiteNameParent' and
					child.AlertGroup != 'ScopeIDParent' and
					child.AlertGroup != 'ASMParent' and
					child.AlertGroup != 'CustomParent') then

					-- CHECK WHETHER OR NOT TO INCLUDE THE ServerName:ServerSerial IN THIS JOURNAL ENTRY
					if (journalservernameserverserial = 1) then

						set thisjournalentry = thisjournalentry + child.ServerName +
							':' + to_char(child.ServerSerial);
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE Node IN THIS JOURNAL ENTRY
					if (journalnode = 1 and child.Node != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.Node;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE Summary IN THIS JOURNAL ENTRY
					if (journalsummary = 1 and child.Summary != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.Summary;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE AlertKey IN THIS JOURNAL ENTRY
					if (journalalertkey = 1 and child.AlertKey != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.AlertKey;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE CustomText IN THIS JOURNAL ENTRY
					if (journalcustomtext = 1 and child.CustomText != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.CustomText;
					end if;
				end if;

				-- ADD CURRENT EVENT TO ScopeIDParent JOURNAL ENTRY IF:
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO ScopeIDParent IS ENABLED
				-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS ScopeIDParent HAS NOT BEEN EXCEEDED
				-- - THE CURRENT JOURNAL ENTRY IS NOT NULL
				-- - THE CURRENT EVENT IS NOT A SiteNameParent EVENT
				-- - THE CURRENT EVENT IS NOT A ScopeIDParent EVENT
				-- - THE CURRENT EVENT IS NOT AN ASMParent EVENT
				-- - THE CURRENT EVENT IS NOT A CustomParent EVENT
				if (journaltoscopeidparent = 1 and
					(scopeid.Poll + journalcounter) < maxscopeidjournals and
					thisjournalentry != '' and
					child.AlertGroup != 'SiteNameParent' and
					child.AlertGroup != 'ScopeIDParent' and
					child.AlertGroup != 'ASMParent' and
					child.AlertGroup != 'CustomParent') then

					-- APPEND A NEW LINE CHARACTER IF THERE IS ALREADY TEXT TO ADD
					if (scopeidparentjournalentry != '') then
						set scopeidparentjournalentry = scopeidparentjournalentry + '\n';
					end if;

					-- ADD THE CURRENT JOURNAL ENTRY TO THE EXISTING
					set scopeidparentjournalentry = scopeidparentjournalentry + thisjournalentry;

					-- INCREMENT THE NUMBER OF JOURNALS BEING SENT
					set journalcounter = journalcounter + 1;

					-- MARK CHILD EVENT AS HAVING BEEN JOURNALLED
					set child.JournalSent = 1;
 				end if;

				-- ADD A JOURNAL ENTRY TO THE CURRENT ScopeIDParent NOW IF MAX EVENTS PER ENTRY IS REACHED
				if (journalcounter = journalmaxeventsperentry) then

					EXECUTE jinsert(scopeid.Serial, 1000000 + journaloffset, getdate, 'CHILD EVENTS:\n' + scopeidparentjournalentry);

					-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
					set scopeid.Poll = scopeid.Poll + journalcounter;

					-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS ScopeIDParent
					-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
					if (scopeid.Poll = maxscopeidjournals) then

						EXECUTE jinsert(scopeid.Serial, 1000000 + journaloffset, getdate + 1,
							'*** MAXIMUM OF ' + to_char(maxscopeidjournals) +
							' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
					end if;

					-- INCREMENT THE JOURNAL UID OFFSET
					set journaloffset = journaloffset + 1;

					-- RESET SOME VARIABLES
					set scopeidparentjournalentry = '';
					set journalcounter = 0;
				end if;
			end if;
		end;

		-- UPDATE THE NUMBER OF ACTIVE CHILD EVENTS IN THE GRADE FIELD, IF NOT ZERO
		if ((alarmcounter2 != 0 or alarmcounter3 != 0) and scopeid.Grade != alarmcounter2 + alarmcounter3) then

			set scopeid.Grade = alarmcounter2 + alarmcounter3;

		-- ELSE UPDATE THE GRADE FIELD TO ZERO, IF IT IS NOT ALREADY
		elseif (alarmcounter2 = 0 and alarmcounter3 = 0 and scopeid.Grade != 0) then

			set scopeid.Grade = 0;
		end if;

		-- BEGIN THE CONSTRUCTION OF THE ScopeIDParent Summary FIELD

		-- SPECIFY WHETHER TO INCLUDE THE ScopeIDParent PREFIX
		if (usescopeidprefix = 1) then

			set summary = scopeidprefix;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE NUMBER OF ACTIVE ALARMS AT THE BEGINNING OF THE SUMMARY
		if (scopeidsummaryactivefirst = 1) then

			-- APPEND A SPACE CHARACTER IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ': ';
			end if;

			-- APPEND TOTAL NUMBER OF UNDERLYING REAL EVENTS
			if ((alarmcounter2 + alarmcounter3) = 1) then
				set summary = summary + '(' +
					to_char(alarmcounter2 + alarmcounter3) + ' active alarm)';
			else
				set summary = summary + '(' +
					to_char(alarmcounter2 + alarmcounter3) + ' active alarms)';
			end if;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE ScopeID LABEL
		if (usescopeidlabel = 1) then

			-- APPEND A COLON IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ': ';
			end if;

			set summary = summary + scopeid.ScopeID;
		end if;

		-- UPDATE PRIORITY CHILD DATA FOR THIS PARENT EVENT
		EXECUTE correlation_update_priority_child (scopeid.Identifier,
			propagatetexttoscopeidparentcause, highcauseweight, highcausetext,
			propagatetexttoscopeidparentimpact, highimpactweight, highimpacttext,
			propagatetexttoscopeidparentfirst, lowfirstoccurrence,
			propagatetexttoscopeidparentlast, highlastoccurrence,
			customtext);

		-- APPEND IMPACT CAUSE TEXT TO SUMMARY IF CONFIGURED
		if (usescopeidimpactcause = 1) then

			EXECUTE correlation_construct_impactcause (scopeid.Identifier, summary);
		end if;

		-- FETCH AND SET THE PRIORITY CHILD CauseWeight AND ImpactWeight VALUES
		if (	scopeid.Severity != 0 and
			(propagatetexttoscopeidparentcause = 1 or
			 propagatetexttoscopeidparentimpact = 1 or
			 propagatetexttoscopeidparentfirst = 1 or
			 propagatetexttoscopeidparentlast = 1 or
			 usescopeidimpactcause = 1)) then

			for each row parentrec in master.correlation_priority_children where parentrec.Identifier = scopeid.Identifier
			begin

				-- PROPAGATE PRIORITY CauseWeight TO PARENT IF IT HAS CHANGED
				if (scopeid.CauseWeight != parentrec.HighCauseWeight) then

					set scopeid.CauseWeight = parentrec.HighCauseWeight;
				end if;

				-- PROPAGATE PRIORITY ImpactWeight TO PARENT IF IT HAS CHANGED
				if (scopeid.ImpactWeight != parentrec.HighImpactWeight) then

					set scopeid.ImpactWeight = parentrec.HighImpactWeight;
				end if;
			end;
		end if;

		-- FETCH AND SET THE CURRENT PRIORITY CustomText IF ANY OF THE PROPAGATION OPTIONS ARE SELECTED
		if (	scopeid.Severity != 0 and
			(propagatetexttoscopeidparentcause = 1 or
			 propagatetexttoscopeidparentimpact = 1 or
			 propagatetexttoscopeidparentfirst = 1 or
			 propagatetexttoscopeidparentlast = 1)) then

			for each row parentrec in master.correlation_priority_children where parentrec.Identifier = scopeid.Identifier
			begin

				-- PROPAGATE PRIORITY CustomText TO PARENT IF IT HAS CHANGED
				if (scopeid.CustomText != parentrec.CustomText) then

					set scopeid.CustomText = parentrec.CustomText;
				end if;
			end;

			-- SPECIFY WHETHER TO INCLUDE THE CUSTOM SUMMARY TEXT CustomText
			if (usescopeidcustomtext = 1) then

				-- APPEND A COLON IF summary NOT BLANK
				if (summary != '') then
					set summary = summary + ': ';
				end if;

				-- APPEND CustomText
				set summary = summary + scopeid.CustomText;
			end if;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE NUMBER OF SITES AFFECTED
		-- DO NOT INCLUDE IF NO SITES ARE AFFECTED
		if (usescopeidsitesaffected = 1 and alarmcounter != 0) then

			-- APPEND A COLON IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ': ';
			end if;

			-- APPEND NUMBER OF SITES AFFECTED
			set summary = summary + to_char(alarmcounter) + ' ' + scopeidsitesaffectedlabel;

			if (alarmcounter = 1) then
				set summary = summary + ' affected';
			else
				set summary = summary + 's affected';
			end if;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE NUMBER OF ACTIVE ALARMS AT THE END OF THE SUMMARY
		if (usescopeidnumactivealarms = 1) then

			-- APPEND A SPACE CHARACTER IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ' ';
			end if;

			-- APPEND TOTAL NUMBER OF UNDERLYING REAL EVENTS
			if ((alarmcounter2 + alarmcounter3) = 1) then
				set summary = summary + '(' +
					to_char(alarmcounter2 + alarmcounter3) + ' active alarm)';
			else
				set summary = summary + '(' +
					to_char(alarmcounter2 + alarmcounter3) + ' active alarms)';
			end if;
		end if;

		-- UPDATE Synthetic Event - Parent EVENT IF NOT CLEAR - OR IF ANY OF THE COUNTERS ARE NOT ZERO
		if (scopeid.AlertGroup in ('Synthetic Event - Parent', 'ASMParent', 'CustomParent') and
			(scopeid.Severity != 0 or alarmcounter != 0 or alarmcounter2 != 0 or alarmcounter3 != 0)) then

			-- SET THE Severity TO INDETERMINITE IF UNDERLYING EVENTS ARE CLEARED
			-- THIS WILL EVENTUALLY BE CLEARED WHEN TIME WINDOW CLOSES
			if (highseverity = 0 and scopeid.Severity != 1) then

				set scopeid.Severity = 1;

			-- ELSE SET THE Severity TO THAT OF THE HIGHEST UNDERLYING EVENT
			elseif (scopeid.Severity != highseverity) then

				set scopeid.Severity = highseverity;
			end if;
		end if;

		-- UPDATE ScopeIDParent EVENT IF NOT CLEAR
		-- OR IF THE SUMMARY HAS CHANGED
		if (scopeid.AlertGroup = 'ScopeIDParent' and (scopeid.Severity != 0 or scopeid.Summary != summary)) then

			-- UPDATE Summary FIELD ONLY IF IT HAS CHANGED
			if (scopeid.Summary != summary) then

				set scopeid.Summary = summary;
			end if;

			-- SET THE Severity TO INDETERMINITE IF UNDERLYING EVENTS ARE CLEARED
			-- THIS WILL EVENTUALLY BE CLEARED WHEN TIME WINDOW CLOSES
			if (highseverity = 0 and scopeid.Severity != 1) then

				set scopeid.Severity = 1;

			-- ELSE SET THE Severity TO THAT OF THE HIGHEST UNDERLYING EVENT
			elseif (highseverity != 0 and scopeid.Severity != highseverity) then

				set scopeid.Severity = highseverity;
			end if;

			-- UPDATE FirstOccurrence BASED ON UNDERLYING EVENTS, IF NOT NULL
			if (lowfirstoccurrence != 0 and scopeid.FirstOccurrence != lowfirstoccurrence) then

				set scopeid.FirstOccurrence = lowfirstoccurrence;
			end if;

			-- UPDATE LastOccurrence BASED ON UNDERLYING EVENTS, IF NOT NULL
			if (highlastoccurrence != 0 and scopeid.LastOccurrence != highlastoccurrence) then

				set scopeid.LastOccurrence = highlastoccurrence;
			end if;
		end if;

		-- ADD A JOURNAL ENTRY TO THE CURRENT ScopeIDParent IF APPLICABLE
		if (journaltoscopeidparent = 1 and scopeidparentjournalentry != '') then

			EXECUTE jinsert(scopeid.Serial, 1000000 + journaloffset, getdate, 'CHILD EVENTS:\n' + scopeidparentjournalentry);

			-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
			set scopeid.Poll = scopeid.Poll + journalcounter;

			-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS ScopeIDParent
			-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
			if (scopeid.Poll = maxscopeidjournals) then

				EXECUTE jinsert(scopeid.Serial, 1000000 + journaloffset, getdate + 1,
					'*** MAXIMUM OF ' + to_char(maxscopeidjournals) +
					' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
			end if;
		end if;
	end;

end;
go

create or replace procedure resolve_itm_action (in itmactiontype char(15), out acceptchanges int)
declare sit_resurface_def_action character(10); sit_ack_expired_def_action character(10);sit_ack_expired_def_timeout character(10);situpdate_file character(20);debug_itmsync integer
begin


	execute get_config_parms(sit_ack_expired_def_action,sit_ack_expired_def_timeout,sit_resurface_def_action,situpdate_file); 
	execute get_debug_itmsync(debug_itmsync);
	if (itmactiontype = 'resurface')
	then
		if (sit_resurface_def_action = 'ACCEPT')
		then
			set acceptchanges = 1;
		else
			set acceptchanges = 0;
		end if;
	elseif (itmactiontype = 'ackexpired')
	then
		if (sit_ack_expired_def_action = 'REJECT')
		then
			set acceptchanges = 0;
		else
			set acceptchanges = 1;
		end if;
	end if;


end;
go

create or replace procedure automation_enable ()
begin



	-- Enable the automations that should be 
	-- running when it is a primary ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'primary_only'
	begin
		alter trigger group tg.GroupName set enabled true;
	end;


end;
go

create or replace procedure automation_disable ()
begin



	-- Disable the automations that should not be 
	-- running when it is a backup ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'primary_only'
	begin
		alter trigger group tg.GroupName set enabled false;
	end;


end;
go

create or replace procedure correlation_update_priority_child (in identifier char(255), in propagatetexttoparentcause int, in highcauseweight int, in highcausetext char(255), in propagatetexttoparentimpact int, in highimpactweight int, in highimpacttext char(255), in propagatetexttoparentfirst int, in lowfirstoccurrence int, in propagatetexttoparentlast int, in highlastoccurrence int, in customtext char(4096))
declare found INTEGER;
	customweighttouse INTEGER;
	customtimestamptouse TIME;
begin

--
-- Procedure updates priority child event data or inserts a new record if none found.
--
-- Called by: correlation_process_sitenameparents, correlation_process_scopeidparents
--
-- Usage:  EXECUTE correlation_update_priority_child (site.Identifier,
--					propagatetexttositenameparentcause, highcauseweight, highcausetext,
--					propagatetexttositenameparentimpact, highimpactweight, highimpacttext,
--					propagatetexttositenameparentfirst, lowfirstoccurrence,
--					propagatetexttositenameparentlast, highlastoccurrence,
--					customtext);
--

	-- INITIALISE VARIABLES
	set found = 0;
	set customweighttouse = 0;
	set customtimestamptouse = 0;

	-- LOOK FOR EXISTING RECORD
	-- STORE HIGHEST ImpactWeight AND HIGHEST CauseWeight
	-- STORE CustomText AND APPROPRIATE ASSOCIATED METRIC
	for each row parentrec in master.correlation_priority_children where parentrec.Identifier = identifier
	begin

		-- MARK RECORD AS FOUND
		set found = 1;

		-- UPDATE HIGHEST STORED CauseWeight IF NEW HIGHER VALUE FOUND
		if (highcauseweight > parentrec.HighCauseWeight) then

			set parentrec.HighCauseWeight = highcauseweight;
			set parentrec.HighCauseText = highcausetext;
		end if;

		-- UPDATE HIGHEST STORED ImpactWeight IF NEW HIGHER VALUE FOUND
		if (highimpactweight > parentrec.HighImpactWeight) then

			set parentrec.HighImpactWeight = highimpactweight;
			set parentrec.HighImpactText = highimpacttext;
		end if;

		-- ASSESS IF THE PRIORITY CustomText SHOULD BE UPDATED
		-- CONSIDER THE HIGH CAUSE WEIGHT
		if (propagatetexttoparentcause = 1) then

			if (highcauseweight > parentrec.CustomWeight) then

				-- UPDATE WITH THE CURRENT HIGH EVENT
				set parentrec.CustomText = customtext;
				set parentrec.CustomWeight = highcauseweight;
			end if;

		-- CONSIDER THE HIGH IMPACT WEIGHT
		elseif (propagatetexttoparentimpact = 1) then

			if (highimpactweight > parentrec.CustomWeight) then

				-- UPDATE WITH THE CURRENT HIGH EVENT
				set parentrec.CustomText = customtext;
				set parentrec.CustomWeight = highimpactweight;
			end if;

		-- CONSIDER THE FIRST FirstOccurrence
		elseif (propagatetexttoparentfirst = 1 and lowfirstoccurrence != 0) then

			if (lowfirstoccurrence < parentrec.CustomTimestamp or parentrec.CustomTimestamp = 0) then

				-- UPDATE WITH THE CURRENT HIGH EVENT
				set parentrec.CustomText = customtext;
				set parentrec.CustomTimestamp = lowfirstoccurrence;
			end if;

		-- CONSIDER THE LAST LastOccurrence
		elseif (propagatetexttoparentlast = 1) then

			if (highlastoccurrence > parentrec.CustomTimestamp or parentrec.CustomTimestamp = 0) then

				-- UPDATE WITH THE CURRENT HIGH EVENT
				set parentrec.CustomText = customtext;
				set parentrec.CustomTimestamp = highlastoccurrence;
			end if;
		end if;
	end;

	-- INSERT NEW RECORD IF IT IS NOT FOUND
	if (found = 0) then

		-- ASSESS WHAT THE PRIORITY CustomText SHOULD BE
		-- CONSIDER THE HIGH CAUSE WEIGHT
		if (propagatetexttoparentcause = 1) then

			-- UPDATE WITH THE CURRENT HIGH EVENT
			set customweighttouse = highcauseweight;

		-- CONSIDER THE HIGH IMPACT WEIGHT
		elseif (propagatetexttoparentimpact = 1) then

			-- UPDATE WITH THE CURRENT HIGH EVENT
			set customweighttouse = highimpactweight;

		-- CONSIDER THE FIRST FirstOccurrence
		elseif (propagatetexttoparentfirst = 1 and lowfirstoccurrence != 0) then

			set customtimestamptouse = lowfirstoccurrence;

		-- CONSIDER THE LAST LastOccurrence
		elseif (propagatetexttoparentlast = 1) then

			-- UPDATE WITH THE CURRENT HIGH EVENT
			set customtimestamptouse = highlastoccurrence;
		end if;

		-- CREATE PRIORITY CHILD RECORD FOR PARENT EVENT
		insert into master.correlation_priority_children (
			Identifier,
			HighImpactWeight,
			HighImpactText,
			HighCauseWeight,
			HighCauseText,
			CustomText,
			CustomWeight,
			CustomTimestamp)
		values (
			identifier,
			highimpactweight,
			highimpacttext,
			highcauseweight,
			highcausetext,
			customtext,
			customweighttouse,
			customtimestamptouse);
	end if;

end;
go

create or replace procedure sm_log (in summary_string char(255))
begin


    -- WRITE A RECORD TO THE LOG FILE
    write into self_monitoring values (to_char(getdate), ': ', summary_string);


end;
go

create or replace procedure correlation_process_sitenameparents ()
declare propagatettnumber INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE TTNumber TO CHILD EVENTS
	propagateacknowledged INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE Acknowledged TO CHILD EVENTS
	propagateowneruid INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE OwnerUID TO CHILD EVENTS
	propagateownergid INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO PROPAGATE OwnerGID TO CHILD EVENTS

	usesitenameprefix INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE ScopeID PREFIX IN THE SUMMARY
	sitenameprefix CHAR(255);			-- PROPERTY FOR THE ScopeID PREFIX
	usesitenamelabel INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE ScopeID IN THE SUMMARY
	usesitenameimpactcause INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE IMPACT CAUSE TEXT IN THE SUMMARY
	usesitenamecustomtext INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO USE THE CustomText IN THE SUMMARY
	propagatetexttositenameparentcause INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON CauseWeight
	propagatetexttositenameparentimpact INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON ImpactWeight
	propagatetexttositenameparentfirst INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON FirstOccurrence
	propagatetexttositenameparentlast INTEGER;	-- PROPERTY FOR PROPAGATION OF PRIORITY CHILD DATA BASED ON LastOccurrence
	customtext CHAR(4096);				-- VARIABLE TO STORE CustomText FROM PRIORITY CHILD
	usesitenamenumactivealarms INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO SHOW NUMBER OF SITES AFFECTED IN THE SUMMARY

	highcauseweight INTEGER;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST CauseWeight
	highcausetext CHAR(255);			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST CauseWeight CustomText
	highimpactweight INTEGER;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST ImpactWeight
	highimpacttext CHAR(255);			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST ImpactWeight CustomText
	highseverity INTEGER;				-- VARIABLE USED TO STORE CHILD EVENT HIGHEST Severity
	lowfirstoccurrence TIME;			-- VARIABLE USED TO STORE CHILD EVENT LOWEST FirstOccurrence
	highlastoccurrence TIME;			-- VARIABLE USED TO STORE CHILD EVENT HIGHEST LastOccurrence
	alarmcounter INTEGER;				-- VARIABLE USED TO TALLY UP THE NUMBER OF SUB-GROUPS
	summary CHAR(255);				-- VARIABLE USED TO CONSTRUCT THE Summary FIELD FOR EACH ScopeIDParent EVENT

	journaltoscopeidparent INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO JOURNAL TO ScopeIDParent EVENTS
	scopeidserial INTEGER;				-- VARIABLE USED TO STORE THE Serial OF THE CURRENT ScopeIDParent EVENT
	scopeidparentidentifier CHAR(255);		-- VARIABLE USED TO STORE THE Identifier OF THE CURRENT ScopeIDParent EVENT
	scopeidjournalcount INTEGER;			-- VARIABLE USED TO STORE THE COUNT OF EVENTS THAT HAVE BEEN JOURNALLED TO THE CURRENT ScopeIDParent EVENT

	journaltositenameparent INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO JOURNAL TO ScopeIDParent EVENTS
	journalmaxeventsperentry INTEGER;		-- PROPERTY FOR WHAT THE MAXIMUM NUMBER OF EVENTS IS PER JOURNAL ENTRY
	journalservernameserverserial INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD ServerName AND ServerSerial IN JOURNAL ENTRIES
	journalnode INTEGER;				-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD Node IN JOURNAL ENTRIES
	journalsummary INTEGER;				-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD Summary IN JOURNAL ENTRIES
	journalalertkey INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD AlertKey IN JOURNAL ENTRIES
	journalcustomtext INTEGER;			-- PROPERTY FOR WHETHER OR NOT TO INCLUDE CHILD CustomText IN JOURNAL ENTRIES
	maxsitenamejournals INTEGER;			-- PROPERTY FOR THE MAXIMUM ALLOWABLE NUMBER OF CHILD EVENTS TO JOURNAL TO ScopeIDParent
	maxscopeidjournals INTEGER;			-- PROPERTY FOR THE MAXIMUM ALLOWABLE NUMBER OF CHILD EVENTS TO JOURNAL TO ScopeIDParent

	thisjournalentry CHAR(4080);			-- VARIABLE USED TO CONSTRUCT THE JOURNAL ENTRY FOR THE CURRENT EVENT
	sitenameparentjournalentry CHAR(4080);		-- VARIABLE USED TO STORE THE CUMULATIVE CHILD ENTRIES FOR EACH SiteNameParent JOURNAL ENTRY
	scopeidparentjournalentry CHAR(4080);		-- VARIABLE USED TO STORE THE CUMULATIVE CHILD ENTRIES FOR EACH ScopeIDParent JOURNAL ENTRY
	sitenamejournalcounter INTEGER;			-- VARIABLE USED TO COUNT THE NUMBER OF CHILD ENTRIES THAT HAVE BEEN ADDED TO THE CURRENT SiteNameParent JOURNAL ENTRY
	scopeidjournalcounter INTEGER;			-- VARIABLE USED TO COUNT THE NUMBER OF CHILD ENTRIES THAT HAVE BEEN ADDED TO THE CURRENT ScopeIDParent JOURNAL ENTRY
	sitenamejournaloffset INTEGER;			-- VARIABLE USED TO STORE THE CURRENT UID OFFSET TO USE WHEN WRITING SiteNameParent JOURNALS
	scopeidjournaloffset INTEGER;			-- VARIABLE USED TO STORE THE CURRENT UID OFFSET TO USE WHEN WRITING ScopeIDParent JOURNALS

	sitenamesummaryactivefirst INTEGER;		-- PROPERTY FOR WHETHER OR NOT TO SHOW NUMBER OF ACTIVE ALARMS AT BEGINNING OF SUMMARY
	prioritytext CHAR(255);				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT CustomText DATA
	prioritytimestamp TIME;				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT TIMESTAMP DATA
	priorityweight INTEGER;				-- VARIABLE USED TO STORE PRIORITY CHILD EVENT WEIGHTING DATA
begin

--
-- Procedure updates SiteNameParent events.
-- This procedures uses properties stored in master.properties to drive its behaviour.
--
-- Called by: correlation_process_existing_parents
--
-- Usage:  EXECUTE correlation_process_sitenameparents ( );
--

	-- INITIALISE LOCAL VARIABLES
	set propagatettnumber = 1;
	set propagateacknowledged = 1;
	set propagateowneruid = 1;
	set propagateownergid = 1;

	set usesitenameprefix = 0;
	set sitenameprefix = '';
	set usesitenamelabel = 1;
	set usesitenameimpactcause = 1;
	set usesitenamecustomtext = 0;
	set propagatetexttositenameparentcause = 0;
	set propagatetexttositenameparentimpact = 0;
	set propagatetexttositenameparentfirst = 0;
	set propagatetexttositenameparentlast = 0;
	set customtext = '';
	set usesitenamenumactivealarms = 1;

	set highcauseweight = 0;
	set highcausetext = 'UNKNOWN';
	set highimpactweight = 0;
	set highimpacttext  = 'UNKNOWN';
	set highseverity = 0;
	set lowfirstoccurrence = 0;
	set highlastoccurrence = 0;
	set alarmcounter  = 0;
	set summary = '';

	set journaltoscopeidparent = 0;
	set scopeidserial = 0;
	set scopeidjournalcount = 0;
	set scopeidparentidentifier = '';

	set journaltositenameparent = 0;
	set journalmaxeventsperentry = 20;
	set journalservernameserverserial = 1;
	set journalnode = 1;
	set journalsummary = 1;
	set journalalertkey = 0;
	set journalcustomtext = 0;
	set maxsitenamejournals = 10;
	set maxscopeidjournals = 50;
	set thisjournalentry = '';
	set sitenameparentjournalentry = '';
	set scopeidparentjournalentry = '';
	set sitenamejournalcounter = 0;
	set sitenamejournaloffset = 0;
	set scopeidjournaloffset = 0;

	set sitenamesummaryactivefirst = 0;

	-- LOAD UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGPropagateTTNumber',
		'SEGPropagateAcknowledged',
		'SEGPropagateOwnerUID',
		'SEGPropagateOwnerGID',
		'SEGUseSiteNamePrefix',
		'SEGSiteNamePrefix',
		'SEGUseSiteNameLabel',
		'SEGUseSiteNameImpactCause',
		'SEGUseSiteNameCustomText',
		'SEGPropagateTextToSiteNameParentCause',
		'SEGPropagateTextToSiteNameParentImpact',
		'SEGPropagateTextToSiteNameParentFirst',
		'SEGPropagateTextToSiteNameParentLast',
		'SEGUseSiteNameNumActiveAlarms',
		'SEGJournalUID',
		'SEGJournalToSiteNameParent',
		'SEGJournalToScopeIDParent',
		'SEGJournalMaxEventsPerEntry',
		'SEGJournalServerNameServerSerial',
		'SEGJournalNode',
		'SEGJournalSummary',
		'SEGJournalAlertKey',
		'SEGJournalCustomText',
		'SEGMaxSiteNameJournals',
		'SEGMaxScopeIDJournals',
		'SEGSiteNameSummaryActiveFirst')
	begin

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE TTNumber TO CHILD EVENTS
		if (property.Name = 'SEGPropagateTTNumber') then

			set propagatettnumber = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE Acknowledged STATUS TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateAcknowledged') then

			set propagateacknowledged = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE OwnerUID TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateOwnerUID') then

			set propagateowneruid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE OwnerGID TO CHILD EVENTS
		elseif (property.Name = 'SEGPropagateOwnerGID') then

			set propagateownergid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE SiteName PREFIX IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseSiteNamePrefix') then

			set usesitenameprefix = property.IntValue;

		-- SPECIFIES THE SiteName PREFIX TO USE IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGSiteNamePrefix') then

			set sitenameprefix = property.CharValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE ACTUAL SiteName IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseSiteNameLabel') then

			set usesitenamelabel = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE IMPACT AND CAUSE INFO IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseSiteNameImpactCause') then

			set usesitenameimpactcause = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE CUSTOM TEXT IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseSiteNameCustomText') then

			set usesitenamecustomtext = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST CauseWeight
		elseif (property.Name = 'SEGPropagateTextToSiteNameParentCause') then

			set propagatetexttositenameparentcause = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST ImpactWeight
		elseif (property.Name = 'SEGPropagateTextToSiteNameParentImpact') then

			set propagatetexttositenameparentimpact = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE LOWEST FirstOccurrence
		elseif (property.Name = 'SEGPropagateTextToSiteNameParentFirst') then

			set propagatetexttositenameparentfirst = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO PROPAGATE THE CUSTOM TEXT TO THE ScopeIDParent EVENT
		-- BASED ON THE CUSTOM TEXT OF THE CHILD EVENT WITH THE HIGHEST LastOccurrence
		elseif (property.Name = 'SEGPropagateTextToSiteNameParentLast') then

			set propagatetexttositenameparentlast = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO INCLUDE THE NUMBER OF ACTIVE ALARMS IN THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseSiteNameNumActiveAlarms') then

			set usesitenamenumactivealarms = property.IntValue;

		-- SPECIFIES THE UID TO USE WHEN INSERTING JOURNALS INTO SYNTHETIC PARENT EVENTS - DEFAULT IS ROOT
--		elseif (property.Name = 'SEGJournalUID') then
--
--			set journaluid = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGJournalToScopeIDParent') then

			set journaltoscopeidparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO JOURNAL CHILD EVENTS TO THE SiteNameParent EVENT
		elseif (property.Name = 'SEGJournalToSiteNameParent') then

			set journaltositenameparent = property.IntValue;

		-- SPECIFIES HOW MANY EVENTS TO ROLL UP INTO A SINGLE JOURNAL ENTRY
		elseif (property.Name = 'SEGJournalMaxEventsPerEntry') then

			set journalmaxeventsperentry = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE ServerName:ServerSerial FIELDS TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalServerNameServerSerial') then

			set journalservernameserverserial = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Node FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalNode') then

			set journalnode = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE Summary FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalSummary') then

			set journalsummary = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE AlertKey FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalAlertKey') then

			set journalalertkey = property.IntValue;

		-- SPECIFIES WHETHER OR NOT TO SEND THE CustomText FIELD TO THE PARENT EVENT JOURNAL
		elseif (property.Name = 'SEGJournalCustomText') then

			set journalcustomtext = property.IntValue;

		-- SPECIFIES MAXIMUM NUMBER OF EVENTS TO SEND TO THE SiteNameParent EVENT JOURNAL
		elseif (property.Name = 'SEGMaxSiteNameJournals') then

			set maxsitenamejournals = property.IntValue;

		-- SPECIFIES MAXIMUM NUMBER OF EVENTS TO SEND TO THE ScopeIDParent EVENT JOURNAL
		elseif (property.Name = 'SEGMaxScopeIDJournals') then

			set maxscopeidjournals = property.IntValue;

		-- SPECIFIES WHETHER OR NOT THE NUMBER OF ACTIVE ALARMS IS TOWARDS THE FRONT OF THE SUMMARY
		elseif (property.Name = 'SEGSiteNameSummaryActiveFirst') then

			set sitenamesummaryactivefirst = property.IntValue;
		end if;
	end;

	-- IN CASE MULTIPLE CustomText PROPAGATION OPTIONS ARE INADVERTENTLY SELECTED,
	-- ENFORCE AN ORDER OF PRECEDENCE TO ENSURE UNDEFINED RESULTS ARE AVOIDED
	--
	-- ORDER OF PRECEDENCE IS:
	-- 1 PROPAGATE CustomText OF HIGHEST CauseWeight
	-- 2 PROPAGATE CustomText OF HIGHEST ImpactWeight
	-- 3 PROPAGATE CustomText OF LOWEST FirstOccurrence
	-- 4 PROPAGATE CustomText OF HIGHEST LastOccurrence
	--
	if (propagatetexttositenameparentcause = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttositenameparentimpact = 0;
		set propagatetexttositenameparentfirst = 0;
		set propagatetexttositenameparentlast = 0;

	elseif (propagatetexttositenameparentimpact = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttositenameparentfirst = 0;
		set propagatetexttositenameparentlast = 0;

	elseif (propagatetexttositenameparentfirst = 1) then

		-- CLEAR OTHER SELECTED OPTIONS
		set propagatetexttositenameparentlast = 0;
	end if;

	-- UPDATE EACH SiteNameParent EVENT
	for each row site in alerts.status where site.AlertGroup = 'SiteNameParent'
	begin

		-- RESET LOCAL VARIABLES
		set highcauseweight = 0;
		set highcausetext = 'UNKNOWN';
		set highimpactweight = 0;
		set highimpacttext  = 'UNKNOWN';
		set highseverity = 0;
		set lowfirstoccurrence = 0;
		set highlastoccurrence = 0;
		set customtext = '';
		set alarmcounter  = 0;
		set summary = '';

		set scopeidserial = 0;
		set scopeidjournalcount = 0;
		set scopeidparentidentifier = '';

		set thisjournalentry = '';
		set sitenameparentjournalentry = '';
		set scopeidparentjournalentry = '';
		set sitenamejournalcounter = 0;
		set scopeidjournalcounter = 0;
		set sitenamejournaloffset = 0;

		-- IF WE ARE SENDING JOURNALS TO THE ScopeIDParent, WE NEED ITS SERIAL
		-- AND CURRENT JOURNAL COUNT
		if (journaltoscopeidparent = 1) then

			-- LOOK UP ScopeIDParent
			for each row scopeidparent in alerts.status where
				scopeidparent.Identifier = site.ParentIdentifier
			begin

				set scopeidserial = scopeidparent.Serial;
				set scopeidjournalcount = scopeidparent.Poll;
				set scopeidparentidentifier = scopeidparent.ParentIdentifier;
			end;
		end if;

		-- EXAMINE EACH CHILD OF THE CURRENT SiteNameParent EVENT
		for each row child in alerts.status where child.ParentIdentifier = site.Identifier
		begin

			-- ONLY CONSIDER NON-CLEARED CHILD EVENTS
			if (child.Severity > 0) then

				-- INCREMENT A COUNTER FOR THE NUMBER OF CHILDREN
				set alarmcounter = alarmcounter + 1;

				-- STORE THE HIGHEST Severity OF THE CHILDREN EVENTS
				if (highseverity < child.Severity) then

					set highseverity = child.Severity;
				end if;

				-- STORE THE HIGHEST CauseWeight OF THE CHILDREN EVENTS
				-- AND ITS ASSOCIATED NormalisedAlarmName
				if (child.CauseWeight > highcauseweight) then
	
					set highcauseweight = child.CauseWeight;
					set highcausetext = child.NormalisedAlarmName;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO SiteNameParent EVENT FROM HIGHEST
					-- CauseWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttositenameparentcause = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- STORE THE HIGHEST ImpactWeight OF THE CHILDREN EVENTS
				-- AND ITS ASSOCIATED NormalisedAlarmName
				if (child.ImpactWeight > highimpactweight) then
	
					set highimpactweight = child.ImpactWeight;
					set highimpacttext = child.NormalisedAlarmName;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO SiteNameParent EVENT FROM HIGHEST
					-- ImpactWeight CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttositenameparentimpact = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- STORE THE LOWEST NON-ZERO FirstOccurrence OF THE CHILDREN EVENTS
				if (lowfirstoccurrence > child.FirstOccurrence or lowfirstoccurrence = 0) then

					set lowfirstoccurrence = child.FirstOccurrence;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO SiteNameParent EVENT FROM LOWEST
					-- FirstOccurrence CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttositenameparentfirst = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- STORE THE HIGHEST LastOccurrence OF THE CHILDREN EVENTS
				if (highlastoccurrence < child.LastOccurrence) then
	
					set highlastoccurrence = child.LastOccurrence;

					-- IF OPTION TO PROPAGATE CUSTOM TEXT TO SiteNameParent EVENT FROM HIGHEST
					-- LastOccurrence CHILD IS ENABLED, STORE CURRENT EVENT CUSTOM TEXT
					if (propagatetexttositenameparentlast = 1) then

						set customtext = child.CustomText;
					end if;
				end if;

				-- PROPAGATE THE TICKET NUMBER FROM THE SiteNameParent EVENT TO
				-- THE CURRENT CHILD IF THE CURRENT CHILD IS UNTICKETED,
				-- UNSUPPRESSED AND THE OPTION TO PROPAGATE TICKET NUMBER IS ENABLED
				if (site.TTNumber != '' and child.TTNumber = '' and
					child.SuppressEscl != 4 and propagatettnumber = 1) then
	
					set child.TTNumber = site.TTNumber;
				end if;

				-- PROPAGATE THE ACKNOWLEDGED STATUS FROM THE SiteNameParent EVENT TO
				-- THE CURRENT CHILD IF THE CURRENT CHILD IS UNACKNOWLEDGED AND THE
				-- OPTION TO PROPAGATE ACKNOWLEDGED STATUS IS ENABLED
				if (site.Acknowledged = 1 and child.Acknowledged != 1 and
					propagateacknowledged = 1) then

					set child.Acknowledged = site.Acknowledged;
				end if;

				-- PROPAGATE THE OwnerUID FROM THE SiteNameParent EVENT TO THE
				-- CURRENT CHILD EVENT IF THE OWNER OF THE SiteNameParent EVENT
				-- IS DIFFERENT TO THAT OF THE CHILD EVENT AND THE
				-- OPTION TO PROPAGATE OwnerUID IS ENABLED
				-- A VALUE OF 2 WILL ONLY PROPAGATE OWNERSHIP IF IT IS OWNED BY
				-- UID = Nobody 65534
				if (site.OwnerUID != child.OwnerUID and (
					 propagateowneruid = 1 or
					(propagateowneruid = 2 and child.OwnerUID = 65534))) then

					set child.OwnerUID = site.OwnerUID;
				end if;

				-- PROPAGATE THE OwnerGID FROM THE SiteNameParent EVENT TO THE
				-- CURRENT CHILD EVENT IF THE GROUP OF THE SiteNameParent EVENT
				-- IS DIFFERENT TO THAT OF THE CHILD EVENT AND THE
				-- OPTION TO PROPAGATE OwnerGID IS ENABLED
				-- A VALUE OF 2 WILL ONLY PROPAGATE OWNERSHIP IF IT IS OWNED BY
				-- GID = Public 0
				if (site.OwnerGID != child.OwnerGID and (
					 propagateownergid = 1 or
					(propagateownergid = 2 and child.OwnerGID = 0))) then

					set child.OwnerGID = site.OwnerGID;
				end if;

				-- CLEAR thisjournalentry VARIABLE
				set thisjournalentry = '';

				-- CONSTRUCT A JOURNAL ENTRY FOR CURRENT EVENT IF
				-- - THE CURRENT EVENT HAS NOT ALREADY BEEN JOURNALED
				-- - IF THE MAXIMUM NUMBER OF EVENTS PER JOURNAL ENTRY HAS NOT BEEN EXCEEDED
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO SiteNameParent IS ENABLED OR
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO ScopeIDParent IS ENABLED
				if (child.JournalSent = 0 and
					sitenamejournalcounter < journalmaxeventsperentry and
					scopeidjournalcounter < journalmaxeventsperentry and
					(journaltositenameparent = 1 OR journaltoscopeidparent = 1)) then

					-- CHECK WHETHER OR NOT TO INCLUDE THE ServerName:ServerSerial IN THIS JOURNAL ENTRY
					if (journalservernameserverserial = 1) then

						set thisjournalentry = thisjournalentry + child.ServerName +
							':' + to_char(child.ServerSerial);
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE Node IN THIS JOURNAL ENTRY
					if (journalnode = 1 and child.Node != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.Node;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE Summary IN THIS JOURNAL ENTRY
					if (journalsummary = 1 and child.Summary != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.Summary;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE AlertKey IN THIS JOURNAL ENTRY
					if (journalalertkey = 1 and child.AlertKey != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.AlertKey;
					end if;

					-- CHECK WHETHER OR NOT TO INCLUDE THE CustomText IN THIS JOURNAL ENTRY
					if (journalcustomtext = 1 and child.CustomText != '') then

						-- ADD COLON BEFORE APPENDING TEXT TO THIS JOURNAL ENTRY
						if (thisjournalentry != '') then
							set thisjournalentry = thisjournalentry + ': ';
						end if;

						set thisjournalentry = thisjournalentry + child.CustomText;
					end if;
				end if;

				-- ADD CURRENT EVENT TO SiteNameParent JOURNAL ENTRY IF:
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO SiteNameParent IS ENABLED
				-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS SiteNameParent HAS NOT BEEN EXCEEDED
				-- - THE CURRENT JOURNAL ENTRY IS NOT NULL
				if (journaltositenameparent = 1 and
					(site.Poll + sitenamejournalcounter) < maxsitenamejournals and
					thisjournalentry != '') then

					-- APPEND A NEW LINE CHARACTER IF THERE IS ALREADY TEXT TO ADD
					if (sitenameparentjournalentry != '') then
						set sitenameparentjournalentry = sitenameparentjournalentry + '\n';
					end if;

					-- ADD THE CURRENT JOURNAL ENTRY TO THE EXISTING
					set sitenameparentjournalentry = sitenameparentjournalentry + thisjournalentry;

					-- INCREMENT THE SiteNameParent JOURNAL COUNTER
					set sitenamejournalcounter = sitenamejournalcounter + 1;

					-- MARK CHILD EVENT AS HAVING BEEN SENT
					set child.JournalSent = 1;
 				end if;

				-- ADD A JOURNAL ENTRY TO THE CURRENT SiteNameParent NOW IF MAX EVENTS PER ENTRY IS REACHED, UPDATE COUNT, RESET VARS
				if (sitenamejournalcounter = journalmaxeventsperentry) then

					EXECUTE jinsert(site.Serial, 1100000 + sitenamejournaloffset, getdate,
						'CHILD EVENTS:\n' + sitenameparentjournalentry);

					-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
					set site.Poll = site.Poll + sitenamejournalcounter;

					-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SiteNameParent
					-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
					if (site.Poll = maxsitenamejournals) then

						EXECUTE jinsert(site.Serial, 1100000 + sitenamejournaloffset, getdate + 1,
							'*** MAXIMUM OF ' + to_char(maxsitenamejournals) +
							' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
					end if;

					-- INCREMENT THE JOURNAL UID OFFSET
					set sitenamejournaloffset = sitenamejournaloffset + 1;

					-- RESET SOME VARIABLES
					set sitenameparentjournalentry = '';
					set sitenamejournalcounter = 0;
				end if;

				-- ADD CURRENT EVENT TO ScopeIDParent JOURNAL ENTRY IF:
				-- - IF SENDING CHILD EVENT DATA AS JOURNALS TO ScopeIDParent IS ENABLED
				-- - IF THE MAXIMUM NUMBER OF EVENTS FOR THIS ScopeIDParent HAS NOT BEEN EXCEEDED
				-- - THE CURRENT JOURNAL ENTRY IS NOT NULL
				-- - THE CURRENT EVENT IS NOT A SiteNameParent EVENT
				-- - THE CURRENT EVENT IS NOT A ScopeIDParent EVENT
				-- - THE CURRENT EVENT IS NOT AN ASMParent EVENT
				-- - THE CURRENT EVENT IS NOT A CustomParent EVENT
				if (journaltoscopeidparent = 1 and
					(scopeidjournalcount + scopeidjournalcounter) < maxscopeidjournals and
					thisjournalentry != '' and
					child.AlertGroup != 'SiteNameParent' and
					child.AlertGroup != 'ScopeIDParent' and
					child.AlertGroup != 'ASMParent' and
					child.AlertGroup != 'CustomParent') then

					-- APPEND A NEW LINE CHARACTER IF THERE IS ALREADY TEXT TO ADD
					if (scopeidparentjournalentry != '') then
						set scopeidparentjournalentry = scopeidparentjournalentry + '\n';
					end if;

					-- ADD THE CURRENT JOURNAL ENTRY TO THE EXISTING
					set scopeidparentjournalentry = scopeidparentjournalentry + thisjournalentry;

					-- INCREMENT THE SiteNameParent JOURNAL COUNTER
					set scopeidjournalcounter = scopeidjournalcounter + 1;

					-- MARK CHILD EVENT AS HAVING BEEN JOURNALLED
					set child.JournalSent = 1;
 				end if;

				-- ADD A JOURNAL ENTRY TO THE CURRENT ScopeIDParent NOW IF MAX EVENTS PER ENTRY IS REACHED, UPDATE COUNT, RESET VARS
				if (scopeidjournalcounter = journalmaxeventsperentry) then

					EXECUTE jinsert(scopeidserial, 1100000 + scopeidjournaloffset, getdate,
						'SUB-GROUPING CHILD EVENTS: ' + site.SiteName + ':\n' + scopeidparentjournalentry);

					-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
					set scopeidjournalcount = scopeidjournalcount + scopeidjournalcounter;
					update alerts.status set Poll = scopeidjournalcount where Identifier = site.ParentIdentifier;

					-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS ScopeIDParent
					-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
					if (scopeidjournalcount = maxscopeidjournals) then

						EXECUTE jinsert(scopeidserial, 1100000 + scopeidjournaloffset, getdate + 1,
							'*** MAXIMUM OF ' + to_char(maxscopeidjournals) +
							' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
					end if;

					-- INCREMENT THE JOURNAL UID OFFSET
					set scopeidjournaloffset = scopeidjournaloffset + 1;

					-- RESET SOME VARIABLES
					set scopeidparentjournalentry = '';
					set scopeidjournalcounter = 0;
				end if;
			end if;
		end;

		-- STORE THE NUMBER OF ACTIVE CHILD EVENTS IN THE GRADE FIELD, IF NOT ZERO
		if (alarmcounter != 0 and site.Grade != alarmcounter) then

			set site.Grade = alarmcounter;

		-- ELSE THE COUNT OF ACTIVE CHILD EVENTS IS ZERO, SO RESET GRADE FIELD TO ZERO
		elseif (alarmcounter = 0 and site.Grade != 0) then

			set site.Grade = 0;
		end if;

		-- BEGIN THE CONSTRUCTION OF THE SiteNameParent Summary FIELD

		-- SPECIFY WHETHER TO INCLUDE THE SiteName PREFIX
		if (usesitenameprefix = 1) then

			set summary = sitenameprefix;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE NUMBER OF ACTIVE ALARMS AT THE BEGINNING OF THE SUMMARY
		if (sitenamesummaryactivefirst = 1) then

			-- APPEND A SPACE CHARACTER IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ': ';
			end if;

			if (alarmcounter = 1) then
				set summary = summary + '(' + to_char(alarmcounter) + ' active alarm)';
			else
				set summary = summary + '(' + to_char(alarmcounter) + ' active alarms)';
			end if;
		end if;

                -- SPECIFY WHETHER TO INCLUDE THE SiteName LABEL
                if (usesitenamelabel = 1) then

                        -- APPEND A COLON IF summary NOT BLANK
                        if (summary != '') then
                                set summary = summary + ': ';
                        end if;

			set summary = summary + site.SiteName;
		end if;

		-- UPDATE PRIORITY CHILD DATA FOR THIS PARENT EVENT
		EXECUTE correlation_update_priority_child (site.Identifier,
			propagatetexttositenameparentcause, highcauseweight, highcausetext,
			propagatetexttositenameparentimpact, highimpactweight, highimpacttext,
			propagatetexttositenameparentfirst, lowfirstoccurrence,
			propagatetexttositenameparentlast, highlastoccurrence,
			customtext);

		-- APPEND IMPACT CAUSE TEXT TO SUMMARY IF CONFIGURED
		if (usesitenameimpactcause = 1) then

			EXECUTE correlation_construct_impactcause (site.Identifier, summary);
		end if;

		-- FETCH AND SET THE PRIORITY CHILD CauseWeight AND ImpactWeight VALUES
		if (	site.Severity != 0 and
			(propagatetexttositenameparentcause = 1 or
			 propagatetexttositenameparentimpact = 1 or
			 propagatetexttositenameparentfirst = 1 or
			 propagatetexttositenameparentlast = 1 or
			 usesitenameimpactcause = 1)) then

			for each row parentrec in master.correlation_priority_children where parentrec.Identifier = site.Identifier
			begin

				-- PROPAGATE PRIORITY CauseWeight TO PARENT IF IT HAS CHANGED
				if (site.CauseWeight != parentrec.HighCauseWeight) then

					set site.CauseWeight = parentrec.HighCauseWeight;
				end if;

				-- PROPAGATE PRIORITY ImpactWeight TO PARENT IF IT HAS CHANGED
				if (site.ImpactWeight != parentrec.HighImpactWeight) then

					set site.ImpactWeight = parentrec.HighImpactWeight;
				end if;
			end;
		end if;

		-- FETCH AND SET THE PRIORITY CustomText IF ANY OF THE PROPAGATION OPTIONS ARE SELECTED
		if (	site.Severity != 0 and
			(propagatetexttositenameparentcause = 1 or
			 propagatetexttositenameparentimpact = 1 or
			 propagatetexttositenameparentfirst = 1 or
			 propagatetexttositenameparentlast = 1)) then

			for each row parentrec in master.correlation_priority_children where parentrec.Identifier = site.Identifier
			begin

				-- PROPAGATE PRIORITY CustomText TO PARENT IF IT HAS CHANGED
				if (site.CustomText != parentrec.CustomText) then

					set site.CustomText = parentrec.CustomText;
				end if;
			end;

			-- SPECIFY WHETHER TO INCLUDE THE CUSTOM SUMMARY TEXT CustomText
			if (usesitenamecustomtext = 1) then

				-- APPEND A COLON IF summary NOT BLANK
				if (summary != '') then
					set summary = summary + ': ';
				end if;

				-- APPEND CustomText
				set summary = summary + site.CustomText;
			end if;
		end if;

		-- SPECIFY WHETHER TO INCLUDE THE NUMBER OF ACTIVE ALARMS AT THE END OF THE SUMMARY
		if (usesitenamenumactivealarms = 1) then

			-- APPEND A SPACE CHARACTER IF summary NOT BLANK
			if (summary != '') then
				set summary = summary + ' ';
			end if;

			if (alarmcounter = 1) then
				set summary = summary + '(' + to_char(alarmcounter) + ' active alarm)';
			else
				set summary = summary + '(' + to_char(alarmcounter) + ' active alarms)';
			end if;
		end if;

		-- UPDATE THE SiteNameParent EVENT IF NOT CLEAR
		-- OR IF THE SUMMARY HAS CHANGED
		if (site.Severity != 0 or site.Summary != summary) then

			-- UPDATE Summary FIELD ONLY IF IT HAS CHANGED
			if (site.Summary != summary) then

				set site.Summary = summary;
			end if;

			-- UPDATE Severity WITH INDETERMINITE IF ALL ITS CHILDREN ARE CLEAR OR
			-- THE HIGHEST SEVERITY OF ITS CHILDREN
			if (highseverity = 0 and site.Severity != 1) then
				set site.Severity = 1;
			elseif (highseverity != 0 and site.Severity != highseverity) then
				set site.Severity = highseverity;
			end if;

			-- UPDATE FirstOccurrence WITH THE EARLIEST VALUE FROM ITS CHILDREN
			if (lowfirstoccurrence != 0 and site.FirstOccurrence != lowfirstoccurrence) then
				set site.FirstOccurrence = lowfirstoccurrence;
			end if;

			-- UPDATE LastOccurrence WITH THE LATEST VALUE FROM ITS CHILDREN
			if (highlastoccurrence != 0 and site.LastOccurrence != highlastoccurrence) then
				set site.LastOccurrence = highlastoccurrence;
			end if;
		end if;

		-- ADD A JOURNAL ENTRY TO THE CURRENT SiteNameParent IF APPLICABLE AND UPDATE COUNT
		if (journaltositenameparent = 1 and sitenameparentjournalentry != '') then

			EXECUTE jinsert(site.Serial, 1100000 + sitenamejournaloffset, getdate,
				'CHILD EVENTS:\n' + sitenameparentjournalentry);

			-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
			set site.Poll = site.Poll + sitenamejournalcounter;

			-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS SiteNameParent
			-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
			if (site.Poll = maxsitenamejournals) then

				EXECUTE jinsert(site.Serial, 1100000 + sitenamejournaloffset, getdate + 1,
					'*** MAXIMUM OF ' + to_char(maxsitenamejournals) +
					' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
			end if;

			-- INCREMENT THE JOURNAL UID OFFSET
			set sitenamejournaloffset = sitenamejournaloffset + 1;
		end if;

		-- ADD A JOURNAL ENTRY TO THE CURRENT ScopeIDParent IF APPLICABLE AND UPDATE COUNT
		if (journaltoscopeidparent = 1 and scopeidparentjournalentry != '') then

			EXECUTE jinsert(scopeidserial, 1100000 + scopeidjournaloffset, getdate,
				'SUB-GROUPING CHILD EVENTS: ' + site.SiteName + ':\n' + scopeidparentjournalentry);

			-- UPDATE THE NUMBER OF CHILD EVENTS APPENDED TO THIS PARENT EVENT
			set scopeidjournalcount = scopeidjournalcount + scopeidjournalcounter;
			update alerts.status set Poll = scopeidjournalcount where Identifier = site.ParentIdentifier;

			-- APPEND NOTE THAT NO FURTHER JOURNALS WILL BE APPENDED TO THIS ScopeIDParent
			-- DUE TO THE MAXIMUM NUMBER HAVING BEEN REACHED
			if (scopeidjournalcount = maxscopeidjournals) then

				EXECUTE jinsert(scopeidserial, 1100000 + scopeidjournaloffset, getdate + 1,
					'*** MAXIMUM OF ' + to_char(maxscopeidjournals) +
					' EVENTS HAVE BEEN JOURNALED TO THIS PARENT');
			end if;

			-- INCREMENT THE JOURNAL UID OFFSET
			set scopeidjournaloffset = scopeidjournaloffset + 1;
		end if;
	end;

end;
go

create or replace procedure xiny_add_timestamp (in out XinY char(4096), in out NumXinY int, in XEvents int, in YSeconds int, in ValueToAdd int)
declare MyValueToAdd INTEGER;
	MyNumValues INTEGER;
	MyIndex INTEGER;
	MyPosition INTEGER;
	MyCounter INTEGER;
	ThisTimestamp INTEGER;
	OKtoAdd INTEGER;
begin


	-----------------------------------------------
	-- PROCEDURE xiny_add_timestamp
	-- THE PURPOSE OF THIS PROCEDURE IS TO ADD A NEW TIMESTAMP TO THE ARRAY OF
	-- VALUES STORED IN XinY.  THE VALUES STORED IN THE XinY FIELD ARE USED TO
	-- CALCULATE XinY THRESHOLD BREACHES.
	--
	-- USAGE: execute xiny_add_timestamp (XinY, NumXinY, XEvents, YSeconds, ValueToAdd);

	-----------------------------------------------
	-- INITIALISE VARIABLES

	-- MyValueToAdd: IF THE INCOMING VALUE IS NOT ZERO, THEN THE
	-- VALUE TO ADD WILL BE THE INCOMING VALUE.  IF THE INCOMING
	-- VALUE IS ZERO HOWEVER, THEN SIMPLY ADD THE CURRENT TIMESTAMP
	-- INTO THE XinY ARRAY.

	if (ValueToAdd <> 0) then

		set MyValueToAdd = ValueToAdd;
	else

		set MyValueToAdd = getdate();
	end if;

	-- MyNumValues: THIS VALUE REPRESENTS THE NUMBER OF VALUES
	-- CURRENTLY STORED IN XinY AND MAY BE A VALUE BETWEEN ZERO
	-- AND THE THRESHOLD VALUE.
	-- NumXinY HOLDS THE TOTAL NUMBER OF INSTANCES OF THIS EVENT
	-- HOWEVER THIS NUMBER MAY BE HIGHER THAN THE THRESHOLD VALUE
	-- XEvents.

	-- IF WE HAVE RECEIVED FEWER THAN XEvents INSTANCES OF THE EVENT
	if (NumXinY < XEvents) then

		-- THEN USE THE VALUE STORED IN NumXinY TO GET THE NUMBER OF
		-- ENTRIES IN XinY
		set MyNumValues = NumXinY;

	else

		-- ELSE SIMPLY USE THE MAXIMUM VALUE XEvents SINCE WE
		-- WE DON'T STORE MORE THAN XEvents NUMBER OF VALUES.
		set MyNumValues = XEvents;
	end if;

	-- MyIndex: THIS VARIABLE REPRESENTS THE STARTING POINT FOR
	-- THE NVP SHUFFLING EXERCISE.  IF THERE ARE FEWER THAN
	-- XEvents NUMBER OF NVPs IN XinY, THEN THE STARTING POINT
	-- WILL SIMPLY BE THE NUMBER OF VALUES NumXinY.  IF THERE ARE
	-- XEvents NUMBER OF NVPs IN XinY, THEN THE STARTING POINT
	-- WILL BE THE SECOND TO LAST POSITION.
	-- THE REASON IT IS THE SECOND TO LAST POSITION IS BECAUSE THE
	-- LAST POSITION WILL ALWAYS BE DROPPED (ie. OVERWRITTEN) WHEN
	-- THE NEW ENTRY IS ADDED.

	if (NumXinY < XEvents) then

		set MyIndex = NumXinY;
	else

		set MyIndex = XEvents - 1;
	end if;

	-- MyPosition: THIS VARIABLE INDICATES THE POSITION
	-- IN THE XinY VIRTUAL ARRAY OF THE SHUFFLING CURSOR.
	-- IT SHOULD INITIALLY BE SET TO BE THE STARTING POSITION
	-- OF THE SHUFFLING EXERCISE - WHICH IS MyIndex.

	set MyPosition = MyIndex;

	-- OKtoAdd: THIS VARIABLE IS A FLAG TO INDICATE IF THE
	-- INCOMING VALUE SHOULD BE ADDED TO XinY.  IN THE CASE
	-- WHERE THE ARRAY IS FULL, CHECKS ARE DONE TO ENSURE
	-- THAT THE VALUE TO ADD IS NOT OLDER THAN THE OLDEST
	-- VALUE PRESENT IN XinY.

	set OKtoAdd = 0;

	-----------------------------------------------
	-- THE NVPs ARE STORED IN THE ARRAY XinY IN ASCENDING ORDER.
	-- THE FIRST STEP IS TO SHUFFLE ALL VALUES ALONG TO THE RIGHT
	-- ONE SLOT UNTIL THE CORRECT SLOT TO PUT THE VALUE TO INSERT
	-- (ValueToAdd) IS GREATER THAN THE TIMESTAMP STORED IN THE
	-- CURRENT LOCATION.

	-- NOTE THAT WE ONLY KEEP AT MOST XEvents NUMBER OF ENTRIES
	-- IN XinY AND SO IF THERE IS XEvents NUMBER OF ENTRIES
	-- ALREADY IN XinY, THE LAST VALUE WILL BE INTENTIONALLY
	-- OVERWITTEN AT THE END.

	-- IF THERE ARE MORE THAN ZERO VALUES IN XinY
	if (MyIndex <> 0) then

		-- ITERATE OVER THE ARRAY MyIndex TIMES
		for MyCounter = 1 to MyIndex do
		begin

			-- FETCH CURRENT POSITION TIMESTAMP
			set ThisTimestamp = to_int(nvp_get(XinY, 't' + to_char(MyPosition)));

			-- AS LONG AS THE TIMESTAMP TO ADD IS GREATER
			-- THAT THE CURRENT POSITION, KEEP SHUFFLING
			-- TIMESTAMPS ALONG.
			if (ThisTimestamp < MyValueToAdd) then

				-- MOVE CURRENT TIMESTAMP VALUE TO NEXT SLOT
				set XinY = nvp_set(XinY, 't' + to_char(MyPosition + 1), ThisTimestamp);

				-- MOVE MyPosition MARKER BACK ONE SLOT
				set MyPosition = MyPosition - 1;

			-- ELSE TIMESTAMP TO ADD SHOULD BE ADDED
			-- TO THE SLOT TO THE RIGHT (+1) OF THE
			-- CURRENT POSITION.  WE CAN STOP ITERATION
			-- OVER THE ARRAY NOW SINCE WE'VE FOUND
			-- THE POINT OF INSERTION FOR THIS VALUE.
			else

				-- BREAK OUT OF THE FOR-LOOP
				break;
			end if;
		end;
	end if;

	-- INCREMENT MyPosition TO MARK THE SLOT THAT
	-- THE TIMESTAMP TO ADD IS TO BE INSERTED.
	set MyPosition = MyPosition + 1;
	
	-- IF XinY IS FULL, CHECK THAT MyValueToAdd IS
	-- NEWER THAN THE VALUE BEING OVERWRITTEN
	if (MyNumValues = XEvents) then

		-- FETCH VALUE STORED AT MyPosition
		set ThisTimestamp = to_int(nvp_get(XinY, 't' + to_char(MyPosition)));

		-- CHECK IF MyValueToAdd IS NEWER THAN CURRENT VALUE
		if (MyValueToAdd > ThisTimestamp) then

			set OKtoAdd = 1;
		end if;

	-- ELSE XinY IS NOT FULL - SO ADD VALUE ANYWAY
	else

		set OKtoAdd = 1;
	end if;

	-- IF WE CAN ADD THE NEW VALUE TO THE ARRAY, GO AHEAD
	if (OKtoAdd = 1) then

		-- INSERT A NEW ENTRY INTO THE SLOT MyPosition
		set XinY = nvp_set(XinY, 't' + to_char(MyPosition), MyValueToAdd);

		-- INCREMENT NumXinY
		set NumXinY = NumXinY + 1;
	end if;

end;
go

create or replace procedure xiny_calculate_breach (in XinY char(4096), in NumXinY int, in XEvents int, in YSeconds int, in out BreachDetected int)
declare NewestTimestamp INTEGER;
	OldestTimestamp INTEGER;
begin


	-----------------------------------------------
	-- PROCEDURE xiny_calculate_breach
	-- THE PURPOSE OF THIS PROCEDURE IS TO DETERMINE WHETHER OR NOT A THRESHOLD
	-- BREACH HAS OCCURRED.
	--
	-- USAGE: xiny_calculate_breach (XinY, NumXinY, XEvents, YSeconds, BreachDetected);

	-----------------------------------------------
	-- INITIALISE VARIABLES

	set BreachDetected = 0;

	-- ONLY PROCEED WITH THE THRESHOLD BREACH CHECK IF WE HAVE THE
	-- MINIMUM NUMBER OF VALUES STORED IN XinY IN ORDER FOR THERE TO
	-- BE A BREACH.

	if (NumXinY >= XEvents) then

		-- IF SO, PROCEED WITH THE THRESHOLD CALCULATION
		-- FETCH TIMESTAMP STORED IN POSITION: XEvents

		set NewestTimestamp = to_int(nvp_get(XinY, 't1'));
		set OldestTimestamp = to_int(nvp_get(XinY, 't' + to_char(XEvents)));

		-- CHECK IF THE DIFFERENCE BETWEEN THE OLDEST TIMESTAMP AND
		-- THE NEWEST TIMESTAMP IS LESS THAN OR EQUAL TO YSeconds

		if ((NewestTimestamp - OldestTimestamp) <= YSeconds) then

			-- IF THE DIFFERENCE IS LESS THAN OR EQUAL
			-- TO THE VALUE STORED IN YSeconds, THIS
			-- INDICATES A THRESHOLD BREACH.

			set BreachDetected = 1;
		end if;
	end if;

end;
go

create or replace trigger correlation_process_existing_parents
group correlation_triggers
priority 15
comment 'Update any existing synthetic parent events that are present'
every 17 seconds
when get_prop_value('ActingPrimary') %= 'TRUE'
begin

-- STEP 1: DISMANTLE ANY SMALL GROUPS THAT HAVE EXPIRED AND DON'T HAVE MINIMUM NUMBER OF CHILDREN

	EXECUTE correlation_dismantle_small_groups;

-- STEP 2: CLEAR PARENT EVENTS THAT HAVE NO CHILDREN AND ARE PAST THEIR EXPIRY TIMES

	EXECUTE correlation_clear_expired_parents;

-- STEP 3: PROCESS SiteNameParent EVENTS

	EXECUTE correlation_process_sitenameparents;

-- STEP 4: PROCESS ScopeIDParent EVENTS

	EXECUTE correlation_process_scopeidparents;

-- STEP 5: PROPAGATE CHILD AND GRANDCHILD EVENTS TO SUPER PARENT JOURNAL

	EXECUTE correlation_process_superparents;

end;
go

create or replace trigger correlation_new_row
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before insert on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE' and
	new.ScopeID != '' and
	new.ParentIdentifier = '' and
	new.AlertGroup not in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent')
declare quietperiod		INTEGER;
	usenodeforscopeidparent	INTEGER;
	usenodeforsitenameparent INTEGER;
	nodetouse		CHAR(64);
	nositenameparentifsitenameblank INTEGER;

	now			TIME;
	expiretime		TIME;

	scopeid			CHAR(255);

	scopeparentfound	INTEGER;
	newscopeparentneeded	INTEGER;
	scopeidentifier		CHAR(255);

	siteparentfound		INTEGER;
	scopeparentmoved	INTEGER;
	siteidentifier		CHAR(255);
begin

-- STEP 1: INITIALISE VARIABLES

	set quietperiod = 15 * 60;
	set usenodeforscopeidparent = 0;
	set usenodeforsitenameparent = 0;
	set nodetouse = '';
	set nositenameparentifsitenameblank = 0;

	set now = getdate();

	set scopeid = '';

	set scopeparentfound = 0;
	set newscopeparentneeded = 0;
	set scopeidentifier = '';

	set siteparentfound = 0;
	set scopeparentmoved = 0;
	set siteidentifier = '';

	-- SET UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGQuietPeriod',
		'SEGUseNodeForScopeIDParent',
		'SEGUseNodeForSiteNameParent',
		'SEGNoSiteNameParentIfSiteNameBlank')
	begin
		-- SPECIFIES THE GLOBAL DEFAULT QUIET PERIOD TO APPLY TO GROUPING
		if (property.Name = 'SEGQuietPeriod') then

			set quietperiod = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseNodeForScopeIDParent') then

			set usenodeforscopeidparent = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseNodeForSiteNameParent') then

			set usenodeforsitenameparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT A SiteNameParent SHOULD BE CREATED IF SiteName IS NULL
		elseif (property.Name = 'SEGNoSiteNameParentIfSiteNameBlank') then

			set nositenameparentifsitenameblank = property.IntValue;

		end if;
	end;

	-- OVERRIDE QUIET PERIOD IF DEFINED IN THE INCOMING EVENT
	if (new.QuietPeriod != 0) then

		set quietperiod = new.QuietPeriod;
	end if;

	-- USE VALUE STORED IN FirstOccurrence IF SET, ELSE USE CURRENT TIME
	if (new.FirstOccurrence = 0) then

		set now = getdate();
	else 

		set now = new.FirstOccurrence;
	end if;

	-- SET DEFAULT VALUE OF ExpireTime BASED ON FirstOccurrence
	set expiretime = now + quietperiod;

-- STEP 2: CHECK ScopeAlias MEMBERSHIP

	-- CHECK FOR ScopeAlias MEMBERSHIP
	for each row scopealiasmemberrow in master.correlation_scopealias_members where
		scopealiasmemberrow.ScopeID = new.ScopeID
	begin

		-- SET THE ScopeID TO USE FOR THE SYNTHETIC CONTAINMENT EVENT TO BE THE ALIAS
		set scopeid = scopealiasmemberrow.ScopeAlias;
	end;

	-- USE INCOMING ScopeID VALUE IF ScopeID IS NOT A MEMBER OF AN ALIAS GROUP
	if (scopeid = '') then

		set scopeid = new.ScopeID;
	end if;

-- STEP 3: SET UP ScopeIDParent EVENT

	-- LOOK FOR CURRENT ScopeIDParent
	for each row parent in master.correlation_scopeid where
		parent.ScopeID = scopeid
	begin

		-- MARK ScopeID PARENT AS FOUND
		set scopeparentfound = 1;

		-- CHECK IF THE GROUP ExpireTime HAS PASSED
		if (parent.ExpireTime < now) then

			-- IF SO, UPDATE PARENT ENTRY AND SET FLAG TO CREATE A NEW ScopeIDParent
			set parent.Identifier =	'SIDP:' + to_char(to_int(now)) + ':' + parent.ScopeID;
			set newscopeparentneeded = 1;
			set parent.ExpireTime = expiretime;
			set parent.CustomText =	'';
			set parent.CustomTimestamp = 0;
			set parent.CustomWeight = 0;
			set parent.HighImpactWeight = 0;
			set parent.HighImpactText = '';
			set parent.HighCauseWeight = 0;
			set parent.HighCauseText = '';
		end if;

		-- STORE EITHER EXISTING OR UPDATED ScopeIDParent IDENTIFIER
		set scopeidentifier = parent.Identifier;

		-- UPDATE LastOccurrence IN PARENT ENTRY IF INCOMING VALUE IS GREATER
		if (parent.LastOccurrence < now) then

			set parent.LastOccurrence = now;
		end if;

		-- UPDATE GROUP ExpireTime IF INCOMING ROW EXTENDS IT
		-- DO NOT EXTEND ExpireTime IF SCOPEID IS MARKED AS HAVING A FIXED TIME WINDOW
		-- FIXED TIME WINDOW SCOPEIDS ARE PREFIXED WITH THE STRING FX:
		if (parent.ExpireTime < expiretime and parent.ScopeID not like '^FX:') then

			set parent.ExpireTime = expiretime;
		end if;
	end;

	-- CREATE PARENT ENTRY IN master.correlation_scopeid IF NONE FOUND
	if (scopeparentfound = 0) then

		-- SET ScopeIDParent IDENTIFIER TO A NEW VALUE
		set scopeidentifier = 'SIDP:' + to_char(to_int(now)) + ':' + scopeid;

		-- INSERT NEW ScopeIDParent
		insert into master.correlation_scopeid (
			ScopeID,
			LastOccurrence,
			Identifier,
			ExpireTime)
		values (
			scopeid,
			now,
			scopeidentifier,
			expiretime);
	end if;

	-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
	if (usenodeforscopeidparent = 1) then

		set nodetouse = new.Node;
	else

		set nodetouse = scopeid;
	end if;

	-- INSERT ScopeIDParent EVENT INTO alerts.status IF NOT PRESENT OR NEW ONE NEEDED
	if (scopeparentfound = 0 or newscopeparentneeded = 1) then

		-- INSERT SYNTHETIC ScopeIDParent EVENT
		insert into alerts.status (
			Identifier,
			Node,
			Class,
			Summary,
			AlertGroup,
			Severity,
			ScopeID,
			FirstOccurrence,
			LastOccurrence,
			Grade,
			OwnerUID,
			OwnerGID)
		values (
			scopeidentifier,
			nodetouse,
			99990,
			'INCIDENT: ' + scopeid + ': calculating summary details...',
			'ScopeIDParent',
			1,
			scopeid,
			now,
			now,
			1,
			65534,
			0);
	end if;

-- STEP 4: SET UP SiteNameParent EVENT IF OPTION TO DISABLE IS NOT SET

	-- DO NOT CREATE SiteNameParent EVENT IF OPTION TO DISABLE SiteNameParent
	-- IS SET AND SiteName IS BLANK.  INSTEAD LINK EVENT TO ScopeIDParent EVENT
	if (nositenameparentifsitenameblank = 1 and new.SiteName = '') then

		-- LINK CURRENT EVENT TO ScopeIDParent EVENT
		set new.ParentIdentifier = scopeidentifier;

	-- ELSE CREATE SiteNameParent EVENT AND LINK CURRENT EVENT TO THAT
	else

		-- IF EVENT HAS NO SiteName THEN SET IT TO A DEFAULT
		if (new.SiteName = '') then

			set new.SiteName = 'NO SITENAME';
		end if;

		-- LOOK FOR CURRENT SiteNameParent
		for each row parent in master.correlation_sitename where
			parent.SiteName = new.SiteName and
			parent.ScopeID = scopeid
		begin

			-- MARK SiteName PARENT AS FOUND
			set siteparentfound = 1;

			-- CHECK IF ScopeIDParent HAS MOVED
			for each row scopeidparentevent in alerts.status where
				scopeidparentevent.Identifier = parent.Identifier
			begin

				if (scopeidparentevent.ParentIdentifier != scopeidentifier) then

					set scopeparentmoved = 1;
				end if;
			end;

			-- UPDATE THE ENTRY IF WE ARE CREATING A NEW ScopeIDParent
			if (newscopeparentneeded = 1 or scopeparentmoved = 1) then

				set parent.Identifier = 'SNP:' + to_char(to_int(now)) + ':' + scopeid + ':' + new.SiteName;
				set parent.CustomText =	'';
				set parent.CustomTimestamp = 0;
				set parent.CustomWeight = 0;
				set parent.HighImpactWeight = 0;
				set parent.HighImpactText = '';
				set parent.HighCauseWeight = 0;
				set parent.HighCauseText = '';
			end if;

			-- STORE CURRENT SiteName PARENT IDENTIFIER
			set siteidentifier = parent.Identifier;
		end;

		-- CREATE PARENT ENTRY IN master.correlation_sitename IF NONE FOUND
		if (siteparentfound = 0) then

			-- STORE NEW SiteName PARENT IDENTIFIER
			set siteidentifier = 'SNP:' +
				to_char(to_int(now)) + ':' + scopeid + ':' + new.SiteName;

			-- CREATE THE NEW SiteParent EVENT
			insert into master.correlation_sitename (
				SiteName,
				ScopeID,
				Identifier)
			values (
				new.SiteName,
				scopeid,
				siteidentifier);
		end if;

		-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
		if (usenodeforsitenameparent = 1) then

			set nodetouse = new.Node;
		else

			set nodetouse = new.SiteName;
		end if;

		-- INSERT NEW SiteParent EVENT INTO alerts.status IF NEW OR UPDATED ScopeIDParent
		if (siteparentfound = 0 or newscopeparentneeded = 1 or scopeparentmoved = 1) then

			-- INSERT SYNTHETIC SiteNameParent EVENT
			insert into alerts.status (
				Identifier,
				Node,
				Class,
				Summary,
				AlertGroup,
				Severity,
				ScopeID,
				SiteName,
				FirstOccurrence,
				LastOccurrence,
				ParentIdentifier,
				Grade,
				OwnerUID,
				OwnerGID)
			values (
				siteidentifier,
				nodetouse,
				99990,
				new.SiteName + ': calculating summary details...',
				'SiteNameParent',
				1,
				scopeid,
				new.SiteName,
				now,
				now,
				scopeidentifier,
				1,
				65534,
				0);
		end if;

		-- LINK CURRENT EVENT TO SiteNameParent
		set new.ParentIdentifier = siteidentifier;
	end if;
end;
go

create or replace trigger correlation_update
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before update on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE' and
	old.ScopeID = '' and new.ScopeID != '' and
	old.ParentIdentifier = '' and
	new.AlertGroup not in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent')
declare quietperiod		INTEGER;
	usenodeforscopeidparent	INTEGER;
	usenodeforsitenameparent INTEGER;
	nodetouse		CHAR(64);
	nositenameparentifsitenameblank INTEGER;

	now			TIME;
	expiretime		TIME;

	scopeid			CHAR(255);

	scopeparentfound	INTEGER;
	newscopeparentneeded	INTEGER;
	scopeidentifier		CHAR(255);

	siteparentfound		INTEGER;
	scopeparentmoved	INTEGER;
	siteidentifier		CHAR(255);
begin

-- STEP 1: INITIALISE VARIABLES

	set quietperiod = 15 * 60;
	set usenodeforscopeidparent = 0;
	set usenodeforsitenameparent = 0;
	set nodetouse = '';
	set nositenameparentifsitenameblank = 0;

	set now = getdate();

	set scopeid = '';

	set scopeparentfound = 0;
	set newscopeparentneeded = 0;
	set scopeidentifier = '';

	set siteparentfound = 0;
	set scopeparentmoved = 0;
	set siteidentifier = '';

	-- SET UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGQuietPeriod',
		'SEGUseNodeForScopeIDParent',
		'SEGUseNodeForSiteNameParent',
		'SEGNoSiteNameParentIfSiteNameBlank')
	begin
		-- SPECIFIES THE GLOBAL DEFAULT QUIET PERIOD TO APPLY TO GROUPING
		if (property.Name = 'SEGQuietPeriod') then

			set quietperiod = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseNodeForScopeIDParent') then

			set usenodeforscopeidparent = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseNodeForSiteNameParent') then

			set usenodeforsitenameparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT A SiteNameParent SHOULD BE CREATED IF SiteName IS NULL
		elseif (property.Name = 'SEGNoSiteNameParentIfSiteNameBlank') then

			set nositenameparentifsitenameblank = property.IntValue;

		end if;
	end;

	-- OVERRIDE QUIET PERIOD IF DEFINED IN THE INCOMING EVENT
	if (new.QuietPeriod != 0) then

		set quietperiod = new.QuietPeriod;
	end if;

	-- USE VALUE STORED IN FirstOccurrence IF SET, ELSE USE CURRENT TIME
	if (new.FirstOccurrence = 0) then

		set now = getdate();
	else 

		set now = new.FirstOccurrence;
	end if;

	-- SET DEFAULT VALUE OF ExpireTime BASED ON FirstOccurrence
	set expiretime = now + quietperiod;

-- STEP 2: CHECK ScopeAlias MEMBERSHIP

	-- CHECK FOR ScopeAlias MEMBERSHIP
	for each row scopealiasmemberrow in master.correlation_scopealias_members where
		scopealiasmemberrow.ScopeID = new.ScopeID
	begin

		-- SET THE ScopeID TO USE FOR THE SYNTHETIC CONTAINMENT EVENT TO BE THE ALIAS
		set scopeid = scopealiasmemberrow.ScopeAlias;
	end;

	-- USE INCOMING ScopeID VALUE IF ScopeID IS NOT A MEMBER OF AN ALIAS GROUP
	if (scopeid = '') then

		set scopeid = new.ScopeID;
	end if;

-- STEP 3: SET UP ScopeIDParent EVENT

	-- LOOK FOR CURRENT ScopeIDParent
	for each row parent in master.correlation_scopeid where
		parent.ScopeID = scopeid
	begin

		-- MARK ScopeID PARENT AS FOUND
		set scopeparentfound = 1;

		-- CHECK IF THE GROUP ExpireTime HAS PASSED
		if (parent.ExpireTime < now) then

			-- IF SO, UPDATE PARENT ENTRY AND SET FLAG TO CREATE A NEW ScopeIDParent
			set parent.Identifier =	'SIDP:' + to_char(to_int(now)) + ':' + parent.ScopeID;
			set newscopeparentneeded = 1;
			set parent.ExpireTime = expiretime;
			set parent.CustomText =	'';
			set parent.CustomTimestamp = 0;
			set parent.CustomWeight = 0;
			set parent.HighImpactWeight = 0;
			set parent.HighImpactText = '';
			set parent.HighCauseWeight = 0;
			set parent.HighCauseText = '';
		end if;

		-- STORE EITHER EXISTING OR UPDATED ScopeIDParent IDENTIFIER
		set scopeidentifier = parent.Identifier;

		-- UPDATE LastOccurrence IN PARENT ENTRY IF INCOMING VALUE IS GREATER
		if (parent.LastOccurrence < now) then

			set parent.LastOccurrence = now;
		end if;

		-- UPDATE GROUP ExpireTime IF INCOMING ROW EXTENDS IT
		-- DO NOT EXTEND ExpireTime IF SCOPEID IS MARKED AS HAVING A FIXED TIME WINDOW
		-- FIXED TIME WINDOW SCOPEIDS ARE PREFIXED WITH THE STRING FX:
		if (parent.ExpireTime < expiretime and parent.ScopeID not like '^FX:') then

			set parent.ExpireTime = expiretime;
		end if;
	end;

	-- CREATE PARENT ENTRY IN master.correlation_scopeid IF NONE FOUND
	if (scopeparentfound = 0) then

		-- SET ScopeIDParent IDENTIFIER TO A NEW VALUE
		set scopeidentifier = 'SIDP:' + to_char(to_int(now)) + ':' + scopeid;

		-- INSERT NEW ScopeIDParent
		insert into master.correlation_scopeid (
			ScopeID,
			LastOccurrence,
			Identifier,
			ExpireTime)
		values (
			scopeid,
			now,
			scopeidentifier,
			expiretime);
	end if;

	-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
	if (usenodeforscopeidparent = 1) then

		set nodetouse = new.Node;
	else

		set nodetouse = scopeid;
	end if;

	-- INSERT ScopeIDParent EVENT INTO alerts.status IF NOT PRESENT OR NEW ONE NEEDED
	if (scopeparentfound = 0 or newscopeparentneeded = 1) then

		-- INSERT SYNTHETIC ScopeIDParent EVENT
		insert into alerts.status (
			Identifier,
			Node,
			Class,
			Summary,
			AlertGroup,
			Severity,
			ScopeID,
			FirstOccurrence,
			LastOccurrence,
			Grade,
			OwnerUID,
			OwnerGID)
		values (
			scopeidentifier,
			nodetouse,
			99990,
			'INCIDENT: ' + scopeid + ': calculating summary details...',
			'ScopeIDParent',
			1,
			scopeid,
			now,
			now,
			1,
			65534,
			0);
	end if;

-- STEP 4: SET UP SiteNameParent EVENT IF OPTION TO DISABLE IS NOT SET

	-- DO NOT CREATE SiteNameParent EVENT IF OPTION TO DISABLE SiteNameParent
	-- IS SET AND SiteName IS BLANK.  INSTEAD LINK EVENT TO ScopeIDParent EVENT
	if (nositenameparentifsitenameblank = 1 and new.SiteName = '') then

		-- LINK CURRENT EVENT TO ScopeIDParent EVENT
		set new.ParentIdentifier = scopeidentifier;

	-- ELSE CREATE SiteNameParent EVENT AND LINK CURRENT EVENT TO THAT
	else

		-- IF EVENT HAS NO SiteName THEN SET IT TO A DEFAULT
		if (new.SiteName = '') then

			set new.SiteName = 'NO SITENAME';
		end if;

		-- LOOK FOR CURRENT SiteNameParent
		for each row parent in master.correlation_sitename where
			parent.SiteName = new.SiteName and
			parent.ScopeID = scopeid
		begin

			-- MARK SiteName PARENT AS FOUND
			set siteparentfound = 1;

			-- CHECK IF ScopeIDParent HAS MOVED
			for each row scopeidparentevent in alerts.status where
				scopeidparentevent.Identifier = parent.Identifier
			begin

				if (scopeidparentevent.ParentIdentifier != scopeidentifier) then

					set scopeparentmoved = 1;
				end if;
			end;

			-- UPDATE THE ENTRY IF WE ARE CREATING A NEW ScopeIDParent
			if (newscopeparentneeded = 1 or scopeparentmoved = 1) then

				set parent.Identifier = 'SNP:' + to_char(to_int(now)) + ':' + scopeid + ':' + new.SiteName;
				set parent.CustomText =	'';
				set parent.CustomTimestamp = 0;
				set parent.CustomWeight = 0;
				set parent.HighImpactWeight = 0;
				set parent.HighImpactText = '';
				set parent.HighCauseWeight = 0;
				set parent.HighCauseText = '';
			end if;

			-- STORE CURRENT SiteName PARENT IDENTIFIER
			set siteidentifier = parent.Identifier;
		end;

		-- CREATE PARENT ENTRY IN master.correlation_sitename IF NONE FOUND
		if (siteparentfound = 0) then

			-- STORE NEW SiteName PARENT IDENTIFIER
			set siteidentifier = 'SNP:' +
				to_char(to_int(now)) + ':' + scopeid + ':' + new.SiteName;

			-- CREATE THE NEW SiteParent EVENT
			insert into master.correlation_sitename (
				SiteName,
				ScopeID,
				Identifier)
			values (
				new.SiteName,
				scopeid,
				siteidentifier);
		end if;

		-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
		if (usenodeforsitenameparent = 1) then

			set nodetouse = new.Node;
		else

			set nodetouse = new.SiteName;
		end if;

		-- INSERT NEW SiteParent EVENT INTO alerts.status IF NEW OR UPDATED ScopeIDParent
		if (siteparentfound = 0 or newscopeparentneeded = 1 or scopeparentmoved = 1) then

			-- INSERT SYNTHETIC SiteNameParent EVENT
			insert into alerts.status (
				Identifier,
				Node,
				Class,
				Summary,
				AlertGroup,
				Severity,
				ScopeID,
				SiteName,
				FirstOccurrence,
				LastOccurrence,
				ParentIdentifier,
				Grade,
				OwnerUID,
				OwnerGID)
			values (
				siteidentifier,
				nodetouse,
				99990,
				new.SiteName + ': calculating summary details...',
				'SiteNameParent',
				1,
				scopeid,
				new.SiteName,
				now,
				now,
				scopeidentifier,
				1,
				65534,
				0);
		end if;

		-- LINK CURRENT EVENT TO SiteNameParent
		set new.ParentIdentifier = siteidentifier;
	end if;
end;
go

create or replace trigger correlation_deduplication
group correlation_triggers
priority 15
comment 'Checks for the existence of parent events, updates or creates if necessary'
before reinsert on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE' and
	(old.ScopeID != '' or new.ScopeID != '') and
	old.ParentIdentifier = '' and
	old.AlertGroup not in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent', 'ASMParent', 'CustomParent')
declare quietperiod		INTEGER;
	usenodeforscopeidparent	INTEGER;
	usenodeforsitenameparent INTEGER;
	nodetouse		CHAR(64);
	nositenameparentifsitenameblank INTEGER;

	now			TIME;
	expiretime		TIME;

	scopeid			CHAR(255);
	sitename		CHAR(255);

	scopeparentfound	INTEGER;
	newscopeparentneeded	INTEGER;
	scopeidentifier		CHAR(255);

	siteparentfound		INTEGER;
	scopeparentmoved	INTEGER;
	siteidentifier		CHAR(255);
begin

-- STEP 1: INITIALISE VARIABLES

	set quietperiod = 15 * 60;
	set usenodeforscopeidparent = 0;
	set usenodeforsitenameparent = 0;
	set nodetouse = '';
	set nositenameparentifsitenameblank = 0;

	set now = getdate();

	set scopeid = '';
	set sitename = '';

	set scopeparentfound = 0;
	set newscopeparentneeded = 0;
	set scopeidentifier = '';

	set siteparentfound = 0;
	set scopeparentmoved = 0;
	set siteidentifier = '';

	-- SET UP VARIABLES BASED ON PROPERTIES
	for each row property in master.properties where property.Name in (
		'SEGQuietPeriod',
		'SEGUseNodeForScopeIDParent',
		'SEGUseNodeForSiteNameParent',
		'SEGNoSiteNameParentIfSiteNameBlank')
	begin
		-- SPECIFIES THE GLOBAL DEFAULT QUIET PERIOD TO APPLY TO GROUPING
		if (property.Name = 'SEGQuietPeriod') then

			set quietperiod = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE ScopeIDParent EVENT
		elseif (property.Name = 'SEGUseNodeForScopeIDParent') then

			set usenodeforscopeidparent = property.IntValue;

		-- SPECIFIES IF THE NODE VALUE OF THE FIRST EVENT SHOULD BE USED FOR THE SiteNameParent EVENT
		elseif (property.Name = 'SEGUseNodeForSiteNameParent') then

			set usenodeforsitenameparent = property.IntValue;

		-- SPECIFIES WHETHER OR NOT A SiteNameParent SHOULD BE CREATED IF SiteName IS NULL
		elseif (property.Name = 'SEGNoSiteNameParentIfSiteNameBlank') then

			set nositenameparentifsitenameblank = property.IntValue;

		end if;
	end;

	-- OVERRIDE QUIET PERIOD IF DEFINED IN THE INCOMING EVENT
	-- CHECK IF A PREVIOUS REINSERT TRIGGER HAS SET QuietPeriod
	if (old.QuietPeriod != 0) then

		set quietperiod = old.QuietPeriod;

	-- ELSE USE THE INCOMING VALUE
	elseif (new.QuietPeriod != 0) then

		set quietperiod = new.QuietPeriod;
	end if;

	-- USE VALUE STORED IN FirstOccurrence IF SET, ELSE USE CURRENT TIME
	if (old.FirstOccurrence = 0) then

		set now = getdate();
	else 

		set now = old.FirstOccurrence;
	end if;

	-- SET DEFAULT VALUE OF ExpireTime BASED ON FirstOccurrence
	set expiretime = now + quietperiod;

	-- SET THE ScopeID BASED ON THE INCOMING VALUE
	-- CHECK IF A PREVIOUS REINSERT TRIGGER HAS SET ScopeID
	if (old.ScopeID != '') then

		set scopeid = old.ScopeID;

	-- ELSE USE THE INCOMING VALUE
	elseif (new.ScopeID != '') then

		set scopeid = new.ScopeID;

		-- UPDATE ScopeID WITH INCOMING VALUE
		set old.ScopeID = new.ScopeID;
	end if;

	-- SET THE SiteName BASED ON THE INCOMING VALUE
	-- CHECK IF A PREVIOUS REINSERT TRIGGER HAS SET SiteName
	if (old.SiteName != '') then

		set sitename = old.SiteName;

	-- ELSE USE THE INCOMING VALUE
	elseif (new.SiteName != '') then

		set sitename = new.SiteName;

		-- UPDATE ScopeID WITH INCOMING VALUE
		set old.SiteName = new.SiteName;
	end if;


-- STEP 2: CHECK ScopeAlias MEMBERSHIP

	-- CHECK FOR ScopeAlias MEMBERSHIP
	for each row scopealiasmemberrow in master.correlation_scopealias_members where
		scopealiasmemberrow.ScopeID = scopeid
	begin

		-- SET THE ScopeID TO USE FOR THE SYNTHETIC CONTAINMENT EVENT TO BE THE ALIAS
		set scopeid = scopealiasmemberrow.ScopeAlias;
	end;

	-- USE INCOMING ScopeID VALUE IF ScopeID IS NOT A MEMBER OF AN ALIAS GROUP
--	if (scopeid = '') then
--
--		set scopeid = new.ScopeID;
--	end if;

-- STEP 3: SET UP ScopeIDParent EVENT

	-- LOOK FOR CURRENT ScopeIDParent
	for each row parent in master.correlation_scopeid where
		parent.ScopeID = scopeid
	begin

		-- MARK ScopeID PARENT AS FOUND
		set scopeparentfound = 1;

		-- CHECK IF THE GROUP ExpireTime HAS PASSED
		if (parent.ExpireTime < now) then

			-- IF SO, UPDATE PARENT ENTRY AND SET FLAG TO CREATE A NEW ScopeIDParent
			set parent.Identifier =	'SIDP:' + to_char(to_int(now)) + ':' + parent.ScopeID;
			set newscopeparentneeded = 1;
			set parent.ExpireTime = expiretime;
			set parent.CustomText =	'';
			set parent.CustomTimestamp = 0;
			set parent.CustomWeight = 0;
			set parent.HighImpactWeight = 0;
			set parent.HighImpactText = '';
			set parent.HighCauseWeight = 0;
			set parent.HighCauseText = '';
		end if;

		-- STORE EITHER EXISTING OR UPDATED ScopeIDParent IDENTIFIER
		set scopeidentifier = parent.Identifier;

		-- UPDATE LastOccurrence IN PARENT ENTRY IF INCOMING VALUE IS GREATER
		if (parent.LastOccurrence < now) then

			set parent.LastOccurrence = now;
		end if;

		-- UPDATE GROUP ExpireTime IF INCOMING ROW EXTENDS IT
		-- DO NOT EXTEND ExpireTime IF SCOPEID IS MARKED AS HAVING A FIXED TIME WINDOW
		-- FIXED TIME WINDOW SCOPEIDS ARE PREFIXED WITH THE STRING FX:
		if (parent.ExpireTime < expiretime and parent.ScopeID not like '^FX:') then

			set parent.ExpireTime = expiretime;
		end if;
	end;

	-- CREATE PARENT ENTRY IN master.correlation_scopeid IF NONE FOUND
	if (scopeparentfound = 0) then

		-- SET ScopeIDParent IDENTIFIER TO A NEW VALUE
		set scopeidentifier = 'SIDP:' + to_char(to_int(now)) + ':' + scopeid;

		-- INSERT NEW ScopeIDParent
		insert into master.correlation_scopeid (
			ScopeID,
			LastOccurrence,
			Identifier,
			ExpireTime)
		values (
			scopeid,
			now,
			scopeidentifier,
			expiretime);
	end if;

	-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
	if (usenodeforscopeidparent = 1) then

		set nodetouse = old.Node;
	else

		set nodetouse = scopeid;
	end if;

	-- INSERT ScopeIDParent EVENT INTO alerts.status IF NOT PRESENT OR NEW ONE NEEDED
	if (scopeparentfound = 0 or newscopeparentneeded = 1) then

		-- INSERT SYNTHETIC ScopeIDParent EVENT
		insert into alerts.status (
			Identifier,
			Node,
			Class,
			Summary,
			AlertGroup,
			Severity,
			ScopeID,
			FirstOccurrence,
			LastOccurrence,
			Grade,
			OwnerUID,
			OwnerGID)
		values (
			scopeidentifier,
			nodetouse,
			99990,
			'INCIDENT: ' + scopeid + ': calculating summary details...',
			'ScopeIDParent',
			1,
			scopeid,
			now,
			now,
			1,
			65534,
			0);
	end if;

-- STEP 4: SET UP SiteNameParent EVENT IF OPTION TO DISABLE IS NOT SET

	-- DO NOT CREATE SiteNameParent EVENT IF OPTION TO DISABLE SiteNameParent
	-- IS SET AND SiteName IS BLANK.  INSTEAD LINK EVENT TO ScopeIDParent EVENT
	if (nositenameparentifsitenameblank = 1 and sitename = '') then

		-- LINK CURRENT EVENT TO ScopeIDParent EVENT
		set old.ParentIdentifier = scopeidentifier;

	-- ELSE CREATE SiteNameParent EVENT AND LINK CURRENT EVENT TO THAT
	else

		-- IF EVENT HAS NO SiteName THEN SET IT TO A DEFAULT
		if (sitename = '') then

			set old.SiteName = 'NO SITENAME';
		end if;

		-- LOOK FOR CURRENT SiteNameParent
		for each row parent in master.correlation_sitename where
			parent.SiteName = sitename and
			parent.ScopeID = scopeid
		begin

			-- MARK SiteName PARENT AS FOUND
			set siteparentfound = 1;

			-- CHECK IF ScopeIDParent HAS MOVED
			for each row scopeidparentevent in alerts.status where
				scopeidparentevent.Identifier = parent.Identifier
			begin

				if (scopeidparentevent.ParentIdentifier != scopeidentifier) then

					set scopeparentmoved = 1;
				end if;
			end;

			-- UPDATE THE ENTRY IF WE ARE CREATING A NEW ScopeIDParent
			if (newscopeparentneeded = 1 or scopeparentmoved = 1) then

				set parent.Identifier = 'SNP:' + to_char(to_int(now)) + ':' + scopeid + ':' + sitename;
				set parent.CustomText =	'';
				set parent.CustomTimestamp = 0;
				set parent.CustomWeight = 0;
				set parent.HighImpactWeight = 0;
				set parent.HighImpactText = '';
				set parent.HighCauseWeight = 0;
				set parent.HighCauseText = '';
			end if;

			-- STORE CURRENT SiteName PARENT IDENTIFIER
			set siteidentifier = parent.Identifier;
		end;

		-- CREATE PARENT ENTRY IN master.correlation_sitename IF NONE FOUND
		if (siteparentfound = 0) then

			-- STORE NEW SiteName PARENT IDENTIFIER
			set siteidentifier = 'SNP:' +
				to_char(to_int(now)) + ':' + scopeid + ':' + sitename;

			-- CREATE THE NEW SiteParent EVENT
			insert into master.correlation_sitename (
				SiteName,
				ScopeID,
				Identifier)
			values (
				sitename,
				scopeid,
				siteidentifier);
		end if;

		-- SET THE NODE FIELD VALUE TO USE BASED ON PROPERTY
		if (usenodeforsitenameparent = 1) then

			set nodetouse = old.Node;
		else

			set nodetouse = sitename;
		end if;

		-- INSERT NEW SiteParent EVENT INTO alerts.status IF NEW OR UPDATED ScopeIDParent
		if (siteparentfound = 0 or newscopeparentneeded = 1 or scopeparentmoved = 1) then

			-- INSERT SYNTHETIC SiteNameParent EVENT
			insert into alerts.status (
				Identifier,
				Node,
				Class,
				Summary,
				AlertGroup,
				Severity,
				ScopeID,
				SiteName,
				FirstOccurrence,
				LastOccurrence,
				ParentIdentifier,
				Grade,
				OwnerUID,
				OwnerGID)
			values (
				siteidentifier,
				nodetouse,
				99990,
				sitename + ': calculating summary details...',
				'SiteNameParent',
				1,
				scopeid,
				sitename,
				now,
				now,
				scopeidentifier,
				1,
				65534,
				0);
		end if;

		-- LINK CURRENT EVENT TO SiteNameParent
		set old.ParentIdentifier = siteidentifier;
	end if;
end;
go

create or replace trigger correlation_delete_row
group correlation_triggers
priority 15
comment 'Deletes from the master.correlation_* tables where needed'
after delete on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE'
begin

	-- DELETE CORRESPONDING ENTRY IN MASTER CORRELATION TABLE FOR SiteNameParent EVENTS
	if (old.AlertGroup = 'SiteNameParent') then

		delete from master.correlation_sitename where Identifier = old.Identifier;

	-- DELETE CORRESPONDING ENTRY IN MASTER CORRELATION TABLE FOR ScopeIDParent EVENTS
	elseif (old.AlertGroup = 'ScopeIDParent') then

		delete from master.correlation_scopeid where Identifier = old.Identifier;

	end if;

	-- DELETE CORRESPONDING ENTRY IN MASTER CORRELATION TABLE FOR PRIORITY CHILD EVENTS
	delete from master.correlation_priority_children where Identifier = old.Identifier;
end;
go

create or replace trigger webtop_compatibility
group compatibility_triggers
priority 10
comment 'Populates the master.profiles table for the WebGUI to read.\nNote the \n         trigger can be be disabled if no users are permitted to use the interactive SQL tool within the WebGUI'
every 3600 seconds
begin

        -- clean master.profiles
        delete from master.profiles;

        -- Create a row in the master.profiles table for all users
        for each row mpuser in security.users
        begin
                insert into master.profiles ( UID, HasRestriction, Restrict1, Restrict2, Restrict3, Restrict4, AllowISQL )
                        values ( mpuser.UserID, 0, '', '', '', '', 0 );
        end;

        -- Update the users that are allowed to use ISQL
        -- Selects users who are a member of a group which has been assigned a role which has the ISQL permission granted to it.
        for each row isqluser in security.users where isqluser.UserID in ( 
		select UserID from security.group_members where GroupID in ( 
			select GranteeID from security.role_grants where GranteeType = 2 and RoleID in ( 
				select GranteeID from security.permissions where GranteeType = 1 and ObjectType = 1 and ApplicationID = 1 and Object = '' 
                                        and ((Allows & 16777216 ) = 16777216)
                                ) 
                        ) 
                )
        begin
                update master.profiles via isqluser.UserID set AllowISQL = 1;
        end;
end;
go

create or replace trigger hk_set_expiretime
group housekeeping_triggers
enabled false
priority 1
comment 'TRIGGER hk_set_expiretime\n--\nThis trigger sets the ExpireTime field for all events where it is\nnot yet set.  It works in conjunction with the default expire\ntrigger to provide an automated event expiry mechanism.\nDefault expiry thresholds:\n\nCritical events - threshold: HKExpireTimeSev5 (master.properties)\nMajor events - threshold: HKExpireTimeSev4 (master.properties)\nMinor events - threshold: HKExpireTimeSev3 (master.properties)\nWarning events - threshold: HKExpireTimeSev2 (master.properties)\nIndeterminate events - threshold: HKExpireTimeSev1 (master.properties)\n\nClear events are to be ignored by this trigger.\n'
every 599 seconds
when get_prop_value('ActingPrimary') %= 'TRUE'
declare expiretimesev5 integer;
	expiretimesev4 integer;
	expiretimesev3 integer;
	expiretimesev2 integer;
	expiretimesev1 integer;
	counter integer;
begin

	-- INITIALISE VARIABLES TO DEFAULTS
	set expiretimesev5 = 60 * 60 * 24 * 7; -- 7 DAYS
	set expiretimesev4 = 60 * 60 * 24 * 5; -- 5 DAYS
	set expiretimesev3 = 60 * 60 * 24 * 3; -- 3 DAYS
	set expiretimesev2 = 60 * 60 * 24 * 1; -- 1 DAY
	set expiretimesev1 = 60 * 60 * 4; -- 4 HOURS
	set counter = 0;

	-- LOAD ExpireTime PROPERTIES FROM master.properties
	for each row expiretimeprop in master.properties where
		expiretimeprop.Name in (
			'HKExpireTimeSev5', 'HKExpireTimeSev4', 'HKExpireTimeSev3',
			'HKExpireTimeSev2', 'HKExpireTimeSev1')
	begin
		if (expiretimeprop.Name = 'HKExpireTimeSev5') then
			set expiretimesev5 = expiretimeprop.IntValue;
		elseif (expiretimeprop.Name = 'HKExpireTimeSev4') then
			set expiretimesev4 = expiretimeprop.IntValue;
		elseif (expiretimeprop.Name = 'HKExpireTimeSev3') then
			set expiretimesev3 = expiretimeprop.IntValue;
		elseif (expiretimeprop.Name = 'HKExpireTimeSev2') then
			set expiretimesev2 = expiretimeprop.IntValue;
		elseif (expiretimeprop.Name = 'HKExpireTimeSev1') then
			set expiretimesev1 = expiretimeprop.IntValue;
		end if;
	end;

	-- FIND ROWS WHERE ExpireTime IS NOT YET SET AND SET ExpireTime
	-- BASED ON EVENT SEVERITY - IGNORE CLEARED EVENTS - IGNORE SYNTHETIC PARENT EVENTS
	for each row unexpired in alerts.status where
		unexpired.ExpireTime = 0 and
		unexpired.Severity != 0 and
		unexpired.AlertGroup not in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent')
	begin
		-- CRITICAL EVENTS:
		if (unexpired.Severity = 5) then
			set unexpired.ExpireTime = expiretimesev5;
		-- MAJOR EVENTS:
		elseif (unexpired.Severity = 4) then
			set unexpired.ExpireTime = expiretimesev4;
		-- MINOR EVENTS:
		elseif (unexpired.Severity = 3) then
			set unexpired.ExpireTime = expiretimesev3;
		-- WARNING EVENTS:
		elseif (unexpired.Severity = 2) then
			set unexpired.ExpireTime = expiretimesev2;
		-- INDETERMINATE EVENTS:
		elseif (unexpired.Severity = 1) then
			set unexpired.ExpireTime = expiretimesev1;
		end if;

		-- INCREMENT COUNTER
		set counter = counter + 1;
	end;

	-- ADD LOGGING INFORMATION AND SYNTHETIC EVENT
	if (counter != 0) then

		-- ADD A LOG ENTRY TO SELF-MONITORING
		call procedure sm_log('Housekeeping: setting ExpireTime for ' +
			to_char(counter) + ' unset events');

		-- CREATE A SYNTHETIC ALERT TO SHOW PURGE INITIATED
		call procedure sm_insert(
			'OMNIbus ObjectServer : set ExpireTime for unset events for ' +
			getservername(), get_prop_value('Hostname'), 'DBStatus', 2,
			'Housekeeping: setting ExpireTime for ' + to_char(counter) + ' unset events',
			counter, 600, 1);
	end if;
end;
go

create or replace trigger system_watch_shutdown
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer is being shutdown'
on signal shutdown
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Shutdown@'+%signal.node, 'ObjectServer '+%signal.server+' on '+%signal.node+' shutdown at '+to_char(%signal.at), %signal.node, 'SystemWatch', 1, 5, %signal.at, %signal.at, 'nco_objserv', 65534);
end;
go

create or replace trigger system_watch_startup
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer has started'
on signal startup
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Startup@'+%signal.node, 'ObjectServer '+%signal.server+' on '+%signal.node+' started at '+to_char(%signal.at), %signal.node, 'SystemWatch', 2, 5, %signal.at, %signal.at, 'nco_objserv', 65534);
end;
go

create or replace trigger resync_old_events
group failback_triggers
priority 1
comment 'This trigger processes the contents of the table alerts.resync_complete.  For each entry found, this trigger\nwill initiate a flush of all events over the next IDUC cycle.  This is to ensure synchronicity across all ObjectServers\nin particular between the Aggregation ObjectServers.'
every 15 seconds
begin

	-- PERFORM FULL IDUC FLUSH IF ENTRIES DETECTED
	for each row gate_resynched in alerts.resync_complete
	begin

		-- TOUCH ALL EVENTS IN THE OBJECTSERVER TO ENSURE ANY
		-- ROWS THAT ARE NOT IN THE COUNTERPART OBJECTSERVER
		-- GET SENT OVER TO IT INCLUDING JOURNALS AND DETAILS

		update alerts.status set StateChange = getdate();
		update alerts.journal set Serial = Serial;
		update alerts.details set AttrVal = AttrVal;

	end;

	-- CLEAN OUT THE alerts.resync_complete TABLE
	delete from alerts.resync_complete;
end;
go

create or replace trigger detect_agg_gate_resync_complete
group failback_triggers
priority 1
comment 'This trigger detects the moment the faiover Gateway AGG_GATE completes its resychronisation step.\nIt then inserts a row in the table alerts.resync_complete.  The contents of this table is processed by the\ntemporal trigger resync_old_events which updates all events causing them to be flushed to the counterpart\nObjectServer to ensure synchronicity.'
on signal gw_resync_finish
begin

	-- INSERT THE GATEWAY RESYNC COMPLETION FLAG WHEN THE FAILOVER
	-- GATEWAY COMPLETES A RESYNCHRONISATION
	if (%user.description = 'failover_gate') then

		insert into alerts.resync_complete (
			GatewayName)
		values (
			'AGG_GATE');
	end if;
end;
go

create or replace trigger disconnect_all_clients
group failback_triggers
enabled false
priority 2
comment 'Once bidirectional Gateway resynchronisation has completed, disconnect all clients\nexcept for the bidirectional Gateway, Administrator and Web GUI clients.\nThis will cause all connected clients to fail back to the primary ObjectServer AGG_P.\nThis trigger should only be enabled on the backup ObjectServer AGG_B.'
on signal gw_resync_finish
begin

	-- CHECK IF gw_resync_finish IS FROM failover_gate
	if (%user.description = 'failover_gate') then

		ALTER SYSTEM SET 'ActingPrimary' = FALSE;

		-- DISCONNECT ALL CLIENTS EXCEPT FOR THE FAILOVER
		-- GATEWAY OR ADMINISTRATOR SESSIONS
		for each row this_connection in catalog.connections where
			this_connection.AppName <> 'Administrator' and
			this_connection.AppName <> 'WEBTOP' and
			this_connection.AppDescription <> 'failover_gate'
		begin

			alter system drop connection this_connection.ConnectionID;
		end;
	end if;
end;
go

create or replace trigger sm_top_probes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on insert.'
before insert on alerts.status for each row
when %user.app_name = 'PROBE'
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
	insert into master.sm_top_probes ( Identifier, Probe, Hostname, ConnectionID, Tally)
        values ( getservername() + ':' +
			%user.description + ':' +
			%user.host_name + ':' +
			to_char(%user.connection_id),
		%user.description, %user.host_name, %user.connection_id, 1);
end;
go

create or replace trigger sm_process_top_probes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Probes.'
every 300 seconds
declare sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLE
	set sev = 0;
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_probes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_probes TABLE
	for each row this_row in master.sm_top_probes
	begin

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			-- INSERT THE EVENT COUNT EVENT
			call procedure sm_insert(
				'OMNIbus ObjectServer : top Probe event rate for ' +
				this_row.Identifier + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ProbeStatus', 2,
				'Last 5 mins: ' + this_row.Probe + ' Probe on ' +
				this_row.Hostname + ' (ID: ' +
				to_char(this_row.ConnectionID) + '): sent ' +
				to_char(this_row.Tally) + ' event(s)',
				this_row.Tally, 300, 13);
		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF PROBE COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
			set sev = 3;
		elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
			set sev = 4;
		elseif (this_row.Tally >= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW PROBE COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : top Probe event rate for ' +
				this_row.Identifier + ':ALERT',
				get_prop_value('Hostname'), 'ProbeStatus', sev,
				'ALERT: ' + this_row.Probe + ' Probe (Conn ID: ' +
				to_char(this_row.ConnectionID) +
				'): sent high number of events: ' +
				to_char(this_row.Tally), this_row.Tally, 86400, 1);
		end if;
	end;

	-- CLEAN master.sm_top_probes TABLE
	delete from master.sm_top_probes;
end;
go

create or replace trigger sm_db_stats
group self_monitoring_group
priority 11
comment 'Creates synthetic events for ObjectServer DB stats.'
every 60 seconds
declare lastreport int;
	sev int;
	sev3events int;
	sev4events int;
	sev5events int;
	enableinfoevents int;
	deduplicateinfoevents int;
	identifierappendixevents char(255);
	sev3journals int;
	sev4journals int;
	sev5journals int;
	enableinfojournals int;
	deduplicateinfojournals int;
	identifierappendixjournals char(255);
	sev3details int;
	sev4details int;
	sev5details int;
	enableinfodetails int;
	deduplicateinfodetails int;
	identifierappendixdetails char(255);
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR EVENT COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_event_count'
	begin

		set sev3events = thresholds.Sev3;
		set sev4events = thresholds.Sev4;
		set sev5events = thresholds.Sev5;
		set enableinfoevents = thresholds.EnableInfo;
		set deduplicateinfoevents = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfoevents = 0) then

		set identifierappendixevents = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR JOURNAL COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_journal_count'
	begin

		set sev3journals = thresholds.Sev3;
		set sev4journals = thresholds.Sev4;
		set sev5journals = thresholds.Sev5;
		set enableinfojournals = thresholds.EnableInfo;
		set deduplicateinfojournals = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfojournals = 0) then

		set identifierappendixjournals = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR DETAILS COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_details_count'
	begin

		set sev3details = thresholds.Sev3;
		set sev4details = thresholds.Sev4;
		set sev5details = thresholds.Sev5;
		set enableinfodetails = thresholds.EnableInfo;
		set deduplicateinfodetails = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfodetails = 0) then

		set identifierappendixdetails = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_db_stats'
	begin

		-- RETRIEVE AND STORE THE TIMESTAMP OF THE LAST STATS REPORT PROCESSED
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_db_stats';
		
		-- TERMINATE HERE SINCE WE DON'T HAVE ANY PREVIOUS TIMESTAMP
		cancel;
	end if;

	-- RETRIEVE THE LATEST REPORT, IF IT EXISTS, AND INSERT SYNTHETIC EVENTS
	for each row this_row in master.stats where
		this_row.StatTime > lastreport
	begin

		-- FIRST REPORT ON EVENTS IN alerts.status
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfoevents = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW EVENT COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status Database Stats for ' +
				getservername() + ':' + identifierappendixevents,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Event count (alerts.status): ' + to_char(this_row.EventCount),
				this_row.EventCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF EVENT COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.EventCount >= sev3events and this_row.EventCount < sev4events) then
			set sev = 3;
		elseif (this_row.EventCount >= sev4events and this_row.EventCount < sev5events) then
			set sev = 4;
		elseif (this_row.EventCount >= sev5events) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW EVENT COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: event count (alerts.status) is high: ' +
				to_char(this_row.EventCount), this_row.EventCount,
				86400, 1);
		end if;

		-- SECOND REPORT ON JOURNALS IN alerts.journal
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfojournals = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW JOURNAL COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal Database Stats for ' +
				getservername() + ':' + identifierappendixjournals,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Journal count (alerts.journal): ' + to_char(this_row.JournalCount),
				this_row.JournalCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF JOURNAL COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.JournalCount >= sev3journals and this_row.JournalCount < sev4journals) then
			set sev = 3;
		elseif (this_row.JournalCount >= sev4journals and this_row.JournalCount < sev5journals) then
			set sev = 4;
		elseif (this_row.JournalCount >= sev5journals) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW JOURNAL COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: journal count (alerts.journal) is high: ' +
				to_char(this_row.JournalCount),
				this_row.JournalCount, 86400, 1);
		end if;

		-- THIRD REPORT ON DETAILS IN alerts.details
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfodetails = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW DETAILS COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details Database Stats for ' +
				getservername() + ':' + identifierappendixdetails,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Details count (alerts.details): ' + to_char(this_row.DetailCount),
				this_row.DetailCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF DETAILS COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.DetailCount >= sev3details and this_row.DetailCount < sev4details) then
			set sev = 3;
		elseif (this_row.DetailCount >= sev4details and this_row.DetailCount < sev5details) then
			set sev = 4;
		elseif (this_row.DetailCount >= sev5details) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: details count (alerts.details) is high: ' +
				to_char(this_row.DetailCount),
				this_row.DetailCount, 86400, 1);
		end if;

		-- UPDATE THE STORED TIMESTAMP OF THE LATEST REPORT
		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger='sm_db_stats';

		--  LOG TO FILE THE ROW COUNTS
		call procedure sm_log(
			getservername() + ': ' +
			'RowCounts: alerts.status: ' + to_char(this_row.EventCount) +
			', alerts.journal: ' + to_char(this_row.JournalCount) +
			', alerts.details: ' + to_char(this_row.DetailCount));

		break;
	end;
end;
go

create or replace trigger sm_top_classes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on reinsert.'
before reinsert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE REINSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, 1);

	-- ELSE IF IT IS TopClasses INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopClassesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, new.Grade);
	end if;
end;
go

create or replace trigger sm_client_time
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer time spent executing client SQL'
on signal profiler_report
declare total_time real;
	identifierappendix char(255);
	summary_string char(255);
	app_description char(128);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin

	-- INITIALISE VARIABLES
	set total_time = 0;
	set summary_string = '';
	set app_description = '';
	set identifierappendix = '';
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_client_time_individual'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- ITERATE OVER EACH CONNECTED CLIENT THAT HAS SUBMITTED REQUESTS
	for each row profile in catalog.profiles where profile.NumSubmits > 0
	begin

		-- RESET sev
		set sev = 0;

		-- CHECK IF CONNECTED CLIENT TIME THRESHOLD HAS BEEN BREACHED
		if (profile.PeriodSQLTime >= sev3 and profile.PeriodSQLTime < sev4) then
			set sev = 3;
		elseif (profile.PeriodSQLTime >= sev4 and profile.PeriodSQLTime < sev5) then
			set sev = 4;
		elseif ( profile.PeriodSQLTime >= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW CONNECTED CLIENT TIME THRESHOLD BREACH
		if (sev != 0) then

			-- FIND THE AppDescription FOR THE CONNECTION
			for each row this_connection in catalog.connections where
				this_connection.ConnectionID = profile.ConnectionID
			begin

				set app_description = this_connection.AppDescription;
			end;

			if (app_description = '') then

				-- SET THE SUMMARY FIELD WITHOUT AN APP DESCRIPTION
				set summary_string = 'ALERT: ' + profile.AppName +
					' on ' + profile.HostName + ' (ConnID: ' +
					to_char(profile.ConnectionID) + ') used: ' +
					substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';

			elseif (app_description like '^e@') then

				-- SET THE SUMMARY FIELD WITH A NATIVE EVENT LIST ENTRY
				set summary_string = 'ALERT: Native Event List on ' +
					profile.HostName + ' (ConnID: ' +
					to_char(profile.ConnectionID) + ') used: ' +
					substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';
			else

				-- SET THE SUMMARY FIELD WITH A GENERIC APP DESCRIPTION
				set summary_string = 'ALERT: ' + profile.AppName + ': ' +
					app_description + ' on ' + profile.HostName +
					' (ConnID: ' + to_char(profile.ConnectionID) +
					') used: ' + substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';
			end if;

			-- INSERT A SYNTHETIC EVENT
			call procedure sm_insert(
				'OMNIbus ObjectServer : PeriodSQLtime for ' +
				profile.AppName + ':uid=' + to_char(profile.UID) +
				':' + getservername() + ':' + app_description +
				':' + to_char(profile.ConnectionID),
				get_prop_value('Hostname'), 'ClientStatus', sev,
				summary_string, to_int(ceil(profile.PeriodSQLTime)),
				86400, 1);
		end if;

		set total_time = total_time + profile.PeriodSQLTime;
	end;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_client_time_total'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- INSERT A SYNTHETIC EVENT IF ENABLED FOR INFO EVENTS
	if (enableinfo = 1) then

		-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW TOTAL CLIENT TIME
		call procedure sm_insert(
			'OMNIbus ObjectServer : Total SQL time for all clients ' +
			getservername() + ': ' + identifierappendix,
			get_prop_value('Hostname'), 'ClientStatus', 2,
			'Time for all clients in granularity period (' +
			get_prop_value('Granularity') + 's): ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 60, 13);
	end if;

	-- RESET sev
	set sev = 0;

	-- CHECK IF TOTAL CLIENT TIME THRESHOLD HAS BEEN BREACHED
	if (total_time >= sev3 and total_time < sev4) then
		set sev = 3;
	elseif (total_time >= sev4 and total_time < sev5) then
		set sev = 4;
	elseif (total_time >= sev5) then
		set sev = 5;
	end if;

	-- INSERT A SYNTHETIC ALERT TO SHOW TOTAL CLIENT TIME THRESHOLD BREACH
	if (sev != 0) then

		call procedure sm_insert(
			'OMNIbus ObjectServer : Total SQL time for all clients ' +
			getservername(), get_prop_value('Hostname'),
			'ClientStatus', sev,
			'ALERT: Total time for all clients is high: ' +
			substr(to_char(total_time), 1, 5),
			to_int(ceil(total_time)), 86400, 1);
	end if;
end;
go

create or replace trigger sm_process_top_classes
group self_monitoring_group
enabled false
priority 10
comment 'Creates synthetic events for top Classes.'
every 300 seconds
declare sev int;
	class_conv char(64);
	summary_string char(255);
	row_identifier char(255);
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLES
	set sev = 0;
	set class_conv = '';
	set summary_string = '';
	set row_identifier = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_classes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_classes TABLE
	for each row this_row in master.sm_top_classes
	begin

		-- SET IDENTIFIER FOR CURRENT CLASS
		set row_identifier =
			'OMNIbus ObjectServer : top Class event rate for ' +
			to_char(this_row.Class) + ':' + identifierappendix;

		-- SET DEFAULT CLASS CONVERSION
		set class_conv = 'UNKNOWN';

		-- LOOK UP CLASS CONVERSION IN CONVERSIONS TABLE
		for each row this_conversion in alerts.conversions where
			this_conversion.Colname = 'Class' and
			this_conversion.Value = this_row.Class
		begin

			-- SAVE CONVERSION
			set class_conv = this_conversion.Conversion;
			break;
		end;

		-- CONSTRUCT SUMMARY STRING
		set summary_string = 'Last 5 mins: received: ' +
			to_char(this_row.Tally) + ' event(s) of class: ' +
			class_conv + ' (' + to_char(this_row.Class) + ')';

		-- INSERT THE SYNTHETIC EVENTS AT COLLECTION OR AGGREGATION
		if (getservername() like 'AGG') then

			-- INSERT A SYNTHETIC EVENT IF ENABLED
			if (enableinfo = 1) then

				-- INSERT THE SYNTHETIC EVENT FOR CLASS COUNT
				call procedure sm_insert(
					row_identifier, get_prop_value('Hostname'),
					'TopClasses', 2, summary_string,
					this_row.Tally, 300, 13);
			end if;
		
			-- RESET sev
			set sev = 0;

			-- SET EVENT SEVERITY
			if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
				set sev = 3;
			elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
				set sev = 4;
			elseif (this_row.Tally >= sev5) then
				set sev = 5;
			end if;

			-- INSERT A SYNTHETIC ALERT TO SHOW CLASS COUNT THRESHOLD BREACH
			if (sev != 0) then

				call procedure sm_insert(
					'OMNIbus ObjectServer : top Class event rate for ' +
					to_char(this_row.Class) + ':ALERT',
					get_prop_value('Hostname'), 'TopClasses', sev,
					'ALERT: last 5 mins: high number of events for class: ' +
					class_conv + ' (' + to_char(this_row.Class) + '): ' +
					to_char(this_row.Tally), this_row.Tally, 86400, 1);
			end if;

		elseif (getservername() like 'COL') then

			-- SET IDENTIFIER FOR A COLLECTION INSERT
			set row_identifier =
				'OMNIbus ObjectServer : top Class event rate for ' +
				to_char(this_row.Class) + ':' + to_char(getdate()) +
				':COLL' + getservername();

			-- INSERT THE SYNTHETIC EVENT
			call procedure sm_insert(
				row_identifier, get_prop_value('Hostname'), 'TopClassesColl',
				2, summary_string, this_row.Tally, 300, 13);

			-- UPDATE THE CLASS FIELD OF THE NEWLY INSERTED EVENT
			update alerts.status set Class = this_row.Class where
				Identifier = row_identifier;
		end if;

	end;

	-- CLEAN master.sm_top_classes TABLE
	delete from master.sm_top_classes;

	-- CLEAN UP ANY ROWS AT AGGREGATION RECEIVED FROM THE COLLECTION LAYER
	if (getservername() like 'AGG') then

		delete from alerts.status where AlertGroup = 'TopClassesColl';
	end if;
end;
go

create or replace trigger sm_block_events_from_gateway
group self_monitoring_group
priority 1
comment 'TRIGGER: block_sm_events_from_gateway\n--\nThis trigger prevents the self monitoring events from being inserted into the\nDisplay layer ObjectServers from the layers below.  This is to prevent\nduplication of events within the GUI.'
before insert on alerts.status for each row
when getservername() like 'DIS'
begin

	-- DROP SELF-MONITORING EVENTS COMING FROM THE DISPLAY GATEWAY
	if (	%user.description = 'display_gate' and
		(	new.Class = 99999 or
			new.Class = 10500 or
			new.AlertGroup = 'ITNM Status' or
			new.Agent = 'OMNIbus SelfMonitoring' or
			new.Manager like 'Watch')) then

		cancel;
	end if;
end;
go

create or replace trigger sm_connections
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer client connections stats.'
every 60 seconds
declare lastreport int;
	max_connections int;
	avl_connections int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	summary_string  char(255);
	identifierappendix char(255);
	sev int;
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;
	set sev = 0;
	set max_connections = to_int(get_prop_value('Connections'));
	set avl_connections = max_connections;
	set summary_string = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_connections'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_connections'
	begin
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_connections';

		-- TERMINATE HERE
		cancel;
	end if;

	-- RETRIEVE THE LATEST REPORT, IF IT EXISTS, AND UPDATE SYNTHETIC EVENT
	for each row this_row in master.stats where this_row.StatTime > lastreport
	begin

		-- CALCULATE THE NUMBER OF FREE CONNECTIONS
		set avl_connections = max_connections - this_row.NumClients;

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW THE NUMBER OF
			-- AVAILABLE CONNECTIONS
			call procedure sm_insert(
				'OMNIbus ObjectServer : Connections available for ' +
				getservername() + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ConnectionStatus', 2,
				'Used ' + to_char(this_row.NumClients) + ' of ' +
				to_char(max_connections) +
				' connections. Available connections: ' +
				to_char(avl_connections), avl_connections, 300, 13);
		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF EVENT COUNT THRESHOLD HAS BEEN BREACHED
		if (avl_connections <= sev3 and avl_connections > sev4) then
			set sev = 3;
		elseif (avl_connections <= sev4 and avl_connections > sev5) then
			set sev = 4;
		elseif (avl_connections <= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW EVENT COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : Connections available for ' +
				getservername() + ':ALERT',
				get_prop_value('Hostname'), 'ConnectionStatus', sev,
				'ALERT: number of available connections is low: ' +
				to_char(avl_connections), avl_connections, 86400, 1);
		end if;

		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger = 'sm_connections';

		break;
	end;

	-- INSERT SYNTHETIC EVENTS FOR CONNECTIONS IF ENABLED
	if (enableinfo = 1) then

		-- RECREATE CONNECTION SYNTHETIC EVENTS BASED ON CURRENT CONNECTIONS
		for each row client in catalog.connections where
			client.AppName in ('PROBE', 'GATEWAY')
		begin

			-- SET Summary FOR SYNTHETIC EVENT
			set summary_string = client.AppName + ': ' +
				client.AppDescription + ' connected from host ' +
				client.HostName + ' (ID: ' +
				to_char(client.ConnectionID) + ').';

			call procedure sm_insert(
				'probe_gateway_connection_event:' + getservername() +
				':' + client.HostName + ':' +
				to_char(client.ConnectionID) + ':' + client.AppName +
				':' + client.AppDescription + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ConnectionStatus', 2,
				summary_string, client.ConnectionID, 60, 13);
		end;
	end if;

	-- SET FOR EXPIRY ANY ConnectionWatch EVENTS THAT HAVE NOT YET EXPIRED
	update alerts.status set ExpireTime = 86400 where
		ExpireTime = 0 and
		Manager = 'ConnectionWatch';
end;
go

create or replace trigger sm_delete_clears_display
group self_monitoring_group
priority 10
comment 'Delete clear synthetic alerts over 2 minutes old on Display ObjectServers.'
every 60 seconds
when getservername() like 'DIS'
begin

	delete from alerts.status where
		Severity = 0 and
		ServerName = getservername() and
		StateChange < (getdate() - 120);
end;
go

create or replace trigger sm_top_nodes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on reinsert.'
before reinsert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE REINSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, 1);

	-- ELSE IF IT IS TopNodes INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopNodesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, new.Grade);
		-- ROW IN ALERTS.STATUS NOT NEEDED
		cancel;
	end if;
end;
go

create or replace trigger sm_memstore
group self_monitoring_group
priority 10
comment 'Creates synthetic events for memstore stats.'
on signal profiler_report
declare percentage real;
	summary_string char(255);
	identifierappendix char(255);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin

	-- INITIALISE VARIABLES
	set percentage = 0;
	set summary_string = '';
	set identifierappendix = '';
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_memstore'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- CHECK THE MEMSTORE SIZE AND SET THE SEVERITY OF THE
	-- SYNTHETIC EVENT ACCORDINGLY
	for each row row_mem in catalog.memstores where
		row_mem.StoreName = 'table_store'
	begin
		set percentage = (row_mem.UsedBytes * 100 / row_mem.SoftLimit);
		set summary_string = 'table_store soft limit: used ' +
			to_char(to_int(row_mem.UsedBytes/1048576)) +
			' MB of capacity ' +
			to_char(to_int(row_mem.SoftLimit/1048576)) + ' MB (' +
			to_char(to_int(ceil(percentage))) + '% used)';

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : Memstore Status for ' +
				getservername() + identifierappendix,
				get_prop_value('Hostname'), 'MemstoreStatus', 2,
				summary_string, to_int(ceil(percentage)), 60, 13);
		end if;

		-- CHECK IF MEMSTORE THRESHOLD HAS BEEN BREACHED
		if (percentage >= sev3 and percentage < sev4) then
			set sev = 3;
			set summary_string = 'ALERT: ' + summary_string;
		elseif (percentage >= sev4 and percentage < sev5) then
			set sev = 4;
			set summary_string = 'ALERT: ' + summary_string;
		elseif (percentage >= sev5) then
			set sev = 5;
			set summary_string = 'ALERT: extend soft limit: ' + summary_string;
		end if;

		-- IF THRESHOLD HAS BEEN BREACHED
		if (sev != 0) then

			-- INSERT A SYNTHETIC ALERT
			call procedure sm_insert('ALERT: OMNIbus ObjectServer : Memstore Status for ' +
				getservername(), get_prop_value('Hostname'),
				'MemstoreStatus', sev, summary_string,
				to_int(ceil(percentage)), 86400, 1);
		end if;
	 end;
end;
go

create or replace trigger sm_triggers
group self_monitoring_group
priority 10
comment 'Creates synthetic events for Objectserver Trigger stats.'
on signal profiler_report
declare total_time real;
	identifierappendix char(255);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin
	set total_time = 0;
	set identifierappendix = '';
	set sev = 0;

	-- GET TRIGGER TIME THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_individual'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- FOR EACH ENABLED TRIGGER GROUP
	for each row trigger_group in catalog.trigger_groups where trigger_group.IsEnabled = true
	begin

		-- CHECK THE TRIGGER TIMES FOR EACH ACTIVE TRIGGER IN THAT GROUP
		for each row trig in catalog.trigger_stats
			where trig.TriggerName in (
				select TriggerName from catalog.triggers where
					IsEnabled = true and
					GroupName = trigger_group.GroupName)
		begin

			-- ADD CURRENT TRIGGER TIME TO THE RUNNING TOTAL
			set total_time = total_time + trig.PeriodTime;

			-- GENERATE SYNTHETIC EVENTS FOR INDIVIDUAL TRIGGERS OVER THRESHOLD
 			if (trig.PeriodTime >= sev3) then

				-- SET SEVERITY OF SYNTHETIC EVENTS
				if (trig.PeriodTime >= sev3 and trig.PeriodTime < sev4) then
					set sev = 3;
				elseif (trig.PeriodTime >= sev4 and trig.PeriodTime < sev5) then
					set sev = 4;
				elseif (trig.PeriodTime >= sev5) then
					set sev = 5;
				end if;

				-- INSERT A SYNTHETIC EVENT FOR THIS TRIGGER
				call procedure sm_insert(
					'OMNIbus ObjectServer : Trigger Status for ' +
					getservername() + ':' + trig.TriggerName,
					get_prop_value('Hostname'), 'TriggerStatus',
					sev, 'ALERT: ' + trig.TriggerName +
					': trigger time is high: ' +
					substr(to_char(trig.PeriodTime), 1, 5) +
					' seconds', to_int(ceil(trig.PeriodTime)),
					86400, 1);
			end if;
		end;
	end;

	-- GET TOTAL TRIGGER TIME THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_total'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- INSERT A SYNTHETIC EVENT IF ENABLED FOR INFO EVENTS
	if (enableinfo = 1) then

		-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW TOTAL TRIGGER TIME
		call procedure sm_insert(
			'OMNIbus ObjectServer: Trigger Status for ' +
			getservername() + ': ' + identifierappendix,
			get_prop_value('Hostname'), 'TriggerStatus', 2,
			'Time for all triggers in profiling period (' +
			substr(to_char(%signal.report_period), 1, 5) + 's): ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 60, 13);
	end if;

	-- RESET sev
	set sev = 0;

	-- CHECK IF TOTAL TRIGGER TIME THRESHOLD HAS BEEN BREACHED
	if (total_time >= sev3 and total_time < sev4) then
		set sev = 3;
	elseif (total_time >= sev4 and total_time < sev5) then 
		set sev = 4;
	elseif (total_time >= sev5) then 
		set sev = 5;
	end if;
	
	-- INSERT A SYNTHETIC ALERT TO SHOW TOTAL TRIGGER TIME THRESHOLD BREACH
	if (sev != 0) then

		call procedure sm_insert(
			'OMNIbus ObjectServer: Trigger Status for ' +
			getservername(), get_prop_value('Hostname'),
			'TriggerStatus', sev,
			'ALERT: Time for all triggers in profiling period is high: ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 86400, 1);
	end if;

	-- GET REPORTING PERIOD THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_reporting_period'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- RESET sev
	set sev = 0;

	-- CHECK IF REPORTING PERIOD THRESHOLD HAS BEEN BREACHED
	if (%signal.report_period >= sev3 and %signal.report_period < sev4) then
		set sev = 3;
	elseif (%signal.report_period >= sev4 and %signal.report_period < sev5) then
		set sev = 4;
	elseif (%signal.report_period >= sev5) then
		set sev = 5;
	end if;

	-- INSERT A SYNTHETIC ALERT TO SHOW REPORTING PERIOD THRESHOLD BREACH
	if (sev != 0) then

		-- INSERT A SYNTHETIC EVENT
		call procedure sm_insert(
			'OMNIbus ObjectServer : Profiler Report Status for '
			+ getservername(), get_prop_value('Hostname'),
			'TriggerStatus', sev,
			'ALERT: ObjectServer profiling period high: ' +
			substr(to_char(%signal.report_period), 1, 5) + ' seconds',
			to_int(ceil(%signal.report_period)), 86400, 1);
	end if;
end;
go

create or replace trigger sm_top_nodes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on insert.'
before insert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE INSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, 1);

	-- ELSE IF IT IS TopNodes INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopNodesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, new.Grade);
		-- ROW IN ALERTS.STATUS NOT NEEDED
		cancel;
	end if;
end;
go

create or replace trigger sm_top_classes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_classes table.'
before reinsert on master.sm_top_classes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + new.Tally;
end;
go

create or replace trigger sm_top_probes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on reinsert.'
before reinsert on alerts.status for each row
when %user.app_name = 'PROBE'
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
	insert into master.sm_top_probes ( Identifier, Probe, Hostname, ConnectionID, Tally)
        values ( getservername() + ':' +
			%user.description + ':' +
			%user.host_name + ':' +
			to_char(%user.connection_id),
		%user.description, %user.host_name, %user.connection_id, 1);
end;
go

create or replace trigger sm_top_probes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_probes table.'
before reinsert on master.sm_top_probes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + 1;
end;
go

create or replace trigger sm_expire_display_events
group self_monitoring_group
priority 10
comment 'Expire local self monitoring events on Display ObjectServers.'
every 61 seconds
when getservername() like 'DIS'
begin

	-- FIND LOCALLY GENERATED SELF MONITORING EVENTS THAT ARE DUE FOR EXPIRY
	for each row expire in alerts.status where
		expire.Severity != 0 and
		expire.ExpireTime != 0 and
		expire.LastOccurrence < (getdate() - expire.ExpireTime) and
		expire.ServerName = getservername()
	begin

		-- CLEAR EXPIRED EVENTS
		set expire.Severity = 0;
	end;
end;
go

create or replace trigger sm_dbops_stats
group self_monitoring_group
priority 10
comment 'Creates synthetic events for DB operations stats.'
every 60 seconds
declare lastreport int;
	sev int;

	last_StatusInserts int;
	last_JournalInserts int;
	last_DetailsInserts int;
	StatusInserts int;
	JournalInserts int;
	DetailsInserts int;

	sev3statusinserts int;
	enableinfo_si int;
	deduplicateinfo_si int;
	identifierappendix_si char(255);

	sev3journalinserts int;
	enableinfo_ji int;
	deduplicateinfo_ji int;
	identifierappendix_ji char(255);

	sev3detailsinserts int;
	enableinfo_di int;
	deduplicateinfo_di int;
	identifierappendix_di char(255);
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;

	set last_StatusInserts = 0; 
	set last_JournalInserts = 0;
	set last_DetailsInserts = 0;

	set StatusInserts = 0;
	set JournalInserts = 0;
	set DetailsInserts = 0;

	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR STATUS INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_status_inserts'
	begin

		set sev3statusinserts = thresholds.Sev3;
		set enableinfo_si = thresholds.EnableInfo;
		set deduplicateinfo_si = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_si = 0) then

		set identifierappendix_si = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR JOURNAL INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_journal_inserts'
	begin

		set sev3journalinserts = thresholds.Sev3;
		set enableinfo_ji = thresholds.EnableInfo;
		set deduplicateinfo_ji = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_ji = 0) then

		set identifierappendix_ji = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR DETAILS INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_details_inserts'
	begin

		set sev3detailsinserts = thresholds.Sev3;
		set enableinfo_di = thresholds.EnableInfo;
		set deduplicateinfo_di = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_di = 0) then

		set identifierappendix_di = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_dbops_stats'
	begin

		-- RETRIEVE AND STORE THE TIMESTAMP OF THE LAST STATS REPORT PROCESSED
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
        -- not used?
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_dbops_stats';

		-- TERMINATE HERE
		cancel;
	end if;

	-- RETRIEVE THE PREVIOUS REPORT VALUES
	for each row last in master.stats where last.StatTime = lastreport
	begin

 		set last_StatusInserts = last.StatusInserts;
		set last_JournalInserts = last.JournalInserts;
		set last_DetailsInserts = last.DetailsInserts;
	end;

	-- FIND THE LATEST REPORT, IF IT EXISTS, AND UPDATE SYNTHETIC EVENT
	for each row this_row in master.stats where this_row.StatTime > lastreport
	begin
		
		-- CALCULATE THE DELTA BETWEEN THE LAST REPORT AND LATEST REPORT
		set StatusInserts = this_row.StatusInserts - last_StatusInserts;
		set JournalInserts = this_row.JournalInserts - last_JournalInserts;
		set DetailsInserts = this_row.DetailsInserts - last_DetailsInserts;

		-- FIRST REPORT ON NUMBER OF INSERTS INTO alerts.status
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_si = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.status INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status DB operations stats for ' +
				getservername() + ':' + identifierappendix_si,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.status (inserts/deduplications): ' +
				to_char(StatusInserts), StatusInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (StatusInserts >= sev3statusinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.status inserts/deduplications are high: ' +
				to_char(StatusInserts), StatusInserts, 86400, 1);
		end if;

		-- SECOND REPORT ON NUMBER OF INSERTS INTO alerts.journal
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_ji = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.journal INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal DB operations stats for ' +
				getservername() + ':' + identifierappendix_ji,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.journal (inserts): ' + to_char(JournalInserts),
				JournalInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW JOURNAL COUNT THRESHOLD BREACH
		if (JournalInserts >= sev3journalinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.journal inserts are high: ' +
				to_char(JournalInserts), JournalInserts, 86400, 1);
		end if;

		-- THIRD REPORT ON NUMBER OF INSERTS INTO alerts.details
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_di = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.details INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details DB operations stats for ' +
				getservername() + ':' + identifierappendix_di,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.details (inserts): ' + to_char(DetailsInserts),
				DetailsInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (DetailsInserts >= sev3detailsinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.details inserts are high: ' +
				to_char(DetailsInserts), DetailsInserts, 86400, 1);
		end if;

		-- LOG TO FILE THE TABLE METRICS
		call procedure sm_log(
			getservername() + ': ' +
			'InsertCounts: Last 5 mins: alerts.status (inserts/deduplications): ' +
			to_char(StatusInserts)  + ', alerts.journal (inserts): ' +
			to_char(JournalInserts) + ', alerts.details (inserts): ' +
			to_char(DetailsInserts));

		-- UPDATE THE LAST REPORT TIME
		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger='sm_dbops_stats';

		break;
	end;
end;
go

create or replace trigger sm_deduplication_grade
group self_monitoring_group
priority 10
comment 'Updates Grade, ExpireTime and Acknowledged fields on deduplication\nof self-monitoring events.'
before reinsert on alerts.status for each row
when old.Class = 99999
begin

	-- UPDATE Grade FIELD ON DEDUPLICATION OF SELF MONITORING EVENTS
	set old.Grade = new.Grade;
	
	-- UPDATE ExpireTime FIELD ON DEDUPLICATION OF SELF MONITORING EVENTS
	set old.ExpireTime = new.ExpireTime;

	-- UNACKNOWLEDGE EVENT IF IT IS ACKNOWLEDGED
	set old.Acknowledged = 0;
end;
go

create or replace trigger sm_log_alert_inserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before insert on alerts.status for each row
when new.Class = 99999 and new.Summary like 'ALERT'
begin


	-- WRITE A LOG MESSAGE
	call procedure sm_log(new.ServerName + ': ' + new.AlertGroup + ': ' + new.Summary);
end;
go

create or replace trigger sm_process_top_nodes
group self_monitoring_group
enabled false
priority 10
comment 'Creates synthetic events for top Nodes.'
every 300 seconds
declare sev		int;
	summary_string	char(255);	
	row_identifier	char(255);
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLES
	set sev = 0;
	set summary_string = '';
	set row_identifier = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_nodes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_nodes TABLE
	for each row this_row in master.sm_top_nodes
	begin

		-- SET IDENTIFIER FOR CURRENT NODE
		set row_identifier =
			'OMNIbus ObjectServer : top Node event rate for ' +
			this_row.Node + ':' + identifierappendix;

		-- CONSTRUCT SUMMARY STRING
		set summary_string = 'Last 5 mins: ' + this_row.Node + ' sent ' +
			to_char(this_row.Tally) + ' event(s)';

		-- INSERT THE SYNTHETIC EVENT AT COLLECTION OR AGGREGATION
		if (getservername() like 'AGG') then

			-- INSERT A SYNTHETIC EVENT IF ENABLED
			if (enableinfo = 1) then

				-- INSERT THE SYNTHETIC EVENT FOR CLASS COUNT
				call procedure sm_insert(
					row_identifier, this_row.Node, 'TopNodes', 2,
					summary_string, this_row.Tally, 300, 13);
			end if;

			-- RESET sev
			set sev = 0;

			-- CHECK IF NODE COUNT THRESHOLD HAS BEEN BREACHED
			if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
				set sev = 3;
			elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
				set sev = 4;
			elseif (this_row.Tally >= sev5) then
				set sev = 5;
			end if;

			-- INSERT A SYNTHETIC ALERT TO SHOW NODE COUNT THRESHOLD BREACH
			if (sev != 0) then

				call procedure sm_insert(
					'OMNIbus ObjectServer : top Node event rate for ' +
					this_row.Node + ':ALERT', this_row.Node, 'TopNodes',
					sev, 'ALERT: last 5 mins: high number of events sent by: ' +
					this_row.Node + ': ' + to_char(this_row.Tally),
					this_row.Tally, 86400, 1);
			end if;

		elseif (getservername() like 'COL') then

			-- SET IDENTIFIER FOR A COLLECTION INSERT
			set row_identifier =
				'OMNIbus ObjectServer : top Node event rate for ' +
				this_row.Node + ':' + to_char(getdate()) +
				':COLL' + getservername();

			call procedure sm_insert(
				row_identifier, this_row.Node, 'TopNodesColl', 2,
				summary_string, this_row.Tally, 300, 13);
		end if;
	end;

	-- CLEAN master.sm_top_nodes TABLE
	delete from master.sm_top_nodes;

	-- CLEAN UP ANY ROWS AT AGGREGATION RECEIVED FROM THE COLLECTION LAYER
	if (getservername() like 'AGG') then

		delete from alerts.status where AlertGroup = 'TopNodesColl';
	end if;
end;
go

create or replace trigger sm_top_classes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on insert.'
before insert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE INSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, 1);

	-- ELSE IF IT IS TopClasses INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopClassesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, new.Grade);
	end if;
end;
go

create or replace trigger sm_top_nodes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_nodes table.'
before reinsert on master.sm_top_nodes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + new.Tally;
end;
go

create or replace trigger sm_check_probe_heartbeats
group self_monitoring_group
priority 10
comment 'Check Probe heartbeat events and raise Severity of ones that have not heartbeated for more than 3 minutes.'
every 60 seconds
when get_prop_value('ActingPrimary') %= 'TRUE' and getservername() like 'AGG'
begin

	-- LOOK FOR UNCLEARED PROBE HEARTBEAT EVENTS THAT HAVE MISSED 3 OR MORE HEARTBEATS
	for each row heartbeat in alerts.status where
		heartbeat.Severity != 0 and
		heartbeat.LastOccurrence < (getdate() - 180) and
		heartbeat.Manager = 'ProbeWatch' and
		heartbeat.Identifier like 'Heartbeat'
	begin

		-- UPDATE SUMMARY AND SEVERITY
		set heartbeat.Summary =
			heartbeat.AlertKey + ' probe on ' +
			heartbeat.Node + ': ALERT: no heartbeat for current PID for ' +
			to_char(to_int((getdate() - heartbeat.LastOccurrence) / 60)) +
			' minutes.';

		set heartbeat.Severity = 3;
	end;
end;
go

create or replace trigger sm_create_journal_on_severity_change
group self_monitoring_group
priority 1
comment 'Inserts a journal for ALERT events if the Severity is updated.'
before reinsert on alerts.status for each row
when old.Class = 99999 and old.Type = 1 and (old.Severity != new.Severity)
declare old_conversion char(255);
	new_conversion char(255);
	journal_string char(255);
begin

	-- SET OLD SEVERITY TEXT
	if (old.Severity = 5) then
		set old_conversion = 'Critical';
	elseif (old.Severity = 4) then
		set old_conversion = 'Major';
	elseif (old.Severity = 3) then
		set old_conversion = 'Minor';
	elseif (old.Severity = 2) then
		set old_conversion = 'Warning';
	elseif (old.Severity = 1) then
		set old_conversion = 'Indeterminate';
	elseif (old.Severity = 0) then
		set old_conversion = 'Clear';
	end if;

	-- SET NEW SEVERITY TEXT
	if (new.Severity = 5) then
		set new_conversion = 'Critical';
	elseif (new.Severity = 4) then
		set new_conversion = 'Major';
	elseif (new.Severity = 3) then
		set new_conversion = 'Minor';
	elseif (new.Severity = 2) then
		set new_conversion = 'Warning';
	elseif (new.Severity = 1) then
		set new_conversion = 'Indeterminate';
	elseif (new.Severity = 0) then
		set new_conversion = 'Clear';
	end if;

	-- START BUILDING JOURNAL STRING
	set journal_string = 'Severity has been ';

	-- CHECK IF SEVERITY IS GOING UP OR DOWN
	if (old.Severity < new.Severity) then

		set journal_string = journal_string + 'upgraded ';

	else
		set journal_string = journal_string + 'downgraded ';
	end if;

	-- COMPLETE JOURNAL STRING
	set journal_string =  journal_string + 'from ' + old_conversion +
		' (' + to_char(old.Severity) + ') to ' + new_conversion +
		' (' + to_char(new.Severity) + ').  The metric was: ' + to_char(old.Grade) +
		' and is now: ' + to_char(new.Grade) + '.';

	-- INSERT JOURNAL
	call procedure jinsert(
		old.Serial,
		%user.user_id,
		getdate(),
		journal_string);
	
end;
go

create or replace trigger sm_time_to_display_severity
group self_monitoring_group
priority 10
comment 'This trigger adjusts the Severity of time to display events based on the metric.'
every 61 seconds
when getservername() like 'DIS'
declare sev3 int;
	sev4 int;
	sev5 int;
begin

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_time_to_display'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- FIND TIME TO DISPLAY EVENTS
	for each row ttd in alerts.status where
		ttd.Identifier = 'time_to_display'
	begin

		-- MODIFY SEVERITY BASED ON NUMBER
		if (ttd.Grade < sev3) then
			set ttd.Severity = 2;
		elseif ((ttd.Grade >= sev3) and (ttd.Grade < sev4)) then
			set ttd.Severity = 3;
		elseif ((ttd.Grade >= sev4) and (ttd.Grade < sev5)) then
			set ttd.Severity = 4;
		elseif (ttd.Grade >= sev5) then
			set ttd.Severity = 5;
		end if;
	end;
end;
go

create or replace trigger sm_log_alert_reinserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before reinsert on alerts.status for each row
when new.Class = 99999 and new.Summary like 'ALERT'
begin


	-- WRITE A LOG MESSAGE
	call procedure sm_log(new.ServerName + ': ' + new.AlertGroup + ': ' + new.Summary);
end;
go

create or replace trigger re_remove_dangling_parentEvent
group ibm_re_triggers
priority 20
comment 'drop the severity of a synthetic event from impact that have no children'
every 20 seconds
declare i int;
begin
      set i = 0 ;
      update alerts.status set Severity = 0 where Severity <> 0 and
        Manager = 'Related Events'
        and Identifier not in (select ParentIdentifier from alerts.status)
end;
go

create or replace trigger update_service_affecting_events
group sae
enabled false
priority 1
comment 'Update Service Affecting Events'
every 60 seconds
evaluate -- group by is used for "select distinct"
        select ServiceEntityId, count(*)
        from precision.entity_service
        -- there must be an nmos-id in alerts.status for this service-id
        where NmosEntityId in
                (select NmosEntityId from alerts.status
                 where NmosEntityId != 0 and Severity = 5)
        group by ServiceEntityId
bind as services
begin
        -- since we can't do a for each row on a transtable
        -- with a where clause, we first populate a virtual table
        delete from precision.service_affecting_event;

        for each row serv in services
        begin
                insert into precision.service_affecting_event
                values (serv.ServiceEntityId);
        end;

        -- service_affecting_event now contains all the service-ids for which a
        -- service affecting event should exist.

        -- first delete any sae which shouldn't exist; could make
        -- alerts.status smaller
        delete from alerts.status
        where Class = 8001
        and NmosEntityId not in
                (select ServiceEntityId from precision.service_affecting_event);

        -- retrieve the details of the service
        for each row serv_detail in precision.service_details
        where
                serv_detail.ServiceEntityId in
                (select ServiceEntityId from precision.service_affecting_event)
        and
                serv_detail.ServiceEntityId not in
                (select NmosEntityId from alerts.status where Class = 8001)
        begin
                -- create sae for service
                insert into alerts.status (Identifier,
                        NmosEntityId, Severity, ServerName,
                        Summary, Manager, Class,
                        FirstOccurrence, LastOccurrence,
                        AlertGroup, OwnerUID, Type, EventId, NmosDomainName)
                values
                        ('SAE for ' + serv_detail.Name + '-' +
                                serv_detail.Customer,
                        serv_detail.ServiceEntityId,
                        4,
                        getservername,
                        serv_detail.Type + ' ' + serv_detail.Name +
                        ' affected (' + serv_detail.Customer + ')',
                        'Service Automation',
                        8001,
                        getdate, getdate,
                        'nco_objserv', 65534, 1, serv_detail.Type,
			serv_detail.NmosDomainName );
        end;

end;
go

create or replace trigger deduplication
group default_triggers
enabled false
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.status for each row
begin

	if( %user.app_name = 'PROBE' )
	then
		if( (old.LastOccurrence > new.LastOccurrence) or 
		   ((old.ProbeSubSecondId >= new.ProbeSubSecondId) and 
	  	    (old.LastOccurrence = new.LastOccurrence) ) )
		then
			cancel;
		end if;
	end if;

	set old.Tally = old.Tally + 1;
	set old.LastOccurrence =  new.LastOccurrence;
	set old.StateChange = getdate();
	set old.InternalLast = getdate();
	set old.Summary = new.Summary;
	set old.AlertKey = new.AlertKey;
	set old.ProbeSubSecondId = new.ProbeSubSecondId;
	if (old.ResolveStatus = 1)
	then
		set old.ResolveStatus = 0;
	end if;
	if (( old.Severity = 0) and (new.Severity > 0) and (old.Grade =0))
	then
		set old.Severity = new.Severity;
	end if;
end;
go

create or replace trigger accelerated_inserts
group default_triggers
priority 1
comment 'Fast track inserts from alerts.status to higher tiers in a tiered environment'
after insert on alerts.status for each row
begin
	-- FAST TRACK ALL INSERTS TO THE NEXT TIER
	IDUC EVTFT 'accelerated_inserts', insert, new;
end;
go

create or replace trigger agg_deduplication
group default_triggers
priority 2
comment 'Replacement reinsert trigger (alerts.status) for multi-ObjectServer environments.'
before reinsert on alerts.status for each row
declare now utc;
begin

	-- USE A TEMPORARY VARIABLE TO STORE THE CURRENT TIMESTAMP
	set now = getdate();

	-- CANCEL ATTEMPTS BY PROBES TO REINSERT OLD EVENTS
	if (%user.app_name = 'PROBE') then

		if ((old.LastOccurrence > new.LastOccurrence) or
			((old.ProbeSubSecondId >= new.ProbeSubSecondId) and
			(old.LastOccurrence = new.LastOccurrence))) then

			cancel;
		end if;
	end if;

	-- IF REINSERT IS COMING FROM A FAILOVER GATEWAY
	if (%user.description = 'failover_gate') then

		set row old = new;

	-- ELSE REINSERT IS NOT COMING FROM A FAILOVER GATEWAY
	else

		-- IF REINSERT IS COMING FROM A COLLECTION GATEWAY
		if (%user.description = 'collection_gate') then

			-- ADD INCOMING TALLY TO CURRENT TOTAL
			set old.Tally = old.Tally + new.Tally;

		-- ELSE REINSERT IS NOT COMING FROM ANY GATEWAY
		else

			-- SIMPLY INCREMENT TALLY
			set old.Tally = old.Tally + 1;
		end if;

		-- SET LastOccurrence IF NOT SET
		if (new.LastOccurrence = 0) then

			set old.LastOccurrence = now;

		-- ELSE USE THE INCOMING VALUE
 		else 

			set old.LastOccurrence = new.LastOccurrence;
		end if;

		-- UPDATE THE FOLLOWING FIELDS ON DEDUPLICATION
		set old.Type = new.Type;
		if (old.Grade = 0) then
			set old.Summary = new.Summary;
		end if;
		set old.AlertKey = new.AlertKey;
		set old.ProbeSubSecondId = new.ProbeSubSecondId;

		------------------------------------------
		-- HANDLE SEVERITY UPDATE ON DEDUPLICATION
		------------------------------------------

		-- DEFAULT - UPDATE ALWAYS
		if (old.NmosCauseType = 0 and old.Grade = 0) then

			set old.Severity = new.Severity;

			------------------------------------------
			-- REAWAKEN CLOSED ONLY - UPDATE ONLY IF CLEAR
			--
			-- if ((old.Severity = 0) and (new.Severity > 0)) then
			--
			--	set old.Severity = new.Severity;
			-- end if; 
			------------------------------------------

		-- ITNM RCA EVENTS:
		-- UPDATE SEVERITY ONLY IF EXISTING SEVERITY IS CLEAR
		elseif ((old.Severity = 0) and new.Severity > 0) then

			set old.Severity = new.Severity;
		end if;

		--Used by Resolve to determine if event has realarmed
		if (old.ResolveStatus > 0) then 
			set old.ResolveStatus = 0;
		end if;
	end if;

	-- UPDATE THE FOLLOWING WITH THE CURRENT TIMESTAMP
	set old.StateChange = now;
	set old.InternalLast = now;
end;
go

create or replace trigger device_counter_recopy_classes_to_devices
group default_triggers
priority 20
comment 'Recopy classes to the device_types table after creation of a new class.'
after insert on alerts.conversions for each row
begin

	-- RECOPY CLASSES TO master.device_types TABLE
	EXECUTE device_counter_copy_classes_to_devices;

end;
go

create or replace trigger device_counter_types_table_deduplication
group default_triggers
priority 2
comment 'Gracefully handles attempted deduplications into the master.device_types table.'
before reinsert on master.device_types for each row
begin

	-- CANCEL ATTEMPTS TO REINSERT INTO THIS TABLE
	cancel;

end;
go

create or replace trigger service_update
group default_triggers
priority 1
comment 'Service processing for service.status'
before update on service.status for each row
declare time_now time;
begin
	set time_now = getdate();

	if ( old.CurrentState != new.CurrentState )
	then
		set new.StateChange = time_now;
	end if;

	if ( new.CurrentState = 0 )
	then
		set new.LastGoodAt = time_now;
	elseif ( new.CurrentState = 1 )
	then
		set new.LastMarginalAt = time_now;
	elseif ( new.CurrentState = 2 )
	then
		set new.LastBadAt = time_now;
	end if;

	set new.LastReportAt = time_now;
end;
go

create or replace trigger device_counter_process_counter_events
group default_triggers
priority 20
comment 'Periodically process the event counter events received from the Collection layer.'
every 300 seconds
declare counter int;
	thisnode char(64);
	thisclass int;
	device_type int;
begin

	-- PROCESS ANY DEVICE COUNT EVENTS PRESENT
	for each row device_event in alerts.status where
		device_event.AlertGroup = 'Collection Device Counter'
	begin

		-- ITERATE OVER STORED DEVICE COUNTS
		for counter = 0 to device_event.Grade do
		begin

			-- ONLY PROCESS EVERY EVEN ENTRY
			if (mod(counter, 2) = 0) then

				-- SELECT NODE
				set thisnode = nvp_get(device_event.ExtendedAttr,
					to_char(counter));

				-- SELECT CLASS
				set thisclass = to_int(nvp_get(device_event.ExtendedAttr,
					to_char(counter + 1)));

				-- INITIALISE DEVICE TYPE
				set device_type = 0;

				-- LOCATE DEVICE TYPE IN master.device_types TABLE
				for each row DeviceRow in master.device_types where
					DeviceRow.Class = thisclass
				begin

					-- SET device_type
					set device_type = DeviceRow.DeviceType;
				end;

				-- ONLY INSERT NON-EXEMPT TYPES
				if (device_type != 9) then

					-- INSERT INTO master.devices
					insert into master.devices (
						Node,
						Class,
						DeviceType,
						LastReceived)
					values (
						thisnode,
						thisclass,
						device_type,
						getdate());
				end if;
			end if;
		end;
	end;

	-- DELETE PROCESSED DEVICE COUNT EVENTS
	delete from alerts.status where AlertGroup = 'Collection Device Counter';
end;
go

create or replace trigger xiny_on_insert
group default_triggers
priority 3
comment '\nX IN Y - INSERT CHECK\n---------------------\nThis trigger causes timestamps to be collected every time an occurrence of an\nevent is received where all of the following are true:\n\n - this ObjectServer is the current acting primary\n - the field XEvents contains a valid non-zero value\n - the field YSeconds contains a valid non-zero value\n - the incoming event is not clear (Severity = 0)\n - the insert is not coming from an ObjectServer Gateway\n\nX in Y thresholding calculations are then done on the values stored in XinY.'
before insert on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE' and new.XEvents <> 0 and new.YSeconds <> 0 and new.Severity <> 0
declare BreachDetected INTEGER;
begin

	-- ONLY ADD AN ENTRY TO XinY IF INSERT IS NOT COMING FROM A GATEWAY
	if (%user.description not in ('collection_gate', 'failover_gate')) then

		-- ADD AN ENTRY TO THE XinY ARRAY
		execute xiny_add_timestamp (
			new.XinY,
			new.NumXinY,
			new.XEvents,
			new.YSeconds,
			0);
	end if;

	-- INITIALISE VARIABLE
	set BreachDetected = 0;

	-- PERFORM AN XinY THRESHOLD BREACH CALCULATION
	execute xiny_calculate_breach (
		new.XinY,
		new.NumXinY,
		new.XEvents,
		new.YSeconds,
		BreachDetected);

	-- ESCALATE EVENT IF BREACH DETECTED
	if (BreachDetected = 1) then


		-- INSERT JOURNAL ENTRY TO INDICATE WHEN THE BREACH WAS DETECTED
		execute jinsert (
			new.Serial,
			%user.user_id,
			getdate,
			'Event escalated by XinY due to receiving ' +
				to_char(new.XEvents) +
				' occurrences of this event within ' +
				to_char(new.YSeconds) + ' seconds.');

		-- MARK THE EVENT AS ESCALATED - DEFAULT
		set new.SuppressEscl = 1;

		------------------------------------------
		-- PUT CUSTOM ESCALATION ACTIONS HERE
		------------------------------------------

		-- EXAMPLE: -- RAISE SEVERITY
		-- EXAMPLE: set new.Severity = 5;
		-- 	    ...
		set new.Severity = 5;
		------------------------------------------

	end if;
end;
go

create or replace trigger device_counter_new_row
group default_triggers
priority 20
comment 'Inserts into master.devices on insert into alerts.status.'
before insert on alerts.status for each row
declare device_type int;
begin

	-- INITIALISE VARIABLE
	set device_type = 0;

	-- SET EXEMPT CLASS FOR LOCALLY GENERATED EVENTS WHERE CLASS IS NOT SET
	if (new.Class = 0 and new.Node = get_prop_value('Hostname')) then

		set new.Class = 99990;
	end if;

	-- LOCATE DEVICE TYPE IN master.device_types TABLE
	for each row DeviceRow in master.device_types where
		DeviceRow.Class = new.Class
	begin

		-- SET device_type
		set device_type = DeviceRow.DeviceType;
	end;

	-- ONLY INSERT NON-EXEMPT TYPES
	if (device_type != 9) then

		-- INSERT INTO master.devices
		insert into master.devices (
			Node,
			Class,
			DeviceType,
			LastReceived)
		values (
			new.Node,
			new.Class,
			device_type,
			getdate());
	end if;
end;
go

create or replace trigger device_counter_table_deduplication
group default_triggers
priority 2
comment 'Update the last received timestamp on deduplication in the master.devices table.'
before reinsert on master.devices for each row
begin

	-- UPDATE THE LastReceived TIMESTAMP ON DEDUPLICATION
	set old.LastReceived = new.LastReceived;

end;
go

create or replace trigger xiny_on_reinsert
group default_triggers
priority 3
comment '\nX IN Y - REINSERT CHECK\n-----------------------\nThis trigger causes timestamps to be collected every time an occurrence of an\nevent is received where all of the following are true:\n\n - this ObjectServer is the current acting primary\n - the field XEvents contains a valid value\n - the field YSeconds contains a valid value\n - the incoming event is not clear (Severity = 0)\n\nValues coming from from the Collection layer must be merged with the existing\nvalue set stored in XinY.\n\nValues coming from the failover Gateway will replace the existing row via the\nagg_deduplication trigger.\n\nX in Y thresholding calculations are then done on the values stored in XinY.'
before reinsert on alerts.status for each row
when get_prop_value('ActingPrimary') %= 'TRUE' and new.XEvents <> 0 and new.YSeconds <> 0 and new.Severity <> 0
declare MyNumValues INTEGER;
	MyCounter INTEGER;
	ThisTimestamp INTEGER;
	BreachDetected INTEGER;
begin

	-- CHECK IF REINSERT IS COMING FROM COLLECTION GATEWAY
	if (%user.description = 'collection_gate') then

		-- IF REINSERT IS COMING FROM A COLLECTION GATEWAY
		-- THEN XinY WILL CONTAIN VALUES THAT NEED TO BE
		-- EXTRACTED ONE BY ONE AND THEN ADDED TO THE
		-- LOCAL XinY ARRAY.
		
		-- FIRST CALCULATE HOW MANY INCOMING VALUES TO PROCESS

		-- MyNumValues: THIS VALUE REPRESENTS THE NUMBER OF VALUES
		-- CURRENTLY STORED IN XinY AND MAY BE A VALUE BETWEEN ZERO
		-- AND THE THRESHOLD VALUE.
		-- NumXinY HOLDS THE TOTAL NUMBER OF INSTANCES OF THIS EVENT
		-- HOWEVER THIS NUMBER MAY BE HIGHER THAN THE THRESHOLD VALUE
		-- XEvents.

		-- IF WE HAVE RECEIVED FEWER THAN XEvents INSTANCES OF THE EVENT
		if (new.NumXinY < new.XEvents) then

			-- THEN USE THE VALUE STORED IN NumXinY TO GET THE NUMBER OF
			-- ENTRIES IN XinY
			set MyNumValues = new.NumXinY;

		else

			-- ELSE SIMPLY USE THE MAXIMUM VALUE XEvents SINCE WE
			-- WE DON'T STORE MORE THAN XEvents NUMBER OF VALUES.
			set MyNumValues = new.XEvents;
		end if;

		-- ITERATE OVER THE INCOMING ARRAY XinY AND PROCESS EACH VALUE
		for MyCounter = 1 to MyNumValues do
		begin

			-- EXTRACT THE FIRST VALUE FROM THE INCOMING ARRAY
			set ThisTimestamp = to_int(nvp_get(new.XinY, 't' + to_char(MyCounter)));

			-- ADD THE NEW ENTRY INTO THE EXISTING XinY ARRAY
			execute xiny_add_timestamp (
				old.XinY,
				old.NumXinY,
				new.XEvents,
				new.YSeconds,
				ThisTimestamp);
		end;

	-- CHECK IF REINSERT IS NOT COMING FROM THE FAILOVER GATEWAY
	-- IF IT IS NOT, THIS WILL BE A STANDARD REINSERT
	elseif (%user.description <> 'failover_gate') then

		-- ADD AN ENTRY TO THE XinY ARRAY
		execute xiny_add_timestamp (
			old.XinY,
			old.NumXinY,
			new.XEvents,
			new.YSeconds,
			0);

	end if;

	-- INITIALISE VARIABLE
	set BreachDetected = 0;

	-- PERFORM AN XinY THRESHOLD BREACH CALCULATION
	execute xiny_calculate_breach (
		old.XinY,
		old.NumXinY,
		new.XEvents,
		new.YSeconds,
		BreachDetected);

	-- ESCALATE EVENT IF BREACH DETECTED
	if (BreachDetected = 1) then

		-- PERFORM ESCALATION ACTIONS IF THIS EVENT IS BEING ESCALATED
		-- FOR THE FIRST TIME
	--	if (old.SuppressEscl in (0,4)) then

	--		execute jinsert (
	--			old.Serial,
	--			%user.user_id,
	--			getdate,
	--			'Event escalated by XinY due to receiving ' +
	--				to_char(new.XEvents) +
	--				' occurrences of this event within ' +
	--				to_char(new.YSeconds) + ' seconds.');

			-- MARK THE EVENT AS ESCALATED - DEFAULT
	--		set old.SuppressEscl = 1;

			------------------------------------------
			-- PUT CUSTOM ESCALATION ACTIONS HERE
			------------------------------------------

			-- EXAMPLE: -- RAISE SEVERITY
			-- EXAMPLE: set old.Severity = 5;
			-- 	    ...

			------------------------------------------

	--	end if;
		if (old.Severity < 5 and old.Grade = 0) then
			execute jinsert (
					old.Serial,
					%user.user_id,
					getdate,
					'Event escalated due to receiving ' +
						to_char(new.XEvents) +
						' occurrences of the event within ' +
						to_char(new.YSeconds) + ' seconds.');
			set old.Summary = old.Summary + ' -Escalated from Severity ' + to_char(old.Severity) + ' to Severity 5 for threshold violation';
			set old.Severity = 5;
			set old.Grade = 1;
		end if;
	end if;
end;
go

create or replace trigger device_counter_expire_nodes
group default_triggers
priority 20
comment 'Periodically expire device nodes from master.devices.'
every 86400 seconds
begin

	-- DELETE EXPIRED NODES FROM master.devices
	-- NODES WILL BE DELETED IF NO EVENT HAS BEEN RECEIVED
	-- FOR OVER 1 YEAR

	delete from master.devices where
		LastReceived < (getdate() - 31536000);

end;
go

create or replace trigger clean_journal_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.JOURNAL'
every 60 seconds
begin
	delete from alerts.journal where Serial not in (select Serial from alerts.status);
end;
go

create or replace trigger service_insert
group default_triggers
priority 1
comment 'Service processing for service.status'
before insert on service.status for each row
begin
	if ( new.CurrentState = 0 )
	then
		set new.LastBadAt = 0;
		set new.LastMarginalAt = 0;
	elseif ( new.CurrentState = 1 )
	then
		set new.LastBadAt = 0;
		set new.LastGoodAt = 0;
	elseif ( new.CurrentState = 2 ) or ( new.CurrentState = 3 )
	then	
		set new.LastGoodAt = 0;
		set new.LastMarginalAt = 0;
	end if;
end;
go

create or replace trigger service_reinsert
group default_triggers
priority 1
comment 'Service processing for service.status'
before reinsert on service.status for each row
begin
	set old.LastReportAt = new.LastReportAt;

	if ( old.CurrentState != new.CurrentState )
	then
		set old.CurrentState = new.CurrentState;
		set old.StateChange = new.StateChange;
	end if;

	if ( new.CurrentState = 0 )
	then
		set old.LastGoodAt = new.LastGoodAt;
	elseif ( new.CurrentState = 1 )
	then
		set old.LastMarginalAt = new.LastMarginalAt;
	elseif ( new.CurrentState = 2 )
	then
		set old.LastBadAt = new.LastBadAt;
	end if;
end;
go

create or replace trigger clean_details_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.DETAILS'
every 60 seconds
begin
	delete from alerts.details where Identifier not in (select Identifier from alerts.status);
end;
go

create or replace trigger state_change
group default_triggers
priority 1
comment 'State change processing for ALERTS.STATUS'
before update on alerts.status for each row
begin
	set new.StateChange = getdate();
end;
go

create or replace trigger device_counter_daily_log_count
group default_triggers
priority 20
comment 'Daily write to log a summary of counts of device types.'
every 86400 seconds
begin

	-- LOG DEVICE COUNTS TO FILE
	EXECUTE device_counter_log_nodes;

end;
go

create or replace trigger agg_new_row
group default_triggers
priority 2
comment 'Replacement insert trigger (alerts.status) for multi-ObjectServer environments.'
before insert on alerts.status for each row
declare now utc;
begin

	-- USE A TEMPORARY VARIABLE TO STORE THE CURRENT TIMESTAMP
	set now = getdate();

	-- SET InternalLast AND StateChange
	set new.InternalLast = now;
	set new.StateChange = now;

	-- SET ServerName AND ServerSerial IF INSERT NOT COMING FROM AN OBJECTSERVER GATEWAY
	if (%user.description not in ('collection_gate', 'failover_gate') or
		new.ServerSerial = 0 or
		new.ServerName = '') then

                set new.ServerName = getservername();
                set new.ServerSerial = new.Serial;
        end if;

	-- SET FirstOccurrence IF NOT SET
	if (new.FirstOccurrence = 0) then

		set new.FirstOccurrence = now;
	end if;

	-- SET LastOccurrence IF NOT SET
	if (new.LastOccurrence = 0) then

		set new.LastOccurrence = now;
	end if;

	-- SET TALLY TO 1 IF SET TO 0.  THIS CAN HAPPEN WHEN
	-- A COLLECTION-TO-AGGREGATION RESYNC TAKES PLACE
	if (new.Tally = 0) then

		set new.Tally = 1;
	end if;
end;
go

create or replace trigger device_counter_deduplication
group default_triggers
priority 20
comment 'Inserts into master.devices on reinsert into alerts.status.'
before reinsert on alerts.status for each row
declare device_type int;
begin

	-- INITIALISE VARIABLE
	set device_type = 0;

	-- LOCATE DEVICE TYPE IN master.device_types TABLE
	for each row DeviceRow in master.device_types where
		DeviceRow.Class = old.Class
	begin

		-- SET device_type
		set device_type = DeviceRow.DeviceType;
	end;

	-- ONLY INSERT NON-EXEMPT TYPES
	if (device_type != 9) then

		-- INSERT INTO master.devices
		insert into master.devices (
			Node,
			Class,
			DeviceType,
			LastReceived)
		values (
			new.Node,
			new.Class,
			device_type,
			getdate());
	end if;
end;
go

create or replace trigger update_company
group default_triggers
priority 10
comment 'Updates Company field if value is null on insert'
after insert on alerts.status for each row
begin
	
                 -- Update Company Field if NULL
	if (new.Company = '') then

		if ((new.ServerName = 'COL_P_1') or (new.ServerName = 'COL_B_1')) then
		             set new.Company = 'Lumos';
                                   end if;

                                   if ((new.ServerName = 'COL_P_2') or (new.ServerName = 'COL_B_2')) then
		             set new.Company = 'Spirit';
                                   end if;

                                   if ((new.ServerName = 'AGG_P') or (new.ServerName = 'AGG_B')) then
                                                set new.Company = 'Lumos';
                                   end if;

	end if;
end;
go

create or replace trigger new_row
group default_triggers
enabled false
priority 1
comment 'Set default values for new alerts in ALERTS.STATUS'
before insert on alerts.status for each row
begin
	if ( %user.is_gateway = false ) 
	then
              set new.Tally = 1;
	      set new.ServerName = getservername();
	end if;
	set new.StateChange = getdate();
	set new.InternalLast = getdate();

	if( new.ServerSerial = 0 )
	then
		set new.ServerSerial = new.Serial;
	end if;

	if( new.LastOccurrence = 0 )
	then
		set new.LastOccurrence = getdate();
	end if;

end;
go

create or replace trigger deduplicate_details
group default_triggers
priority 1
comment 'Deduplicate rows on alerts.details'
before reinsert on alerts.details for each row
begin
	cancel; -- Do nothing. Allow the row to be discarded
end;
go

create or replace trigger timestamp_inserts
group default_triggers
priority 3
comment 'Records timestamps for insertion into each tier (alerts.status) in multi-ObjectServer environments.'
before insert on alerts.status for each row
begin

	-- SET TIMESTAMP AggregationFirst IF NOT SET
	if (new.AggregationFirst = 0) then

		set new.AggregationFirst = getdate();
	end if;
end;
go

create or replace trigger connection_watch_connect
group connection_watch
priority 1
comment 'Create an alert when a new client connects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the connect.\nA gateway connection for example is treated as a resolution (clearing a disconnect), whereas an eventlist connect is a Type 1 event which will be resolved by a disconnect) '
on signal connect
declare -- Define variables
	cseverity	int;
	alert_type	int;
	expire_time	int;
	app_found	boolean;
	app_group	char(64);
begin
	-- Initialise variables to defaults 
	set cseverity = 2;
	set alert_type = 1;
	set expire_time = 0;
	set app_found = FALSE;

	-- Some clients may not provide signal descriptions. For simplicity the 
	-- Summary format assumes that a description will be present. First set 
	-- indicators that determine which format of event to write and the 
	-- Severity and Type for the event

	for each row my_app in alerts.application_types where %signal.process like my_app.application
	begin
		if (my_app.discard = TRUE) then
			cancel;
		end if;
		set cseverity = my_app.connect_severity;
		set alert_type = my_app.connect_type;
		set app_group = my_app.description;
		set app_found = TRUE;
		break;
	end;
	if (%signal.process = 'PROBE' and %signal.description = 'syntax') then
	-- For a syntax check this is a test connection event that will clear 
	-- very quickly, set as a problem event over-riding the normal values 
	-- for a probe connect
		set alert_type = 1;
		set cseverity = 1;
		set expire_time = 180;
	end if;

	-- No entry in the table for the process
	if ( app_found = FALSE ) then
		-- An unknown process, that doesn't have a name associated
		-- with it has connected. Insert the event with a high severity
		if  ( %signal.process = '' ) then
			set app_group = 'Unknown Application';
			set cseverity = 4;
		else
		-- We don't have an entry in the table for the application but 
		-- it has supplied a non-null application name which we will use
			set app_group = %signal.process;
		end if;
	end if;

	if (%signal.username = '') then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID, ExpireTime) values (%signal.process+':'+%signal.description+'@'+%signal.node+' connected '+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has connected', %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at, app_group, %signal.process+':'+%signal.description, 65534, expire_time);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID,ExpireTime) values (%signal.process+':'+%signal.description+'@'+%signal.node+'connected'+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has connected as username '+%signal.username, %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at,app_group, %signal.process+':'+%signal.description, 65534,expire_time);
	end if;
end;
go

create or replace trigger connection_watch_disconnect
group connection_watch
priority 1
comment 'Create an alert when a client disconnects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the disconnect.\nA gateway disconnection for example is treated as a problem, where as an eventlist disconnect is a resolution'
on signal disconnect
declare -- Define variables
	cseverity	int;
	alert_type	int;
	app_found	boolean;
	app_group	char(64);
begin
	-- Initialise variables to defaults 
	set cseverity = 2;
	set alert_type = 2;
	set app_found = FALSE;

	-- Some clients may not provide signal descriptions. For simplicity the Summary 
	-- format assumes that a description will be present. first set indicators that 
	-- determine which format of event to write and the Severity and Type for 
	-- the event
	for each row my_app in alerts.application_types where %signal.process like my_app.application
	begin
		if (my_app.discard = TRUE) then
			cancel;
		end if;
		set cseverity = my_app.disconnect_severity;
		set alert_type = my_app.disconnect_type;
		set app_group = my_app.description;
		set app_found = TRUE;
		break;
	end;
	if (%signal.process = 'PROBE' and %signal.description = 'syntax') then
	-- For a syntax check this is a test connection event that will clear 
	-- very quickly, set as a problem event over-riding the normal values 
	-- for a probe connect
			set alert_type = 2;
			set cseverity = 1;
	end if;
	
	-- No entry in the table for the process
	if ( app_found = FALSE ) then
		-- An unknown process, that doesn't have a name associated is
		-- disconnecting
		if  ( %signal.process = '' ) then
			set app_group = 'Unknown Application';
		else
		-- We don't have an entry in the table for the application but 
		-- it has supplied a non-null application name which we will use
			set app_group = %signal.process;
		end if;
	end if;
	
	if (%signal.username = '') then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values (%signal.process+':'+%signal.description+'@'+%signal.node+'disconnected '+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has disconnected', %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at, app_group, %signal.process+':'+%signal.description, 65534);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values (%signal.process+':'+%signal.description+'@'+%signal.node+'disconnected'+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has disconnected as username '+%signal.username, %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at,app_group, %signal.process+':'+%signal.description, 65534);
	end if;
end;
go

create or replace trigger delete_minor
group lumos_triggers
priority 1
comment 'Delete all minor alarms older than 30 days.'
every 43200 seconds
begin
delete from alerts.status where Severity = 3 and FirstOccurrence < (getdate() - 2592000)
end;
go

create or replace trigger set_flash_act
group lumos_triggers
priority 1
comment 'Take all alarms that have FastTrack set to 1 that have not been acted on by the NOC, and set Flash = 1'
every 60 seconds
begin
	FOR EACH ROW alert IN alerts.status WHERE alert.Severity >= 4 AND alert.SuppressEscl < 4 AND alert.Flash = 0 AND (alert.Acknowledged = 0 OR alert.TTNumber = '') AND alert.FirstOccurrence <= (getdate - 300) AND alert.EventId NOT LIKE ALL ('ALM T1') AND alert.AlertKey NOT LIKE ALL( 'Multilink','voice-port','Serial' ) AND alert.Node NOT LIKE ALL( 'NETENG_LAB','.iad.') AND alert.AlertGroup <> ALL( 'ITNM Monitor','ImpactStatus','Unknown Application' ) AND alert.Summary NOT LIKE ALL ('PRIGRP')
	BEGIN
		update alerts.status via alert.Identifier set Flash = 1;
		execute jinsert(alert.Serial, 0, getdate(), 'Alert set to Flash by Netcool due to alarm inactivity');
	END
end;
go

create or replace trigger probe_mail_on_critical
group lumos_triggers
enabled false
priority 3
comment 'Send email about critical Probe alerts that are unacknowledged after 5 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 180 seconds
begin
        for each row critical in alerts.status where critical.Manager like 'Watch' and critical.Severity = 5 and critical.Grade < 2 and critical.Summary like  'Going Down' 
and 
							critical.Acknowledged = 0 and 
							critical.LastOccurrence <= ( getdate() - (60*5) )
        begin
                execute send_email( critical.Node, critical.Severity, 'Netcool Production Probe', 'noc-systems@lumosnet.com', critical.Summary, 'localhost');
                update alerts.status via critical.Identifier set Grade=2;
        end;
end;
go

create or replace trigger delete_Sev1
group lumos_triggers
priority 1
comment 'Delete any Sev1 alarms older than a week'
every 86400 seconds
begin
delete from alerts.status where Severity = 1 and Type != 2 and LastOccurrence < (getdate() - 604800)
end;
go

create or replace trigger pronx_heartbeat
group lumos_triggers
priority 3
comment 'Watchdog for heartbeat messages from proNx poller'
every 1200 seconds
evaluate select LastOccurrence, Identifier from alerts.status where AlertGroup = 'lumosHeartbeat'
bind as heartbeats
begin
  for each row heartbeat in heartbeats
  begin
    if(heartbeat.LastOccurrence < (getdate() - 1201))
    then
      insert into alerts.status (
	Identifier,
	Node,
	AlertKey,
	Summary,
	Severity,
	FirstOccurrence,
	LastOccurrence,
	Agent,
	OwnerUID ) values (
		'proNx heartbeat monitor',
		'proNx_Poller',
		'Missed heartbeat',
		'proNx poller missed heartbeat',
		5,
		getdate(),
		getdate(),
		'LUMOS-NOTIFICATION-MIB',
		65534);
    else
      insert into alerts.status (
	Identifier,
	Node,
	AlertKey,
	Summary,
	Severity,
	FirstOccurrence,
	LastOccurrence,
	Agent,
	OwnerUID ) values (
		'proNx heartbeat monitor',
		'proNx_Poller',
		'Missed heartbeat',
		'proNx poller received heartbeat',
		0,
		getdate(),
		getdate(),
		'LUMOS-NOTIFICATION-MIB',
		65534);
    end if;
  end;
end;
go

create or replace trigger gateway_mail_on_critical
group lumos_triggers
enabled false
priority 4
comment 'Send email about critical jdbc gateway alerts that are unacknowledged after 5 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 240 seconds
begin
        for each row critical in alerts.status where critical.Severity = 5 and critical.Grade < 2 and critical.Summary like  'A GATEWAY process' 
and 
							critical.Acknowledged = 0 and 
							critical.LastOccurrence <= ( getdate() - (60*5) )
        begin
                execute send_email( critical.Node, critical.Severity, 'Netcool Production JDBC Gateway', 'noc-systems@lumosnet.com', critical.Summary, 'localhost');
                update alerts.status via critical.Identifier set Grade=2;
        end;
end;
go

create or replace trigger delete_informational
group lumos_triggers
priority 1
comment 'Remove Sev2 alarms that havent counted up in a month'
every 43200 seconds
begin
	delete from alerts.status where Severity = 2 and LastOccurrence < (getdate() - 1296000)
end;
go

create or replace trigger generic_clear
group primary_only
priority 1
comment 'Generic Problem/Resolution'
every 5 seconds
begin
	-- Populate a table with Type 1 events corresponding to any uncleared Type 2 events
	for each row problem in alerts.status where
				problem.Type = 1 and problem.Severity > 0 and
                                (problem.Node + problem.AlertKey + problem.AlertGroup + problem.Manager) in
                                ( select Node + AlertKey + AlertGroup + Manager from alerts.status where Severity > 0 and Type = 2 ) 
	begin
		insert into alerts.problem_events values ( problem.Identifier, problem.LastOccurrence, 
							problem.AlertKey, problem.AlertGroup, 
							problem.Node, problem.Manager, false );
	end;

	-- For each resolution event, mark the corresponding problem_events entry as resolved
	-- and clear the resolution
	for each row resolution in alerts.status where resolution.Type = 2 and resolution.Severity > 0
	begin
		set resolution.Severity = 0;
		update alerts.problem_events set Resolved = true where 
				LastOccurrence < resolution.LastOccurrence and 
				Manager = resolution.Manager and Node = resolution.Node and 
				AlertKey = resolution.AlertKey and AlertGroup = resolution.AlertGroup ;
	end;

	-- Clear the resolved events
	for each row problem in alerts.problem_events where problem.Resolved = true
	begin
		update alerts.status via problem.Identifier set Severity = 0;	
	end;

	-- Remove all entries from the problems table
	delete from alerts.problem_events;
end;
go

create or replace trigger escalate_off
group primary_only
priority 1
comment 'Will set Flash field to 0 (not flashing) and SuppressEscl to 0 (not escalated in this example) when an event that has previously had the Flash field set to 1 is Acknowledged or if the event is Cleared (Severity = 0).'
every 5 seconds
begin
	update alerts.status set Flash = 0  where Flash = 1  and (Acknowledged = 1 and TTNumber <> '');
end;
go

create or replace trigger expire
group primary_only
priority 1
comment 'Expiration'
every 60 seconds
begin
	for each row expire in alerts.status where expire.ExpireTime > 0 and expire.Severity > 0
	begin
		update alerts.status via expire.Identifier set Severity = 0 where LastOccurrence < (getdate() - expire.ExpireTime);
	end;	
end;
go

create or replace trigger delete_clears
group primary_only
priority 1
comment 'Delete clear alerts over 5 minutes old in ALERTS.STATUS every 60 seconds'
every 60 seconds
begin
	delete from alerts.status where Severity = 0 and StateChange < (getdate() - 300);
end;
go

create or replace trigger mail_on_critical
group primary_only
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 10 seconds
begin
        for each row critical in alerts.status where critical.Severity = 5 and critical.Grade < 2 and 
							critical.Acknowledged = 0 and 
							critical.LastOccurrence <= ( getdate() - (60*30) )
        begin
                execute send_email( critical.Node, critical.Severity, 'Netcool Email', 'root@localhost', critical.Summary, 'localhost');
                update alerts.status via critical.Identifier set Grade=2;
        end;
end;
go

create or replace trigger check_suf_status
group primary_only
enabled false
priority 20
comment 'Check SUF Status'
every 600 seconds
declare install_loc character(255);check_suf_cmd character(255);check_suf_args character(255);windows_os integer;debug_itmsync integer
begin
	execute get_install_loc(install_loc);
	execute get_debug_itmsync(debug_itmsync);
	set windows_os = is_env_set('SystemDrive');
	if ( windows_os = 1)
	then 
		set check_suf_cmd = '\"' + install_loc + '\\omnibus\\checkSUFStatus.bat\"';
		set check_suf_args = '\"' + install_loc + '\" Check_SUF_Status Check_SUF_Status';
		execute eventcmd(check_suf_cmd,check_suf_args);
	else
		set check_suf_cmd = install_loc + '/omnibus/checkSUFStatus.sh';
		set check_suf_args = install_loc + ' Check_SUF_Status Check_SUF_Status';

		execute eventcmd(check_suf_cmd,check_suf_args);
	end if;
end;
go

create or replace trigger flash_not_ack
group primary_only
enabled false
priority 1
comment 'Will set Flashing on (Flash=1) for events that are Critical (Severity=5) and are 10 minutes old but have not been acknowledged by a user yet (Acknowledge = 0). It sets SuppressEscl to 1 as a further indication of the events escalation status.'
every 31 seconds
begin
	update alerts.status set Flash = 1, SuppressEscl = 1 where Flash = 0 and Acknowledged = 0 and Severity = 5 and FirstOccurrence <= (getdate - 600);
end;
go

create or replace trigger resync_complete
group primary_only
priority 1
comment 'Creates synthetic events to indicate when Gateways have completed resynchronisation.'
on signal gw_resync_finish
declare now utc;
	summary_string char(512);
begin

	-- INITIALISE VARIABLE
	set now = getdate();
	set summary_string = '';

	-- CONSTRUCT SUMMARY STRING
	if (%user.description = 'collection_gate') then

		set summary_string = 'Collection ';

	elseif (%user.description = 'failover_gate') then

		set summary_string = 'Failover ';

	elseif (%user.description = 'display_gate') then

		set summary_string = 'Display ';

	end if;

	set summary_string = summary_string +
		'Gateway resynchronisation complete on ' +
		%user.host_name +
		'.'; 

	-- INSERT A SYNTHETIC EVENT TO INDICATE GATEWAY RESYNCHRONISATION COMPLETION
	insert into alerts.status (
		Identifier,
		Node,
		Summary,
		Type,
		Severity,
		FirstOccurrence,
		LastOccurrence,
		Tally,
		ExpireTime,
		AlertGroup,
		OwnerUID,
		Manager)
	values (
		'gateway_resync_' + to_char(now) + '_' + %user.description + '_' + to_char(%user.connection_id),
		get_prop_value('Hostname'),
		summary_string,
		13,
		2,
		now,
		now,
		1,
		86400,
		'nco_objserv',
		65534,
		'SystemWatch');

end;
go

create or replace trigger disable_user
group security_watch
priority 1
comment 'Disable users when they fail to log on after n consecutive failures'
on signal login_failed
declare failurecount	unsigned;
	userfound	boolean;
begin
	set failurecount = 5;
	set userfound = false;

	for each row disable_user in alerts.login_failures where
                            disable_user.UserName = %signal.username 
	begin
		if ( disable_user.FailureCount >= failurecount )
		then
			-- Zero the failure count - to ensure they aren't disabled immediately the user is re-enabled.
			set disable_user.FailureCount = 0;
			set disable_user.LastFailure = getdate();
			
			-- Disable the user.
			alter user %signal.username set enabled false;
			
			-- Put an event into alerts.status.
			insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Disabling user '+%signal.username+' from host '+%signal.node+' failure count exceeded', 'Disabling user '+%signal.username+' from host '+%signal.node+' failure count exceeded', %signal.node, 'SecurityWatch', 1, 5, %signal.at, %signal.at, %signal.process, 65534);
		elseif ( disable_user.FailureCount < failurecount )
            	then
			-- Increment the failure count for the user
			set disable_user.FailureCount = disable_user.FailureCount+1;
			set disable_user.LastFailure = getdate();
		end if;

		set userfound = true;	
	end;

	-- If the user wasn't in the table, add them now.
	if ( userfound = false )
	then
		for each row existing_user in security.users where
                            existing_user.UserName = %signal.username 
		begin
			insert into alerts.login_failures ( UserName, LastFailure, FailureCount ) values ( %signal.username, getdate(), 1 );
		end;
	end if;
end;
go

create or replace trigger disable_inactive_users
group security_watch
enabled false
priority 1
comment 'Disable users that have not logged on to the objectserver within a defined period'
every 86400 seconds
declare inactive_period integer;
	inactive_days integer;
begin

        -- Set the number of days a user can be inactive for
	set inactive_days = 30;

	-- Calculate time in seconds for the inactive period
        set inactive_period = 60 * 60 * 24 * inactive_days;

	-- Find all users that haven't successfully logged on in more than the allowed time.
        for each row disable_user in alerts.login_failures where
                disable_user.LastGood != 0 
		and ( disable_user.LastGood + inactive_period ) < getdate() 
		and disable_user.UserName in ( Select UserName from security.users )
        begin
                -- Disable the user.
                alter user disable_user.UserName set enabled false;

                -- Insert an event.
                insert into alerts.status (Identifier, Summary, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) 
					   values  ('Disabling user '+disable_user.UserName+' User has been inactive for ' + to_char( inactive_days ) + ' days.', 
					    	    'Disabling user '+disable_user.UserName+' User has been inactive for ' + to_char( inactive_days ) + ' days.',  
						    'SecurityWatch', 1, 5, getdate(), getdate(), 'nco_objserv', 65534);

        end;
end;
go

create or replace trigger reset_user
group security_watch
priority 1
comment 'Reset the users failure count when they logon successfully.'
on signal connect
declare userfound	boolean;
begin
	set userfound = false;
	for each row disable_user in alerts.login_failures where
		disable_user.UserName = %signal.username 
	begin
		-- Reset the number of failures for this user.
		set disable_user.FailureCount = 0;
		set disable_user.LastGood = getdate();
		set userfound = true;
	end;

	-- If the user wasn't in the table, add them now
	if ( userfound = false )
	then
		insert into alerts.login_failures ( UserName, LastGood, FailureCount ) values ( %signal.username, getdate(), 0 );
	end if;
end;
go

create or replace trigger security_watch_security_failure
group security_watch
priority 1
comment 'Create an alert when a client fails to authenticate'
on signal login_failed
begin
	if( %signal.process = 'nco_objserv' ) then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer on ' + %signal.node + ' failed to connect as user ' + %signal.username, 'ObjectServer on ' + %signal.node + ' failed to connect as user ' + %signal.username, %signal.node, 'SecurityWatch', 1, 4, %signal.at, %signal.at, %signal.process, 65534);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Attempt to login as '+%signal.username+' from host '+%signal.node+' failed', 'Attempt to login as '+%signal.username+' from host '+%signal.node+' failed', %signal.node, 'SecurityWatch', 1, 4, %signal.at, %signal.at, %signal.process, 65534);
	end if;
end;
go

create or replace trigger audit_config_alter_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been altered'
on signal alter_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Altered by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger audit_config_drop_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been dropped'
after delete on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropColVisual'+old.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop column visual '+old.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', old.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been dropped'
on signal drop_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Dropped by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger audit_config_create_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been created'
after insert on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateTool'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create tool '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been altered'
after update on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterPrompt'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter prompt '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been altered'
after update on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterClass'+new.Name+to_char(new.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter class '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been altered'
after update on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterColVisual'+new.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter column visual '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been dropped'
after delete on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropTool'+old.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop tool '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_drop_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been dropped'
after delete on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropPrompt'+old.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop prompt '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_create_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been created'
after insert on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateClass'+new.Name+to_char(new.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create class '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been altered'
after update on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterMenu'+new.Title+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter menu '+new.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', new.Title, 65534 );
end;
go

create or replace trigger audit_config_alter_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been altered'
after update on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterConv'+new.Colname+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter conversion '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_create_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been created'
after insert on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateMenu'+new.Title+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create menu '+new.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', new.Title, 65534 );
end;
go

create or replace trigger audit_config_create_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been created'
after insert on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreatePrompt'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create prompt '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been altered'
after update on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterTool'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter tool '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_create_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been created'
after insert on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateColVisual'+new.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create column visual '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_create_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been created'
after insert on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateConv'+new.Colname+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create conversion '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_alter_property
group audit_config
priority 1
comment 'Create an alert indicating that a property has been altered'
on signal alter_property
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( 'AlterProperty'+%signal.name+'@'+%signal.node+to_char(getdate()), 'Alter property'+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Altered by user '+%signal.username+' at '+to_char(%signal.at), %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'PropertyAudit', 'Properties', 65534 );
end;
go

create or replace trigger audit_config_permission_denied
group audit_config
priority 1
comment 'Create an alert indicating that a permission denied'
on signal permission_denied
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( 'permissiondenied'+'@'+%signal.node+to_char(getdate()), 'Permission was denied on ObjectServer '+%signal.server+' running on '+%signal.node+ '. Executed by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname+', '+%signal.sql_cmd, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', 'PermissionDenied', 65534 );
end;
go

create or replace trigger audit_config_drop_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been dropped'
after delete on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropConv'+old.Colname+old.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop conversion '+old.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', old.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been dropped'
after delete on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropClass'+old.Name+to_char(old.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop class '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_drop_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been dropped'
after delete on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropMenu'+old.Title+old.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop menu '+old.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', old.Title, 65534 );
end;
go

create or replace trigger audit_config_create_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been created'
on signal create_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Created by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger profiler_group_report
group profiler_triggers
priority 2
comment 'Profiler application group reporting trigger'
on signal profiler_report
evaluate select AppName, sum( PeriodSQLTime ) as ClientTypeTotalTime
		from catalog.profiles
		where NumSubmits > 0
		group by AppName
bind as profile_tt
declare header		boolean;
	total		real;
begin
	-- Initialise client's total period time
	set total = 0.0;

	-- Display header
	set header = true;

	-- Report grouped SQL timings
	for each row profile in profile_tt
	begin
		if( header = true ) then
			-- Header
			write into profiler_report
				values( to_char( %signal.report_time ) + ': Grouped user profiles:' );
			set header = false;
		end if;

		write into profiler_report
			values( to_char( %signal.report_time ) + ': Execution time for all connections whose application name is \'' +
				profile.AppName + '\': ' + to_char( profile.ClientTypeTotalTime ) + 's' );

		-- Accumulate the total time for all client types
		set total = total + profile.ClientTypeTotalTime;
	end;

	write into profiler_report
		values( to_char( %signal.report_time ) + ': Total time in the report period (' + to_char( %signal.report_period ) + 's): ' +
		      	to_char( total ) + 's' );
end;
go

create or replace trigger profiler_report
group profiler_triggers
priority 1
comment 'Profiler reporting trigger'
on signal profiler_report
declare header		boolean;
begin
	-- Display header
	set header = true;

	-- Create a report for each row in catalog.profiles where NumSubmits > 0
	for each row profile in catalog.profiles where profile.NumSubmits > 0
	begin
		if( header = true ) then
			-- Header
			write into profiler_report
				values( to_char( %signal.report_time ) + ': Individual user profiles:' );
			set header = false;
		end if;

		write into profiler_report
			values( to_char( %signal.report_time ) + ': \'' + profile.AppName + '\' (uid = ' + to_char( profile.UID ) + ') time on ' + profile.HostName + ': ' +
				to_char( profile.PeriodSQLTime ) + 's' );
	end;
end;
go

create or replace trigger profiler_toggle
group profiler_triggers
priority 1
comment 'Report that the profiler has been toggled'
on signal profiler_toggle
begin
	-- Insert different rows depending upon the state of the profiler
	if( %signal.enabled = true ) then
		-- Inform the outside world that the profiler has been enabled
		insert into alerts.status ( Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID )
			values( 'ProfilerEnableToggle@'+getservername()+':'+%signal.node, 'ObjectServer '+getservername()+' Profiler enabled at '+
			to_char(%signal.at), %signal.node, 'Profiler', 2, 1, %signal.at, %signal.at, 'nco_objserv', 65534 );

		write into profiler_report
			values( to_char( getdate() ) + ': Profiling enabled at ' + to_char( %signal.at ) );
	else
		-- Inform the outside world that the profiler has been disabled
		insert into alerts.status ( Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID )
			values( 'ProfilerDisableToggle@'+getservername()+':'+%signal.node, 'ObjectServer '+getservername()+' Profiler disabled at '+
			to_char(%signal.at),%signal.node, 'Profiler', 2, 1, %signal.at, %signal.at, 'nco_objserv', 65534 );

		write into profiler_report
			values( to_char( getdate() ) + ': Profiling disabled at ' + to_char( %signal.at ) );
	end if
end;
go

create or replace trigger trigger_stats_report
group trigger_stat_reports
priority 1
comment 'Trigger statistic report trigger'
on signal trigger_stats_report
declare period char(40);
	total_time real;
begin
	-- Get the report period
	set period = get_prop_value( 'Auto.StatsInterval' );

	-- Initialise 'total_time' for all triggers
	set total_time = 0;

	-- Header
	write into trigger_stats_report
		values( to_char( %signal.report_time ) + ': Trigger Profile Report' );

	-- Report trigger times per active trigger group
	for each row t_group in catalog.trigger_groups where t_group.IsEnabled = true
	begin
		write into trigger_stats_report
			values( to_char( %signal.report_time ) + ': Trigger Group \'' + t_group.GroupName + '\'' );

		-- Report each of the group's active trigger times in the report period
		for each row trig in catalog.trigger_stats
			where trig.TriggerName in ( select TriggerName from catalog.triggers where IsEnabled = true and GroupName = t_group.GroupName )
		begin
			write into trigger_stats_report
				values( to_char( %signal.report_time ) + ':     Trigger time for \'' + trig.TriggerName + '\': ' + to_char( trig.PeriodTime ) + 's' );

			set total_time = total_time + trig.PeriodTime;
		end;
	end;

	-- Report time for all triggers
	write into trigger_stats_report
		values( to_char( %signal.report_time ) + ': Time for all triggers in report period (' + period + 's): ' + to_char( total_time ) + 's' );
end;
go

create or replace trigger delete_stats
group stats_triggers
priority 20
comment 'keep up to 120 days of records in the master.stats table'
every 86400 seconds
declare days_data int;
begin
        -- Keep 120 days of data
	-- Modify this to reduce / increase the number
	set days_data = 86400*120;
	delete from master.stats where StatTime < (getdate - days_data);
end;
go

create or replace trigger details_inserts
group stats_triggers
priority 20
comment 'Counts details table inserts'
after insert on alerts.details for each row
begin
	update master.activity_stats via 'alerts' set DetailsInserts = DetailsInserts + 1;
end;
go

create or replace trigger stats_reset
group stats_triggers
priority 1
comment 'Reset the statistics data'
on signal stats_reset
begin
	delete from master.stats;
	delete from master.activity_stats;
	insert into master.activity_stats values( 'alerts', 0, 0, 0, 0, 0 );
end;
go

create or replace trigger new_status_inserts
group stats_triggers
priority 20
comment 'Counts new status table inserts'
after insert on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusNewInserts = StatusNewInserts + 1;
end;
go

create or replace trigger journal_inserts
group stats_triggers
priority 20
comment 'Counts journal table inserts'
after insert on alerts.journal for each row
begin
	update master.activity_stats via 'alerts' set JournalInserts = JournalInserts + 1;
end;
go

create or replace trigger status_updates
group stats_triggers
priority 20
comment 'Counts status table updates'
after update on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusUpdates = StatusUpdates + 1;
end;
go

create or replace trigger dedup_status_inserts
group stats_triggers
priority 20
comment 'Counts deduplicated status table inserts'
after reinsert on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusDedups = StatusDedups + 1;
end;
go

create or replace trigger statistics_cleanup
group stats_triggers
priority 20
comment 'Delete statistics over an hour old'
every 3600 seconds
begin
	delete from master.stats where StatTime < (getdate() - 3600);
end;
go

create or replace trigger statistics_gather
group stats_triggers
priority 20
comment 'Create some v3.x ObjectServer statistics'
every 300 seconds
declare clients		int;
	realtimes	int;
	probes		int;
	gateways	int;
	monitors	int;
	proxys		int;
	ecount		int;
	jcount		int;
	dcount		int;
	sinserts	int;
	sninserts	int;
	sdedups		int;
	jinserts	int;
	dinserts	int;
	supdates	int;
begin
	-- Initialise counters
	set clients = 0;
	set realtimes = 0;
	set probes = 0;
	set gateways = 0;
	set monitors = 0;
	set proxys = 0;
	set ecount = 0;
	set jcount = 0;
	set dcount = 0;

	-- Get number of clients
	for each row srow in catalog.connections
	begin
		set clients = clients + 1;
	end;

	-- Get number of realtime clients
	for each row srow in catalog.connections where srow.IsRealTime = true
	begin
		set realtimes = realtimes + 1;
	end;

	-- Get number of probes
	for each row srow in catalog.connections where srow.AppName = 'PROBE'
	begin
		set probes = probes + 1;
	end;

	-- Get number of Gateways
	for each row srow in catalog.connections where srow.AppName = 'GATEWAY'
	begin
		set gateways = gateways + 1;
	end;

	-- Get number of monitors
	for each row srow in catalog.connections where srow.AppName = 'MONITOR'
	begin
		set monitors = monitors + 1;
	end;

	-- Get number of proxies
	for each row srow in catalog.connections where srow.AppName = 'PROXY'
	begin
		set proxys = proxys + 1;
	end;

	-- Get number of rows in alerts.status
	for each row srow in alerts.status
	begin
		set ecount = ecount + 1;
	end;

	-- Get number of rows in alerts.journal
	for each row srow in alerts.journal
	begin
		set jcount = jcount + 1;
	end;

	-- Get number of rows in alerts.details
	for each row srow in alerts.details
	begin
		set dcount = dcount + 1;
	end;

	-- Get status/journal/details table activity statistics.
	for each row srow in master.activity_stats where srow.DatabaseName = 'alerts'
	begin
		set sinserts = srow.StatusNewInserts + srow.StatusDedups;
		set sninserts = srow.StatusNewInserts;
		set sdedups = srow.StatusDedups;
		set jinserts = srow.JournalInserts;
		set dinserts = srow.DetailsInserts;
		set supdates = srow.StatusUpdates;
	end;

	-- Insert a stats row
	insert into master.stats values( getdate(), clients, realtimes, probes, gateways, monitors, proxys, ecount, jcount, dcount, sinserts, sninserts, sdedups, jinserts, dinserts, supdates );
end;
go

create or replace trigger suppress_cross_domain_connections
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
 
    -- Only interested in changes made by the ITNM Gateway
    if (%user.description in ('ncp_g_event','ncp_ncogate'))
    then
        -- Only interested in events have a remode node set and are root cause
        if (new.RemoteNodeAlias != '') and (new.NmosCauseType = 1)
        then
            if (new.Severity > 0)
            then
                -- It's going to be root cause unless we find a supressor in another domain
                for each row Suppressor in alerts.status where Suppressor.LocalNodeAlias = new.RemoteNodeAlias
                                                           and Suppressor.NmosDomainName != new.NmosDomainName
                                                           and Suppressor.NmosCauseType = 1
                                                           and Suppressor.Severity > 0
                  begin
                    -- Found a suppressor in another domain - suppress this event
                    set new.NmosCauseType = 2;
                    set new.NmosSerial = to_char(Suppressor.Serial);
-- Comment out the next line if not setting severity
                    set new.Severity = 1;
                  end;
            else
                -- It's been cleared so if it was suppressing cross domain then unsuppress
                for each row Suppressed in alerts.status where Suppressed.RemoteNodeAlias = new.LocalNodeAlias
                                                           and Suppressed.NmosDomainName != new.NmosDomainName
                                                           and Suppressed.NmosSerial = to_char(new.Serial)
                  begin
                    -- Found a suppressed event in another domain - unsuppress it
                    set Suppressed.NmosCauseType = 0;
                    set Suppressed.NmosSerial = '0';
-- Comment out the next line if not setting severity
                    set Suppressed.Severity = 2;
                  end;
            end if;
        end if;
    end if;
end;
go

create or replace trigger severity_from_causetype
group itnm_triggers
priority 1
comment ''
before update on alerts.status for each row
begin
 

    -- Only interested in changes made by the ITNM Gateway
    if (%user.description in ('ncp_g_event','ncp_ncogate'))
    then
        -- Only interested in events processed by ITNM
        if (new.NmosObjInst > 0)
        then
            -- Ignore events which have been cleared
            if (old.Severity > 0)
            then
                if (new.NmosCauseType = 1)
                then
                    -- This is a 'Root Cause' event so set Severity to 'Critical'
                    set new.Severity = 5;

                elseif (new.NmosCauseType = 2)
                then
                    -- This is a 'Symptom' event so set Severity to 'Indeterminate'
                    set new.Severity = 1;

                elseif (new.NmosCauseType = 0)
                then
                    if (old.NmosCauseType = 2)
                    then
                        -- This was a 'Symptom' but now its 'Unknown' so set Severity to 'Warning'
                        set new.Severity = 2;
                    end if;
                end if;
            end if;
        end if;
    end if;
end;
go

create or replace trigger registry_new_probe
group registry_triggers
priority 10
comment 'Set defaults for new entry in REGISTRY.PROBES'
before insert on registry.probes for each row
begin
if (%user.app_name = 'PROBE') or (%user.app_name = 'PROXY') then
	set new.ConnectionID = %user.connection_id;
end if;
if (%user.app_name != 'GATEWAY') then
	set new.LastUpdate = getdate;
end if;
end;
go

create or replace trigger registry_reinsert_probe
group registry_triggers
priority 10
comment 'Treat inserts to existing PROBE.REGISTRY entry as though they were updates. Time stamp the record to keep track of the last time this entry was updated. Only probes directly connected, or connected via a proxy server, as well as gateways are allowed to re-insert into the table. Other applications must use UPDATE to modify the probe registry.'
before reinsert on registry.probes for each row
begin
	if (%user.app_name = 'PROBE') or
	   (%user.app_name = 'PROXY') then
		set row old = new; 
		set old.ConnectionID = %user.connection_id;
		set old.LastUpdate = getdate;
	elseif (%user.app_name = 'GATEWAY') and
	       (new.LastUpdate > old.LastUpdate) then
		-- Only update the registry if the reinsert is more recent
		set row old = new;
	else
		cancel;
	end if;
end;
go

create or replace trigger registry_update_probe
group registry_triggers
priority 10
comment 'Set the LastUpdate column for updates coming from all clients except gateways. Only permit updates from gateways if the LastUpdate time is more recent than the existing entry'
before update on registry.probes for each row
begin
	if (%user.app_name != 'GATEWAY') then
		set new.LastUpdate = getdate();
	elseif (new.LastUpdate < old.LastUpdate) then
		cancel;
	end if;
end;
go

create or replace trigger registry_probe_disconnect
group registry_triggers
priority 10
comment 'Reset ConnectionID in probe registry when probe or proxy server disconnects.'
on signal disconnect
begin
	if (%signal.process = 'PROBE') then
		update registry.probes set ConnectionID = 0, LastUpdate = getdate
			where ConnectionID = %signal.connectionid;
	-- proxy server shuffles probe connections dynamically.
	-- Unsafe to reset probes that have not stopped.
	elseif (%signal.process = 'PROXY') then
		update registry.probes set ConnectionID = 0, LastUpdate = getdate
			where ConnectionID = %signal.connectionid
			 and  Status = 0;
	end if;
end;
go

create or replace trigger disconnect_iduc_missed
group iduc_triggers
priority 1
comment 'Disconnects real-time clients that have not communicated with objectserver for 100 granularity periods'
on signal iduc_missed
begin
	if( %signal.missed_cycles > 100 )
	then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey,OwnerUID) values(%signal.process+':'+%signal.node+':iducmissed:'+%signal.username, 'Disconnecting '+%signal.process+' process '+%signal.description+' connected as user '+%signal.username+'.Reason - Missed '+to_char(%signal.missed_cycles)+' iduc cycles.', %signal.node, 'SystemWatch', 1, 1, %signal.at, %signal.at,'IducMissed',%signal.process+':iducmissed',65534); 

		alter system drop connection %signal.connectionid;
	end if;
end;
go

create or replace trigger iduc_stats_update
group iduc_triggers
priority 1
comment 'update LastIducTime in iduc_system.iduc_stats table on signal iduc_data_fetch'
on signal iduc_data_fetch
begin
	update iduc_system.iduc_stats set LastIducTime = %signal.at where ServerName = getservername()
		and AppName = %signal.process and AppDesc = %signal.description
		and ConnectionId = %signal.connectionid;
end;
go

create or replace trigger iduc_messages_tblclean
group iduc_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.IDUC_MESSAGES'
every 60 seconds
begin
	delete from alerts.iduc_messages where (MsgTime + 120) <= getdate;
end;
go

create or replace trigger iduc_stats_disconnect
group iduc_triggers
priority 1
comment 'Update client entry failure time on disconnect'
on signal iduc_disconnect
declare failure_time utc;
begin
	set failure_time = getdate();

	for each row cnxn in iduc_system.iduc_stats where cnxn.AppDesc = %signal.description 
		and cnxn.ConnectionId = %signal.conn_id and cnxn.ServerName = getservername() 
	begin
		set cnxn.LastIducTime = failure_time;
	end;
end;
go

create or replace trigger deduplicate_iduc_stats
group iduc_triggers
priority 1
comment 'Deduplicate rows on iduc_system.iduc_stats'
before reinsert on iduc_system.iduc_stats for each row
begin
	set old.AppName = new.AppName;
	set old.LastIducTime = 0;
end;
go

create or replace trigger iduc_stats_insert
group iduc_triggers
priority 1
comment 'Insert client entry into iduc_system.iduc_stats table on signal iduc_connect'
on signal iduc_connect
begin
	insert into iduc_system.iduc_stats (ServerName,AppName,AppDesc,ConnectionId) values (getservername(),%signal.process,%signal.description,%signal.conn_id);
end;
go

create or replace trigger scala_reinsert
group scala_triggers
priority 20
comment 'Fast Track an event reinsert for alerts.status to message bus Gateway running in SCALA mode'
after reinsert on alerts.status for each row
begin
	iduc evtft 'scala' , update , new ;
end;
go

create or replace trigger scala_insert
group scala_triggers
priority 20
comment 'Fast Track an event insert for alerts.status to message bus Gateway running in SCALA mode'
after insert on alerts.status for each row
begin
	iduc evtft 'scala' , insert , new ;
end;
go

create or replace trigger AdvCorr_SetCauseType
group AdvCorr
priority 1
comment ''
before update on alerts.status for each row
when get_prop_value('ActingPrimary')%='TRUE'
begin
  if(new.AdvCorrCauseType = 0) then set new.CauseType = new.NmosCauseType; -- If AdvCorrCauseType is 'unknown' set to value of NmosCauseType
  else
    if(new.NmosCauseType = 0) then set new.CauseType = new.AdvCorrCauseType; -- If NmosCauseType is 'unknown' set to value of AdvCorrCauseType
    else
      if((new.AdvCorrCauseType = 2) or (new.NmosCauseType = 2)) then set new.CauseType = 2; -- If either AdvCorrCauseType or NmosCauseType are 'symptom' set to 'symptom'
      else
        if(new.NmosCauseType = 1) then set new.CauseType = 1; -- If NmosCauseType is 'Root Cause' set to 'Root Cause'
        else set new.CauseType = old.CauseType; -- Leave CauseType unchanged
        end if;
      end if;
    end if;
  end if;
end;
go

create or replace trigger AdvCorr_LPC_RC
group AdvCorr
priority 1
comment ''
every 17 seconds
when get_prop_value('ActingPrimary')%='TRUE'
begin
  -- Populate Root Cause Candidates table.
  for each row RcCand in alerts.status where
    RcCand.LocalObjRelate != 0
      and
    RcCand.Severity > 1
      and
    RcCand.AdvCorrCauseType = 0
      and
    RcCand.ProcessReq in (4,5,8,9)
  begin
    insert into alerts.AdvCorrLpcRcCand values (RcCand.Identifier,RcCand.ServerName,RcCand.ServerSerial,RcCand.Node,RcCand.AdvCorrCauseType,RcCand.LocalNodeAlias,RcCand.LocalPriObj,RcCand.LocalSecObj,RcCand.LocalTertObj,RcCand.LocalRootObj,RcCand.LocalObjRelate);
    update alerts.status via RcCand.Identifier set ProcessReq = ProcessReq - 4;
  end;

  -- For each potential Symptom event mark the corresponding Root Cause Candidates as root causes.
  for each row SymCand in alerts.status where
    SymCand.LocalObjRelate != 0
      and
    SymCand.Severity > 1
      and
    SymCand.Type in (1,3,11,12)
      and
    SymCand.AdvCorrCauseType in (0,1,2)
      and
    SymCand.LocalObjRelate in (3,7,11,12,13,14,15,19,23,27,28,29,30,31,35,39,43,44,45,46,47,51,55,59,60,61,62,63)
      and
    (SymCand.Node in ( select Node from alerts.AdvCorrLpcRcCand ) 
         or SymCand.LocalNodeAlias in 
            ( select LocalNodeAlias from alerts.AdvCorrLpcRcCand where LocalNodeAlias != '' ))

  begin
    update alerts.AdvCorrLpcRcCand set AdvCorrCauseType = 1 where
      AdvCorrCauseType = 0
        and
      (
        Node = SymCand.Node
          or
        (
          LocalNodeAlias != ''
            and
          LocalNodeAlias = SymCand.LocalNodeAlias
        )
      )
        and
      (
        (
          SymCand.LocalObjRelate in (3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63) -- SymCand LRO is a Parent of LPO
            and
          (
            LocalPriObj = SymCand.LocalRootObj
              or
            (
              LocalObjRelate in (2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62) -- RcCand LRO is an Alias of LPO
                and
              LocalRootObj = SymCand.LocalRootObj
            )
              or
            (
              LocalObjRelate in (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) -- RcCand LSO is an Alias of LPO
                and
              LocalSecObj = SymCand.LocalRootObj
            )
          )
        )
          or
        (
          SymCand.LocalObjRelate in (48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63) -- SymCand LSO is a Parent of LPO
            and
          (
            LocalPriObj = SymCand.LocalSecObj
              or
            (
              LocalObjRelate in (2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62) -- RcCand LRO is an Alias of LPO
                and
              LocalRootObj = SymCand.LocalSecObj
            )
              or
            (
              LocalObjRelate in (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) -- RcCand LSO is an Alias of LPO
                and
              LocalSecObj = SymCand.LocalSecObj
            )
          )
        )
      );
  end;

  -- Update new Root Causes in alerts.status
  for each row RootCause in alerts.AdvCorrLpcRcCand where RootCause.AdvCorrCauseType = 1
  begin
    update alerts.status via RootCause.Identifier set AdvCorrCauseType = 1,ProcessReq = 0 where
      AdvCorrCauseType = 0
        and
      LocalObjRelate not in (3,7,11,12,13,14,15,19,23,27,28,29,30,31,35,39,43,44,45,46,47,51,55,59,60,61,62,63);
    update alerts.status via RootCause.Identifier set AdvCorrCauseType = 1,ProcessReq = 2 where
      AdvCorrCauseType = 0
        and
      LocalObjRelate in (3,7,11,12,13,14,15,19,23,27,28,29,30,31,35,39,43,44,45,46,47,51,55,59,60,61,62,63);
  end;

  -- Remove all entries from Root Cause Candidates table
  delete from alerts.AdvCorrLpcRcCand;
end;
go

create or replace trigger AdvCorr_LPC_Sym
group AdvCorr
priority 1
comment ''
every 17 seconds
when get_prop_value('ActingPrimary')%='TRUE'
begin
  -- Populate Symptom Candidates table.
  for each row SymCand in alerts.status where
    SymCand.LocalObjRelate != 0
      and
    SymCand.Severity > 1
      and
    (SymCand.AdvCorrCauseType in (0,1) or (SymCand.AdvCorrCauseType = 2 and SymCand.AdvCorrServerSerial = 0))
      and
    SymCand.ProcessReq in (1,2,5,6,9,10)
  begin
    insert into alerts.AdvCorrLpcSymCand values (SymCand.Identifier,SymCand.AdvCorrServerName,SymCand.AdvCorrServerSerial,SymCand.Node,SymCand.AdvCorrCauseType,SymCand.LocalNodeAlias,SymCand.LocalPriObj,SymCand.LocalSecObj,SymCand.LocalTertObj,SymCand.LocalRootObj,SymCand.LocalObjRelate); 
    update alerts.status via SymCand.Identifier set ProcessReq = ProcessReq - 1;
  end;

  -- For each potential Root Cause event mark the corresponding Symptom Candidates as symptoms.
  for each row RcCand in alerts.status where
    RcCand.LocalObjRelate != 0
      and
    RcCand.Severity > 1
      and
    RcCand.Type in (1,3,11)
      and
    RcCand.AdvCorrCauseType in (0,1,2)
      and
    (RcCand.Node in ( select Node from alerts.AdvCorrLpcSymCand ) 
         or RcCand.LocalNodeAlias in 
            ( select LocalNodeAlias from alerts.AdvCorrLpcSymCand where LocalNodeAlias != '' ))

  begin
    update alerts.AdvCorrLpcSymCand set AdvCorrCauseType = 2, AdvCorrServerName = RcCand.ServerName, AdvCorrServerSerial = RcCand.ServerSerial where
      (AdvCorrCauseType != 2 or AdvCorrServerSerial = 0)
        and
      ( Node = RcCand.Node
          or
        ( LocalNodeAlias != ''
            and
          LocalNodeAlias = RcCand.LocalNodeAlias
        )
      )
        and
      (
        (
          LocalObjRelate in (3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63) -- SymCand LRO is a Parent of LPO
            and
          (
            LocalRootObj = RcCand.LocalPriObj
              or
            (
              RcCand.LocalObjRelate in (2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62) -- RcCand LRO is an Alias of LPO
                and
              LocalRootObj = RcCand.LocalRootObj
            )
              or
            (
              RcCand.LocalObjRelate in (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) -- RcCand LSO is an Alias of LPO
                and
              LocalRootObj = RcCand.LocalSecObj
            )
          )
        )
          or
        (
          LocalObjRelate in (48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63) -- SymCand LSO is a Parent of LPO
            and
          (
            LocalSecObj = RcCand.LocalPriObj
              or
            (
              RcCand.LocalObjRelate in (2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62) -- RcCand LRO is an Alias of LPO
                and
              LocalSecObj = RcCand.LocalRootObj
            )
              or
            (
              RcCand.LocalObjRelate in (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47) -- RcCand LSO is an Alias of LPO
                and
              LocalSecObj = RcCand.LocalSecObj
            )
          )
        )
      );
  end;

  -- Update new Symptoms in alerts.status
  for each row Symptom in alerts.AdvCorrLpcSymCand where Symptom.AdvCorrCauseType = 2
  begin
    update alerts.status via Symptom.Identifier set AdvCorrCauseType = 2, ProcessReq = 0, AdvCorrServerName = Symptom.AdvCorrServerName, AdvCorrServerSerial = Symptom.AdvCorrServerSerial where AdvCorrCauseType in (0,1) or AdvCorrServerSerial = 0;
  end;

  -- Remove all entries from Symptom Candidates table
  delete from alerts.AdvCorrLpcSymCand;
end;
go

create or replace trigger backup_succeeded
group automatic_backup_system
priority 1
comment 'Action to perform on a successful backup operation'
on signal backup_succeeded
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer Backup: ' + to_char(getdate) + %signal.path_prefix , 'Backup to ' + %signal.path_prefix + ' complete. Operation took ' + to_char( %signal.elapsed_time ) + ' seconds.', %signal.node, 'Automatic backup system', 0, 0, %signal.at, %signal.at, 'nco_objserv', 65534 );
end;
go

create or replace trigger automatic_backup
group automatic_backup_system
enabled false
priority 1
comment 'The automatic backup trigger\n\nBacks up all ObjectServer memory stores to a sequence of locations dependent on "num_backups"\n'
every 300 seconds
declare num_backups unsigned;
	backup_dir   unsigned;
begin
	-- Change this constant to control the number of backups maintained on disk
	set num_backups = 2;

	-- Get the current backup directory suffix
	for each row backup_record in alerts.backup_state where backup_record.KeyField = 0
	begin
		-- Read the suffix from the backup record
		set backup_dir = backup_record.CurrentBackup;	
	end;

	-- Do the backup
	alter system backup '$OMNIHOME/backup/' + getservername() + '/BACKUP_' + to_char( backup_dir );
	
	-- Increment the backup record suffix.
	-- This uses the MOD function to wrap back to 0 when the value of num_backups is reached
	update alerts.backup_state set CurrentBackup = mod( backup_dir + 1, num_backups);
end;
go

create or replace trigger backup_failed
group automatic_backup_system
priority 1
comment 'Action to perform on a failed backup operation'
on signal backup_failed
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer Backup: ' + to_char(getdate) + %signal.path_prefix , 'Backup to ' + %signal.path_prefix + ' failed. ' + %signal.error + '. Operation took ' + to_char( %signal.elapsed_time ) + ' seconds.', %signal.node, 'Automatic backup system', 0, 5, %signal.at, %signal.at, 'nco_objserv', 65534 );
end;
go

create or replace trigger backup_state_integrity
group automatic_backup_system
priority 1
comment ''
before insert on alerts.backup_state for each row
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_down
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server is down'
on signal gw_counterpart_down
when get_prop_value( 'BackupObjectServer' ) %= 'TRUE'
begin
	IDUC ACTCMD 'default','SWITCH TO BACKUP';       
	-- Enable the trigger groups that need to run in primary 
	execute procedure automation_enable;
	-- Set ActingPrimary property to TRUE
	alter system set 'ActingPrimary' = TRUE;
end;
go

create or replace trigger backup_startup
group gateway_triggers
enabled false
priority 1
comment 'On startup dont start the automations'
on signal startup
when (get_prop_value( 'BackupObjectServer' ) %= 'TRUE')
-- This is the backup server
begin
	-- Disable the trigger groups that need not to 
	-- run when object server acts as backup 
	execute procedure automation_disable;
end;
go

create or replace trigger resync_finished
group gateway_triggers
priority 1
comment 'Resync finished'
on signal gw_resync_finish
when (get_prop_value( 'BackupObjectServer' ) %= 'TRUE')
-- This is the backup server
begin
if ( %user.description = 'failover_gate') then
                -- This is gw_resync_finish signal from failover gateway 
                -- update Backup OS's ActingPrimary to reflect it as backup
                alter system set 'ActingPrimary' = FALSE;
end if;
end;
go

create or replace trigger pass_deletes
group gateway_triggers
enabled false
priority 1
comment 'Delete rows in destination server that do not exist in source after resync'
on signal gw_resync_finish
begin
	delete from alerts.status where OldRow = 1;
end;
go

create or replace trigger backup_counterpart_up
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server has come up'
on signal gw_counterpart_up
when get_prop_value( 'BackupObjectServer' ) %= 'TRUE'
begin
	IDUC ACTCMD 'default','SWITCH TO PRIMARY';	
	-- Disable the trigger groups that need not to
	-- run when object server acts as backup 
	execute procedure automation_disable;
end;
go

