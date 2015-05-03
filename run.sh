docker run -it \
  --volume=/opt/nginx/conf/bundle.pem:/bundle.crt \
  --volume=/opt/nginx/conf/private.key:/private.key \
  --link=meteor:backend \
  --publish=443:443 \
  meteorhacks:mup-ssl-server /start.sh