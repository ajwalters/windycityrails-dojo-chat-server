require 'lib/redis_client'
RedisClient.redis = Redis.new(:host => AppConfig.redis.host,:port => AppConfig.redis.port)
