<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
    <title>Báo cáo</title>

    <!-- Google font-->
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- Linear Icon css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">

    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">

    <!-- Fontawesome css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">

    <!-- Themify icon css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

    <!-- ratio css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/ratio.css">

    <!-- Feather icon css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">

    <!-- datepicker css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/date-picker.css">

    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

    <!-- vector map css  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vector-map.css">

    <!-- slick slider css-->
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

                <form class="form-inline search-full" action="javascript:void(0)" method="get">
                    <div class="form-group w-100">
                        <div class="Typeahead Typeahead--twitterUsers">
                            <div class="u-posRelative">
                                <input class="demo-input Typeahead-input form-control-plaintext w-100" type="text"
                                    placeholder="Search Fastkart .." name="q" title="" autofocus>
                                <i class="close-search" data-feather="x"></i>
                                <div class="spinner-border Typeahead-spinner" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                            <div class="Typeahead-menu"></div>
                        </div>
                    </div>
                </form>
                <div class="nav-right col-6 pull-right right-header p-0">
                    <ul class="nav-menus">
                        <li>
                            <span class="header-search">
                                <i class="ri-search-line"></i>
                            </span>
                        </li>
                        <li class="onhover-dropdown">
                            <div class="notification-box">
                                <i class="ri-notification-line"></i>
                                <span class="badge rounded-pill badge-theme">4</span>
                            </div>
                            <ul class="notification-dropdown onhover-show-div">
                                <li>
                                    <i class="ri-notification-line"></i>
                                    <h6 class="f-18 mb-0">Notitications</h6>
                                </li>
                                <li>
                                    <p>
                                        <i class="fa fa-circle me-2 font-primary"></i>Delivery processing <span
                                            class="pull-right">10 min.</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <i class="fa fa-circle me-2 font-success"></i>Order Complete<span
                                            class="pull-right">1 hr</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <i class="fa fa-circle me-2 font-info"></i>Tickets Generated<span
                                            class="pull-right">3 hr</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <i class="fa fa-circle me-2 font-danger"></i>Delivery Complete<span
                                            class="pull-right">6 hr</span>
                                    </p>
                                </li>
                                <li>
                                    <a class="btn btn-primary" href="javascript:void(0)">Check all notification</a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <div class="mode">
                                <i class="ri-moon-line"></i>
                            </div>
                        </li>
                        <li class="profile-nav onhover-dropdown pe-0 me-0">
                            <div class="media profile-media">
                                <img class="user-profile rounded-circle" src="${pageContext.request.contextPath}/assets2/images/users/4.jpg" alt="">
                                <div class="user-name-hide media-body">
                                    <span>Emay Walter</span>
                                    <p class="mb-0 font-roboto">Admin<i class="middle ri-arrow-down-s-line"></i></p>
                                </div>
                            </div>
                            <ul class="profile-dropdown onhover-show-div">
                                <li>
                                    <a href="all-users.html">
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
                                        <span>Spports Tickets</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="profile-setting.html">
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
            <%@ include file="/includes/admin.jsp" %>
            <!-- Page Sidebar Ends-->

            <!-- Reports Section Start -->
            <div class="page-body">
                <!-- Container-fluid starts-->
                <div class="container-fluid">
                    <div class="row">
                        <!-- Salery Summy star-->
                        <div class="col-xl-8 col-lg-12 col-md-6">
                            <div class="card o-hidden">
                                <div class="card-header border-0 pb-1">
                                    <div class="card-header-title">
                                        <h4>Sales Summary</h4>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div id="saler-summary"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Salery Summy end-->

                        <!-- Employ Salary  start-->
                        <div class="col-xl-4 col-lg-12 col-md-6">
                            <div class="h-100">
                                <div class="card o-hidden">
                                    <div class="card-header border-0 pb-1">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="card-header-title">
                                                <h4>Employees Satisfied</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="pie-chart">
                                            <div id="employ-salary"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Employ Salary end-->

                        <!-- Expenses star-->
                        <div class="col-xl-4 col-lg-12 col-md-6">
                            <div class="card o-hidden">
                                <div class="card-header border-0 pb-1">
                                    <div class="card-header-title">
                                        <h4>Expenses</h4>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div id="expenses-cart"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Expenses end-->

                        <!-- Sales / Purchase chart start -->
                        <div class="col-xl-8 col-lg-12 col-md-6">
                            <div class="card">
                                <div class="card-header border-0 pb-1">
                                    <div class="card-header-title">
                                        <h4>Sales / Purchase</h4>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div id="sales-purchase-chart"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Sales / Purchase chart end -->

                        <!-- Sales / Purchase Return star-->
                        <div class="col-12">
                            <div class="card o-hidden">
                                <div class="card-header border-0 pb-1">
                                    <div class="card-header-title">
                                        <h4>Sales / Purchase Return</h4>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div id="sales-purchase-return-cart"></div>
                                </div>
                            </div>
                        </div>
                        <!-- Sales / Purchase Return end-->

                        <!-- Booking history start-->
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header border-0 pb-1">
                                    <div class="card-header-title">
                                        <h4>Transfer History</h4>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div>
                                        <div class="table-responsive">
                                            <table class="user-table list-table table">
                                                <thead>
                                                    <tr>
                                                        <th>Transfer Id</th>
                                                        <th>Name</th>
                                                        <th>Date</th>
                                                        <th>Total</th>
                                                        <th>Options</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>14783112</td>
                                                        <td>Gray Brody</td>
                                                        <td>20-05-2020</td>
                                                        <td>$369</td>
                                                        <td>
                                                            <ul>
                                                                <li>
                                                                    <a href="order-detail.html">
                                                                        <span class="ri-eye-line"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-pencil"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-trash"></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>87541221</td>
                                                        <td>Perez Alonzo</td>
                                                        <td>07-12-2020</td>
                                                        <td>$546</td>
                                                        <td>
                                                            <ul>
                                                                <li>
                                                                    <a href="order-detail.html">
                                                                        <span class="ri-eye-line"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-pencil"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-trash"></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>213514462</td>
                                                        <td>woters maxine</td>
                                                        <td>12-12-2020</td>
                                                        <td>$369</td>
                                                        <td>
                                                            <ul>
                                                                <li>
                                                                    <a href="order-detail.html">
                                                                        <span class="ri-eye-line"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-pencil"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-trash"></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>235896144</td>
                                                        <td>christian</td>
                                                        <td>16-05-2020</td>
                                                        <td>$4699</td>
                                                        <td>
                                                            <ul>
                                                                <li>
                                                                    <a href="order-detail.html">
                                                                        <span class="ri-eye-line"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-pencil"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-trash"></span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>461178242</td>
                                                        <td>Lane Skylar</td>
                                                        <td>25-10-2020</td>
                                                        <td>$1342</td>
                                                        <td>
                                                            <ul>
                                                                <li>
                                                                    <a href="order-detail.html">
                                                                        <span class="ri-eye-line"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-pencil"></span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0)">
                                                                        <span class="lnr lnr-trash"></span>
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
                        <!-- Booking history  end-->
                    </div>
                </div>
                <!-- Container-fluid Ends-->
            </div>
            <!-- Reports Section End -->
        </div>
        <!-- Page Body End-->
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

    <!-- Sidebar js -->
    <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

    <!-- tooltip init js -->
    <script src="${pageContext.request.contextPath}/assets2/js/tooltip-init.js"></script>

    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

    <!-- Apexchar js -->
    <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/apex-chart1.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/apex-chart.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/stock-prices.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/chart/apex-chart/chart-custom.js"></script>

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