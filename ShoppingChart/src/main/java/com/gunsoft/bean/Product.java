/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;

/**
 *
 * @author gunanto
 */
@Entity
@Indexed
@Table(name="T_PRODUCT")
public class Product implements java.io.Serializable {
    
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "uuid", unique = true)
    private String uuid;
    
    @Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
    private String title;
    
    private String description;
    
    private String descriptionFull;
    
    @Column(unique = true)
    private String code;
    
    private Long price;
    
    @IndexedEmbedded
    @ManyToOne
    @JoinColumn(name="CATEGORY_ID")
    private Category category;
    
    @Column(columnDefinition = "LONGBLOB")
    private byte[] image;
    
    @Column(updatable = false)
    private Date createDate;

    public Product() {
    }

    public Product(String uuid, String title, String description, String descriptionFull, String code, Long price, Category category, byte[] image) {
        this.uuid = uuid;
        this.title = title;
        this.description = description;
        this.descriptionFull = descriptionFull;
        this.code = code;
        this.price = price;
        this.category = category;
        this.image = image;
    }

    public String getEncodedImageString() {
        byte[] encoded=org.apache.commons.codec.binary.Base64
            .encodeBase64(image);
        String encodedImageString = new String(encoded);
        return encodedImageString;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescriptionFull() {
        return descriptionFull;
    }

    public void setDescriptionFull(String descriptionFull) {
        this.descriptionFull = descriptionFull;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public String getRupiahFormat() {
            String nominal = String.valueOf(price);
	    String rupiah = "";
	 
	    if (nominal.length() == 0) {
	        rupiah = "0,00";
	    } else {
	        if (nominal.length() > 3) {
	            int length = nominal.length();
	               
	            for (int i = length; i > 0; i -= 3) {
	                if (i > 3) {
	                    nominal = nominal.substring(0, i - 3) + "." + 
	                    nominal.substring(i - 3);
	                    rupiah = nominal;
	                }
	            }
	        } else {
	            rupiah = nominal;
	        }
	    }
	         
	    return "Rp." + rupiah;
	}
}
