package com.baitap.graphql.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.baitap.graphql.entity.Category;
import com.baitap.graphql.repository.CategoryRepository;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    // Lấy tất cả Category
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    // Tìm kiếm + phân trang
    public Page<Category> search(String keyword, Pageable pageable) {
        if (keyword == null) {
            keyword = "";
        }

        return categoryRepository
                .findByNameContainingIgnoreCase(keyword, pageable);
    }

    // Tìm Category theo ID
    public Category findById(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    // Thêm Category
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    // Xóa Category
    public void deleteById(Long id) {
        categoryRepository.deleteById(id);
    }

    // Kiểm tra Category tồn tại
    public boolean existsById(Long id) {
        return categoryRepository.existsById(id);
    }
}