/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.service;

import com.gunsoft.bean.Supplier;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gunanto
 */
@Service("supplierService")
@Transactional
public class SupplierService extends BaseService<Supplier> {
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
    public List<Supplier> getAll() {
        return (List<Supplier>) sessionFactory.getCurrentSession().createQuery("from Supplier").list();
    
    }

    @Transactional(readOnly=true)
    @Override
    public Supplier getById(String uuid) {
        return (Supplier) sessionFactory.getCurrentSession().createQuery("from Supplier where uuid = :uuid")
                         .setParameter("uuid", uuid).uniqueResult();
    }
    
    @Transactional(readOnly=true)
    public Supplier getByKode(String kodeSupplier) {
        return (Supplier) sessionFactory.getCurrentSession().createQuery("from Supplier s where s.kodeSupplier = :kodeSupplier")
                         .setParameter("kodeSupplier", kodeSupplier).uniqueResult();
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
