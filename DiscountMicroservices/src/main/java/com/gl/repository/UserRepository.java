package com.gl.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.AppUser;

@Repository
public interface UserRepository extends JpaRepository<AppUser, Long>{
	@Modifying
	@Transactional
	@Query(value = "delete from  app_user_discounts where discounted_user_id=:userId and discounts_id=:discountId ",nativeQuery = true)
	public void deleteDiscountFromUser(@RequestParam("userId") long userId,@RequestParam("discountId") long discountId);
	@Query("select user from AppUser user where user.username=:username")
	public AppUser existByUsername(@RequestParam("user") String username);
}
