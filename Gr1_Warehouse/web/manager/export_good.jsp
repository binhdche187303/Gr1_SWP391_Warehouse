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
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Cột chính (Thông tin đơn hàng) -->
                            <div class="col-lg-8">
                                <div>
                                    <div class="position-relative">
                                        <div class="card-body d-flex align-items-center">
                                            <div style="line-height: 1.2;">
                                                <h4 class="fw-bold mb-1">Đơn hàng &gt; ${orderDetailDTO.order.orderId}</h4>
                                                <p class="text-muted small mb-0">
                                                    ${orderDetailDTO.order.orderDate}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Trạng thái thanh toán và giao hàng -->
                                <div class="card mb-4">
                                    <div class="card-body d-flex gap-4">
                                        <div style="line-height: 2.1;">
                                            <div class="text-muted small fw-bold">Trạng thái đơn hàng</div>
                                            <span class="badge bg-primary p-2">${orderDetailDTO.order.status}</span>
                                        </div>
                                        <div style="line-height: 2.1;">
                                            <div class="text-muted small fw-bold">Trạng thái thanh toán</div>
                                            <span class="badge bg-primary p-2">${orderDetailDTO.payment.paymentStatus}</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Chi tiết đơn hàng -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold mb-3">Đơn hàng chi tiết</h5>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th><span class="small">Sản phẩm</span></th>
                                                    <th><span class="small">Số lượng</span></th>
                                                    <th><span class="small">Giá</span></th>
                                                    <th><span class="small">Thành tiền</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${orderDetailDTO.orderDetails}" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            <div class="text-primary small">
                                                                ${orderDetailDTO.products[status.index].productName}
                                                            </div>
                                                            <div class="text-muted small">
                                                                SKU: ${orderDetailDTO.productVariants[status.index].sku}
                                                            </div>
                                                        </td>
                                                        <td><span class="small">${orderDetail.quantity}</span></td>
                                                        <td>
                                                            <span class="small">
                                                                <fmt:formatNumber value="${orderDetail.unitPrice}" type="currency" currencySymbol="đ" />
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span class="small">
                                                                <fmt:formatNumber value="${orderDetail.unitPrice * orderDetail.quantity}" type="currency" currencySymbol="đ" />
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-end fw-bold">Tổng tiền:</td>
                                                    <td class="fw-bold text-danger">
                                                        <fmt:formatNumber value="${totalAmount != null ? totalAmount : 0}" type="currency" currencySymbol="đ" />
                                                    </td>
                                                </tr>
                                            </tfoot>

                                        </table>
                                    </div>
                                </div>

                                <!-- Chiết khấu áp dụng -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold mb-3">Chiết khấu áp dụng</h5>
                                        <div class="d-flex gap-3 align-items-center mb-3">
                                            <label for="discount-code" class="form-label mb-0 fs-6" style="min-width: 120px;">Mã giảm giá:</label>
                                            <input type="text" id="discount-code" class="form-control flex-grow-1" placeholder="Nhập mã giảm giá" />
                                            <button class="btn btn-primary" onclick="applyDiscount()">Áp dụng</button>
                                        </div>

                                        <hr>
                                        <div class="d-flex justify-content-between fw-bold">
                                            <span>Tổng thanh toán (sau khi áp dụng mã giảm giá)</span>
                                            <span class="fw-bold text-danger">
                                                <!-- Hiển thị tổng thanh toán sau khi áp dụng mã giảm giá -->
                                                <fmt:formatNumber value="${totalAmount != null ? totalAmount : 0}" type="currency" currencySymbol="đ" />
                                            </span>
                                        </div>
                                            
                                        <div class="mt-3 fw-bold">
                                            <label for="note" class="form-label">Ghi chú đơn hàng</label>
                                            <textarea id="note" class="form-control" rows="3" placeholder="Nhập ghi chú về đơn hàng..."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Cột phụ (Xác thực đơn hàng & Thông tin khách hàng) -->
                            <div class="col-lg-4">
                                <button class="btn btn-primary position-absolute" 
                                        style="right: 10px; top: 0;" 
                                        onclick="window.location.href = '${pageContext.request.contextPath}/orderlist'">
                                    Quay lại
                                </button>

                                <div class="card mb-4" style="margin-top: 78px;">
                                    <div class="card-body text-center">
                                        <h5 class="fw-bold mb-3">Xác Thực Đơn Hàng</h5>
                                        <p class="text-muted">Vui lòng xác thực đơn hàng</p>
                                        <button class="btn btn-primary w-100">Xác Thực Đơn Hàng</button>
                                    </div>
                                </div>
                                <!-- Thông tin người mua -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold mb-3">Thông Tin Người Mua</h5>
                                        <c:choose>
                                            <c:when test="${not empty orderDetailDTO.user}">
                                                <p class="fw-semibold">${orderDetailDTO.user.fullname}</p>
                                                <ul class="list-unstyled text-muted small">
                                                    <li>• Số điện thoại: ${orderDetailDTO.user.phone}</li>
                                                    <li>• Email: ${orderDetailDTO.user.email}</li>
                                                </ul>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted">Không có thông tin người mua.</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <!-- Thông tin giao hàng -->
                                <!-- Thông tin giao hàng -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h5 class="fw-bold mb-3">Thông tin giao hàng</h5>
                                        <c:choose>
                                            <c:when test="${not empty orderDetailDTO.order}">
                                                <p class="fw-semibold">Người nhận: ${orderDetailDTO.order.customerName}</p>
                                                <p class="text-muted">Email: <c:out value="${orderDetailDTO.order.email}" default="Chưa có email" /></p>
                                                <p class="text-muted">Số điện thoại: <c:out value="${orderDetailDTO.order.phoneNumber}" default="Chưa có số điện thoại" /></p>
                                                <p class="text-muted">Địa chỉ giao hàng: <c:out value="${orderDetailDTO.order.shippingAddress}" default="Chưa có địa chỉ" /></p>
                                                <p class="text-muted">Ghi chú: <c:out value="${orderDetailDTO.order.notes}" default="Không có ghi chú" /></p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted">Không có thông tin giao hàng.</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>

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


