apt-get update
apt-get upgrade
apt-get install ppp mgetty

cp ../lib/systemd/system/mgetty.service /lib/systemd/system/mgetty.service
cp ../etc/mgetty/mgetty.config /etc/mgetty/mgetty.config

systemctl enable mgetty.service
systemctl start mgetty.service

cp ../etc/ppp/options /etc/ppp/options
cp ../etc/ppp/options.ttyUSB0 /etc/ppp/options.ttyUSB0

useradd -G dialout,dip,users -m -g users -s /usr/sbin/pppd dial

passwd dial

echo "dial * "dial" *" >> /etc/ppp/pap-secrets