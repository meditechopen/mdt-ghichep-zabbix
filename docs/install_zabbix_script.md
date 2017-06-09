# Hướng cài đặt Zabbix server bằng script

- Chuẩn bị :

	 Mô hình 
	 
	<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/mo%20hinh.png?raw=true">
	
	IP Planing
	
	<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/ip.PNG?raw=true">

- Download script vào cài đặt trên server

```sh
su -                 //
cd /home/minhkma     // di chuyển đến thư mục mình muốn tải script về   
wget https://raw.githubusercontent.com/meditechopen/mdt-ghichep-zabbix/master/scripts/install_zabbix_server.bash     // tải script
chmod +x install_zabbix_server.bash         // Phân quyền cho script vừa tải về
bash install_zabbix_server.bash          // Chạy script
```
- Sau khi cài đặt trên server thành công, mở trình duyệt web tại địa chỉ http://$IP_Zabbix_server/zabbix, thực hiện cài đặt trên web 

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-01.png?raw=true">

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-02.png?raw=true">

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-03.png?raw=true">

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-04.png?raw=true">

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-05.png?raw=true">

Nhập tên database và password

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-06.png?raw=true">

Tên đăng nhập mặc định là Admin/zabbix

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-07.png?raw=true">

<img src="https://github.com/nguyenminh12051997/mdt-ghichep-zabbix/blob/master/images/setup-08.png?raw=true">
