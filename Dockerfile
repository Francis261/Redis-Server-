FROM redis:7-alpine

EXPOSE 6379

CMD ["sh", "-c", "redis-server \
    --appendonly yes \
    --save 60 1 \
    --requirepass ${REDIS_PASSWORD:-defaultpassword} \
    --maxmemory ${REDIS_MAXMEMORY:-2gb} \
    --maxmemory-policy ${REDIS_MAXMEMORY_POLICY:-allkeys-lru}"]
