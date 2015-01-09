/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class IndexController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        return "index";
    }
    
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String getPages(ModelMap modelMap) {
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        return "404";
    }
}
