#!/usr/bin/sh
# $1 - таблспейс $2 - SID $3 - DB (121|112_64)
executeFunction () {
  tabs=$1;sid=$2;db=$3
  # Присвоение системных переменных
  export ORACLE_SID=$2
  export ORACLE_HOME=/oracle/$sid/$db
  export ORACLE_SID=$sid
  export PATH=/usr/bin:/usr/sbin/:$ORACLE_HOME/bin
  export nls_lang=american_cis.cl8mswin1251
  # SQL запрос
  sql="set pagesize 0
  set numwidth 18;
  col ROUND((TABLESPACE_SIZE*8)*1024-(USED_SPACE*8)*1024) heading "size";
  select tablespace_name,round((TABLESPACE_SIZE*8)*1024-(USED_SPACE*8)*1024) from dba_tablespace_usage_metrics;"
  results=`echo "$sql" | sqlplus -s /nolog @/opt/zabbix/cont.sql`
  # Условие, если нет таблспейса, то вывести -1, если есть, то вывести размер
  resif=`echo "$results" | grep -w $tabs | awk '{ print $1 }'`
  if [ -z "$resif" ]; then echo "-1"
    else echo "$results"|grep -w $tabs|awk '{print $2}'
  fi
}
if [ $# -ge 3 ]
	then
	executeFunction
	else 
		echo "No arguments supplied"
		echo "\$1 - Tablespace name \$2 - Oracle SID \$3 - Database application directory (121|112_64)"
		exit 1
fi