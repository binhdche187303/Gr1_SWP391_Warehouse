<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Bảng điều khiển</title>

        <!-- Google font-->
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
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
            <!-- Page Body Start-->
            <div class="page-body-wrapper">
                <!-- Page Sidebar Start-->
                <%@ include file="/includes/admin.jsp" %>
                <!-- Page Sidebar Ends-->

                <!-- index body start -->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- chart caard section start -->
                            <div class="col-sm-6 col-xxl-2 col-lg-6">
                                <div class="main-tiles border-5 border-0  card-hover card o-hidden">
                                    <div class="custome-1-bg b-r-4 card-body">
                                        <div class="media align-items-center static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng doanh thu</span>
                                                <h4 class="mb-0 counter">
                                                    <fmt:formatNumber value="${requestScope.totalAmount}" type="currency" currencyCode="VND" maxFractionDigits="0" />
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-2 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-2-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng hóa đơn</span>
                                                <h4 class="mb-0 counter">${requestScope.totalOrder}

                                                </h4>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-2 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0  card o-hidden">
                                    <div class="custome-3-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng sản phẩm</span>
                                                <h4 class="mb-0 counter">${requestScope.totalProduct}

                                                </h4>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-2 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-4-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng người dùng</span>
                                                <h4 class="mb-0 counter">${requestScope.totalUser}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xxl-2 col-lg-6">
                                <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                                    <div class="custome-4-bg b-r-4 card-body">
                                        <div class="media static-top-widget">
                                            <div class="media-body p-0">
                                                <span class="m-0">Tổng nhân viên</span>
                                                <h4 class="mb-0 counter">${requestScope.totalStaff}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- chart card section End -->


                            <!-- Earning chart star-->
                            <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 pb-1">
                                        <div class="card-header-title">
                                            <h4>Tổng thu chi</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="report-chart"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earning chart  end-->

                            <!-- Best Selling Product End -->


                            <!-- Recent orders start-->
                            
                            <!-- Recent orders end-->

                            <!-- Earning chart star-->
                            <div class="col-xl-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0 mb-0">
                                        <div class="card-header-title">
                                            <h4>Earning</h4>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div id="bar-chart-earning"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earning chart end-->


                            <!-- Transactions start-->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card o-hidden card-hover">
                                    <div class="card-header border-0">
                                        <div class="card-header-title">
                                            <h4>Transactions</h4>
                                        </div>
                                    </div>

                                    <div class="card-body pt-0">
                                        <div>
                                            <div class="table-responsive">
                                                <table class="user-table transactions-table table border-0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="transactions-icon">
                                                                    <i class="ri-shield-line"></i>
                                                                </div>
                                                                <div class="transactions-name">
                                                                    <h6>Wallets</h6>
                                                                    <p>Starbucks</p>
                                                                </div>
                                                            </td>

                                                            <td class="lost">-$74</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-color-1">
                                                                <div class="transactions-icon">
                                                                    <i class="ri-check-line"></i>
                                                                </div>
                                                                <div class="transactions-name">
                                                                    <h6>Bank Transfer</h6>
                                                                    <p>Add Money</p>
                                                                </div>
                                                            </td>

                                                            <td class="success">+$125</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-color-2">
                                                                <div class="transactions-icon">
                                                                    <i class="ri-exchange-dollar-line"></i>
                                                                </div>
                                                                <div class="transactions-name">
                                                                    <h6>Paypal</h6>
                                                                    <p>Add Money</p>
                                                                </div>
                                                            </td>

                                                            <td class="lost">-$50</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-color-3">
                                                                <div class="transactions-icon">
                                                                    <i class="ri-bank-card-line"></i>
                                                                </div>
                                                                <div class="transactions-name">
                                                                    <h6>Mastercard</h6>
                                                                    <p>Ordered Food</p>
                                                                </div>
                                                            </td>

                                                            <td class="lost">-$40</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="td-color-4 pb-0">
                                                                <div class="transactions-icon">
                                                                    <i class="ri-bar-chart-grouped-line"></i>
                                                                </div>
                                                                <div class="transactions-name">
                                                                    <h6>Transfer</h6>
                                                                    <p>Refund</p>
                                                                </div>
                                                            </td>

                                                            <td class="success pb-0">+$90</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Transactions end-->

                            <!-- visitors chart start-->
                            <div class="col-xxl-4 col-md-6">
                                <div class="h-100">
                                    <div class="card o-hidden card-hover">
                                        <div class="card-header border-0">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="card-header-title">
                                                    <h4>Visitors</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            <div class="pie-chart">
                                                <div id="pie-chart-visitors"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- visitors chart end-->
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->
                </div>
                <!-- index body end -->

            </div>
            <!-- Page Body End -->
        </div>
        <!-- page-wrapper End-->

        <!-- latest js -->
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap js -->
        <script src="assets/js/bootstrap/bootstrap.bundle.min.js"></script>

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
    <!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
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