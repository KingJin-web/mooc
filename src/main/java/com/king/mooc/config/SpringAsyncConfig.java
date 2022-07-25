package com.king.mooc.config;

/**
 * @program: mooc
 * @description: 线程池
 * @author: King
 * @create: 2021-10-04 20:04
 */
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.*;

@Configuration
@EnableAsync
public class SpringAsyncConfig {

    // 异步线程池
    //cpu核数
    private static final int CPU_COUNT = Runtime.getRuntime().availableProcessors();
    // 使用最大线程数为cpu核数的两倍
    private static final int MAX_POOL_SIZE = CPU_COUNT * 2;


    @Bean("myTaskExecutor")
    public Executor asyncServiceExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 设置核心线程数
        executor.setCorePoolSize(5);
        // 设置最大线程数
        executor.setMaxPoolSize(MAX_POOL_SIZE);
        //配置队列大小
        executor.setQueueCapacity(Integer.MAX_VALUE);
        // 设置线程活跃时间（秒）
        executor.setKeepAliveSeconds(60);
        // 设置默认线程名称
        executor.setThreadNamePrefix("发送邮件");
        // 等待所有任务结束后再关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        //执行初始化
        executor.initialize();

        return executor;
    }
}
