/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.OrderDetail;
import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author gunanto
 */
@Controller
@SessionAttributes("listOrderDetail")
public class CartController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping(value = "/addcart/{itemCode}", method = RequestMethod.GET)
    public String addCart(ModelMap modelMap, HttpServletRequest request, @PathVariable String itemCode ) {

        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) request.getSession().getAttribute("listOrderDetail");
        OrderDetail orderDetail = new OrderDetail();
        
        if(listOrderDetail == null)
        {
            listOrderDetail = new ArrayList<OrderDetail>();
        }
        
        Iterator<OrderDetail> itr= listOrderDetail.iterator();    
        boolean check = false;
        while(itr.hasNext()){  
            OrderDetail od = itr.next();
            if(od.getProduct().getCode().equals(itemCode))
            {
                od.setQuantity(od.getQuantity() + 1);
                check = true;
                break;
            }
        } 
        
        if(check == false)
        {
            Product product = productService.getByCode(itemCode);
        
            orderDetail.setProduct(product);
            orderDetail.setQuantity(1);
            orderDetail.setPrice(product.getPrice());
            
            listOrderDetail.add(orderDetail);
        }
        
        
        
        
        
        
        modelMap.addAttribute("listOrderDetail", listOrderDetail);
        
        return "redirect:/product_summary";
    }
}
