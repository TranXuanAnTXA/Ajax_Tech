package com.baitap.ajax_crud.service;

import java.util.List;

import com.baitap.ajax_crud.entity.Product;

public interface ProductService {

    List<Product> findAll();

    Product findById(Long id);

    Product save(Product product);

    void deleteById(Long id);
}