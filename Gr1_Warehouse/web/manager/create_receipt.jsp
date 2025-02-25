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
                    <div class="container mt-4">
                        <h4 class="mb-3">Tạo phiếu chi</h4>
                        <div class="row">
                            <!-- Thông tin phiếu chi -->
                            <div class="col-md-8">
                                <div class="card p-3">
                                    <h5 class="card-title">Thông tin phiếu chi</h5>

                                    <div class="mb-3">
                                        <label class="form-label">Chi vào quỹ</label>
                                        <select class="form-select">
                                            <option>Tiền mặt</option>
                                            <option>Chuyển khoản</option>
                                        </select>
                                    </div>

                                    <!-- Số tiền chi & Lý do chi -->
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Số tiền chi</label>
                                            <input type="text" class="form-control" value="0 đ">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Lý do chi</label>
                                            <input type="text" class="form-control" value="Chi phí sinh hoạt">
                                        </div>
                                    </div>

                                    <!-- Đối tượng nhận & Tên đối tượng nhận -->
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Đối tượng nhận</label>
                                            <select class="form-select">
                                                <option>Khách hàng</option>
                                                <option>Nhà cung cấp</option>
                                                <option selected>Khác</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Tên đối tượng nhận</label>
                                            <input type="text" class="form-control" value="Nhân viên Thanh">
                                        </div>
                                    </div>

                                    <!-- Checkbox Ghi nhận -->
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="ghiNhanCongNo" checked>
                                            <label class="form-check-label" for="ghiNhanCongNo">
                                                Ghi nhận vào công nợ
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="ghiNhanBaoCao">
                                            <label class="form-check-label" for="ghiNhanBaoCao">
                                                Ghi nhận vào báo cáo kết quả kinh doanh
                                            </label>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Ghi chú</label>
                                        <textarea class="form-control" rows="2"></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Thông tin bổ sung -->
                            <div class="col-md-4">
                                <div class="card p-3">
                                    <h5 class="card-title">Thông tin bổ sung</h5>

                                    <div class="mb-3">
                                        <label class="form-label">Chi nhánh tạo phiếu</label>
                                        <select class="form-select">
                                            <option selected>Vui lòng chọn</option>
                                            <option>Chi nhánh A</option>
                                            <option>Chi nhánh B</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Mã tham chiếu</label>
                                        <input type="text" class="form-control" placeholder="Mã tham chiếu">
                                    </div>
                                </div>

                                <!-- Hình ảnh chứng từ -->
                                <div class="card p-3 mt-3 text-center">
                                    <h5 class="card-title">Hình ảnh chứng từ thanh toán</h5>
                                    <div class="border p-3">
                                        <span class="d-block mb-2">📷</span>
                                        <button class="btn btn-outline-primary btn-sm">Thêm ảnh</button>
                                        <p class="text-muted small mt-1">(Tối đa 2 ảnh)</p>
                                    </div>
                                </div>
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
