/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.Order;
import com.gunsoft.bean.Status;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("orderService")
@Transactional
public class OrderService extends BaseService<Order> {

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
    
    public void updateStatus(String uuid, String status) throws Exception
    {
        sessionFactory.getCurrentSession().createQuery("update Order o set o.status = :status where o.uuid = :uuid")
                .setParameter("uuid", uuid)
                .setParameter("status", Status.valueOf(status))
                .executeUpdate();
    }

    @Transactional(readOnly=true)
    @Override
    public List<Order> getAll() {
        return (List<Order>) sessionFactory.getCurrentSession().createQuery("from Order").list();
    }

    @Transactional(readOnly=true)
    @Override
    public Order getById(String id) {
        return (Order) sessionFactory.getCurrentSession().createQuery("from Order where id = :id")
                         .setParameter("id", id).uniqueResult();
    }
    
    @Transactional(readOnly=true)
    public List<Order> getByCustomerUsername(String username) {
        return (List<Order>) sessionFactory.getCurrentSession().createQuery("from Order o where o.customer.user.username  = :username ")
                         .setParameter("username", username).list();
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
