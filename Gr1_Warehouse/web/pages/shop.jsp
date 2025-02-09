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
        <!-- mobile fix menu end -->

        <!-- Breadcrumb Section Start -->
        <section class="breadscrumb-section pt-0">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-12">
                        <div class="breadscrumb-contain">
                            <h2>Shop List</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="index.html">
                                            <i class="fa-solid fa-house"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Shop List</li>
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
                                    <img src="${pageContext.request.contextPath}/assets/images/shop/1.jpg" class="bg-img rounded-3 blur-up lazyload" alt="" data-src="${pageContext.request.contextPath}/assets/images/shop/1.jpg">
                                    <div
                                        class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                        <div>
                                            <h2>Healthy, nutritious & Tasty Fruits & Veggies</h2>
                                            <h3>Save upto 50%</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <div class="banner-contain-2 hover-effect">
                                    <img src="${pageContext.request.contextPath}/assets/images/shop/1.jpg" class="bg-img rounded-3 blur-up lazyload" alt="" data-src="${pageContext.request.contextPath}/assets/images/shop/1.jpg">
                                    <div
                                        class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                        <div>
                                            <h2>Healthy, nutritious & Tasty Fruits & Veggies</h2>
                                            <h3>Save upto 50%</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <div class="banner-contain-2 hover-effect">
                                    <img src="${pageContext.request.contextPath}/assets/images/shop/1.jpg" class="bg-img rounded-3 blur-up lazyload" alt="" data-src="${pageContext.request.contextPath}/assets/images/shop/1.jpg">
                                    <div
                                        class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                        <div>
                                            <h2>Healthy, nutritious & Tasty Fruits & Veggies</h2>
                                            <h3>Save upto 50%</h3>
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
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                <span>Categories</span>
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show"
                                             aria-labelledby="headingOne">
                                            <form action="shop" method="get">
                                                <div class="accordion-body">
                                                    <ul class="category-list custom-padding custom-height">
                                                        <c:forEach var="cat" items="${requestScope.category}"> 
                                                            <li>
                                                                <div class="form-check ps-0 m-0 category-list-box">
                                                                    <input class="checkbox_animated" type="checkbox" name="category_id"
                                                                           value="${cat.category_id}" id="${cat.category_id}">
                                                                    
                                                                    <label class="form-check-label" for="${cat.category_id}">
                                                                        <span class="name">${cat.category_name}</span>
                                                                        <span class="number">(${cat.totalProducts})</span>
                                                                    </label>
                                                                </div>
                                                            </li>
                                                        </c:forEach> 
                                                    </ul>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Apply Filter</button>
                                            </form>
                                 </div>
                                    </div>

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingTwo">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                    aria-expanded="false" aria-controls="collapseTwo">
                                                <span>Brands</span>
                                            </button>
                                        </h2>
                                        <div id="collapseTwo" class="accordion-collapse collapse show"
                                             aria-labelledby="headingTwo">
                                            <div class="accordion-body">
                                                <ul class="category-list custom-padding">
                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox" id="veget">
                                                            <label class="form-check-label" for="veget">
                                                                <span class="name">Vegetarian</span>
                                                                <span class="number">(08)</span>
                                                            </label>
                                                        </div>
                                                    </li>


                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingThree">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                    aria-expanded="false" aria-controls="collapseThree">
                                                <span>Price</span>
                                            </button>
                                        </h2>
                                        <div id="collapseThree" class="accordion-collapse collapse show"
                                             aria-labelledby="headingThree">
                                            <div class="accordion-body">
                                                <div class="range-slider">
                                                    <input type="text" class="js-range-slider" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingSix">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseSix"
                                                    aria-expanded="false" aria-controls="collapseSix">
                                                <span>Rating</span>
                                            </button>
                                        </h2>
                                        <div id="collapseSix" class="accordion-collapse collapse show"
                                             aria-labelledby="headingSix">
                                            <div class="accordion-body">
                                                <ul class="category-list custom-padding">
                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox">
                                                            <div class="form-check-label">
                                                                <ul class="rating">
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                </ul>
                                                                <span class="text-content">(5 Star)</span>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox">
                                                            <div class="form-check-label">
                                                                <ul class="rating">
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                </ul>
                                                                <span class="text-content">(4 Star)</span>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox">
                                                            <div class="form-check-label">
                                                                <ul class="rating">
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                </ul>
                                                                <span class="text-content">(3 Star)</span>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox">
                                                            <div class="form-check-label">
                                                                <ul class="rating">
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                </ul>
                                                                <span class="text-content">(2 Star)</span>
                                                            </div>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox">
                                                            <div class="form-check-label">
                                                                <ul class="rating">
                                                                    <li>
                                                                        <i data-feather="star" class="fill"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                    <li>
                                                                        <i data-feather="star"></i>
                                                                    </li>
                                                                </ul>
                                                                <span class="text-content">(1 Star)</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingFour">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                                    aria-expanded="false" aria-controls="collapseFour">
                                                <span>Discount</span>
                                            </button>
                                        </h2>
                                        <div id="collapseFour" class="accordion-collapse collapse show"
                                             aria-labelledby="headingFour">
                                            <div class="accordion-body">
                                                <ul class="category-list custom-padding">
                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault">
                                                            <label class="form-check-label" for="flexCheckDefault">
                                                                <span class="name">upto 5%</span>
                                                                <span class="number">(06)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault1">
                                                            <label class="form-check-label" for="flexCheckDefault1">
                                                                <span class="name">5% - 10%</span>
                                                                <span class="number">(08)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault2">
                                                            <label class="form-check-label" for="flexCheckDefault2">
                                                                <span class="name">10% - 15%</span>
                                                                <span class="number">(10)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault3">
                                                            <label class="form-check-label" for="flexCheckDefault3">
                                                                <span class="name">15% - 25%</span>
                                                                <span class="number">(14)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault4">
                                                            <label class="form-check-label" for="flexCheckDefault4">
                                                                <span class="name">More than 25%</span>
                                                                <span class="number">(13)</span>
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingFive">
                                            <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFive"
                                                    aria-expanded="false" aria-controls="collapseFive">
                                                <span>Pack Size</span>
                                            </button>
                                        </h2>
                                        <div id="collapseFive" class="accordion-collapse collapse show"
                                             aria-labelledby="headingFive">
                                            <div class="accordion-body">
                                                <ul class="category-list custom-padding custom-height">
                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault5">
                                                            <label class="form-check-label" for="flexCheckDefault5">
                                                                <span class="name">400 to 500 g</span>
                                                                <span class="number">(05)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault6">
                                                            <label class="form-check-label" for="flexCheckDefault6">
                                                                <span class="name">500 to 700 g</span>
                                                                <span class="number">(02)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault7">
                                                            <label class="form-check-label" for="flexCheckDefault7">
                                                                <span class="name">700 to 1 kg</span>
                                                                <span class="number">(04)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault8">
                                                            <label class="form-check-label" for="flexCheckDefault8">
                                                                <span class="name">120 - 150 g each Vacuum 2 pcs</span>
                                                                <span class="number">(06)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault9">
                                                            <label class="form-check-label" for="flexCheckDefault9">
                                                                <span class="name">1 pc</span>
                                                                <span class="number">(09)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault10">
                                                            <label class="form-check-label" for="flexCheckDefault10">
                                                                <span class="name">1 to 1.2 kg</span>
                                                                <span class="number">(06)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault11">
                                                            <label class="form-check-label" for="flexCheckDefault11">
                                                                <span class="name">2 x 24 pcs Multipack</span>
                                                                <span class="number">(03)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault12">
                                                            <label class="form-check-label" for="flexCheckDefault12">
                                                                <span class="name">2x6 pcs Multipack</span>
                                                                <span class="number">(04)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault13">
                                                            <label class="form-check-label" for="flexCheckDefault13">
                                                                <span class="name">4x6 pcs Multipack</span>
                                                                <span class="number">(05)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault14">
                                                            <label class="form-check-label" for="flexCheckDefault14">
                                                                <span class="name">5x6 pcs Multipack</span>
                                                                <span class="number">(09)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault15">
                                                            <label class="form-check-label" for="flexCheckDefault15">
                                                                <span class="name">Combo 2 Items</span>
                                                                <span class="number">(10)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault16">
                                                            <label class="form-check-label" for="flexCheckDefault16">
                                                                <span class="name">Combo 3 Items</span>
                                                                <span class="number">(14)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault17">
                                                            <label class="form-check-label" for="flexCheckDefault17">
                                                                <span class="name">2 pcs</span>
                                                                <span class="number">(19)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault18">
                                                            <label class="form-check-label" for="flexCheckDefault18">
                                                                <span class="name">3 pcs</span>
                                                                <span class="number">(14)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault19">
                                                            <label class="form-check-label" for="flexCheckDefault19">
                                                                <span class="name">2 pcs Vacuum (140 g to 180 g each
                                                                    )</span>
                                                                <span class="number">(13)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault20">
                                                            <label class="form-check-label" for="flexCheckDefault20">
                                                                <span class="name">4 pcs</span>
                                                                <span class="number">(18)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault21">
                                                            <label class="form-check-label" for="flexCheckDefault21">
                                                                <span class="name">4 pcs Vacuum (140 g to 180 g each
                                                                    )</span>
                                                                <span class="number">(07)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault22">
                                                            <label class="form-check-label" for="flexCheckDefault22">
                                                                <span class="name">6 pcs</span>
                                                                <span class="number">(09)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault23">
                                                            <label class="form-check-label" for="flexCheckDefault23">
                                                                <span class="name">6 pcs carton</span>
                                                                <span class="number">(11)</span>
                                                            </label>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="form-check ps-0 m-0 category-list-box">
                                                            <input class="checkbox_animated" type="checkbox"
                                                                   id="flexCheckDefault24">
                                                            <label class="form-check-label" for="flexCheckDefault24">
                                                                <span class="name">6 pcs Pouch</span>
                                                                <span class="number">(16)</span>
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
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
                                    <h5 class="text-content">Sort By :</h5>
                                    <div class="dropdown">
                                        <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"
                                                data-bs-toggle="dropdown">
                                            <span>Most Popular</span> <i class="fa-solid fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li>
                                                <a class="dropdown-item" id="pop" href="javascript:void(0)">Popularity</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="low" href="javascript:void(0)">Low - High
                                                    Price</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="high" href="javascript:void(0)">High - Low
                                                    Price</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="rating" href="javascript:void(0)">Average
                                                    Rating</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="aToz" href="javascript:void(0)">A - Z Order</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="zToa" href="javascript:void(0)">Z - A Order</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" id="off" href="javascript:void(0)">% Off - Hight To
                                                    Low</a>
                                            </li>
                                        </ul>
                                    </div>
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
                                                <a href="product-left-thumbnail.html">
                                                    <c:forEach var="image" items="${product.images}">
                                                        <img src="${pageContext.request.contextPath}/assets/images/img_products/${image.image_url.replaceFirst('^assets/images/img_products/', '')}" alt="${product.productName}" class="img-fluid blur-up lazyload">
                                                    </c:forEach>
                                                </a>

                                                <ul class="product-option">
                                                    <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">
                                                        <!-- Cập nhật data-bs-target để liên kết với modal của từng sản phẩm -->
                                                        <a href="javascript:void(0);" onclick="viewProduct(${product.productId})" data-bs-toggle="modal" data-bs-target="#view-${product.productId}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>



                                                    </li>

                                                    <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">
                                                        <a href="compare.html">
                                                            <i data-feather="refresh-cw"></i>
                                                        </a>
                                                    </li>

                                                    <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">
                                                        <a href="wishlist.html" class="notifi-wishlist">
                                                            <i data-feather="heart"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-footer">
                                            <div class="product-detail">
                                                <span class="span-name">${product.cate.category_name}</span>
                                                <a href="product-left-thumbnail.html">
                                                    <h5 class="name">${product.productName}</h5>
                                                </a>
                                                <p class="text-content mt-1 mb-2 product-content">${product.description}</p>
                                                <div class="product-rating mt-2">
                                                    <ul class="rating">
                                                        <li><i data-feather="star" class="fill"></i></li>
                                                        <li><i data-feather="star" class="fill"></i></li>
                                                        <li><i data-feather="star" class="fill"></i></li>
                                                        <li><i data-feather="star" class="fill"></i></li>
                                                        <li><i data-feather="star"></i></li>
                                                    </ul>
                                                    <span>(4.0)</span>
                                                </div>
                                                <h6 class="unit">
                                                    <c:forEach var="variant" items="${product.variants}">
                                                        ${variant.size.size_name}
                                                    </c:forEach>
                                                </h6>
                                                <h5 class="price"><span class="theme-color">
                                                        <c:forEach var="variant" items="${product.variants}">
                                                            <fmt:formatNumber value="${variant.price}" type="currency" currencySymbol="₫" />
                                                        </c:forEach>
                                                    </span> <del>$15.15</del></h5>
                                                <div class="add-to-cart-box bg-white">
                                                    <button class="btn btn-add-cart addcart-button">Add
                                                        <span class="add-icon bg-light-gray">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </span>
                                                    </button>
                                                    <div class="cart_qty qty-box">
                                                        <div class="input-group bg-white">
                                                            <button type="button" class="qty-left-minus bg-gray" data-type="minus" data-field="">
                                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                                            </button>
                                                            <input class="form-control input-number qty-input" type="text" name="quantity" value="0">
                                                            <button type="button" class="qty-right-plus bg-gray" data-type="plus" data-field="">
                                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal với ID duy nhất cho từng sản phẩm -->
                                <!-- Modal Quick View -->
                                <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modal-product-name">Tên sản phẩm</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <!-- Cột trái: Hình ảnh sản phẩm -->
                                                    <div class="col-md-4">
                                                        <img id="modal-product-image" src="" alt="Product Image" class="img-fluid w-75">
                                                        <div id="modal-thumbnails" class="d-flex mt-2"></div>
                                                    </div>

                                                    <!-- Cột phải: Chi tiết sản phẩm -->
                                                    <div class="col-md-8">
                                                        <p><strong>Brand:</strong> <span id="modal-product-brand"></span></p>
                                                        <p><strong>Product Code:</strong> <span id="modal-product-code"></span></p>
                                                        <p id="modal-product-description"></p>

                                                        <h5>Price:</h5>
                                                        <h4 class="text-danger" id="modal-product-price"></h4>

                                                        <h5>Select Size:</h5>
                                                        <select class="form-select" id="modal-product-size"></select>

                                                        <!-- Nút thao tác -->
                                                        <div class="mt-3">
                                                            <button class="btn btn-primary">Add to Cart</button>
                                                            <button id="modal-view-more" class="btn btn-secondary">View More Details</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                            </c:forEach>

                        </div>

                        <nav class="custome-pagination">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="javascript:void(0)" tabindex="-1" aria-disabled="true">
                                        <i class="fa-solid fa-angles-left"></i>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="javascript:void(0)">1</a>
                                </li>
                                <li class="page-item" aria-current="page">
                                    <a class="page-link" href="javascript:void(0)">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0)">
                                        <i class="fa-solid fa-angles-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->

        <!-- Footer Section Start -->
        <%@ include file="/includes/footer.jsp" %> <!-- Nhúng header -->
        <!-- Footer Section End -->

        <!-- Quick View Modal Box Start -->
        <!--        <div class="modal fade theme-modal view-modal" id="view" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-sm-down">
                        <div class="modal-content">
                            <div class="modal-header p-0">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row g-sm-4 g-2">
                                    <div class="col-lg-6">
                                        <div class="slider-image">
        <c:forEach var="image" items="${product.images}">
            <img src="${pageContext.request.contextPath}/assets/images/img_products/${image.image_url.replaceFirst('^assets/images/img_products/', '')}" alt="${product.productName}" class="img-fluid blur-up lazyload">
        </c:forEach>
    </div>
</div>

<div class="col-lg-6">
    <div class="right-sidebar-modal">
        <h4 class="title-name">${product.productName}</h4>
        <h4 class="price">$36.99</h4>
        <div class="product-rating">
            <ul class="rating">
                <li>
                    <i data-feather="star" class="fill"></i>
                </li>
                <li>
                    <i data-feather="star" class="fill"></i>
                </li>
                <li>
                    <i data-feather="star" class="fill"></i>
                </li>
                <li>
                    <i data-feather="star" class="fill"></i>
                </li>
                <li>
                    <i data-feather="star"></i>
                </li>
            </ul>
            <span class="ms-2">8 Reviews</span>
            <span class="ms-2 text-danger">6 sold in last 16 hours</span>
        </div>

        <div class="product-detail">
            <h4>Product Details :</h4>
            <p>Candy canes sugar plum tart cotton candy chupa chups sugar plum chocolate I love.
                Caramels marshmallow icing dessert candy canes I love soufflé I love toffee.
                Marshmallow pie sweet sweet roll sesame snaps tiramisu jelly bear claw. Bonbon
                muffin I love carrot cake sugar plum dessert bonbon.</p>
        </div>

        <ul class="brand-list">
            <li>
                <div class="brand-box">
                    <h5>Brand Name:</h5>
                    <h6>Black Forest</h6>
                </div>
            </li>

            <li>
                <div class="brand-box">
                    <h5>Product Code:</h5>
                    <h6>W0690034</h6>
                </div>
            </li>

            <li>
                <div class="brand-box">
                    <h5>Product Type:</h5>
                    <h6>White Cream Cake</h6>
                </div>
            </li>
        </ul>

        <div class="select-size">
            <h4>Cake Size :</h4>
            <select class="form-select select-form-size">
                <option selected>Select Size</option>
                <option value="1.2">1/2 KG</option>
                <option value="0">1 KG</option>
                <option value="1.5">1/5 KG</option>
                <option value="red">Red Roses</option>
                <option value="pink">With Pink Roses</option>
            </select>
        </div>

        <div class="modal-button">
            <button onclick="location.href = 'cart.html';"
                    class="btn btn-md add-cart-button icon">Add
                To Cart</button>
            <button onclick="location.href = 'product-left.html';"
                    class="btn theme-bg-color view-button icon text-white fw-bold btn-md">
                View More Details</button>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>-->
        <!-- Quick View Modal Box End -->

        <!-- Location Modal Start -->
        <div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Choose your Delivery Location</h5>
                        <p class="mt-1 text-content">Enter your address and we will specify the offer for your area.</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="location-list">
                            <div class="search-input">
                                <input type="search" class="form-control" placeholder="Search Your Area">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>

                            <div class="disabled-box">
                                <h6>Select a Location</h6>
                            </div>

                            <ul class="location-select custom-height">
                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Alabama</h6>
                                        <span>Min: $130</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Arizona</h6>
                                        <span>Min: $150</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>California</h6>
                                        <span>Min: $110</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Colorado</h6>
                                        <span>Min: $140</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Florida</h6>
                                        <span>Min: $160</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Georgia</h6>
                                        <span>Min: $120</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Kansas</h6>
                                        <span>Min: $170</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Minnesota</h6>
                                        <span>Min: $120</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>New York</h6>
                                        <span>Min: $110</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0)">
                                        <h6>Washington</h6>
                                        <span>Min: $130</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Location Modal End -->

        <!-- Deal Box Modal Start -->
        <div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <div>
                            <h5 class="modal-title w-100" id="deal_today">Deal Today</h5>
                            <p class="mt-1 text-content">Recommended deals for you.</p>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="deal-offer-box">
                            <ul class="deal-offer-list">
                                <li class="list-1">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="${pageContext.request.contextPath}/assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                                 alt="">
                                        </a>

                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>

                                <li class="list-2">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="${pageContext.request.contextPath}/assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                                 alt="">
                                        </a>

                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>

                                <li class="list-3">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="${pageContext.request.contextPath}/assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                                 alt="">
                                        </a>

                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>

                                <li class="list-1">
                                    <div class="deal-offer-contain">
                                        <a href="shop-left-sidebar.html" class="deal-image">
                                            <img src="${pageContext.request.contextPath}/assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                                 alt="">
                                        </a>

                                        <a href="shop-left-sidebar.html" class="deal-contain">
                                            <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                            <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Deal Box Modal End -->

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

        <script>
            function viewProduct(productId) {
                fetch(`/Gr1_Warehouse/shop?productId=` + productId)
                        .then(response => response.json())
                        .then(data => {
                            if (data.error) {
                                console.error('Lỗi:', data.error);
                                return;
                            }

                            // Cập nhật thông tin sản phẩm
                            document.getElementById('modal-product-name').textContent = data.productName;
                            document.getElementById('modal-product-brand').textContent = data.brandName || "N/A";
                            document.getElementById('modal-product-code').textContent = data.sku || "N/A";
                            document.getElementById('modal-product-description').textContent = data.description;
                            document.getElementById('modal-product-price').textContent =
                                    new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(data.variants[0].price);

                            // Cập nhật danh sách size (without price)
                            let sizeSelect = document.getElementById('modal-product-size');
                            sizeSelect.innerHTML = ''; // Xóa size cũ
                            data.variants.forEach(variant => {
                                let option = document.createElement('option');
                                option.value = variant.sizeId;
                                option.textContent = variant.sizeName; // Only size name here
                                sizeSelect.appendChild(option);
                            });

                            // Cập nhật hình ảnh chính
                            document.getElementById('modal-product-image').src = data.firstImageUrl;
                            document.getElementById('modal-product-image').style.width = '300px'; // Adjust the width as needed

                            // Cập nhật danh sách thumbnail
                            let thumbnailContainer = document.getElementById('modal-thumbnails');
                            thumbnailContainer.innerHTML = ''; // Xóa ảnh cũ
                            data.images.forEach(img => {
                                let imgElement = document.createElement('img');
                                imgElement.src = img.imageUrl;
                                imgElement.classList.add('img-thumbnail', 'me-2');
                                imgElement.style.width = "50px";
                                imgElement.onclick = () => {
                                    document.getElementById('modal-product-image').src = img.imageUrl;
                                };
                                thumbnailContainer.appendChild(imgElement);
                            });

                            // Cập nhật link "View More Details"
                            document.getElementById('modal-view-more').setAttribute('onclick', `location.href='product-detail.jsp?productId=${data.productId}'`);

                            // Mở modal
                            new bootstrap.Modal(document.getElementById('quickViewModal')).show();
                        })
                        .catch(error => console.error('Lỗi khi lấy dữ liệu:', error));
            }
        </script>



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
