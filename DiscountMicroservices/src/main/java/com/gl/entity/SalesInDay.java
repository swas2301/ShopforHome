package com.gl.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

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
public class SalesInDay {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	private long id;
	private LocalDate date;
	private long totalSaleAmount;
	private long totalSaleQuantity;
	@JsonIgnore
	@ManyToMany
	private List<Product> productsSold;
}
