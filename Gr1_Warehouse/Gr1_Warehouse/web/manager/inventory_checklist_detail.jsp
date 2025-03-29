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
                                    <div class="container mt-4">
                                        <div class="row">
                                            <div class="col-md-12 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h3>Phiếu Kiểm Kho</h3>
                                                    <br/>
                                                    <p class="text-muted d-inline">
                                                        Mã phiếu: <strong>#${check.checkId}</strong>
                                                        <span class="separator"> | </span>
                                                        Ngày kiểm kho: 
                                                        <strong>
                                                            <c:choose>
                                                                <c:when test="${not empty check.completedAt}">
                                                                    ${check.completedAt}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted">Chưa xong</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </strong>
                                                        <span class="separator"> | </span>
                                                        Trạng thái: <strong>${check.status}</strong>
                                                    </p>
                                                </div>
                                                <c:set var="roleId" value="${sessionScope.user.role.roleId}" />
                                                <c:choose>
                                                    <c:when test="${roleId == 3}">
                                                        <div>
                                                            <c:if test="${check.status == 'Đã kiểm kho'}">
                                                                <button class="btn btn-success position-absolute" 
                                                                        style="right: 120px; top: 1; margin-right: 10px;" 
                                                                        onclick="window.location.href = '${pageContext.request.contextPath}/exportInventoryCheck?checkId=${check.checkId}'">
                                                                    In phiếu kiểm
                                                                </button>
                                                            </c:if>
                                                            <button class="btn btn-primary" 
                                                                    onclick="window.location.href = 'http://localhost:8080/Gr1_Warehouse/inventory-checklist'">
                                                                Quay lại
                                                            </button>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${roleId == 4}">
                                                        <div>
                                                            <button class="btn btn-primary" 
                                                                    onclick="window.location.href = 'http://localhost:8080/Gr1_Warehouse/staff-checklist'">
                                                                Quay lại
                                                            </button>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Người giám sát</h5>
                                                        <p><strong>Tên người giám sát:</strong> ${check.reviewedBy.fullname}</p>
                                                        <p><strong>Điện thoại:</strong> ${check.reviewedBy.phone}</p>
                                                        <p><strong>Email:</strong> ${check.reviewedBy.email}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Kho nhập</h5>
                                                        <p><strong>Tên kho lưu trữ:</strong> ${check.warehouse.warehouseName}</p>
                                                        <p><strong>Địa chỉ:</strong> ${check.warehouse.address}</p>
                                                        <p><strong>Điện thoại:</strong> ${check.warehouse.phone}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h3 class="card-title">Danh sách sản phẩm kiểm kê</h3>
                                                        <ul class="nav nav-tabs">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" href="#" onclick="filterProducts('all')">Tất cả</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" href="#" onclick="filterProducts('match')">Khớp</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" href="#" onclick="filterProducts('mismatch')">Lệch</a>
                                                            </li>
                                                        </ul>
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th style="font-size: 16px; text-align: center">Tên sản phẩm</th>
                                                                    <th style="font-size: 16px; text-align: center">Số lô</th>
                                                                    <th style="font-size: 16px; text-align: center">Tồn kho</th>
                                                                    <th style="font-size: 16px; text-align: center">Tồn thực tế</th>
                                                                    <th style="font-size: 16px; text-align: center">Lệch</th>
                                                                    <th style="font-size: 16px; text-align: center">Giá trị lệch</th>
                                                                    <th style="font-size: 16px; text-align: center">Ngày hết hạn</th>
                                                                    <th style="font-size: 16px; text-align: center">Lý do</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="productTable">
                                                                <c:forEach var="item" items="${idlist}">
                                                                    <tr class="product-row" data-discrepancy="${item.discrepancy}">
                                                                        <td>${item.productName} - ${item.sku} - ${item.sizeName}</td>
                                                                        <td>${item.batchId}</td>
                                                                        <td>${item.recordedQuantity}</td>
                                                                        <td>${item.actualQuantity}</td>
                                                                        <td>${item.discrepancy}</td>
                                                                        <td>
                                                                            <fmt:formatNumber value="${item.differencePrice}" type="number" groupingUsed="true" />₫
                                                                        </td>
                                                                        <td>${item.expirationDate != null ? item.expirationDate : 'N/A'}</td>
                                                                        <td>${item.reason}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <p><strong>Nhân viên kiểm kê:</strong> ${idlist[0].warehouseStaff}</p>
                                                        <p><strong>Ghi chú:</strong> ${idlist[0].notes}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Tổng kết kiểm kê</h5>
                                                        <ul class="list-group">
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Số lượng lệch tăng</span>
                                                                <span>${idlist[0].differenceUp}</span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Số lượng lệch giảm</span>
                                                                <span>${idlist[0].differenceDown}</span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Giá trị lệch tăng</span>
                                                                <span>
                                                                    <fmt:formatNumber value="${idlist[0].priceDifferenceUp}" type="number" groupingUsed="true" />₫
                                                                </span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Giá trị lệch giảm</span>
                                                                <span>
                                                                    <fmt:formatNumber value="${idlist[0].priceDifferenceDown}" type="number" groupingUsed="true" />₫
                                                                </span>
                                                            </li>

                                                        </ul>
                                                        </br>       
                                                        <c:choose>
                                                            <c:when test="${roleId == 3}">
                                                                <div style="width: 100%;">
                                                                    <button class="btn btn-primary w-100" 
                                                                            onclick="checkInventoryStatus(${check.checkId}, '${check.status}')">
                                                                        Hoàn tất kiểm kho
                                                                    </button>
                                                                </div>
                                                            </c:when>
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
                </div>  
            </div>  
        </div>

        <script>
            function checkInventoryStatus(checkId, status) {
                if (status === "Đã kiểm kho") {
                    completeInventoryCheck(checkId);
                } else if (status === "Đã cân bằng") {
                    alert("Kho đã được cân bằng. Không thể cân bằng lần nữa.");
                } else {
                    alert("Chỉ có thể hoàn tất kiểm kho khi kho đã được kiểm.");
                }
            }
        </script>
        
        <script>
            function completeInventoryCheck(checkId) {
                if (confirm("Bạn có chắc muốn hoàn tất kiểm kho không?")) {
                    fetch('/Gr1_Warehouse/balance-stock', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({checkId: checkId})
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    alert("Cập nhật tồn kho thành công!");
                                    window.location.href = "http://localhost:8080/Gr1_Warehouse/inventory-checklist";
                                } else {
                                    alert("Có lỗi xảy ra: " + data.message);
                                }
                            })
                            .catch(error => console.error("Lỗi:", error));
                }
            }


            function filterProducts(type) {
                var rows = document.querySelectorAll(".product-row");

                rows.forEach(row => {
                    var discrepancy = parseInt(row.getAttribute("data-discrepancy"));

                    if (type === "all") {
                        row.style.display = "";
                    } else if (type === "match" && discrepancy === 0) {
                        row.style.display = "";
                    } else if (type === "mismatch" && discrepancy !== 0) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });

                // Cập nhật tab active
                document.querySelectorAll(".nav-link").forEach(tab => tab.classList.remove("active"));
                event.target.classList.add("active");
            }

        </script>
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

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
    </body>

</html>