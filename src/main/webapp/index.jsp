<%@ page import="com.example.databases_pr_2.Models.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.databases_pr_2.WorkingDatabase" %>
<%@ page import="com.example.databases_pr_2.Models.Seller" %>
<%@ page import="com.example.databases_pr_2.Models.Buyer" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.stream.Stream" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    WorkingDatabase db = new WorkingDatabase();
    List<Product> products = db.getAllProducts();
    List<Seller> sellers = db.getAllSellers();
    List<Buyer> buyers = db.getAllBuyers();
    int qt = new Random().nextInt(10);
    int randomIndex = new Random().nextInt(buyers.size() - 1);
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Index</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <div class="card p-3 w-100 my-3">

        <div class="d-flex align-items-center justify-content-end px-4 mb-3">
            <a href="add-product.jsp" class="btn btn-sm btn-outline-success px-3 me-3">Add product</a>
            <a href="order-panel.jsp" class="btn btn-sm btn-outline-success px-3">Order panel</a>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Product name</th>
                <th scope="col">Seller</th>
                <th scope="col">Price</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                int count = 1;
                for (Product product : products) {
            %>
            <tr>
                <th scope="col"><%=count%></th>
                <td><%=product.getProductName()%></td>
                <td><%=db.getSellerName(product.getSellerId())%></td>
                <td><%=product.getPrice()%></td>
                <td>
                    <div class="d-flex align-items-center justify-content-center">
                        <a href="update-product.jsp?id=<%=product.getId()%>" class="btn btn-sm btn-outline-success me-2 my-2">Update</a>
                        <form action="product-servlet?id=<%=product.getId()%>" id="dlForm">
                            <input type="submit" class="btn btn-sm btn-outline-danger me-2 my-2" value="Delete">
                        </form>
                        <form method="post" action="order-servlet">
                            <input type="hidden" name="productId" value="<%=product.getId()%>">
                            <input type="hidden" name="sellerId" value="<%=product.getSellerId()%>">
                            <input type="hidden" name="buyerId"
                                   value="<%=buyers.stream().map(Buyer::getId)
                                   .filter(r -> r == (randomIndex == 0 ? 1 : randomIndex)).findFirst().orElse(-1)%>">
                            <input type="hidden" name="quantity" value="<%=qt == 0 ? 1 : qt%>">
                            <input type="hidden" name="curDate" value="<%=LocalDate.now()%>">
                            <input type="submit" class="btn btn-sm btn-outline-primary me-2 my-2 px-3" onclick="window.location.reload()" value="Buy">
                        </form>
                    </div>

                </td>
            </tr>
            <%
                    count++;
                }
            %>
            </tbody>

        </table>
    </div>

</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="JS/productDelete.js"></script>
</body>
</html>