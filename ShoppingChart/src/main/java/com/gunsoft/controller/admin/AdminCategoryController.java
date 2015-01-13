/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Category;
import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
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
@RequestMapping(value = "/admin/categories")
public class AdminCategoryController {
    
    @Autowired
    private CategoryService categoryService;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("categoryActive", "active");
        modelMap.addAttribute("listCategories", categoryService.getAll());
        return "admin/categories";
    }
    
    @RequestMapping(value ="/addcategory", method = RequestMethod.GET)
    public String pageAdd(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("categoryActive", "active");
        return "admin/AddCategory";
    }
    
    @RequestMapping(value ="/addcategory", method = RequestMethod.POST)
    public String addCategory(ModelMap modelMap ,@ModelAttribute Category category) {
        try {
            if(categoryService.getByTitle(category.getTitle()) == null)
                categoryService.saveOrUpdate(category);
            else
            {
                modelMap.addAttribute("error", "Title sudah ada");
                return "admin/AddCategory"; 
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/categories";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("categoryActive", "active");
        modelMap.addAttribute("category", categoryService.getById(uuid));
        return "admin/EditCategory";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.POST)
    public String editCategory(@PathVariable String uuid, ModelMap modelMap, @ModelAttribute Category category) {
        try {
            if(categoryService.getById(uuid).getTitle().equals(category.getTitle()) || categoryService.getByTitle(category.getTitle()) == null)
                categoryService.saveOrUpdate(category);
            else
            {
                modelMap.addAttribute("error", "Title sudah ada");
                return "admin/EditCategory"; 
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/categories";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid, @ModelAttribute Category category) throws Exception {
        category.setUuid(uuid);
        categoryService.delete(category);
        return "redirect:/admin/categories";
    }
}
