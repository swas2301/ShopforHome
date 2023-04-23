package com.gl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.Product;
import com.gl.entity.WishList;
import com.gl.entity.WishListItems;

@Repository
public interface WishListItemsRepository extends JpaRepository<WishListItems, Long>{
	@Query("select item.wishlistedProduct from WishListItems item where item.wishlistedProduct=:product and item.userWishlist.user.username=:username")
	public List<Product> getProducts(@RequestParam("product") Product product,@RequestParam("username") String username);

}
