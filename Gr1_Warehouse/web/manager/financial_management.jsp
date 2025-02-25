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
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h2 class="fw-bold">Sổ Quỹ</h2>
                            <div class="d-flex gap-2">
                                <button class="btn btn-primary">Tạo phiếu thu</button>
                                <a href="create_receipt.jsp" class="btn btn-primary">Tạo phiếu chi</a>
                            </div>

                        </div>


                        <div class="card p-3">
                            <div class="row text-center">
                                <div class="col-md-3">
                                    <div class="p-4 ">
                                        <p class="fw-bold fs-2">Số dư đầu kỳ</p>
                                        <p class="fs-2 text-dark">2 tỷ</p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="p-4">
                                        <p class="fw-bold fs-2">Tổng thu</p>
                                        <p class="fs-2 text-success">+40.2 triệu</p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="p-4 ">
                                        <p class="fw-bold fs-2">Tổng chi</p>
                                        <p class="fs-2 text-danger">-16.1 triệu</p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="p-4">
                                        <p class="fw-bold fs-2">Số dư cuối kỳ</p>
                                        <p class="fs-2 text-dark">2 tỷ</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card mt-3 p-3">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-secondary">Tất cả</button>
                                    <button class="btn btn-outline-secondary">Phiếu chi</button>
                                    <button class="btn btn-outline-secondary">Phiếu thu</button>
                                </div>
                                <input type="text" class="form-control w-25" placeholder="Tìm theo mã phiếu, mã tham chiếu">
                            </div>


                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã phiếu</th>
                                        <th>Loại phiếu</th>
                                        <th>Lý do</th>
                                        <th>Ngày ghi nhận</th>
                                        <th>Người nộp/nhận</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>CR00102338</td>
                                        <td>Phiếu thu</td>
                                        <td>Thu tiền khách trả</td>
                                        <td>Hôm nay 09:37 SA</td>
                                        <td>Phan Thị Thùy Phương</td>
                                        <td class="text-success">+1,000,000 đ</td>
                                    </tr>
                                    <tr>
                                        <td>CR00102337</td>
                                        <td>Phiếu thu</td>
                                        <td>Trúng số</td>
                                        <td>26/11/2024 03:50 CH</td>
                                        <td>Đại lý tân bình</td>
                                        <td class="text-success">+2,000,000 đ</td>
                                    </tr>
                                    <tr>
                                        <td>CP00100690</td>
                                        <td>Phiếu chi</td>
                                        <td>Bảng hiệu văn phòng</td>
                                        <td>26/11/2024 03:21 CH</td>
                                        <td>Công ty biển hiệu</td>
                                        <td class="text-danger">-500,000 đ</td>
                                    </tr>
                                    <tr>
                                        <td>CP00100595</td>
                                        <td>Phiếu chi</td>
                                        <td>Chiết khấu đại lý tân bình</td>
                                        <td>26/11/2024 03:14 CH</td>
                                        <td>Nhà cung cấp</td>
                                        <td class="text-danger">-41,800 đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
