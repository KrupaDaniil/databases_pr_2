package com.example.databases_pr_2.Models;

import java.util.Date;

public class OrderView {
    private int Id;
    private String ProductName;
    private String SellerName;
    private String BuyerName;
    private int Quantity;
    private Date SaleDate;

    public OrderView() {}

    public OrderView(String productName, String sellerName, String buyerName, int quantity, Date saleDate) {
        ProductName = productName;
        SellerName = sellerName;
        BuyerName = buyerName;
        Quantity = quantity;
        SaleDate = saleDate;
    }

    public OrderView(int id, String productName, String sellerName, String buyerName, int quantity, Date saleDate) {
        Id = id;
        ProductName = productName;
        SellerName = sellerName;
        BuyerName = buyerName;
        Quantity = quantity;
        SaleDate = saleDate;
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

    public String getSellerName() {
        return SellerName;
    }

    public void setSellerName(String sellerName) {
        SellerName = sellerName;
    }

    public String getBuyerName() {
        return BuyerName;
    }

    public void setBuyerName(String buyerName) {
        BuyerName = buyerName;
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
