# wp config set WP_CACHE --path="/var/www/html/wordpress"  true --raw --allow-root;
# wp config set WP_CACHE_KEY_SALT alemafe.42.fr --path="/var/www/html/wordpress" --allow-root;
# wp config set WP_REDIS_HOST redis --path="/var/www/html/wordpress" --allow-root;
# wp config set WP_REDIS_PORT 6379 --path="/var/www/html/wordpress" --raw --allow-root;

# wp plugin install redis-cache --path="/var/www/html/wordpress" --allow-root
# wp plugin activate redis-cache --path="/var/www/html/wordpress" --allow-root
# wp redis enable --path="/var/www/html/wordpress" --force --allow-root

if [ ! -f "/etc/redis/redis.conf.bak" ]; then

    cp /etc//redis/redis.conf /etc/redis/redis.conf.bak #We create the .bak to notify the program if it exists, don't go to the loop anymore

    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
    # sed -i "s|# requirepass foobared|requirepass $REDIS_PWD|g" /etc/redis.conf
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

fi

redis-server --protected-mode no