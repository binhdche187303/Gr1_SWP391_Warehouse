<%-- 
    Document   : shop-list
    Created on : Jan 27, 2025, 5:57:01 PM
    Author     : Huy Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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
        <title>Danh sách sản phẩm</title>

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
        <!-- mobile fix menu end -->

        <!-- Breadcrumb Section Start -->
        <section class="breadscrumb-section pt-0">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="breadscrumb-contain">
                            <h2>Cửa hàng</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="/Gr1_Warehouse/home">
                                            <i class="fa-solid fa-house"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Cửa hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Poster Section Start -->
        <section>
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="slider-1 slider-animate product-wrapper no-arrow">
                            <div>
                                <div class="banner-contain-2 hover-effect">
                                    <img src="${pageContext.request.contextPath}/assets/images/shop1.jpg" class="bg-img rounded-3 blur-up lazyload" alt="" data-src="${pageContext.request.contextPath}/assets/images/shop1.jpg">
                                    <div
                                        class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                        <div style="background-color: rgba(0, 0, 0, 0);">
                                            <h2>.</h2>
                                            <h3>.</h3>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div>
                                <div class="banner-contain-2 hover-effect">
                                    <img src="${pageContext.request.contextPath}/assets/images/shop2.jpg" class="bg-img rounded-3 blur-up lazyload" alt="" data-src="${pageContext.request.contextPath}/assets/images/shop2.jpg">
                                    <div
                                        class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                        <div style="background-color: rgba(0, 0, 0, 0);">
                                            <h2>.</h2>
                                            <h3>.</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Poster Section End -->

        <!-- Shop Section Start -->
        <section class="section-b-space shop-section">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-custome-3">
                        <div class="left-box wow fadeInUp">
                            <div class="shop-left-sidebar">
                                <div class="back-button">
                                    <h3><i class="fa-solid fa-arrow-left"></i> Back</h3>
                                </div>
                                <div class="accordion custome-accordion" id="accordionExample">
                                    <form action="shop" method="get" id="shopform">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                        data-bs-target="#collapseOne" aria-expanded="true"
                                                        aria-controls="collapseOne">
                                                    <span>Danh mục</span>
                                                </button>
                                            </h2>
                                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                                                <div class="accordion-body">
                                                    <ul class="category-list custom-padding custom-height">
                                                        <c:forEach var="cat" items="${requestScope.category}">
                                                            <li>
                                                                <div class="form-check ps-0 m-0 category-list-box">
                                                                    <input class="checkbox_animated" type="checkbox" name="category_id"
                                                                           value="${cat.category_id}" id="cat-${cat.category_id}"
                                                                           ${selectedCategories.contains(cat.category_id) ? 'checked' : ''}
                                                                           onchange="document.getElementById('shopform').submit()">

                                                                    <label class="form-check-label" for="cat-${cat.category_id}">
                                                                        <span class="name">${cat.category_name}</span>
                                                                        <span class="number">(${cat.totalProducts})</span>
                                                                    </label>
                                                                </div>
                                                            </li>
                                                        </c:forEach>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                        aria-expanded="false" aria-controls="collapseTwo">
                                                    <span>Thương Hiệu</span>
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
                                                <div class="accordion-body">
                                                    <ul class="category-list custom-padding">
                                                        <c:forEach var="brand" items="${requestScope.brand}">
                                                            <li>
                                                                <div class="form-check ps-0 m-0 category-list-box">
                                                                    <input class="checkbox_animated" type="checkbox" name="brand_id"
                                                                           value="${brand.brand_id}" id="brand-${brand.brand_id}"
                                                                           ${selectedBrands.contains(brand.brand_id) ? 'checked' : ''}
                                                                           onchange="document.getElementById('shopform').submit()">

                                                                    <label class="form-check-label" for="brand-${brand.brand_id}">
                                                                        <span class="name">${brand.brand_name}</span>
                                                                        <span class="number">(${brand.totalProducts})</span>
                                                                    </label>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingThree">
                                                <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                        aria-expanded="false" aria-controls="collapseThree">
                                                    <span>Khoảng Giá</span>
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                                <div class="accordion-body">
                                                    <div class="price-inputs d-flex">
                                                        <input type="number" name="minPrice" class="form-control me-2" placeholder="Min Price" value="${minPrice}">
                                                        <input type="number" name="maxPrice" class="form-control" placeholder="Max Price" value="${maxPrice}">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>



                                        <!-- Nút áp dụng filter -->
                                        <div class="text-center mt-3">
                                            <button type="submit" class="btn btn-primary">ÁP DỤNG</button>
                                        </div>
                                    </form>  
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-custome-9">
                        <div class="show-button">
                            <div class="filter-button-group mt-0">
                                <div class="filter-button d-inline-block d-lg-none">
                                    <a><i class="fa-solid fa-filter"></i> Filter Menu</a>
                                </div>
                            </div>

                            <div class="top-filter-menu">
                                <div class="category-dropdown">

                                    <form action="shop" method="get">
                                        <!-- Giữ lại các giá trị của các tham số category_id (dạng danh sách) -->
                                        <c:if test="${not empty paramValues.category_id}">
                                            <c:forEach var="catId" items="${paramValues.category_id}">
                                                <input type="hidden" name="category_id" value="${catId}" />
                                            </c:forEach>
                                        </c:if>

                                        <!-- Giữ lại các giá trị của các tham số brand_id (dạng danh sách) -->
                                        <c:if test="${not empty paramValues.brand_id}">
                                            <c:forEach var="brandId" items="${paramValues.brand_id}">
                                                <input type="hidden" name="brand_id" value="${brandId}" />
                                            </c:forEach>
                                        </c:if>

                                        <!-- Giữ lại giá trị của price_range (nếu có) -->
                                        <c:if test="${not empty param.price_range}">
                                            <input type="hidden" name="price_range" value="${param['price_range']}" />
                                        </c:if>

                                        <div class="form-group">
                                            <select name="sortOrder" class="form-select" onchange="this.form.submit()">
                                                <option value="" disabled selected>Giá : </option>
                                                <option value="asc" <c:if test="${param.sortOrder == 'asc'}">selected</c:if>>Giá: Thấp - Cao</option>
                                                <option value="desc" <c:if test="${param.sortOrder == 'desc'}">selected</c:if>>Giá: Cao - Thấp</option>
                                                </select>
                                            </div>
                                        </form>




                                    </div>

                                    <div class="grid-option d-none d-md-block">
                                        <ul>
                                            <li class="three-grid">
                                                <a href="javascript:void(0)">
                                                    <img src="${pageContext.request.contextPath}/assets/svg/grid-3.svg" class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                        <li class="grid-btn d-xxl-inline-block d-none">
                                            <a href="javascript:void(0)">
                                                <img src="${pageContext.request.contextPath}/assets/svg/grid-4.svg"
                                                     class="blur-up lazyload d-lg-inline-block d-none" alt="">
                                                <img src="${pageContext.request.contextPath}/assets/svg/grid.svg"
                                                     class="blur-up lazyload img-fluid d-lg-none d-inline-block" alt="">
                                            </a>
                                        </li>
                                        <li class="list-btn active">
                                            <a href="javascript:void(0)">
                                                <img src="${pageContext.request.contextPath}/assets/svg/list.svg" class="blur-up lazyload" alt="">
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div
                            class="row g-sm-4 g-3 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 product-list-section list-style">
                            <c:forEach var="product" items="${p_list}">
                                <div>
                                    <div class="product-box-3 h-100 wow fadeInUp">
                                        <div class="product-header">
                                            <div class="product-image">
                                                <a href="shopDetails?productId=${product.productId}">
                                                    <c:forEach var="image" items="${product.images}">
                                                        <img src="${pageContext.request.contextPath}/assets/images/img_products/${image.image_url.replaceFirst('^assets/images/img_products/', '')}" alt="${product.productName}" class="img-fluid blur-up lazyload">
                                                    </c:forEach>
                                                </a>


                                            </div>
                                        </div>
                                        <div class="product-footer">
                                            <div class="product-detail">
                                                <span class="span-name">${product.cate.category_name}</span>
                                                <a href="shopDetails?productId=${product.productId}">
                                                    <h5 class="name">${product.productName}</h5>
                                                </a>
                                                <p class="text-content mt-1 mb-2 product-content">${product.description}</p>
                                                <h6 class="unit">
                                                    <c:forEach var="variant" items="${product.variants}">
                                                        ${variant.size.size_name}
                                                    </c:forEach>
                                                </h6>
                                                <h5 class="price"><span class="theme-color">
                                                        <c:forEach var="variant" items="${product.variants}">
                                                            <fmt:formatNumber value="${variant.price}" type="number" groupingUsed="true" />₫
                                                        </c:forEach>


                                                        </div>
                                                        </div>
                                                        </div>
                                                        </div>





                                                    </c:forEach>

                                                    </div>

                                                    <%@ include file="/includes/paging.jsp" %>

                                                    </div>
                                                    </div>
                                                    </div>
                                                    </section>
                                                    <!-- Shop Section End -->

                                                    <!-- Footer Section Start -->
                                                    <%@ include file="/includes/footer.jsp" %> <!-- Nhúng header -->
                                                    <!-- Footer Section End -->

                                                    <!-- Add to cart Modal Start -->
                                                    <div class="add-cart-box">
                                                        <div class="add-iamge">
                                                            <img src="${pageContext.request.contextPath}/assets/images/cake/pro/1.jpg" class="img-fluid blur-up lazyload" alt="">
                                                        </div>

                                                        <div class="add-contain">
                                                            <h6>Added to Cart</h6>
                                                        </div>
                                                    </div>
                                                    <!-- Add to cart Modal End -->

                                                    <!-- Tap to top start -->
                                                    <div class="theme-option">
                                                        <div class="back-to-top">
                                                            <a id="back-to-top" href="#">
                                                                <i class="fas fa-chevron-up"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <!-- Tap to top end -->

                                                    <!-- Bg overlay Start -->
                                                    <div class="bg-overlay"></div>
                                                    <!-- Bg overlay End -->


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


                                                    </body>

                                                    </html>