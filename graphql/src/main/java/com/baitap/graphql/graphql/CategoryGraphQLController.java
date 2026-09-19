package com.baitap.graphql.graphql;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.baitap.graphql.entity.Category;
import com.baitap.graphql.service.CategoryService;

@Controller
public class CategoryGraphQLController {

	private final CategoryService categoryService;

	public CategoryGraphQLController(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	// ==========================================
	// Lấy tất cả Category
	// ==========================================
	@QueryMapping
	public List<Category> categories() {
		return categoryService.findAll();
	}

	// ==========================================
	// Search + Pagination Category
	// ==========================================
	@QueryMapping
	public CategoryPage searchCategories(@Argument String keyword, @Argument Integer page, @Argument Integer size) {

		if (keyword == null) {
			keyword = "";
		}

		if (page == null || page < 0) {
			page = 0;
		}

		if (size == null || size <= 0) {
			size = 5;
		}

		Pageable pageable = PageRequest.of(page, size);

		Page<Category> result = categoryService.search(keyword, pageable);

		return new CategoryPage(result.getContent(), result.getNumber(), result.getSize(), result.getTotalElements(),
				result.getTotalPages());
	}

	// ==========================================
	// DTO dùng cho Pagination
	// ==========================================
	public static class CategoryPage {

		private List<Category> content;
		private int currentPage;
		private int pageSize;
		private long totalElements;
		private int totalPages;

		public CategoryPage(List<Category> content, int currentPage, int pageSize, long totalElements, int totalPages) {

			this.content = content;
			this.currentPage = currentPage;
			this.pageSize = pageSize;
			this.totalElements = totalElements;
			this.totalPages = totalPages;
		}

		public List<Category> getContent() {
			return content;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public int getPageSize() {
			return pageSize;
		}

		public long getTotalElements() {
			return totalElements;
		}

		public int getTotalPages() {
			return totalPages;
		}
	}
}