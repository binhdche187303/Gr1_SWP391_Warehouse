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
        <%@ include file="/manager/manager_dashboard.jsp" %>
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Order section Start -->
                <div class="page-body">
                    <!-- Table Start -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="row align-items-stretch">
                                <!-- Thông tin nhà cung cấp -->
                                <div class="col-lg-8">
                                    <div class="card p-3 h-100">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar bg-primary text-white rounded-circle p-3 me-3">
                                                HA
                                            </div>
                                            <div>
                                                <h5 class="mb-1">NCC Đồng Hồ Automatic <span class="badge bg-success">Đang hoạt động</span></h5>
                                                <p class="text-muted mb-1">TNHH MTV Hồng Ân</p>
                                                <p class="text-muted">Mã số thuế 215123411231</p>
                                            </div>
                                        </div>

                                        <!-- Căn giữa phần thông tin tài chính -->
                                        <div class="row mt-3 d-flex justify-content-center text-center">
                                            <div class="col-md-6">
                                                <h6 class="text-muted">Nợ phải trả</h6>
                                                <h4 class="text-danger">5,446,807 ₫</h4>
                                            </div>
                                            <div class="col-md-6">
                                                <h6 class="text-muted">Tổng mua</h6>
                                                <h4>18,613,035 ₫</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Thông tin liên hệ -->
                                <div class="col-lg-4">
                                    <div class="card p-3 h-100">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5>Thông Tin Liên Hệ</h5>
                                            <button class="btn btn-sm btn-outline-secondary">✏️</button>
                                        </div>
                                        <p class="mb-1"><strong>Nguyễn Hồng Ân</strong></p>
                                        <p class="text-primary">hongan@automatic.com</p>
                                        <p class="text-primary">0912151245</p>
                                        <h6 class="mt-3">Địa Chỉ</h6>
                                        <p class="text-muted">182 Lê Đại Hành, Quận 8, TP. Hồ Chí Minh</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Tabs lịch sử -->
                        <div class="card mt-3">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Lịch sử đặt hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Lịch sử nhập / trả hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Nợ phải trả</a>
                                </li>
                            </ul>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Mã phiếu</th>
                                            <th>Thời gian</th>
                                            <th>Trạng thái</th>
                                            <th>Tổng cộng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">PO100011</a></td>
                                            <td>31/03/2022 17:01 CH</td>
                                            <td>Nhập một phần</td>
                                            <td>1,597,500 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100009</a></td>
                                            <td>31/03/2022 09:42 SA</td>
                                            <td>Chờ nhập</td>
                                            <td>195,454 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100008</a></td>
                                            <td>23/03/2022 08:14 SA</td>
                                            <td>Chờ nhập</td>
                                            <td>2,077,270 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100006</a></td>
                                            <td>11/03/2022 16:57 CH</td>
                                            <td>Nhập một phần</td>
                                            <td>1,637,270 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100005</a></td>
                                            <td>04/03/2022 12:46 CH</td>
                                            <td>Hoàn thành</td>
                                            <td>2,000,000 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100004</a></td>
                                            <td>04/03/2022 12:46 CH</td>
                                            <td>Hoàn thành</td>
                                            <td>2,000,000 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100003</a></td>
                                            <td>04/03/2022 09:56 SA</td>
                                            <td>Hoàn thành</td>
                                            <td>3,500,000 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100002</a></td>
                                            <td>04/03/2022 09:50 SA</td>
                                            <td>Chờ nhập</td>
                                            <td>3,500,000 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100001</a></td>
                                            <td>04/03/2022 08:26 SA</td>
                                            <td>Nhập một phần</td>
                                            <td>12,000,000 ₫</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">PO100000</a></td>
                                            <td>04/03/2022 08:24 SA</td>
                                            <td>Chờ nhập</td>
                                            <td>2,000,000 ₫</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Table End -->

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
