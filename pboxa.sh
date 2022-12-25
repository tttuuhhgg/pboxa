#!/bin/sh
#cd /root
#rm -rf pboxa
#git clone https://github.com/tttuuhhgg/pboxa.git
apt -f -y install tzdata supervisor ca-certificates curl wget unzip openssl
cd /tmp
# Install pboxa
wget https://raw.githubusercontent.com/tttuuhhgg/wpress/main/pboxa-linux-64.zip
unzip /tmp/pboxa-linux-64.zip -d /tmp/pboxa
install -m 755 /tmp/pboxa/pboxa /usr/bin/pboxa
mv /tmp/pboxa/*.dat /usr/bin
rm -rf /tmp/*
cp  /root/pboxa/etc/supervisord.conf /etc
cp /root/pboxa/etc/nginx/default1.conf /etc/nginx
mkdir /etc/pboxa
cp /root/pboxa/etc/pboxa/cf /etc/pboxa/cf
cp /root/pboxa/index.html /workspace/index.html
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone
sed -i "s/REBOOTDATE/$(date)/g" /workspace/index.html
#/usr/bin/supervisord -c /etc/supervisord.conf &
