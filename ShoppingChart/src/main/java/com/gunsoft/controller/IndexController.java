/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class IndexController {
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }
}
