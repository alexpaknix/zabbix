whenever sqlerror exit failure 
set verify off echo off feedback off heading off pagesize 0 trimout on trimspool on termout off 
conn zabbix/<password>
column retvalue format a15
set linesize 300
