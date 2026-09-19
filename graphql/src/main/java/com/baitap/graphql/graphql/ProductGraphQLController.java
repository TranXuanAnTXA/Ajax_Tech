package com.baitap.graphql.graphql;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.baitap.graphql.entity.Product;
import com.baitap.graphql.service.ProductService;

@Controller
public class ProductGraphQLController {

	private final ProductService productService;

	public ProductGraphQLController(ProductService productService) {
		this.productService = productService;
	}

	// ==========================================
	// Lấy Product theo ID - Chi tiết sản phẩm
	// ==========================================
	@QueryMapping
	public Product product(@Argument Long id) {
		return productService.findById(id);
	}

	// ==========================================
	// Lấy tất cả Product
	// ==========================================
	@QueryMapping
	public List<Product> products() {
		return productService.findAll();
	}

	// ==========================================
	// Product sắp xếp theo giá tăng dần
	// ==========================================
	@QueryMapping
	public List<Product> productsOrderByPriceAsc() {
		return productService.findAllOrderByPriceAsc();
	}

	// ==========================================
	// Product theo Category
	// ==========================================
	@QueryMapping
	public List<Product> productsByCategory(@Argument Long categoryId) {

		return productService.findByCategoryId(categoryId);
	}

	// ==========================================
	// Search + Pagination Product
	// ==========================================
	@QueryMapping
	public ProductPage searchProducts(@Argument String keyword, @Argument Integer page, @Argument Integer size) {

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

		Page<Product> result = productService.search(keyword, pageable);

		return new ProductPage(result.getContent(), result.getNumber(), result.getSize(), result.getTotalElements(),
				result.getTotalPages());
	}

	// ==========================================
	// DTO dùng cho Pagination
	// ==========================================
	public static class ProductPage {

		private List<Product> content;
		private int currentPage;
		private int pageSize;
		private long totalElements;
		private int totalPages;

		public ProductPage(List<Product> content, int currentPage, int pageSize, long totalElements, int totalPages) {

			this.content = content;
			this.currentPage = currentPage;
			this.pageSize = pageSize;
			this.totalElements = totalElements;
			this.totalPages = totalPages;
		}

		public List<Product> getContent() {
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