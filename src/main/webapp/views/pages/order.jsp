<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="orderBean" type="com.posh.dtos.orderdtos.OrdersBean"
        scope="request" />
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>Order</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderBean.orders}">
                    <tr id = "div${order.orderId}">
                        <td>${order.orderId}</td>
                        <td>${order.orderDate}</td>
                        <td>
                            <c:if test="${order.status eq 0}">
                                <span class="success">Canceled</span>
                            </c:if>

                            <c:if test="${order.status eq 1}">
                                <span class="success">In Progress</span>
                            </c:if>
                            <c:if test="${order.status eq 2}">
                                <span class="success">Complete</span>
                            </c:if>
                        </td>
                        <td>${order.totalPrice}$</td>
                        <c:if test="${order.status eq 1}">
                        <td><button class="link-color view" onclick = "updateOrderStatus(`${order.orderId}`, 0);">Cancel</button></td>
                        </c:if>
                        <c:if test="${order.status eq 2}">
                        <td><label class="link-color view">review</button></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>