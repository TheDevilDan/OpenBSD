#!/bin/ksh

XYMONSRVIP=10.0.0.15

groupadd xymon
useradd -d /usr/local/xymon -c "Xymon Daemon" xymon
cp ./xymon_client_4.3.28_openbsd-6.1_amd64_compiled.tar.gz /
cd /
tar xzf xymon_client_4.3.28_openbsd-6.1_amd64_compiled.tar.gz
chown -R xymon:xymon /usr/local/xymon
sed -i "s/10.0.0.15/$XYMONSRVIP/g" /usr/local/xymon/etc/xymonclient.cfg
echo 'su - xymon -c "/usr/local/xymon/runclient.sh start"' >> /etc/rc.local
rm /xymon_client_4.3.28_openbsd-6.1_amd64_compiled.tar.gz
su - xymon -c "/usr/local/xymon/runclient.sh start"
