#!/sbin/sh
. /opt/zabbix/oraenv/BWn
sql="set pagesize 0
set numwidth 18;
select tablespace_name,round((TABLESPACE_SIZE*8)*1024-(USED_SPACE*8)*1024) from dba_tablespace_usage_metrics;"
echo "$sql" | sqlplus -s /nolog @/opt/zabbix/conn.sql | awk '/PSAPSID\ / {print $2}'
