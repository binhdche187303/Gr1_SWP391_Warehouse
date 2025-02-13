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
                    <!-- Table Start -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Phiếu nhập hàng</h5>
                                            <div class="d-inline-flex gap-2">
                                            </div>
                                        </div>

                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                        <div class="border-bottom pb-2 mb-2">
                                                            <h4 class="text-lg font-semibold">Nhà cung cấp</h4>
                                                        </div>
                                                        <div>
                                                            <p class="font-medium">Tên : </p>
                                                            <p class="text-gray-600">Địa chỉ : </p>
                                                            <p class="mt-2">Còn nợ <span class="font-bold"></span></p>
                                                            <!-- Sử dụng button thay vì link -->
                                                            <button type="button" class="btn btn-info" 
                                                                    data-supplier-name="${supplier.supplierName}" 
                                                                    data-phone="${supplier.phone}" 
                                                                    data-email="${supplier.email}" 
                                                                    data-address="${supplier.address}"
                                                                    onclick="showSupplierDetails(this)">
                                                                Xem chi tiết
                                                            </button>
                                                        </div>
                                                        <div>
                                                            <!-- Modal để chọn nhà cung cấp -->                                                            <div class="modal fade" id="supplierModal" tabindex="-1" aria-labelledby="supplierModalLabel" aria-hidden="true">
                                                                <!-- Modal để chọn nhà cung cấp -->
                                                                <div class="modal fade" id="supplierModal" tabindex="-1" aria-labelledby="supplierModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="supplierModalLabel">Chi tiết nhà cung cấp</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <!-- Thông tin chi tiết nhà cung cấp -->
                                                                                <div>
                                                                                    <p><strong>Tên nhà cung cấp: </strong><span id="supplierName"></span></p>
                                                                                    <p><strong>Địa chỉ: </strong><span id="supplierAddress"></span></p>
                                                                                    <p><strong>Điện thoại: </strong><span id="supplierPhone"></span></p>
                                                                                    <p><strong>Email: </strong><span id="supplierEmail"></span></p>
                                                                                </div>

                                                                                <!-- Danh sách nhà cung cấp -->
                                                                                <ul id="supplierList">
                                                                                    <!-- Dữ liệu sẽ được chèn vào đây -->
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>



                                                <!-- Các phần khác, ví dụ như Kho nhập -->
                                                <div class="col-md-6">
                                                    <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                        <div class="border-bottom pb-2 mb-2">
                                                            <h4 class="text-lg font-semibold">Kho nhập</h4>
                                                        </div>
                                                        <div>
                                                            <p class="font-medium">Tên : </p>
                                                            <p class="text-gray-600">Địa chỉ : </p>
                                                            <p class="mt-2">Còn nợ <span class="font-bold"></span></p>
                                                            <a href="#" class="text-blue-500">Xem chi tiết</a>
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
                                                                <option value="barcode">Quét Barcode</option>
                                                                <option value="sku">Tìm kiếm SKU</option>
                                                            </select>
                                                        </div>
                                                        <!-- Tăng chiều rộng cho ô tìm kiếm -->
                                                        <input type="text" class="form-control flex-grow-2" placeholder="Tìm kiếm sản phẩm">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 d-flex align-items-center">
                                                    <button class="btn btn-outline-primary w-auto">Tìm kiếm</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center mt-4">
                                            <div class="d-flex justify-content-center">
                                                <button class="btn btn-outline-secondary px-4 py-2 mr-2">Tải file mẫu nhập sản phẩm</button>
                                                <button class="btn btn-outline-primary px-4 py-2">Nhập vào hệ thống</button>
                                            </div>
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
                                                    <label class="form-label">Nhân viên xử lý</label>
                                                    <input type="text" value"" class="form-control">
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Mã tham chiếu</label>
                                                    <input type="text" value="" class="form-control">
                                                </div>
                                                <div>
                                                    <label class="form-label">Ghi chú</label>
                                                    <textarea class="form-control" placeholder="Nhập ghi chú"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right Section -->
                                        <div class="col-12 col-lg-6">
                                            <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                <h3 class="mb-4">Giá trị nhập</h3>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Tổng số lượng nhập</span>
                                                    <span class="text-gray-700">40</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Tổng tiền hàng</span>
                                                    <span class="text-gray-700">1,286,979 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-blue-500">Chiết khấu</span>
                                                    <span class="text-gray-700">0 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-blue-500">Chi phí khác (trả NCC)</span>
                                                    <span class="text-gray-700">257,396 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Cần trả nhà cung cấp</span>
                                                    <span class="text-gray-700">1,544,375 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-blue-500">Chi phí nhập khác</span>
                                                    <span class="text-gray-700">178,698 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700 font-weight-bold">Tổng giá trị nhập hàng</span>
                                                    <span class="text-gray-700 font-weight-bold">1,723,073 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Tiền trả NCC</span>
                                                    <span class="text-gray-700">0 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Tiền trả chi phí nhập khác</span>
                                                    <span class="text-gray-700">0 đ</span>
                                                </div>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <span class="text-gray-700 font-weight-bold">Còn nợ</span>
                                                    <span class="text-gray-700 font-weight-bold">1,723,073 đ</span>
                                                </div>
                                                <button class="w-100 btn btn-primary">Nhập hàng</button>
                                            </div>
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

        <script>
            // Hàm hiển thị modal và cập nhật thông tin chi tiết nhà cung cấp
            function showSupplierDetails(button) {
                // Lấy dữ liệu từ các thuộc tính data-* của nút bấm
                var supplierName = button.getAttribute('data-supplier-name');
                var phone = button.getAttribute('data-phone');
                var email = button.getAttribute('data-email');
                var address = button.getAttribute('data-address');

                // Cập nhật thông tin nhà cung cấp vào modal
                document.getElementById('supplierName').innerText = supplierName;
                document.getElementById('supplierAddress').innerText = address;
                document.getElementById('supplierPhone').innerText = phone;
                document.getElementById('supplierEmail').innerText = email;

                // Gửi yêu cầu AJAX để lấy dữ liệu nhà cung cấp từ server
                fetch('/Gr1_Warehouse/getSuppliers')
                        .then(response => response.json())
                        .then(suppliers => {
                            // Gọi hàm hiển thị danh sách nhà cung cấp trong modal
                            displaySuppliers(suppliers);
                        })
                        .catch(error => console.error('Lỗi khi lấy dữ liệu nhà cung cấp:', error));

                // Hiển thị modal
                document.getElementById('supplierModal').style.display = 'block';
            }

// Hàm hiển thị danh sách nhà cung cấp
            function displaySuppliers(suppliers) {
                const supplierList = document.getElementById('supplierList');
                supplierList.innerHTML = ''; // Xóa danh sách cũ

                suppliers.forEach(supplier => {
                    const listItem = document.createElement('li');
                    listItem.textContent = supplier.supplierName;
                    listItem.onclick = () => {
                        showSupplierDetailsFromList(supplier);
                    };
                    supplierList.appendChild(listItem);
                });
            }

// Hiển thị chi tiết nhà cung cấp khi click vào tên nhà cung cấp trong danh sách
            function showSupplierDetailsFromList(supplier) {
                document.getElementById('supplierName').innerText = supplier.supplierName;
                document.getElementById('supplierAddress').innerText = supplier.address;
                document.getElementById('supplierPhone').innerText = supplier.phone;
                document.getElementById('supplierEmail').innerText = supplier.email;
            }

// Đóng modal khi nhấn vào biểu tượng đóng (x)
            document.querySelector('.btn-close').onclick = () => {
                document.getElementById('supplierModal').style.display = 'none';
            };

// Đóng modal khi nhấn ra ngoài modal
            window.onclick = function (event) {
                const modal = document.getElementById('supplierModal');
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            };

        </script>


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