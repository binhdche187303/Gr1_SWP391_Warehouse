<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <style>
            .select-packege {
                display: flex;
                gap: 10px; /* Tăng khoảng cách giữa các lựa chọn */
                flex-wrap: wrap;
            }

            .select-packege a {
                display: inline-block;
                padding: 8px 16px;
                border: 2px solid #ddd;
                border-radius: 8px;
                text-align: center;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .select-packege a:hover {
                border-color: #ff6f61;
                background-color: rgba(255, 111, 97, 0.1);
            }

            .select-packege a.active {
                background-color: #ff6f61;
                color: #fff;
                border-color: #ff6f61;
                font-weight: bold;
            }
            /* Increase base font size for the entire page */
            body {
                font-size: 16px; /* Increase base font size */
            }

            /* Make product name larger */
            .right-box-contain h2.name {
                font-size: 28px !important;
                font-weight: 600 !important;
            }

            /* Make price larger */
            .price-rating h3.theme-color.price {
                font-size: 24px !important;
                font-weight: 700 !important;
            }

            /* Make product description text larger */
            .procuct-contain p {
                font-size: 16px !important;
                line-height: 1.6 !important;
            }

            /* Make section titles larger */
            .product-title h4 {
                font-size: 20px !important;
                font-weight: 600 !important;
            }

            /* Make variant selection text larger */
            .select-packege a {
                font-size: 16px !important;
                padding: 10px 18px !important; /* Slightly larger buttons for easier clicking */
            }

            /* Make product info text larger */
            .product-info-list li {
                font-size: 16px !important;
                line-height: 1.8 !important;
            }

            /* Make product info labels (like "Thương hiệu") bolder */
            .product-info-list li strong {
                font-size: 16px !important;
                font-weight: 600 !important;
            }
        </style>

    </head>
    <body>

        <%@ include file="/manager/manager_dashboard.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <div class="page-body">
                    <div class="row">
                        <div class="col-md-8">
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
                                            <input type="hidden" id="selected-variant-id" value="${product.variants[0].size.size_id}"> 
                                        </div>

                                    </div>
                                </div>

                                <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="right-box-contain">
                                        <h2 class="name">${product.productName}</h2>
                                        <div class="price-rating">
                                            <h3 class="theme-color price">
                                                <span id="current-price" data-raw-price="${product.variants[0].price}">
                                                    <fmt:formatNumber value="${product.variants[0].price}" type="currency" currencyCode="VND" maxFractionDigits="0" />
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
                                                           onclick="updatePriceAndVariant(this)">
                                                            ${variant.size.size_name}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="pickup-box">
                                            <div class="product-title">
                                                <h4>Thông tin sản phẩm:</h4>
                                            </div>
                                            <div class="product-info">
                                                <ul class="product-info-list">
                                                    <li><strong>Thương hiệu:</strong> ${product.brand.brand_name}</li>
                                                    <br                                  >
                                                    <li><strong>Danh mục:</strong> ${product.cate.category_name}</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary mt-2">
                                            <a href="addProduct.jsp" style="color: white; text-decoration: none;">Thêm sản phẩm mới</a>
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>                
        </div>

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


        <!-- Sticky-bar js -->
        <script src="${pageContext.request.contextPath}/assets/js/sticky-cart-bottom.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

        <script>function updatePriceAndVariant(element) {
                                                                   // Xóa class active của tất cả các lựa chọn
                                                                   document.querySelectorAll('.select-packege a').forEach(a => a.classList.remove('active'));
                                                                   // Thêm class active cho phần tử được chọn
                                                                   element.classList.add('active');
                                                                   // Lấy dữ liệu từ thuộc tính data-variant-id và data-price
                                                                   let variantId = element.getAttribute('data-variant-id');
                                                                   let price = element.getAttribute('data-price');
                                                                   // Định dạng giá tiền theo tiền tệ VND (không có phần thập phân)
                                                                   let formattedPrice = new Intl.NumberFormat('vi-VN', {
                                                                       style: 'currency',
                                                                       currency: 'VND',
                                                                       maximumFractionDigits: 0
                                                                   }).format(price);
                                                                   // Cập nhật giá trị của input hidden nếu có
                                                                   const selectedVariantInput = document.getElementById('selected-variant-id');
                                                                   if (selectedVariantInput) {
                                                                       selectedVariantInput.value = variantId;
                                                                   }

                                                                   // Cập nhật giá hiển thị với định dạng và lưu giá gốc
                                                                   const priceElement = document.getElementById('current-price');
                                                                   priceElement.setAttribute('data-raw-price', price);
                                                                   priceElement.innerText = formattedPrice;
                                                               }
                                                               ;

                                                               $(document).ready(function () {
                                                                   // Khởi tạo slider chính
                                                                   $('.product-main-1').slick({
                                                                       slidesToShow: 1,
                                                                       slidesToScroll: 1,
                                                                       arrows: false,
                                                                       fade: true,
                                                                       asNavFor: '.bottom-slider-image'
                                                                   });

                                                                   // Khởi tạo slider nhỏ (thumbnail)
                                                                   $('.bottom-slider-image').slick({
                                                                       slidesToShow: 4,
                                                                       slidesToScroll: 1,
                                                                       asNavFor: '.product-main-1',
                                                                       dots: false,
                                                                       centerMode: false,
                                                                       focusOnSelect: true,
                                                                       arrows: true
                                                                   });
                                                               });
        </script>                     



    </script>

</body>

</html>
