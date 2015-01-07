/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

/**
 *
 * @author gunanto
 */
public enum Status {
    
    CANCELED("Canceled"), DELIVERED("Delivered"), PAYMENTERROR("Payment Error"), REFUND("Refund");
    
    private Status(String text) {
        this.text = text;
    }
    
    private String text;
    
    @Override
    public String toString()
    {
        return text;
    }
}
