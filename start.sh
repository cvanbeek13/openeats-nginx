#!/usr/bin/env sh

# NGINX doesn't let you use ENV vars within the conf file.
# We use sed to set the env vars we need.
# Sed replace the API_PORT vars.

sed -i "s/API_PORT/$API_PORT/g" /etc/nginx/conf.d/default.conf;

# We also need to change to HTTPS if that's enabled
if [ "$HTTP_X_FORWARDED_PROTO" = true ] ; then
    sed -i "s/http:/https:/g" /etc/nginx/conf.d/default.conf;
fi

# Start the NGINX service.

nginx -g "daemon off;";
