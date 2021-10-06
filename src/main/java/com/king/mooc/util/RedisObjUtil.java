package com.king.mooc.util;

import com.king.mooc.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @program: testSpring
 * @description: Hash类型相关操作
 * @author: King
 * @create: 2021-05-12 19:50
 */
@Repository
public class RedisObjUtil {

    @Autowired
    private RedisTemplate redisTemplate;

    public void setEntity(String key, Object o) {
        redisTemplate.opsForValue().set(key, o);
    }


    public void setEntity(String key, long time, Object o) {
        redisTemplate.opsForValue().set(key, o, time, TimeUnit.MINUTES);
    }

    public UserVo getUserVo(String key) {
        return (UserVo) redisTemplate.opsForValue().get(key);

    }

    public <T> T getEntity(String key, Class<T> entity) {
        UserVo userVo = (UserVo) redisTemplate.opsForValue().get(key);
        System.out.println(userVo);
        return SerializeUtil.objParse(entity, redisTemplate.opsForValue().get(key));
    }


    public void insert() {
        //1、通过redisTemplate设置值
        redisTemplate.boundHashOps("HashKey1").put("SmallKey", "HashVaue");

//2、通过BoundValueOperations设置值
        BoundHashOperations hashKey = redisTemplate.boundHashOps("HashKey2");
        hashKey.put("SmallKey", "HashVaue");

//3、通过ValueOperations设置值
        HashOperations hashOps = redisTemplate.opsForHash();
        hashOps.put("HashKey3", "SmallKey", "HashVaue");

    }


    /**
     * 插入一个 map
     *
     * @param key
     * @param map
     */
    public void insert(String key, Map map) {
        redisTemplate.boundHashOps(key).putAll(map);
    }

    /**
     * 插入一个 map 并设置过期时间 单位分钟
     *
     * @param key  key
     * @param time 时间
     * @param map  插入的map
     */
    public void insert(String key, long time, Map map) {
        redisTemplate.boundHashOps(key).putAll(map);
        redisTemplate.boundHashOps(key).expire(time, TimeUnit.MINUTES);
    }

    /**
     * 提取所有的小key
     * <p>
     * 2、通过BoundValueOperations获取值
     * BoundHashOperations hashKey = redisTemplate.boundHashOps("HashKey");
     * Set keys2 = hashKey.keys();
     * 3、通过ValueOperations获取值
     * HashOperations hashOps = redisTemplate.opsForHash();
     * Set keys3 = hashOps.keys("HashKey");
     *
     * @param key
     */
    public Set<String> getLKey(String key) {
        return redisTemplate.boundHashOps(key).keys();
    }

    /**
     * 提取所有的value值
     * <p>
     * 2、通过BoundValueOperations获取值
     * BoundHashOperations hashKey = redisTemplate.boundHashOps("HashKey");
     * List values2 = hashKey.values();
     * <p>
     * 3、通过ValueOperations获取值
     * HashOperations hashOps = redisTemplate.opsForHash();
     * List values3 = hashOps.values("HashKey");
     *
     * @param key
     * @return
     */
    public List<Object> getValue(String key) {
        return redisTemplate.boundHashOps(key).values();
    }

    /**
     * 根据key提取value值
     * <p>
     * 2、通过BoundValueOperations获取值
     * BoundHashOperations hashKey = redisTemplate.boundHashOps("HashKey");
     * String value2 = (String) hashKey.get("SmallKey");
     * <p>
     * 3、通过ValueOperations获取值
     * HashOperations hashOps = redisTemplate.opsForHash();
     * String value3 = (String) hashOps.get("HashKey", "SmallKey");
     *
     * @param key
     * @param smallKey
     * @return
     */
    public String getValue(String key, String smallKey) {
        //1、通过redisTemplate获取
        return (String) redisTemplate.boundHashOps(key).get(smallKey);
    }

    /**
     * 删除小key
     *
     * @param key
     * @param smallKey
     * @return
     */
    public Long delete(String key, String smallKey) {
        //删除小key
        return redisTemplate.boundHashOps(key).delete(smallKey);
    }

    /**
     * 删除大key
     */
    public Boolean delete(String key) {
        return redisTemplate.delete(key);
    }

    /**
     * 获取所有的键值对集合
     * <p>
     * 2、通过BoundValueOperations获取值
     * BoundHashOperations hashKey = redisTemplate.boundHashOps("HashKey");
     * Map entries1 = hashKey.entries();
     * <p>
     * 3、通过ValueOperations获取值
     * HashOperations hashOps = redisTemplate.opsForHash();
     * Map entries2 = hashOps.entries("HashKey");
     *
     * @param key
     * @return
     */
    public Map getMap(String key) {
        return redisTemplate.boundHashOps(key).entries();
    }

    public boolean hasKey(String key, String smallKey) {
        return redisTemplate.boundHashOps(key).hasKey(smallKey);
    }
}
