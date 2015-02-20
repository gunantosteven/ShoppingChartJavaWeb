/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author gunanto
 */
@Entity
@Table(name="T_ORDER")
public class Order implements Serializable  {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "uuid", unique = true)
    private String uuid;
    private BigDecimal amount;
    @Enumerated(EnumType.STRING)
    private Status status;
    private Date date;
    private String bank;
    private String noRekening;
    private String namaRekening;
    @OneToMany(mappedBy="order")
    @Cascade(value=org.hibernate.annotations.CascadeType.ALL)
    private List<OrderDetail> listOrderDetail;
    @OneToOne(mappedBy="order")
    @Cascade(value=org.hibernate.annotations.CascadeType.ALL)
    private AddressOrder addressOrder;
    @ManyToOne
    @JoinColumn(name="CUSTOMER_ID")
    private Customer customer;

    public Order() {
    }

    public Order(String uuid, BigDecimal amount, Status status, Date date, String bank, String noRekening, String namaRekening, List<OrderDetail> listOrderDetail, AddressOrder addressOrder, Customer customer) {
        this.uuid = uuid;
        this.amount = amount;
        this.status = status;
        this.date = date;
        this.bank = bank;
        this.noRekening = noRekening;
        this.namaRekening = namaRekening;
        this.listOrderDetail = listOrderDetail;
        this.addressOrder = addressOrder;
        this.customer = customer;
    }

    public AddressOrder getAddressOrder() {
        return addressOrder;
    }

    public void setAddressOrder(AddressOrder addressOrder) {
        this.addressOrder = addressOrder;
    }
    
    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
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
    
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getNamaRekening() {
        return namaRekening;
    }

    public void setNamaRekening(String namaRekening) {
        this.namaRekening = namaRekening;
    }

    public String getNoRekening() {
        return noRekening;
    }

    public void setNoRekening(String noRekening) {
        this.noRekening = noRekening;
    }
}
