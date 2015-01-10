/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author gunanto
 */
@Entity
@Table(name="T_ORDER")
public class Order {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "uuid", unique = true)
    private String uuid;
    private String shippingAddress;
    private String billingAddress;
    private int amount;
    @Enumerated(EnumType.STRING)
    private Status status;
    private Date date;
    @OneToMany(mappedBy="order",cascade=CascadeType.ALL)
    @Cascade(org.hibernate.annotations.CascadeType.DELETE)
    private List<OrderDetail> listOrderDetail;

    public Order() {
    }

    public Order(String uuid, String shippingAddress, String billingAddress, int amount, Status status, Date date, List<OrderDetail> listOrderDetail) {
        this.uuid = uuid;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
        this.amount = amount;
        this.status = status;
        this.date = date;
        this.listOrderDetail = listOrderDetail;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<OrderDetail> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(List<OrderDetail> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}