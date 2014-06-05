install:
	install main server /usr/local/bin
	which dialog >/dev/null 2>&1 || yum -y install dialog /usr/local/bin
	which xinetd >/dev/null 2>&1 || yum -y install xinetd
	which nc >/dev/null 2>&1 || yum -y install nc
	grep -q "`cat main.services`" /etc/services || cat main.services >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	/etc/init.d/xinetd restart
	
main.pot: 
	xgettext -o main.pot -a -L Shell main

clone:
	https://github.com/fithritama/Project1.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

