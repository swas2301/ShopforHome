package com.gl.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppUser {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String username;
//	@JsonIgnore
	private String password;
	private String firstName;
	private String lastName;
	private String address;
	private String phoneNumber;
	private String role;
	@CreationTimestamp
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	private LocalDateTime createdAt;
	@UpdateTimestamp
	@JsonIgnore
	private LocalDateTime updatedAt;
	@OneToOne(cascade = CascadeType.ALL)
	private WishList wishList;
	@OneToOne(cascade = CascadeType.ALL)
	private Cart cart;
	@JsonIgnore
	@ManyToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.ALL})
	private List<Discounts> discounts;
	
	
	
}
