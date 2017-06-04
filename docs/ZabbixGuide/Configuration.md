# Mục lục
## [I. Giới thiệu](#gt)
## [II. Các thành phần ](#tp)
### [2.1 Host Groups](#21)
### [2.2 Template](#22)
### [2.3 Host](#23)
#### [2.3.1 Creat host](#231)
#### [2.3.2 Filter host](#232)
#### [2.3.3 Import host](#233)
#### [2.3.4 Edit Mass host](#234)
### [2.4 Maintenance](#24)
### [2.5 Actions](#25)
### [2.5.1 Cảnh báo leo thang](#251)
### [2.6 Discovery](#26)
### [2.7 IT Service](#27)

-------------------------------------------------

<a name=gt></a>
## I. Giới thiệu

Phần này chứa tất cả các phần cấu hình về :
<ul>
<li>Host groups : Chứa tất cả các nhóm, mỗi nhóm chứa các host có chung đặc điểm về mặc logic nào đó(hệ điều hành,...)</li>
<li>Template : Chứa các kịch bản sẵn có cho từng kiểu hệ thống(Windows,Linux,SNMP,...) bao gồm một số các item, triiger,... </li>
<li>Host : tập hợp tất cả các host mà Zabbix đang giám sát.</li>
<li>Maintenance : Cấu hình bảo trì cho các máy chủ </li>
<li>Actions : Nơi lưu trữ, thiết lập cách hành động tác độn lên hệ thống do người quản trị thiết lập, hoặc các hành động được định nghĩa sẵn.</li>
<li>Discovery : Nơi cấu hình,thiết lập các quy tắc khám phá hệ thống </li>
<li>IT Service : Nơi cấu hình và duy trì các dịch vụ cho hệ thống.</li>
</ul>

Sau đây, chúng ta sẽ đi làm rõ từng phần nhỏ trong các phần lớn ở trên

<a name=tp></a>
## II. Các thành phần

<a name=21></a>
### 2.1 Host Group

Như đã giới thiệu ở trên, phần này cho phép người quản trị cấu hình các host thành các nhóm khác nhau, mỗi nhóm đều có ít nhất một điểm chung về mặc logic nhằm quản lý các host một cách hiệu quả hơn.

![hg](/images/host_groups.png)

| Cột | Miêu tả |
|-----------|-------------|
| Name | Tên của nhóm, Click vào để thiết lập cấu hình các máy chủ |
| Host | Số lượng host ở trong nhóm đó. Click vào sẽ hiện ra tất cả các host trong group đó.
| Templates| Số lượng các Template trong nhóm. Click vào sẽ hiện tất cả các template có tronh nhóm.
| Members | Tên của các host trong nhóm,máy đang được giám sát màu xanh lá cây, ngược lại là màu đỏ |
| Info | Chứa các thông tin lỗi hoặc liên quan đến hiển thị |

**Tùy chọn chỉnh sửa theo nhóm :**
- Enable host : Thay đổi trạng thái của tất cả các host trong nhóm cừa chọn sang trạng thái "Giám sát"
- Disable host : Thay đổi trạng thái của tất cả các host trong nhóm sang trạng thái "Không giám sát"
- Delete : Xóa tất cả các host ở trong nhóm.

**Creat host group** : Tạo thêm một nhóm mới

![hg](/images/Creat_hostgroup.png)

- Group name : Tên nhóm
- Host in : Các host trong group
- Other host| Groups : Thêm host từ các group khác

<a name=22></a>

### 2.2 Template

Trong mục này, người quản trị có thể tạo, sửa, xóa các Template. Trong mục này cũng cung cấp cách tạo, sửa xóa các Applicaton,item , trigger , Graphs, Screens, Discovery rules và Web scearios.

![Tp](/images/Template.png)

Trong đó :

|Cột | Mô tả |
|-----------|---------------|
| Templates | Hiển thị tất cả các Template có sẵn hoặc được tạo thêm trên Zabbix Server |
|Applications | Hiển thị số lượng Application trong mỗi Template. Khi click vào sẽ hiện ra các Application có trong Template |
| Item | Hiển thị số lượng các item trong mỗi Template.  Khi click vào sẽ hiện ra các Item  có trong Template |
| Graphs | Hiển thị số lượng Graph có trong Teamplate.  Khi click vào sẽ hiện ra các Graphs có trong Template |
| Screens | Hiên thị số lượng các Screen trong Teamplate .  Khi click vào sẽ hiện ra các Screen có trong Template |
| Discovery | Hiển thị số lượng các Discovery trong Template |
| Web | Hiển thị số lượng các web trong Template |
| Linked templates | Hiển thị tất cả các template kết nối với nó |
|Linked to | Hiển thị các liên kết mà Template đó kết nối |

**Tùy chọn chỉnh sửa theo Template :**
- Export : Xuất Template thành 1 tệp tin XML
- Delete : Xóa các Template khỏi các liên kết của nó với các host.
Delete and Clear : Xóa Template và các liên kết của nó với host.

**Tạo 1 Template :**

Để tạo 1 Template có 2 cách :
- Cách 1 :  Click chuột vào `Creat Template` góc trên bên phải màn hình.

Sau khi click sẽ hiện ra :
![cf](/images/Creat_template.png)

Trong đó :

| Hàng | Mô tả |
|----------------|----------|
| Template name | Tên Template |
| Visible name | Tên hiển thị của template |
| Group | Thêm các group kết nối đến Template |
| New group | Tạo thêm 1 group mới liên kết đên Template |
| Host/templates | Liên kết các host hoặc các Templates khác đến Template đang tạo |
| Description | Mô tả về Template đang tạo |

Tạo liên kết các Template :

![cf](/images/Linked_t.png)

Người quản trị có thể liên kết các Template với nhau nhằm bổ sung các thông số cho nhau giữa các template.


- Cách 2 : Nhập từ 1 file Template.xml : Nếu đã có một template dạng file xml thì chỉ cần upload lên, Zabbix sẽ tự động convert sang các thông số cho Template.

<a name=23></a>
### 2.3 Hosts

Trong mục này , người quản trị có thể  cấu hình và huy trì các host.

Khi click vào mục này, một danh sách hiện ra :

![host](/images/hosts.png)

Trong đó :

| Cột | Mô tả |
|---------------|---------------|
| Name | Tên của host. Click vào tên Host sẽ hiển thị ra khung cấu hình host|
| Elements (Applications, Items, Triggers, Graphs, Discovery, Web)| Click vào tên các thành phần sẽ hiển thị các item, trigger,...Số lượng các phần tử tương ứng hiển thị bằng màu xám|
| Interface | Hiển thị địa chỉ và cổng lắng nghe của Host |
| Status | Hiển thị trạng thái của host. Có 2 trạng thái Enable màu xanh và Disable màu đó |
| Availability | Tính khả dụng của host, cho biết Host đang hoạt động ở chế độ nào và trạng thái kết nối ra sao.Green : Khả dụng, Red : không khả dụng, Gray : Không biết hoặc không được cấu hình |
|Agent encryption | Hiển thị trạng thái mã hóa đến các host . None : không mã hóa, PSK : sử dụng pre-shared key, Cert : sử dụng certificate |
| Info | Hiển thị các thông tin lỗi |

<a name=231></a>
#### 2.3.1 Creat Host
![host](/images/Creat_hosts.png)

Trong đó :
- Host name : Tên máy chủ muốn thêm
- Visible name : Tên hiển thị lên Zabbix
- Group : Chọn nhóm quản lý host đó
- New Group : Thêm một nhóm mà không có trong danh sách
- Agent Interface : Chọn kiểu kết nối đến Host (Theo IP , Theo tên miền)
- SNMP interface : Nếu host đó là Router, Switch ,.. hay các thiết bị mạng.
- JMX Interface : Nếu host đó là các Java Application.
- IPMI Interface : Nếu host đó là Intelligent Platform Management.
- Description: Thêm ghi chú hoặc định nghĩa cho host.

Trong mục Creat Host còn có một số tab bên cạnh như :  

**Templates :** Mục này chứa các Template liên kết tới Host.

![host](/images/Host_templates.png)

Trong đó :
- Linked templates : chứa các Teamplate mà host đã kết nối.
- Link new templates: thêm các Template kết nối với host.

**IPMI :** Chứa các thuật toán xác thực và mức độ ưu tiên cho IPMI.

![host](/images/Host_IPMI.png)

- Mục này cần phải cung cấp tài khoản của IPMI để mã hóa xác thực.

**Macros :** gán các biến Macro cho host

![host](/images/Host_macros.png)

**Host inventory :** Thêm các thông tin cho Host,có thể thêm bằng tay hoặc Zabbix sẽ tự động check và điền các thông tin.

![host](/images/Host_inventory.png)

**Encryption :** Chọn phương thức mã hóa đường truyền từ Zabbix Server đến Host.Mặc định là không mã hóa .

![host](/images/Host_encrypt.png)

Trong đó :
- Connection to host : Phương thức mã hóa đường truyền tới host.
- Connection from host : Phương thức mã hóa đường truyền từ host về Zabbix Server.



<a name=232></a>
#### 2.3.2 Filter Host

Chức năng này cho phép hiển thị các Host theo các tùy chọn Lọc :
![host](/images/hosts_filter.png)

- Name like : Lọc theo tên
- DNS like : Lọc theo DNS
- IP like : Lọc theo  địa chỉ IP
- Port like : Lọc theo port dịch vụ

<a name=233></a>
#### 2.3.3 Import Host
Khi chọn Import host,Zabbix sẽ cho phép người quản trị thêm các Host bằng các file XML .

![host](/images/Import_hosts.png)

Có một số các tùy chọn sẵn có hoặc người quản trị có thể thêm các tùy chọn cho việc tạo thêm host mới cho hệ thống của mình.

<a name=234></a>
#### 2.3.4 Edit Mass Host

![host](/images/Host_mass.png)

Các tùy chọn này cho phép thay đổi các thông số cùng một lúc một hoặc nhiều host.
- Enable : thay đổi trạng thái Host sang "Monitored"
- Disable : Thay đổi trạng thái host sang "Not Monitored"
- Export : Chuyển host thành file XML
- Mass update : Đồng loạt cập nhật các thuộc tính cho máy chủ
- Delete : Xóa các host

<a name=24></a>
### 2.4 Maintenance

Mục này cấu hình thời gian bảo trì máy chủ

![host](/images/maintenance_periods.png)

| Cột | Mô tả |
|--------------|--------------|
| Name | Tên của thời gian bảo trì. Click vào sẽ hiện ra bảng cấu hình bảo trì .
| Type | Loại bảo trì , có 2 loại : trong quá trình bảo trì vẫn thu thập dữ liệu và không thu thập dữ liệu |
| Active since | Ngày và thời gian kích hoạt bảo trì hoạt động |
| Active till | Ngày và thời gian bảo trì ngừng hoạt động |
| State | Trạng thái bảo trì . Có 3 loại : Approaching - Chuẩn bị active , Active - đang active, Expired- không active |
| Description | Mô tả thời gian bảo trì |

<a name=25></a>
### 2.5 Actions

Phần này giúp người quản trị cấu hình và duy trì các hành động, tác vụ.Hiển thị các danh sách các hành động được gán cho các sự kiện được cấu hình trước.

![host](/images/actions.png)

Trong đó :

| Cột | Mô tả |
|---------------|---------------|
| Name | Tên hành động . Click vào sẽ hiển thị ra cấu hình hành động đó |
| Conditions | Các điều kiện để Action  xảy ra |
| Operations | Các hoạt động sẽ diễn ra được cấu hình trong Action |
| Status | Hiển thị trạng thái của Action( Enable hoặc Disable) |

Để cấu hình một Action mới, Click `Create Action` ở góc trên bên phải.

![host](/images/action_create.png)

**Conditions :**

Để Action kích hoạt thì cần có các điều kiện đi kèm

![host](/images/action_condition.png)

Trong đó :

- Type of calculation : Biểu thức logic giữa các điều kiện.
- Conditions : Các điều kiện
- New condition : Thêm điều kiện mới

Điều kiện càng khắt khe thì action hoạt động càng chuẩn và việc thực thi càng mang lại hiệu quả cao.Nhưng tránh việc các Điều kiện xung đột với nhau khiên action hoạt động sai hoặc là không hoạt động.

**Operations :**

Chứa các hành động mà Action sẽ sử dụng để xử lý khi các điều kiện xảy ra.

![host](/images/action_operation.png)

- Default operation step duration : thời gian mặc định để chuyển giữa các mức(mặc định tối thiểu là 60s)
- Action operation : Các hành hoạt động theo từng step sẽ được thực hiện từ trên xuống dưới.

<a name=251></a>
#### 2.5.1 Cảnh báo leo thang

Phần này giúp tăng mức độ xử lý vấn đề khi có cảnh báo xảy ra.

**Ví dụ 1**
Để cấu hình gửi một thông báo lặp đi lặp lại mỗi 30 phút một lần (tổng cộng 5 lần) đến Admin Zabbix ta cấu hình như sau :

![host](/images/action_lt.png)

Trong đó :
- Step : Số bước thực hiện hành động.
- Step duration : Thời gian thực hiện step tiếp theo.
- Operation : Loại thực hiện hành động. Có thể là gửi mail cảnh báo hoặc thực hiện các câu lệnh điều khiển.
- Send to User Groups : Thực hiện chuyển các hành động này đến 1 nhóm nào đó.
- Send to User : Thực hiện chuyển hành động này đến 1 người dùng hệ thống nào đó.
- Send only to : Sử dụng phương thức nào để gửi cảnh báo .
- Default message : Có thể sử dụng mẫu Message mặc định hoặc chỉnh sửa tùy ý.

**Ví dụ 2**

Gửi thông báo về 1 vấn đề mà sau 1 khoảng thời gian nào đó mà vẫn chưa được xử lý :

![host](/images/action_lt2.png)

Thông báo này sẽ được gửi đến toàn bộ các User của nhóm Zabbix Admin ở bước 3 của kịch bản nếu như sau 1 tiếng mà vấn đề vẫn chưa được giải quyết.

**Ví dụ 3**

Một trường hợp phức tạp hơn . Sau khi nhiều tin nhắn gửi đến quản trị viên mà vẫn không được giải quyết và leo thang lên đến nhóm quản trị Zabbix.Zabbix sẽ gửi tiếp cho Nhóm quản trị IT nếu sau 2 tiếng mà vẫn chưa giải quyết được vấn đề.

- Bước 1 : Gửi thông báo đến Admin Zabbix 4 lần, mỗi lần cách nhau 20p.

![host](/images/action_lt3.png)

- Bước 2 : Gửi thông báo đến tất cả thành viên trong nhóm quản trị Zabbix nếu sau 1 tiếng mà chưa được giải quyết :

![host](/images/action_lt4.png)

- Bước 3 : Gửi thông báo đến toàn bộ nhóm IT Manager nếu sau 2 tiếng vấn đề chưa được giải quyết :

![host](/images/action_lt5.png)

<a name=26></a>
### 2.6 Discovery

Phần này giúp người quản trị khám phá ra các thiết bị hoạt động trong mạng hoặc hoặc một dải mạng nào đó sau đó duy trì sự giám sát đối với chúng.

Danh sách các quy tắc và các dải mạng được khám phá :

![host](/images/discovery_rules.png)

Trong đó :

| Cột | Mô tả |
|------------|--------------|
| Name | Tên của mạng đang khám phá |
| Ip Range | Dải mạng đang khám phá |
| Delay | Tần suất thực hiện khám phá |
| Check | Các loại kiểm tra để phát hiện ra các thiết bị |
| Status | Trạng thái của khám phá (Enable, Disable) |

- Để cấu hình một quy tắc khám phá mới , Click vào `Create Discovery Rule`.Một hộp thoại sẽ hiển thị ra, các thông số cài đặt như bảng trên .

Các tùy chọn chỉnh sửa theo nhóm :
- Enable : Chuyển trạng thái khám phá thành `Bật`
- Disable : Chuyển trạng thái khám phá sang `Tắt`
- Delete : Xóa trạng thái khám phá

Để sử dụng các tính năng này thì cần phải chọn một hoặc nhiều khám phá và thực hiện nó.

<a name=27></a>
### 2.7 IT Services

Phần này giúp người quản trị có thể cấu hình và duy trì các dịch vụ về IT.

Các dịch vụ này bắt đầu từ chỉ một thư mục gốc là thư mục `/root` . Coi nó như là một điểm khởi đầu của hệ thống và xây dựng các hệ thống phân cấp theo dõi dựa trên nó. Click vào `Add Child` để thêm các dịch vụ và quản lý nó.

![host](/images/itservices_conf.png)
