//package com.king.mooc.config;
//
//
//
//
//import com.alibaba.fastjson.parser.ParserConfig;
//import com.alibaba.fastjson.support.config.FastJsonConfig;
//import com.alibaba.fastjson.support.spring.FastJsonRedisSerializer;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.RedisConnectionFactory;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.core.StringRedisTemplate;
//import org.springframework.data.redis.serializer.RedisSerializer;
//import org.springframework.data.redis.serializer.StringRedisSerializer;
//
//import java.nio.charset.StandardCharsets;
//
///**
// * @program: testSpring
// * @description:
// * @author: King
// * @create: 2021-05-08 20:44
// */
//@Configuration
//public class RedisConfig {
//
//
//    @Bean
//    public RedisSerializer<Object> springSessionDefaultRedisSerializer() {
//
//
//        //使用 FastJsonRedisSerializer 来序列化和反序列化 redis 的 value的值
//        FastJsonRedisSerializer<Object> serializer = new FastJsonRedisSerializer<>(Object.class);
//        ParserConfig.getGlobalInstance().addAccept("com.king.");
//        ParserConfig.getGlobalInstance().addAccept("org.springframework.");
//        ParserConfig.getGlobalInstance().addAccept("org.springframework.security.core.context.");
//        FastJsonConfig fastJsonConfig = new FastJsonConfig();
//        fastJsonConfig.setCharset(StandardCharsets.UTF_8);
//        serializer.setFastJsonConfig(fastJsonConfig);
//        return serializer;
//
//    }
//
//    RedisConfig() {
//        //打开autotype功能,需要强转的类一次添加其后
////        ParserConfig.getGlobalInstance().checkAutoType().addAccept("com.king.mooc.vo.UserVo");
//
//    }
//
//    @Bean
//    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
//        RedisTemplate<Object, Object> template = new RedisTemplate<>();
//        //template .setConnectionFactory(redisConnectionFactory);
//        FastJsonRedisSerializer<Object> fastJsonRedisSerializer = new FastJsonRedisSerializer<>(Object.class);
//        template.setValueSerializer(fastJsonRedisSerializer);
//        template.setKeySerializer(new StringRedisSerializer());
//        template.setHashValueSerializer(fastJsonRedisSerializer);
//        template.setHashKeySerializer(new StringRedisSerializer());
//        template.setConnectionFactory(redisConnectionFactory);
//        return template;
//
//    }
//
//    @Bean
//    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
//        StringRedisTemplate template = new StringRedisTemplate();
//        template.setConnectionFactory(redisConnectionFactory);
//        return template;
//    }
//
//}
//
