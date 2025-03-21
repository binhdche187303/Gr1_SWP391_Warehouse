<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <div class="page-body-wrapper">
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body">
                                    <!-- page-wrapper Start-->
                                    <div class="container mt-4">
                                        <div class="row">
                                            <!-- Tiêu đề và nút chức năng -->
                                            <div class="col-md-12 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h3>Phiếu kiểm kho</h3>
                                                    <br/>
                                                    <p class="text-muted d-inline">
                                                        Mã phiếu: <strong class="checkId">#${inventoryCheckDetails.checkId}</strong>
                                                        <span class="separator"> | </span>
                                                        Trạng thái: <strong>${inventoryCheckDetails.status}</strong>
                                                    </p>

                                                </div>

                                                <div>
                                                    <button class="btn btn-primary" onclick="window.location.href = 'http://localhost:8080/Gr1_Warehouse/staff-checklist'">Quay lại</button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Thông tin nhà cung cấp và kho nhập -->
                                        <div class="row mt-3">
                                            <!-- Thông tin người giám sát -->
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Người giám sát</h5>
                                                        <c:if test="${not empty inventoryCheckDetails.reviewedBy}">
                                                            <p><strong>Tên người giám sát:</strong> ${inventoryCheckDetails.reviewedBy.fullname}</p>
                                                            <p><strong>Điện thoại:</strong> ${inventoryCheckDetails.reviewedBy.phone}</p>
                                                            <p><strong>Email:</strong> ${inventoryCheckDetails.reviewedBy.email}</p>
                                                        </c:if>
                                                        <c:if test="${empty inventoryCheckDetails.reviewedBy}">
                                                            <p class="text-muted">Chưa có người giám sát</p>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Thông tin kho nhập -->
                                            <div class="col-md-6">
                                                <div class="card border">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Kho nhập</h5>
                                                        <c:if test="${not empty inventoryCheckDetails.warehouse}">
                                                            <p><strong>Tên kho lưu trữ:</strong> ${inventoryCheckDetails.warehouse.warehouseName}</p>
                                                            <p><strong>Địa chỉ:</strong> ${inventoryCheckDetails.warehouse.address}</p>
                                                            <p><strong>Điện thoại:</strong> ${inventoryCheckDetails.warehouse.phone}</p>
                                                        </c:if>
                                                        <c:if test="${empty inventoryCheckDetails.warehouse}">
                                                            <p class="text-muted">Chưa có thông tin kho</p>
                                                        </c:if>
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
                                                                <th style="font-size: 16px; text-align: center">Số lô</th>
                                                                <th style="font-size: 16px; text-align: center">Tồn kho</th>
                                                                <th style="font-size: 16px; text-align: center">Tồn thực tế</th>
                                                                <th style="font-size: 16px; text-align: center">Lệch</th>
                                                                <th style="font-size: 16px; text-align: center">Giá trị lệch</th>
                                                                <th style="font-size: 16px; text-align: center">Ngày hết hạn</th>
                                                                <th style="font-size: 16px; text-align: center">Lý do</th>
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
                                                                <input type="text" id="searchInput" class="form-control mb-3" placeholder="Tìm kiếm sản phẩm theo tên hoặc SKU...">
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <td>Chọn</td>
                                                                            <td>Tên sản phẩm</td>
                                                                            <td>Phân loại</td>
                                                                            <td>SKU</td>
                                                                            <td>Số lô</td>
                                                                            <td>Tồn</td>
                                                                            <td>Giá nhập</td>
                                                                            <td>Ngày hết hạn</td>
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
                                                            <textarea id="warehouseStaff" name="warehouseStaff" class="form-control" placeholder="Nhập tên nhân viên kiểm kê"></textarea>
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
                                                            <span id="totalDifferenceUp" name="totalDifferenceUp">0</span>
                                                        </div>

                                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                            <span class="text-gray-700">Số lượng lệch giảm</span>
                                                            <span id="totalDifferenceDown" name="totalDifferenceDown">0</span>
                                                        </div>

                                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                            <span class="text-gray-700">Giá trị lệch tăng</span>
                                                            <span id="totalPriceDifferenceUp" name="totalPriceDifferenceUp">0 VND</span>
                                                        </div>

                                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                            <span class="text-gray-700">Giá trị lệch giảm</span>
                                                            <span id="totalPriceDifferenceDown" name="totalPriceDifferenceDown">0 VND</span>
                                                        </div>


                                                        <button id="submitOrderBtn" class="w-100 btn btn-primary" type="submit">Hoàn tất kiểm kho</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
        // Hàm lọc sản phẩm
            document.getElementById("searchInput").addEventListener("keyup", function () {
                let searchText = this.value.toLowerCase();
                let rows = document.querySelectorAll("#productTable tr");

                rows.forEach(row => {
                    let productName = row.cells[1].textContent.toLowerCase(); // Cột "Tên sản phẩm"
                    let productSKU = row.cells[3].textContent.toLowerCase();  // Cột "SKU"

                    if (productName.includes(searchText) || productSKU.includes(searchText)) {
                        row.style.display = ""; // Hiển thị nếu khớp
                    } else {
                        row.style.display = "none"; // Ẩn nếu không khớp
                    }
                });
            });
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const openProductModalBtn = document.getElementById("openProductModal");
                const productTableBody = document.getElementById("productTable");
                let selectedWarehouseId = "${inventoryCheckDetails.warehouse != null ? inventoryCheckDetails.warehouse.warehouseId : ''}";
                selectedWarehouseId = selectedWarehouseId ? parseInt(selectedWarehouseId) : null;

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
                                displayProductList(productVar);
                            })
                            .catch(error => console.error("❌ Lỗi khi lấy danh sách sản phẩm:", error));
                });

                function displayProductList(productVar) {
                    if (!productTableBody) {
                        console.error("❌ Lỗi: Không tìm thấy phần tử productTableBody");
                        return;
                    }

                    productTableBody.innerHTML = "";

                    if (!Array.isArray(productVar) || productVar.length === 0) {
                        console.warn("⚠️ Cảnh báo: Không có sản phẩm nào trong kho này!", productVar);
                        productTableBody.innerHTML = "<tr><td colspan='7' class='text-center text-muted'>Không có sản phẩm nào!</td></tr>";
                        return;
                    }

                    productVar.forEach((product, index) => {
                        console.log(`🔹 Sản phẩm ${index + 1}:`, product);

                        product.inventoryBatches.forEach((batch) => {
                            const tr = document.createElement("tr");
                            console.log("variantId:", product.variantId);
                            tr.setAttribute("data-variant-id", product.variantId || "");


                            tr.innerHTML = `
<td><input type="checkbox" class="product-checkbox" value="\${product.variantId || ''}"></td>
<td>\${product.product?.productName || "N/A"}</td>
<td>\${product.size?.size_name || "N/A"}</td>
<td>\${product.sku || "N/A"}</td>
<td>\${batch.batchId || "N/A"}</td>
<td>\${batch.quantity || "0"}</td>
<td>\${batch.unitPrice ? new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(batch.unitPrice) : "N/A"}</td>
<td>\${batch.expirationDate || "N/A"}</td>
`;

                            productTableBody.appendChild(tr);
                        });
                    });

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
                        if (!row || row.children.length < 7) { // Đảm bảo có đủ cột dữ liệu
                            console.error("⚠️ Lỗi: Không tìm thấy hàng hoặc số cột không đủ!");
                            return;
                        }

                        const productName = row.children[1]?.textContent.trim() || "Không có tên";
                        const sizeName = row.children[2]?.textContent.trim() || "Không có kích cỡ";
                        const sku = row.children[3]?.textContent.trim() || "Không có SKU";
                        const batch = row.children[4]?.textContent.trim() || "Không có Batch"; // Lấy batch từ cột 5
                        const stock = row.children[5]?.textContent.trim() || "0";
                        const price = row.children[6]?.textContent.trim() || "0";
                        const expirationDate = row.children[7]?.textContent.trim() || "Không có ngày hết hạn";
                        const variantId = row.dataset.variantId || "Không có Variant ID"; // Lấy Variant ID

                        const productInfo = productName + " - " + sizeName + " - " + sku;
                        console.log("Chuỗi ghép:", productInfo);
                        // Kiểm tra sản phẩm đã tồn tại chưa (dựa trên SKU & Batch)
                        const existingProduct = [...document.querySelectorAll(".selected-product")]
                                .find(product => product.dataset.sku === sku && product.dataset.batch === batch);
                        if (existingProduct) {
                            console.warn(`⚠️ Sản phẩm "${productName}" (SKU: ${sku}, Batch: ${batch}) đã tồn tại, không thêm lại!`);
                            return;
                        }




                        console.log("📌 Dữ liệu trước khi thêm vào UI:", {productName, sizeName, sku, batch, stock, price, variantId});
                        // ✅ Tạo hàng sản phẩm (tr)
                        const productRow = document.createElement("tr");
                        productRow.classList.add("selected-product");
                        productRow.dataset.sku = sku; // Lưu SKU để kiểm tra trùng
                        productRow.dataset.batch = batch; // Lưu batch để phân biệt lô
                        productRow.dataset.price = price; // Lưu giá nhập vào dataset
                        productRow.dataset.variantId = variantId;
                        // Tạo các cột (td)
                        const nameCol = document.createElement("td");
                        nameCol.textContent = productInfo;
                        nameCol.style.wordWrap = "break-word";
                        nameCol.style.whiteSpace = "normal";
                        nameCol.style.width = "250px";
                        const batchCol = document.createElement("td");
                        batchCol.textContent = batch;
                        batchCol.style.width = "120px";
                        batchCol.style.textAlign = "center";
                        const stockCol = document.createElement("td");
                        stockCol.textContent = stock;
                        stockCol.style.width = "120px";
                        stockCol.style.textAlign = "center";


                        const today = new Date();
                        const expDate = new Date(expirationDate);
                        console.log("📅 Ngày hết hạn:", expDate);
                        console.log("📅 Hôm nay:", today);
                        const isExpired = expDate < today;
                        const actualStockCol = document.createElement("td");
                        const actualStockInput = document.createElement("input");
                        actualStockCol.style.width = "120px";
                        actualStockInput.type = "number";
                        actualStockInput.classList.add("form-control");
                        actualStockInput.value = isExpired ? stock : "";
                        console.log(`📦 Số lượng tồn sản phẩm:` + stock);
                        actualStockInput.placeholder = "Số lượng";
//                        actualStockInput.min = "0"; // Số lượng phải lớn hơn 0

                        actualStockInput.onblur = function () {
                            let numValue = Number(actualStockInput.value);
                            if (!Number.isInteger(numValue) || numValue < 0) {
                                alert("⚠ Vui lòng nhập số nguyên dương!");
                                actualStockInput.value = ""; // Reset về rỗng
                            }
                            updateTotalDifference();
                        };
                        actualStockCol.appendChild(actualStockInput);


                        const differenceCol = document.createElement("td");
                        const differenceSpan = document.createElement("span");
                        differenceSpan.classList.add("difference");
                        differenceCol.appendChild(differenceSpan);
                        differenceCol.style.textAlign = "center";

                        const priceCol = document.createElement("td"); // Cột giá trị chênh lệch
                        const priceDifferenceSpan = document.createElement("span");
                        priceDifferenceSpan.classList.add("price-diff");
                        priceCol.appendChild(priceDifferenceSpan); // Đưa span vào cột
                        priceCol.style.width = "120px";
                        priceCol.style.textAlign = "center";

                        const expCol = document.createElement("td");
                        expCol.textContent = expirationDate;
                        expCol.style.width = "120px";
                        expCol.style.textAlign = "center";
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
                        // Kiểm tra và cập nhật nếu hết hạn
                        if (isExpired) {
                            reasonSelect.value = "Hết hạn";
                            reasonSelect.disabled = true;
                            actualStockInput.value = "0"; // Đặt tồn thực tế thành 0
                            actualStockInput.disabled = true; // Ngăn người dùng chỉnh sửa số lượng
                            console.log(`✅ Đã đặt lý do mặc định thành "Hết hạn" cho sản phẩm ${productName}`);
                            updateTotalDifference();
                        }

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
                        productRow.appendChild(batchCol);
                        productRow.appendChild(stockCol);
                        productRow.appendChild(actualStockCol);
                        productRow.appendChild(differenceCol);
                        productRow.appendChild(priceCol);
                        productRow.appendChild(expCol);
                        productRow.appendChild(reasonCol);
                        productRow.appendChild(removeCol);
                        selectedProductContainer.appendChild(productRow);
                        console.log("📌 Đã thêm sản phẩm vào selectedProductContainer!", selectedProductContainer);
                        actualStockInput.addEventListener("input", function () {
                            updateTotalDifference();
                            updatePriceDifference();
                        });
                        // 🟢 Thêm sự kiện xóa sản phẩm
                        removeBtn.addEventListener("click", function () {
                            productRow.remove();
                        });
                    });
                    // 🔹 Đóng modal sau khi chọn sản phẩm
                    const modal = bootstrap.Modal.getInstance(document.getElementById("searchProductModal"));
                    modal.hide();
                    updateTotalDifference();
                    updatePriceDifference();
                });
                function updateTotalDifference() {
                    let totalDifferenceUp = 0; // Tổng sản phẩm lệch tăng
                    let totalDifferenceDown = 0; // Tổng sản phẩm lệch giảm

                    document.querySelectorAll(".selected-product").forEach(row => {
                        const stock = parseInt(row.children[2].textContent.trim()) || 0; // Lấy tồn kho
                        const actualStockInput = row.children[3].querySelector("input"); // Ô nhập tồn thực tế
                        const differenceSpan = row.children[4].querySelector("span"); // Ô hiển thị chênh lệch

                        let actualStock = parseInt(actualStockInput.value) || 0; // Lấy giá trị tồn thực tế nhập vào

//                        // Nếu tồn thực tế nhập vào nhỏ hơn 0 hoặc không hợp lệ, đặt về 1
//                        if (actualStock < 0 || isNaN(actualStock)) {
//                            actualStock = 0;
//                            actualStockInput.value = 0; // Cập nhật lại giá trị
//                        }

                        const difference = actualStock - stock; // Tính số lượng chênh lệch
                        differenceSpan.textContent = difference; // Cập nhật vào ô hiển thị

                        // Cập nhật tổng số lượng lệch tăng và giảm
                        if (difference > 0) {
                            totalDifferenceUp += difference;
                        } else if (difference < 0) {
                            totalDifferenceDown += difference;
                        }
                    });
                    // Cập nhật vào phần Tổng kết
                    document.getElementById("totalDifferenceUp").textContent = totalDifferenceUp;
                    document.getElementById("totalDifferenceDown").textContent = totalDifferenceDown;
                }

                function updatePriceDifference() {
                    let totalPriceDifferenceUp = 0; // Tổng giá trị lệch tăng
                    let totalPriceDifferenceDown = 0; // Tổng giá trị lệch giảm

                    document.querySelectorAll(".selected-product").forEach(row => {
                        const stock = parseInt(row.children[2].textContent.trim()) || 0; // Lấy tồn kho
                        const actualStockInput = row.children[3].querySelector("input"); // Ô nhập tồn thực tế
                        const differenceSpan = row.children[4].querySelector("span"); // Ô hiển thị chênh lệch số lượng
                        const priceStr = row.dataset.price.replace(/\./g, '').replace(',', '.'); // Xóa dấu chấm, đổi dấu phẩy thành dấu chấm
                        const price = parseFloat(priceStr) || 0;
                        console.log(price);
                        const priceDifferenceSpan = row.children[5].querySelector("span"); // Ô hiển thị giá trị chênh lệch



                        let actualStock = parseInt(actualStockInput.value) || 0; // Lấy giá trị tồn thực tế nhập vào

                        // ✅ Nếu tồn thực tế nhập vào nhỏ hơn 1 hoặc không hợp lệ, đặt về 1
//                        if (actualStock < 0 || isNaN(actualStock)) {
//                            actualStock = 0;
//                            actualStockInput.value = 0; // Cập nhật lại giá trị
//                        }

                        const difference = actualStock - stock;
                        differenceSpan.textContent = difference; // Cập nhật ô chênh lệch

                        const priceDifference = price * difference; // Tính giá trị chênh lệch
                        priceDifferenceSpan.textContent = priceDifference.toLocaleString('vi-VN') + " VNĐ"; // Hiển thị giá trị chênh lệch

                        // ✅ Cập nhật tổng giá trị lệch tăng và giảm
                        if (priceDifference > 0) {
                            totalPriceDifferenceUp += priceDifference;
                        } else if (priceDifference < 0) {
                            totalPriceDifferenceDown += priceDifference;
                        }
                    });
// Cập nhật vào phần Tổng kết
                    document.getElementById("totalPriceDifferenceUp").textContent = totalPriceDifferenceUp.toLocaleString('vi-VN') + " VNĐ";
                    document.getElementById("totalPriceDifferenceDown").textContent = totalPriceDifferenceDown.toLocaleString('vi-VN') + " VNĐ";
                }

            });
        </script>

        <script>
            document.getElementById("submitOrderBtn").addEventListener("click", async function (event) {
                event.preventDefault();
                console.log("===> Bắt đầu xử lý nhập hàng");
                // Lấy thông tin từ biến backend đã load sẵn
                const staffId = "${inventoryCheckDetails.reviewedBy.userId}";
                const warehouseId = "${inventoryCheckDetails.warehouse.warehouseId}";
                //const checkId = document.getElementById("checkId").textContent.replace("#", "").trim();
                const checkId = "${inventoryCheckDetails.checkId}";
                if (!staffId || staffId === "null") {
                    alert("Không tìm thấy thông tin người giám sát.");
                    return;
                }
                if (!warehouseId || warehouseId === "null") {
                    alert("Không tìm thấy thông tin kho.");
                    return;
                }

                console.log("🔹 Staff ID (Người giám sát):", staffId);
                console.log("🔹 Warehouse ID (Kho nhập):", warehouseId);
                console.log("🔹 Check ID (Mã phiếu):", checkId);
                // Lấy tổng số lượng và tổng tiền chênh lệch
                const totalDifferenceUp = parseInt(document.getElementById("totalDifferenceUp")?.textContent.trim() || "0", 10);
                const totalDifferenceDown = parseInt(document.getElementById("totalDifferenceDown")?.textContent.trim() || "0", 10);
                const totalPriceDifferenceUp = parseFloat(document.getElementById("totalPriceDifferenceUp")?.textContent.replace(" VND", "").replace(/\./g, "").trim() || "0");
                const totalPriceDifferenceDown = parseFloat(document.getElementById("totalPriceDifferenceDown")?.textContent.replace(" VND", "").replace(/\./g, "").trim() || "0");
                console.log("🔹 Tổng chênh lệch tăng:", totalDifferenceUp);
                console.log("🔹 Tổng chênh lệch giảm:", totalDifferenceDown);
                console.log("🔹 Tổng tiền chênh lệch tăng:", totalPriceDifferenceUp);
                console.log("🔹 Tổng tiền chênh lệch giảm:", totalPriceDifferenceDown);
                // Lấy thông tin nhân viên kiểm kho & ghi chú
                const warehouseStaff = document.getElementById("warehouseStaff")?.value.trim() || "";
                const notes = document.getElementById("notes")?.value.trim() || "";
                console.log("🔹 Nhân viên kiểm kho:", warehouseStaff);
                console.log("🔹 Ghi chú:", notes);
                if (!warehouseStaff) {
                    alert("Vui lòng nhập tên nhân viên kiểm kho.");
                    return;
                }

                // Duyệt qua danh sách sản phẩm kiểm kho
                const productRows = document.querySelectorAll(".selected-product");
                console.log("🔹 Tổng số sản phẩm tìm thấy:", productRows.length);
                if (productRows.length === 0) {
                    alert("Không có sản phẩm nào để kiểm kho!");
                    return;
                }
                const inventoryData = [];
                async function fetchVariantId(sku) {
                    try {
                        console.log(`🔹 Fetching Variant ID for SKU: ${sku}`);
                        const response = await fetch(`/Gr1_Warehouse/getVariantId?sku=${sku}`);
                        if (!response.ok) {
                            throw new Error(`Lỗi từ server: ${response.status} - ${response.statusText}`);
                        }
                        const data = await response.json();
                        console.log("✅ API Response:", data);
                        if (data && data.variantId > 0) {
                            return data.variantId;
                        } else {
                            console.warn(`⚠️ Không tìm thấy Variant ID cho SKU: ${sku}`);
                            return null;
                        }
                    } catch (error) {
                        console.error("Lỗi lấy Variant ID:", error);
                        return null;
                    }
                }


                for (const row of productRows) {
                    console.log("Row HTML:", row.innerHTML);
                    const productInfo = row.children[0]?.textContent.trim() || "";
                    console.log("🔹 Product Info:", productInfo);
                    if (!productInfo) {
                        alert("Không tìm thấy thông tin sản phẩm.");
                        continue; // Bỏ qua sản phẩm này
                    }

                    const parts = productInfo.split(" - ");
                    const sku = parts.length > 1 ? parts[parts.length - 1].trim() : "";
                    console.log("🔹 SKU sau khi tách:", sku);
                    if (!sku) {
                        alert("Không tìm thấy SKU hợp lệ.");
                        continue; // Bỏ qua sản phẩm này
                    }

                    const reason = row.children[7]?.querySelector("select")?.value.trim();
                    const batch = row.children[1]?.textContent.trim(); // Lấy Batch từ cột thứ hai
                    let recordedQuantity = row.children[2]?.textContent.trim(); // Lấy tồn kho ghi nhận (stock)
                    let actualQuantity = row.children[3]?.querySelector("input")?.value.trim(); // Lấy số lượng thực nhập từ input
                    let difference = row.children[4]?.querySelector(".difference")?.textContent.trim(); // Lấy chênh lệch số lượng
                    let differencePrice = row.children[5]?.querySelector(".price-diff")?.textContent.trim(); // Lấy giá trị chênh lệch
                    let expirationDate = row.children[6]?.textContent.trim();
                    let variantId = row.dataset.variantId || row.getAttribute("data-variant-id");
                    console.log("Dataset của row:", row.dataset);
                    console.log("🔹 SKU:", sku);
                    console.log("🔹 Reason:", reason);
                    console.log("🔹 Batch:", batch);
                    console.log("🔹 Recorded Quantity:", recordedQuantity);
                    console.log("🔹 Actual Quantity:", actualQuantity);
                    console.log("🔹 Difference:", difference);
                    console.log("🔹 Difference Price:", differencePrice);
                    console.log("🔹 Expiration Date", expirationDate);
                    console.log("🔹 Variant ID:", variantId);
                    if (!sku || !actualQuantity || !recordedQuantity || !difference || !differencePrice) {
                        alert("Vui lòng kiểm tra lại thông tin sản phẩm.");
                        return;
                    }

                    actualQuantity = parseInt(actualQuantity, 10);
                    recordedQuantity = parseInt(recordedQuantity, 10);
                    difference = parseInt(difference, 10);
                    differencePrice = parseFloat(differencePrice.replace(/\./g, "").replace(",", "."));
                    if (!variantId || parseInt(variantId) <= 0) {
                        variantId = await fetchVariantId(sku);
                        if (!variantId) {
                            alert(`Không thể tìm thấy Variant ID cho SKU: ${sku}. Hãy kiểm tra lại!`);
                            continue; // Chuyển sang sản phẩm tiếp theo
                        }
                    }

                    inventoryData.push({
                        sku,
                        actualQuantity,
                        recordedQuantity,
                        difference,
                        differencePrice,
                        expirationDate,
                        variantId,
                        batch,
                        reason
                    });
                }
                console.log("Dữ liệu gửi lên server:", inventoryData);
                if (inventoryData.length === 0) {
                    alert("Không có sản phẩm nào để kiểm kho.");
                    return;
                }

                // Chuẩn bị dữ liệu gửi lên server
                const requestData = {
                    staffId,
                    warehouseId,
                    warehouseStaff,
                    totalDifferenceUp,
                    totalDifferenceDown,
                    totalPriceDifferenceUp,
                    totalPriceDifferenceDown,
                    notes,
                    checkId: checkId,
                    inventoryItems: inventoryData
                };
// Gửi dữ liệu lên server
                try {
                    console.log("Dữ liệu gửi lên server:", requestData);
                    const response = await fetch("/Gr1_Warehouse/complete-inventory-check", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify(requestData)
                    });
                    console.log("Response status:", response.status);
                    const responseData = await response.json();
                    console.log("Response data:", responseData);
                    if (response.ok && responseData.status === "success") {
                        alert("Kiểm kho thành công!");
                        window.location.href = "/Gr1_Warehouse/staff-checklist";
                    } else {
                        alert("Có lỗi xảy ra: " + responseData.message);
                    }
                } catch (error) {
                    console.error("Lỗi kết nối:", error);
                    alert("Lỗi kết nối: " + error.message);
                }
            });
        </script>
        <style>
            .text-muted {
                display: inline;
            }

            .separator {
                margin: 0 10px;
            }

            strong {
                margin-left: 5px;
            }

            .modal-dialog {
                max-width: 1300px; /* Giới hạn chiều rộng modal */
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