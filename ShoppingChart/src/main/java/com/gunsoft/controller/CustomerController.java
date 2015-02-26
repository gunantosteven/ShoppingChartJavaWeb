/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Order;
import com.gunsoft.bean.OrderDetail;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.OrderDetailService;
import com.gunsoft.service.OrderService;
import com.gunsoft.service.ProductService;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
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
public class CustomerController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private OrderDetailService orderDetailService;
    
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpServletRequest request) {
        
        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) request.getSession().getAttribute("listOrderDetail");

        if(listOrderDetail != null && listOrderDetail.size() > 0)
            return "redirect:/product_summary";
        
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", username);
        modelMap.addAttribute("listOrders", orderService.getByCustomerUsername(username));
        
        return "redirect:/customer/order";
    }
    
    @RequestMapping(value = "/customer/order", method = RequestMethod.GET)
    public String customerOrder(ModelMap modelMap, HttpServletRequest request) {
        
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", username);
        modelMap.addAttribute("listOrders", orderService.getByCustomerUsername(username));
        
        return "customer";
    }
    
    @RequestMapping(value = "/customer/orderdetail", method = RequestMethod.GET)
    public String customerOrderDetail(ModelMap modelMap, @RequestParam(value = "kode", required = true) String kode ) {
        
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", username);
        modelMap.addAttribute("listOrderDetail", orderDetailService.getByIdAndUsername(kode, username));
        
        return "customerOrderDetail";
    }
}