package com.gl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.entity.AppUser;
import com.gl.entity.Cart;
import com.gl.entity.CartItems;
import com.gl.entity.EmailDetails;
import com.gl.entity.Product;
import com.gl.entity.ProductInventory;
import com.gl.entity.WishList;
import com.gl.repository.CartItemRepository;
import com.gl.repository.ProductRepository;
import com.gl.repository.UserReposity;
import com.gl.repository.WishListItemsRepository;

@Service
public class UserServiceImpl {
	@Autowired
	CartItemRepository cartitemdao;
	@Autowired
	UserReposity userdao;
	@Autowired
	WishListItemsRepository wishlistItemDao;
	@Autowired
	ProductRepository productRepo;
	@Autowired
	EmailServiceImpl emailService;

	public String saveUser(AppUser user) {
		if (this.userdao.findByUsername(user.getUsername()) == null) {
			user.setWishList(WishList.builder().user(user).build());
			user.setCart(new Cart());
			userdao.saveAndFlush(user);
			return "User Saved Successfully";
		}
		return "User Already Exist";
	}

	public String addToCart(Cart cart) {
		Product product = productRepo.findById(cart.getCartItems().get(0).getCartProduct().getId()).orElse(null);
		if (cartitemdao.getProducts(cart.getCartItems().get(0).getCartProduct(), cart.getUsername()).size() != 0) {
			return "Already in your Cart";
		}
		if (product != null && product.getInventory().getQuantity() > 0) {
			AppUser user = userdao.findByUsername(cart.getUsername());
			user.getCart().getCartItems().add(cart.getCartItems().get(0));
			user.getCart().setUser(user);
			user.getCart().getCartItems().forEach(theCart -> theCart.setUserCart(user.getCart()));
//			System.out.println(user.getCart().getCartItems() + "cart items");
			userdao.saveAndFlush(user);
//			ProductInventory inventory = product.getInventory();
//			inventory.setQuantity(product.getInventory().getQuantity() - 1);
//			product.setInventory(inventory);
//			product.setSales(product.getSales() + 1);
//			if (product.getInventory().getQuantity() < 10) {
//				System.out.println("stock is less than 10");
//				EmailDetails emails = new EmailDetails(
//						"subhasiskhuntia506@gmail.com",
//						"stock of " + product.getName() + "is now below 10",
//						product.getName() + " stocks now below 10",
//						"");
//				emailService.sendSimpleMail(emails);
//			}
//			productRepo.save(product);
			return "Added to Cart";
		}
		return "out of stock";
	}

	public String checkUsernameAndPassword(String username, String password) {
		AppUser user = this.userdao.findUserByUserNameAndPassword(username, password);
		if (user != null) {
			return user.getUsername();
		}
		return null;
	}

	public String addToWishList(WishList wishlist) {
		if (wishlistItemDao
				.getProducts(wishlist.getWishListItems().get(0).getWishlistedProduct(), wishlist.getUsername())
				.size() != 0) {
			return "Already in your wishlist";
		}
		AppUser user = userdao.findByUsername(wishlist.getUsername());
		user.getWishList().getWishListItems().add(wishlist.getWishListItems().get(0));
		user.getWishList().setUser(user);
		user.getWishList().getWishListItems().forEach(theWishList -> theWishList.setUserWishlist(user.getWishList()));
//		System.out.println(user.getWishList().getWishListItems() + "cart items");
		userdao.saveAndFlush(user);

		return "Added to wishlist";
	}

	public AppUser findUser(String username) {
		return this.userdao.findByUsername(username);
	}

	public String deleteWishlistItem(Long id) {
		if (this.wishlistItemDao.existsById(id)) {
			this.wishlistItemDao.deleteById(id);
			return "deleted";
		}
		return "Item doesn't exist";
	}

	public String deleteCartItems(CartItems item) {
		Long id = item.getId();
		if (this.cartitemdao.existsById(id)) {
//			Product product = this.productRepo.findById(item.getCartProduct().getId()).orElse(null);
//			product.setSales(product.getSales() - (int) item.getQuantity());
//			ProductInventory inventory = product.getInventory();
//			inventory.setQuantity(inventory.getQuantity() + (int) item.getQuantity());
//			product.setInventory(inventory);
//			productRepo.save(product);
			this.cartitemdao.deleteById(id);
			return "deleted";
		}
		return "Item doesn't exist";
	}

	public List<AppUser> getAllUser() {
		List<AppUser> users = userdao.findAll();
		users.forEach(a->{
			a.setPhoneNumber(null);
			a.setPassword(null);
			a.setCart(null);
			a.setWishList(null);
			a.setCreatedAt(null);
			a.setUpdatedAt(null);
		});
		return users;
	}

	public String changeUserDetails(AppUser user) {
		AppUser user2=this.userdao.findUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if(user2!=null) {
			user2.setAddress(user.getAddress());
			user2.setPhoneNumber(user.getPhoneNumber());
			user2.setFirstName(user.getFirstName());
			user2.setLastName(user.getLastName());
			userdao.save(user2);
			return "User details changed";
		}
		return "Invalid Credentials";
	}
	public String ChangePassword(String userername,String oldPassword,String newPassword) {
		AppUser user=this.userdao.findUserByUserNameAndPassword(userername, oldPassword);
		if(user!=null) {
			user.setPassword(newPassword);
			userdao.save(user);
			return "Password Changed";
		}
		return "Invalid Credentials";
	}
}
