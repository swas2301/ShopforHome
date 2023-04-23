package com.gl.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

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
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString(exclude = {"userCart"})
public class CartItems {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private long id;
	private long quantity;
	@CreationTimestamp
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	private LocalDateTime createdAt;
	@UpdateTimestamp
	@JsonIgnore
	private LocalDateTime updatedAt;
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JsonIgnore
	private Cart userCart;
	@ManyToOne
	private Product cartProduct;
	
}
