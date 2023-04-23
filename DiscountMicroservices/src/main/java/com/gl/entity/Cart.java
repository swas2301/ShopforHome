package com.gl.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"user"})
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@JsonIgnore
	@OneToOne(mappedBy = "cart")
	private AppUser user;
	@JsonIgnore
	@CreationTimestamp
	@Column(nullable = false,updatable = false)
	private LocalDateTime createdAt;
	@JsonIgnore
	@UpdateTimestamp
	private LocalDateTime updatedAt;
	@OneToMany(mappedBy ="userCart",cascade = CascadeType.ALL )
	private List<CartItems> cartItems;
	@Transient
	private String username;
}
