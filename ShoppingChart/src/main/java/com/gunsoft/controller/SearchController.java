/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ItemCategoryService;
import com.gunsoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author gunanto
 */
@Controller
public class SearchController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ItemCategoryService itemCategoryService;
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(ModelMap modelMap, @RequestParam("titleProduct") String titleProduct, @RequestParam("codeCategory") String codeCategory) {
        if(codeCategory.equals("all"))
        {
            modelMap.addAttribute("productsfound", productService.getAllByTitleProduct(9, "%" + titleProduct + "%"));
        }
        else
        {
            modelMap.addAttribute("productsfound", productService.getAllByCategoryAndTitleProduct("%" + titleProduct + "%", categoryService.getByCode(codeCategory), 9));
        }
        modelMap.addAttribute("amountCategories", itemCategoryService.getAllAmountParentCategory());
        return "search";
    }
}
