package com.gl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import com.gl.entity.Product;
import com.gl.entity.ProductCategory;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	@Query("select p from Product p where trim(lower(p.name)) like :item "
			+ "or trim(lower(p.brand.name)) like :item "
			+ "or trim(lower(p.description)) like :item "
			+ "or trim(lower(p.category.type)) like :item")
	public List<Product> searchItem(@RequestParam("item") String item);	
}
