/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.AmountCategory;
import com.gunsoft.bean.Category;
import java.util.List;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("categoryService")
@Transactional
public class CategoryService extends BaseService<Category> {

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

    @Transactional(readOnly=true)
    @Override
    public List<Category> getAll() {
        return (List<Category>) sessionFactory.getCurrentSession().createQuery("from Category").list();
    }
    
    public List<AmountCategory> getCategoryCount(int limit) {
        return (List<AmountCategory>) sessionFactory.getCurrentSession().createQuery("select c.title as title, COUNT(c.title) as count from Product p join p.category c group by c.title")
                .setMaxResults(limit)
                .setResultTransformer(
                        Transformers.aliasToBean(AmountCategory.class))
                .list();
    }

    @Transactional(readOnly=true)
    @Override
    public Category getById(String id) {
        return (Category) sessionFactory.getCurrentSession().createQuery("from Category where id = :id")
                         .setParameter("id", id).uniqueResult();
    }

    @Override
    public List select(int start, int end, String orderby, String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long getSize(String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    

}
