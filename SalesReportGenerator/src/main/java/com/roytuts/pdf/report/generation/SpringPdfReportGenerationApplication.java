package com.roytuts.pdf.report.generation;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

import com.roytuts.pdf.report.generation.repository.ProductRepository;
@EnableEurekaClient
@SpringBootApplication
public class SpringPdfReportGenerationApplication implements CommandLineRunner {
	@Autowired
	ProductRepository productRepo;

	public static void main(String[] args) {
		SpringApplication.run(SpringPdfReportGenerationApplication.class, args);
		System.out.println("Report Generator Running");
	}
	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		//LocalDate date=LocalDate.now();
		//productRepo.getProductsAtThisParticularDate(date).forEach(a->System.out.println(a.getName()));;
//		System.out.println(String.valueOf(productRepo.getProductsAtThisParticularDate(LocalDate.now()).get(0).get("total_sales")));
//		productRepo.getSalesByCategory().forEach(a->{
//			System.out.println(String.valueOf(a.get("category")));
//			System.out.println(String.valueOf(a.get("sales")));
//			System.out.println(String.valueOf(a.get("total_sales")));
//			System.out.println(String.valueOf(a.get("price")));
//			System.out.println(String.valueOf(a.get("created_at")));
//		});
	}


}
