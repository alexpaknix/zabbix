#!/sbin/sh
case $1 in
	"check")
	echo "Check Zabbix files - none"
	;;
	
	"install")
	#echo 'Check usage:' $0 'check\nFor check files'
	chown -R zabbix:users /opt/zabbix
	chmod -R 744 /opt/zabbix/sh
	chmod +x /opt/zabbix/{sbin,bin}/*
	#rm -rf /opt/zabbix/tmp/*
	chmod +x /sbin/init.d/zabbix.sh
	ln -s /sbin/init.d/zabbix.sh /sbin/rc3.d/S999zabbix
	;;
esac
