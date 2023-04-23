package com.gl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gl.entity.OrderDetails;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetails,Long>{

}
