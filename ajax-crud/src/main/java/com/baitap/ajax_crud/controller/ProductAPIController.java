package com.baitap.ajax_crud.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.baitap.ajax_crud.entity.Category;
import com.baitap.ajax_crud.entity.Product;
import com.baitap.ajax_crud.service.CategoryService;
import com.baitap.ajax_crud.service.ProductService;
import com.baitap.ajax_crud.service.StorageService;

@RestController
@RequestMapping("/api/product")
public class ProductAPIController {

    private final ProductService productService;
    private final CategoryService categoryService;
    private final StorageService storageService;

    public ProductAPIController(
            ProductService productService,
            CategoryService categoryService,
            StorageService storageService) {

        this.productService = productService;
        this.categoryService = categoryService;
        this.storageService = storageService;
    }


    // =================================================
    // GET ALL PRODUCT
    // =================================================

    @GetMapping
    public ResponseEntity<List<Product>> getAll() {

        return ResponseEntity.ok(
                productService.findAll()
        );
    }


    // =================================================
    // GET PRODUCT BY ID
    // =================================================

    @GetMapping("/{id}")
    public ResponseEntity<Product> getById(
            @PathVariable Long id) {

        Product product =
                productService.findById(id);

        if (product == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }

        return ResponseEntity.ok(product);
    }


    // =================================================
    // ADD PRODUCT
    // =================================================

    @PostMapping
    public ResponseEntity<Product> create(

            @RequestParam("name")
            String name,

            @RequestParam(value = "image",
                    required = false)
            MultipartFile image,

            @RequestParam("unitPrice")
            BigDecimal unitPrice,

            @RequestParam(value = "discount",
                    defaultValue = "0")
            Double discount,

            @RequestParam(value = "description",
                    required = false)
            String description,

            @RequestParam("quantity")
            Integer quantity,

            @RequestParam("status")
            Boolean status,

            @RequestParam("categoryId")
            Long categoryId) {


        // -----------------------------------------
        // Tìm Category
        // -----------------------------------------

        Category category =
                categoryService.findById(categoryId);

        if (category == null) {

            return ResponseEntity
                    .badRequest()
                    .build();
        }


        // -----------------------------------------
        // Tạo Product
        // -----------------------------------------

        Product product =
                new Product();

        product.setName(name);

        product.setUnitPrice(unitPrice);

        product.setDiscount(discount);

        product.setDescription(description);

        product.setQuantity(quantity);

        product.setStatus(status);

        product.setCategory(category);


        // -----------------------------------------
        // Upload Image
        // -----------------------------------------

        if (image != null
                && !image.isEmpty()) {

            String fileName =
                    storageService.store(image);

            product.setImage(fileName);
        }


        // -----------------------------------------
        // Save
        // -----------------------------------------

        Product savedProduct =
                productService.save(product);


        return ResponseEntity.ok(
                savedProduct
        );
    }


    // =================================================
    // UPDATE PRODUCT
    // =================================================

    @PutMapping("/{id}")
    public ResponseEntity<Product> update(

            @PathVariable Long id,

            @RequestParam("name")
            String name,

            @RequestParam(value = "image",
                    required = false)
            MultipartFile image,

            @RequestParam("unitPrice")
            BigDecimal unitPrice,

            @RequestParam(value = "discount",
                    defaultValue = "0")
            Double discount,

            @RequestParam(value = "description",
                    required = false)
            String description,

            @RequestParam("quantity")
            Integer quantity,

            @RequestParam("status")
            Boolean status,

            @RequestParam("categoryId")
            Long categoryId) {


        // -----------------------------------------
        // Tìm Product
        // -----------------------------------------

        Product existingProduct =
                productService.findById(id);

        if (existingProduct == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }


        // -----------------------------------------
        // Tìm Category
        // -----------------------------------------

        Category category =
                categoryService.findById(categoryId);

        if (category == null) {

            return ResponseEntity
                    .badRequest()
                    .build();
        }


        // -----------------------------------------
        // Cập nhật thông tin
        // -----------------------------------------

        existingProduct.setName(name);

        existingProduct.setUnitPrice(unitPrice);

        existingProduct.setDiscount(discount);

        existingProduct.setDescription(description);

        existingProduct.setQuantity(quantity);

        existingProduct.setStatus(status);

        existingProduct.setCategory(category);


        // -----------------------------------------
        // Cập nhật Image nếu chọn ảnh mới
        // -----------------------------------------

        if (image != null
                && !image.isEmpty()) {

            String fileName =
                    storageService.store(image);

            existingProduct.setImage(fileName);
        }


        // -----------------------------------------
        // Save
        // -----------------------------------------

        Product updatedProduct =
                productService.save(
                        existingProduct
                );


        return ResponseEntity.ok(
                updatedProduct
        );
    }


    // =================================================
    // DELETE PRODUCT
    // =================================================

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(
            @PathVariable Long id) {

        Product product =
                productService.findById(id);

        if (product == null) {

            return ResponseEntity
                    .notFound()
                    .build();
        }


        productService.deleteById(id);


        return ResponseEntity
                .noContent()
                .build();
    }

}