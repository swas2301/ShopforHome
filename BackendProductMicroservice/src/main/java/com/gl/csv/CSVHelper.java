package com.gl.csv;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.QuoteMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.LocalDateTimeParser;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.gl.entity.Product;
import com.gl.entity.ProductBrand;
import com.gl.entity.ProductCategory;
import com.gl.entity.ProductInventory;
import com.gl.repository.ProductRepository;
import com.gl.serviceImpl.BrandServiceImpl;
import com.gl.serviceImpl.CategoryServiceImpl;

@Component
public class CSVHelper {
	@Autowired
	BrandServiceImpl brandService;
	@Autowired
	CategoryServiceImpl categoryService;
	@Autowired
	ProductRepository productrepo;
	
	  public String TYPE = "text/csv";
	  String[] HEADERs = {"id","name","color","created_at","description","image","sales","price","sku","updated_at","brand_name","category_type","inventory_quantity"};

	  public  boolean hasCSVFormat(MultipartFile file) {

	    if (!TYPE.equals(file.getContentType())) {
	      return false;
	    }
	    
	    return true;
	  }

	  public   List<Product> csvToTutorials(InputStream is) {
	    try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        CSVParser csvParser = new CSVParser(fileReader,
	            CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {
	    
	      List<Product> products = new ArrayList<Product>();

	      Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	      
	      for (CSVRecord csvRecord : csvRecords) {
	    	  ProductBrand pb;
	    	  ProductCategory pc;
	    	  String brand=csvRecord.get("brand_name");
	    	  String category=csvRecord.get("category_type");
	    	  ProductBrand Brand=new ProductBrand();
	    	  if(brand!=null) {

	    		  Brand=brandService.findBrandByNameString(brand);

	    	  }
	    	  ProductCategory Category=new ProductCategory();
	    	  if(category!=null)
	    		  Category=categoryService.findCategoryByTypeString(category);
	    	  if(Brand!=null)
	    		  pb=Brand;
	    	  else
	    		  pb =new ProductBrand();
	    	  if(Category!=null)
	    		  pc=Category;
	    	  else 
	    		  pc =new ProductCategory();
		      ProductInventory pi=new ProductInventory();
		      pi.setId(Long.parseLong(csvRecord.get("id")));
	    	  pi.setQuantity(Integer.parseInt(csvRecord.get("inventory_quantity")));
	    	  pc.setType(csvRecord.get("category_type"));
	    	  pb.setName(csvRecord.get("brand_name"));
	    	  Product product=Product.builder().
	    			  							id(Long.parseLong(csvRecord.get("id"))).
	    			  							name(csvRecord.get("name")).
	    			  							description(csvRecord.get("description")).
	    			  							sku(csvRecord.get("sku")).
	    			  							price(Long.parseLong(csvRecord.get("price"))).
	    			  							color(csvRecord.get("color")).
	    			  							image(csvRecord.get("image")).
	    			  							brand(pb).
	    			  							category(pc).
	    			  							inventory(pi).
	    			  							inventory(pi).
	    			  							sales(Long.parseLong(csvRecord.get("sales"))).
	    			  							build();	    	 
	        productrepo.saveAndFlush(product);
//	    	  products.add(product);
	      }

	      return products;
	    } catch (IOException e) {
	    	e.printStackTrace();
	      throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
	    }
	  }

//	  public static ByteArrayInputStream tutorialsToCSV(List<Product> tutorials) {
//	    final CSVFormat format = CSVFormat.DEFAULT.withQuoteMode(QuoteMode.MINIMAL);
//
//	    try (ByteArrayOutputStream out = new ByteArrayOutputStream();
//	        CSVPrinter csvPrinter = new CSVPrinter(new PrintWriter(out), format);) {
//	      for (Product tutorial : tutorials) {
//	        List<String> data = Arrays.asList(
//	              String.valueOf(tutorial.getId()),
//	              tutorial.getTitle(),
//	              tutorial.getDescription(),
//	              String.valueOf(tutorial.isPublished())
//	            );
//
//	        csvPrinter.printRecord(data);
//	      }
//
//	      csvPrinter.flush();
//	      return new ByteArrayInputStream(out.toByteArray());
//	    } catch (IOException e) {
//	      throw new RuntimeException("fail to import data to CSV file: " + e.getMessage());
//	    }
//	  }

}
