<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
        <meta name="keywords"
              content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
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
                                                    <h3>Phiếu kiểm kho</h3>
                                                    <br/>
                                                    <p class="text-muted d-inline">
                                                        Mã phiếu: <strong>#${orderId}</strong>
<!--                                                        <span class="separator"> | </span>
                                                        Thời gian nhập: <strong>${orderDetail.order.orderDate}</strong>-->
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
                                                        <h5 class="card-title">Người giám sát: </h5>
                                                        <c:if test="${not empty orderDetail.supplier}">
                                                            <p><strong>Tên người giám sát:</strong> ${orderDetail.supplier.supplierName}</p>
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
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
 <!-- Phần sản phẩm -->
                                    <div class="container mt-4">
                                        <div class="border border-gray-300 rounded-lg shadow-sm p-4 bg-white">
                                            <div class="border-bottom pb-2 mb-2">
                                                <h3 class="text-lg font-semibold">Sản phẩm</h3>
                                            </div>
                                            <div class="mb-4">
                                                <div class="row">
                                                    <div class="col-md-9 d-flex align-items-center">
                                                        <div class="input-group w-100">
                                                            <div class="input-group-prepend">
                                                                <select class="form-control">
                                                                    <option value="sku">Tìm kiếm SKU</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" class="form-control flex-grow-2" placeholder="Tìm kiếm sản phẩm">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-items-center">
                                                        <!-- Button mở modal -->
                                                        <button class="btn btn-outline-primary w-auto">
                                                            Tìm kiếm
                                                        </button>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- Bảng hiển thị sản phẩm đã chọn -->
                                            <div class="mt-3">
                                                <table class="table">
                                                    <thead>
                                                        <tr >
                                                            <th style="font-size: 16px; text-align: center">Tên sản phẩm</th>
                                                            <th style="font-size: 16px; text-align: center">Số lô</th>
                                                            <th style="font-size: 16px; text-align: center">Tồn kho</th>
                                                            <th style="font-size: 16px; text-align: center">Tồn thực tế</th>
                                                            <th style="font-size: 16px; text-align: center">Lệch</th>
                                                            <th style="font-size: 16px; text-align: center">Giá trị lệch</th>
                                                            <th style="font-size: 16px; text-align: center">Lý do</th>
                                                            <th style="font-size: 16px">Xóa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="selectedProductContainer">
                                                        <!-- Các hàng sản phẩm sẽ được thêm vào đây -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!--                                            <div id="selectedProductContainer" class="mt-3"></div>-->
                                            <div class="modal fade" id="searchProductModal" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Danh sách sản phẩm</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <td>Chọn</td>
                                                                        <td>Tên sản phẩm</td>
                                                                        <td>Phân loại</td>
                                                                        <td>SKU</td>
                                                                        <td>Số lô</td>
                                                                        <td>Tồn</td>
                                                                        <td>Giá nhập</td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="productTable"></tbody> <!-- JS sẽ render sản phẩm vào đây -->
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <button type="button" class="btn btn-primary">Hoàn tất chọn</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center mt-4">
                                                <button class="btn btn-outline-primary" id="openProductModal" type="button">
                                                    Xem danh sách sản phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phần thông tin nhập hàng -->
                                    <div class="container mt-4">
                                        <div class="row">
                                            <!-- Left Section -->
                                            <div class="col-12 col-lg-6 mb-4">
                                                <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                    <div class="mb-4">
                                                        <label class="form-label">Nhân viên kiểm kê: </label>
                                                        <textarea id="warehouseStaff" name="warehouseStaff" class="form-control" placeholder="Nhập tên nhân viên kiểm kê"></textarea>
                                                    </div>
                                                    <div class="mb-4">
                                                        <label class="form-label">Ghi chú</label>
                                                        <textarea id="notes" name="notes" class="form-control" placeholder="Nhập ghi chú"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Right Section -->
                                            <div class="col-12 col-lg-6">
                                                <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                    <h3 class="mb-4">Tổng kết</h3>
                                                    <div class="d-flex justify-content-between mb-2">
                                                        <span class="text-gray-700">Số lượng lệch tăng</span>
                                                        <span id="totalDifferenceUp" name="totalDifferenceUp">0</span>
                                                    </div>

                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Số lượng lệch giảm</span>
                                                        <span id="totalDifferenceDown" name="totalDifferenceDown">0</span>
                                                    </div>

                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Giá trị lệch tăng</span>
                                                        <span id="totalPriceDifferenceUp" name="totalPriceDifferenceUp">0 VND</span>
                                                    </div>

                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Giá trị lệch giảm</span>
                                                        <span id="totalPriceDifferenceDown" name="totalPriceDifferenceDown">0 VND</span>
                                                    </div>


                                                    <button id="submitOrderBtn" class="w-100 btn btn-primary" type="submit">Hoàn tất kiểm kho</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
<!--                                         Danh sách sản phẩm nhập 
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Sản phẩm kiểm kho</h5>
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <td>Tên sản phẩm</td>
                                                                    <td>Số lô</td>
                                                                    <td>Tồn kho</td>
                                                                    <td>Tồn thực tế</td>
                                                                    <td>Lệch</td>
                                                                    <td>Giá trị lệch</td>
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
                                         Thông tin hóa đơn 
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
                                        </div>-->
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
