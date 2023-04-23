package com.gl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.Discounts;
@Repository
public interface DiscountRepository extends JpaRepository<Discounts,Long> {
	@Modifying
	@Transactional
	@Query(value = "delete from app_user_discounts where app_user_discounts.discounts_id=:discountId",nativeQuery =true)
	public void deleteThisDiscount(@RequestParam("discountId") long discountId);

}
