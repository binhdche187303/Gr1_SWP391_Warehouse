<%-- 
    Document   : export_inventory_check.jsp
    Created on : Mar 20, 2025, 10:54:05 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Phiếu kiểm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
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
                                                        Ngày kiểm kho: ${check.completedAt}
                                                    </p>
                                                </div>
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
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mt-4">
                                            <button class="btn btn-dark" onclick="printInvoice()">In hóa đơn</button>
                                        </div>
                                    </div>  
                                </div>

                            </div>  
                        </div>  
                    </div> 

                </div>
            </div>  
        </div>
    </body>
    <script>
        function printInvoice() {
            let checkId = "${check.checkId}"; // Lấy checkId từ dữ liệu động
            window.print(); // Mở hộp thoại in

            // Đợi 2 giây trước khi chuyển hướng
            setTimeout(function () {
                window.location.href = "http://localhost:8080/Gr1_Warehouse/inventory-checklist-detail?checkId=" + checkId;
            }, 1000);
        }

    </script>

    <style>
        body {
            background-color: #f8f9fa;
            font-size: 15px;
        }
        .container {
            max-width: 900px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
        }
        h3 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #28a745;
        }
        .separator {
            margin: 0 10px;
        }
        .card {
            margin-bottom: 15px;
        }
        .card-title {
            color: #28a745;
            font-weight: bold;
            font-size: 1.2rem;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .table thead {
            background: #28a745;
            color: white;
        }
        .table {
            font-size: 14px;
        }
        .list-group-item {
            font-size: 14px;
        }
        .btn-dark {
            background: #343a40;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 20px 30px;
        }
        .product-row[data-discrepancy="0"] {
            background-color: #f8f9fa;
        }
        .product-row[data-discrepancy^="-"] {
            background-color: #ffe6e6;
        }
        .product-row[data-discrepancy]:not([data-discrepancy="0"]):not([data-discrepancy^="-"]) {
            background-color: #e6ffe6;
        }
        /* Override page structure to match first template */
        .page-wrapper, .page-body-wrapper, .page-body {
            background-color: #f8f9fa;
            padding: 0;
            margin: 0;
            width: 100%;
        }
        .container-fluid {
            max-width: 900px;
            margin: 0 auto;
        }
        .card-table, .card-body {
            padding: 0;
            margin: 0;
            box-shadow: none;
            border: none;
        }
        /* Print specific styles */
        @media print {
            body {
                font-size: 12px;
                background-color: white;
            }
            .container {
                max-width: 100%;
                box-shadow: none;
                padding: 10px;
            }
            .btn-dark {
                display: none;
            }
            .card {
                border: 1px solid #ddd;
            }
        }
    </style>

</html>
