package com.gl.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

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
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductInventory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private int quantity;
	@JsonIgnore
	@Column(nullable = false,updatable = false)
	@CreationTimestamp
	private LocalDateTime createdAt;
	@JsonIgnore
	@UpdateTimestamp
	private LocalDateTime updatedAt;
	@JsonIgnore
	@OneToOne(mappedBy = "inventory",cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	private Product product;
	@Override
	public String toString() {
		return "ProductInventory [id=" + id + ", quantity=" + quantity + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + "]";
	}
	
}
