package com.baitap.ajax_crud.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.baitap.ajax_crud.entity.Product;
import com.baitap.ajax_crud.repository.ProductRepository;
import com.baitap.ajax_crud.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;


    public ProductServiceImpl(ProductRepository productRepository) {

        this.productRepository = productRepository;
    }


    @Override
    public List<Product> findAll() {

        return productRepository.findAll();
    }


    @Override
    public Product findById(Long id) {

        return productRepository.findById(id).orElse(null);
    }


    @Override
    public Product save(Product product) {

        return productRepository.save(product);
    }


    @Override
    public void deleteById(Long id) {

        productRepository.deleteById(id);
    }
}