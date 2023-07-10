
package com.AradhanaMilkAndBekary.Entities;

public class Product {
    int id;
    String name;
    float buyPrice;
    float salePrice;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(float buyPrice) {
        this.buyPrice = buyPrice;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getpDis() {
        return pDis;
    }

    public void setpDis(String pDis) {
        this.pDis = pDis;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product(String name, float buyPrice, float salePrice, String pDis, int quantity) {
        this.name = name;
        this.buyPrice = buyPrice;
        this.salePrice = salePrice;
        this.pDis = pDis;
        this.quantity = quantity;
    }

    public Product(int id, String name, float buyPrice, float salePrice, String pDis, int quantity) {
        this.id = id;
        this.name = name;
        this.buyPrice = buyPrice;
        this.salePrice = salePrice;
        this.pDis = pDis;
        this.quantity = quantity;
    }

    public Product() {
    }
    String pDis;
    int quantity;
    
    

}