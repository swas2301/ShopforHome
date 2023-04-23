package com.gl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.entity.Product;
import com.gl.entity.ProductBrand;
import com.gl.entity.ProductCategory;
import com.gl.repository.ProductRepository;

@Service
public class ProductServiceImpl {
	@Autowired
	ProductRepository productRepo;
	@Autowired
	BrandServiceImpl brandServiceImpl;
	@Autowired
	CategoryServiceImpl categoryServiceImpl;
	
	public String storeProduct(Product product) {
		ProductBrand brand=brandServiceImpl.findBrandByName(product.getBrand());
		ProductCategory category=categoryServiceImpl.findCategoryByType(product.getCategory());
		
		if (brand!=null) {
			product.setBrand(brand);
		}
		if(category!=null) {
			product.setCategory(category);
		}
		System.out.println(product);
		productRepo.saveAndFlush(product);
		return "Product stored successfully";
	}
	@Transactional
	public List<Product> getAllProducts(){
		return productRepo.findAll();
	}
	public String updateProduct(Product product) {
		if(productRepo.findById(product.getId())!=null) {
			productRepo.saveAndFlush(product);
			return "Updated";
		}
		return "Product doesn't exist";
	}
	public String deleteProduct(Product product) {
		if(productRepo.existsById(product.getId())) {
			productRepo.delete(product);
			return "Deleted";
		}
		return "Id not found";
	}
	public List<Product> searchItem(String item){
		return this.productRepo.searchItem(item);
	}
	public Product getProductById(Long id) {
		return this.productRepo.findById(id).orElse(null);
	}
}
