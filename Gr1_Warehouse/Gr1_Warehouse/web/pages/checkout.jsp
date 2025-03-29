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
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Thanh toán</title>

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
                            <h2>Thanh toán</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="/Gr1_Warehouse/home">
                                            <i class="fa-solid fa-house"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Cart Section Start -->
        <section class="checkout-section-2 section-b-space">
            <form action="confirm-order" method="post">
                <div class="container-fluid-lg">
                    <div class="row g-sm-4 g-3">
                        <div class="col-lg-8">
                            <div class="left-sidebar-checkout">
                                <div class="checkout-detail-box">
                                    <ul>
                                        <li>
                                            <div class="checkout-icon">
                                                <lord-icon target=".nav-item" src="https://cdn.lordicon.com/ggihhudh.json"
                                                           trigger="loop-on-hover"
                                                           colors="primary:#121331,secondary:#646e78,tertiary:#0baf9a"
                                                           class="lord-icon">
                                                </lord-icon>
                                            </div>
                                            <div class="checkout-box">
                                                <c:if test="${not empty errors}">
                                                    <div class="alert alert-danger">
                                                        <ul>
                                                            <c:forEach var="error" items="${errors}">
                                                                <li>${error}</li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </c:if>
                                                <div class="checkout-title">
                                                    <h4>Thông tin giao hàng</h4>
                                                </div>

                                                <div class="checkout-detail">
                                                    <div class="customer-info">
                                                        <div class="mb-3">
                                                            <label for="customerName" class="form-label">Họ và tên:</label>
                                                            <input type="text" class="form-control" id="customerName" name="customerName" required value="${user.fullname}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="phoneNumber" class="form-label">SĐT:</label>
                                                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required value="${user.phone}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email:</label>
                                                            <input type="email" class="form-control" id="email" name="email" required value="${user.email}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="shippingAddress" class="form-label">Địa chỉ nhận hàng:</label>
                                                            <input type="text" class="form-control" id="shippingAddress" name="shippingAddress" required value="${user.address}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="notes" class="form-label">Ghi chú:</label>
                                                            <textarea class="form-control" id="notes" name="notes" rows="2"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="checkout-icon">
                                                <lord-icon target=".nav-item" src="https://cdn.lordicon.com/qmcsqnle.json"
                                                           trigger="loop-on-hover" colors="primary:#0baf9a,secondary:#0baf9a"
                                                           class="lord-icon">
                                                </lord-icon>
                                            </div>
                                            <div class="checkout-box">
                                                <div class="checkout-title">
                                                    <h4>Thanh toán</h4>
                                                </div>

                                                <div class="checkout-detail"> 
                                                    <div class="row g-4">
                                                        <div class="col-xxl-12">
                                                            <div class="delivery-option">
                                                                <div class="delivery-category">
                                                                    <div class="shipment-detail">
                                                                        <div class="custom-form-check form-check mb-0">
                                                                            <!-- Sửa lại ID cho đúng -->
                                                                            <input class="form-check-input mt-0" type="checkbox" id="paymentCod" name="paymentMethod" value="cod" onclick="toggleButton()">
                                                                            <label class="form-check-label" for="paymentCod">
                                                                                Tôi đồng ý thanh toán 50% giá trị đơn hàng
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="right-side-summery-box">
                                <div class="summery-box-2">
                                    <div class="summery-header">
                                        <h3>Tổng Hóa Đơn</h3>
                                    </div>

                                    <ul class="summery-contain">
                                        <c:set var="totalAmount" value="0" />
                                        <c:forEach var="item" items="${cartItems}">
                                            <c:set var="totalAmount" value="${totalAmount + (item.price * item.quantity)}" />
                                            <li>
                                                <img src="./${item.image}"
                                                     class="img-fluid blur-up lazyloaded checkout-image" alt="">
                                                <h4>${item.productName} <span>X ${item.quantity}</span></h4>
                                                <h4 class="price">
                                                    <fmt:formatNumber value="${item.price}" pattern="#,###" />₫
                                                </h4>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                    <ul class="summery-total">
                                        <li class="list-total">
                                            <h4>Tổng: </h4>
                                            <h4 class="price">
                                                <fmt:formatNumber value="${totalAmount}" pattern="#,###" />₫
                                            </h4>

                                        </li>
                                    </ul>
                                </div>


                                <button id="checkoutBtn" class="btn theme-bg-color text-white btn-md w-100 mt-4 fw-bold" disabled>Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <%@ include file="/includes/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Latest jQuery -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- jQuery UI -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>
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

        <script>
                                                                                function toggleButton() {
                                                                                    // Lấy đúng id của checkbox
                                                                                    const checkbox = document.getElementById("paymentCod");
                                                                                    const button = document.getElementById("checkoutBtn");

                                                                                    // Bật/tắt nút dựa trên checkbox
                                                                                    button.disabled = !checkbox.checked;
                                                                                }
        </script>
    </body>
</html>