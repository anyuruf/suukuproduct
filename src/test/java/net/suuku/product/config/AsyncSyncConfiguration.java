package net.suuku.product.config;

import java.util.concurrent.Executor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.SyncTaskExecutor;

@Configuration
public class AsyncSyncConfiguration {

    @Bean(name = "taskExecutor")
    Executor taskExecutor() {
        return new SyncTaskExecutor();
    }
}
