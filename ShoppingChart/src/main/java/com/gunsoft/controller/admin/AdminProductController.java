/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Category;
import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ProductService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author gunanto
 */
@Controller
@RequestMapping(value = "/admin/products")
public class AdminProductController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("productActive", "active");
        modelMap.addAttribute("listProducts", productService.getAll());
        return "admin/products";
    }
    
    @RequestMapping(value ="/addproduct", method = RequestMethod.GET)
    public String pageAdd(ModelMap modelMap) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("productActive", "active");
        modelMap.addAttribute("listCategories", categoryService.getAll());
        return "admin/AddProduct";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("productActive", "active");
        modelMap.addAttribute("product", productService.getById(uuid));
        modelMap.addAttribute("listCategories", categoryService.getAll());

        return "admin/EditProduct";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid, @ModelAttribute Product product) throws Exception {
        product.setUuid(uuid);
        productService.delete(product);
        return "redirect:/admin/products";
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String save(ModelMap modelMap, @ModelAttribute Product product,
            @RequestParam(value = "categoryUuid", required = false) String categoryUuid
            , @RequestParam(value = "img", required = false) MultipartFile img) {
        try {
            if(img.getBytes().length > 1)
                product.setImage(img.getBytes());
            else if(product.getUuid() != null)
                product.setImage(productService.getById(product.getUuid()).getImage());
            else
                product.setImage(img.getBytes());
            Category category = categoryService.getById(categoryUuid);
            product.setCategory(category);
            
            productService.saveOrUpdate(product);
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/products";
    }
}
