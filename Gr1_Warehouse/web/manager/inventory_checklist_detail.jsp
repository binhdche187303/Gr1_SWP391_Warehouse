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
                                    <div class="container mt-4">
                                        <div class="row">
                                            <div class="col-md-12 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h3>Phiếu Kiểm Kho</h3>
                                                    <br/>
                                                    <p class="text-muted d-inline">
                                                        Mã phiếu: <strong>#${idlist[0].checkId}</strong>
                                                        <span class="separator"> | </span>
                                                        Ngày kiểm kho: <strong>${idlist[0].completedAt}</strong>
                                                        <span class="separator"> | </span>
                                                        Trạng thái: <strong>${idlist[0].status}</strong>
                                                    </p>
                                                </div>
                                                <c:set var="roleId" value="${sessionScope.user.role.roleId}" />
                                                <button class="btn btn-primary" 
                                                        onclick="window.location.href = '#'">
                                                    Tạo báo cáo chênh lệch
                                                </button>
                                                <c:choose>

                                                    <c:when test="${roleId == 3}">
                                                        <div>
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
                                            <div class="col-md-12">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Danh sách sản phẩm kiểm kê</h5>
                                                        <table class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>Tên sản phẩm</th>
                                                                    <th>Số lô</th>
                                                                    <th>Tồn kho</th>
                                                                    <th>Tồn thực tế</th>
                                                                    <th>Lệch</th>
                                                                    <th>Giá trị lệch</th>
                                                                    <th>Ngày hết hạn</th>
                                                                    <th>Lý do</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="item" items="${idlist}">
                                                                    <tr>
                                                                        <td>${item.productName} - ${item.sku} - ${item.sizeName}</td>
                                                                        <td>${item.batchId}</td>
                                                                        <td>${item.recordedQuantity}</td>
                                                                        <td>${item.actualQuantity}</td>
                                                                        <td>${item.discrepancy}</td>
                                                                        <td>
                                                                            <fmt:formatNumber value="${item.differencePrice}" type="currency" currencySymbol="₫" />
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
                                                                    <fmt:formatNumber value="${idlist[0].priceDifferenceUp}" type="currency" currencySymbol="₫" />
                                                                </span>
                                                            </li>
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                <span>Giá trị lệch giảm</span>
                                                                <span>
                                                                    <fmt:formatNumber value="${idlist[0].priceDifferenceDown}" type="currency" currencySymbol="₫" />
                                                                </span>
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
