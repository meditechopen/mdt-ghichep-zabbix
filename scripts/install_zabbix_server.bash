#! /bin/bash
function lsb {
# Kiểm tra sự tồn tại của lsb_release
	if [[ -x $(command -v lsb_release 2>/dev/null) ]]; then
			return
		fi
# Nếu không sẽ tải lsb_release cho từng phiên bản distro trong linux 
	if [[ -x $(command -v apt-get 2>/dev/null) ]]; then
			sudo apt-get install -y lsb-release
	elif [[ -x $(command -v zypper 2>/dev/null) ]]; then
			sudo zypper -n install lsb
	elif [[ -x $(command -v dnf 2>/dev/null) ]]; then
			sudo dnf install -y redhat-lsb-core
	elif [[ -x $(command -v yum 2>/dev/null) ]]; then
			sudo yum install -y redhat-lsb-core
	else
			echo "Unable to find or auto-install lsb_release"
		fi
}

# Hiển thị tên hệ distro vào phiên bản distro bằng các option trong lsb_release
function hienthi {
		a=$(lsb_release -r -s)
		b=$(lsb_release -c -s)
		c=$(lsb_release -i -s)
		echo "Ban dang su dung he dieu hanh $a $b $c"
			sleep 5
}

lsb
hienthi

# Khai báo mật khẩu Mysql và database tạo rao dùng để lưu trữ cho Zabbix 
function khaibao {
	echo "Tao user mysql va phan quyen"
	echo "Nhap MYSQL_PASS cho tai khoan root"
	read p
	echo "Nhap ten CSDL muon tao"
	echo "Enter voi ten CSDL mac dinh la zabbix"
	read u
	u=${u:-zabbix}
	echo "Ban da tao 1 CSDL moi co ten la $u"
	echo "Nhap password cho CSDL muon tao" 
	echo "Enter voi password CSDL mac dinh la minhkma"
	read m 
	m=${m:-minhkma}
	echo "Ban vua tao mat khau cho CSDL $u la $m"
	sleep 5
}


# Dùng các lệnh SQL để tạo một cơ sở dữ liệu 
function sql {
cat << EOF | mysql -uroot -p$p
create database $u character set utf8 collate utf8_bin;
grant all privileges on $u.* to zabbix@localhost identified by '$m';
flush privileges;
EOF
}

# Thực hiện chuỗi câu lệnh cho Ubuntu 14.04 để cài đặt zabbix server 
function ubuntu {
	echo "Chuong trinh cai dat zabbix server tren $c $a"
	echo "Cai dat naoooooo"
	sleep 5
	wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb
	echo "Cai dat goi tai ve"
	dpkg -i zabbix-release_3.0-1+trusty_all.deb
	apt-get update
	echo "Tai goi cai dat Mysql"
	khaibao
# Các chèn password Mysql khi tải mới lần đầu mà không cần nhập trên màn hình 
	echo mysql-server mysql-server/root_password password $p | debconf-set-selections
	echo mysql-server mysql-server/root_password_again password $p | debconf-set-selections
	apt-get install zabbix-server-mysql zabbix-frontend-php -y
	sql
	zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uroot -p$p $u
	echo "backup lai file cau hinh"
	cp /etc/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.bka
# Sửa đổi các thông số như DBHost, DBName, DBPassword
	echo "sua file cau hinh"
	sed -i 's/# DBHost=localhost/DBHost=localhost/g' /etc/zabbix/zabbix_server.conf
	sed -i 's/# DBName=zabbix/DBName=$u/g' /etc/zabbix/zabbix_server.conf
	sed -i "s/# DBPassword=/DBPassword=$m/g" /etc/zabbix/zabbix_server.conf
	sed -i 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Asia\/Ho_Chi_Minh/g' /etc/apache2/conf-enabled/zabbix.conf
	echo "Khoi dong lai dich vu"
	service zabbix-server start
	service apache2 restart
}

function centos {
	echo "Chuong trinh cai dat zabbix server tren $c $a"
	echo "Cai dat naoooooo"
	sleep 5
	rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
	yum -y install mysql-community-server
	/usr/bin/systemctl enable mysqld
	/usr/bin/systemctl start mysqld
	khaibao
# Tạo password cho Mysql lần đầu 
	mysqladmin -u root password $p
	rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
	yum install zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-java-gateway -y
	sql
	zcat /usr/share/doc/zabbix-server-mysql-3.0.9/create.sql.gz | mysql -uroot -p$p $u
	echo "backup lai file cau hinh"
	cp /etc/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.bka
# Sửa các thông số 
	echo "sua file cau hinh"
	sed -i 's/# DBHost=localhost/DBHost=localhost/g' /etc/zabbix/zabbix_server.conf
	sed -i 's/# DBName=zabbix/DBName=$u/g' /etc/zabbix/zabbix_server.conf
	sed -i "s/# DBPassword=/DBPassword=$p/g" /etc/zabbix/zabbix_server.conf
	sed -i 's/# php_value date.timezone Europe/php_value date.timezone Asia/g' /etc/httpd/conf.d/zabbix.conf
	sed -i 's/Riga/Ho_Chi_Minh/g' /etc/httpd/conf.d/zabbix.conf
# Khởi động các dịch vụ
	service httpd restart
	systemctl start zabbix-server 
	systemctl enable zabbix-server 
	setsebool -P httpd_can_connect_zabbix on
# Mở filewall
	firewall-cmd --add-service={http,https} --permanent 
	firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent 
	firewall-cmd --reload
}


if [[ "$c" == "Ubuntu" ]] && [[ "$a" == "14.04" ]]; then
	ubuntu
elif [[ "$c" == "CentOS" ]] && [[ "$a" == "7.3.1611" ]]; then
	centos
else
    echo "script zabbix nay chi viet de cai dat rieng cho Ubuntu 14.04 va CentOS7 "
fi 