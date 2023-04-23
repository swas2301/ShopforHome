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
public class Discounts {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String discount_name;
	private String discount_percentage;
	//private boolean activeOrNot;
	@CreationTimestamp
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	private LocalDateTime createdAt;
	@JsonIgnore
	@UpdateTimestamp
	private LocalDateTime updatedAt;
	@JsonIgnore
	@ManyToMany(mappedBy = "discounts",cascade = CascadeType.ALL)
	private List<AppUser> discountedUser;
}
