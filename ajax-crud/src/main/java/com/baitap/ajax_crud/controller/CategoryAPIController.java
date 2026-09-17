package com.baitap.ajax_crud.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.baitap.ajax_crud.entity.Category;
import com.baitap.ajax_crud.service.CategoryService;
import com.baitap.ajax_crud.service.StorageService;

@RestController
@RequestMapping("/api/category")
public class CategoryAPIController {

    private final CategoryService categoryService;
    private final StorageService storageService;

    public CategoryAPIController(
            CategoryService categoryService,
            StorageService storageService) {

        this.categoryService = categoryService;
        this.storageService = storageService;
    }


    // =========================================
    // GET ALL CATEGORY
    // =========================================

    @GetMapping
    public ResponseEntity<List<Category>> getAll() {

        return ResponseEntity.ok(
                categoryService.findAll()
        );
    }


    // =========================================
    // GET CATEGORY BY ID
    // =========================================

    @GetMapping("/{id}")
    public ResponseEntity<Category> getById(
            @PathVariable Long id) {

        Category category =
                categoryService.findById(id);

        if (category == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }

        return ResponseEntity.ok(category);
    }


    // =========================================
    // CREATE CATEGORY
    // =========================================

    @PostMapping
    public ResponseEntity<Category> create(

            @RequestParam("name")
            String name,

            @RequestParam(
                    value = "icon",
                    required = false)
            MultipartFile icon) {


        // Tạo Category mới
        Category category =
                new Category();

        category.setName(name);


        // Upload icon nếu có
        if (icon != null
                && !icon.isEmpty()) {

            String fileName =
                    storageService.store(icon);

            category.setIcon(fileName);
        }


        // Lưu Category
        Category savedCategory =
                categoryService.save(category);

        return ResponseEntity.ok(
                savedCategory
        );
    }


    // =========================================
    // UPDATE CATEGORY
    // =========================================

    @PutMapping("/{id}")
    public ResponseEntity<Category> update(

            @PathVariable Long id,

            @RequestParam("name")
            String name,

            @RequestParam(
                    value = "icon",
                    required = false)
            MultipartFile icon) {


        // Tìm Category hiện tại
        Category existingCategory =
                categoryService.findById(id);

        if (existingCategory == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }


        // Cập nhật tên
        existingCategory.setName(name);


        // Nếu chọn icon mới thì upload
        if (icon != null
                && !icon.isEmpty()) {

            String fileName =
                    storageService.store(icon);

            existingCategory.setIcon(fileName);
        }


        // Lưu Category
        Category updatedCategory =
                categoryService.save(
                        existingCategory
                );

        return ResponseEntity.ok(
                updatedCategory
        );
    }


    // =========================================
    // DELETE CATEGORY
    // =========================================

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(
            @PathVariable Long id) {

        Category category =
                categoryService.findById(id);

        if (category == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }


        categoryService.deleteById(id);


        return ResponseEntity
                .noContent()
                .build();
    }

}