/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.AmountCategory;
import com.gunsoft.bean.Category;
import com.gunsoft.bean.ItemCategory;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("itemCategoryService")
@Transactional
public class ItemCategoryService extends BaseService<ItemCategory> {

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
    
    public int deleteByProductUuid(String uuid)
    {
        return sessionFactory.getCurrentSession().createQuery("delete from ItemCategory i where i.product.uuid = :uuid")
                .setParameter("uuid", uuid).executeUpdate();
    }

    @Transactional(readOnly=true)
    @Override
    public List<ItemCategory> getAll() {
        return (List<ItemCategory>) sessionFactory.getCurrentSession().createQuery("from ItemCategory").list();
    }
    
    @Transactional(readOnly=true)
    public List<AmountCategory> getAllAmountParentCategory() {
        List<AmountCategory> list =  (List<AmountCategory>) sessionFactory.getCurrentSession().createQuery("select i as itemCategory, COUNT(i.category.title) as count from ItemCategory i where i.category.parentCategory is null group by i.category.title")
                .setResultTransformer(
                        Transformers.aliasToBean(AmountCategory.class))
                .list();
        for(AmountCategory a : list)
        {
            a.setListAmountCategory((List<AmountCategory>) sessionFactory.getCurrentSession().createQuery("select i as itemCategory, COUNT(i.category.title) as count from ItemCategory i where i.category.parentCategory.uuid = :parentCategoryUuid group by i.category.title")
                 .setParameter("parentCategoryUuid", a.getItemCategory().getCategory().getUuid())
                 .setResultTransformer(
                        Transformers.aliasToBean(AmountCategory.class))
                .list());
        }
        return list;
    }
    
    @Transactional(readOnly=true)
    public List<AmountCategory> getAllAmountNonChildCategory()
    {
        return  (List<AmountCategory>) sessionFactory.getCurrentSession().
                createQuery("select i as itemCategory, COUNT(i.category.title) as count from ItemCategory i where i.category.parentCategory is null group by i.category.title")
                .setResultTransformer(
                        Transformers.aliasToBean(AmountCategory.class))
                .list();
    }
    
    @Transactional(readOnly = true)
    public List<ItemCategory> getAllByCategory(Integer limit, Category category, Integer page)
    {
        return (List<ItemCategory>) sessionFactory.getCurrentSession().createQuery("from ItemCategory i where i.category = :category")
                .setParameter("category", category)
                .setFirstResult(limit * page - limit)
                .setMaxResults(limit).list();
    }
    
    public AmountCategory getAmountByCategory(Category category)
    {
        return  (AmountCategory) sessionFactory.getCurrentSession().
                createQuery("select i as itemCategory, COUNT(i.category.title) as count from ItemCategory i where i.category = :category group by i.category.title")
                .setParameter("category", category)
                .setResultTransformer(
                        Transformers.aliasToBean(AmountCategory.class))
                .uniqueResult();
    }
    
    @Transactional(readOnly=true)
    public List<ItemCategory> getAllByProductId(String productId) {
        return (List<ItemCategory>) sessionFactory.getCurrentSession().createQuery("from ItemCategory i where i.product.uuid = :id")
                         .setParameter("id", productId).list();
    }

    @Transactional(readOnly=true)
    @Override
    public ItemCategory getById(String id) {
        return (ItemCategory) sessionFactory.getCurrentSession().createQuery("from ItemCategory where id = :id")
                         .setParameter("id", id).uniqueResult();
    }

    @Override
    public List<String[]> select(int start, int end, String orderby, String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long getSize(String search) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
