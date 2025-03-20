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
                <form method="POST" action="/Gr1_Warehouse/create-inventory-check" id="importForm">
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
                                                            <label for="staffDropdown" class="font-medium">Chọn người giám sát:</label>
                                                            <select id="staffDropdown" class="form-control font-medium" name="staffId" onchange="updateStaffDetails(this)">
                                                                <option value="" disabled selected>Chọn người giám sát</option>
                                                            </select>


                                                            <div id="staffDetails" class="mt-3">
                                                                <p><strong>Tên người giám sát:</strong> <span id="staffName"></span></p>
                                                                <p><strong>Điện thoại:</strong> <span id="staffPhone"></span></p>
                                                                <p><strong>Email:</strong> <span id="staffEmail"></span></p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Các phần khác, ví dụ như Kho nhập -->
                                                    <div class="col-md-6">
                                                        <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                            <div class="border-bottom pb-2 mb-2">
                                                                <h4 class="text-lg font-semibold">Kho lưu trữ hàng</h4>
                                                            </div>
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
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="text-center mt-4">
                                                        <button type="submit" class="btn btn-primary">Tạo phiếu kiểm kho</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            let warehouseList = []; // Lưu danh sách kho

            document.addEventListener("DOMContentLoaded", function () {
                fetch('/Gr1_Warehouse/getArchive')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Lỗi khi lấy dữ liệu kho lưu trữ");
                            }
                            return response.json();
                        })
                        .then(warehouses => {
                            warehouseList = warehouses; // Lưu danh sách kho

                            const dropdown = document.getElementById('warehouseDropdown');
                            dropdown.innerHTML = '<option value="" disabled selected>Chọn kho lưu trữ</option>';

                            warehouses.forEach(warehouse => {
                                let option = document.createElement('option');
                                option.value = warehouse.warehouseId; // Chỉ lưu ID, không lưu JSON
                                option.textContent = warehouse.warehouseName;
                                dropdown.appendChild(option);
                            });
                        })
                        .catch(error => console.error('Lỗi khi lấy dữ liệu kho lưu trữ:', error));
            });

            function updateWarehouseDetails(select) {
                let selectedWarehouseId = select.value; // Lấy ID của kho đã chọn
                let warehouse = warehouseList.find(w => w.warehouseId == selectedWarehouseId);

                if (warehouse) {
                    document.getElementById('warehouseName').textContent = warehouse.warehouseName || "N/A";
                    document.getElementById('warehouseAddress').textContent = warehouse.address || "N/A";
                    document.getElementById('warehousePhone').textContent = warehouse.phone || "N/A";
                    console.log("✅ Warehouse ID cập nhật:", selectedWarehouseId);
                } else {
                    console.error("❌ Không tìm thấy kho với ID:", selectedWarehouseId);
                }
            }

        </script>

        <!--Chọn nhân viên xử lí-->
        <script>
            let warehouseStaffs = []; // Lưu danh sách nhân viên để tìm nhanh

            document.addEventListener("DOMContentLoaded", function () {
                fetch('/Gr1_Warehouse/allstaff?role=4')
                        .then(response => response.json())
                        .then(data => {
                            warehouseStaffs = data; // Lưu dữ liệu vào biến toàn cục

                            let dropdown = document.getElementById("staffDropdown");
                            dropdown.innerHTML = '<option value="" disabled selected>Chọn người giám sát</option>';

                            data.forEach(staff => {
                                let option = document.createElement("option");
                                option.value = staff.userId; // Gán userId làm value
                                option.textContent = staff.fullname;
                                // Hiển thị fullname
                                dropdown.appendChild(option);
                            });
                        })
                        .catch(error => console.error("Lỗi khi tải dữ liệu:", error));
            });

            function updateStaffDetails(select) {
                let selectedUserId = select.value; // Lấy userId được chọn

                // Tìm nhân viên trong danh sách đã lưu
                let staff = warehouseStaffs.find(staff => staff.userId == selectedUserId);

                if (staff) {
                    document.getElementById('staffName').textContent = staff.fullname || "N/A";
                    document.getElementById('staffPhone').textContent = staff.phone || "N/A";
                    document.getElementById('staffEmail').textContent = staff.email || "N/A";
                } else {
                    console.error("❌ Lỗi: Không tìm thấy nhân viên với userId:", selectedUserId);
                }
            }
        </script>
        <script>
            //Check đủ dữ liệu mới được submit form
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("importForm").addEventListener("submit", function (event) {
                    let staffDropdown = document.getElementById("staffDropdown");
                    let warehouseDropdown = document.getElementById("warehouseDropdown");

                    if (!staffDropdown.value) {
                        alert("Vui lòng chọn người giám sát kiểm kê.");
                        event.preventDefault(); // Ngăn form gửi đi
                        return;
                    }

                    if (!warehouseDropdown.value) {
                        alert("Vui lòng chọn kho lưu trữ.");
                        event.preventDefault(); // Ngăn form gửi đi
                        return;
                    }
                });
            });

        </script>

        <script>
            // Lấy query string từ URL
            const urlParams = new URLSearchParams(window.location.search);

            // Kiểm tra nếu có tham số success hoặc error
            if (urlParams.has("success")) {
                alert("✅ Phiếu kiểm kho đã được tạo thành công!");
                window.location.href = "/Gr1_Warehouse/inventory-checklist";
                console.log("Redirecting to:", window.location.href);

            } else if (urlParams.has("error")) {
                alert("❌ Lỗi! Không thể tạo phiếu kiểm kho. Vui lòng thử lại.");
                window.location.href = "inventory_checklist.jsp";
            }
        </script>


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

