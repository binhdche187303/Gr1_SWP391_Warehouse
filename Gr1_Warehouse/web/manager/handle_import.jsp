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

                                                        <!-- Dropdown chọn nhà cung cấp -->
                                                        <label for="supplierDropdown" class="font-medium">Chọn nhà cung cấp:</label>
                                                        <select id="supplierDropdown" class="form-control font-medium">
                                                            <option value="">Chọn nhà cung cấp</option>
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
                                                        <select id="warehouseDropdown" class="form-select" onchange="updateWarehouseDetails(this)">
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

                                        <h4 id="totalAmount" class="text-end mt-2">Tổng cộng: 0 VND</h4>
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
                                                    <input type="text" value="" class="form-control">
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Mã tham chiếu</label>
                                                    <input type="text" value="" class="form-control">
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Ghi chú</label>
                                                    <textarea class="form-control" placeholder="Nhập ghi chú"></textarea>
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Tải ảnh phiếu nhập hàng</label>
                                                    <input type="file" class="form-control" accept=".png, .jpg, .jpeg, .pdf">
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
            document.addEventListener("DOMContentLoaded", function () {
                const dropdown = document.getElementById("supplierDropdown"); // Dropdown chọn nhà cung cấp
                const openProductModalBtn = document.getElementById("openProductModal"); // Nút mở modal sản phẩm
                const productTableBody = document.getElementById("productTable"); // Body của bảng hiển thị sản phẩm
                let selectedSupplierCode = ""; // Lưu supplierCode được chọn

                // 🔹 Gọi API lấy danh sách nhà cung cấp
                fetch('/Gr1_Warehouse/getSuppliers')
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
                    updateSupplierDetails(this);
                });

                // 🔹 Khi nhấn vào nút mở danh sách sản phẩm
                openProductModalBtn.addEventListener("click", function () {
                    if (!selectedSupplierCode) {
                        alert("Vui lòng chọn nhà cung cấp trước!");
                        return;
                    }

                    const apiUrl = `/Gr1_Warehouse/productbrand?supplierCode=` + selectedSupplierCode;
                    console.log("📡 Gọi API lấy sản phẩm:", apiUrl);

                    fetch(apiUrl)
                            .then(response => response.json())
                            .then(products => {
                                console.log("✅ Dữ liệu sản phẩm nhận được:", products);
                                displayProductList(products); // 🛠 Gọi hàm hiển thị danh sách sản phẩm
                            })
                            .catch(error => console.error("❌ Lỗi khi lấy danh sách sản phẩm:", error));
                });

                // 🔹 Hàm cập nhật thông tin nhà cung cấp
                function updateSupplierDetails(select) {
                    if (!select.value) {
                        console.error("❌ Không có giá trị nào được chọn!");
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
                    //document.getElementById("supplierCode").textContent = supplier.supplierCode || "N/A";

                    // ✅ Hiển thị nút "Xem danh sách sản phẩm"
                    openProductModalBtn.style.display = "inline-block";
                }

                // 🔹 Hàm hiển thị danh sách sản phẩm trong modal
                function displayProductList(products) {
                    if (!productTableBody) {
                        console.error("❌ Lỗi: Không tìm thấy phần tử productTableBody");
                        return;
                    }

                    productTableBody.innerHTML = "";

                    if (!Array.isArray(products) || products.length === 0) {
                        console.warn("⚠️ Cảnh báo: Dữ liệu sản phẩm không hợp lệ hoặc rỗng.", products);
                        productTableBody.innerHTML = "<tr><td colspan='3' class='text-center text-muted'>Không có sản phẩm nào!</td></tr>";
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
                        tdCheckbox.appendChild(checkbox);

                        const tdName = document.createElement("td");
                        tdName.textContent = productName || "N/A"; // Đảm bảo luôn có giá trị hợp lệ

                        const tdSku = document.createElement("td");
                        tdSku.textContent = product.sku || "N/A";

                        tr.appendChild(tdCheckbox);
                        tr.appendChild(tdName);
                        tr.appendChild(tdSku);
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
                    if (checkedProducts.length === 0) {
                        alert("Vui lòng chọn ít nhất một sản phẩm!");
                        return;
                    }

                    selectedProductContainer.innerHTML = ""; // Xóa danh sách cũ

                    // 🟢 **Thêm header tiêu đề**
                    const headerRow = document.createElement("div");
                    headerRow.classList.add("row", "fw-bold", "border-bottom", "pb-2", "mb-2");
                    headerRow.innerHTML = `
                        <div class="col-3">Tên sản phẩm</div>
                        <div class="col-2">SKU</div>
                        <div class="col-2">Giá</div>
                        <div class="col-2">Số lượng</div>
                        <div class="col-2">Tổng</div>
                        <div class="col-1 text-center"></div>
                    `;
                    selectedProductContainer.appendChild(headerRow);

                    checkedProducts.forEach(checkbox => {
                        const row = checkbox.closest("tr");

                        if (!row || row.children.length < 3) {
                            console.error("⚠️ Lỗi: Không tìm thấy hàng hoặc số cột không đủ!");
                            return;
                        }

                        const productName = row.children[1]?.textContent.trim() || "Không có tên";
                        const sku = row.children[2]?.textContent.trim() || "Không có SKU";
                        if (!productName || !sku) {
                            console.error("⚠️ Lỗi: Dữ liệu sản phẩm rỗng!");
                            return;
                        }

                        console.log("📌 Dữ liệu trước khi thêm vào UI:", {productName, sku});

                        // ✅ Tạo sản phẩm hiển thị đúng
                        const productRow = document.createElement("div");
                        productRow.classList.add("selected-product", "row", "align-items-center", "mb-2");

                        // Cột: Tên sản phẩm
                        const nameCol = document.createElement("div");
                        nameCol.classList.add("col-3");
                        nameCol.textContent = productName;

                        // Cột: SKU
                        const skuCol = document.createElement("div");
                        skuCol.classList.add("col-2");
                        skuCol.textContent = sku;

                        // Cột: Giá
                        const priceCol = document.createElement("div");
                        priceCol.classList.add("col-2");
                        const priceInput = document.createElement("input");
                        priceInput.type = "number";
                        priceInput.classList.add("form-control", "price");
                        priceInput.placeholder = "Giá";
                        priceInput.min = "1"; // Giá phải lớn hơn 0
                        priceInput.value = "1";
                        priceCol.appendChild(priceInput);

                        // Cột: Số lượng
                        const quantityCol = document.createElement("div");
                        quantityCol.classList.add("col-2");
                        const quantityInput = document.createElement("input");
                        quantityInput.type = "number";
                        quantityInput.classList.add("form-control", "quantity");
                        quantityInput.placeholder = "Số lượng";
                        quantityInput.min = "1"; // Số lượng phải lớn hơn 0
                        quantityInput.value = "1";
                        quantityCol.appendChild(quantityInput);

                        // Cột: Tổng giá
                        const totalPriceCol = document.createElement("div");
                        totalPriceCol.classList.add("col-2");
                        const totalPriceSpan = document.createElement("span");
                        totalPriceSpan.classList.add("total-price");
                        totalPriceSpan.textContent = "0 VND";
                        totalPriceCol.appendChild(totalPriceSpan);

                        // Cột: Nút xóa
                        const removeCol = document.createElement("div");
                        removeCol.classList.add("col-1", "text-center");
                        const removeBtn = document.createElement("button");
                        removeBtn.type = "button";
                        removeBtn.classList.add("btn", "btn-danger", "btn-sm", "remove-product");
                        removeBtn.textContent = "X";
                        removeCol.appendChild(removeBtn);

                        // 🛠️ Thêm tất cả vào `productRow`
                        productRow.appendChild(nameCol);
                        productRow.appendChild(skuCol);
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

                // 🔹 Hàm kiểm tra giá trị nhập vào phải lớn hơn 0 và cập nhật tổng giá
                function validateAndUpdateTotal(event) {
                    const input = event.target;
                    if (parseFloat(input.value) <= 0 || isNaN(input.value)) {
                        input.value = 1; // Nếu nhập sai, đặt về 1
                    }
                    updateTotalPrice();
                }

                // 🔹 Hàm cập nhật tổng giá từng sản phẩm và tổng cộng
                function updateTotalPrice() {
                    let totalAll = 0;
                    document.querySelectorAll(".selected-product").forEach(productRow => {
                        const quantity = parseFloat(productRow.querySelector(".quantity").value) || 0;
                        const price = parseFloat(productRow.querySelector(".price").value) || 0;
                        const totalPrice = quantity * price;

                        productRow.querySelector(".total-price").textContent = totalPrice.toLocaleString("vi-VN") + " VND";
                        totalAll += totalPrice;
                    });

                    totalAmount.textContent = "Tổng cộng: " + totalAll.toLocaleString("vi-VN") + " VND";
                }
            });
        </script>






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