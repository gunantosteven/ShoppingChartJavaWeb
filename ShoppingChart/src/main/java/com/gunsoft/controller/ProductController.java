/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author gunanto
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value ="/{code}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String code) {
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        Product product = productService.getByCode(code);
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("productsByCategory", productService.getAllByCategory(6, product.getCategory()));
        return "productDetails";
    }
}
