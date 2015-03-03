/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Category;
import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
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
        modelMap.addAttribute("listCategories", categoryService.getAll());
        return "admin/AddCategory";
    }
    
    @RequestMapping(value ="/addcategory", method = RequestMethod.POST)
    public String addCategory(ModelMap modelMap ,@ModelAttribute Category category, HttpServletRequest request) {
        try {
            if(categoryService.getByTitle(category.getTitle()) != null)
            {
                modelMap.addAttribute("error", "Title sudah ada");
                return "admin/AddCategory"; 
            }
            else if(categoryService.getByCode(category.getCode()) != null)
            {
                modelMap.addAttribute("error", "Code sudah ada");
                return "admin/AddCategory"; 
            }    
            else
            { 
                if(request.getParameter("parentCategoryUuid") != null && !request.getParameter("parentCategoryUuid").trim().equals(""))
                {
                    Category parent = categoryService.getById(request.getParameter("parentCategoryUuid"));
                    if(parent != null)
                    {
                        category.setParentCategory(parent);
                        if(parent.getSubCategories() != null)
                        {
                            parent.getSubCategories().add(category);
                        }
                        else
                        {
                            ArrayList<Category> listCategories = new ArrayList<Category>();
                            listCategories.add(category);
                            parent.setSubCategories(listCategories);
                        }
                        categoryService.saveOrUpdate(parent);
                    }
                }
                else
                {
                    categoryService.saveOrUpdate(category);
                }
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
        modelMap.addAttribute("listCategories", categoryService.getAll());
        return "admin/EditCategory";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.POST)
    public String editCategory(@PathVariable String uuid, ModelMap modelMap, @ModelAttribute Category category, HttpServletRequest request) {
        try {
            if(categoryService.getByTitle(category.getTitle()) != null && !categoryService.getById(uuid).getTitle().equals(category.getTitle()))
            {
                modelMap.addAttribute("error", "Title sudah ada");
                return "admin/EditCategory"; 
            }
            else if(categoryService.getByCode(category.getCode()) != null && !categoryService.getById(uuid).getCode().equals(category.getCode()))  
            {
                modelMap.addAttribute("error", "Code sudah ada");
                return "admin/EditCategory"; 
            }
            else
            {
                if(request.getParameter("parentCategoryUuid") != null && !request.getParameter("parentCategoryUuid").trim().equals(""))
                {
                    Category parent = categoryService.getById(request.getParameter("parentCategoryUuid"));
                    if(parent != null)
                    {
                        category.setParentCategory(parent);
                        if(parent.getSubCategories() != null)
                        {
                            parent.getSubCategories().add(category);
                        }
                        else
                        {
                            ArrayList<Category> listCategories = new ArrayList<Category>();
                            listCategories.add(category);
                            parent.setSubCategories(listCategories);
                        }
                        categoryService.saveOrUpdate(parent);
                    }
                }
                else
                {
                    categoryService.saveOrUpdate(category);
                }    
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
