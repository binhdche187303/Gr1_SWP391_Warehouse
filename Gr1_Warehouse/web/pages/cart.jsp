<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

    <head>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon">
        <title>Shop List</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

        <!-- wow css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css" />

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css">

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css">

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css">

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css">

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>


    <body>

        <!-- Header Start -->
        <%@ include file="/includes/header.jsp" %> <!-- Nhúng header -->
        <!-- Header End -->

        <!-- mobile fix menu start -->
        <div class="mobile-menu d-md-none d-block mobile-cart">
            <ul>
                <li class="active">
                    <a href="index.html">
                        <i class="iconly-Home icli"></i>
                        <span>Home</span>
                    </a>
                </li>

                <li class="mobile-category">
                    <a href="javascript:void(0)">
                        <i class="iconly-Category icli js-link"></i>
                        <span>Category</span>
                    </a>
                </li>

                <li>
                    <a href="search.html" class="search-box">
                        <i class="iconly-Search icli"></i>
                        <span>Search</span>
                    </a>
                </li>

                <li>
                    <a href="wishlist.html" class="notifi-wishlist">
                        <i class="iconly-Heart icli"></i>
                        <span>My Wish</span>
                    </a>
                </li>

                <li>
                    <a href="cart.html">
                        <i class="iconly-Bag-2 icli fly-cate"></i>
                        <span>Cart</span>
                    </a>
                </li>
            </ul>
        </div>
        <section class="breadscrumb-section pt-0">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="breadscrumb-contain">
                            <h2>Cart</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="index.html">
                                            <i class="fa-solid fa-house"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Cart Section Start -->
        <section class="cart-section section-b-space">
            <div class="container-fluid-lg">
                <div class="row g-sm-5 g-3">
                    <div class="col-xxl-9">
                        <div class="cart-table">
                            <div class="table-responsive-xl">
                                <c:choose>
                                    <c:when test="${not empty cartItems}">
                                        <table class="table">
                                            <tbody>
                                                <c:set var="totalAmount" value="0" />
                                                <c:forEach var="item" items="${cartItems}">
                                                    <c:set var="totalAmount" value="${totalAmount + (item.price * item.quantity)}" />
                                                    <tr class="product-box-contain">
                                                        <td style="width: 20px; min-width: 20px">
                                                            <input type="checkbox" class="checkout-checkbox" data-price="${item.price * item.quantity}"  data-product-id="${item.productId}" onchange="updateTotal()">
                                                        </td>
                                                        <td class="product-detail">
                                                            <div class="product border-0">
                                                                <a href="shopDetails?productId=${item.productId}" class="product-image">
                                                                    <img src="./${item.image}" class="img-fluid blur-up lazyload" alt="">
                                                                </a>
                                                                <div class="product-detail">
                                                                    <ul>
                                                                        <li class="name">
                                                                            <a href="shopDetails?productId=${item.productId}">${item.productName}</a>
                                                                        </li>
                                                                        <li>
                                                                            <select data-product-id="${item.productId}"
                                                                                    data-size-id="${item.sizeId}" id="typeSize-${item.productId}" name="variantId" class="form-select size-select select-size" data-price="${item.price}" data-stock="${item.quantity}">
                                                                                <c:forEach var="variant" items="${sizeOptions[item.productId]}">
                                                                                    <option value="${variant.size.size_id}" data-price="${variant.price}" data-stock="${variant.stock}"
                                                                                            ${variant.size.size_id == item.sizeId ? 'selected' : ''}>
                                                                                        ${variant.size.size_name} - ${variant.price}₫ (Còn: ${variant.stock})
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </li>
                                                                        <input type="hidden" name="sizeId" value="${item.sizeId}">
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="price">
                                                            <h4 class="table-title text-content">Price</h4>
                                                            <h5>${item.price}₫</h5>
                                                        </td>
                                                        <td class="quantity">
                                                            <h4 class="table-title text-content">Qty</h4>
                                                            <div class="quantity-price">
                                                                <div class="cart_qty">
                                                                    <div class="input-group">
                                                                        <button type="button" class="btn qty-left-minus"
                                                                                data-product-id="${item.productId}"
                                                                                data-size-id="${item.sizeId}"
                                                                                >
                                                                            <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                                                        </button>
                                                                        <input class="form-control input-number qty-input"
                                                                               type="text" name="quantity" value="${item.quantity}"
                                                                               data-product-id="${item.productId}">
                                                                        <button type="button" class="btn qty-right-plus"
                                                                                data-product-id="${item.productId}"
                                                                                data-size-id="${item.sizeId}"
                                                                                >
                                                                            <i class="fa fa-plus ms-0" aria-hidden="true"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="subtotal">
                                                            <h4 class="table-title text-content">Total</h4>
                                                            <h5>${item.price * item.quantity}₫</h5>
                                                        </td>
                                                        <td class="save-remove">
                                                            <h4 class="table-title text-content">Action</h4>
                                                            <a class="remove close_button" onclick="removeFromCart(${item.cartId})">Remove</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-warning text-center" role="alert">
                                            🛒 Giỏ hàng của bạn đang trống!
                                        </div>
                                        <div class="text-center">
                                            <a href="shop" class="btn btn-primary">🛍️ Mua sắm ngay</a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div class="col-xxl-3">
                        <div class="summery-box p-sticky">
                            <div class="summery-header">
                                <h3>Cart Total</h3>
                            </div>

                            <div class="summery-contain">
                                <div class="coupon-cart">
                                    <h6 class="text-content mb-2">Coupon Apply</h6>
                                    <div class="mb-3 coupon-box input-group">
                                        <input type="text" class="form-control" placeholder="Enter Coupon Code Here...">
                                        <button class="btn-apply">Apply</button>
                                    </div>
                                </div>
                                <ul>
                                    <li>
                                        <h4>Subtotal</h4>
                                        <h4 class="price" id="subtotalAmount">0₫</h4>
                                    </li>
                                    <li>
                                        <h4>Coupon Discount</h4>
                                        <h4 class="price">(-) 0.00</h4>
                                    </li>
                                    <li class="align-items-start">
                                        <h4>Shipping</h4>
                                        <h4 class="price text-end">6.90₫</h4>
                                    </li>
                                </ul>
                            </div>

                            <ul class="summery-total">
                                <li class="list-total border-top-0">
                                    <h4>Total (USD)</h4>
                                    <h4 class="price theme-color" id="totalAmount">0₫</h4>
                                </li>
                            </ul>

                            <div class="button-group cart-button">
                                <ul>
                                    <li>
                                        <button onclick="processCheckout()" class="btn btn-animation proceed-btn fw-bold">Process To Checkout</button>
                                    </li>
                                    <li>
                                        <button onclick="location.href = 'index.html';" class="btn btn-light shopping-button text-dark">
                                            <i class="fa-solid fa-arrow-left-long"></i> Return To Shopping
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <script>
                        function updateTotal() {
                            let total = 0;
                            document.querySelectorAll(".checkout-checkbox").forEach((checkbox) => {
                                if (checkbox.checked) {
                                    total += parseFloat(checkbox.getAttribute("data-price"));
                                }
                            });

                            document.getElementById("subtotalAmount").innerText = total.toLocaleString("vi-VN") + "₫";
                            document.getElementById("totalAmount").innerText = total.toLocaleString("vi-VN") + "₫";
                        }

                        async function processCheckout() {
                            let selectedItems = [];
                            document.querySelectorAll(".checkout-checkbox:checked").forEach((checkbox) => {
                                selectedItems.push(checkbox.getAttribute("data-product-id"));
                            });

                            if (selectedItems.length === 0) {
                                alert("Vui lòng chọn sản phẩm để thanh toán!");
                                return;
                            }

                            try {
                                let response = await fetch("checkout", {
                                    method: "POST",
                                    headers: {
                                        "Content-Type": "application/json"
                                    },
                                    body: JSON.stringify({
                                        type: "cart",
                                        items: selectedItems
                                    })
                                });

                                let result = await response.json();

                                if (result.status === "success") {
                                    window.location.href = "checkout";
                                } else {
                                    alert("Lỗi: " + result.message);
                                }
                            } catch (error) {
                                console.error("Lỗi khi gửi yêu cầu:", error);
                                alert("Đã xảy ra lỗi, vui lòng thử lại!");
                            }
                        }
                    </script>
                </div>
            </div>
        </section>

        <%@ include file="/includes/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Latest jQuery -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- jQuery UI -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
        <script>
                        document.querySelectorAll(".qty-left-minus, .qty-right-plus").forEach(button => {
                            button.addEventListener("click", function () {

                                let productId = this.getAttribute("data-product-id");
                                let typeSizeSelect = document.querySelector("#typeSize-" + productId);
                                let selectedOption = typeSizeSelect.options[typeSizeSelect.selectedIndex];
                                let typeSizeId = selectedOption.value;
                                let sizeId = this.getAttribute("data-size-id");
                                let inputField = document.querySelector(".qty-input[data-product-id='" + productId + "']");
                                let currentQuantity = parseInt(inputField.value);
                                let newQuantity = currentQuantity; // Giữ giá trị cũ phòng khi có lỗi

                                // Gửi AJAX kiểm tra stock
                                fetch("check-stock?productId=" + productId + "&sizeId=" + sizeId + "&newSize=" + typeSizeId)
                                        .then(response => response.json())
                                        .then(data => {
                                            let stock = data.stock;

                                            if (this.classList.contains("qty-left-minus") && currentQuantity > 1) {
                                                newQuantity = currentQuantity - 1;
                                            } else if (this.classList.contains("qty-right-plus")) {
                                                if (currentQuantity < stock) {
                                                    newQuantity = currentQuantity + 1;
                                                } else {
                                                    alert("Sản phẩm đã hết hàng!");
                                                    return;
                                                }
                                            }

                                            // Cập nhật số lượng trong input ngay lập tức
                                            inputField.value = newQuantity;

                                            // Gửi yêu cầu cập nhật giỏ hàng
                                            fetch("update-cart", {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-www-form-urlencoded"
                                                },
                                                body: "productId=" + productId + "&quantity=" + newQuantity + "&newSize=" + typeSizeId
                                            })
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data.success) {
                                                            console.log("Cập nhật thành công!");
                                                            location.reload(); // Reload lại trang để cập nhật tổng giá và mọi thứ khác
                                                        } else {
                                                            alert("Có lỗi xảy ra khi cập nhật giỏ hàng!");
                                                            inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                                        }
                                                    })
                                                    .catch(error => {
                                                        console.error("Lỗi khi gửi request cập nhật giỏ hàng:", error);
                                                        inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                                    });
                                        })
                                        .catch(error => {
                                            console.error("Lỗi khi kiểm tra stock:", error);
                                            inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                        });
                            });
                        });

                        document.querySelectorAll(".select-size").forEach(button => {
                            button.addEventListener("change", function () {

                                let productId = this.getAttribute("data-product-id");
                                let typeSizeSelect = document.querySelector("#typeSize-" + productId);
                                let selectedOption = typeSizeSelect.options[typeSizeSelect.selectedIndex];
                                let typeSizeId = selectedOption.value;
                                let sizeId = this.getAttribute("data-size-id");
                                let inputField = document.querySelector(".qty-input[data-product-id='" + productId + "']");
                                let currentQuantity = parseInt(inputField.value);
                                let newQuantity = currentQuantity; // Giữ giá trị cũ phòng khi có lỗi

                                // Gửi AJAX kiểm tra stock
                                fetch("check-stock?productId=" + productId + "&sizeId=" + sizeId + "&newSize=" + typeSizeId)
                                        .then(response => response.json())
                                        .then(data => {
                                            let stock = data.stock;

                                            if (this.classList.contains("qty-left-minus") && currentQuantity > 1) {
                                                newQuantity = currentQuantity - 1;
                                            } else if (this.classList.contains("qty-right-plus")) {
                                                if (currentQuantity < stock) {
                                                    newQuantity = currentQuantity + 1;
                                                } else {
                                                    alert("Sản phẩm đã hết hàng!");
                                                    return;
                                                }
                                            }

                                            // Cập nhật số lượng trong input ngay lập tức
                                            inputField.value = newQuantity;

                                            // Gửi yêu cầu cập nhật giỏ hàng
                                            fetch("update-cart", {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-www-form-urlencoded"
                                                },
                                                body: "productId=" + productId + "&quantity=" + newQuantity + "&newSize=" + typeSizeId
                                            })
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data.success) {
                                                            console.log("Cập nhật thành công!");
                                                            location.reload(); // Reload lại trang để cập nhật tổng giá và mọi thứ khác
                                                        } else {
                                                            alert("Có lỗi xảy ra khi cập nhật giỏ hàng!");
                                                            inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                                        }
                                                    })
                                                    .catch(error => {
                                                        console.error("Lỗi khi gửi request cập nhật giỏ hàng:", error);
                                                        inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                                    });
                                        })
                                        .catch(error => {
                                            console.error("Lỗi khi kiểm tra stock:", error);
                                            inputField.value = currentQuantity; // Nếu lỗi, khôi phục số lượng ban đầu
                                        });
                            });
                        });

                        function removeFromCart(cartId) {
                            fetch("remove-cart", {
                                method: "POST",
                                headers: {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                },
                                body: "cartId=" + cartId
                            })
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data.success) {
                                            location.reload();
                                        } else {
                                            alert("Xóa sản phẩm thất bại!");
                                        }
                                    });
                        }

        </script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- Feather icon JS -->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Lazyload JS -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- Slick JS -->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick-animation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Price Range JS -->
        <script src="${pageContext.request.contextPath}/assets/js/ion.rangeSlider.min.js"></script>

        <!-- Quantity JS -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- Sidebar open JS -->
        <script src="${pageContext.request.contextPath}/assets/js/filter-sidebar.js"></script>

        <!-- WOW JS -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom-wow.js"></script>

        <!-- Script JS -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    </body>
</html>
