package com.baitap.graphql.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.baitap.graphql.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

    // Product từ giá thấp đến cao
    List<Product> findAllByOrderByPriceAsc();

    // Product thuộc một Category
    List<Product> findByCategoryId(Long categoryId);

    // Tìm kiếm + phân trang
    Page<Product> findByNameContainingIgnoreCase(
            String keyword,
            Pageable pageable);
}