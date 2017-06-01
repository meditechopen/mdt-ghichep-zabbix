# Mục lục
## [I. Giới thiệu](#gt)
## [II. Các thành phần ](#tp)
### [2.1 Host Groups](#21)
### [2.2 Template](#22)
### [2.3 Host](#23)
### [2.4 Maintenance](#24)
### [2.5 Actions](#25)
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

** Tạo 1 Template :**

Để tạo 1 Template có 2 cách :
- Cách 1 :  Click chuột vào `Creat Template` góc trên bên phải màn hình.

Sau khi click sẽ hiện ra :
![cf](/images/Creat_template)

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

**Tùy chọn chỉnh sửa theo Host :**
- Enable : thay đổi trạng thái Host sang "Monitored"
- Disable : Thay đổi trạng thái host sang "Not Monitored"
- Export : Chuyển host thành file XML
- Mass update : Đồng loạt cập nhật các thuộc tính cho máy chủ
- Delete : Xoa các host

**Filter**

Chức năng này cho phép hiển thị các Host theo các tùy chọn Lọc :
![host](/images/hosts_filter.png)

- Name like : Lọc theo tên
- DNS like : Lọc theo DNS
- IP like : Lọc theo  địa chỉ IP
- Port like : Lọc theo port dịch vụ
