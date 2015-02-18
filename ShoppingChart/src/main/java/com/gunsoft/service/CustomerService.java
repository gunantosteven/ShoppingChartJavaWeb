/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.Customer;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("customerService")
@Transactional
public class CustomerService extends BaseService<Customer> {

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
    public List<Customer> getAll() {
        return (List<Customer>) sessionFactory.getCurrentSession().createQuery("from Customer").list();
    
    }

    @Transactional(readOnly=true)
    @Override
    public Customer getById(String uuid) {
        return (Customer) sessionFactory.getCurrentSession().createQuery("from Customer where uuid = :uuid")
                         .setParameter("uuid", uuid).uniqueResult();
    }
    
    @Transactional(readOnly=true)
    public Customer getByUsername(String username) {
        return (Customer) sessionFactory.getCurrentSession().createQuery("from Customer c where c.user.username = :username")
                         .setParameter("username", username).uniqueResult();
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
