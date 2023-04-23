package com.roytuts.pdf.report.generation.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.roytuts.pdf.report.generation.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	
//	 @Query(value = "select * from product p where convert(p.updated_at,date)=convert(:updatedAt,date);",nativeQuery = true)
//		public List<Product> getProductsAtThisParticularDate(@RequestParam("updatedAt") LocalDate updatedAt);
	@Query(value = "select product.id, product.name,sum(order_item.quantity) as total_sales,product.price "
					+ "from product inner join order_item "
					+ "on product.id=order_item.product_id "
					+ "where convert(order_item.updated_at,date)=:updatedAt "
					+ "group by order_item.product_id "
					+ "order by product.id;"
				,nativeQuery = true)
	public List<Map<String,Object>> getProductsAtThisParticularDate(@RequestParam("updatedAt") LocalDate updatedAt);
	@Query(value = "select product.created_at, product.id, product.name,sum(order_item.quantity) as total_sales,product.price "
			+ "from product inner join order_item "
			+ "on product.id=order_item.product_id "
			+ "where convert(order_item.updated_at,date)<=:updatedAt "
			+ "group by order_item.product_id "
			+ "order by product.id;"
		,nativeQuery = true)
public List<Map<String,Object>> downloadTillThisDate(@RequestParam("updatedAt") LocalDate updatedAt);
	
	@Query(value = "select product.created_at, product.id, product.name,sum(order_item.quantity) as total_sales,product.price "
			+ "from product inner join order_item "
			+ "on product.id=order_item.product_id "
			+ "where convert(order_item.updated_at,date)<=:Till and"
			+ " convert(order_item.updated_at,date)>=:From  "
			+ "group by order_item.product_id "
			+ "order by product.id;"
		,nativeQuery = true)
	public List<Map<String, Object>> fromTillThisDate(@RequestParam("From") LocalDate From,@RequestParam("Till") LocalDate Till);
	
	@Query(value = "select product_category.type as category,sum(order_item.quantity) as sales "
			+ " from product inner join order_item "
			+ "on product.id=order_item.product_id "
			+ "inner join product_category "
			+ "on product.category_id=product_category.id "
			+ "group by product_category.id",
			nativeQuery = true)
	public List<Map<String, Object>> getSalesByCategory();
}
