<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <form method="POST" enctype="multipart/form-data" id="importForm" onsubmit="return validateForm();">
                    <div class="page-body">
                        <!-- Table Start -->
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card card-table">
                                        <div class="card-body">
                                            <div class="title-header option-title">
                                                <h5>Phiếu nhập hàng</h5>
                                                <button class="btn btn-danger" onclick="window.location.href = 'http://localhost:8080/Gr1_Warehouse/importGood'">Quay lại</button>
                                            </div>
                                        </div>

                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="border border-gray-300 rounded-lg shadow-md p-4 bg-white">
                                                        <div class="border-bottom pb-2 mb-2">
                                                            <h4 class="text-lg font-semibold">Nhà cung cấp</h4>
                                                        </div>

                                                        <!-- Dropdown chọn nhà cung cấp -->
                                                        <label for="supplierDropdown" class="font-medium">Chọn nhà cung cấp:</label>
                                                        <select id="supplierDropdown" class="form-control font-medium" name="supplierId">
                                                            <option value="">Chọn nhà cung cấp</option>
                                                            <!-- Các option sẽ được thêm vào bằng JavaScript -->
                                                        </select>

                                                        <!-- Thông tin chi tiết -->
                                                        <div id="supplierDetails" class="mt-3">
                                                            <p><strong>Tên nhà cung cấp:</strong> <span id="supplierName"></span></p>
                                                            <p><strong>Địa chỉ:</strong> <span id="supplierAddress"></span></p>
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
                                                            <p><strong></strong> <span id=""></span></p>
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
                                            <h3 class="text-lg font-semibold">Danh sách sản phẩm</h3>
                                        </div>
                                        <div class="mb-4">
                                            <div class="row">
                                                <div class="col-md-3 d-flex align-items-center">
                                                </div>

                                            </div>
                                        </div>
                                        <div class="mt-3">
                                            <table class="table">
                                                <thead>
                                                    <tr >
                                                        <th style="font-size: 16px; text-align: center">Tên sản phẩm</th>
                                                        <th style="font-size: 16px; text-align: center">Phân loại</th>
                                                        <th style="font-size: 16px; text-align: center">SKU</th>
                                                        <th style="font-size: 16px; text-align: center">Hạn sử dụng</th>
                                                        <th style="font-size: 16px; text-align: center">Giá</th>
                                                        <th style="font-size: 16px; text-align: center">Số lượng</th>
                                                        <th style="font-size: 16px; text-align: center">Tổng</th>
                                                        <th style="font-size: 16px">Xóa</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="selectedProductContainer">
                                                    <!-- Các hàng sản phẩm sẽ được thêm vào đây -->
                                                </tbody>
                                            </table>
                                        </div>                                        
                                        <div class="modal fade" id="searchProductModal" tabindex="-1">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Danh sách sản phẩm</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="text" id="searchSkuInput" class="form-control mb-2" style="font-size: 16px;" placeholder="Nhập SKU / Tên để tìm kiếm...">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <td>Chọn</td>
                                                                    <td>Tên sản phẩm</td>
                                                                    <td>SKU</td>
                                                                    <td>Phân loại</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="productTable"></tbody>
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
                                                    <label for="warehouseStaffDropdown" class="form-label">Chọn nhân viên kho:</label>
                                                    <select id="warehouseStaffDropdown" class="form-control">
                                                        <option value="" disabled selected>Chọn nhân viên xử lí</option>
                                                    </select>
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Ghi chú</label>
                                                    <textarea id="notes" name="notes" class="form-control" placeholder="Nhập ghi chú"></textarea>
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Tải ảnh phiếu nhập hàng</label>
                                                    <input type="file" class="form-control" id="billImgUrl" name="billImgUrl" accept=".png, .jpg, .jpeg, .pdf" required>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right Section -->
                                        <div class="col-12 col-lg-6">
                                            <div class="bg-white p-4 rounded-lg shadow-md border border-gray-300">
                                                <h3 class="mb-4">Giá trị nhập</h3>
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span class="text-gray-700">Tổng số lượng nhập</span>
                                                    <span id="totalQuantity" name="totalQuantity">0</span>
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-2">
                                                    <span class="text-gray-700">Tổng tiền hàng</span>
                                                    <span id="totalAmount" name="totalAmount">0 VND</span>
                                                </div>

                                                <button id="submitOrderBtn" class="w-100 btn btn-primary" type="submit">Nhập hàng</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Table End -->
        </div>
        <!-- Page Body End -->
    </div>


    <script>
        dropdown.addEventListener("change", function (event) {
            event.preventDefault(); // Ngăn chặn submit mặc định
            clearSelectedProducts();
            productTableBody.innerHTML = "";
            updateSupplierDetails(this);
        });
    </script>
    <!--Chọn sản phẩm theo nhà cung cấp-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dropdown = document.getElementById("supplierDropdown"); // Dropdown chọn nhà cung cấp
            const openProductModalBtn = document.getElementById("openProductModal"); // Nút mở modal sản phẩm
            const productTableBody = document.getElementById("productTable"); // Body của bảng hiển thị sản phẩm
            const selectedProductContainer = document.getElementById("selectedProductContainer"); // Container hiển thị sản phẩm đã chọn
            let selectedSupplierCode = ""; // Lưu supplierCode được chọn

            // 🔹 Gọi API lấy danh sách nhà cung cấp
            fetch('/Gr1_Warehouse/getSuppliers?filter=Active')
                    .then(response => response.json())
                    .then(suppliers => {
                        if (!Array.isArray(suppliers)) {
                            console.error("❌ API không trả về một mảng:", suppliers);
                            return;
                        }

                        suppliers.forEach(supplier => {
                            console.log("🔹 Nhà cung cấp nhận được từ API:", supplier);
                            const option = document.createElement("option");
                            option.value = JSON.stringify(supplier); // ✅ Lưu cả object supplier trong option
                            option.textContent = supplier.supplierName;
                            dropdown.appendChild(option);
                        });
                    })
                    .catch(error => console.error("❌ Lỗi khi lấy danh sách nhà cung cấp:", error));
            // 🔹 Xử lý khi chọn nhà cung cấp
            dropdown.addEventListener("change", function () {
                // ✅ Xóa sạch sản phẩm đã chọn khi đổi nhà cung cấp
                clearSelectedProducts();
                // ✅ Làm rỗng bảng sản phẩm để tránh hiển thị dữ liệu cũ
                productTableBody.innerHTML = "";
                // Cập nhật thông tin nhà cung cấp
                updateSupplierDetails(this);
            });
            // 🔹 Hàm xóa sạch sản phẩm đã chọn
            function clearSelectedProducts() {
                if (selectedProductContainer) {
                    selectedProductContainer.innerHTML = "";
                    console.log("✅ Đã xóa sạch danh sách sản phẩm đã chọn");
                }

                // Cập nhật tổng số lượng và tổng tiền về 0
                document.getElementById("totalQuantity").textContent = "0";
                document.getElementById("totalAmount").textContent = "0 VND";
            }

            // 🔹 Khi nhấn vào nút mở danh sách sản phẩm
            openProductModalBtn.addEventListener("click", function () {
                event.preventDefault(); // Ngăn chặn hành vi mặc định
                if (!selectedSupplierCode) {
                    alert("Vui lòng chọn nhà cung cấp trước!");
                    event.preventDefault(); // Ngăn chặn điều hướng
                    return;
                }
                // 🔹 Reset bảng sản phẩm trước khi tải dữ liệu mới
                productTableBody.innerHTML = "";
                const apiUrl = `/Gr1_Warehouse/productbrand?supplierCode=` + selectedSupplierCode;
                console.log("📡 Gọi API lấy sản phẩm:", apiUrl);
                fetch(apiUrl)
                        .then(response => response.json())
                        .then(products => {
                            console.log("✅ Dữ liệu sản phẩm nhận được:", products);
                            if (!Array.isArray(products) || products.length === 0) {
                                alert("⚠️ Nhà cung cấp hiện chưa cung cấp sản phẩm nào vui lòng chọn nhà cung cấp khác!");
                                return; // Dừng lại, không mở modal
                            }
                            displayProductList(products); // 🛠 Gọi hàm hiển thị danh sách sản phẩm
                        })
                        .catch(error => console.error("❌ Lỗi khi lấy danh sách sản phẩm:", error));
            });
            // 🔹 Hàm cập nhật thông tin nhà cung cấp
            function updateSupplierDetails(select) {
                if (!select.value) {
                    console.error("❌ Không có giá trị nào được chọn!");
                    selectedSupplierCode = ""; // ✅ Đặt lại giá trị khi không có nhà cung cấp được chọn

                    // ✅ Ẩn nút "Xem danh sách sản phẩm" khi không có nhà cung cấp
                    openProductModalBtn.style.display = "none";
                    // ✅ Xóa thông tin nhà cung cấp
                    document.getElementById("supplierName").textContent = "";
                    document.getElementById("supplierAddress").textContent = "";
                    document.getElementById("supplierPhone").textContent = "";
                    document.getElementById("supplierEmail").textContent = "";
                    return;
                }

                let supplier;
                try {
                    supplier = JSON.parse(select.value); // ✅ Parse JSON từ value của dropdown
                } catch (e) {
                    console.error("❌ Không thể parse giá trị nhà cung cấp:", select.value);
                    return;
                }

                if (!supplier || !supplier.supplierCode) {
                    console.error("❌ Nhà cung cấp không hợp lệ:", supplier);
                    return;
                }

                selectedSupplierCode = supplier.supplierCode; // ✅ Lưu lại supplierCode được chọn
                console.log("✅ Supplier Code:", selectedSupplierCode);
                // ✅ Cập nhật UI với thông tin nhà cung cấp
                document.getElementById("supplierName").textContent = supplier.supplierName || "N/A";
                document.getElementById("supplierAddress").textContent = supplier.address || "N/A";
                document.getElementById("supplierPhone").textContent = supplier.phone || "N/A";
                document.getElementById("supplierEmail").textContent = supplier.email || "N/A";
                // ✅ Hiển thị nút "Xem danh sách sản phẩm"
                openProductModalBtn.style.display = "inline-block";
            }

            // 🔹 Hàm hiển thị danh sách sản phẩm trong modal
            function displayProductList(products) {
                if (!productTableBody) {
                    console.error("❌ Lỗi: Không tìm thấy phần tử productTableBody");
                    return;
                }

                console.log("🗑️ Đã reset bảng sản phẩm trước khi cập nhật:", productTableBody.innerHTML);
                productTableBody.innerHTML = "";
                console.log("✅ Sau khi reset, productTableBody:", productTableBody.innerHTML);
                if (!Array.isArray(products) || products.length === 0) {
                    console.warn("⚠️ Cảnh báo: Dữ liệu sản phẩm không hợp lệ hoặc rỗng.", products);
                    productTableBody.innerHTML = "<tr><td colspan='4' class='text-center text-muted'>Không có sản phẩm nào!</td></tr>";
                    return;
                }

                products.forEach((product, index) => {
                    console.log(`🔹 Sản phẩm ${index + 1}:`, product);
                    const tr = document.createElement("tr");
                    // Lấy productName và đảm bảo nó là chuỗi
                    let productName = product.productName;
                    if (typeof productName !== "string") {
                        console.warn(`⚠️ Cảnh báo: productName không phải chuỗi`, productName);
                        productName = "N/A";
                    } else {
                        productName = productName.replace(/^\[.*\]\s*/, ""); // Xóa phần trong dấu [] nếu có
                    }

                    const tdCheckbox = document.createElement("td");
                    const checkbox = document.createElement("input");
                    checkbox.type = "checkbox";
                    checkbox.classList.add("product-checkbox");
                    checkbox.dataset.productId = product.variantId || ""; // Lưu ID sản phẩm để xử lý sau
                    tdCheckbox.appendChild(checkbox);
                    const tdName = document.createElement("td");
                    tdName.textContent = productName || "N/A"; // Đảm bảo luôn có giá trị hợp lệ

                    const tdSku = document.createElement("td");
                    tdSku.textContent = product.sku || "N/A";
                    const tdSizeName = document.createElement("td");
                    tdSizeName.textContent = product.sizeName || "N/A";
                    const tdVariantId = document.createElement("td");
                    tdVariantId.textContent = product.variantId || "N/A";
                    tdVariantId.classList.add("hidden-column"); // Thêm class để ẩn

                    tr.appendChild(tdCheckbox);
                    tr.appendChild(tdName);
                    tr.appendChild(tdSku);
                    tr.appendChild(tdSizeName);
                    tr.appendChild(tdVariantId);
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

            // 🔹 Thêm xử lý cho nút hoàn tất chọn trong modal
            const completeSelectionBtn = document.querySelector("#searchProductModal .modal-footer .btn-primary");
            if (completeSelectionBtn) {
                completeSelectionBtn.addEventListener("click", function () {
                    const selectedCheckboxes = document.querySelectorAll("#productTable .product-checkbox:checked");
                    // Xử lý các sản phẩm được chọn ở đây (thêm vào selectedProductContainer)
                    // ...

                    // Đóng modal sau khi hoàn tất
                    const modalElement = document.getElementById("searchProductModal");
                    const modal = bootstrap.Modal.getInstance(modalElement);
                    if (modal) {
                        modal.hide();
                    }
                });
            }
        });
    </script>

    <!--Chọn nhân viên xử lí-->
    <script>
        function loadWarehouseStaffs() {
            fetch('/Gr1_Warehouse/allstaff?role=4') // Gọi API lấy danh sách Warehouse Staffs
                    .then(response => response.json())
                    .then(data => {
                        let dropdown = document.getElementById("warehouseStaffDropdown");
                        dropdown.innerHTML = '<option value="" disabled selected>Chọn nhân viên</option>';
                        data.forEach(staff => {
                            let option = document.createElement("option");
                            option.value = staff.userId; // Gán userId làm value
                            option.textContent = staff.fullname; // Hiển thị fullname
                            dropdown.appendChild(option);
                        });
                    })
                    .catch(error => console.error("Lỗi khi tải dữ liệu:", error));
        }

        window.onload = loadWarehouseStaffs;
    </script>

    <!--Chọn sản phẩm để submit-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const completeSelectionBtn = document.querySelector(".modal-footer .btn-primary");
            const selectedProductContainer = document.getElementById("selectedProductContainer");
            const totalAmount = document.getElementById("totalAmount");
            if (!completeSelectionBtn || !selectedProductContainer || !totalAmount) {
                console.error("❌ Lỗi: Không tìm thấy phần tử cần thiết");
                return;
            }
            completeSelectionBtn.addEventListener("click", function () {
                console.log("✅ Nút Hoàn tất chọn đã được ấn!");
                const checkedProducts = document.querySelectorAll("#productTable input[type='checkbox']:checked");
// Check slect minimize one products
                if (checkedProducts.length === 0) {
                    alert("Vui lòng chọn ít nhất một sản phẩm!");
                    event.preventDefault(); // Ngăn chặn hành động mặc định (chỉ cần nếu có form)
                    event.stopPropagation(); // Ngăn modal bị đóng nếu có sự kiện lan truyền
                    return;
                }
                checkedProducts.forEach(checkbox => {
                    const row = checkbox.closest("tr");
                    if (!row || row.children.length < 4) {
                        console.error("⚠️ Lỗi: Không tìm thấy hàng hoặc số cột không đủ!");
                        return;
                    }
                    const productName = row.children[1]?.textContent.trim() || "Không có tên";
                    const sku = row.children[2]?.textContent.trim() || "Không có SKU";
                    const sizeName = row.children[3]?.textContent.trim() || "Không có size name";
                    const variantId = checkbox.dataset.productId || "Không có VariantID";
// Kiểm tra sản phẩm đã tồn tại chưa
                    const existingProduct = [...document.querySelectorAll(".selected-product")]
                            .find(product => product.dataset.sku === sku);
                    if (existingProduct) {
                        alert("⚠️ Sản phẩm \"" + productName + "\" đã tồn tại, không thêm lại!");
                        return;
                    }
                    console.log("📌 Dữ liệu trước khi thêm vào UI:", {productName, sku});
// ✅ Tạo sản phẩm hiển thị đúng

                    const productRow = document.createElement("tr");
                    productRow.classList.add("selected-product");
                    productRow.dataset.sku = sku; // Lưu SKU để kiểm tra trùng
                    productRow.dataset.variantId = variantId; // <-- Đảm bảo gán giá trị này
                    productRow.dataset.sizeName = sizeName;
// Cột: Tên sản phẩm

                    const nameCol = document.createElement("td");
                    nameCol.textContent = productName;
                    nameCol.style.textAlign = "center";
// Thêm phần tử hiển thị số ngày còn lại
                    const daysLeftMessage = document.createElement("div"); // Sử dụng div để xuống dòng
                    daysLeftMessage.classList.add("days-left-message");
                    daysLeftMessage.style.color = "red"; // Đặt màu đỏ cho văn bản
                    daysLeftMessage.textContent = ""; // Bắt đầu với thông báo rỗng
                    nameCol.appendChild(daysLeftMessage); // Thêm vào cột tên sản phẩm
                    const sizeCol = document.createElement("td");
                    sizeCol.textContent = sizeName;
                    sizeCol.style.textAlign = "center";
// Cột: SKU
                    const skuCol = document.createElement("td");
                    skuCol.textContent = sku;
                    skuCol.style.textAlign = "center";
// 🟢 Cột: Hạn sử dụng
                    const expiryCol = document.createElement("td");
                    const expiryInput = document.createElement("input");
                    expiryInput.type = "date";
                    expiryInput.classList.add("form-control", "expiry-date");
                    expiryCol.appendChild(expiryInput);
                    expiryCol.style.width = "80px";
                    expiryCol.style.textAlign = "center";
                    expiryInput.min = new Date().toISOString().split("T")[0]; // Chặn nhập ngày quá khứ
// Cập nhật số ngày còn lại khi chọn ngày hết hạn
                    expiryInput.addEventListener("input", function () {
                        validateExpiryDate(expiryInput, daysLeftMessage);
                    });
                    expiryInput.addEventListener("change", function () {
                        validateExpiryDate(expiryInput, daysLeftMessage);
                    });
                    expiryInput.addEventListener("blur", function () {  // Kiểm tra ngay khi rời khỏi ô nhập
                        validateExpiryDate(expiryInput, daysLeftMessage);
                    });
                    function validateExpiryDate(expiryInput, daysLeftMessage) {
                        const selectedDate = new Date(expiryInput.value);

                        // 🛑 Kiểm tra xem ngày nhập có hợp lệ không
                        if (!expiryInput.value || isNaN(selectedDate.getTime())) {
                            daysLeftMessage.textContent = "❌ Ngày không tồn tại!";
                            daysLeftMessage.style.color = "red";
                            expiryInput.focus(); // Đưa con trỏ trở lại ô nhập
                            return; // Dừng lại nếu ngày không hợp lệ

                        }

                        const today = new Date();
                        const timeDiff = selectedDate - today;
                        const daysLeft = Math.ceil(timeDiff / (1000 * 3600 * 24));

                        if (daysLeft < 0) {
                            daysLeftMessage.textContent = "Lô hàng này đã hết hạn!";
                            daysLeftMessage.style.color = "red";
                        } else if (daysLeft === 0) {
                            daysLeftMessage.textContent = "Lô hàng hôm nay hết hạn";
                            daysLeftMessage.style.color = "red";
                        } else {
                            daysLeftMessage.textContent = "Lô hàng còn " + daysLeft + " ngày hết hạn";
                            daysLeftMessage.style.color = daysLeft <= 7 ? "red" : "green";
                        }
                    }
// Tạo cột và input cho giá
                    const priceCol = document.createElement("td");
                    const priceInput = document.createElement("input");
                    priceInput.type = "number";
                    priceInput.classList.add("form-control", "price");
                    priceInput.placeholder = "Giá";
                    priceCol.appendChild(priceInput);
                    priceCol.style.width = "120px";
                    priceCol.style.textAlign = "center";

// Tạo cột và input cho số lượng
                    const quantityCol = document.createElement("td");
                    const quantityInput = document.createElement("input");
                    quantityInput.type = "number";
                    quantityInput.classList.add("form-control", "quantity");
                    quantityInput.placeholder = "Số lượng";
                    quantityCol.appendChild(quantityInput);
                    quantityCol.style.width = "120px";
                    quantityCol.style.textAlign = "center";

// Gắn sự kiện `blur` cho priceInput và quantityInput
                    priceInput.addEventListener("blur", function () {
                        if (this) { // Kiểm tra input có hợp lệ không
                            validateAndUpdateTotal(this);
                        }
                    });

                    quantityInput.addEventListener("blur", function () {
                        if (this) { // Kiểm tra input có hợp lệ không
                            validateAndUpdateTotal(this);
                        }
                    });

// Cột: Tổng giá
                    const totalPriceCol = document.createElement("td");
                    const totalPriceSpan = document.createElement("span");
                    totalPriceSpan.classList.add("total-price");
                    totalPriceSpan.textContent = "0 VND";
                    totalPriceCol.appendChild(totalPriceSpan);
                    totalPriceCol.style.textAlign = "center";
// Cột: Nút xóa
                    const removeCol = document.createElement("td");
                    removeCol.classList.add("text-center");
                    const removeBtn = document.createElement("button");
                    removeBtn.type = "button";
                    removeBtn.classList.add("btn", "btn-danger", "btn-sm", "remove-product");
                    removeBtn.textContent = "X";
                    removeCol.appendChild(removeBtn);
// 🛠️ Thêm tất cả vào `productRow`
                    productRow.appendChild(nameCol);
                    productRow.appendChild(sizeCol);
                    productRow.appendChild(skuCol);
                    productRow.appendChild(expiryCol);
                    productRow.appendChild(priceCol);
                    productRow.appendChild(quantityCol);
                    productRow.appendChild(totalPriceCol);
                    productRow.appendChild(removeCol);
                    selectedProductContainer.appendChild(productRow);
                    console.log("📌 Đã thêm sản phẩm vào selectedProductContainer!", selectedProductContainer);
// 🟢 Thêm sự kiện cập nhật tổng tiền khi nhập số lượng hoặc giá
                    priceInput.addEventListener("input", validateAndUpdateTotal);
                    quantityInput.addEventListener("input", validateAndUpdateTotal);
                    removeBtn.addEventListener("click", function () {
                        productRow.remove();
                        updateTotalPrice();
                    });
                });
// 🔹 Đóng modal sau khi chọn sản phẩm
                const modal = bootstrap.Modal.getInstance(document.getElementById("searchProductModal"));
                modal.hide();
                updateTotalPrice(); // Cập nhật tổng giá sau khi chọn xong
            });
// 🔹 Hàm kiểm tra giá trị nhập vào và cập nhật tổng giá
            function validateAndUpdateTotal(input) {
                if (!input) {
                    console.error("Input không hợp lệ!");
                    return; // Nếu input không hợp lệ, thoát hàm
                }

                // Ensure input has classList before trying to access 'contains'
                if (input.classList && input.classList.contains("price")) {
                    let value = parseFloat(input.value);

                    if (isNaN(value) || value <= 0) {
                        alert("Giá phải là số dương!");
                        input.value = "1"; // Nếu nhập sai, reset về 1
                    } else {
                        input.value = value;
                    }
                }

                if (input.classList && input.classList.contains("quantity")) {
                    let value = parseFloat(input.value);

                    if (isNaN(value) || value <= 0) {
                        alert("Số lượng phải là số nguyên dương!");
                        input.value = "1"; // Nếu nhập sai, reset về 1
                    } else {
                        if (!Number.isInteger(value)) {
                            alert("Số lượng phải là số nguyên! Hệ thống sẽ làm tròn xuống.");
                            input.value = Math.floor(value); // Làm tròn xuống số nguyên gần nhất
                        }
                    }
                }

                updateTotalPrice(); // Cập nhật lại tổng giá
            }


// Hàm ngăn chặn phím Enter
            function preventEnter(input) {
                if (!input)
                    return; // Kiểm tra nếu input không hợp lệ

                input.addEventListener("keydown", function (event) {
                    if (event.key === "Enter") {
                        event.preventDefault();
                        this.blur(); // Mất focus khỏi input khi nhấn Enter
                    }
                });
            }

// Sau khi tạo input, gọi hàm này
            const priceInput = document.querySelector(".price"); // Chọn phần tử input giá
            const quantityInput = document.querySelector(".quantity"); // Chọn phần tử input số lượng

// Kiểm tra và ngăn chặn phím Enter
            if (priceInput)
                preventEnter(priceInput);
            if (quantityInput)
                preventEnter(quantityInput);





// 🔹 Hàm cập nhật tổng giá từng sản phẩm và tổng cộng

            function updateTotalPrice() {
                let totalAll = 0;
                let totalQuantity = 0; // Biến đếm tổng số lượng nhập

                document.querySelectorAll(".selected-product").forEach(productRow => {
                    const quantity = parseFloat(productRow.querySelector(".quantity").value) || 0;
                    const price = parseFloat(productRow.querySelector(".price").value) || 0;
                    const totalPrice = quantity * price;
                    //productRow.querySelector(".total-price").textContent = totalPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VND";
                    //productRow.querySelector(".total-price").textContent = totalPrice.toLocaleString("vi-VN") + " VND";
                    productRow.querySelector(".total-price").textContent = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VND";
                    totalAll += totalPrice;
                    totalQuantity += quantity; // Cộng dồn tổng số lượng nhập
                });
                totalAmount.textContent = "" + totalAll.toLocaleString("vi-VN") + " VND";
// Hiển thị tổng số lượng nhập
                const totalQuantityElement = document.querySelector(".d-flex span:last-child");
                if (totalQuantityElement) {
                    totalQuantityElement.textContent = totalQuantity.toLocaleString("vi-VN");
                }
            }
        });
    </script>

    <!--Tìm kiếm trong modal-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const searchSkuInput = document.getElementById("searchSkuInput");
            const productTableBody = document.getElementById("productTable");

            if (!searchSkuInput || !productTableBody) {
                console.error("❌ Không tìm thấy phần tử tìm kiếm hoặc bảng sản phẩm!");
                return;
            }

            // 🔍 Hàm tìm kiếm theo SKU hoặc Tên sản phẩm
            function filterProducts() {
                const searchValue = searchSkuInput.value.trim().toLowerCase();
                const rows = productTableBody.querySelectorAll("tr");

                rows.forEach(row => {
                    const skuCell = row.querySelector("td:nth-child(3)"); // Cột SKU
                    const nameCell = row.querySelector("td:nth-child(2)"); // Cột Tên sản phẩm

                    if (skuCell && nameCell) {
                        const skuText = skuCell.textContent.trim().toLowerCase();
                        const nameText = nameCell.textContent.trim().toLowerCase();

                        // Hiển thị nếu tìm thấy trong SKU hoặc Tên sản phẩm
                        row.style.display = (skuText.includes(searchValue) || nameText.includes(searchValue)) ? "" : "none";
                    }
                });
            }

            // ⌨️ Lắng nghe sự kiện nhập để lọc sản phẩm
            searchSkuInput.addEventListener("input", filterProducts);

            // 🚫 Ngăn Enter submit form hoặc đóng modal
            searchSkuInput.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                }
            });
        });
    </script>

    <!--Chọn kho lưu trữ-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Thêm tham số filter=active vào URL để chỉ lấy các kho có trạng thái Active
            fetch('/Gr1_Warehouse/getArchive?filter=Active')
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

        function updateWarehouseDetails(select) {
            if (select.value) {
                let warehouse = JSON.parse(select.value); // Lấy dữ liệu từ value

                // Cập nhật thông tin chi tiết
                document.getElementById('warehouseName').textContent = warehouse.warehouseName;
                document.getElementById('warehouseAddress').textContent = warehouse.address;
                document.getElementById('warehousePhone').textContent = warehouse.phone;
            }
        }
    </script>

    <!--Xử lí nhập vào table-->
    <script>
        document.getElementById("submitOrderBtn").addEventListener("click", async function (event) {
            event.preventDefault();
            console.log("===> Bắt đầu xử lý nhập hàng");
            const supplierValue = document.getElementById("supplierDropdown").value;
            const supplierId = supplierValue ? JSON.parse(supplierValue).supplierId : null;
            console.log("Supplier ID:", supplierId);
            const warehouseValue = document.getElementById("warehouseDropdown").value;
            const warehouseId = warehouseValue ? JSON.parse(warehouseValue).warehouseId : null;
            console.log("Warehouse ID:", warehouseId);
            const warehouseStaffId = document.getElementById("warehouseStaffDropdown").value;
            console.log("Warehouse Staff ID:", warehouseStaffId);
            let totalAmount = document.getElementById("totalAmount").textContent.replace(" VND", "").replace(/\./g, "").trim();
            let totalQuantity = document.getElementById("totalQuantity").textContent.trim();
            const notes = document.querySelector("textarea").value;
            const billImgFile = document.getElementById("billImgUrl").files[0];
            // Kiểm tra tổng số tiền và số lượng hợp lệ
            totalAmount = parseFloat(totalAmount);
            totalQuantity = parseInt(totalQuantity, 10);
            if (!supplierId || !warehouseId || !warehouseStaffId) {
                alert("Vui lòng điền đầy đủ thông tin nhà cung cấp, kho và nhân viên kho.");
                return;
            }
            if (isNaN(totalAmount) || totalAmount <= 0 || isNaN(totalQuantity) || totalQuantity <= 0) {
                alert("Tổng tiền và tổng số lượng phải lớn hơn 0.");
                return;
            }

            const skus = [];
            const quantities = [];
            const unitPrices = [];
            const expirationDates = [];
            const variantIds = [];
            let isValid = true;
            console.log("supplierId:", supplierId);
            console.log("warehouseId:", warehouseId);
            console.log("warehouseStaffId:", warehouseStaffId);
            console.log("totalAmount:", totalAmount);
            console.log("totalQuantity:", totalQuantity);
            async function fetchVariantId(sku) {
                try {
                    const response = await fetch(`/Gr1_Warehouse/getVariantId?sku=${sku}`);
                    if (!response.ok) {
                        throw new Error("Không thể lấy Variant ID từ máy chủ.");
                    }
                    const data = await response.json();
                    return data.variantId > 0 ? data.variantId : null;
                } catch (error) {
                    console.error("Lỗi lấy variantId từ server:", error);
                    return null;
                }
            }

            const productRows = document.querySelectorAll(".selected-product");
            for (const row of productRows) {
                let variantId = row.getAttribute("data-variant-id") || row.dataset.variantId;
                const sku = row.querySelector("td:nth-child(3)").textContent.trim();
                const expirationDate = row.querySelector(".expiry-date").value.trim();
                let unitPrice = row.querySelector(".price").value.trim();
                let quantity = row.querySelector(".quantity").value.trim();
                unitPrice = parseFloat(unitPrice);
                quantity = parseInt(quantity, 10);

                // Kiểm tra ngày hết hạn
                if (expirationDate && new Date(expirationDate) < new Date()) {
                    console.log("SKU đang kiểm tra:", sku);  // In ra giá trị của skus
                    alert("Lô hàng với SKU: " + sku + " đã hết hạn! Không thể nhập hàng.");
                    isValid = false;
                    break;
                }


                if (!variantId || parseInt(variantId) <= 0) {
                    variantId = await fetchVariantId(sku);
                    if (!variantId) {
                        alert("Không thể tìm thấy Variant ID cho SKU: " + sku + ". Hãy kiểm tra lại!");
                        isValid = false;
                        break;
                    }
                }

                const today = new Date().toISOString().split("T")[0]; // Lấy ngày hôm nay ở định dạng YYYY-MM-DD

                if (!sku) {
                    alert("Vui lòng nhập SKU.");
                    isValid = false;
                    break;
                }

                if (!expirationDate) {
                    alert("Vui lòng nhập ngày hết hạn.");
                    isValid = false;
                    break;
                }

                if (isNaN(quantity) || quantity <= 0) {
                    alert("Số lượng không hợp lệ. Vui lòng nhập số lượng lớn hơn 0.");
                    isValid = false;
                    break;
                }

                if (isNaN(unitPrice) || unitPrice <= 0) {
                    alert("Đơn giá không hợp lệ. Vui lòng nhập đơn giá lớn hơn 0.");
                    isValid = false;
                    break;
                }

                // Kiểm tra nếu có lô hàng hết hạn trong hôm nay
                if (expirationDate === today) {
                    alert("⚠️ Có lô hàng hết hạn trong hôm nay!");
                    isValid = false;
                    break;
                }


                skus.push(sku);
                quantities.push(quantity);
                unitPrices.push(unitPrice);
                expirationDates.push(expirationDate);
                variantIds.push(variantId);
            }

            if (!isValid || skus.length === 0) {
                return;
            }
            if (!billImgFile) {
                alert("Vui lòng tải lên ảnh hóa đơn trước khi nhập hàng.");
                return;
            }
            // Kiểm tra định dạng ảnh trước khi gửi
            if (billImgFile) {
                const allowedTypes = ["image/jpeg", "image/png", "image/jpg"];
                if (!allowedTypes.includes(billImgFile.type)) {
                    alert("Ảnh hóa đơn phải có định dạng JPEG, PNG hoặc JPG.");
                    return;
                }
            }

            const formData = new FormData();
            formData.append("supplierId", String(supplierId));
            formData.append("warehouseId", String(warehouseId));
            formData.append("warehouseStaffId", String(warehouseStaffId));
            formData.append("totalAmount", String(totalAmount));
            formData.append("totalQuantity", String(totalQuantity));
            formData.append("notes", notes || "");
            for (let i = 0; i < skus.length; i++) {
                formData.append("skus", skus[i]);
                formData.append("quantities", quantities[i]);
                formData.append("unitPrices", unitPrices[i]);
                formData.append("expirationDates", expirationDates[i]);
                formData.append("variantIds", variantIds[i]);
            }

            if (billImgFile) {
                formData.append("billImgUrl", billImgFile);
            }

            try {
                const response = await fetch("/Gr1_Warehouse/handleImport", {
                    method: "POST",
                    body: formData
                });

                console.log("Response status:", response.status);
                console.log("Response headers:", response.headers);

                const data = await response.text();
                console.log("Response data:", data);

                if (response.ok) {
                    alert("Nhập hàng thành công!");
                    window.location.href = '/Gr1_Warehouse/importGood';
                } else {
                    alert("Có lỗi xảy ra: " + data);
                }
            } catch (error) {
                alert("Lỗi kết nối: " + error.message);
            }
        });
    </script>



    <style>
        .modal-dialog {
            max-width: 800px; /* Giới hạn chiều rộng modal */
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

        .hidden-column {
            display: none;
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

    <!-- ratio js -->
    <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>
</body>
</html>