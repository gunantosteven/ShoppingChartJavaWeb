package com.gunsoft.service;

import java.lang.reflect.ParameterizedType;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 *  ini class yang akan digunakan sebagai base class atau class induk yang akan di-extends oleh class lain dibawah 
 *  package service
 * 
 * @author edwin < edwinkun at gmail dot com >
 */
public abstract class BaseService<T> {
    
    @Autowired
    protected SessionFactory sessionFactory;
    
    public abstract  void saveOrUpdate(Object o) throws Exception;
    
    public abstract void save(Object o) throws Exception;
    
    public abstract void update(Object o) throws Exception;
    
    public abstract void delete(Object o) throws Exception;
    
    public abstract List<T> getAll(); 
    

    public abstract T getById(String id);
    
    public abstract List<String[]> select(int start, int end, String orderby, String search);
    public abstract long getSize(String search);
}
