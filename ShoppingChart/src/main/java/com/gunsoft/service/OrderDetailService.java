/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.OrderDetail;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("orderDetailService")
@Transactional
public class OrderDetailService extends BaseService<OrderDetail> {

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
    public List<OrderDetail> getAll() {
        return (List<OrderDetail>) sessionFactory.getCurrentSession().createQuery("from OrderDetail").list();
    }

    @Transactional(readOnly=true)
    @Override
    public OrderDetail getById(String id) {
        return (OrderDetail) sessionFactory.getCurrentSession().createQuery("from OrderDetail where id = :id")
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
