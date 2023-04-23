package com.gl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.entity.ProductCategory;
import com.gl.repository.CategoryRepository;

@Service
public class CategoryServiceImpl {
	@Autowired
	private CategoryRepository categoryRepo;
	public String saveCategory(ProductCategory category) {
		System.out.println(category.getId());
		if (!categoryRepo.existsById(category.getId())) {
			categoryRepo.save(category);
			return "saved successfully";
		}
		return "unable to save";
	}
	@Transactional
	public List<ProductCategory> showCategory(){
		return categoryRepo.findAll();
	}
	public boolean categoryExistOrNot(ProductCategory category){
		if(categoryRepo.findCategoryByType(category.getType())!=null) {
			return true;
		}
		return false;
	}
	public ProductCategory findCategoryByType(ProductCategory category) {
		return categoryRepo.findCategoryByType(category.getType());
	}
	public ProductCategory findCategoryByTypeString(String category) {
		return categoryRepo.findCategoryByType(category);
	}
	public ProductCategory findCategoryById(long id) {
		return categoryRepo.findById(id).orElse(null);
	}
	public List<String> getDistinctCategory() {
		return categoryRepo.getDistinctCategoryType();
	}
}
