package com.gl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.entity.ProductBrand;
import com.gl.repository.BrandRepository;

@Service
public class BrandServiceImpl {
	@Autowired
	private BrandRepository brandRepo;
	public String savebrand(ProductBrand brand) {
		System.out.println(brand.getId());
		if (!brandRepo.existsById(brand.getId())) {
			brandRepo.save(brand);
			return "saved successfully";
		}
		return "unable to save";
	}
	@Transactional
	public List<ProductBrand> showbrand(){
		return brandRepo.findAll();
	}
	public boolean brandExistOrNot(ProductBrand brand) {
		return brandRepo.findBrandByName(brand.getName())!=null;
	}
	public ProductBrand findBrandByName(ProductBrand brand) {
		return brandRepo.findBrandByName(brand.getName());
	}
	public ProductBrand findBrandByNameString(String brand) {
		return brandRepo.findBrandByName(brand);
	}
	@Transactional
	public ProductBrand findById(long id) {
		return brandRepo.findById(id).orElse(null);
	}
	public List<String> distinctBrand() {
		return brandRepo.distinctBrand();
	}
}
