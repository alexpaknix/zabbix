Monitoring for ORACLE DB on HP-UX, SUSE, Windows
===================
Oracle DB: 11.2.x.x & 12.1.x.x

Application: SAP

Zabbix 2.x, 3.x 

### On HP-UX and Linux
Zabbix directory: /opt/zabbix

User: zabbix

For Linux Installation put *zabbix* file from repository to init.d and create symlink ...

Enviroment: Shell
### On Windows 
Zabbix directory C:\zabbix

user: any

## Hierarchy of the zabbix directory
* root - on this directory stored pid and log file
  * /conf - configuration files
  * /bin - zabbix appl
  * /sbin - zabbix appl
  * /sh - all custom scripts

## Used {$MACROS}
**{$SID}** - SID of SAP System.

**{$ORAVER}** - Used Oracle version. This value attempt  to path on your oracle installation directory.

....
## ....
