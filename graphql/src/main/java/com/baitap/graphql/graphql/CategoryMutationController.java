package com.baitap.graphql.graphql;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.stereotype.Controller;

import com.baitap.graphql.entity.Category;
import com.baitap.graphql.service.CategoryService;

@Controller
public class CategoryMutationController {

    private final CategoryService categoryService;

    public CategoryMutationController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // CREATE
    @MutationMapping
    public Category createCategory(
            @Argument String name,
            @Argument String icon) {

        Category category = new Category();

        category.setName(name);
        category.setIcon(icon);

        return categoryService.save(category);
    }

    // UPDATE
    @MutationMapping
    public Category updateCategory(
            @Argument Long id,
            @Argument String name,
            @Argument String icon) {

        Category category = categoryService.findById(id);

        if (category == null) {
            throw new RuntimeException(
                    "Không tìm thấy category với ID: " + id);
        }

        category.setName(name);
        category.setIcon(icon);

        return categoryService.save(category);
    }

    // DELETE
    @MutationMapping
    public Boolean deleteCategory(@Argument Long id) {

        if (!categoryService.existsById(id)) {
            return false;
        }

        categoryService.deleteById(id);

        return true;
    }
}