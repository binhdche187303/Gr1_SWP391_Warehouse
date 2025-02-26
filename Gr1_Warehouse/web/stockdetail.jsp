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
        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Order section Start -->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="table-wrapper">

                            <!-- Dòng chứa nút xuất file (Căn phải) -->
                            <div class="d-flex justify-content-end mb-3">
                                <button class="btn btn-outline-secondary">
                                    <i class="fas fa-file-export"></i> Xuất file
                                </button>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <!-- Card tổng hợp -->
                                <div class="d-flex flex-wrap gap-3 w-100">
                                    <div class="card shadow-sm border-0 p-3 text-center flex-fill">
                                        <h6 class="text-secondary">Tổng lượng tồn</h6>
                                        <p class="fs-4 mb-0">83,800</p>
                                    </div>
                                    <div class="card shadow-sm border-0 p-3 text-center flex-fill">
                                        <h6 class="text-secondary">Tổng giá bán</h6>
                                        <p class="fs-4 mb-0 text-primary">72,548,231 đ</p>
                                    </div>
                                    <div class="card shadow-sm border-0 p-3 text-center flex-fill">
                                        <h6 class="text-secondary">Tổng giá trị</h6>
                                        <p class="fs-4 mb-0 text-info">8,559,298 đ</p>
                                    </div>
                                    <div class="card shadow-sm border-0 p-3 text-center flex-fill">
                                        <h6 class="text-secondary">Tổng lợi nhuận</h6>
                                        <p class="fs-4 mb-0 text-success">63,988,933 đ</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>
                    <!-- Table Start -->
                    <div class="container-fluid">
                        <div class="table-wrapper">
                            <div class="d-flex justify-content-between mb-3">
                                <div class="d-flex flex-wrap gap-2">
                                    <button class="btn btn-primary ">Tất cả</button>
                                    <button class="btn btn-outline-secondary">Tồn lớn hơn 0</button>
                                    <button class="btn btn-outline-secondary">Tồn bằng 0</button>
                                    <button class="btn btn-outline-secondary">Tồn nhỏ hơn 0</button>
                                </div>
                                <button class="btn btn-outline-secondary">
                                    <i class="fas fa-filter"></i> Thêm điều kiện lọc
                                </button>
                            </div>

                            <!-- Bảng không cuộn, mở rộng full width -->
                            <div class="table-container">
                                <table class="table table-striped table-hover table-bordered w-100">
                                    <thead class="text-center text-secondary" style="background-color: #f8f9fa;">
                                        <tr>
                                            <th>
                                                <span class="text-secondary small">Kho</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Sản phẩm</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Sku</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Barcode</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Tồn</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Đặt</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Khả dụng</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">K.K.D</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Giá</span>
                                            </th>
                                            <th>
                                                <span class="text-secondary small">Tổng</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-primary">Kho Shopee</td>
                                            <td class="text-primary">Đầm Lavenham-BC30% - XS / 00 / BF</td>
                                            <td>DR.S.1198.00.BF.XS</td>
                                            <td>DR.S.1198.00.BF</td>
                                            <td class="text-success">16</td>
                                            <td class="text-warning">0</td>
                                            <td class="text-success">16</td>
                                            <td class="text-warning">0</td>
                                            <td>0 đ</td>
                                            <td>0 đ</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div> 
            </div>


            <style>
                .table-container {
                    width: 100%;
                    overflow: hidden;
                }

                .table-wrapper {
                    background-color: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    width: 100%;
                }

            </style>
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