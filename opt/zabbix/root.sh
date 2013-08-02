#!/sbin/sh
case $1 in
	"check")
	echo "Check Zabbix files"
	;;
	
	* )
	echo 'Check usage:' $0 'check\nFor check files'
	chown -R zabbix:users /opt/zabbix
	chmod +x /opt/zabbix/sh/*.sh
	chmod +x /opt/zabbix/sbin/*
	chmod +x /opt/zabbix/bin/*
	rm -rf /opt/zabbix/tmp/*
	chmod +x /sbin/init.d/zabbix
	#ln -s /sbin/init.d/zabbix /sbin/rc3.d/S999zabbix
	;;
esac