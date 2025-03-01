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
                                            <!-- Bảng hiển thị sản phẩm đã chọn -->
                                            <div class="mt-3">
                                                <table class="table">
                                                    <thead>
                                                        <tr >
                                                            <th style="font-size: 16px; text-align: center">Tên sản phẩm</th>
                                                            <th style="font-size: 16px; text-align: center">Tồn kho</th>
                                                            <th style="font-size: 16px; text-align: center">Tồn thực tế</th>
                                                            <th style="font-size: 16px; text-align: center">Lệch</th>
                                                            <th style="font-size: 16px; text-align: center">Lý do</th>
                                                            <th style="font-size: 16px">Xóa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="selectedProductContainer">
                                                        <!-- Các hàng sản phẩm sẽ được thêm vào đây -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!--                                            <div id="selectedProductContainer" class="mt-3"></div>-->
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
                                                                        <td>Phân loại</td>
                                                                        <td>SKU</td>
                                                                        <td>Tồn</td>
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
                                                <button class="btn btn-outline-primary" id="openProductModal" type="button">
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
        <!--Chọn kho lưu trữ-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                fetch('/Gr1_Warehouse/getArchive')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Lỗi khi lấy dữ liệu kho lưu trữ");
                            }
                            return response.json();
                        })
                        .then(warehouses => {
                            const dropdown = document.getElementById('warehouseDropdown');

                            // Xóa các option cũ (nếu có)
                            dropdown.innerHTML = '<option value="" disabled selected>Chọn kho lưu trữ</option>';

                            warehouses.forEach(warehouse => {
                                let option = document.createElement('option');
                                option.value = JSON.stringify(warehouse); // Lưu dữ liệu JSON trong value
                                option.textContent = warehouse.warehouseName; // Đảm bảo có thuộc tính name
                                dropdown.appendChild(option);
                            });
                        })
                        .catch(error => console.error('Lỗi khi lấy dữ liệu kho lưu trữ:', error));
            });
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
            document.addEventListener("DOMContentLoaded", function () {
                const warehouseDropdown = document.getElementById("warehouseDropdown"); // Dropdown chọn kho
                const openProductModalBtn = document.getElementById("openProductModal"); // Nút mở modal sản phẩm
                const productTableBody = document.getElementById("productTable"); // Body của bảng hiển thị sản phẩm
                let selectedWarehouseId = ""; // Lưu warehouseId được chọn

                // 🔹 Xử lý khi chọn kho hàng
                warehouseDropdown.addEventListener("change", function () {
                    selectedWarehouseId = this.value; // Cập nhật warehouseId khi người dùng chọn
                    console.log("✅ Warehouse ID đã chọn:", selectedWarehouseId);
                    updateWarehouseDetails(this);
                });

                function updateWarehouseDetails(select) {
                    if (select.value) {
                        let warehouse = JSON.parse(select.value); // Chuyển đổi JSON từ value

                        // Cập nhật thông tin kho vào giao diện
                        document.getElementById('warehouseName').textContent = warehouse.warehouseName;
                        document.getElementById('warehouseAddress').textContent = warehouse.address;
                        document.getElementById('warehousePhone').textContent = warehouse.phone;

                        // Lưu warehouseId để gọi API sau này
                        selectedWarehouseId = warehouse.warehouseId;
                        console.log("✅ Warehouse ID cập nhật:", selectedWarehouseId);
                    }
                }

                // 🔹 Khi nhấn vào nút mở danh sách sản phẩm
                openProductModalBtn.addEventListener("click", function () {
                    if (!selectedWarehouseId) {
                        alert("Vui lòng chọn kho hàng trước!");
                        return;
                    }

                    const apiUrl = `/Gr1_Warehouse/product-warehouse?warehouseId=` + selectedWarehouseId;
                    console.log("📡 Gọi API lấy sản phẩm:", apiUrl);

                    fetch(apiUrl)
                            .then(response => response.json())
                            .then(productVar => {
                                console.log("✅ Dữ liệu sản phẩm nhận được:", productVar);
                                displayProductList(productVar); // 🛠 Gọi hàm hiển thị danh sách sản phẩm
                            })
                            .catch(error => console.error("❌ Lỗi khi lấy danh sách sản phẩm:", error));
                });

                // 🔹 Hàm hiển thị danh sách sản phẩm trong modal
                function displayProductList(productVar) {
                    if (!productTableBody) {
                        console.error("❌ Lỗi: Không tìm thấy phần tử productTableBody");
                        return;
                    }

                    productTableBody.innerHTML = "";

                    if (!Array.isArray(productVar) || productVar.length === 0) {
                        console.warn("⚠️ Cảnh báo: Không có sản phẩm nào trong kho này!", productVar);
                        productTableBody.innerHTML = "<tr><td colspan='3' class='text-center text-muted'>Không có sản phẩm nào!</td></tr>";
                        return;
                    }

                    productVar.forEach((product, index) => {
                        console.log(`🔹 Sản phẩm ${index + 1}:`, product);

                        const tr = document.createElement("tr");

                        const tdCheckbox = document.createElement("td");
                        const checkbox = document.createElement("input");
                        checkbox.type = "checkbox";
                        checkbox.classList.add("product-checkbox");
                        tdCheckbox.appendChild(checkbox);

                        const tdName = document.createElement("td");
                        tdName.textContent = product.product?.productName || "N/A";

                        const tdVariantName = document.createElement("td");
                        tdVariantName.textContent = product.size?.size_name || "N/A";

                        const tdSku = document.createElement("td");
                        tdSku.textContent = product.sku || "N/A";

                        const tdStock = document.createElement("td");
                        tdStock.textContent = product.stock || "N/A";

                        tr.appendChild(tdCheckbox);
                        tr.appendChild(tdName);
                        tr.appendChild(tdVariantName);
                        tr.appendChild(tdSku);
                        tr.appendChild(tdStock);
                        productTableBody.appendChild(tr);
                    });

                    // Hiển thị modal sau khi cập nhật dữ liệu
                    const modalElement = document.getElementById("searchProductModal");
                    if (modalElement) {
                        const modal = new bootstrap.Modal(modalElement);
                        modal.show();
                    } else {
                        console.error("❌ Lỗi: Không tìm thấy modal searchProductModal");
                    }
                }
            });
        </script>

        <!--Chọn sản phẩm để submit-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const completeSelectionBtn = document.querySelector(".modal-footer .btn-primary");
                const selectedProductContainer = document.getElementById("selectedProductContainer");

                if (!completeSelectionBtn || !selectedProductContainer) {
                    console.error("❌ Lỗi: Không tìm thấy phần tử cần thiết");
                    return;
                }

                completeSelectionBtn.addEventListener("click", function () {
                    console.log("✅ Nút Hoàn tất chọn đã được ấn!");

                    const checkedProducts = document.querySelectorAll("#productTable input[type='checkbox']:checked");
                    if (checkedProducts.length === 0) {
                        alert("Vui lòng chọn ít nhất một sản phẩm!");
                        return;
                    }

                    checkedProducts.forEach(checkbox => {
                        const row = checkbox.closest("tr");

                        if (!row || row.children.length < 5) {
                            console.error("⚠️ Lỗi: Không tìm thấy hàng hoặc số cột không đủ!");
                            return;
                        }

                        const productName = row.children[1]?.textContent.trim() || "Không có tên";
                        const sizeName = row.children[2]?.textContent.trim() || "Không có kích cỡ";
                        const sku = row.children[3]?.textContent.trim() || "Không có SKU";
                        const stock = row.children[4]?.textContent.trim() || "0"; // Lấy tồn kho từ cột thứ 5

                        const productInfo = productName + " - " + sizeName + " - " + sku;
                        console.log("Chuỗi ghép:", productInfo);

                        // Kiểm tra sản phẩm đã tồn tại chưa
                        const existingProduct = [...document.querySelectorAll(".selected-product")]
                                .find(product => product.dataset.sku === sku);

                        if (existingProduct) {
                            console.warn(`⚠️ Sản phẩm "${productName}" (SKU: ${sku}) đã tồn tại, không thêm lại!`);
                            return;
                        }

                        console.log("📌 Dữ liệu trước khi thêm vào UI:", {productName, sizeName, sku, stock});



                        // ✅ Tạo hàng sản phẩm (tr)
                        const productRow = document.createElement("tr");
                        productRow.classList.add("selected-product");
                        productRow.dataset.sku = sku; // Lưu SKU để kiểm tra trùng

                        // Tạo các cột (td)
                        const nameCol = document.createElement("td");
                        nameCol.textContent = productInfo;
                        nameCol.style.wordWrap = "break-word";
                        nameCol.style.whiteSpace = "normal";
                        nameCol.style.width = "200px";

                        const stockCol = document.createElement("td");
                        stockCol.textContent = stock;
                        stockCol.style.width = "120px";
                        stockCol.style.textAlign = "center";

                        const actualStockCol = document.createElement("td");
                        const actualStockInput = document.createElement("input");
                        actualStockCol.style.width = "120px";
                        actualStockInput.type = "number";
                        actualStockInput.classList.add("form-control");
                        actualStockInput.placeholder = "Số lượng";
                        actualStockInput.min = "1"; // Số lượng phải lớn hơn 0
                        actualStockInput.value = "1";
                        actualStockCol.appendChild(actualStockInput);

                        const differenceCol = document.createElement("td");
                        const differenceInput = document.createElement("span");
                        differenceInput.type = "number";
                        differenceInput.classList.add("difference");
                        differenceCol.appendChild(differenceInput);
                        differenceCol.style.textAlign = "center";

                        const reasonCol = document.createElement("td");
                        const reasonSelect = document.createElement("select");
                        reasonSelect.classList.add("form-control");

                        // Danh sách lý do có sẵn
                        const reasons = ["Sản phẩm mới", "Hàng lỗi", "Hết hạn", "Khác"];
                        reasonCol.style.width = "170px";
                        reasons.forEach(reason => {
                            const option = document.createElement("option");
                            option.value = reason;
                            option.textContent = reason;
                            reasonSelect.appendChild(option);
                        });

                        reasonCol.appendChild(reasonSelect);


                        const removeCol = document.createElement("td");
                        removeCol.classList.add("text-center");
                        const removeBtn = document.createElement("button");
                        removeBtn.type = "button";
                        removeBtn.classList.add("btn", "btn-danger", "btn-sm", "remove-product");
                        removeBtn.textContent = "X";
                        removeCol.appendChild(removeBtn);

                        // Thêm các cột vào hàng
                        productRow.appendChild(nameCol);
                        productRow.appendChild(stockCol);
                        productRow.appendChild(actualStockCol);
                        productRow.appendChild(differenceCol);
                        productRow.appendChild(reasonCol);
                        productRow.appendChild(removeCol);

                        selectedProductContainer.appendChild(productRow);
                        console.log("📌 Đã thêm sản phẩm vào selectedProductContainer!", selectedProductContainer);

                        actualStockInput.addEventListener("input", updateTotalDifference);
                        // 🟢 Thêm sự kiện xóa sản phẩm
                        removeBtn.addEventListener("click", function () {
                            productRow.remove();
                        });
                    });

                    // 🔹 Đóng modal sau khi chọn sản phẩm
                    const modal = bootstrap.Modal.getInstance(document.getElementById("searchProductModal"));
                    modal.hide();
                    updateTotalDifference();
                });


                function updateTotalDifference() {
                    document.querySelectorAll(".selected-product").forEach(row => {
                        const stock = parseInt(row.children[1].textContent.trim()) || 0; // Lấy tồn kho
                        const actualStockInput = row.children[2].querySelector("input"); // Ô nhập tồn thực tế
                        const differenceSpan = row.children[3].querySelector("span"); // Ô hiển thị chênh lệch

                        let actualStock = parseInt(actualStockInput.value) || 0; // Lấy giá trị tồn thực tế nhập vào

                        // Nếu tồn thực tế nhập vào nhỏ hơn 0 hoặc không hợp lệ, đặt về 1
                        if (actualStock < 0 || isNaN(actualStock)) {
                            actualStock = 1;
                            actualStockInput.value = 1; // Cập nhật lại giá trị
                        }

                        const difference = actualStock - stock; // Tính số lượng chênh lệch
                        differenceSpan.textContent = difference; // Cập nhật vào ô hiển thị
                    });
                }

            });

        </script>
        <style>
            .modal-dialog {
                max-width: 900px; /* Giới hạn chiều rộng modal */
            }

            .modal-content {
                max-height: 80vh; /* Giới hạn chiều cao modal */
            }

            .modal-body {
                overflow-y: auto; /* Thanh cuộn dọc */
                max-height: 60vh;
            }

            .table-responsive {
                overflow-x: auto; /* Thanh cuộn ngang cho bảng */
                max-width: 100%; /* Giữ bảng trong modal */
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
