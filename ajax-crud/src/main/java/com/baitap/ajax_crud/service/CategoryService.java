package com.baitap.ajax_crud.service;

import java.util.List;

import com.baitap.ajax_crud.entity.Category;

public interface CategoryService {

    List<Category> findAll();

    Category findById(Long id);

    Category save(Category category);

    void deleteById(Long id);
}