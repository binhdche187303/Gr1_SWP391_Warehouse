<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- tap on top start -->
        <div class="tap-top">
            <span class="lnr lnr-chevron-up"></span>
        </div>
        <!-- tap on tap end -->

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Header Start-->
            <div class="page-header">
                <div class="header-wrapper m-0">
                    <div class="header-logo-wrapper p-0">
                        <div class="logo-wrapper">
                            <a href="index.html">
                                <img class="img-fluid main-logo" src="assets/images/logo/1.png" alt="logo">
                                <img class="img-fluid white-logo" src="assets/images/logo/1-white.png" alt="logo">
                            </a>
                        </div>
                        <div class="toggle-sidebar">
                            <i class="status_toggle middle sidebar-toggle" data-feather="align-center"></i>
                            <a href="index.html">
                                <img src="assets/images/logo/1.png" class="img-fluid" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="nav-right col-6 pull-right right-header p-0">
                        <ul class="nav-menus">
                            <li>
                                <span class="header-search">
                                    <i class="ri-search-line"></i>
                                </span>
                            </li>

                            <li class="profile-nav onhover-dropdown pe-0 me-0">
                                <div class="media profile-media">

                                    <div class="user-name-hide media-body">
                                        <span>${sessionScope.acc.username}</span>

                                        <p class="mb-0 font-roboto">Admin<i class="middle ri-arrow-down-s-line"></i></p>
                                    </div>
                                </div>
                                <ul class="profile-dropdown onhover-show-div">
                                    <li>
                                        <a href="allusers">
                                            <i data-feather="users"></i>
                                            <span>Users</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="order-list.html">
                                            <i data-feather="archive"></i>
                                            <span>Orders</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="support-ticket.html">
                                            <i data-feather="phone"></i>
                                            <span>Sports Tickets</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/Gr1_Warehouse/profilesettingadmin">
                                            <i data-feather="settings"></i>
                                            <span>Settings</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                           href="javascript:void(0)">
                                            <i data-feather="log-out"></i>
                                            <span>Log out</span>
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
                                <img class="img-fluid for-white" src="assets/images/logo/full-white.png" alt="logo">
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
                                <img class="img-fluid main-logo main-white" src="assets/images/logo/logo.png" alt="logo">
                                <img class="img-fluid main-logo main-dark" src="assets/images/logo/logo-white.png"
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
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/dashboard">
                                            <i class="ri-home-line"></i>
                                            <span>Dashboard</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/financialmanagement">
                                            <i class="ri-store-3-line"></i>
                                            <span>Quản lý thu chi</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-user-3-line"></i>
                                            <span>Tài khoản</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/allusers">Khách hàng</a>
                                            </li>
                                            <li>
                                                <a href="/Gr1_Warehouse/allstaff">Nhân viên</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-store-3-line"></i>
                                            <span>Quản lý sản phẩm</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/productlist">Danh sách sản phẩm</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/createproductgeneral">Tạo sản phẩm mới</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/role">
                                            <i class="ri-star-line"></i>
                                            <span>Vai trò</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-price-tag-3-line"></i>
                                            <span>Giảm giá hóa đơn</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/couponlist">Danh sách giảm giá</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/createcoupon">Tạo mã giảm giá</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/listdiscounthistory">Lịch sử mã giảm giá</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-price-tag-3-line"></i>
                                            <span>Giảm giá sản phẩm</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/couponproductlist">Danh sách giảm giá</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-store-3-line"></i>
                                            <span>Quản lí thương hiệu</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/brandlist">Danh sách thương hiệu</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/createbrand">Tạo thương hiệu mới</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-store-3-line"></i>
                                            <span>Quản lí thể loại</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/categorylist">Danh sách thể loại</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/createcategory">Tạo thể loại mới</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="sidebar-list">
                                        <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                            <i class="ri-store-3-line"></i>
                                            <span>Quản lí kích cỡ sản phẩm</span>
                                        </a>
                                        <ul class="sidebar-submenu">
                                            <li>
                                                <a href="/Gr1_Warehouse/sizelist">Danh sách kích cỡ</a>
                                            </li>

                                            <li>
                                                <a href="/Gr1_Warehouse/createsize">Tạo kích cỡ mới</a>
                                            </li>
                                        </ul>
                                    </li>



                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/profilesettingadmin">
                                            <i class="ri-file-chart-line"></i>
                                            <span>Cài đặt</span>
                                        </a>
                                    </li>                                 

                                    <li class="sidebar-list">
                                        <a class="sidebar-link sidebar-title link-nav" href="/Gr1_Warehouse/dashboard/report.jsp">
                                            <i class="ri-file-chart-line"></i>
                                            <span>Báo cáo</span>
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
                            <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                            <p>Are you sure you want to log out?</p>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <div class="button-box">
                                <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                                <a href="<%= request.getContextPath() %>/logout" class="btn btn--yes btn-primary">Yes</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal End -->
        </div>
        <!-- page-wrapper End-->


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
<!--        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>-->

        <!-- tooltip init js -->
        <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>

        <!-- Plugins JS -->
<!--        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>-->
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