package com.roytuts.pdf.report.generation.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String description;
	private String sku;
	private String color;
	private long price;
	@OneToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.REMOVE})
	private Product_Inventory inventory;
	private String image;
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	@CreationTimestamp
	private LocalDateTime created_at;
	@JsonIgnore
	@UpdateTimestamp
	private LocalDateTime updated_at;
//	@JsonIgnore
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	private Product_Category category;
//	@JsonIgnore
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	private Product_Brand brand;
	@Column(name = "sales",columnDefinition ="bigint default 0")
	private long sales;
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", sku=" + sku + ", color="
				+ color + ", images=" + image + ", createdAt=" + created_at + ", updatedAt=" + updated_at + "]";
	}
	
	
}