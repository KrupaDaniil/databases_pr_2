package com.example.databases_pr_2.Servlets;

import com.example.databases_pr_2.Models.Product;
import com.example.databases_pr_2.WorkingDatabase;
import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private final WorkingDatabase database;
    private Product product;

    public ProductServlet() {
        database = new WorkingDatabase();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        product = new Product();
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");

        if (productName != null && !productName.isBlank()) {
            product.setProductName(productName);
        }

        if (productPrice != null && !productPrice.isBlank()) {
            product.setPrice(Double.parseDouble(productPrice));
        }
        else {
            product.setPrice(0.00);
        }

        database.addProduct(product);

        try {
            response.sendRedirect(request.getContextPath() + "/add-product.jsp");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void doPut(HttpServletRequest request, HttpServletResponse response) {
        product = new Product();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder bl = new StringBuilder();
        String str;

        try (BufferedReader rd = request.getReader()) {
            while ((str = rd.readLine()) != null) {
                bl.append(str);
            }

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        if (!bl.toString().isBlank()) {
            Gson gson = new Gson();
            product = gson.fromJson(bl.toString(), Product.class);
            database.editProduct(product);
        }

        try {

            response.getWriter().write("{\"path\":\""+ request.getContextPath() +"\"}");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response) {
        String Id = request.getParameter("id");

        if (Id != null && !Id.isBlank()) {
            database.deleteProduct(Integer.parseInt(Id));
            response.setStatus(HttpServletResponse.SC_OK);
        }
        else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }

    }
}
