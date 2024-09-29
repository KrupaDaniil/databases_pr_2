package com.example.databases_pr_2.Models;

public class Product {
    private int Id;
    private String ProductName;
    private double Price;
    private int SellerId;

    public Product() {}

    public Product(String ProductName, double Price) {
        this.ProductName = ProductName;
        this.Price = Price;
    }

    public Product(int id, String ProductName, double Price, int SellerId) {
        this.Id = id;
        this.ProductName = ProductName;
        this.Price = Price;
        this.SellerId = SellerId;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getSellerId() {
        return SellerId;
    }

    public void setSellerId(int sellerId) {
        SellerId = sellerId;
    }
}
