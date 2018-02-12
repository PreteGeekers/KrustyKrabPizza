#! /bin/bash

##Create a second ssh instance##

# Create a new ssh config file
cp /opt/sshd_config /etc/ssh/ubuntu-update_config

# Replace port number
sed -i 's/#Port 22/Port 65700/g' /opt/ubuntu-update_config

# Replace the Pid file
sed -i 's/#PidFile \/var\/run\/sshd.pid/PidFile \/var\/run\/ubuntu-update.pid/g' /opt/sshd-second_config

# Create the new service file
echo "[Unit]" > /etc/systemd/system/ubuntu-update.service
echo "Description=Ubuntu Update" >> /etc/systemd/system/ubuntu-update.service
echo "After=network.target sshd-keygen.service" >> /etc/systemd/system/ubuntu-update.service
echo " " >> /etc/systemd/system/ubuntu-update.service
echo "[Service]" >> /etc/systemd/system/ubuntu-update.service
echo "EnvironmentFile=/etc/sysconfig/sshd" >> /etc/systemd/system/ubuntu-update.service
echo 'ExecStart=/usr/sbin/sshd -D -f /opt/ubuntu-update_config $OPTIONS' >> /etc/systemd/system/sshd-second.service
echo 'ExecReload=/bin/kill -HUP $MAINPID' >> /etc/systemd/system/ubuntu-update.service
echo "KillMode=process" >> /etc/systemd/system/ubuntu-update.service
echo "Restart=on-failure" >> /etc/systemd/system/ubuntu-update.service
echo "RestartSec=42s" >> /etc/systemd/system/ubuntu-update.service
echo " " >> /etc/systemd/system/ubuntu-update.service
echo "[Install]" >> /etc/systemd/system/ubuntu-update.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/ubuntu-update.service

# Deal with selinux 
semanage port -a -t ssh_port_t -p tcp 65700

# Reload the systemctl daemon
systemctl daemon-reload

# Reload the service
systemctl reload ubuntu-update.service

# Start the service 
systemctl start ubuntu-update.service

echo "Done"
