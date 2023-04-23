package com.gl.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gl.entity.AppUser;
import com.gl.entity.Cart;
import com.gl.entity.CartItems;
import com.gl.entity.OrderDetails;
import com.gl.entity.Product;
import com.gl.entity.WishList;
import com.gl.entity.WishListItems;
import com.gl.serviceImpl.CartItemServiceImpl;
import com.gl.serviceImpl.OrderDetailServiceImpl;
import com.gl.serviceImpl.UserServiceImpl;

@CrossOrigin
@RestController
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	UserServiceImpl userService;
	@Autowired
	CartItemServiceImpl cartItemService;
	@Autowired
	OrderDetailServiceImpl orderDetailService;
	
	@PostMapping("/signin")
	public String signin(@RequestBody AppUser user) {
		System.out.println("inside signin controller");
		return this.userService.saveUser(user);
	}
	@PostMapping("/login")
	public String login(@RequestBody Map<String,String> login) {
		return this.userService.checkUsernameAndPassword(login.get("username"), login.get("password"));
	}
	@PostMapping(value = "addToCart")
	public String addToCart(@RequestBody Cart cart) {
//		System.out.println("cart");
//		System.out.println(cart);
		return this.userService.addToCart(cart);
	}
	@PostMapping(value = "addToWishList")
	public String addToWishList(@RequestBody WishList wishlist) {
		System.out.println("wishlist");
		return this.userService.addToWishList(wishlist);
	}
	@PostMapping(value = "showCart")
	public Cart showCart(@RequestBody Map<String,String> incomingUsername) {
		String username=incomingUsername.get("username");
		return this.userService.findUser(username).getCart();
	}
	@PostMapping(value = "showWishList")
	public WishList showWishList(@RequestBody Map<String, String> incomingUsername) {
		String username=incomingUsername.get("username");
		return this.userService.findUser(username).getWishList();
	}
	@PostMapping(value = "deleteWishListedItem")
	public String deleteWishlistedItem(@RequestBody WishListItems item) {
		return this.userService.deleteWishlistItem(item.getId());
	}
	@PostMapping(value = "deleteCartItem")
	public String deleteCartItem(@RequestBody CartItems item) {
		return this.userService.deleteCartItems(item);
	}
	@PostMapping(value = "increaseCartItemQuantity")
	public String increaseCartItemQuantity(@RequestBody Cart cart) {
		return this.cartItemService.increaseCartItem(cart);
		
	}
	@PostMapping(value = "decreaseCartItemQuantity")
	public String decreaseCartItemQuantity(@RequestBody Cart cart) {
		return this.cartItemService.decreaseCartItem(cart);
	}
	@GetMapping(value = "getAllUser")
	public List<AppUser> getAllUser(){
		return this.userService.getAllUser();
	}
	@GetMapping(value = "getUserDetail/{username}")
	public AppUser getUserDetails(@PathVariable String username) {
		AppUser user=this.userService.findUser(username);
		user.setPassword(null);
//		user.setPhoneNumber(null);
		user.setCart(null);
		user.setWishList(null);
		user.setCreatedAt(null);
		user.setUpdatedAt(null);
		return user;
	}
	@PostMapping(value = "placeOrder")
	public String placeOrder(@RequestBody OrderDetails orderDetails) {
		AppUser user=userService.findUser(orderDetails.getUsername());
		return this.orderDetailService.saveOrderDetail(orderDetails, user);
	}
	@PostMapping(value = "changeUserDetails")
	public String changeUserDetails(@RequestBody AppUser user) {
		System.out.println(user);
		return this.userService.changeUserDetails(user);
	}
	@PostMapping(value = "changePassword")
	public String changePassword(@RequestBody Map<String, String> usernameAndPasswords) {
		String username=usernameAndPasswords.get("username");
		String oldPassword=usernameAndPasswords.get("oldPassword");
		String newPassword=usernameAndPasswords.get("newPassword");
		return this.userService.ChangePassword(username, oldPassword, newPassword);
	}
}
