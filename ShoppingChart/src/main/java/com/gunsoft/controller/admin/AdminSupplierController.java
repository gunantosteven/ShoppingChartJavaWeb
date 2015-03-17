/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Supplier;
import com.gunsoft.service.ProductService;
import com.gunsoft.service.SupplierService;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author gunanto
 */
@Controller
@RequestMapping(value = "/admin/suppliers")
public class AdminSupplierController {
    @Autowired
    private SupplierService supplierService;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("supplierActive", "active");
        modelMap.addAttribute("listSuppliers", supplierService.getAll());
        return "admin/suppliers";
    }
    
    @RequestMapping(value ="/addsupplier", method = RequestMethod.GET)
    public String pageAdd(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("supplierActive", "active");
        return "admin/AddSupplier";
    }
    
    @RequestMapping(value ="/addsupplier", method = RequestMethod.POST)
    public String addSupplier(ModelMap modelMap ,@ModelAttribute Supplier supplier, HttpServletRequest request) {
        try {
            if(supplierService.getByKode(supplier.getKodeSupplier()) != null)
            {
                modelMap.addAttribute("error", "Kode Supplier sudah ada");
                return "admin/AddSupplier"; 
            } 
            else
            { 
                supplierService.save(supplier);
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/suppliers";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("supplierActive", "active");
        modelMap.addAttribute("supplier", supplierService.getById(uuid));
        return "admin/EditSupplier";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.POST)
    public String editSupplier(ModelMap modelMap ,@PathVariable String uuid ,@ModelAttribute Supplier supplier) {
        try {
            Supplier s = supplierService.getById(uuid);
            if(s != null)
            {
                supplierService.update(supplier); 
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/suppliers";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid) throws Exception {
        Supplier supplier = supplierService.getById(uuid);
        if(supplier != null)
        {
            supplierService.delete(supplier); 
        }
        return "redirect:/admin/suppliers";
    }
}
