package com.gl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.entity.AppUser;
import com.gl.entity.Discounts;
import com.gl.repository.DiscountRepository;
import com.gl.repository.UserRepository;

@Service
public class DiscountService {
	@Autowired
	DiscountRepository discountRepository;
	@Autowired
	UserRepository userRepo;

	public String StoreDiscount(Discounts discount) {
		System.out.println(discount);
		discountRepository.saveAndFlush(discount);
		return "Discount stored successfully";

	}

	public String addUser(Long userId, long discountId) {
		AppUser user = userRepo.findById(userId).orElse(null);
		Discounts discount = discountRepository.findById(discountId).orElse(null);
		List<Discounts> discountAvaiabletoUser = user.getDiscounts();
		if (discountAvaiabletoUser == null) {
			discountAvaiabletoUser = new ArrayList<Discounts>();
		}
		if (discountAvaiabletoUser.indexOf(discount) == -1) {
			discountAvaiabletoUser.add(discount);
			user.setDiscounts(discountAvaiabletoUser);
			userRepo.save(user);
			return "Discount added";
		}
		return "Discount already exist";

	}

	public List<Discounts> getAllDiscounts() {
		return discountRepository.findAll();
	}

	public String deleteDiscountFromUser(long userId, long discountId) {
		userRepo.deleteDiscountFromUser(userId, discountId);
		return "deleted";
	}

	public List<Discounts> getDiscountOfUser(String username) {
		AppUser user= this.userRepo.existByUsername(username);
		if(user!=null) {
			return user.getDiscounts();
		}
		return null;
	}

	public String deleteDiscountById(long id) {
		boolean discountExists=this.discountRepository.existsById(id);
		if(discountExists) {
			this.discountRepository.deleteThisDiscount(id);
			this.discountRepository.deleteById(id);
			return "Discount Deleted";
		}
		return "Discount not Found";
	}
}
