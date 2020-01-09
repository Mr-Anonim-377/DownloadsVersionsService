package com.services.serviceDownloadsVersions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;

import javax.servlet.MultipartConfigElement;


@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@Configuration
public class SalesWebApplication {
    public final static String CURRENT_PACKAGE = "\\src\\main\\resources\\versions\\";
    public final static String CURRENT_JSON_FILE = "\\actualCurrentJson\\actualVersion.json";
    public final static String CURRENT_SYSTEM_PATH = System.getProperty("user.dir");


    @Bean
    MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory multipartConfigFactory = new MultipartConfigFactory();
        multipartConfigFactory.setMaxFileSize(DataSize.parse("1024KB"));
        multipartConfigFactory.setMaxRequestSize(DataSize.parse("1024KB"));
        return multipartConfigFactory.createMultipartConfig();
    }


    public static void main(String[] args) {
        SpringApplication.run(SalesWebApplication.class, args);
    }

}
