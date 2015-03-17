/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gunsoft.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author gunanto
 */
@Entity
@Table(name="T_SUPPLIER")
public class Supplier {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "uuid", unique = true)
    private String uuid;
    @Column(unique = true)
    private String kodeSupplier;
    private String namaSupplier;
    private String alamatSupplier;
    private String teleponSupplier;
    private String pinBb;

    public Supplier() {
    }

    public Supplier(String uuid, String kodeSupplier, String namaSupplier, String alamatSupplier, String teleponSupplier, String pinBb) {
        this.uuid = uuid;
        this.kodeSupplier = kodeSupplier;
        this.namaSupplier = namaSupplier;
        this.alamatSupplier = alamatSupplier;
        this.teleponSupplier = teleponSupplier;
        this.pinBb = pinBb;
    }

    public String getAlamatSupplier() {
        return alamatSupplier;
    }

    public void setAlamatSupplier(String alamatSupplier) {
        this.alamatSupplier = alamatSupplier;
    }

    public String getKodeSupplier() {
        return kodeSupplier;
    }

    public void setKodeSupplier(String kodeSupplier) {
        this.kodeSupplier = kodeSupplier;
    }

    public String getNamaSupplier() {
        return namaSupplier;
    }

    public void setNamaSupplier(String namaSupplier) {
        this.namaSupplier = namaSupplier;
    }

    public String getPinBb() {
        return pinBb;
    }

    public void setPinBb(String pinBb) {
        this.pinBb = pinBb;
    }

    public String getTeleponSupplier() {
        return teleponSupplier;
    }

    public void setTeleponSupplier(String teleponSupplier) {
        this.teleponSupplier = teleponSupplier;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
