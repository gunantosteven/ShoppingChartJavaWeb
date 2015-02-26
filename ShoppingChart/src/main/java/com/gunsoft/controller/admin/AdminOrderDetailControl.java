/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.service.OrderDetailService;
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
@RequestMapping(value = "/admin/orderdetail")
public class AdminOrderDetailControl {
    @Autowired
    private OrderDetailService orderDetailService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("transactionActive", "active");
        modelMap.addAttribute("orderDetailActive", "active");
        modelMap.addAttribute("listOrderDetails", orderDetailService.getAll());
        return "admin/orderdetail";
    }
}
