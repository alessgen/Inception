#!/bin/bash

mkdir -p /var/run/vsftpd/empty 						# This creates a new directory /var/run/vsftpd/empty. This directory is used by vsftpd for anonymous FTP access.
useradd -d /ftp -s /bin/bash -m -u 4321 $FTP_USER 	# This creates a new user with the username $FTP_USER. The -d option specifies the user's home directory, which is set to /ftp.
													# The -s option specifies the user's shell, which is set to /bin/bash.
													# The -m option creates the user's home directory if it doesn't already exist.
													# The -u option specifies the user's UID (user ID), which is set to 4321.
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd 			# This sets the password for the new user, which is stored in the $FTP_PASSWORD variable.
groupadd ftpgroup 									# This creates a new group called ftpgroup.
usermod -G ftpgroup $FTP_USER 						# This adds the new user to the ftpgroup group.
chown -R $FTP_USER:ftpgroup /ftp 					# This changes the ownership of the /ftp directory to the new user and the ftpgroup group.
chmod 777 /ftp 										# This sets the permissions of the /ftp directory to 777, which gives read, write, and execute permissions to all users.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 	 	# This adds the new user to the /etc/vsftpd.userlist file, which is used by vsftpd to determine which users are allowed to connect.
exec vsftpd 										# This starts the vsftpd server.