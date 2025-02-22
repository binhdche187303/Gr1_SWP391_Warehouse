<%-- 
    Document   : header
    Created on : Jan 26, 2025, 9:13:42 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Fastkart">
        <meta name="keywords" content="Fastkart">
        <meta name="author" content="Fastkart">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon">
        <title>Log In</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css">

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
        <header class="pb-md-4 pb-0">
            <div class="header-top">
                <div class="container-fluid-lg">
                    <div class="row">
                        <div class="col-xxl-3 d-xxl-block d-none">
                            <div class="top-left-header">
                                <i class="iconly-Location icli text-white"></i>
                                <span class="text-white">1418 Riverwood Drive, CA 96052, US</span>
                            </div>
                        </div>

                        <div class="col-xxl-6 col-lg-9 d-lg-block d-none">
                            <div class="header-offer">
                                <div class="notification-slider">
                                    <div>
                                        <div class="timer-notification">
                                            <h6><strong class="me-1">Welcome to Fastkart!</strong>Wrap new offers/gift
                                                every signle day on Weekends.<strong class="ms-1">New Coupon Code: Fast024
                                                </strong>

                                            </h6>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="timer-notification">
                                            <h6>Something you love is now on sale!
                                                <a href="shop-left-sidebar.html" class="text-white">Buy Now
                                                    !</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <ul class="about-list right-nav-about">
                                <li class="right-nav-list">
                                    <div class="dropdown theme-form-select">
                                        <button class="btn dropdown-toggle" type="button" id="select-language"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="${pageContext.request.contextPath}/assets/images/country/united-states.png"
                                                 class="img-fluid blur-up lazyload" alt="">
                                            <span>English</span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="select-language">
                                            <li>
                                                <a class="dropdown-item" href="javascript:void(0)" id="english">
                                                    <img src="${pageContext.request.contextPath}/assets/images/country/united-kingdom.png"
                                                         class="img-fluid blur-up lazyload" alt="">
                                                    <span>English</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="javascript:void(0)" id="france">
                                                    <img src="${pageContext.request.contextPath}/assets/images/country/germany.png"
                                                         class="img-fluid blur-up lazyload" alt="">
                                                    <span>Germany</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="javascript:void(0)" id="chinese">
                                                    <img src="${pageContext.request.contextPath}/assets/images/country/turkish.png"
                                                         class="img-fluid blur-up lazyload" alt="">
                                                    <span>Turki</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="right-nav-list">
                                    <div class="dropdown theme-form-select">
                                        <button class="btn dropdown-toggle" type="button" id="select-dollar"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            <span>USD</span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end sm-dropdown-menu"
                                            aria-labelledby="select-dollar">
                                            <li>
                                                <a class="dropdown-item" id="aud" href="javascript:void(0)">AUD</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="eur" href="javascript:void(0)">EUR</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="cny" href="javascript:void(0)">CNY</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="top-nav top-header sticky-header">
                <div class="container-fluid-lg">
                    <div class="row">
                        <div class="col-12">
                            <div class="navbar-top">
                                <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
                                        data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                    <span class="navbar-toggler-icon">
                                        <i class="fa-solid fa-bars"></i>
                                    </span>
                                </button>
                                <a href="index.html" class="web-logo nav-logo">
                                    <img src="${pageContext.request.contextPath}/assets/images/logo/1.png" class="img-fluid blur-up lazyload" alt="">
                                </a>

                                <div class="middle-box">
                                    <div class="location-box">
                                        <button class="btn location-button" data-bs-toggle="modal"
                                                data-bs-target="#locationModal">
                                            <span class="location-arrow">
                                                <i data-feather="map-pin"></i>
                                            </span>
                                            <span class="locat-name">Your Location</span>
                                            <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                    </div>

                                    <div class="search-box">
                                        <div class="input-group d-flex align-items-center">
                                            <form action="shop" method="get" class="d-flex w-100">
                                                <input type="text" class="form-control" placeholder="I'm searching for..."
                                                       aria-label="Recipient's username" aria-describedby="button-addon2"
                                                       name="subName" value="${requestScope.subName}">
                                                <button class="btn" type="submit" id="button-addon2">
                                                    <i data-feather="search"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="rightside-box">
                                    <div class="search-full">
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i data-feather="search" class="font-light"></i>
                                            </span>
                                            <input type="text" class="form-control search-type" placeholder="Search here..">
                                            <span class="input-group-text close-search">
                                                <i data-feather="x" class="font-light"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <ul class="right-side-menu">
                                        <li class="right-side">
                                            <div class="delivery-login-box">
                                                <div class="delivery-icon">
                                                    <div class="search-box">
                                                        <i data-feather="search"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="right-side">
                                            <a href="contact-us.html" class="delivery-login-box">
                                                <div class="delivery-icon">
                                                    <i data-feather="phone-call"></i>
                                                </div>
                                                <div class="delivery-detail">
                                                    <h6>24/7 Delivery</h6>
                                                    <h5>+91 888 104 2340</h5>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="right-side">
                                            <div class="onhover-dropdown header-badge">
                                                <button type="button" class="btn p-0 position-relative header-wishlist" onclick="window.location.href = 'cart'">
                                                    <i data-feather="shopping-cart"></i>
                                                </button>


                                                <div class="onhover-div">
                                                    
                                                    <li class="right-side onhover-dropdown">
                                                        <div class="delivery-login-box">
                                                            <div class="delivery-icon">
                                                                <i data-feather="user"></i>
                                                            </div>



                                                            <%
                                                                // Kiểm tra xem user đã đăng nhập chưa
                                                                model.User user = (model.User) session.getAttribute("acc");
                                                                if (user != null) {
                                                            %>
                                                            <!-- Nếu đã đăng nhập -->
                                                            <div class="delivery-detail">
                                                                <h6>Welcome,</h6>
                                                                <h5>Hello <%= user.getUsername() %></h5> <!-- Hiển thị tên người dùng -->
                                                            </div>
                                                            <% } else { %>
                                                            <!-- Nếu chưa đăng nhập -->
                                                            <div class="delivery-detail">
                                                                <h6>Hello,</h6>
                                                                <h5>My Account</h5>
                                                            </div>
                                                            <% } %>
                                                        </div>

                                                        <div class="onhover-div onhover-div-login">
                                                            <ul class="user-box-name">
                                                                <%
                                                                    if (user != null) {
                                                                %>
                                                                <!-- Nếu đã đăng nhập, hiển thị nút Log Out và My Dashboard -->
                                                                <li class="product-box-contain">
                                                                    <a href="<%= request.getContextPath() %>/logout">Log Out</a>
                                                                </li>
                                                                <li class="product-box-contain">
                                                                    <a href="<%= request.getContextPath() %>/profileSetting">User Dashboard</a>
                                                                </li>


                                                                <% } else { %>
                                                                <!-- Nếu chưa đăng nhập, hiển thị các tùy chọn khác -->
                                                                <li class="product-box-contain">
                                                                    <a href="${pageContext.request.contextPath}/login">Log In</a>
                                                                </li>
                                                                <li class="product-box-contain">
                                                                    <a href="${pageContext.request.contextPath}/register">Register</a>
                                                                </li>
                                                                <li class="product-box-contain">
                                                                    <a href="${pageContext.request.contextPath}/request">Forgot Password</a>
                                                                </li>
                                                                <% } %>
                                                            </ul>
                                                        </div>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>

                                            <div class="container-fluid-lg">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="header-nav">
                                                            <div class="header-nav-left">
                                                                <button class="dropdown-category">
                                                                    <i data-feather="align-left"></i>
                                                                    <span>All Categories</span>
                                                                </button>

                                                                <div class="category-dropdown">
                                                                    <div class="category-title">
                                                                        <h5>Categories</h5>
                                                                        <button type="button" class="btn p-0 close-button text-content">
                                                                            <i class="fa-solid fa-xmark"></i>
                                                                        </button>
                                                                    </div>

                                                                    <ul class="category-list">
                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/vegetable.svg" alt="">
                                                                                <h6>Vegetables & Fruit</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Organic Vegetables</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Potato & Tomato</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cucumber & Capsicum</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Leafy Vegetables</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Root Vegetables</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Beans & Okra</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cabbage & Cauliflower</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Gourd & Drumstick</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Specialty</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                                <div class="list-2">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Fresh Fruit</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Banana & Papaya</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Kiwi, Citrus Fruit</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Apples & Pomegranate</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Seasonal Fruits</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Mangoes</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Fruit Baskets</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/cup.svg" alt="">
                                                                                <h6>Beverages</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box w-100">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Energy & Soft Drinks</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Soda & Cocktail Mix</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Soda & Cocktail Mix</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Sports & Energy Drinks</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Non Alcoholic Drinks</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Packaged Water</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Spring Water</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Flavoured Water</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/meats.svg" alt="">
                                                                                <h6>Meats & Seafood</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Meat</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Fresh Meat</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Frozen Meat</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Marinated Meat</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Fresh & Frozen Meat</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                                <div class="list-2">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Seafood</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Fresh Water Fish</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Dry Fish</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Frozen Fish & Seafood</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Marine Water Fish</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Canned Seafood</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Prawans & Shrimps</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Other Seafood</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/breakfast.svg" alt="">
                                                                                <h6>Breakfast & Dairy</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Breakfast Cereals</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Oats & Porridge</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Kids Cereal</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Muesli</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Flakes</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Granola & Cereal Bars</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Instant Noodles</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Pasta & Macaroni</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Frozen Non-Veg Snacks</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                                <div class="list-2">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Dairy</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Milk</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Curd</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Paneer, Tofu & Cream</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Butter & Margarine</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Condensed, Powdered Milk</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Buttermilk & Lassi</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Yogurt & Shrikhand</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Flavoured, Soya Milk</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/frozen.svg" alt="">
                                                                                <h6>Frozen Foods</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box w-100">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Noodle, Pasta</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Instant Noodles</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Hakka Noodles</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cup Noodles</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Vermicelli</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Instant Pasta</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/biscuit.svg" alt="">
                                                                                <h6>Biscuits & Snacks</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Biscuits & Cookies</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Salted Biscuits</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Marie, Health, Digestive</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cream Biscuits & Wafers</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Glucose & Milk Biscuits</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cookies</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                                <div class="list-2">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Bakery Snacks</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Bread Sticks & Lavash</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Cheese & Garlic Bread</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Puffs, Patties, Sandwiches</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Breadcrumbs & Croutons</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                        <li class="onhover-category-list">
                                                                            <a href="javascript:void(0)" class="category-name">
                                                                                <img src="../assets/svg/1/grocery.svg" alt="">
                                                                                <h6>Grocery & Staples</h6>
                                                                                <i class="fa-solid fa-angle-right"></i>
                                                                            </a>

                                                                            <div class="onhover-category-box">
                                                                                <div class="list-1">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Grocery</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Lemon, Ginger & Garlic</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Indian & Exotic Herbs</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Vegetables</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Fruits</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                                <div class="list-2">
                                                                                    <div class="category-title-box">
                                                                                        <h5>Organic Staples</h5>
                                                                                    </div>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Dry Fruits</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Dals & Pulses</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Millet & Flours</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Sugar, Jaggery</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Masalas & Spices</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Rice, Other Rice</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Flours</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="javascript:void(0)">Organic Edible Oil, Ghee</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                            <div class="header-nav-middle">
                                                                <div class="main-nav navbar navbar-expand-xl navbar-light navbar-sticky">
                                                                    <div class="offcanvas offcanvas-collapse order-xl-2" id="primaryMenu">
                                                                        <div class="offcanvas-header navbar-shadow">
                                                                            <h5>Menu</h5>
                                                                            <button class="btn-close lead" type="button" data-bs-dismiss="offcanvas"
                                                                                    aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="offcanvas-body">
                                                                            <ul class="navbar-nav">
                                                                                <li class="nav-item dropdown">
                                                                                    <a class="nav-link dropdown-toggle" href="javascript:void(0)"
                                                                                       data-bs-toggle="dropdown" href="${pageContext.request.contextPath}/home">Home</a>
                                                                                </li>

                                                                                <li class="nav-item dropdown">
                                                                                    <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/shop">Shop</a>

                                                                                </li>                        

                                                                                <li class="nav-item dropdown">
                                                                                    <a class="nav-link dropdown-toggle" href="javascript:void(0)"
                                                                                       data-bs-toggle="dropdown">Blog</a>
                                                                                    <ul class="dropdown-menu">
                                                                                        <li>
                                                                                            <a class="dropdown-item" href="blog-detail.html">Blog Detail</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a class="dropdown-item" href="blog-grid.html">Blog Grid</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a class="dropdown-item" href="blog-list.html">Blog List</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="header-nav-right">
                                                                <button class="btn deal-button" data-bs-toggle="modal" data-bs-target="#deal-box">
                                                                    <i data-feather="zap"></i>
                                                                    <span>Deal Today</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </header>
                                            <!-- Header End -->
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

                                            <!-- latest jquery-->
                                            <script src="../assets/js/jquery-3.6.0.min.js"></script>

                                            <!-- Bootstrap js-->
                                            <script src="../assets/js/bootstrap/bootstrap.bundle.min.js"></script>
                                            <script src="../assets/js/bootstrap/popper.min.js"></script>

                                            <!-- feather icon js-->
                                            <script src="../assets/js/feather/feather.min.js"></script>
                                            <script src="../assets/js/feather/feather-icon.js"></script>

                                            <!-- Slick js-->
                                            <script src="../assets/js/slick/slick.js"></script>
                                            <script src="../assets/js/slick/slick-animation.min.js"></script>
                                            <script src="../assets/js/slick/custom_slick.js"></script>

                                            <!-- Lazyload Js -->
                                            <script src="../assets/js/lazysizes.min.js"></script>

                                            <!-- script js -->
                                            <script src="../assets/js/script.js"></script>
                                            </body>
                                            </html>
