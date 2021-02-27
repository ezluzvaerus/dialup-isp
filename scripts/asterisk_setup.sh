apt-get install asterisk

cp ../etc/asterisk/sip.conf /etc/asterisk/sip.conf

sed  '/include => demo/a exten => _X!,1,Dial(SIP/pap2t-ispmodem, 20)' /etc/asterisk/extensions.conf
sed -e '/include => demo/ s/^#*/#/' -i /etc/asterisk/extensions.conf

systemctl enable asterisk
systemctl start asterisk