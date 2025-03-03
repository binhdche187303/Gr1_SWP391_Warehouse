<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <link rel="icon" href="assets/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Dashboard</title>

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
        <%@ include file="/manager/manager_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container mt-4">
                        <div class="card shadow-sm p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h1 class="h4">Danh sách đơn hàng</h1>
                                <div class="d-flex">
                                    <button class="btn btn-outline-secondary me-2">Xuất dữ liệu</button>
                                    <button class="btn btn-primary">Tạo đơn hàng</button>
                                </div>

                            </div>
                            <div class="input-group mb-3">
                                <button class="btn btn-outline-secondary">
                                    <i class="fas fa-filter"></i> Thêm điều kiện lọc
                                </button>
                                <input type="text" class="form-control" placeholder="Tìm kiếm">
                                <button class="btn btn-outline-secondary">Lưu bộ lọc</button>
                            </div>
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

                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td class="text-center">${order.orderId}</td>
                                            <td>${order.orderDate}</td>
                                            <td>${order.customerName}</td>
                                            <td class="text-center">
                                                <span class="badge
                                                      ${order.status eq 'Pending' ? 'bg-warning' : 
                                                        order.status eq 'Completed' ? 'bg-success' : 
                                                        order.status eq 'Cancelled' ? 'bg-danger' : 
                                                        order.status eq 'Đã xác nhận' ? 'bg-primary' : 'bg-secondary'}">
                                                          ${order.status}
                                                      </span>
                                                </td>

                                                <td class="text-center">
                                                    <c:set var="payment" value="${paymentMap[order.orderId]}" />
                                                    <span class="badge
                                                          ${payment.paymentStatus eq 'Pending' ? 'bg-warning' : 
                                                            payment.paymentStatus eq 'Completed' ? 'bg-success' : 
                                                            payment.paymentStatus eq 'Thanh toán 50%' ? 'bg-info' : 
                                                            'bg-secondary'}">
                                                              ${payment != null ? payment.paymentStatus : 'Chưa thanh toán'}
                                                          </span>
                                                    </td>

                                                    <td>
                                                        <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" />
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="order-details?orderId=${order.orderId}">
                                                            <i class="ri-eye-line"></i>
                                                        </a>  
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


