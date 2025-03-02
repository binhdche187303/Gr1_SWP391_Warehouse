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

            .back-button {
                .back-button {
                    display: inline-block;
                    background-color: #28a745; /* Xanh lá cây */
                    color: white;
                    text-align: center;
                    padding: 10px 20px;
                    font-size: 14px;
                    border-radius: 5px;
                    text-decoration: none;
                }
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
                    <div style="position: fixed; right: 20px;">
                        <a href="productlist" class="back-button">Quay lại danh sách</a>
                    </div>
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

                                        <h2 class="name" style="color: red">${product.productName}</h2>
                                        </br>
                                        <h2 class="sku">Mã SKU: <span id="current-sku">${product.variants[0].sku}</span></h2>

                                        </br>
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
                                                           data-sku="${variant.sku}"
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
                                                    <li><strong>Thương hiệu: </strong> ${product.brand.brand_name}</li>
                                                    </br>
                                                    <li><strong>Danh mục: </strong> ${product.cate.category_name}</li>
                                                    </br>
                                                    <li><strong>Nguồn gốc: </strong> ${product.origin}</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div style="display: flex;margin-top: 20px ">    
                                            <button style="margin-right: 20px" class="align-items-center btn btn-theme d-flex" data-bs-toggle="modal" data-bs-target="#edit"
                                                    data-id="${product.productId}"
                                                    data-name="${product.productName}"
                                                    data-desc="${product.description}"
                                                    data-origin="${product.origin}"
                                                    data-brand-id="${product.brand.brand_id}"
                                                    data-category-id="${product.cate.category_id}" >
                                                Chỉnh sửa chung
                                            </button>
                                            <button style="margin-right: 20px" type="button" class="align-items-center btn btn-theme d-flex" 
                                                    data-bs-toggle="modal" data-bs-target="#editimage">
                                                Chỉnh sửa ảnh
                                            </button>
                                            <button style="margin-right: 20px" type="button" class="align-items-center btn btn-theme d-flex" 
                                                    data-bs-toggle="modal" data-bs-target="#editprice"
                                                    data-id="${product.productId}"
                                                    data-sku="" 
                                                    data-price="">
                                                Chỉnh sửa giá
                                            </button>
                                            <button type="button" class="align-items-center btn btn-theme d-flex" 
                                                    data-bs-toggle="modal" data-bs-target="#addprice">
                                                Tạo mới
                                            </button>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                
        </div>

        <!-- Modal -->

        <!-- Modal chỉnh sửa chung -->
        <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit">Chỉnh sửa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add" action="productdetail" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" id="productId" name="productId">
                            <div class="mb-3">
                                <label for="productname" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="productname" name="productname" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Mô tả</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                            </div>
                            <!-- Thương hiệu với mũi tên dropdown -->
                            <div class="mb-3">
                                <label for="brand" class="form-label">Thương hiệu</label>
                                <div class="dropdown-select-wrapper">
                                    <select class="form-select" id="brand" name="brand">
                                        <c:forEach var="b" items="${listBrands}">
                                            <option value="${b.brand_id}">${b.brand_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="origin" class="form-label">Origin</label>
                                <input type="text" class="form-control" id="origin" name="origin" required>
                            </div>
                            <!-- Danh mục với mũi tên dropdown -->
                            <div class="mb-3">
                                <label for="category" class="form-label">Danh mục</label>
                                <div class="dropdown-select-wrapper">
                                    <select class="form-select" id="category" name="category">
                                        <c:forEach var="c" items="${listCategories}">
                                            <option value="${c.category_id}">${c.category_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Sửa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal chỉnh sửa ảnh -->
        <div class="modal fade" id="editimage" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog modal-lg"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Chỉnh sửa ảnh</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editImageForm" action="productdetail" method="post">
                            <input type="hidden" name="action" value="editimage">
                            <input type="hidden" name="product_id" value="${product.productId}">
                            <!-- Hiển thị danh sách ảnh hiện có -->
                            <div class="mb-3">
                                <label class="form-label">Ảnh hiện có</label>
                                <div class="row" id="imageContainer">
                                    <c:forEach var="image" items="${product.images}">
                                        <div class="col-md-3 text-center image-item" data-id="${image.image_id}">
                                            <img src="${image.image_url}" 
                                                 alt="${product.productName}" class="img-thumbnail existing-image mb-2" style="width: 100%;">
                                            <button type="button" class="btn btn-danger btn-sm" onclick="removeImage('${image.image_id}')">
                                                Xóa
                                            </button>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Tải ảnh mới -->
                            <div class="mb-3">
                                <label for="imageFile" class="form-label">Tải ảnh lên</label>
                                <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewFile()">
                                <!-- Nút "Thêm ảnh" sẽ được thêm bởi JavaScript -->
                            </div>
                            <!-- Xem trước ảnh -->
                            <div class="mb-3 text-center">
                                <label for="imagePreview" class="form-label">Xem trước ảnh</label>
                                <img id="imagePreview" src="" alt="Xem trước ảnh" class="img-fluid" 
                                     style="max-width: 100%; display: none; border: 1px solid #ccc; padding: 5px;">
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal chỉnh sửa giá -->
        <div class="modal fade" id="editprice" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit">Chỉnh sửa giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add" action="productdetail" method="post">
                            <input type="hidden" name="action" value="editprice">
                            <!-- Move variant_id outside the loop and ensure it's part of the form -->
                            <input type="hidden" name="variant_id" id="variant_id_input" value="">

                            <div class="mb-3">
                                <label for="sku" class="form-label">Mã SKU</label>
                                <input type="text" class="form-control" id="sku" name="sku" required readonly="">
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Giá</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="price" name="price" value="" min="1" required>
                                </div>
                            </div>
                            <!-- Size với mũi tên dropdown -->
                            <div class="mb-3">
                                <label for="size" class="form-label">Phân loại</label>
                                <div class="dropdown-select-wrapper">
                                    <select class="form-select" id="size" name="size">
                                        <c:forEach var="variant" items="${product.variants}" varStatus="status">
                                            <!-- Add data-variant-id attribute to each option -->
                                            <option value="${variant.size.size_id}" data-variant-id="${variant.variantId}">${variant.size.size_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Sửa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal tạo mới -->
        <div class="modal fade" id="addprice" tabindex="-1" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit">Tạo mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add" action="productdetail" method="post">
                            <input type="hidden" name="action"  value="addprice">
                            <input type="hidden" name="product_id" value="${product.productId}">
                            <div class="mb-3">
                                <label for="sku" class="form-label">Mã Sku</label>
                                <input type="text" class="form-control" id="sku" name="sku" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Giá</label>
                                <input type="number" class="form-control" id="price" name="price" required min="1">
                            </div>
                            <!-- Thương hiệu với mũi tên dropdown -->
                            <div class="mb-3">
                                <label for="size" class="form-label">Phân loại</label>
                                <div class="dropdown-select-wrapper">
                                    <select class="form-select" id="size" name="size">
                                        <c:forEach var="ls" items="${requestScope.listSizes}">
                                            <c:set var="sizeExists" value="false"/>
                                            <c:forEach var="variant" items="${product.variants}">
                                                <c:if test="${ls.size_id eq variant.size.size_id}">
                                                    <c:set var="sizeExists" value="true"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${not sizeExists}">
                                                <option value="${ls.size_id}">${ls.size_name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Sửa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <%
            String successMessage = (String) session.getAttribute("success");
            if (successMessage != null) {
        %>
        <script>
            alert("<%= successMessage %>");
        </script>
        <%
                session.removeAttribute("success"); // Xóa session để không hiển thị lại
            }
        %>


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

        <script>
            function updatePriceAndVariant(element) {
                // Xóa class active của tất cả các lựa chọn
                document.querySelectorAll('.select-packege a').forEach(a => a.classList.remove('active'));
                // Thêm class active cho phần tử được chọn
                element.classList.add('active');
                // Lấy dữ liệu từ thuộc tính data-variant-id, data-price và data-sku
                let variantId = element.getAttribute('data-variant-id');
                let price = element.getAttribute('data-price');
                let sku = element.getAttribute('data-sku');
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
                // Cập nhật SKU
                const skuElement = document.getElementById('current-sku');
                skuElement.innerText = sku;
            }


            //Start Edit
            document.addEventListener('DOMContentLoaded', function () {
                // Sự kiện khi modal hiển thị
                const editModal = document.getElementById('edit');
                editModal.addEventListener('show.bs.modal', function (event) {
                    // Lấy nút đã kích hoạt modal
                    const button = event.relatedTarget;
                    // Lấy dữ liệu từ thuộc tính data
                    const productName = button.getAttribute('data-name');
                    const description = button.getAttribute('data-desc');
                    const origin = button.getAttribute('data-origin');
                    const brandId = button.getAttribute('data-brand-id');
                    const categoryId = button.getAttribute('data-category-id');
                    const productId = button.getAttribute('data-id');
                    // Điền dữ liệu vào form
                    document.getElementById('productname').value = productName;
                    document.getElementById('description').value = description;
                    document.getElementById('origin').value = origin;
                    document.getElementById('productId').value = button.getAttribute('data-id');
                    console.log(productName);
                    console.log(description);
                    console.log(origin);
                    console.log(brandId);
                    console.log(categoryId);
                    console.log(productId);
                    const action = document.querySelector("input[name='action']").value;
                    console.log("Action:", action);
                    // Thiết lập dropdown thương hiệu
                    document.getElementById('brand').value = brandId;
                    // Thiết lập dropdown danh mục
                    document.getElementById('category').value = categoryId;
                });
            });
            //End Edit

            //Start Edit Price
            document.addEventListener('DOMContentLoaded', function () {
                console.log('DOM loaded');

                // Lưu trữ thông tin của tất cả variant để dễ truy cập
                const variantData = {};

                // Thu thập thông tin về các variant
                document.querySelectorAll('.select-packege a').forEach(variant => {
                    const variantId = variant.getAttribute('data-variant-id');
                    variantData[variantId] = {
                        sku: variant.getAttribute('data-sku'),
                        price: variant.getAttribute('data-price'),
                        sizeId: variant.getAttribute('data-size-id')
                    };
                    console.log('Loaded variant: ' + variantId);
                });

                // Maps để lưu mối quan hệ giữa size_id và variant_id
                const sizeToVariantMap = {};
                const variantToSizeMap = {};

                // Xây dựng map ánh xạ từ các option trong dropdown
                const sizeOptions = document.querySelectorAll('#editprice #size option');
                sizeOptions.forEach(option => {
                    const sizeId = option.value;
                    const relatedVariantId = option.getAttribute('data-variant-id');

                    if (relatedVariantId) {
                        sizeToVariantMap[sizeId] = relatedVariantId;
                        variantToSizeMap[relatedVariantId] = sizeId;
                        console.log('Map - Size: ' + sizeId + ' -> Variant: ' + relatedVariantId);
                    }
                });

                // Biến để lưu trữ giá trị size được chọn
                let lastSelectedSize = null;

                // Lắng nghe sự kiện khi modal được hiển thị
                $('#editprice').on('show.bs.modal', function () {
                    console.log('Modal is about to show');
                    // Đặt lại biến lastSelectedSize
                    lastSelectedSize = null;
                });

                // Lắng nghe sự kiện click cho nút "Chỉnh sửa giá"
                const buttons = document.querySelectorAll('button[data-bs-target="#editprice"]');
                buttons.forEach(button => {
                    button.addEventListener('click', function () {
                        console.log('Edit price button clicked');

                        // Tìm phân loại đang active
                        const activeVariant = document.querySelector('.select-packege a.active');
                        if (activeVariant) {
                            const variantId = activeVariant.getAttribute('data-variant-id');
                            const sku = activeVariant.getAttribute('data-sku');
                            const price = activeVariant.getAttribute('data-price');

                            console.log('Active variant: ' + variantId);

                            // Điền dữ liệu vào modal
                            const modal = document.getElementById('editprice');
                            const variantIdInput = modal.querySelector('input[name="variant_id"]');
                            variantIdInput.value = variantId;
                            modal.querySelector('input[name="sku"]').value = sku;
                            modal.querySelector('input[name="price"]').value = price;

                            // Tìm size_id tương ứng với variant_id để chọn trong dropdown
                            const sizeSelect = modal.querySelector('#size');

                            // Nếu có sizeId tương ứng với variantId, chọn nó
                            if (variantToSizeMap[variantId]) {
                                sizeSelect.value = variantToSizeMap[variantId];
                                lastSelectedSize = sizeSelect.value; // Lưu lại size đã chọn
                                console.log('Selected size: ' + sizeSelect.value + ' for variant: ' + variantId);
                            } else {
                                // Tìm option có data-variant-id phù hợp
                                for (let i = 0; i < sizeSelect.options.length; i++) {
                                    if (sizeSelect.options[i].getAttribute('data-variant-id') === variantId) {
                                        sizeSelect.selectedIndex = i;
                                        lastSelectedSize = sizeSelect.options[i].value; // Lưu lại size đã chọn
                                        console.log('Found matching option at index: ' + i);
                                        break;
                                    }
                                }
                            }
                            // Thêm data-original-variant-id để biết variant ban đầu
                            variantIdInput.setAttribute('data-original-variant-id', variantId);
                        }
                    });
                });

                // Lắng nghe sự kiện khi thay đổi size trong modal
                const sizeSelect = document.querySelector('#editprice #size');
                if (sizeSelect) {
                    sizeSelect.addEventListener('change', function (e) {
                        e.stopPropagation(); // Ngăn sự kiện lan truyền

                        const selectedSizeId = this.value;
                        const selectedOption = this.options[this.selectedIndex];
                        console.log('Size changed to: ' + selectedSizeId);

                        // Lưu lại size đã chọn
                        lastSelectedSize = selectedSizeId;
                        console.log('Saved lastSelectedSize as: ' + lastSelectedSize);

                        // Lấy variant_id trực tiếp từ option đã chọn
                        const correspondingVariantId = selectedOption.getAttribute('data-variant-id');

                        if (correspondingVariantId) {
                            console.log('Found variant from option: ' + correspondingVariantId);

                            // Cập nhật form với variant_id đúng
                            const modal = document.getElementById('editprice');
                            const variantIdInput = modal.querySelector('input[name="variant_id"]');
                            variantIdInput.value = correspondingVariantId;

                            // Cập nhật SKU và giá nếu có trong variantData
                            if (variantData[correspondingVariantId]) {
                                modal.querySelector('input[name="sku"]').value = variantData[correspondingVariantId].sku;
                                modal.querySelector('input[name="price"]').value = variantData[correspondingVariantId].price;
                            } else {
                                // Nếu không có trong variantData, thử tìm từ DOM
                                const matchingVariant = document.querySelector('.select-packege a[data-variant-id="' + correspondingVariantId + '"]');
                                if (matchingVariant) {
                                    modal.querySelector('input[name="sku"]').value = matchingVariant.getAttribute('data-sku');
                                    modal.querySelector('input[name="price"]').value = matchingVariant.getAttribute('data-price');
                                }
                            }

                            console.log('Updated variant_id to: ' + correspondingVariantId);

                            // Đảm bảo select box vẫn giữ giá trị đã chọn
                            setTimeout(function () {
                                sizeSelect.value = lastSelectedSize;
                                console.log('Restored select to: ' + lastSelectedSize);
                            }, 0);
                        } else {
                            console.log('WARNING: No variant_id found for selected option');
                        }
                    });
                }

                // Lắng nghe sự kiện khi modal hiển thị hoàn tất
                $('#editprice').on('shown.bs.modal', function () {
                    console.log('Modal fully shown');
                    // Nếu có lastSelectedSize, đảm bảo select box được đặt đúng
                    if (lastSelectedSize) {
                        const sizeSelect = document.querySelector('#editprice #size');
                        sizeSelect.value = lastSelectedSize;
                        console.log('Restored select to lastSelectedSize: ' + lastSelectedSize);
                    }
                });

                // Kiểm tra cuối cùng trước khi submit form
                const form = document.querySelector('#editprice form');
                if (form) {
                    form.addEventListener('submit', function (e) {
                        console.log('Form submission check');

                        // Đảm bảo variant_id phù hợp với size đã chọn
                        const sizeSelect = this.querySelector('#size');
                        const selectedOption = sizeSelect.options[sizeSelect.selectedIndex];
                        const correctVariantId = selectedOption.getAttribute('data-variant-id');

                        if (correctVariantId) {
                            // Cập nhật variant_id trước khi submit
                            this.querySelector('input[name="variant_id"]').value = correctVariantId;
                            console.log('Final variant_id for submission: ' + correctVariantId);
                        } else {
                            console.log('WARNING: Could not find variant_id for submission');
                            e.preventDefault(); // Ngăn form submit nếu không có variant_id
                            alert('Không thể xác định variant_id. Vui lòng thử lại.');
                        }
                    });
                }
            });
            //End Price


//Start edit Image
// Định nghĩa cấu trúc dữ liệu để lưu trữ danh sách ảnh
            let imageList = []; // Mảng lưu danh sách ảnh hiện tại
            let deletedImageIds = []; // Mảng lưu ID ảnh cần xóa
            const BASE_IMAGE_PATH = 'assets/images/img_products/'; // Đường dẫn gốc cho ảnh sản phẩm

// Khởi tạo dữ liệu ban đầu từ danh sách ảnh hiện có
            function initializeImageList() {
                const imageContainer = document.getElementById('imageContainer');
                const existingImages = imageContainer.querySelectorAll('.image-item');

                // Reset mảng
                imageList = [];

                // Thêm các ảnh hiện có vào mảng
                existingImages.forEach(imageItem => {
                    const imageId = imageItem.getAttribute('data-id');
                    const imgElement = imageItem.querySelector('img');
                    const imageSrc = imgElement.getAttribute('src');

                    // Lấy tên file từ đường dẫn
                    let fileName = '';
                    if (imageSrc.includes('/')) {
                        const parts = imageSrc.split('/');
                        fileName = parts[parts.length - 1];
                    } else {
                        fileName = imageSrc;
                    }

                    imageList.push({
                        id: imageId,
                        url: imageSrc, // Đường dẫn đầy đủ từ thuộc tính src
                        fileName: fileName, // Tên file ảnh
                        isNew: false // Đánh dấu đây là ảnh đã tồn tại
                    });
                });

                console.log("Danh sách ảnh ban đầu:", imageList);
            }

// Hàm trích xuất tên file ảnh từ đường dẫn đầy đủ
            function getImageFileName(fullPath) {
                // Nếu đường dẫn đã ở đúng định dạng, chỉ lấy phần tên file
                if (fullPath.includes(BASE_IMAGE_PATH)) {
                    return fullPath.split(BASE_IMAGE_PATH)[1];
                }

                // Nếu không, lấy tên file từ đường dẫn bất kỳ
                const pathParts = fullPath.split('/');
                return pathParts[pathParts.length - 1];
            }

// Thêm ảnh mới vào danh sách
            function addNewImage(file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const newImage = {
                        id: 'new_' + Date.now(), // ID tạm thời cho ảnh mới
                        url: e.target.result, // URL tạm thời để hiển thị preview
                        fileName: file.name, // Tên file ảnh
                        file: file, // Lưu file để gửi lên server
                        isNew: true // Đánh dấu đây là ảnh mới
                    };

                    imageList.push(newImage);
                    renderImageList(); // Cập nhật giao diện
                    console.log("Đã thêm ảnh mới:", newImage);

                };
                reader.readAsDataURL(file);
            }

// Xóa ảnh khỏi danh sách
            function removeImage(imageId) {
                // Tìm vị trí của ảnh trong mảng
                const index = imageList.findIndex(img => img.id === imageId);

                if (index !== -1) {
                    const removedImage = imageList[index];

                    // Nếu là ảnh đã tồn tại, thêm vào danh sách ID cần xóa
                    if (!removedImage.isNew) {
                        deletedImageIds.push(imageId);
                    }

                    // Xóa khỏi mảng
                    imageList.splice(index, 1);

                    // Cập nhật giao diện
                    renderImageList();
                    console.log("Đã xóa ảnh:", removedImage);
                    console.log("Danh sách ảnh cần xóa:", deletedImageIds);
                }
            }

// Hiển thị danh sách ảnh lên giao diện
            function renderImageList() {
                const imageContainer = document.getElementById('imageContainer');
                imageContainer.innerHTML = ''; // Xóa nội dung hiện tại

                // Thêm các ảnh vào container
                imageList.forEach(image => {
                    const imageItem = document.createElement('div');
                    imageItem.className = 'col-md-3 text-center image-item';
                    imageItem.setAttribute('data-id', image.id);

                    // Sử dụng URL hiển thị phù hợp cho từng loại ảnh
                    const displayUrl = image.isNew ? image.url : image.url;

                    // Tạo HTML cho mỗi ảnh không sử dụng template literal
                    imageItem.innerHTML =
                            '<img src="' + displayUrl + '" alt="Ảnh sản phẩm" class="img-thumbnail existing-image mb-2" style="width: 100%;">' +
                            '<button type="button" class="btn btn-danger btn-sm" onclick="removeImage(\'' + image.id + '\')">' +
                            'Xóa' +
                            '</button>';
                    console.log(displayUrl);
                    imageContainer.appendChild(imageItem);
                });
            }

// Xử lý xem trước ảnh khi người dùng chọn file
            function previewFile() {
                const fileInput = document.getElementById('imageFile');
                const preview = document.getElementById('imagePreview');

                if (fileInput.files.length > 0) {
                    const file = fileInput.files[0];

                    // Hiển thị xem trước
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    };
                    reader.readAsDataURL(file);

                    // Không thêm vào danh sách ngay, chỉ khi người dùng nhấn nút "Thêm ảnh"
                } else {
                    preview.src = '';
                    preview.style.display = 'none';
                }
            }

// Thêm nút "Thêm ảnh" vào form
            function addAddImageButton() {
                const fileInputContainer = document.querySelector('#imageFile').parentElement;
                const addButton = document.createElement('button');
                addButton.type = 'button';
                addButton.className = 'btn btn-success mt-2';
                addButton.textContent = 'Thêm ảnh vào danh sách';
                addButton.onclick = function () {
                    const fileInput = document.getElementById('imageFile');
                    if (fileInput.files.length > 0) {
                        addNewImage(fileInput.files[0]);
                        // Reset file input sau khi thêm
                        fileInput.value = '';
                        document.getElementById('imagePreview').style.display = 'none';
                    }
                };
                fileInputContainer.appendChild(addButton);
            }

// Xử lý submit form
            function setupFormSubmission() {
                console.log("=== Thiết lập xử lý gửi form ===");
                document.getElementById('editImageForm').addEventListener('submit', function (event) {
                    console.log("Form được submit");

                    // Chuẩn bị danh sách ảnh để gửi lên server
                    const imagesList = [];

                    // Xử lý ảnh hiện tại (không phải ảnh mới)
                    const existingImages = imageList.filter(img => !img.isNew);
                    console.log("Số lượng ảnh hiện tại:", existingImages.length);

                    for (const img of existingImages) {
                        imagesList.push({
                            image_id: img.id,
                            product_id: document.querySelector('input[name="product_id"]').value,
                            image_url: img.fileName
                        });
                    }

                    // Xử lý ảnh mới - Thêm vào cùng danh sách với ảnh hiện tại
                    const newImages = imageList.filter(img => img.isNew);
                    console.log("Số lượng ảnh mới:", newImages.length);

                    for (const img of newImages) {
                        imagesList.push({
                            image_id: "new", // Đánh dấu là ảnh mới
                            product_id: document.querySelector('input[name="product_id"]').value,
                            image_url: img.fileName // Chỉ gửi tên file
                        });
                        console.log("Thêm ảnh mới vào danh sách gửi lên:", img.fileName);
                    }

                    // Thêm input ẩn chứa danh sách ảnh
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'imagesList';
                    hiddenInput.value = JSON.stringify(imagesList);
                    this.appendChild(hiddenInput);
                    console.log("Danh sách ảnh gửi lên:", hiddenInput.value);

                    // Thêm danh sách ID ảnh cần xóa
                    if (deletedImageIds.length > 0) {
                        const deletedInput = document.createElement('input');
                        deletedInput.type = 'hidden';
                        deletedInput.name = 'deletedImageIds';
                        deletedInput.value = JSON.stringify(deletedImageIds);
                        this.appendChild(deletedInput);
                        console.log("Danh sách ảnh cần xóa:", deletedInput.value);
                    }
                });
            }
// Khởi tạo khi trang được tải
            document.addEventListener('DOMContentLoaded', function () {
                initializeImageList();
                addAddImageButton();
                setupFormSubmission();
            });

//End edit Imgae

        </script>                     


    </body>

</html>
