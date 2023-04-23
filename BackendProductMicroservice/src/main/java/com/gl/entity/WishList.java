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
@ToString(exclude = "user")
public class WishList {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@OneToOne
	@JsonIgnore
	private AppUser user;
	@CreationTimestamp
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	private LocalDateTime createdAt;
	@UpdateTimestamp
	@JsonIgnore
	private LocalDateTime updatedAt;
	@OneToMany(mappedBy = "userWishlist",cascade = CascadeType.ALL)
	private List<WishListItems> wishListItems;
	@Transient
	private String username;
	@Override
	public String toString() {
		return "WishList [id=" + id + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", wishListItems="
				+ wishListItems + ", username=" + username + "]";
	}
	
}
