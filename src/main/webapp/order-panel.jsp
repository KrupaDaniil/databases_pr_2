<%@ page import="java.util.List" %>
<%@ page import="com.example.databases_pr_2.Models.OrderView" %>
<%@ page import="com.example.databases_pr_2.WorkingDatabase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WorkingDatabase db = new WorkingDatabase();
    List<OrderView> allOrders = db.getAllOrders();
    int counter = 1;
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order panel</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="card my-3">
        <div class="card-header">
            <div class="fw-semibold text-center fs-5 bg-body">Order information</div>
        </div>
        <div class="card-body">
            <ul class="nav nav-tabs justify-content-center" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="main-tab" data-bs-toggle="tab" data-bs-target="#main-tab-pane"
                            type="button" role="tab" aria-controls="main-tab-pane" aria-selected="true">All Orders</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                            type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false" disabled>Disabled</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="main-tab-pane" role="tabpanel" aria-labelledby="main-tab-tab" tabindex="0">

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Product</th>
                            <th scope="col">Seller</th>
                            <th scope="col">Buyer</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Sale date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(OrderView order : allOrders) {%>
                        <tr>
                            <th scope="row"><%=counter++%></th>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>

                </div>
                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
                <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
            </div>
        </div>
    </div>

</div>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
