package com.example.databases_pr_2.Models;

public class Seller {
    private int Id;
    private String SellerName;
    private String Phone;
    private String Email;

    public Seller() {}

    public Seller(String SellerName, String Phone, String Email) {
        this.SellerName = SellerName;
        this.Phone = Phone;
        this.Email = Email;
    }

    public Seller(int Id, String SellerName, String Phone, String Email) {
        this.Id = Id;
        this.SellerName = SellerName;
        this.Phone = Phone;
        this.Email = Email;
    }

    public int getId() {
        return Id;
    }

    public String getSellerName() {
        return SellerName;
    }

    public void setSellerName(String sellerName) {
        SellerName = sellerName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }
}
