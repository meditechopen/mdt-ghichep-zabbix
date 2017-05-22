#doc nhat ky trong file log cua he thong
docfile_log = open("/var/log/auth.log").readlines()
#File chuadu lieu tu file log
ghidulieu = open("/var/tools/zabbix/monitor/login_monitor.txt", 'a')
docfile_dl_f_ssh = open("/var/tools/zabbix/monitor/login_monitor.txt").readlines()
#Khai bao list chua cac dong ky tu trong file log khi  login vao server
f_ssh_line = []
#Khai bao list de so sanh cac phan tu cua list f_ssh_line voi cac dong trong file login_monitor.txt
list_so_sanh = []
#Khai bao cac tu khoa de bat su kien khi loggin vao may vat ly
tukhoa1 = ": Failed password"
tukhoa11 = "invalid"
tukhoa2 = ": FAILED LOGIN"
tukhoa22 = "UNKNOWN"
tukhoa3 = "pam_unix(login:session): session opened"
tukhoa4 = ": Accepted password"

#Doc file log bat cac su kien khi dang nhap vao server
for i in range(0,len(docfile_log)):
    if tukhoa1 in docfile_log[i] or tukhoa2 in docfile_log[i] or tukhoa3 in docfile_log[i] or tukhoa4 in docfile_log[i]:
        f_ssh_line.append(docfile_log[i])

# lay ra ngay thang de so sanh voi cac ban ghi co trong file login_monitor.txt
for i in range(0,len(docfile_dl_f_ssh)):
    k = docfile_dl_f_ssh[i].split(" ")
    sosanh1 = k[0]+" "+k[2]+" "+k[3]
    list_so_sanh.append(sosanh1)


#Nhung ban ghi moi se duoc ghidulieu vao file login_monitor.txt
for i in f_ssh_line:
    a= True
    ngaythang = i.split(" ")
    sosanh2 = ngaythang[0]+" "+ngaythang[2]+" "+ngaythang[3]
    for j in range(0,len(list_so_sanh)):
        if sosanh2 == list_so_sanh[j]:
            a= False
            break;
    if a:
        ghidulieu.write(i)

ghidulieu.close()

#Mo file login_monitor.txt
txt = open("/var/tools/zabbix/monitor/login_monitor.txt")

#List cac danh sach dang nhap ssh that bai
fail_ssh_last = []
# Lay ra nhat ky ssh that bai cuoi cung trong list fail_ssh_last
cut_fail_ssh_last = []

#List cac danh sach dang nhap truc tiep that bai
fail_direct_login_last = []
# Lay ra nhat ky dang nhap truc tiep that bai cuoi cung trong list fail_direct_login_last
cut_fail_direct_login_last = []

#List cac danh sach dang nhap ssh thanh cong
success_ssh_last = []
# Lay ra nhat ky dang nhap ssh thanh cong cuoi cung trong list success_ssh_last
cut_success_ssh_last = []

#List cac danh sach dang nhap truc tiep thanh cong
success_direct_login_last = []
# Lay ra nhat kydang nhap truc tiep thanh cong cuoi cung trong list success_direct_login_last
cut_success_direct_login_last = []
docfile = txt.readlines()

check = 0



# In ra file JSON chua cac su kien login dang nhap cuoi cung cua cac su kien dang nhap tu xa va dang nhap truc tiep

for i in range(0,len(docfile)):
    if tukhoa1 in docfile[i]:
        fail_ssh_last.append(docfile[i])


# thong tin user, IP, port moi nhat su kien ssh that bai
print "{\n"
print '\t"data":[\n\n'
if fail_ssh_last:
    cut_fail_ssh_last=fail_ssh_last[len(fail_ssh_last)-1].split(" ")
    if cut_fail_ssh_last[1]=='':
        check = 1
    else:
        check = 0
    if tukhoa11 in cut_fail_ssh_last:
        print "\t{\n"
        print '\t\t"{#LOGIN1}":"FAIL SSH",' +   '\t\t"{#USER}":\"Khong ton tai user '+str(cut_fail_ssh_last[10+check])+"\","+'\t\t"{#IP}":\"from '+str(cut_fail_ssh_last[12+check])+" port "+str(cut_fail_ssh_last[14+check])+"\""
        print "\t},\n"
    else:
        print "\t{\n"
        print '\t\t"{#LOGIN1}":"FAIL SSH",' +  '\t\t"{#USER}":\"'+"User "+str(cut_fail_ssh_last[8+check])+"\","+ '\t\t"{#IP}":\" from '+str(cut_fail_ssh_last[10+check])+" port "+str(cut_fail_ssh_last[12+check])+"\""
        print "\t},\n"

# thong tin user, IP, port moi nhat su kien dang nhap truc tiep that bai
for i in range(0,len(docfile)):
    if tukhoa2 in docfile[i]:
        fail_direct_login_last.append(docfile[i])

if fail_direct_login_last:
    cut_fail_direct_login_last=fail_direct_login_last[len(fail_direct_login_last)-1].split(" ")
    if cut_fail_direct_login_last[1]=='':
        check = 1
    else:
        check = 0
    if tukhoa22 in cut_fail_direct_login_last:
        print "\t{\n"
        print '\t\t"{#LOGIN2}":"FAIL DIRECT LOGIN",' +   '\t\t"{#USER}":\"Khong ton tai user '+"\","+'\t\t"{#IP}":\"'+" Truc tiep "+"\""
        print "\t},\n"
    else:
        print "\t{\n"
        print '\t\t"{#LOGIN2}":"FAIL DIRECT LOGIN",' +  '\t\t"{#USER}":\"'+"User "+str(cut_fail_direct_login_last[11+check])+"\","+ '\t\t"{#IP}":\"'+" Dang nhap truc tiep "+"\""
        print "\t},\n"

# thong tin user, IP, port moi nhat su kien dang nhap truc tiep that bai
for i in range(0,len(docfile)):
    if tukhoa3 in docfile[i]:
        success_direct_login_last.append(docfile[i])
if success_direct_login_last:
    cut_success_direct_login_last = success_direct_login_last[len(success_direct_login_last)-1].split(" ")
    if cut_success_direct_login_last[1]=='':
        check = 1
    else:
        check = 0
    print "\t{\n"
    print '\t\t"{#LOGIN3}":"SUCCESS DIRECT LOGIN",' +  '\t"{#USER}":\"'+"User "+str(cut_success_direct_login_last[10+check])+"\","+ '\t\t"{#IP}":\"'+ " Dang nhap truc tiep"+'"'
    print "\t},\n"

# thong tin user, IP, port moi nhat su kien ssh thanh cong
for i in range(0,len(docfile)):
    if tukhoa4 in docfile[i]:
        success_ssh_last.append(docfile[i])

if success_ssh_last:
    cut_success_ssh_last=success_ssh_last[len(success_ssh_last)-1].split(" ")
    if cut_success_ssh_last[1]=='':
        check = 1
    else:
        check = 0
    print "\t{\n"
    print '\t\t"{#LOGIN4}":"SUCCESS SSH",' +  '\t\t"{#USER}":\"'+"User "+str(cut_success_ssh_last[8+check])+"\","+ '\t\t"{#IP}":\"from '+str(cut_success_ssh_last[10+check])+" port "+str(cut_success_ssh_last[12+check])+"\""
    print "\t}\n"
    print "\n\t]\n"
    print "}\n"