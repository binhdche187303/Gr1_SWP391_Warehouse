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
                            <input type="hidden" name="action"  value="editprice">
                            <input type="hidden" name="variant_id" value="">
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
                                            <option value="${variant.size.size_id}">${variant.size.size_name}</option>
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


    </body>

</html>
