package com.gl.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gl.entity.Discounts;
import com.gl.service.DiscountService;

@RestController
@RequestMapping(value = "/admin/discount")
@CrossOrigin
public class DiscountController {
	@Autowired
	DiscountService discountService;
	
	@PostMapping(value = "storeDiscount",consumes = MediaType.APPLICATION_JSON_VALUE)
	public String storeDiscount(@RequestBody Discounts discount) {
		System.out.println("inside store controller");
		System.out.println(discount);
		return discountService.StoreDiscount(discount);
	}
	
	@PostMapping(value="addDiscountToUser",consumes = MediaType.APPLICATION_JSON_VALUE)
	public 	String addDiscountToUser(@RequestBody  Map<String, Long> Ids) {
		Long userId=Ids.get("userId");
		Long discountId=Ids.get("discountId");
		return this.discountService.addUser(userId, discountId);
	}
	@GetMapping(value = "getDiscounts")
	public List<Discounts> getDiscounts(){
		return this.discountService.getAllDiscounts();
	}
	@PostMapping(value = "deleteDiscountFromUser")
	public String deleteDiscountFromUser(@RequestBody Map<String, Long> Ids) {
		Long userId=Ids.get("userId");
		Long discountId=Ids.get("discountId");
		return this.discountService.deleteDiscountFromUser(userId,discountId);
	}
	@PostMapping(value = "getDiscountOfUser")
	public List<Discounts> getDiscountOfUser(@RequestBody Map<String , String> userNameMap){
		String username=userNameMap.get("username");
		return this.discountService.getDiscountOfUser(username);
	}
	@PostMapping(value = "deleteDiscount/{id}")
	public String deleteDiscount(@PathVariable("id") long id) {
		return this.discountService.deleteDiscountById(id);
	}

}
