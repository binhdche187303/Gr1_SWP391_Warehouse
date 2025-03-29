<%-- 
    Document   : home
    Created on : Jan 26, 2025, 9:53:34 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Trang chủ</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/animate.css">

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

        <!--        <style>
                
            .custome-product-list {
                list-style: none;
                padding: 0;
                display: flex;
                flex-direction: column;
                gap: 10px; /* Khoảng cách giữa các sản phẩm */
            }
            .custome-offer-product {
                border: 1px solid #ddd;
                border-radius: 10px; /* Bo góc */
                padding: 10px;
                background-color: #fff;
                transition: box-shadow 0.3s ease-in-out;
            }
            .custome-offer-product:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .custome-offer-image img {
                width: 100%;
                border-radius: 10px;
            }
            .custome-offer-detail {
                text-align: center;
                padding-top: 10px;
            }
            .custome-name {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .custome-price {
                font-size: 18px;
                color: #ff5722;
                font-weight: bold;
            }
        </style>-->

    </head>
    <body>
        <%@ include file="/includes/header.jsp" %> <!-- Nhúng header -->

        <!-- Home Section Start -->
        <section class="home-section pt-2">
            <div class="container-fluid-lg">
                <div class="row g-4">
                    <div class="col-xl-8 ratio_65">
                        <div class="home-contain h-100">
                            <div class="h-100">
                                <img src="${pageContext.request.contextPath}/assets/images/banner1.jpg" class="bg-img blur-up lazyload" alt="">
                            </div>
                            <div class="home-detail p-center-left w-75">

                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 ratio_65">
                        <div class="row g-4">
                            <div class="col-xl-12 col-md-6">
                                <div class="home-contain">
                                    <img src="${pageContext.request.contextPath}/assets/images/banner2.jpg" class="bg-img blur-up lazyload" alt="">

                                </div>
                            </div>

                            <div class="col-xl-12 col-md-6">
                                <div class="home-contain">
                                    <img src="${pageContext.request.contextPath}/assets/images/banner3.jpg" class="bg-img blur-up lazyload" alt="">
                                    <div class="home-detail p-center-left home-p-sm w-75">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Home Section End -->

        <!-- Product Section Start -->
        <section class="product-section">
            <div class="container-fluid-lg">
                <div class="row g-sm-4 g-3">
                    <div class="col-xxl-3 col-xl-4 d-none d-xl-block">
                        <div class="p-sticky">
                            <div class="category-menu">
                                <h3>Danh mục</h3>
                                <ul>
                                    <c:forEach var="cate" items="${category}">
                                        <li>
                                            <div class="category-list">
                                                <h5>
                                                    <a href="/Gr1_Warehouse/shop?category_id=${cate.category_id}">${cate.category_name}</a>
                                                </h5>
                                            </div>
                                        </li>
                                    </c:forEach>
                                    <li></li>
                                </ul>

                            </div>

                            <div class="ratio_156 section-t-space" style="height: 400px; margin-bottom: 20px;">
                                <div class="home-contain hover-effect" style="width: 100%; height: 100%; overflow: hidden; border-radius: 8px;">
                                    <img src="${pageContext.request.contextPath}/assets/images/banner4.jpg" class="bg-img blur-up lazyload" 
                                         alt="" style="width: 100%; height: 100%; object-fit: cover;">
                                    <div class="home-detail p-top-left home-p-medium"></div>
                                </div>
                            </div>

                            <div class="ratio_medium section-t-space" style="height: 400px;">
                                <div class="home-contain hover-effect" style="width: 100%; height: 100%; overflow: hidden; border-radius: 8px;">
                                    <img src="${pageContext.request.contextPath}/assets/images/banner5.jpg" class="img-fluid blur-up lazyload" 
                                         alt="" style="width: 100%; height: 100%; object-fit: cover;">
                                    <div class="home-detail p-top-left home-p-medium"></div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-xxl-9 col-xl-8">
                        <div class="title title-flex">
                            <div>
                                <h2>12 Sản Phẩm HOT Nhất Trong Tháng</h2>
                                <span class="title-leaf">
                                    <svg class="icon-width">
                                    <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                    </svg>
                                </span>
                                <p>Cập nhật ngay xu hướng mua sắm mới nhất! Đây là Top 10 sản phẩm trending trong tháng 
                                    vừa qua, được khách hàng quan tâm và săn đón nhiều nhất. Xem ngay để không bỏ lỡ những sản phẩm hot nhất!</p>
                            </div>

                        </div>
                        <div class="section-b-space">
                            <div>
                                <div class="custom-product-box-slider custom-no-arrow">
                                    <div>
                                        <div class="row m-0">
                                            <c:forEach var="product" items="${trendingProducts}" varStatus="status"> 
                                                <!-- Chia cột để hiển thị 5 sản phẩm trên mỗi hàng -->
                                                <div class="col-lg-2 col-md-3 col-sm-6 col-6 px-1">
                                                    <div class="product-box">
                                                        <div class="product-image">
                                                            <a href="shopDetails?productId=${product.productId}">
                                                                <img src="${product.images[0].image_url}" class="img-fluid blur-up lazyload"
                                                                     alt="${product.productName}">
                                                            </a>
                                                        </div>
                                                        <div class="product-detail">
                                                            <!-- Hiển thị tên danh mục -->
                                                            <p class="category">${product.cate.category_name}</p>

                                                            <a href="shopDetails?productId=${product.productId}">
                                                                <h6 class="name">${product.productName}</h6>
                                                            </a>
                                                            <h6 class="unit">
                                                                <c:forEach var="variant" items="${product.variants}">
                                                                    ${variant.size.size_name}
                                                                </c:forEach>
                                                            </h6>
                                                            <h5 class="sold content">
                                                                <span class="theme-color custom-price">
                                                                    <fmt:formatNumber value="${product.variants[0].price}" type="number" groupingUsed="true" />₫
                                                                </span>
                                                            </h5>

                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Đóng hàng hiện tại và mở hàng mới sau mỗi 5 sản phẩm -->
                                                <c:if test="${(status.index + 1) % 6 == 0}">
                                                </div><div class="row m-0">
                                                </c:if>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <br>
                        <div class="title d-block">
                            <div>
                                <h2>Top 12 Sản Phẩm Bán Chạy Nhất</h2>
                                <span class="title-leaf">
                                    <svg class="icon-width">
                                    <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                    </svg>
                                </span>
                                <p>Khám phá những sản phẩm được ưa chuộng nhất! Đây là danh sách 10 sản phẩm bán chạy nhất trong thời gian qua, được khách hàng tin dùng và lựa chọn nhiều nhất. Cập nhật ngay để không bỏ lỡ những sản phẩm HOT nhất trên thị trường! 🚀
                                </p>
                            </div>
                        </div>
                        <div class="section-b-space">
                            <div>
                                <div class="custom-product-box-slider custom-no-arrow">
                                    <div>
                                        <div class="row m-0">
                                            <c:forEach var="product" items="${bestSellerProducts}" varStatus="status"> 
                                                <!-- Chia cột để hiển thị 5 sản phẩm trên mỗi hàng -->
                                                <div class="col-lg-2 col-md-3 col-sm-6 col-6 px-1">
                                                    <div class="product-box">
                                                        <div class="product-image">
                                                            <a href="shopDetails?productId=${product.productId}">
                                                                <img src="${product.images[0].image_url}" class="img-fluid blur-up lazyload"
                                                                     alt="${product.productName}">
                                                            </a>
                                                        </div>
                                                        <div class="product-detail">
                                                            <!-- Hiển thị tên danh mục -->
                                                            <p class="category">${product.cate.category_name}</p>

                                                            <a href="shopDetails?productId=${product.productId}">
                                                                <h6 class="name">${product.productName}</h6>
                                                            </a>
                                                            <h6 class="unit">
                                                                <c:forEach var="variant" items="${product.variants}">
                                                                    ${variant.size.size_name}
                                                                </c:forEach>
                                                            </h6>
                                                            <h5 class="sold content">
                                                                <span class="theme-color custom-price">
                                                                    <fmt:formatNumber value="${product.variants[0].price}" type="number" groupingUsed="true" />₫
                                                                </span>
                                                            </h5>

                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Đóng hàng hiện tại và mở hàng mới sau mỗi 5 sản phẩm -->
                                                <c:if test="${(status.index + 1) % 6 == 0}">
                                                </div><div class="row m-0">
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section-t-space">
                            <div class="banner-contain hover-effect">
                                <img src="${pageContext.request.contextPath}/assets/images/banner6.jpg" class="bg-img blur-up lazyload" alt="">
                                <div class="banner-details p-center banner-b-space w-100 text-center">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <style>
            .product-box {
                border: 1px solid #ddd;
                padding: 10px;
                background: #fff;
                margin-bottom: 10px;
                border-radius: 5px;
            }
            .product-border {
                border-top: 2px solid #ddd;
                padding-top: 15px;
            }

            .banner-contain {
                width: 100%;
                height: 350px; /* Điều chỉnh chiều cao ảnh */
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
                border-radius: 8px; /* Bo góc cho đẹp hơn */
            }

            .banner-contain img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Đảm bảo ảnh không bị méo, lấp đầy vùng banner */
                transition: transform 0.3s ease-in-out;
            }

            .banner-contain:hover img {
                transform: scale(1.05); /* Hiệu ứng zoom nhẹ khi hover */
            }


        </style>
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
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Auto Height Js -->
        <script src="${pageContext.request.contextPath}/assets/js/auto-height.js"></script>

        <!-- Timer Js -->
        <script src="${pageContext.request.contextPath}/assets/js/timer1.js"></script>

        <!-- Fly Cart Js -->
        <script src="${pageContext.request.contextPath}/assets/js/fly-cart.js"></script>

        <!-- Quantity js -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- WOW js -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/custom-wow.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
        <br> <br>
        <%@ include file="/includes/footer.jsp" %> <!-- Nhúng header -->

    </body>
</html>