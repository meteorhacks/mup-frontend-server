cd /tmp/lib
cp start.sh /start.sh
cp verify.sh /verify.sh
chmod +x /verify.sh /start.sh

cp nginx.conf /opt/nginx/conf/nginx.conf
rm -rf /tmp/lib