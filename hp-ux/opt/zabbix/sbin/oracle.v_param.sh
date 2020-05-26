#!/usr/bin/sh
# $1 - command for case (process|session), $2 - Oracle SID, $3 - Database application directory (121|112_64)
executeFunction() {
	sid=$2;db=$3
	export ORACLE_SID=$2
	export ORACLE_HOME=/oracle/$sid/$db
	export ORACLE_SID=$sid
	export PATH=/usr/bin:/usr/sbin/:$ORACLE_HOME/bin
	export nls_lang=american_cis.cl8mswin1251
	case $1 in
	'process')
		sql="set pagesize 0
		set numwidth 18;
		select count(*) from v\$process;"
			;;
	'session')
		sql="set pagesize 0
		set numwidth 18;
		select count(*) from v\$session;"
			;;
	esac
	echo "$sql" | sqlplus -s /nolog @/opt/zabbix/cont.sql | awk '{print $1}'
}
if [ $# -ge 3 ]
	then
	executeFunction
	else 
		echo "No arguments supplied"
		echo "\$1 - command (process|session), \$2 - Oracle SID, \$3 - Database application directory (121|112_64)"
		exit 1
fi