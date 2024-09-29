package com.example.databases_pr_2.Models;

public class Buyer {
    private int Id;
    private String BuyerName;
    private String Phone;
    private String Email;

    public Buyer() {}

    public Buyer(String BuyerName, String Phone, String Email) {
        this.BuyerName = BuyerName;
        this.Phone = Phone;
        this.Email = Email;
    }

    public Buyer(int id, String BuyerName, String Phone, String Email) {
        this.Id = id;
        this.BuyerName = BuyerName;
        this.Phone = Phone;
        this.Email = Email;
    }

    public int getId() {
        return Id;
    }

    public String getBuyerName() {
        return BuyerName;
    }

    public void setBuyerName(String buyerName) {
        BuyerName = buyerName;
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
