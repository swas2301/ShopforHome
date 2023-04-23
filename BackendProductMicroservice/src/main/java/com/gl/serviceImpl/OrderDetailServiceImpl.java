package com.gl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.entity.AppUser;
import com.gl.entity.Cart;
import com.gl.entity.EmailDetails;
import com.gl.entity.OrderDetails;
import com.gl.entity.Product;
import com.gl.repository.CartItemRepository;
import com.gl.repository.OrderDetailRepository;
import com.gl.repository.ProductRepository;
import com.gl.repository.UserReposity;

@Service
public class OrderDetailServiceImpl {
	@Autowired
	OrderDetailRepository orderDetailRepo;
	@Autowired
	CartItemRepository cartItemRepo;
	@Autowired
	ProductRepository productRepo;
	@Autowired
	EmailServiceImpl emailServiceImpl;
	@Autowired
	UserReposity userRepo;
	
	public String saveOrderDetail(OrderDetails orderDetails,AppUser user) {
		orderDetails.setOrder_user(user);
		orderDetails.getOrderItem().forEach(a->a.setOrderDetails(orderDetails));
		orderDetails.getOrderItem().forEach(a->{
			if(a.getProduct().getInventory().getQuantity()==0) {
				
			}
			else if( a.getQuantity() > a.getProduct().getInventory().getQuantity()){
				a.setQuantity(a.getProduct().getInventory().getQuantity());
				int sales=a.getQuantity();
				Product product=a.getProduct();
				product.setSales(product.getSales()+sales);
				product.getInventory().setQuantity(product.getInventory().getQuantity()-sales);
				productRepo.save(product);
			}
			else {
				int sales=a.getQuantity();
				Product product=a.getProduct();
				product.setSales(product.getSales()+sales);
				product.getInventory().setQuantity(product.getInventory().getQuantity()-sales);
				productRepo.save(product);
			}
//			if(a.getProduct().getInventory().getQuantity()<10) {
//				EmailDetails emailDetails=new EmailDetails(
//						"subhasiskhuntia506@gmail.com",
//						a.getProduct().getName()+"is now below 10", 
//						"running out of stock", "");
//				emailServiceImpl.sendSimpleMail(emailDetails);
//			}
		});
		orderDetailRepo.save(orderDetails);
		Cart cart=user.getCart();
		cartItemRepo.deleteCartItem(cart);
		return "Order Saved";
	}

	public List<OrderDetails> getOrderDetails(String username) {
		AppUser user=userRepo.findByUsername(username);
		if(user!=null) {
			return user.getOrderDetails();
		}
		return null;
	}
}
