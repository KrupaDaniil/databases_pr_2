<%@ page import="java.util.List" %>
<%@ page import="com.example.databases_pr_2.Models.OrderView" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Object obj = request.getAttribute("subList");
  List<OrderView> sb = ((List<?>)obj).stream().filter(r -> r instanceof OrderView).map(r -> (OrderView)r).toList();
  int counter = 1;
%>

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
  <%if (sb.isEmpty()) {%>
  <tr>
    <td colspan="6">
      <div class="text-center fw-semibold">No orders</div>
    </td>
  </tr>
  <%} else {%>
  <%for (OrderView order : sb) {%>
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