package com.baitap.graphql.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.baitap.graphql.entity.Product;
import com.baitap.graphql.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // Lấy tất cả sản phẩm
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    // Lấy sản phẩm theo giá tăng dần
    public List<Product> findAllOrderByPriceAsc() {
        return productRepository.findAllByOrderByPriceAsc();
    }

    // Lấy sản phẩm theo Category
    public List<Product> findByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    // Tìm kiếm + phân trang
    public Page<Product> search(String keyword, Pageable pageable) {
        if (keyword == null) {
            keyword = "";
        }

        return productRepository
                .findByNameContainingIgnoreCase(keyword, pageable);
    }

    // Tìm Product theo ID
    public Product findById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    // Thêm Product
    public Product save(Product product) {
        return productRepository.save(product);
    }

    // Xóa Product
    public void deleteById(Long id) {
        productRepository.deleteById(id);
    }

    // Kiểm tra Product tồn tại
    public boolean existsById(Long id) {
        return productRepository.existsById(id);
    }
}