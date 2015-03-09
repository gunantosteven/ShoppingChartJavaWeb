/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ItemCategoryService;
import com.gunsoft.service.ProductService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author gunanto
 */
@Controller
public class ForgetPassController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ItemCategoryService itemCategoryService;
    
    @RequestMapping(value = "/forgetpass", method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpServletRequest request) {

        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", itemCategoryService.getAllAmountParentCategory());

        return "forgetpass";
    }
}
