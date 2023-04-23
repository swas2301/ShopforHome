package com.gl.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.entity.Cart;
import com.gl.entity.CartItems;
import com.gl.entity.Product;
import com.gl.entity.ProductInventory;
import com.gl.repository.CartItemRepository;
import com.gl.repository.CartRepository;
import com.gl.repository.ProductRepository;

@Service
public class CartItemServiceImpl {
	@Autowired
	private CartItemRepository cartItemRepo;
	@Autowired
	private CartRepository cartRepo;
	@Autowired
	private ProductRepository productRepo;

	public String increaseCartItem(Cart cart) {
		CartItems item = cart.getCartItems().get(0);
		Product product = productRepo.findById(item.getCartProduct().getId()).orElse(null);
		if (product == null) {
			return "product doesn't exist";
		}
		ProductInventory inventory = product.getInventory();
		if (inventory.getQuantity() > 0) {
			Cart cart2 = cartRepo.findById(cart.getId()).orElse(null);
			System.out.println(cart2);
			if (cart2 != null) {
				CartItems item2 = cartItemRepo.findById(item.getId()).orElse(null);
				if (item2 != null) {
					item2.setQuantity(item.getQuantity());
//					inventory.setQuantity(inventory.getQuantity() - 1);
//					product.setSales(product.getSales() + 1);
					cartItemRepo.saveAndFlush(item2);
//					productRepo.save(product);
					return "Item Increased";
				}
				return "Item doesn't exist";
			}
			return "User not found";
		}
		return "Out of Stock";
	}

	public String decreaseCartItem(Cart cart) {
		CartItems item = cart.getCartItems().get(0);
		Product product = productRepo.findById(item.getCartProduct().getId()).orElse(null);
		if (product == null) {
			return "product doesn't exist";
		}
		ProductInventory inventory = product.getInventory();
		Cart cart2 = cartRepo.findById(cart.getId()).orElse(null);
		System.out.println(cart2);
		if (cart2 != null) {
			CartItems item2 = cartItemRepo.findById(item.getId()).orElse(null);
			if (item2 != null) {
				item2.setQuantity(item.getQuantity());
//				inventory.setQuantity(inventory.getQuantity() + 1);
//				product.setSales(product.getSales() - 1);
				cartItemRepo.saveAndFlush(item2);
//				productRepo.save(product);
				return "Item decreased";
			}
			return "Item doesn't exist";
		}
		return "User not found";

	}
}
