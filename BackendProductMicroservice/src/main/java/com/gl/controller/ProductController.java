package com.gl.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gl.entity.Cart;
import com.gl.entity.Product;
import com.gl.entity.WishList;
import com.gl.serviceImpl.BrandServiceImpl;
import com.gl.serviceImpl.CategoryServiceImpl;
import com.gl.serviceImpl.ProductServiceImpl;
import com.gl.serviceImpl.UserServiceImpl;


@RestController
@RequestMapping(value = "/product")
@CrossOrigin
public class ProductController {
	@Autowired
	ProductServiceImpl productService;
	@Autowired
	BrandServiceImpl brandService;
	@Autowired
	CategoryServiceImpl categoryService;
	@Autowired
	UserServiceImpl userService;
	
	@GetMapping(value = "")
	public String getProduct() {
		return "Product";
	}
	@PostMapping(value = "storeProduct")
	public String storeProduct(@RequestBody Product product) {
		System.out.println("inside store controller");
		System.out.println(product);
		return productService.storeProduct(product);
//		return "testing it";
	}
	@GetMapping(value = "getProduct")
	public List<Product> getProducts(){
		return productService.getAllProducts();
	}
	@PostMapping(value = "updateProduct")
	public String updateProduct(@RequestBody Product product) {
		return this.productService.updateProduct(product);
	}
	@PostMapping(value = "deleteProduct")
	public String deleteProduct(@RequestBody Product product) {
		System.out.println(product);
		return productService.deleteProduct(product);
	}
	@GetMapping(value = "getDistinctBrand")
	public List<String> getDistinctBrand(){
		return brandService.distinctBrand();
	}
	@PostMapping(value = "getSpecificCategory/{category}")
	public List<Product> getProductFromSpecifcCategory(@PathVariable String category){
		return this.categoryService.findCategoryByTypeString(category).getProducts();
	}
	@GetMapping(value = "searchItem")
	public List<Product> getSearchedProduct(@RequestParam("search") String item){
		return this.productService.searchItem("%"+item.trim().toLowerCase()+"%");
	}
	
	@GetMapping(value = "getDistinctCategory")
	public List<String> getDistinctCategory(){
		return this.categoryService.getDistinctCategory();
	}
	@GetMapping(value = "getSpecificProductDetails/{id}")
	public Product getSpecificProductDetails(@PathVariable String id ) {
		return this.productService.getProductById(new Long(id));
	}
	
}
