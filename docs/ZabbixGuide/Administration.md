# Mục lục
## [I. Giới thiệu ](#gt)
## [II. Các thành phần](#tp)
### [2.1 General ](#21)
### [2.2 Proxies](#22)
### [2.3 Authencation](#23)
### [2.4 User Group](#24)
### [2.5 Users ](#25)
### [2.6 Media Types](#26)
### [2.7 Scripts](#27)
### [2.8 Queue](#28)

<a name =gt></a>
## I. Giới thiệu

Các chức năng của phần này chỉ dành cho quản trị của Zabbix, Các user thuộc nhóm Supper Adminstrator

<a name=21></a>
### 2.1 General

Mục này cho phép người quản trị cấu hình tùy chỉnh giao diện cho Zabbix Webinterface

Có thể tùy chỉnh rất nhiều giao diện như :
- GUI
- HouseKeeping
- Images
- Icon mapping
- Regular expressions
- Macros
- Value mapping
- Working time
- Trigger severities
- Trigger displaying options
- Other configuration parameters

![ad](/images/general_dropdown.png)

**1 : GUI**

Phần này cung cấp một số tùy chỉnh mặc định liên quan đến giao diện người dùng.

![ad](/images/general_gui.png)

Trong đó :

| Tham số | Mô tả |
|--------------|-------------|
| Default theme | Chủ đề mặc định của giao diện. Thường là màu xanh da trời |
| Dropdown first entry | Chọn nó là mục đầu tiên trong Drop down |
| Search/Filter elements limit | số lượng tối đa hiển thị các hàng trong tìm kiếm và lọc |
| Max count of elements to show inside table cell | Giới hạn hiển thị trong bảng |
| Enable event acknowledges | Cho phép các event trong Zabbix kích hoạt |
| Show events not older than (in days) | Cho phép hiển thị trạng thái Trigger bao nhiêu ngày |
| Max count of events per trigger to show | Số event được kích hoạt tối đa trong màn hình trạng thái |
| Show warning if Zabbix server is down | Cho phép hiển thị một thông điệp cảnh báo khi không kết nối được Zabbix Server |

**2 Housekeeper**

Phần này quy định các thời gian định kì được thực hiện bởi Zabbix . Quá trình xóa thông tin hết hạn và thông tin được xóa bởi người dùng .Có thể tùy chỉnh các dữ liệu được lưu tối đa trong bao lâu trên Zabbix.

![ad](/images/general_housekeeper.png)

**3 Images**

Chứa tất cả các hình ảnh, icon, background được hiển thị trong Zabbix .

![ad](/images/general_images.png)

Có thể thay đổi bằng cách upload các icon hoặc tệp tin ảnh lên để thay thế các hình ảnh mặc định.

![ad](/images/general_img_upload.png)

**4 Icon mapping**

Phần này cho phép tạo biểu tượng bản đồ của một host với các biểu tượng nhất định. Các thông tin trong các tùy chọn đều phục vụ cho việc tạo bản đồ.

Để tao một biểu tượng mới, Click vào `Create icon map`

![ad](/images/general_iconmap.png)

Trong đó :

| Tham số | Mô tả |
|-------------|---------------|
| Name | Tên icon map (duy nhất) |
| Mappings | Danh sách các ánh xạ mà Icon map tham chiếu đến |
| Inventory field | |
| Expression | Mô tả biểu thức chính quy |
| Icon | Icon được dùng nếu biểu thức chính quy lỗi |
| Default | icon mặc định được dùng |

**5 Regular expressions**

Phần này cho phép tạo các biểu thức chính quy.

**6 Macros**

Phần này cho phép xác định các Macros trên toàn hệ thống

![ad](/images/general_macros.png)

<a name=22></a>
### 2.2 Proxies

Phần này cho phép cấu hình các Proxy trên giao diện Zabbix

Hiển thị danh sách các Proxies :

![ad](/images/proxies.png)

Trong đó :

| Cột | Mô tả |
|---------|----------|
| Name | Tên của Proxy |
| Mode | Chế độc của Proxy (active hoặc passive) |
| Encryption | Mã hóa kết nối từ Zabbix Server đến Proxy |
| Last seen (age) | Thời gian tại thời điểm kết nối cuối cùng với Proxy |
| Host count | Số Host mà Proxy quản lý |
| Item count | Số lượng Item mà Proxy sử dụng |
| Required performance (vps) | Hiệu suất Proxy |
| Host | Danh sách các host mà proxy quản lý |

Các tùy chọn theo nhóm :
- Enable : Chuyển trạng thái giám sát hosts của Proxy sang kích hoạt
- Disable : Chuyển trạng thái giám sát hosts của Proxy sang hủy kích hoạt
- Delete : Xóa proxy

<a name=23></a>
### 2.3 Authencation

Phần này cấu hình các phương pháp xác thực người dùng Zabbix : Thẩm định nội bộ, LDAP và HTTP

![ad](/images/authentication.png)

Mặc định là Interal Authencation .

- Internal : Xác thực ngay bên trong Zabbix
- LDAP : Xác thực bên ngoài LDAP , có thể được sử dụng để kiểm tra người dùng và mật khẩu. Lưu ý rằng tài khoản đó phải tồn tại bên trong Zabbix.
- HTTP : Xác thực dựa trên Apache(HTTP) có thể được sử dụng để kiểm tra người dùng và mật khẩu.

<a name=24></a>
### 2.4 User groups

Phần này hiển thị, quản lý các nhóm trong Zabbix

Phần dưới hiển thị danh sách các nhóm nguwoif dùng hiện có và hiển thị chi tiết các thông tin

![ad](/images/user_groups.png)

Trong đó :

| Cột | Mô tả |
|-----------|---------|
| Name | Tên của nhóm |
| # | Số người dùng trong nhóm |
| Members | Hiển thị người dùng trong nhóm |
| Frontend access | Phương thức xác thực đầu vào (Internal, LDAP,HTTP)|
| Debug mode | Trạng thái chế độ gỡ lỗi |
| Status | Trạng thái nhóm |

Tùy chọn chỉnh sửa tập thể :

- Enale : Thay đổi trạng thái nhóm sang kích hoạt
- Disable : Thay đổi trạng thái nhóm sang hủy kích hoạt
- Enable debug mode : Bât chế độ gỡ lỗi
- Disable debug mode : Tắt chế độ gỡ lỗi
- Delete : Xóa nhóm.

Để tạo một nhóm mơi, click vào `Create new Group`.

![ad](/images/group_create.png)

Cấp quyền cho nhóm tới các Host , Host Group

![ad](/images/group_permition.png)

<a name=25></a>
### 2.4 User
