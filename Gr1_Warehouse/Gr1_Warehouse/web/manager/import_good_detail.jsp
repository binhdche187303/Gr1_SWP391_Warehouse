<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="assets/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Dashboard</title>

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
        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">
        <!-- Feather icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">
        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">
        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">
        <!-- vector map css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vector-map.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/vendors/slick.css">
        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>
    <body>
        <%@ include file="/manager/manager_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <!-- page-wrapper Start-->
                                    <div class="container mt-4">
                                        <div class="row">
                                            <!-- Tiêu đề và nút chức năng -->
                                            <div class="col-md-12 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h3>Nhập hàng</h3>
                                                    <br/>
                                                    <p class="text-muted d-inline">
                                                        Mã phiếu: <strong>#${orderId}</strong>
                                                        <span class="separator"> | </span>
                                                        Thời gian nhập: <strong>${orderDetail.order.orderDate}</strong>
                                                        <span class="separator"> | </span>
                                                        Trạng thái: <strong>${orderDetail.order.status}</strong>
                                                    </p>

                                                </div>

                                                <div>
                                                    <button class="btn btn-primary" onclick="window.location.href = 'http://localhost:8080/Gr1_Warehouse/importGood'">Quay lại</button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Thông tin nhà cung cấp và kho nhập -->
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Nhà cung cấp</h5>
                                                        <c:if test="${not empty orderDetail.supplier}">
                                                            <p><strong>Tên nhà cung cấp:</strong> ${orderDetail.supplier.supplierName}</p>
                                                            <p><strong>Địa chỉ:</strong> ${orderDetail.supplier.address}</p>
                                                            <p><strong>Điện thoại:</strong> ${orderDetail.supplier.phone}</p>
                                                            <p><strong>Email:</strong> ${orderDetail.supplier.email}</p>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Kho nhập</h5>
                                                        <c:if test="${not empty orderDetail.warehouse}">
                                                            <p><strong>Tên kho lưu trữ:</strong> ${orderDetail.warehouse.warehouseName}</p>
                                                            <p><strong>Địa chỉ:</strong> ${orderDetail.warehouse.address}</p>
                                                            <p><strong>Điện thoại:</strong> ${orderDetail.warehouse.phone}</p>
                                                            <p><strong></strong></p>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Danh sách sản phẩm nhập -->
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Sản phẩm nhập</h5>
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <td>Tên sản phẩm</td>
                                                                    <td>Số lượng</td>
                                                                    <td>Đơn giá</td>
                                                                    <td>Hạn sử dụng</td>
                                                                    <td>Thành tiền</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:if test="${not empty orderDetail.purchaseDetails}">
                                                                    <c:forEach var="detail" items="${orderDetail.purchaseDetails}" varStatus="status">
                                                                        <tr>
                                                                            <td>${orderDetail.productNames[status.index]}  -  ${detail.sku}   -   ${orderDetail.sizeName[status.index]}</td>
                                                                            <td>${detail.quantity}</td>
                                                                            <td>
                                                                                <fmt:formatNumber value="${detail.unitPrice}" type="currency" currencySymbol="đ" />
                                                                            </td>
                                                                            <td>${detail.expirationDate != null ? detail.expirationDate : 'N/A'}</td>
                                                                            <td>
                                                                                <fmt:formatNumber value="${detail.totalPrice}" type="currency" currencySymbol="đ" />
                                                                            </td>                                                                        
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Thông tin hóa đơn -->
                                        <div class="row mt-4">
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Thông tin phiếu nhập</h5>
                                                        <c:if test="${not empty orderDetail.order}">
                                                            <p><strong>Nhân viên xử lý:</strong> ${orderDetail.processedBy.fullname}</p>
                                                            <p><strong>Mã tham chiếu:</strong> ${orderDetail.order.referenceCode}</p>
                                                            <p class="mt-3"><strong>Ghi chú:</strong> ${orderDetail.order.notes}</p>
                                                            <p class="mt-3"><strong>Ảnh hóa đơn tham chiếu</strong></p>
                                                            <a href="/Gr1_Warehouse/assets/images/bill_img/${orderDetail.order.billImgUrl}" target="_blank">Xem ảnh hóa đơn</a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Chi tiết thanh toán</h5>
                                                        <ul class="list-group">
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Tổng số lượng nhập</span>
                                                                <span>${not empty orderDetail.purchaseDetails ? orderDetail.purchaseDetails.size() : 0}</span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Giá</span>
                                                                <span>
                                                                    <fmt:formatNumber value="${not empty orderDetail.purchaseDetails ? orderDetail.purchaseDetails[0].unitPrice : 0}" type="currency" currencySymbol="₫" />
                                                                </span>
                                                            </li>

                                                            <li class="list-group-item d-flex justify-content-between text-danger">
                                                                <strong>Tổng tiền hàng</strong>
                                                                <strong>
                                                                    <fmt:formatNumber value="${not empty orderDetail.order.totalAmount ? orderDetail.order.totalAmount : 0}" type="currency" currencySymbol="₫" />
                                                                </strong>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .text-muted {
                display: inline;
            }

            .separator {
                margin: 0 10px;
            }

            strong {
                margin-left: 5px;
            }


        </style>
        <!-- latest js -->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>

        <!-- feather icon js -->
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>

        <!-- scrollbar simplebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>

        <!-- Sidebar jquery -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>

        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
    </body>

</html>