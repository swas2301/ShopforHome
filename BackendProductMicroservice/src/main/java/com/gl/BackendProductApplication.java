package com.gl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class BackendProductApplication {

	public static void main(String[] args) {
		SpringApplication.run(BackendProductApplication.class, args);
		System.out.println("Product Microservice Running");
	}

}
