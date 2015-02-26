/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.AddressOrder;
import com.gunsoft.bean.Customer;
import com.gunsoft.bean.Order;
import com.gunsoft.bean.OrderDetail;
import com.gunsoft.bean.Status;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.CustomerService;
import com.gunsoft.service.OrderService;
import com.gunsoft.service.ProductService;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author gunanto
 */
@Controller
public class CheckOutController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value = "/checkout",method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpServletRequest request) {
        
        Customer c = null;
        
        if(SecurityContextHolder.getContext().getAuthentication().getName() != null)
            c = customerService.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        
        if(c == null)
            return "redirect:/login";
        
        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("customer", c);
        
        return "checkout";
    }
    
    @RequestMapping(value = "/checkout",method = RequestMethod.POST)
    public String checkOut(ModelMap modelMap, HttpServletRequest request, @ModelAttribute AddressOrder addressOrder, @ModelAttribute Order order) {
        
        Customer c = null;
        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) request.getSession().getAttribute("listOrderDetail");
        
        if(SecurityContextHolder.getContext().getAuthentication().getName() != null)
            c = customerService.getByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        
        order.setDate(new Date());
        order.setAmount((BigDecimal) request.getSession().getAttribute("totalPrice"));
        order.setStatus(Status.DELIVERED);
        order.setCustomer(c);
        order.setListOrderDetail(listOrderDetail);
        order.setAddressOrder(addressOrder);
        
        addressOrder.setOrder(order);
        for(int i = 0; listOrderDetail.size() > i; i++)
        {
            listOrderDetail.get(0).setOrder(order);
        }
        
        try {
            orderService.save(order);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("customer", c);
        //  listOrderDetail to null
        request.getSession().setAttribute("listOrderDetail", null);
        
        return "checkout_success";
    }
    
}
