/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.Product;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("productService")
@Transactional
public class ProductService extends BaseService<Product>  {

    @Override
    public  void saveOrUpdate(Object o) throws Exception
    {
        sessionFactory.getCurrentSession().saveOrUpdate(o);
    }
    
    @Override
    public void save(Object o) throws Exception
    {
        sessionFactory.getCurrentSession().save(o);
    }
    
    @Override
    public  void update(Object o) throws Exception
    {
        sessionFactory.getCurrentSession().update(o);
    }
    
    @Override
    public void delete(Object o) throws Exception
    {
        sessionFactory.getCurrentSession().delete(o);
    }

    @Override
    public List select(int start, int end, String orderby, String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long getSize(String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Transactional(readOnly=true)
    @Override
    public List<Product> getAll() {
        return (List<Product>) sessionFactory.getCurrentSession().createQuery("from Product").list();
    }

    @Transactional(readOnly=true)
    @Override
    public Product getById(String id) {
        return (Product) sessionFactory.getCurrentSession().createQuery("from Product where id = :id")
                         .setParameter("id", id).uniqueResult();
    }

    public Product getById(Long id) {
        return (Product) sessionFactory.getCurrentSession().createQuery("from Product where id = :id")
                         .setParameter("id", id).uniqueResult();
    }

}
