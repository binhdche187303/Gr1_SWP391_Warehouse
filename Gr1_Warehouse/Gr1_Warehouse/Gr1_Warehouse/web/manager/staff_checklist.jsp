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
                <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Header Start-->
            <div class="page-header">
                <div class="header-wrapper m-0">
                    <div class="header-logo-wrapper p-0">
                        <div class="logo-wrapper">
                            <a href="index.html">
                                <img class="img-fluid main-logo" src="${pageContext.request.contextPath}/assets2/images/logo/1.png" alt="logo">
                                <img class="img-fluid white-logo" src="${pageContext.request.contextPath}/assets2/images/logo/1-white.png" alt="logo">
                            </a>
                        </div>
                        <div class="toggle-sidebar">
                            <i class="status_toggle middle sidebar-toggle" data-feather="align-center"></i>
                            <a href="index.html">
                                <img src="${pageContext.request.contextPath}/assets2/images/logo/1.png" class="img-fluid" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="nav-right col-6 pull-right right-header p-0">
                        <ul class="nav-menus">
                            <li class="profile-nav onhover-dropdown pe-0 me-0">
                                <div class="media profile-media">

                                    <div class="user-name-hide media-body">
                                        <span>${sessionScope.acc.username}</span>
                                        <p class="mb-0 font-roboto">${sessionScope.acc.role.roleName}<i class="middle ri-arrow-down-s-line"></i></p>
                                    </div>
                                </div>
                                <ul class="profile-dropdown onhover-show-div">
                                    <li>
                                        <a href="/Gr1_Warehouse/profilesetting">
                                            <i data-feather="settings"></i>
                                            <span>Cài đặt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                           href="javascript:void(0)">
                                            <i data-feather="log-out"></i>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Page Header Ends-->

            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Page Sidebar Start-->
                <div class="sidebar-wrapper">
                    <div id="sidebarEffect"></div>
                    <div>
                        <div class="logo-wrapper logo-wrapper-center">
                            <a href="index.html" data-bs-original-title="" title="">
                                <img class="img-fluid for-white" src="${pageContext.request.contextPath}/assets2/images/logo/full-white.png" alt="logo">
                            </a>
                            <div class="back-btn">
                                <i class="fa fa-angle-left"></i>
                            </div>
                            <div class="toggle-sidebar">
                                <i class="ri-apps-line status_toggle middle sidebar-toggle"></i>
                            </div>
                        </div>
                        <div class="logo-icon-wrapper">
                            <a href="index.html">
                                <img class="img-fluid main-logo main-white" src="${pageContext.request.contextPath}/assets2/images/logo/logo.png" alt="logo">
                                <img class="img-fluid main-logo main-dark" src="${pageContext.request.contextPath}/assets2/images/logo/logo-white.png"
                                     alt="logo">
                            </a>
                        </div>
                        <nav class="sidebar-main">
                            <div class="left-arrow" id="left-arrow">
                                <i data-feather="arrow-left"></i>
                            </div>

                            <div id="sidebar-menu">
                                <ul class="sidebar-links" id="simple-bar">
                                    <li class="back-btn"></li>
                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/staff-checklist">
                                            <i class="ri-file-chart-line"></i>
                                            <span>Danh sách phiếu kiểm kho</span>
                                        </a>
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/profilesetting">
                                            <i class="ri-file-chart-line"></i>
                                            <span>Cài đặt</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="right-arrow" id="right-arrow">
                                <i data-feather="arrow-right"></i>
                            </div>
                        </nav>
                    </div>
                </div>
                <!-- Page Sidebar Ends-->
            </div>
            <!-- Page Body End -->

            <!-- Modal Start -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                <div class="modal-dialog  modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h5 class="modal-title" id="staticBackdropLabel">Đăng xuất</h5>
                            <p>Bạn chắc chắn muốn đăng xuất?</p>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <div class="button-box">
                                <button type="button" class="btn btn--no" data-bs-dismiss="modal">Không</button>
                                <a href="<%= request.getContextPath() %>/logout" class="btn btn--yes btn-primary">Có</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal End -->
        </div>
                            
                            
                            

        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="table-wrapper">
                            <div class="container mt-4">
                                <!-- Action Buttons -->
                                <div class="d-flex align-items-center mb-4">
                                    <!-- Dropdown chọn Kho -->
                                    <select class="form-select me-2" name="warehouseFilter" id="warehouseFilter" onchange="filterInventory()" >
                                        <option value="">Tất cả Kho</option>
                                        <c:forEach var="warehouse" items="${warehouseList}">
                                            <option value="${warehouse.warehouseName}" ${warehouse.warehouseName == param.warehouseFilter ? 'selected' : ''}>
                                                ${warehouse.warehouseName}
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <!-- Dropdown chọn Trạng thái -->
                                    <select class="form-select me-2" name="statusFilter" id="statusFilter" onchange="filterInventory()">
                                        <option value="">Tất cả Trạng thái</option>
                                        <option value="Chờ kiểm kho" ${param.statusFilter == 'Chờ kiểm kho' ? 'selected' : ''}>Chờ kiểm kho</option>
                                        <option value="Đã kiểm kho" ${param.statusFilter == 'Đã kiểm kho' ? 'selected' : ''}>Đã kiểm kho</option>
                                        <option value="Đã cân bằng" ${param.statusFilter == 'Đã cân bằng' ? 'selected' : ''}>Đã cân bằng</option>
                                    </select>

                                    <button class="btn btn-outline-primary ms-2" onclick="filterInventory()">Lọc</button>
                                </div>

                                <!-- Table -->
                                <div class="bg-white p-4 rounded shadow-sm">
                                    <table id="inventoryTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th><small>Mã phiếu</small></th>
                                                <th><small>Kho kiểm</small></th>
                                                <th><small>Trạng thái</small></th>
                                                <th><small>Ngày tạo</small></th>
                                                <th><small>Ngày kiểm</small></th>
                                                <th><small>Số lượng lệch</small></th>
                                                <th><small>Tổng giá trị hàng lệch</small></th>
                                                <th><small>Tùy chọn</small></th>
                                            </tr>
                                        </thead>


                                        <tbody>
                                            <c:if test="${empty inventoryChecks}">
                                                <tr>
                                                    <td colspan="8" class="text-center text-muted">
                                                        <i>Không có phiếu kiểm nào.</i>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach var="check" items= "${inventoryChecks}">
                                                <tr>
                                                    <td><small>${check.checkId}</small></td>
                                                    <td><small>${check.warehouseName}</small></td>
                                                    <td><small><span class="badge bg-success">${check.status}</span></small></td>
                                                    <td>
                                                        <small>
                                                            ${check.checkDate}
                                                            <br><span class="text-muted">@${check.createdBy}</span>
                                                        </small>
                                                    </td>
                                                    <td>
                                                        <small>
                                                            <c:choose>
                                                                <c:when test="${not empty check.completeDate}">
                                                                    ${check.completeDate}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted">Chưa xong</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <br><span class="text-muted">@${check.reviewedBy}</span>
                                                        </small>
                                                    </td>
                                                    <td><small><c:if test="${check.totalDifferenceUp != 0}">
                                                                ${check.totalDifferenceUp} <i class="fas fa-arrow-up text-success"></i><br>
                                                            </c:if>
                                                            <c:if test="${check.totalDifferenceDown != 0}">
                                                                ${check.totalDifferenceDown} <i class="fas fa-arrow-down text-danger"></i>
                                                            </c:if></small></td>

                                                    <td><small><c:if test="${check.totalPriceDifferenceUp != 0}">
                                                                <fmt:formatNumber value="${check.totalPriceDifferenceUp}" type="number" groupingUsed="true" />₫
                                                                <i class="fas fa-arrow-up text-success"></i><br>
                                                            </c:if>
                                                            <c:if test="${check.totalPriceDifferenceDown != 0}">
                                                                <fmt:formatNumber value="${check.totalPriceDifferenceDown}" type="number" groupingUsed="true" />₫
                                                                <i class="fas fa-arrow-down text-danger"></i>
                                                            </c:if></small></td>
                                                    <td>
                                                        <ul class="d-flex align-items-center p-0 m-0" style="list-style: none;">
                                                            <li class="me-2">
                                                                <form action="/Gr1_Warehouse/inventory-checklist-detail?checkId=${check.checkId}" method="get">
                                                                    <input type="hidden" name="checkId" value="${check.checkId}">
                                                                    <button type="submit" style="background: none; border: none;">
                                                                        <i class="ri-eye-line"></i>
                                                                    </button>
                                                                </form>
                                                            </li>
                                                            <li>
                                                                <c:choose>
                                                                    <c:when test="${check.status eq 'Đã kiểm kho' or check.status eq 'Đã cân bằng'}">
                                                                        <button type="button" style="background: none; border: none; cursor: not-allowed; opacity: 0.5;"
                                                                                onclick="alert('Phiếu kiểm kho này đã hoàn thành, không thể chỉnh sửa!');">
                                                                            <i class="ri-pencil-line text-muted"></i>
                                                                        </button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <form action="/Gr1_Warehouse/staff-checklist-details" method="get">
                                                                            <input type="hidden" name="checkId" value="${check.checkId}">
                                                                            <button type="submit" style="background: none; border: none;">
                                                                                <i class="ri-pencil-line"></i>
                                                                            </button>
                                                                        </form>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </li>
                                                        </ul>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                            <!-- Repeat rows as needed -->
                                        </tbody>
                                    </table>
                                    <div id="pagination" class="mt-3 d-flex justify-content-center"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function filterInventory() {
                const warehouse = encodeURIComponent(document.getElementById("warehouseFilter").value.trim());
                const status = encodeURIComponent(document.getElementById("statusFilter").value.trim());

                console.log("Warehouse: " + warehouse);
                console.log("Status: " + status);

                window.location.href = "/Gr1_Warehouse/staff-checklist?warehouseFilter=" + warehouse + "&statusFilter=" + status;
            }

            document.addEventListener("DOMContentLoaded", function () {
                const rowsPerPage = 10; // Số mục trên mỗi trang
                const table = document.getElementById("inventoryTable"); // ID của bảng
                const tbody = table.querySelector("tbody"); // Lấy tbody của bảng
                const rows = Array.from(tbody.querySelectorAll("tr")); // Lấy tất cả các hàng
                const totalPages = Math.ceil(rows.length / rowsPerPage); // Tổng số trang

                let currentPage = 1;

                function showPage(page) {
                    // Ẩn tất cả các hàng trước
                    rows.forEach((row) => (row.style.display = "none"));

                    // Hiển thị các hàng của trang hiện tại
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;
                    rows.slice(start, end).forEach((row) => (row.style.display = "table-row"));

                    // Cập nhật số trang hiện tại
                    document.getElementById("currentPage").textContent = page;

                    // Xóa class "active" khỏi tất cả các nút
                    document.querySelectorAll("#pagination button").forEach((btn) => btn.classList.remove("active"));

                    // Thêm class "active" vào nút của trang hiện tại
                                                const activeButton = document.getElementById(`page-btn-${page}`);
                    if (activeButton) {
                        activeButton.classList.add("active");
                    }
                }

                function createPagination() {
                    const paginationContainer = document.getElementById("pagination");
                    paginationContainer.innerHTML = ""; // Xóa phân trang cũ

                    // Nút Previous
                    const prevButton = document.createElement("button");
                    prevButton.textContent = "«";
                    prevButton.classList.add("btn", "btn-outline-primary", "me-1");
                    prevButton.onclick = function () {
                        if (currentPage > 1) {
                            currentPage--;
                            showPage(currentPage);
                        }
                    };
                    paginationContainer.appendChild(prevButton);

                    // Tạo nút số trang
                    for (let i = 1; i <= totalPages; i++) {
                        const pageButton = document.createElement("button");
                        pageButton.textContent = i;
                                                    pageButton.id = `page-btn-${i}`;
                        pageButton.classList.add("btn", "btn-outline-primary", "me-1");

                        pageButton.onclick = function () {
                            currentPage = i;
                            showPage(currentPage);
                        };
                        paginationContainer.appendChild(pageButton);
                    }

                    // Nút Next
                    const nextButton = document.createElement("button");
                    nextButton.textContent = "»";
                    nextButton.classList.add("btn", "btn-outline-primary", "me-1");
                    nextButton.onclick = function () {
                        if (currentPage < totalPages) {
                            currentPage++;
                            showPage(currentPage);
                        }
                    };
                    paginationContainer.appendChild(nextButton);
                }

                // Khởi tạo phân trang
                if (rows.length > 0) {
                    createPagination();
                    showPage(1); // Mặc định hiển thị trang 1
                    document.getElementById("page-btn-1").classList.add("active"); // Tô màu trang 1
                }
            });
        </script>
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
        <!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!-- Apexchar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/apex-chart1.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/apex-chart.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/stock-prices.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/chart-custom1.js"></script>

        <!-- slick slider js -->
        <script src="${pageContext.request.contextPath}/assets2/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-slick.js"></script>

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
