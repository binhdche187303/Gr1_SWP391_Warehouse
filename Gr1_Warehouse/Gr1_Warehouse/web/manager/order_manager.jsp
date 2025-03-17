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
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <!-- Cột bên trái: Tiêu đề + Lọc trạng thái + Lọc thanh toán -->
                                <div class="d-flex flex-column gap-2">
                                    <!-- Tiêu đề -->
                                    <h4 class="mb-0">Danh sách đơn hàng</h4>

                                    <!-- Lọc trạng thái đơn hàng -->
                                    <div class="d-flex align-items-center gap-2">
                                        <label class="fw-bold me-2">Lọc trạng thái:</label>
                                        <div class="btn-group d-flex flex-wrap" role="group">
                                            <input type="checkbox" class="btn-check order-status-filter" id="status1" value="Chờ xử lý">
                                            <label class="btn btn-outline-primary" for="status1">Chờ xử lý</label>

                                            <input type="checkbox" class="btn-check order-status-filter" id="status2" value="Đã xác nhận">
                                            <label class="btn btn-outline-primary" for="status2">Đã xác nhận</label>

                                            <input type="checkbox" class="btn-check order-status-filter" id="status3" value="Đang đóng gói">
                                            <label class="btn btn-outline-primary" for="status3">Đang đóng gói</label>

                                            <input type="checkbox" class="btn-check order-status-filter" id="status4" value="Đã gửi hàng">
                                            <label class="btn btn-outline-primary" for="status4">Đã gửi hàng</label>
                                        </div>
                                    </div>

                                    <!-- Lọc trạng thái thanh toán -->
                                    <div class="d-flex align-items-center gap-2">
                                        <label class="fw-bold me-2">Thanh toán:</label>
                                        <div class="btn-group d-flex flex-wrap" role="group">
                                            <input type="checkbox" class="btn-check payment-status-filter" id="payment1" value="Chờ xử lý">
                                            <label class="btn btn-outline-success" for="payment1">Chờ xử lý</label>

                                            <input type="checkbox" class="btn-check payment-status-filter" id="payment2" value="Thanh toán 50%">
                                            <label class="btn btn-outline-success" for="payment2">Thanh toán 50%</label>

                                            <input type="checkbox" class="btn-check payment-status-filter" id="payment3" value="Thanh toán 100%">
                                            <label class="btn btn-outline-success" for="payment3">Thanh toán 100%</label>

                                            <input type="checkbox" class="btn-check payment-status-filter" id="payment4" value="Thanh toán thất bại">
                                            <label class="btn btn-outline-success" for="payment4">Thanh toán thất bại</label>
                                        </div>
                                    </div>

                                </div>

                                <!-- Dropdown sắp xếp (luôn nằm bên phải) -->
                                <div class="dropdown ms-auto">
                                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown">
                                        <i class="ri-sort-asc"></i> Ngày tạo
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><button class="dropdown-item" id="sortAsc">Sắp xếp tăng</button></li>
                                        <li><button class="dropdown-item" id="sortDesc">Sắp xếp giảm</button></li>
                                    </ul>
                                </div>
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
                                                      ${order.status eq 'Chờ xử lý' ? 'bg-warning' : 
                                                        order.status eq 'Đã xác nhận' ? 'bg-primary' : 
                                                        order.status eq 'Đang đóng gói' ? 'bg-info' : 
                                                        order.status eq 'Đã gửi hàng' ? 'bg-success' : 'bg-secondary'}">
                                                          ${order.status}
                                                      </span>
                                                </td>

                                                <td class="text-center">
                                                    <c:set var="payment" value="${paymentMap[order.orderId]}" />
                                                    <span class="badge
                                                          ${payment.paymentStatus eq 'Chờ xử lý' ? 'bg-warning' : 
                                                            payment.paymentStatus eq 'Thanh toán 50%' ? 'bg-info' : 
                                                            payment.paymentStatus eq 'Thanh toán 100%' ? 'bg-success' : 
                                                            payment.paymentStatus eq 'Thanh toán thất bại' ? 'bg-danger' : 'bg-secondary'}">
                                                              ${payment != null ? payment.paymentStatus : 'Chưa thanh toán'}
                                                          </span>
                                                    </td>


                                                    <td>
                                                      
                                                        <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/>₫
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
                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <span id="pagination-info" class="small fw-light"></span>
                                        <nav>
                                            <ul class="pagination pagination-sm mb-0">
                                                <li class="page-item">
                                                    <button class="page-link small fw-light" id="prevPage">Trước</button>
                                                </li>
                                                <li class="page-item">
                                                    <ul id="pagination-list" class="pagination pagination-sm mb-0 mx-2"></ul>
                                                </li>
                                                <li class="page-item">
                                                    <button class="page-link small fw-light" id="nextPage">Sau</button>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        document.querySelectorAll(".order-status-filter, .payment-status-filter").forEach(checkbox => {
                            checkbox.addEventListener("change", filterOrders);
                        });
                    });

                    function filterOrders() {
                        let selectedOrderStatuses = Array.from(document.querySelectorAll(".order-status-filter:checked")).map(cb => cb.value);
                        let selectedPaymentStatuses = Array.from(document.querySelectorAll(".payment-status-filter:checked")).map(cb => cb.value);

                        document.querySelectorAll("tbody tr").forEach(row => {
                            // Chọn cột thứ 4 cho trạng thái đơn hàng (dựa theo HTML của bạn)
                            let orderStatusElement = row.querySelector("td:nth-child(4) span");
                            // Chọn cột thứ 5 cho trạng thái thanh toán
                            let paymentStatusElement = row.querySelector("td:nth-child(5) span");

                            let orderStatus = orderStatusElement ? orderStatusElement.textContent.trim() : "";
                            let paymentStatus = paymentStatusElement ? paymentStatusElement.textContent.trim() : "";

                            let matchOrderStatus = selectedOrderStatuses.length === 0 || selectedOrderStatuses.includes(orderStatus);
                            let matchPaymentStatus = selectedPaymentStatuses.length === 0 || selectedPaymentStatuses.includes(paymentStatus);

                            row.style.display = (matchOrderStatus && matchPaymentStatus) ? "" : "none";
                        });
                    }
                </script>



                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        let rowsPerPage = 7;
                        let currentPage = 1;
                        let tableRows = document.querySelectorAll("tbody tr");
                        let totalPages = Math.ceil(tableRows.length / rowsPerPage);

                        function showPage(page) {
                            currentPage = page;
                            let start = (currentPage - 1) * rowsPerPage;
                            let end = start + rowsPerPage;
                            tableRows.forEach((row, index) => {
                                row.style.display = (index >= start && index < end) ? "" : "none";
                            });
                            updatePaginationButtons();
                        }

                        function updatePaginationButtons() {
                            let paginationList = document.getElementById("pagination-list");
                            paginationList.innerHTML = "";
                            for (let i = 1; i <= totalPages; i++) {
                                let pageItem = document.createElement("li");
                                pageItem.classList.add("page-item");
                                let pageButton = document.createElement("button");
                                pageButton.classList.add("page-link");
                                pageButton.textContent = i;
                                if (i === currentPage) {
                                    pageItem.classList.add("active");
                                }
                                pageButton.addEventListener("click", function () {
                                    showPage(i);
                                });
                                pageItem.appendChild(pageButton);
                                paginationList.appendChild(pageItem);
                            }
                            document.getElementById("prevPage").disabled = (currentPage === 1);
                            document.getElementById("nextPage").disabled = (currentPage === totalPages);
                        }

                        document.getElementById("prevPage").addEventListener("click", function () {
                            if (currentPage > 1)
                                showPage(currentPage - 1);
                        });

                        document.getElementById("nextPage").addEventListener("click", function () {
                            if (currentPage < totalPages)
                                showPage(currentPage + 1);
                        });

                        showPage(1);
                    });
                </script>                       

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const tableBody = document.querySelector("tbody");
                        const rows = Array.from(tableBody.querySelectorAll("tr"));

                        function sortTable(ascending) {
                            rows.sort((a, b) => {
                                const dateA = new Date(a.cells[1].textContent.trim());
                                const dateB = new Date(b.cells[1].textContent.trim());
                                return ascending ? dateA - dateB : dateB - dateA;
                            });

                            tableBody.innerHTML = ""; // Xóa bảng cũ
                            rows.forEach(row => tableBody.appendChild(row)); // Thêm hàng đã sắp xếp
                        }

                        document.getElementById("sortAsc").addEventListener("click", () => sortTable(true));
                        document.getElementById("sortDesc").addEventListener("click", () => sortTable(false));
                    });

                </script>
                <style>
                    .pagination {
                        display: flex;
                        list-style: none;
                        padding: 0;
                    }
                    .pagination .page-item {
                        margin: 0 3px;
                    }

                </style>



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

