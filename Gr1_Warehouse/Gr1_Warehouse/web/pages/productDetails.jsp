<%-- 
    Document   : productDetails
    Created on : Feb 15, 2025, 9:49:00 PM
    Author     : Huy Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <title>Chi tiết sản phẩm</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

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

        <!-- Product Left Sidebar Start -->
        <section class="product-section">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12 wow fadeInUp">
                        <div class="row g-4">
                            <div class="col-xl-6 wow fadeInUp">
                                <div class="product-left-box">
                                    <div class="row g-2">
                                        <div class="col-12">
                                            <div class="product-main-1 no-arrow">
                                                <c:forEach var="image" items="${product.images}">
                                                    <div>
                                                        <div class="slider-image">
                                                            <img src="${pageContext.request.contextPath}/${image.image_url}" 
                                                                 alt="${product.productName}" class="img-fluid blur-up lazyload">
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="bottom-slider-image left-slider no-arrow slick-top">
                                                <c:forEach var="image" items="${product.images}">
                                                    <div>
                                                        <div class="sidebar-image">
                                                            <img src="${pageContext.request.contextPath}/${image.image_url}" 
                                                                 alt="${product.productName}" class="img-fluid blur-up lazyload">
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="right-box-contain">
                                    <h2 class="name">${product.productName}</h2>

                                    <div class="price-rating">
                                        <h3 class="theme-color price">
                                            <span id="current-price">
                                                <fmt:formatNumber value="${product.variants[0].price}" type="number" groupingUsed="true"/>₫
                                            </span>
                                        </h3>
                                    </div>

                                    <div class="procuct-contain">
                                        <p>${product.description}</p>
                                    </div>

                                    <!-- Chọn kích thước -->
                                    <div class="product-packege">
                                        <div class="product-title">
                                            <h4>Phân loại: </h4>
                                        </div>
                                        <ul class="select-packege">
                                            <c:forEach var="variant" items="${product.variants}" varStatus="status">
                                                <li>
                                                    <a href="javascript:void(0)" class="${status.first ? 'active' : ''}" 
                                                       data-price="${variant.price}" 
                                                       data-variant-id="${variant.size.size_id}"
                                                       data-stock="${variant.stock}" 
                                                       onclick="updatePriceAndVariant(this)">
                                                        ${variant.size.size_name}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                    <form action="cart" method="post">
                                        <div class="note-box product-packege">
                                            <div class="cart_qty qty-box product-qty">
                                                <div class="input-group">
                                                    <button type="button" class="qty-right-plus" onclick="changeQuantity(1)">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                                    <input class="form-control input-number qty-input" type="number" name="quantity" id="quantity" value="1" min="1">
                                                    <button type="button" class="qty-left-minus" onclick="changeQuantity(-1)">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="productId" value="${product.productId}">
                                            <input type="hidden" id="selected-variant-id" name="size" value="${product.variants[0].size.size_id}">
                                            <button type="submit" class="btn btn-md bg-dark cart-button text-white w-100">Thêm vào giỏ hàng</button>
                                        </div>
                                    </form>

                                    <div class="pickup-box">
                                        <div class="product-title">
                                            <h4>Thông tin sản phẩm: </h4>
                                        </div>

                                        <div class="product-info">
                                            <ul class="product-info-list product-info-list-2">
                                                <li>Thương hiệu : <a href="javascript:void(0)">${product.brand.brand_name}</a></li>
                                                <li>Số lượng tồn kho: 
                                                    <a><span id="current-stock">${product.variants[0].stock}</span></a>
                                                </li>
                                                <li>Danh mục : <a href="javascript:void(0)">${product.cate.category_name}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Product Left Sidebar End -->
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>

        <!-- Releted Product Section Start -->
        <section class="product-list-section section-b-space">
            <div class="container-fluid-lg">
                <div class="title">
                    <h2>Sản phẩm liên quan</h2>
                    <span class="title-leaf">
                        <svg class="icon-width">
                        <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                        </svg>
                    </span>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="slider-6_1 product-wrapper">
                            <c:forEach var="product" items="${relatedProduct}">
                                <div>
                                    <div class="product-box-3 wow fadeInUp">
                                        <div class="product-header">
                                            <div class="product-image">
                                                <a href="shopDetails?productId=${product.productId}">
                                                    <img src="${product.images[0].image_url}"
                                                         class="img-fluid blur-up lazyload" alt="${product.productName}">
                                                </a>


                                            </div>
                                        </div>

                                        <div class="product-footer">
                                            <div class="product-detail">
                                                <span class="span-name">${product.cate.category_name}</span>
                                                <a href="shopDetails?productId=${product.productId}">
                                                    <h5 class="name">${product.productName}</h5>
                                                </a>

                                                <h5 class="price">
                                                    <fmt:formatNumber value="${product.variants[0].price}" type="number" groupingUsed="true"/>₫
                                                </h5>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                      
                    </div>
                </div>
            </div>
        </section>

        <!-- Releted Product Section End -->

        <!-- Footer Section Start -->
        <%@ include file="/includes/footer.jsp" %> 
        <!-- Footer Section End -->


        <!-- Tap to top start -->
        <div class="theme-option">
            <div class="back-to-top">
                <a id="back-to-top" href="#">
                    <i class="fas fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <!-- Tap to top end -->

        <!-- Sticky Cart Box Start -->
        <div class="sticky-bottom-cart">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <form action="cart" method="post">
                            <div class="cart-content">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/${product.images[0].image_url}" class="img-fluid blur-up lazyload"
                                         alt="">
                                    <div class="content">
                                        <h5>${product.productName}</h5>
                                        <h6 class="theme-color price">
                                            <span id="current-price2">${product.variants[0].price}</span>đ
                                        </h6>
                                    </div>
                                </div>
                                <div class="selection-section">
                                    <div class="form-group mb-0">
                                        <select id="input-state" class="form-control form-select" onchange="updatePriceAndVariant2(this)">
                                            <option selected disabled>Chọn phân loại</option>
                                            <c:forEach var="variant" items="${product.variants}" varStatus="status">
                                                <option value="${variant.size.size_id}" data-price="${variant.price}">
                                                    ${variant.size.size_name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>


                                    <div class="cart_qty qty-box product-qty m-0">
                                        <div class="input-group h-100">
                                            <button type="button" class="qty-left-minus" data-type="minus" data-field="">
                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                            </button>
                                            <input class="form-control input-number qty-input" type="text" name="quantity"
                                                   value="1">
                                            <button type="button" class="qty-right-plus" data-type="plus" data-field="">
                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                            </button>
                                        </div>

                                    </div>

                                </div>
                                <div class="add-btn">
                                    <button type="submit" class="btn theme-bg-color text-white">
                                        <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                                    </button>
                                </div>

                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${product.productId}">
                                <input type="hidden" id="selected-variant-id2" name="size" value="${product.variants[0].size.size_id}">

                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sticky Cart Box End -->

        <!-- Bg overlay Start -->
        <div class="bg-overlay"></div>
        <!-- Bg overlay End -->

        <!-- latest jquery-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

        <!-- jquery ui-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.min.js"></script>

        <!-- Bootstrap js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/popper.min.js"></script>

        <!-- feather icon js-->
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather/feather-icon.js"></script>

        <!-- Lazyload Js -->
        <script src="${pageContext.request.contextPath}/assets/js/lazysizes.min.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick-animation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom-slick-animated.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Price Range Js -->
        <script src="${pageContext.request.contextPath}/assets/js/ion.rangeSlider.min.js"></script>

        <!-- sidebar open js -->
        <script src="${pageContext.request.contextPath}/assets/js/filter-sidebar.js"></script>

        <!-- Quantity js -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- Zoom Js -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.elevatezoom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/zoom-filter.js"></script>

        <!-- Timer Js -->
        <script src="${pageContext.request.contextPath}/assets/js/timer1.js"></script>

        <!-- Sticky-bar js -->
        <script src="${pageContext.request.contextPath}/assets/js/sticky-cart-bottom.js"></script>

        <!-- WOW js -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom-wow.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
        <script>
                                            function updatePriceAndVariant2(selectElement) {
                                                // Lấy option được chọn
                                                var selectedOption = selectElement.options[selectElement.selectedIndex];

                                                // Lấy dữ liệu từ thuộc tính data-price và value của option đã chọn
                                                var price = selectedOption.getAttribute('data-price');
                                                var variantId = selectedOption.value;

                                                // Cập nhật giá trị của input hidden
                                                document.getElementById('selected-variant-id2').value = variantId;

                                                // Cập nhật giá hiển thị
                                                document.getElementById('current-price2').innerText = price;
                                            }

                                            function updatePriceAndVariant(element) {
                                                // Xóa class active của tất cả các lựa chọn
                                                document.querySelectorAll('.select-packege a').forEach(a => a.classList.remove('active'));

                                                // Thêm class active cho phần tử được chọn
                                                element.classList.add('active');

                                                // Lấy dữ liệu từ thuộc tính data-variant-id, data-price và data-stock
                                                let variantId = element.getAttribute('data-variant-id');
                                                let price = element.getAttribute('data-price');
                                                let stock = element.getAttribute('data-stock');

                                                // Cập nhật giá trị của input hidden
                                                document.getElementById('selected-variant-id').value = variantId;

                                                // Cập nhật giá hiển thị
                                                document.getElementById('current-price').innerText = price;

                                                // Cập nhật tồn kho hiển thị
                                                document.getElementById('current-stock').innerText = stock;
                                            }




                                            function changeQuantity(change) {
                                                let quantityInput = document.getElementById('quantity');
                                                let currentValue = parseInt(quantityInput.value);
                                                if (!isNaN(currentValue)) {
                                                    let newValue = currentValue + change;
                                                    if (newValue > 0) {
                                                        quantityInput.value = newValue;
                                                    }
                                                }
                                            }
        </script>

    </body>

</html>