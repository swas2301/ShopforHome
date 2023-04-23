package com.gl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.Cart;
import com.gl.entity.CartItems;
import com.gl.entity.Product;

@Repository
public interface CartItemRepository extends JpaRepository<CartItems,Long>{
	@Query("select item.cartProduct from CartItems item where item.cartProduct=:product and item.userCart.user.username=:username")
	public List<Product> getProducts(@RequestParam("product") Product product,@RequestParam("username") String username);
	
	@Transactional
	@Modifying
	@Query("delete from CartItems item where item.userCart=:cart")
	public void deleteCartItem(@RequestParam("cart") Cart cart);

}
