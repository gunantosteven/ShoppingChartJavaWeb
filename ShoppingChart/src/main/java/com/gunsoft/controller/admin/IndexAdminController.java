/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Status;
import com.gunsoft.service.OrderService;
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
public class IndexAdminController {
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("listNewOrder", orderService.getByStatusOrder(Status.DELIVERED));
        return "admin/dashboard";
    }
    
}
