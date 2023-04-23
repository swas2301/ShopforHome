package com.gl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.ProductBrand;

@Repository
public interface BrandRepository extends JpaRepository<ProductBrand, Long>{
	@Query("select brand from ProductBrand brand where brand.name=:name")
	public ProductBrand findBrandByName(@RequestParam("name") String name);
	@Query("select brand.name  from ProductBrand brand order by brand.name")
	public List<String> distinctBrand();
}
