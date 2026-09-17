package com.baitap.ajax_crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.baitap.ajax_crud.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}