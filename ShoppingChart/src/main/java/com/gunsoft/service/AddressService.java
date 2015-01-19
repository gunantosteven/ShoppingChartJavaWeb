/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.Address;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("addressService")
@Transactional
public class AddressService extends BaseService<Address> {

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
    public List<Address> getAll() {
        return (List<Address>) sessionFactory.getCurrentSession().createQuery("from Address").list();
    }

    @Transactional(readOnly=true)
    @Override
    public Address getById(String id) {
        return (Address) sessionFactory.getCurrentSession().createQuery("from Address where id = :id")
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
