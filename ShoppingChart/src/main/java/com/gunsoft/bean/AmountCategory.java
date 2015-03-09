/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author gunanto
 */
public class AmountCategory implements Serializable  {
    private ItemCategory itemCategory;
    private Long count;
    private List<AmountCategory> listAmountCategory;

    public AmountCategory() {
    }

    public AmountCategory(ItemCategory itemCategory, Long count, List<AmountCategory> listAmountCategory) {
        this.itemCategory = itemCategory;
        this.count = count;
        this.listAmountCategory = listAmountCategory;
    }

    

    public List<AmountCategory> getListAmountCategory() {
        return listAmountCategory;
    }

    public void setListAmountCategory(List<AmountCategory> listAmountCategory) {
        this.listAmountCategory = listAmountCategory;
    }
    
    public ItemCategory getItemCategory() {
        return itemCategory;
    }
   
    public void setItemCategory(ItemCategory itemCategory) {
        this.itemCategory = itemCategory;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
