<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Danh sách đơn cần tư vấn</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap JS và Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

        <!-- Google font-->
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
              rel="stylesheet">
        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">
        <!-- fontawesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">
        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">
        <!-- ratio css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/ratio.css">
        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/vendors/slick.css">
        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>
    <body>
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>

        <%@ include file="/sale/sale_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container mt-4">
                        <div class="card shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Danh sách đơn hàng</h3>
                            </div>
                            <!-- Button positioned below the table, without overlapping -->
                            <div class="d-flex justify-content-end mt-3">
                                <a href="my-sale-orders" class="btn btn-primary">Đơn hàng của tôi</a>
                            </div><br>
                            <!-- Your table content -->
                            <table class="table table-striped table-bordered">
                                <thead class="table-light">
                                    <tr class="small fw-light">
                                        <th class="small text-center" style="font-size: 12px;">Mã</th>
                                        <th class="small " style="font-size: 12px;">Ngày tạo</th>
                                        <th class="small " style="font-size: 12px;">Khách hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Trạng thái đơn hàng</th>
                                        <th class="small text-center" style="font-size: 12px;">Thanh toán</th>
                                        <th class="small text-center" style="font-size: 12px;">Tổng tiền</th>
                                        <th class="small text-center" style="font-size: 12px;">Chi tiết</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="order" items="${listOrder}">
                                        <tr>
                                            <td class="text-center">${order.orderId}</td>
                                            <td>${order.orderDate}</td>
                                            <td>${order.customerName}</td>
                                            <td class="text-center">
                                                <span>
                                                    ${order.status}
                                                </span>
                                            </td>

                                            <td class="text-center">
                                                <c:set var="payment" value="${paymentMap[order.orderId]}" />
                                                <span class="badge bg-success">
                                                    ${payment != null ? payment.paymentStatus : 'Chưa thanh toán'}
                                                </span>
                                            </td>

                                            <td>
                                                <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" />
                                            </td>
                                            <td class="text-center">
                                                <form action="assignSaleOrder" method="post" class="d-flex justify-content-center">
                                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                                    <button type="submit" class="btn btn-success btn-sm">Nhận đơn tư vấn</button>
                                                </form>
                                            </td>    
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>


                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- latest js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>

        <!-- slick slider js -->
        <script src="${pageContext.request.contextPath}/assets2/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-slick.js"></script>
    </body>

</html>


