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
                <form method="POST" enctype="multipart/form-data" id="importForm">
                    <div class="page-body">
                        <!-- Table Start -->
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card card-table">
                                        <div class="card-body">
                                            <div class="title-header option-title">
                                                <h5>Phiếu kiểm kho</h5>
                                                <div class="d-inline-flex gap-2">
                                                </div>
                                            </div>

                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                            <div class="border-bottom pb-2 mb-2">
                                                                <h4 class="text-lg font-semibold">Người giám sát kiểm kê: </h4>
                                                            </div>

                                                            <!-- Dropdown chọn nhà cung cấp -->
                                                            <label for="supplierDropdown" class="font-medium">Chọn người giám sát:</label>
                                                            <select id="supplierDropdown" class="form-control font-medium" name="supplierId">
                                                                <option value="">Chọn người giám sát</option>
                                                                <!-- Các option sẽ được thêm vào bằng JavaScript -->
                                                            </select>

                                                           
                                                            <div id="supplierDetails" class="mt-3">
                                                                <p><strong>Tên người giám sát:</strong> <span id="supplierName"></span></p>
                                                                <p><strong>Điện thoại:</strong> <span id="supplierPhone"></span></p>
                                                                <p><strong>Email:</strong> <span id="supplierEmail"></span></p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Các phần khác, ví dụ như Kho nhập -->
                                                    <div class="col-md-6">
                                                        <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                            <div class="border-bottom pb-2 mb-2">
                                                                <h4 class="text-lg font-semibold">Kho lưu trữ hàng</h4>
                                                            </div>

                                                            <!-- Dropdown chọn kho lưu -->
                                                            <label for="warehouseDropdown" class="font-medium">Chọn kho lưu trữ:</label>
                                                            <select id="warehouseDropdown" class="form-select" name="warehouseId" onchange="updateWarehouseDetails(this)">
                                                                <option value="" disabled selected>Chọn kho lưu trữ</option>
                                                                <!-- Các option sẽ được thêm vào bằng JavaScript -->
                                                            </select>

                                                            <!-- Thông tin chi tiết -->
                                                            <div class="mt-3">
                                                                <p><strong>Tên kho lưu trữ:</strong> <span id="warehouseName"></span></p>
                                                                <p><strong>Địa chỉ:</strong> <span id="warehouseAddress"></span></p>
                                                                <p><strong>Điện thoại:</strong> <span id="warehousePhone"></span></p>
<!--                                                                <p><strong></strong> <span id=""></span></p>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phần sản phẩm -->
                                    <div class="container mt-4">
                                        <div class="border border-gray-300 rounded-lg shadow-sm p-4 bg-white">
                                            <div class="border-bottom pb-2 mb-2">
                                                <h3 class="text-lg font-semibold">Sản phẩm</h3>
                                            </div>
                                            <div class="mb-4">
                                                <div class="row">
                                                    <div class="col-md-9 d-flex align-items-center">
                                                        <div class="input-group w-100">
                                                            <div class="input-group-prepend">
                                                                <select class="form-control">
                                                                    <option value="sku">Tìm kiếm SKU</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" class="form-control flex-grow-2" placeholder="Tìm kiếm sản phẩm">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 d-flex align-items-center">
                                                        <!-- Button mở modal -->
                                                        <button class="btn btn-outline-primary w-auto">
                                                            Tìm kiếm
                                                        </button>
                                                    </div>

                                                </div>
                                            </div>
                                            <div id="selectedProductContainer" class="mt-3"></div>
                                            <div class="modal fade" id="searchProductModal" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Danh sách sản phẩm</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <td>Chọn</td>
                                                                        <td>Tên sản phẩm</td>
                                                                        <td>SKU</td>
                                                                        <td>Phân loại</td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="productTable"></tbody> <!-- JS sẽ render sản phẩm vào đây -->
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <button type="button" class="btn btn-primary">Hoàn tất chọn</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center mt-4">
                                                <button class="btn btn-outline-primary" id="openProductModal">
                                                    Xem danh sách sản phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phần thông tin nhập hàng -->
                                    <div class="container mt-4">
                                        <div class="row">
                                            <!-- Left Section -->
                                            <div class="col-12 col-lg-6 mb-4">
                                                <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                    <div class="mb-4">
                                                        <label class="form-label">Nhân viên kiểm kê: </label>
                                                        <textarea id="#" name="#" class="form-control" placeholder="Nhập tên nhân viên kiểm kê"></textarea>
                                                    </div>
                                                    <div class="mb-4">
                                                        <label class="form-label">Ghi chú</label>
                                                        <textarea id="notes" name="notes" class="form-control" placeholder="Nhập ghi chú"></textarea>
                                                    </div>
<!--                                                    <div class="mb-4">
                                                        <label class="form-label">Tải ảnh phiếu nhập hàng</label>
                                                        <input type="file" class="form-control" id="billImgUrl" name="billImgUrl" accept=".png, .jpg, .jpeg, .pdf" required>
                                                    </div>-->
                                                </div>
                                            </div>

                                            <!-- Right Section -->
                                            <div class="col-12 col-lg-6">
                                                <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                    <h3 class="mb-4">Tổng kết</h3>
                                                    <div class="d-flex justify-content-between mb-2">
                                                        <span class="text-gray-700">Số lượng lệch tăng</span>
                                                        <span id="totalQuantity" name="totalQuantity">0</span>
                                                    </div>

                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Số lượng lệch tăng</span>
                                                        <span id="totalAmount" name="totalAmount">0</span>
                                                    </div>
                                                    
                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Giá trị lệch tăng</span>
                                                        <span id="totalAmount" name="totalAmount">0 VND</span>
                                                    </div>

                                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                                        <span class="text-gray-700">Giá trị lệch giảm</span>
                                                        <span id="totalAmount" name="totalAmount">0 VND</span>
                                                    </div>


                                                    <button id="submitOrderBtn" class="w-100 btn btn-primary" type="submit">Hoàn tất</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- Table End -->
            </div>
            <!-- Page Body End -->
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
