package com.example.databases_pr_2.Models;

import java.sql.Date;

public class Order {
    private int Id;
    private int ProductId;
    private int SellerId;
    private int BuyerId;
    private int Quantity;
    private Date SaleDate;

    public Order() {}

    public Order(int productId, int sellerId, int buyerId, int quantity, Date saleDate) {
        ProductId = productId;
        SellerId = sellerId;
        BuyerId = buyerId;
        Quantity = quantity;
        SaleDate = saleDate;
    }

    public Order(int id, int productId, int sellerId, int buyerId, int quantity, Date saleDate) {
        Id = id;
        ProductId = productId;
        SellerId = sellerId;
        BuyerId = buyerId;
        Quantity = quantity;
        SaleDate = saleDate;
    }

    public int getId() {
        return Id;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int productId) {
        ProductId = productId;
    }

    public int getSellerId() {
        return SellerId;
    }

    public void setSellerId(int sellerId) {
        SellerId = sellerId;
    }

    public int getBuyerId() {
        return BuyerId;
    }

    public void setBuyerId(int buyerId) {
        BuyerId = buyerId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public Date getSaleDate() {
        return SaleDate;
    }

    public void setSaleDate(Date saleDate) {
        SaleDate = saleDate;
    }
}
