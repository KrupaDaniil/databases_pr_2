<%@ page import="com.example.databases_pr_2.WorkingDatabase" %>
<%@ page import="com.example.databases_pr_2.Models.Product" %>
<%@ page import="com.example.databases_pr_2.Models.Seller" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String Id = request.getParameter("id");
    Product pr = null;
    List<Seller> sellers = null;

    if (Id != null && !Id.isBlank()) {
        WorkingDatabase db = new WorkingDatabase();
        pr = db.getProduct(Integer.parseInt(Id));
        sellers = db.getAllSellers();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product update</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="JS/productUpdate.js"></script>
</head>
<body>
<div class="container">
    <%if (pr != null) {%>
    <div class="card w-75">
        <div class="card-header">
            <div class="text-center fw-semibold fs-5">Product update</div>
        </div>
        <div class="card-body">
            <form name="update_product">
                <input type="hidden" name="id" value="<%=pr.getId()%>">
                <input type="text" name="product_name" value="<%=pr.getProductName()%>" class="form-control"
                       placeholder="Enter product name" aria-label="Enter product name">
                <input type="number" name="product_price" value="<%=pr.getPrice()%>" class="form-control"
                       placeholder="Enter product price" aria-label="Enter product price">
                <select name="seller_id" class="form-select" aria-label="Seller">
                    <option disabled hidden="hidden">Seller</option>
                    <%if (sellers != null && !sellers.isEmpty()) {%>
                        <%for (Seller seller : sellers) { %>

                            <%if (seller.getId() == Integer.parseInt(Id)) {%>
                                <option value="<%=seller.getId()%>" selected><%=seller.getSellerName()%></option>
                            <%} else {%>
                                <option value="<%=seller.getId()%>"><%=seller.getSellerName()%></option>
                            <%}%>

                        <%}%>
                    <%}%>
                </select>

                <div class="card-footer">
                    <div class="d-flex align-items-center justify-content-center">
                        <input type="submit" class="btn btn-success px-4" value="Save">
                    </div>
                </div>
            </form>
        </div>

    </div>
    <%}%>

</div>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
