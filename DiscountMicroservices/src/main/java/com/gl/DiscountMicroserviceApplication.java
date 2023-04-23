package com.gl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DiscountMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(DiscountMicroserviceApplication.class, args);
		System.out.println("Discount microservice running");
	}

}
