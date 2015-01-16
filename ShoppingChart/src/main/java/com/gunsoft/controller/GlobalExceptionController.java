/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author gunanto
 */

@ControllerAdvice
public class GlobalExceptionController {
    
//	@ExceptionHandler(Exception.class)
//	public ModelAndView handleAllException(Exception ex) {
// 
//		ModelAndView model = new ModelAndView("error/generic_error");
//		model.addObject("errMsg", "this is Exception.class");
// 
//		return model;
// 
//	}
 
}
