/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.bean.Address;
import com.gunsoft.bean.Customer;
import com.gunsoft.bean.User;
import com.gunsoft.bean.UserRole;
import com.gunsoft.service.AddressService;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.CustomerService;
import com.gunsoft.service.MyUserDetailsService;
import com.gunsoft.service.ProductService;
import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author gunanto
 */
@Controller
public class RegisterController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private MyUserDetailsService myUserDetailsService;
    
    @Autowired
    private AddressService addressService;
    
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String page(ModelMap modelMap) {
        
        if(!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
        {
            return "redirect:/";
        }
        
        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
        return "register";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String save(ModelMap modelMap ,@ModelAttribute Customer customer, @ModelAttribute User user, @ModelAttribute Address address
        , @RequestParam(value = "firstNameAddress", required = false) String firstNameAddress, @RequestParam(value = "lastNameAddress", required = false) String lastNameAddress ) 
    {
        if(!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
        {
            return "redirect:/";
        }
        
        Set<UserRole> userRole = new HashSet<UserRole>();
        userRole.add(new UserRole(user , "ROLE_USER"));
        user.setEnabled(true);
        user.setUserRole(userRole);
        
        address.setFirstName(firstNameAddress);
        address.setLastName(lastNameAddress);
        address.setCustomer(customer);
        
        customer.setUser(user);
        customer.setAddress(address);
        
        try {
            customerService.save(customer);
//            addressService.save(address);
//            myUserDetailsService.save(user);
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        modelMap.addAttribute("latestProducts", productService.getAll(9));
        modelMap.addAttribute("amountCategories", categoryService.getCategoryCount(6));
        modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
        return "redirect:/login";
    }
    
    @InitBinder
    public void binder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            public void setAsText(String value) {
                try {
                    setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
                } catch (ParseException e) {
                    setValue(null);
                }
            }
        });
    }
}
