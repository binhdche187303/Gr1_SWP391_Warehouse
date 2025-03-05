<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <%@ include file="/manager/manager_dashboard.jsp" %>

        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="table-wrapper">
                            <div class="container mt-4">
                                <!-- Action Buttons -->
                                <div class="d-flex align-items-center mb-4">

                                    <button class="btn btn-outline-secondary me-2">Tất cả</button>
                                    <button class="btn btn-outline-secondary me-2">Thêm điều kiện lọc</button>
                                    <input class="form-control w-auto ms-auto" placeholder="Tìm theo mã phiếu" type="text">
                                </div>

                                <!-- Table -->
                                <div class="bg-white p-4 rounded shadow-sm">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th><small>Mã phiếu</small></th>
                                                <th><small>Kho kiểm</small></th>
                                                <th><small>Trạng thái</small></th>
                                                <th><small>Ngày tạo</small></th>
                                                <th><small>Ngày kiểm</small></th>
                                                <th><small>Số lượng lệch</small></th>
                                                <th><small>Tổng giá trị hàng lệch</small></th>
                                                <th><small></small></th>
                                            </tr>
                                        </thead>


                                        <tbody>
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
                                                    <td><small>0 <i class="fas fa-arrow-up text-success"></i><br>-7 <i class="fas fa-arrow-down text-danger"></i></small></td>
                                                    <td><small>-3,958,019 ₫</small></td>
                                                    <td>
                                                        <ul class="d-flex align-items-center p-0 m-0" style="list-style: none;">
                                                            <li class="me-2">
                                                                <a href="#">
                                                                    <i class="ri-eye-line"></i>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <form action="/Gr1_Warehouse/staff-checklist-details" method="get">
                                                                    <input type="hidden" name="checkId" value="${check.checkId}">
                                                                    <button type="submit" style="background: none; border: none;">
                                                                        <i class="ri-pencil-line"></i>
                                                                    </button>
                                                                </form>
                                                            </li>
                                                        </ul>
                                                    </td>

                                                </tr>
                                            </c:forEach>

                                            <!-- Repeat rows as needed -->
                                        </tbody>
                                    </table>
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

