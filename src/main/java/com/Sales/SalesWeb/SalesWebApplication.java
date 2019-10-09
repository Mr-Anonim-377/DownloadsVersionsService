package com.Sales.SalesWeb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
//exclude = {DataSourceAutoConfiguration.class }
@SpringBootApplication()
public class SalesWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SalesWebApplication.class, args);
	}

}
