package com.gl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entity.AppUser;

@Repository
public interface UserReposity extends JpaRepository<AppUser, Long>{
	@Query("select user from AppUser user where user.username=:username")
	public AppUser existByUsername(@RequestParam("user") String username);
	
	@Query("select user from AppUser user where user.username=:username and user.password=:password")
	public AppUser findUserByUserNameAndPassword(@RequestParam("username") String username,@RequestParam("password") String password);
	
	@Query("select user from AppUser user where user.username=:username")
	public AppUser findUserByUserUsername(@RequestParam("username") String username);
	
	AppUser findByUsername(String username);
}
