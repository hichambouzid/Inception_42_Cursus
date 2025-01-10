#!/bin/bash


service vsftpd start
mkdir -p /var/run/vsftpd/empty

sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
sed -i "s/#write_enable=YES/write_enable=YES/"  /etc/vsftpd.conf
sed -i "s/#local_umask=022/local_umask=022/"  /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_address=197.230.240.146" >> /etc/vsftpd.conf
sed -i "s/listen_ipv6=YES/#listen_ipv6=YES/"  /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40010" >> /etc/vsftpd.conf
echo "local_root=/home/hibouzid" >> /etc/vsftpd.conf

useradd -m -d /home/hibouzid "hibouzid"
echo "hibouzid:hibouzid" | chpasswd
sleep 1

service vsftpd stop

sleep 1
vsftpd /etc/vsftpd.conf












# useradd -m ftpuser
# passwd ftpuser
# mkdir -p /var/ftp/test
# chown -R ftpuser:ftpuser /var/ftp/test


# sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/"  /etc/vsftpd.conf
# sed -i "s/#chroot_list_enable=YES/chroot_list_enable=YES/"  /etc/vsftpd.conf
# sed -i "s/#chroot_list_file=\/etc\/vsftpd.chroot_list/chroot_list_file=\/etc\/vsftpd.chroot_list/"  /etc/vsftpd.conf
# sed -i "s/listen=NO/listen=YES/"  /etc/vsftpd.conf
# echo "local_root=/var/ftp/test" >> /etc/vsftpd.conf



# echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
# echo "pasv_enable=YES" >> /etc/vsftpd.conf
# echo "listen=YES" >> /etc/vsftpd.conf
# echo "pasv_max_port=45000" >> /etc/vsftpd.conf

