#!/bin/sh
set -eu

KAFKA_CLUSTER_UUID="${KAFKA_CLUSTER_UUID:-DEFAULT00000000000UUID}"
CONFIG_TMPL="${CONFIG_TMPL:-/default_tmpl/singleton.properties}"
CONFIG="/kafka.properties"

# Generate configuration
{
    printf '%s\n' '#------------------------'
    printf '%s\n' '# Generated Configuration'
    printf '%s\n' '#------------------------'
    envsubst < "$CONFIG_TMPL"
    printf '\n'
    printf '%s\n' '#------------------------'
} > "$CONFIG"

cat "$CONFIG"

# Format storage and ignore if already formatted
/opt/kafka/bin/kafka-storage.sh format -t "$KAFKA_CLUSTER_UUID" -c "$CONFIG" --ignore-formatted

# Start Kafka
exec /opt/kafka/bin/kafka-server-start.sh "$CONFIG"