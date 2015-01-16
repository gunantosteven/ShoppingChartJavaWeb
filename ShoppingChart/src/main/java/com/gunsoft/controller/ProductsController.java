/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Category;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author gunanto
 */
@Controller
@RequestMapping(value = "/products")
public class ProductsController {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(value ="/{code}", method = RequestMethod.GET)
    public String index(ModelMap modelMap, @PathVariable String code, @RequestParam("page") Integer page) {
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        Category category = categoryService.getByCode(code);
        modelMap.addAttribute("amountCategory", categoryService.getCategoryCount(category));
        modelMap.addAttribute("category", category);
        modelMap.addAttribute("productsByCategory", productService.getAllByCategory(6, category, page));
        return "products";
    }
}
