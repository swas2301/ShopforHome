package com.gl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gl.entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

}
