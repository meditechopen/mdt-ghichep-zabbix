# Mục lục

## [I. Tổng quan](#tq)
## [II. Các thành phần](#tp)
### [2.1 Status of Zabbix](#21)
### [2.2 Avilability report](#22)
### [2.3 Triggers top 100](#23)
### [2.4 Audit](#24)
### [2.5 Action log](#25)
### [2.6 Notifications](#26)

<a name=tq></a>
## I. Tổng quan

Phần này  hiển thị danh sách các báo cáo được xác định trước và người dùng có thể tùy chỉnh các hiển thị tổng quan về các thông số trạng thái của Zabbix, actions, dữ liệu thu thập,...

<a name=tp></a>
## II. Các thành phần

Mục này có tất cả các thành phần con :
- Status of Zabbix
- Avilability report
- Triggers top 100
- Audit
- Actions log
- Notifications

<a name=21></a>
### 2.1 Status of Zabbix

Mục này chứa tất cả các thông số về trạng thái của Zabbix :

![rp](/images/report_status.png)

 Trong đó nó hiển thị lên như hình trên, các thông số được làm rõ trong bảng sau :

 | Thông số | Giá trị | Chi tiết |
 |-----------|---------|------------|
 | Zabbix server is running | Trạng thái của Zabbix server <br> **Yes** - server đang hoạt động. <br> **No** - server không hoạt động. | Vị trí và cổng của Zabbix |
 | Number of host | Hiển thị tổng số lượng host đã được cấu hình và các Tổng Template | Số lượng host đang được giám sát/ Không được giám sát / Số lượng Templates |
 | Number of hosts | Hiển thị tổng các item đang hoạt động trong các host | Số lượng item hoạt động/ không hoạt động / không được hỗ trợ |
 | Number of triggers | Hiển thị số lượng các trigger đang được gán cho các host đang hoạt động | Số lượng trigger đang hoạt động / không hoạt động [Trigger trạng thái Problem/ Trigger trạng thái ok]|
 | Number of users | Hiển thị số lượng người dùng | Hiển thị số lượng người dùng đang online |
 | Required server performance, new values per second | Hiển thị số lượng giá trị expected được xử lý bởi Zabbix theo mỗi giây | Hiển thị thông số sau tính toán |


<a name=22></a>
### 2.2 Avilability report

Hiển thị tỉ lệ % thời gian của các trạng thái Problem/Ok của mỗi Item trên các host. Vì vậy, nó cung cấp cho người quản trị một cái nhìn toàn cảnh hơn về máy đang được giám sát.

![rp](/images/availability.png)

Người quản trị có thể lựa chọn lọc các thông số hiển thị. Có thể  theo Host hoặc theo Template. Cũng có thể lọc theo Host group hoặc từng Host riêng,...

![rp](/images/availability2.png)

Khi Click vào từng Item nó sẽ hiển thị ra các biểu đồ thể hiện các thông số trong khoảng thời gian tùy chọn.

![rp](/images/availability_graph.png)

Phần màu xanh thể hiện các trạng thái OK , phần màu đỏ thể hiện các trạng thái Problem.

<a name=23></a>
### 2.3 Triggers top 100

Hiển thị các các trigger thay đổi trạng thái thường xuyên nhất trong khoảng thời gian tùy chỉnh, được sắp xếp theo số lần thay đổi trạng thái.

![rp](/images/triggers_top.png)

Có thể sử dụng bộ lọc để lọc các trigger theo nhóm, host, mức độ nghiêm trọng của trigger , khoảng thời gian,....

<a name=24></a>
### 2.4 Audit

Phần này hiển thị bản ghi các thay đổi ở giao diện.

Hình dưới hiển thị các nhật kí các thay đổi khác nhau trong giao diện người dùng. Bạn có thể sử dụng bộ lọc để thu hẹp các bản ghi theo người dùng, loại hoạt đọng, tài nguyên bị ảnh hưởng và khoảng thời gian tùy chỉnh.

![ad](/images/audit_log.png)

Trong đó :

| Cột | Mô tả |
|----|-------|
| Time | Nhãn thời gian của bản ghi |
| User | User của hoạt động |
| IP | Ip đã sử dụng trong hoạt động |
| Resouce | Tài nguyên bị ảnh hưởng |
| Action | Hiển thị các hoạt động (login,logout,add,delete,..enable ,disable) |
| ID | Id của tài nguyên bị ảnh hưởng |
| Descriptions | Hiển thị mô tả tài nguyên |
| Details | Hiển thị chi tiết về hoạt động |


<a name=24></a>
### 2.5 Action log

Phần này hiển thị các bản ghi chép về log của các hành động.

Người quản trị có thể sử dụng bộ lọc để thu hẹp hồ sơ theo người nhận, email, khoảng thời gian tùy chỉnh.


![ad](/images/action_log.png)

Trong đó :

| Cột | Mô tả |
|-------|-----------|
| Time | Nhãn thời gian của hoạt động |
| Action | Tên của hành động |
| Type | Loại hành động |
| Recipient(s) |  Bí danh người sử dụng, họ và tên, email của người nhận thông báo |
| Message | Nội dung của action |
| Status | Trạng thái của Action: <br> Inprocess : Action đang trong quá trình thực hiện <br> Sent : Action đã thực hiện gửi tin nhắn <br> Execited : Câu lệnh được thực thi <br> Not sent : Action thực hiện không thành công |
| Info | Các thông tin về lỗi |

<a name=26></a>
### 2.6 Notifications

Phần này hiển thị số lượng các thông báo được gửi tới người dùng.

Quản trị viên có thể lọc hiển thị theo media , khoảng thời gian cho các thông báo được gửi

![ad](/images/notifications.png)

Mỗi một cột hiển thị tổng số thông báo đến mỗi người dùng hệ thống.
