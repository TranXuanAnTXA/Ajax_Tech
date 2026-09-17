package com.baitap.ajax_crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@Controller
public class ProductController {

	@GetMapping("/product")
	public String productPage(Model model) {
	    model.addAttribute("contentPage", "../product/index.jsp");
	    return "common/layout";
	}
}