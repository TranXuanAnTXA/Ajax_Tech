package com.baitap.ajax_crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baitap.ajax_crud.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}