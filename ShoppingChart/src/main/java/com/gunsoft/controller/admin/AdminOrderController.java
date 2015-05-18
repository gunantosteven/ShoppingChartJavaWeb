/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Order;
import com.gunsoft.bean.Status;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.OrderService;
import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import javax.swing.JOptionPane;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author gunanto
 */
@Controller
@RequestMapping(value = "/admin/orders")
public class AdminOrderController {
    @Autowired
    private OrderService orderService;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("transactionActive", "active");
        modelMap.addAttribute("orderActive", "active");
        modelMap.addAttribute("listOrders", orderService.getAll());
        return "admin/orders";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("transactionActive", "active");
        modelMap.addAttribute("orderActive", "active");
        modelMap.addAttribute("order", orderService.getById(uuid));
        modelMap.addAttribute("listStatus", Status.values());
        return "admin/EditOrder";
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String changeStatus(ModelMap modelMap, @RequestParam(value = "uuid") String uuid, @RequestParam(value = "status") String status)  {
        try {
            orderService.updateStatus(uuid, status);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(AdminOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/admin/orders";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid) throws Exception {
        Order order = orderService.getById(uuid);
        orderService.delete(order);
        return "redirect:/admin/orders";
    }
   
}
