<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Fastkart" />
        <meta name="keywords" content="Fastkart" />
        <meta name="author" content="Fastkart" />
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon" />
        <title>User Dashboard</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css" />

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css" />

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css" />

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css" />

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css" />

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />
    
    </head>
    <body>
    
    <%@ include file="/includes/header.jsp" %>


    <div class="container mt-5">
        <div class="order-detail-container">
            <h2 class="text-center mb-4">Chi tiết đơn hàng</h2>

            <!-- Thông tin đơn hàng -->
            <div class="order-info mb-4">
                <p><strong>Mã đơn hàng:</strong> #${orderDetail.order.orderId}</p>
                <p><strong>Ngày đặt hàng:</strong> ${orderDetail.order.orderDate}</p>
                <p><strong>Trạng thái đơn hàng:</strong> 
                    <span class="badge ${orderDetail.order.status eq 'Pending' ? 'bg-warning' : 'bg-success'}">
                        ${orderDetail.order.status}
                    </span>
                </p>
                <p><strong>Trạng thái thanh toán:</strong> 
                    <span class="badge
                          ${paymentStatus eq 'Thanh toán 50%' ? 'bg-info' : 
                            (paymentStatus eq 'Đã thanh toán' ? 'bg-success' : 
                            (paymentStatus eq 'Thanh toán thất bại' ? 'bg-danger' : 'bg-secondary'))}">
                              ${paymentStatus}
                          </span>
                    </p>
                    <p><strong>Tổng:</strong> 
                        <fmt:formatNumber value="${orderDetail.order.totalAmount}" type="number" groupingUsed="true"/>₫
                    </p>
                </div>
                <input type="hidden" id="order-id" value="${orderDetail.order.orderId}">

                <!-- Danh sách sản phẩm -->
                <table class="table table-striped table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>SKU</th>
                            <th>Phân loại</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="i" begin="0" end="${orderDetail.orderDetails.size() - 1}">
                            <tr>
                                <td>${orderDetail.products[i].productName}</td>
                                <td>${orderDetail.productVariants[i].sku}</td>
                                <td>${orderDetail.sizes[i].size_name}</td>
                                <td><fmt:formatNumber value="${orderDetail.orderDetails[i].unitPrice}" type="number" groupingUsed="true"/>₫</td>
                                <td>${orderDetail.orderDetails[i].quantity}</td>
                                <td><fmt:formatNumber value="${orderDetail.orderDetails[i].unitPrice * orderDetail.orderDetails[i].quantity}" type="number" groupingUsed="true"/>₫</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="text-end"><strong>Tổng (trước khi giảm giá):</strong></td>
                            <td><strong><fmt:formatNumber value="${orderDetail.totalBeforeDiscount}" type="number" groupingUsed="true"/>₫</strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end"><strong>Tổng (sau khi giảm giá):</strong></td>
                            <td><strong><fmt:formatNumber value="${orderDetail.order.totalAmount}" type="number" groupingUsed="true"/>₫</strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end"><strong>Tiền cọc:</strong></td>
                            <td><strong><fmt:formatNumber value="${orderPayment.depositAmount}" type="number" groupingUsed="true"/>₫</strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-end"><strong>Tổng (sau khi cọc 50%):</strong></td>
                            <td><strong><fmt:formatNumber value="${remainingAmount}" type="number" groupingUsed="true"/>₫</strong></td>
                        </tr>
                    </tfoot>
                </table>

                <form action="ajaxServlet" method="post">
                    <input type="hidden" name="orderId" value="${orderDetail.order.orderId}">
                    <!-- Deposit Button -->
                    <button type="submit" id="depositButton" class="btn btn-primary mt-3">Cọc 50% giá trị đơn hàng</button>
                </form>
                <!-- Back Button -->
                <a href="profileSetting" class="btn btn-success mt-3">Quay trở lại</a>
            </div>
        </div>

        <%@ include file="/includes/footer.jsp" %>


        <style>
            .order-detail-container {
                max-width: 900px;
                margin: auto;
                padding: 20px;
                background: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .order-info {
                margin-bottom: 20px;
            }
            .order-items {
                width: 100%;
            }
            .order-items th, .order-items td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }
            .back-btn {
                margin-top: 20px;
            }

        </style>
        <!-- Edit Card End -->
        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- jquery ui-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Lazyload Js -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- Wizard js -->
        <script src="${pageContext.request.contextPath}/assets/js/wizard.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Quantity js -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- Nav & tab upside js -->
        <script src="${pageContext.request.contextPath}/assets/js/nav-tab.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    </body>