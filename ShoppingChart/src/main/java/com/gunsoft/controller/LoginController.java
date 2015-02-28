/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author gunanto
 */
@Controller
public class LoginController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
        @RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
                        request.getSession().setAttribute("name", "");
		}
		model.setViewName("login");
                
                model.addObject("amountCategories", categoryService.getCategoryCount(6));
                
		return model;

	}
        
        @RequestMapping(value = "/loginsuccess", method = RequestMethod.GET)
	public String loginSuccess(HttpServletRequest request,ModelMap modelMap) {
            
                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                String name = auth.getName();
                Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) auth.getAuthorities();
                
                request.getSession().setAttribute("userName", name);
                
                for(SimpleGrantedAuthority s : authorities)
                {
                    if(s.getAuthority().equals("ROLE_ADMIN"))
                    {
                        return "redirect:/admin";
                    }
                }
                
		return "redirect:/customer";
	}
    
    // customize the error message
    private String getErrorMessage(HttpServletRequest request, String key) {

            Exception exception = (Exception) request.getSession().getAttribute(key);

            String error = "";
            if (exception instanceof BadCredentialsException) {
                    error = "Invalid username and password!";
            } else if (exception instanceof LockedException) {
                    error = exception.getMessage();
            } else {
                    error = "Invalid username and password!";
            }

            return error;
    }
    
}
