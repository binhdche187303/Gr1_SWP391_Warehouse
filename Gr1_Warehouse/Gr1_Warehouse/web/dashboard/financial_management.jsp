<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Fontawesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">

        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">

        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">

        <!-- Data Table css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/datatables.css">

        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

        <!-- Feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>

    <body>
        <%@include file="/includes/admin.jsp" %>
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Order section Start -->
                <div class="page-body">
                    <!-- Table Start -->
                    <div class="container-fluid">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h2 class="fw-bold">Sổ Quỹ</h2>
                        </div>
                        <form action="financialmanagement" method="post" id="statisticsForm">
                            <span class="mb-3">
                                <label for="timePeriod" class="form-label">Lựa chọn khoảng thời gian:</label>
                                <select class="form-select" id="timePeriod" name="timePeriod" onchange="this.form.submit()">
                                    <option value="all" ${param.timePeriod == 'all' ? 'selected' : ''}>Tất cả</option>
                                    <option value="1" ${param.timePeriod == '1' ? 'selected' : ''}>1 ngày</option>
                                    <option value="7" ${param.timePeriod == '7' ? 'selected' : ''}>1 tuần</option>
                                    <option value="30" ${param.timePeriod == '30' ? 'selected' : ''}>1 tháng</option>
                                    <option value="90" ${param.timePeriod == '90' ? 'selected' : ''}>3 tháng</option>
                                    <option value="365" ${param.timePeriod == '365' ? 'selected' : ''}>1 năm</option>
                                </select>
                            </span>
                        </form>
                        <div class="card p-3">

                            <div class="row text-center">
                                <div class="col-md-6">
                                    <div class="p-4">
                                        <p class="fw-bold fs-2">Tổng thu</p>
                                        <p class="fs-2 text-success">
                                            + <fmt:formatNumber value="${requestScope.totalRevenue}" type="currency" currencySymbol="₫" groupingUsed="true"  maxFractionDigits="0"/>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-4 ">
                                        <p class="fw-bold fs-2">Tổng chi</p>
                                        <p class="fs-2 text-danger">- 
                                            <fmt:formatNumber value="${requestScope.totalCost}" type="currency" currencySymbol="₫" groupingUsed="true"  maxFractionDigits="0"/>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card mt-3 p-3">

                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label for="filterType">Loại phiếu:</label>
                                    <select id="filterType" class="form-control">
                                        <option value="">Tất cả</option>
                                        <option value="Phiếu Thu">Phiếu Thu</option>
                                        <option value="Phiếu Chi">Phiếu Chi</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="filterReason">Lý do:</label>
                                    <select id="filterReason" class="form-control">
                                        <option value="">Tất cả</option>
                                        <option value="Nhập kho">Nhập kho</option>
                                        <option value="Thu tiền khách trả đầy đủ">Thu tiền khách trả đầy đủ</option>
                                        <option value="Thu tiền khách cọc 50%">Thu tiền khách cọc 50%</option>

                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="filterCreatedBy">Người nộp:</label>
                                    <input type="text" id="filterCreatedBy" class="form-control" placeholder="Nhập người nộp">
                                </div>
                            </div>
                            <table id="transactionTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã phiếu</th>
                                        <th>Loại phiếu</th>
                                        <th>Lý do</th>
                                        <th>Ngày ghi nhận</th>
                                        <th>Người nộp</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listTransactionRecord}" var="ltr">
                                        <tr>
                                            <!-- Mã phiếu: Xanh nếu Phiếu Thu, Đỏ nếu không phải -->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${ltr.type == 'Phiếu Thu'}">
                                                        <span class="text-success">${ltr.referenceId}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-danger">${ltr.referenceId}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>${ltr.type}</td>
                                            <td>${ltr.reason}</td>
                                            <td>${ltr.date}</td>
                                            <td>${ltr.createdBy}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${ltr.type == 'Phiếu Thu'}">
                                                        <span class="text-success">
                                                            +<fmt:formatNumber value="${ltr.amount}" type="currency" currencySymbol="₫" groupingUsed="true" maxFractionDigits="0"/>
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-danger">
                                                            -<fmt:formatNumber value="${ltr.amount}" type="currency" currencySymbol="₫" groupingUsed="true" maxFractionDigits="0"/>
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Page Body End -->
            </div>
        </div>

        <script>
            $(document).ready(function () {
                var table = $('#transactionTable').DataTable({
                    "paging": true, // Bật phân trang
                    "ordering": true, // Cho phép sắp xếp
                    "searching": true, // Bật tìm kiếm
                    "info": true, // Hiển thị số dòng
                    "dom": "tip", // Hiển thị bảng + tìm kiếm + phân trang
                    "lengthMenu": [5, 10, 25, 50], // Tùy chọn số dòng hiển thị
                    "pageLength": 8, // Mặc định hiển thị 5 dòng
                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                        "zeroRecords": "Không tìm thấy dữ liệu phù hợp",
                        "info": "Hiển thị _START_ đến _END_ của tổng _TOTAL_ dòng",
                        "infoEmpty": "Không có dữ liệu",
                        "infoFiltered": "(lọc từ tổng _MAX_ dòng)", // Chuyển sang tiếng Việt
                        "search": "Tìm kiếm:",
                        "paginate": {
                            "first": "Trang đầu",
                            "last": "Trang cuối",
                            "next": "Trang tiếp",
                            "previous": "Trang trước"
                        },
                        "aria": {
                            "sortAscending": ": Sắp xếp tăng dần",
                            "sortDescending": ": Sắp xếp giảm dần"
                        }
                    }
                });

                // Lọc theo Loại phiếu
                $('#filterType').on('change', function () {
                    table.column(1).search(this.value).draw();
                });

                // Lọc theo Lý do
                $('#filterReason').on('change', function () {
                    table.column(2).search(this.value).draw();
                });

                // Lọc theo Người nộp
                $('#filterCreatedBy').on('keyup', function () {
                    table.column(4).search(this.value).draw();
                });
            });
        </script>


        <script src="${pageContext.request.contextPath}/assets2/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/icons/feather-icon/feather-icon.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/simplebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/scrollbar/custom.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script><!--
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

    </body>

</html>