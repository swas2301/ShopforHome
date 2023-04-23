package com.roytuts.pdf.report.generation.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

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
	@JsonIgnore
	private String password;
	private String first_name;
	private String last_name;
	private String address;
	private String phoneNumber;
	@CreationTimestamp
	@JsonIgnore
	@Column(updatable = false,nullable = false)
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private String role;
	
	
}
