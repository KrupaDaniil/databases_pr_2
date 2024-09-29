package com.example.databases_pr_2.Servlets;

import com.example.databases_pr_2.Models.Order;
import com.example.databases_pr_2.WorkingDatabase;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "orderServlet", value = "/order-servlet")
public class OrderServlet extends HttpServlet {
    private WorkingDatabase db;

    @Override
    public void init() {
        db = new WorkingDatabase();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        Order order = new Order();
        String[] param = new String[] {
                request.getParameter("productId"),
                request.getParameter("sellerId"),
                request.getParameter("buyerId"),
                request.getParameter("quantity"),
                request.getParameter("curDate"),
        };

        for (int i = 0; i < param.length; i++) {
            if (param[i] != null && !param[i].isBlank()) {
                if (i < param.length - 1) {
                   switch (i) {
                       case 0: {
                           order.setProductId(Integer.parseInt(param[i]));
                           break;
                       }
                       case 1: {
                           order.setSellerId(Integer.parseInt(param[i]));
                           break;
                       }
                       case 2: {
                           order.setBuyerId(Integer.parseInt(param[i]));
                           break;
                       }
                       case 3: {
                           order.setQuantity(Integer.parseInt(param[i]));
                           break;
                       }
                       default: {
                           break;
                       }
                   }
                }
                else {
                    order.setSaleDate(Date.valueOf(param[i]));
                }
            }
        }

        db.addOrder(order);

        try {
            response.sendRedirect(request.getContextPath());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }
}
