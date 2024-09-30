<%@ page import="java.util.List" %>
<%@ page import="com.example.databases_pr_2.Models.OrderView" %>
<%@ page import="com.example.databases_pr_2.WorkingDatabase" %>
<%@ page import="com.example.databases_pr_2.Models.Seller" %>
<%@ page import="com.example.databases_pr_2.Models.Buyer" %>
<%@ page import="com.example.databases_pr_2.TypeForm" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WorkingDatabase db = new WorkingDatabase();
    List<OrderView> allOrders = db.getAllOrders();
    List<Seller> sellers = db.getAllSellers();
    List<Buyer> buyers = db.getAllBuyers();
    List<OrderView> subList = null;
    String type = "";

    int counter = 1;
    String isPost = "POST";

    if (isPost.equalsIgnoreCase(request.getMethod())) {
        type = request.getParameter("formType");

        if (type.equals(TypeForm.Date.toString())) {
            String param = request.getParameter("oneDate");
            if (param != null && !param.isBlank()) {
                try {
                    SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date tmpDt = dt.parse(param);
                    subList = db.getOrdersByDate(new Date(tmpDt.getTime()));
                } catch (ParseException e) {
                    System.out.println(e.getMessage());
                }
            }
        }

        if (type.equals(TypeForm.Period.toString())) {
            String [] param = new String[] {
                    request.getParameter("startDate"),
                    request.getParameter("endDate")
            };

            if (param[0] != null && !param[0].isBlank() && param[1] != null && !param[1].isBlank()) {
                try {
                    SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date tmpDt_1 = dt.parse(param[0]);
                    java.util.Date tmpDt_2 = dt.parse(param[1]);
                    subList = db.getOrdersByDateInterval(new Date(tmpDt_1.getTime()), new Date(tmpDt_2.getTime()));
                } catch (ParseException e) {
                    System.out.println(e.getMessage());
                }
            }
        }

        if (type.equals(TypeForm.Seller.toString())) {
            String pr = request.getParameter("sellerId");

            if (pr != null && !pr.isBlank()) {
                subList = db.getOrdersBySeller(Integer.parseInt(pr));
            }
        }

        if (type.equals(TypeForm.Buyer.toString())) {
            String pr = request.getParameter("buyerId");

            if (pr != null && !pr.isBlank()) {
                subList = db.getOrdersByBuyer(Integer.parseInt(pr));
            }
        }

        request.setAttribute("subList", subList);

    }
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
                    <button class="nav-link" id="main-tab" data-bs-toggle="tab" data-bs-target="#main-tab-pane"
                            type="button" role="tab" aria-controls="main-tab-pane">All Orders
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="date-tab" data-bs-toggle="tab" data-bs-target="#date-tab-pane"
                            type="button" role="tab" aria-controls="date-tab-pane">Orders by date
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="period-tab" data-bs-toggle="tab" data-bs-target="#period-tab-pane"
                            type="button" role="tab" aria-controls="period-tab-pane">Orders by
                        period
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="seller-tab" data-bs-toggle="tab" data-bs-target="#seller-tab-pane"
                            type="button" role="tab" aria-controls="seller-tab-pane">Sellers
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="buyers-tab" data-bs-toggle="tab" data-bs-target="#buyers-tab-pane"
                            type="button" role="tab" aria-controls="buyers-tab-pane">Buyers
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade" id="main-tab-pane" role="tabpanel" aria-labelledby="main-tab-tab"
                     tabindex="0">

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
                        <%if (allOrders.isEmpty()) {%>
                        <tr>
                            <td colspan="6">
                                <div class="text-center fw-semibold">No orders</div>
                            </td>
                        </tr>
                        <%} else {%>
                        <%for (OrderView order : allOrders) {%>
                        <tr>
                            <th scope="row"><%=counter++%>
                            </th>
                            <td><%=order.getProductName()%>
                            </td>
                            <td><%=order.getSellerName()%>
                            </td>
                            <td><%=order.getBuyerName()%>
                            </td>
                            <td><%=order.getQuantity()%>
                            </td>
                            <td><%=order.getSaleDate()%>
                            </td>
                        </tr>
                        <%
                            }
                            counter = 1;
                        %>
                        <%}%>
                        </tbody>
                    </table>

                </div>
                <div class="tab-pane fade" id="date-tab-pane" role="tabpanel" aria-labelledby="date-tab" tabindex="0">
                    <div class="mb-3">
                        <form method="post" class="my-3">
                            <input type="hidden" name="formType" value="<%=TypeForm.Date.toString()%>">
                            <div class="d-flex align-items-center mb-3 px-3">
                                <div class="me-3">
                                    <label class="form-label ps-5 mb-0" for="oneDate">Select a date</label>
                                </div>
                                <div class="me-3">
                                    <input type="date" class="form-control form-control-sm" name="oneDate" id="oneDate" required>
                                </div>
                                <div class="me-3">
                                    <input type="submit" class="btn btn-sm btn-outline-success" value="Search">
                                </div>
                            </div>
                        </form>

                        <%if (type.equals(TypeForm.Date.toString())) {%>
                        <jsp:include page="sub-list-display.jsp"/>
                        <%} else {%>
                        <div class="text-center fw-semibold fs-5">No orders</div>
                        <%}%>
                    </div>

                </div>
                <div class="tab-pane fade" id="period-tab-pane" role="tabpanel" aria-labelledby="period-tab"
                     tabindex="0">
                    <form method="post" class="my-3">
                        <input type="hidden" name="formType" value="<%=TypeForm.Period.toString()%>">
                        <div class="d-flex align-items-center mb-3 px-3">
                            <div class="me-3">
                                <label class="form-label ps-5 mb-0" for="startDate">Select a period</label>
                            </div>
                            <div class="me-3">
                                <input type="date" class="form-control form-control-sm" name="startDate" id="startDate" required>
                            </div>
                            <div class="me-3">
                                <input type="date" class="form-control form-control-sm" name="endDate" id="endDate" aria-label="End date" required>
                            </div>
                            <div class="me-3">
                                <input type="submit" class="btn btn-sm btn-outline-success" value="Search">
                            </div>
                        </div>
                    </form>

                    <%if (type.equals(TypeForm.Period.toString())) {%>
                    <jsp:include page="sub-list-display.jsp"/>
                    <%} else {%>
                    <div class="text-center fw-semibold fs-5">No orders</div>
                    <%}%>

                </div>
                <div class="tab-pane fade" id="seller-tab-pane" role="tabpanel" aria-labelledby="seller-tab"
                     tabindex="0">
                    <form method="post" class="my-3">
                        <input type="hidden" name="formType" value="<%=TypeForm.Seller.toString()%>">
                        <div class="d-flex align-items-center mb-3 px-3">
                            <div class="me-3">
                                <label class="form-label ps-5 mb-0" for="sellerName">Select a period</label>
                            </div>
                            <div class="me-3">
                                <select name="sellerId" id="sellerName">
                                    <option disabled hidden="hidden" selected>Select a seller</option>
                                    <%for (Seller sl : sellers) {%>
                                    <option value="<%=sl.getId()%>"><%=sl.getSellerName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="me-3">
                                <input type="submit" class="btn btn-sm btn-outline-success" value="Search">
                            </div>
                        </div>
                    </form>

                    <%if (type.equals(TypeForm.Seller.toString())) {%>
                    <jsp:include page="sub-list-display.jsp"/>
                    <%} else {%>
                    <div class="text-center fw-semibold fs-5">No orders</div>
                    <%}%>

                </div>
                <div class="tab-pane fade" id="buyers-tab-pane" role="tabpanel" aria-labelledby="buyers-tab"
                     tabindex="0">
                    <form method="post" class="my-3">
                        <input type="hidden" name="formType" value="<%=TypeForm.Buyer.toString()%>">
                        <div class="d-flex align-items-center mb-3 px-3">
                            <div class="me-3">
                                <label class="form-label ps-5 mb-0" for="buyerName">Select a period</label>
                            </div>
                            <div class="me-3">
                                <select name="buyerId" id="buyerName">
                                    <option disabled hidden="hidden" selected>Select a buyer</option>
                                    <%for (Buyer br : buyers) {%>
                                    <option value="<%=br.getId()%>"><%=br.getBuyerName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="me-3">
                                <input type="submit" class="btn btn-sm btn-outline-success" value="Search">
                            </div>
                        </div>
                    </form>

                    <%if (type.equals(TypeForm.Buyer.toString())) {%>
                    <jsp:include page="sub-list-display.jsp"/>
                    <%} else {%>
                    <div class="text-center fw-semibold fs-5">No orders</div>
                    <%}%>

                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="d-flex align-items-center justify-content-center">
                <a href="<%=request.getContextPath()%>" class="btn btn-sm btn-outline-warning px-4">Back</a>
            </div>
        </div>
    </div>

</div>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="JS/order-panel-script.js"></script>
</body>
</html>
