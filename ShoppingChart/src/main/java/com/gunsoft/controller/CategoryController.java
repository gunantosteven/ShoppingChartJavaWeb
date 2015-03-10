/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Category;
import com.gunsoft.bean.ItemCategory;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ItemCategoryService;
import com.gunsoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
@RequestMapping(value = "/category")
public class CategoryController {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private ItemCategoryService itemCategoryService;
    
    @RequestMapping(value ="/{code}", method = RequestMethod.GET)
    public String index(ModelMap modelMap, @PathVariable String code, @RequestParam("page") Integer page) {
        modelMap.addAttribute("amountCategories", itemCategoryService.getAllAmountParentCategory());
        Category category = categoryService.getByCode(code);
        modelMap.addAttribute("amountCategory", itemCategoryService.getAmountByCategory(category));
        modelMap.addAttribute("itemCategoriesByCategory", itemCategoryService.getAllByCategory(6, category, page));
        modelMap.addAttribute("recommendedProducts", itemCategoryService.getAllByCategory(6, category));
        return "category";
    }
}
