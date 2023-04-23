package com.gl.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gl.entity.OrderDetails;
import com.gl.serviceImpl.OrderDetailServiceImpl;
import com.gl.serviceImpl.UserServiceImpl;

@CrossOrigin
@RestController
@RequestMapping("/user")
public class OrderController {
	@Autowired
	OrderDetailServiceImpl orderDetailService;
	
	
	@PostMapping(value = "getOrderDetails")
	public List<OrderDetails> getOrderDetails(@RequestBody Map<String, String> usernameMap){
		String username=usernameMap.get("username");
		return this.orderDetailService.getOrderDetails(username);
	}
	
}
