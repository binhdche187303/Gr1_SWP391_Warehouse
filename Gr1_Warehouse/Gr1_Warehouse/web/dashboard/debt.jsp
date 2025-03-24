<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Phiếu nợ</title>

        <!-- Google font-->
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">
        <!-- fontawesome css -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">
        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">
        <!-- ratio css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/ratio.css">
        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">
        <!-- Feather icon css-->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">
        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">
        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">
        <!-- vector map css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vector-map.css">
        <!-- Slick Slider Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/vendors/slick.css">
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
                    <div class="container mt-4">
                        <!-- Tiêu đề Công nợ -->
                        <h2 class="fw-bold text-start mb-4">Công nợ</h2>


                        <!-- Bộ lọc thời gian -->
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <label for="timeFilter" class="form-label fw-bold">Thời gian</label>
                                <input type="month" id="timeFilter" class="form-control">
                            </div>
                        </div>

                        <!-- Tabs Nhà Cung Cấp / Nhà Vận Chuyển -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Nhà cung cấp</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Nhà vận chuyển</a>
                            </li>
                        </ul>

                        <!-- Thông tin công nợ -->
                        <div class="row text-center mt-3">
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="text-muted">Nợ phải trả đầu kỳ</h6>
                                        <p class="text-primary fw-bold fs-5">5.4 triệu</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="text-muted">Nợ phát sinh</h6>
                                        <p class="text-danger fw-bold fs-5">0</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="text-muted">Nợ đã trả</h6>
                                        <p class="text-success fw-bold fs-5">0</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="text-muted">Nợ phải trả cuối kỳ</h6>
                                        <p class="text-primary fw-bold fs-5">5.4 triệu</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bộ lọc tìm kiếm -->
                        <div class="mt-4 d-inline-flex gap-2">
                            <button class="btn btn-outline-secondary">
                                <i class="bi bi-filter"></i> All
                            </button>
                            <button class="btn btn-outline-secondary">
                                <i class="bi bi-filter"></i> Thêm điều kiện lọc
                            </button>
                        </div>


                        <!-- Bảng danh sách nhà cung cấp -->
                        <div class="table-responsive mt-3">
                            <table class="table table-hover table-bordered align-middle text-center">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">Tên nhà cung cấp</th>
                                        <th scope="col">Nợ phải trả đầu kỳ</th>
                                        <th scope="col">Nợ phát sinh</th>
                                        <th scope="col">Nợ đã trả</th>
                                        <th scope="col">Nợ phải trả cuối kỳ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="supplier_management.jsp" class="text-decoration-none">NCC Đồng hồ Automatic</a></td>
                                        <td>5,446,807 đ</td>
                                        <td>0 đ</td>
                                        <td>0 đ</td>
                                        <td>5,446,807 đ</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" class="text-decoration-none">NCC Đồng hồ Auth</a></td>
                                        <td>0 đ</td>
                                        <td>0 đ</td>
                                        <td>0 đ</td>
                                        <td>0 đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Table End->

                </div>
                    <!-- Page Body End -->
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