/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author gunanto
 */
@Entity
@Table(name="T_ADDRESS_ORDER")
public class AddressOrder implements Serializable  {
    @Id
    @Column(name="id", unique=true, nullable=false)
    @GeneratedValue(generator="gen")
    @GenericGenerator(name="gen", strategy="foreign", parameters={@Parameter(name="property", value="order")})
    private long id;
    private String namaPenerima;
    private String shippingAddress;
    private String billingAddress;
    private String city;
    private String country;
    private String kodePos;
    private String additionalInformation;
    private String homephone;
    private String mobilephone;
    @OneToOne
    @PrimaryKeyJoinColumn
    private Order order;

    public AddressOrder() {
    }

    public AddressOrder(long id, String namaPenerima, String shippingAddress, String billingAddress, String city, String country, String kodePos, String additionalInformation, String homephone, String mobilephone, Order order) {
        this.id = id;
        this.namaPenerima = namaPenerima;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
        this.city = city;
        this.country = country;
        this.kodePos = kodePos;
        this.additionalInformation = additionalInformation;
        this.homephone = homephone;
        this.mobilephone = mobilephone;
        this.order = order;
    }

    public String getAdditionalInformation() {
        return additionalInformation;
    }

    public void setAdditionalInformation(String additionalInformation) {
        this.additionalInformation = additionalInformation;
    }

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNamaPenerima() {
        return namaPenerima;
    }

    public void setNamaPenerima(String namaPenerima) {
        this.namaPenerima = namaPenerima;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getKodePos() {
        return kodePos;
    }

    public void setKodePos(String kodePos) {
        this.kodePos = kodePos;
    }
}
