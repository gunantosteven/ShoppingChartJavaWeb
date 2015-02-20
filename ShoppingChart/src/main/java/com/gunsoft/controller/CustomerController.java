/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Order;
import com.gunsoft.bean.OrderDetail;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import java.util.ArrayList;
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
public class CustomerController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpServletRequest request) {
        
        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) request.getSession().getAttribute("listOrderDetail");

        if(listOrderDetail != null && listOrderDetail.size() > 0)
            return "redirect:/product_summary";
        
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
        
        return "customer";
    }
}
