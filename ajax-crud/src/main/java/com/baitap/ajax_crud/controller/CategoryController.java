package com.baitap.ajax_crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {

	@GetMapping("/category")
	public String categoryPage(Model model) {
	    model.addAttribute("contentPage", "../category/index.jsp");
	    return "common/layout";
	}
}