FROM redis:7-alpine

# Expose Redis port
EXPOSE 6379

# Enable AOF persistence by default
CMD ["sh", "-c", "redis-server \
    --appendonly yes \
    --save 60 1 \
    --requirepass ${REDIS_PASSWORD:-defaultpassword} \
    --maxmemory ${REDIS_MAXMEMORY:-2gb} \
    --maxmemory-policy ${REDIS_MAXMEMORY_POLICY:-allkeys-lru}"]
