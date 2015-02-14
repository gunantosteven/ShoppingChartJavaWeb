/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.OrderDetail;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
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
@SessionAttributes("totalPrice")
public class ProductSumarryController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value = "/product_summary", method = RequestMethod.GET)
    public String index(ModelMap modelMap, HttpServletRequest request) {
        
        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) request.getSession().getAttribute("listOrderDetail");
        
        BigDecimal price  = new BigDecimal(0);
        if(listOrderDetail != null)
        {
            Iterator<OrderDetail> itr= listOrderDetail.iterator();  
            
            while(itr.hasNext()){  
                OrderDetail od = itr.next();
                price = price.add(BigDecimal.valueOf(od.getPrice())).multiply(BigDecimal.valueOf(od.getQuantity()));
            }  
        }
        
        

        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
        modelMap.addAttribute("totalPrice", price);
        return "product_summary";
    }
}
