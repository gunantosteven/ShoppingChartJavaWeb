/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.controller.admin;

import com.gunsoft.bean.Category;
import com.gunsoft.bean.ItemCategory;
import com.gunsoft.bean.Product;
import com.gunsoft.service.CategoryService;
import com.gunsoft.service.ItemCategoryService;
import com.gunsoft.service.ProductService;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
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
    
    @Autowired
    private ItemCategoryService itemCategoryService;
    
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
        modelMap.addAttribute("listCategories", categoryService.getAllParent());
        return "admin/AddProduct";
    }
    
    @RequestMapping(value ="/addproduct", method = RequestMethod.POST)
    public String addProduct(ModelMap modelMap, @ModelAttribute Product product,
            @RequestParam(value = "categoryUuid", required = false) String categoryUuid
            , @RequestParam(value = "img", required = false) MultipartFile img
            , HttpServletRequest request) {
        try {
            if(productService.getByCode(product.getCode()) == null)
            { 
                product.setImage(img.getBytes());
                product.setCreateDate(new Date());
                
                productService.saveOrUpdate(product);
                
                if(request.getParameter("categories") != null && !request.getParameter("categories").trim().equals(""))
                {
                    String[] categoriesUuid = request.getParameter("categories").split(",");
                    
                    for(int i = 0; categoriesUuid.length > i; i++)
                    {
                        ItemCategory itemCategory = new ItemCategory();
                        itemCategory.setCategory(categoryService.getById(categoriesUuid[i]));
                        itemCategory.setProduct(product);  
                        
                        itemCategoryService.save(itemCategory);
                    }
                    
                    return "redirect:/admin/products";
                }
                
            }
            else
            {
                modelMap.addAttribute("error", "Code sudah ada");
                return "admin/AddProduct"; 
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/products";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.GET)
    public String pageEdit(ModelMap modelMap, @PathVariable String uuid) {
        modelMap.addAttribute("masterActive", "active");
        modelMap.addAttribute("productActive", "active");
        modelMap.addAttribute("product", productService.getById(uuid));
        modelMap.addAttribute("itemCategories", itemCategoryService.getAllByProductId(uuid));
        modelMap.addAttribute("listCategories", categoryService.getAllParent());
        return "admin/EditProduct";
    }
    
    @RequestMapping(value ="/detail/{uuid}", method = RequestMethod.POST)
    public String editProduct(ModelMap modelMap, @ModelAttribute Product product,
            @RequestParam(value = "categoryUuid", required = false) String categoryUuid
            , @RequestParam(value = "img", required = false) MultipartFile img, @PathVariable String uuid
            , HttpServletRequest request) {
            
            try 
            {
                if(productService.getById(uuid).getCode().equals(product.getCode()) || productService.getByCode(product.getCode()) == null)
                {
                    if(img.getBytes().length > 1)
                        product.setImage(img.getBytes());
                    else if(product.getUuid() != null)
                        product.setImage(productService.getById(product.getUuid()).getImage());
                    else
                        product.setImage(img.getBytes());

                    Category category = categoryService.getById(categoryUuid);
                    product.setCategory(category);

                    product.setCreateDate(new Date());

                    productService.saveOrUpdate(product); // Update Product

                    itemCategoryService.deleteByProductUuid(uuid); // Delete ItemCategory
                    if(request.getParameter("categories") != null && !request.getParameter("categories").trim().equals(""))
                    {
                        String[] categoriesUuid = request.getParameter("categories").split(",");

                        for(int i = 0; categoriesUuid.length > i; i++)
                        {
                            ItemCategory itemCategory = new ItemCategory();
                            itemCategory.setCategory(categoryService.getById(categoriesUuid[i]));
                            itemCategory.setProduct(product);  
                            // Update Item Category
                            itemCategoryService.save(itemCategory);
                        }

                        return "redirect:/admin/products";
                    }


                }
                else
                {
                    modelMap.addAttribute("error", "Code sudah ada");
                    return "admin/EditProduct"; 
                }
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/products";
    }
    
    @RequestMapping(value ="/delete/{uuid}", method = RequestMethod.GET)
    public String delete(@PathVariable String uuid, @ModelAttribute Product product) throws Exception {
        product.setUuid(uuid);
        productService.delete(product);
        return "redirect:/admin/products";
    }
}
