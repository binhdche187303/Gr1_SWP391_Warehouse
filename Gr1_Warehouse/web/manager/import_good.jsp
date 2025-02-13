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
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Order section Start -->
                <div class="page-body">
                    <!-- Table Start -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Danh sách phiếu nhập hàng</h5>
                                            <div class="d-inline-flex gap-2">
                                                <a href="#" class="btn btn-solid">Xuất dữ liệu</a>
                                                <a href="/Gr1_Warehouse/handleImport" class="btn btn-solid">Tạo phiếu nhập kho</a>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <table class="table all-package order-table theme-table" id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã phiếu nhập</th>
                                                            <th>Thời gian nhập</th>
                                                            <th>Nhà cung cấp</th>
                                                            <th>Trạng thái</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Còn nợ</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 406-4883635</td>

                                                            <td>Jul 20, 2022</td>

                                                            <td>Paypal</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 573-685572</td>

                                                            <td>Jul 25, 2022</td>

                                                            <td>Paypal</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 759-4568734</td>

                                                            <td>Jul 29, 2022</td>

                                                            <td>Stripe</td>

                                                            <td class="order-pending">
                                                                <span>Pending</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 546-7664537</td>

                                                            <td>Jul 30, 2022</td>

                                                            <td>Paypal</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 479-7533144</td>

                                                            <td>Aug 01, 2022</td>

                                                            <td>Stripe</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 456-1245789</td>

                                                            <td>Aug 10, 2022</td>

                                                            <td>Stripe</td>

                                                            <td class="order-cancle">
                                                                <span>Cancel</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">


                                                            <td> 057-3657895</td>

                                                            <td>Aug 18, 2022</td>

                                                            <td>Paypal</td>

                                                            <td class="order-cancle">
                                                                <span>Cancel</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">

                                                            <td> 123-1234567</td>

                                                            <td>Aug 29, 2022</td>

                                                            <td>Paypla</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">


                                                            <td> 987-9876543</td>

                                                            <td>Sep 09, 2022</td>

                                                            <td>Paypal</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">


                                                            <td> 147-3692584</td>

                                                            <td>Sep 17, 2022</td>

                                                            <td>Stripe</td>

                                                            <td class="order-success">
                                                                <span>Success</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>

                                                        <tr data-bs-toggle="offcanvas" href="#order-details">


                                                            <td> 586-5865224</td>

                                                            <td>Sep 20, 2022</td>

                                                            <td>Stripe</td>

                                                            <td class="order-pending">
                                                                <span>Pending</span>
                                                            </td>

                                                            <td>$15</td>

                                                            <td>
                                                                <ul>
                                                                    <li>
                                                                        <a href="order-detail.html">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)">
                                                                            <i class="ri-pencil-line"></i>
                                                                        </a>
                                                                    </li>

                                                                    <li>
                                                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                           data-bs-target="#exampleModalToggle">
                                                                            <i class="ri-delete-bin-line"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a class="btn btn-sm btn-solid text-white"
                                                                           href="order-tracking.html">
                                                                            Tracking
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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