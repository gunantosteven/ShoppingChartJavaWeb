/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Address;
import com.gunsoft.bean.Customer;
import com.gunsoft.bean.User;
import com.gunsoft.bean.UserRole;
import com.gunsoft.service.CustomerService;
import com.gunsoft.service.MyUserDetailsService;
import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
@RequestMapping(value = "/admin/customers")
public class AdminCustomerController {
    
    @Autowired
    private CustomerService customerService; 
    
    @Autowired 
    private MyUserDetailsService myUserDetailsService;
    
    @Autowired
    private BCryptPasswordEncoder encoder;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("customerActive", "active");
        modelMap.addAttribute("listCustomer", customerService.getAll());
        return "admin/customers";
    }
    
    @RequestMapping(value ="/addcustomer", method = RequestMethod.GET)
    public String pageAdd(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("customerActive", "active");
        return "admin/AddCustomer";
    }
    
    @RequestMapping(value ="/addcustomer", method = RequestMethod.POST)
    public String addCustomer(ModelMap modelMap ,@ModelAttribute Customer customer, @ModelAttribute User user, @ModelAttribute Address address
        , @RequestParam(value = "firstNameAddress", required = false) String firstNameAddress, @RequestParam(value = "lastNameAddress", required = false) String lastNameAddress) {
        try {
            if(myUserDetailsService.getByUsername(user.getUsername()) != null)
            {
                modelMap.addAttribute("error", "Email sudah ada");
                return "admin/AddCustomer"; 
            }  
            else
            {
                Set<UserRole> userRole = new HashSet<UserRole>();
                userRole.add(new UserRole(user , "ROLE_USER"));
                user.setEnabled(true);
                user.setUserRole(userRole);

                address.setFirstName(firstNameAddress);
                address.setLastName(lastNameAddress);
                address.setCustomer(customer);

                user.setPassword(encoder.encode(user.getPassword()));
                
                customer.setUser(user);
                customer.setAddress(address);
                customerService.save(customer);
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/customers";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("customerActive", "active");
        modelMap.addAttribute("customer", customerService.getById(uuid));
        return "admin/EditCustomer";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.POST)
    public String editCustomer(ModelMap modelMap ,@PathVariable String uuid ,@ModelAttribute Customer customer, @ModelAttribute User user, @ModelAttribute Address address
        , @RequestParam(value = "firstNameAddress", required = false) String firstNameAddress, @RequestParam(value = "lastNameAddress", required = false) String lastNameAddress) {
        try {
            Customer c = customerService.getById(uuid);
            
            address.setId(c.getUuid());
            address.setFirstName(firstNameAddress);
            address.setLastName(lastNameAddress);
            
            user.setPassword(encoder.encode(user.getPassword()));

            customer.setUuid(c.getUuid());
            customer.setUser(myUserDetailsService.getByUsername(user.getUsername()));
            customer.setAddress(address);
            
            customer.getUser().setPassword(user.getPassword());
            
            customerService.update(customer); 
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/customers";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid, @ModelAttribute Customer customer) throws Exception {
        customer = customerService.getById(uuid);
        customerService.delete(customer);
        return "redirect:/admin/customers";
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
