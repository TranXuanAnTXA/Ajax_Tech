package com.baitap.graphql.graphql;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.stereotype.Controller;

import com.baitap.graphql.entity.Category;
import com.baitap.graphql.entity.Product;
import com.baitap.graphql.service.CategoryService;
import com.baitap.graphql.service.ProductService;

@Controller
public class ProductMutationController {

    private final ProductService productService;
    private final CategoryService categoryService;

    public ProductMutationController(
            ProductService productService,
            CategoryService categoryService) {

        this.productService = productService;
        this.categoryService = categoryService;
    }

    // ==========================================
    // CREATE PRODUCT
    // ==========================================
    @MutationMapping
    public Product createProduct(
            @Argument String name,
            @Argument Double price,
            @Argument String description,
            @Argument Integer quantity,
            @Argument String image,
            @Argument Long categoryId) {

        Category category = categoryService.findById(categoryId);

        if (category == null) {
            throw new RuntimeException(
                    "Không tìm thấy category với ID: " + categoryId);
        }

        Product product = new Product();

        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setQuantity(quantity);
        product.setImage(image);
        product.setCategory(category);

        return productService.save(product);
    }

    // ==========================================
    // UPDATE PRODUCT
    // ==========================================
    @MutationMapping
    public Product updateProduct(
            @Argument Long id,
            @Argument String name,
            @Argument Double price,
            @Argument String description,
            @Argument Integer quantity,
            @Argument String image,
            @Argument Long categoryId) {

        Product product = productService.findById(id);

        if (product == null) {
            throw new RuntimeException(
                    "Không tìm thấy product với ID: " + id);
        }

        Category category = categoryService.findById(categoryId);

        if (category == null) {
            throw new RuntimeException(
                    "Không tìm thấy category với ID: " + categoryId);
        }

        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setQuantity(quantity);
        product.setImage(image);
        product.setCategory(category);

        return productService.save(product);
    }

    // ==========================================
    // DELETE PRODUCT
    // ==========================================
    @MutationMapping
    public Boolean deleteProduct(@Argument Long id) {

        if (!productService.existsById(id)) {
            return false;
        }

        productService.deleteById(id);

        return true;
    }
}