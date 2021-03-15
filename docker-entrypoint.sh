#!/bin/sh
set -e

cd /etc/yasdi2mqtt

if ! [ "$MQTT_QOS_LEVEL" = "" ]; then
	ARG_QOS_LEVEL="-q"
	ARG_QOS_LEVEL_VAL=$MQTT_QOS_LEVEL
fi

if ! [ "$MQTT_USER" = "" ]; then
	ARG_USER="-U"
	ARG_USER_VAL=$MQTT_USER
fi

if ! [ "$MQTT_PASSWORD" = "" ]; then
	ARG_PASSWORD="-P"
	ARG_PASSWORD_VAL=$MQTT_PASSWORD
fi

if ! [ "$LOG_LEVEL" = "" ]; then
	ARG_LOG="-l"
	ARG_LOG_VAL=$LOG_LEVEL
fi

if ! [ "$SSL_CERT" = "" ]; then
	ARG_CERT="-S"
	ARG_CERT_VAL=$SSL_CERT
fi

yasdi2mqtt -c "$YASDI_CONFIG" -d "$YASDI_DRIVER_ID" -i "$YASDI_MAX_DEVICE_COUNT" -u "$YASDI_UPDATE_INTERVAL" \
-t "$MQTT_TOPIC_PREFIX" -s "$MQTT_SERVER" -p "$MQTT_PORT" "$ARG_QOS_LEVEL" "$ARG_QOS_LEVEL_VAL" \
"$ARG_USER" "$ARG_USER_VAL" "$ARG_PASSWORD" "$ARG_PASSWORD_VAL" "$ARG_LOG" "$ARG_LOG_VAL" "$ARG_CERT" "$ARG_CERT_VAL" \
/
