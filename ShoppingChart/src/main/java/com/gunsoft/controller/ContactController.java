/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author gunanto
 */
@Controller
public class ContactController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        return "contact";
    }
}
