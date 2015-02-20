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
    @GenericGenerator(name = "generator", strategy = "foreign", 
    parameters = @Parameter(name = "property", value = "order"))
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "ORDER_ID", unique = true, nullable = false)
    private String uuid;
    private String namaPenerima;
    private String alamatPenagihan;
    private String alamatPengiriman;
    private String kota;
    private String negara;
    private String kodePos;
    private String telepon;
    private String additionalInformation;
    @OneToOne
    @PrimaryKeyJoinColumn
    private Order order;

    public AddressOrder() {
    }

    public AddressOrder(String uuid, String namaPenerima, String alamatPenagihan, String alamatPengiriman, String kota, String negara, String kodePos, String telepon, String additionalInformation, Order order) {
        this.uuid = uuid;
        this.namaPenerima = namaPenerima;
        this.alamatPenagihan = alamatPenagihan;
        this.alamatPengiriman = alamatPengiriman;
        this.kota = kota;
        this.negara = negara;
        this.kodePos = kodePos;
        this.telepon = telepon;
        this.additionalInformation = additionalInformation;
        this.order = order;
    }

    public String getAlamatPenagihan() {
        return alamatPenagihan;
    }

    public void setAlamatPenagihan(String alamatPenagihan) {
        this.alamatPenagihan = alamatPenagihan;
    }

    public String getAlamatPengiriman() {
        return alamatPengiriman;
    }

    public void setAlamatPengiriman(String alamatPengiriman) {
        this.alamatPengiriman = alamatPengiriman;
    }

    public String getAdditionalInformation() {
        return additionalInformation;
    }

    public void setAdditionalInformation(String additionalInformation) {
        this.additionalInformation = additionalInformation;
    }

    public String getKodePos() {
        return kodePos;
    }

    public void setKodePos(String kodePos) {
        this.kodePos = kodePos;
    }

    public String getKota() {
        return kota;
    }

    public void setKota(String kota) {
        this.kota = kota;
    }

    public String getNamaPenerima() {
        return namaPenerima;
    }

    public void setNamaPenerima(String namaPenerima) {
        this.namaPenerima = namaPenerima;
    }

    public String getNegara() {
        return negara;
    }

    public void setNegara(String negara) {
        this.negara = negara;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getTelepon() {
        return telepon;
    }

    public void setTelepon(String telepon) {
        this.telepon = telepon;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
