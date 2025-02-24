<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets2/images/favicon.png" type="image/x-icon">
        <title>Fastkart - Coupon List</title>

        <!-- Google font-->
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <!-- Fontawesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/font-awesome.css">

        <!-- Linear Icon css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/linearicon.css">

        <!-- remixicon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/remixicon.css">

        <!-- Themify icon css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/themify.css">

        <!-- Data Table css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/datatables.css">

        <!-- Feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">

        <style>
            .coupon-list-table {
                table-layout: fixed;
                width: 100%;
            }

            .coupon-list-table th,
            .coupon-list-table td {
                white-space: nowrap; /* Ngăn chữ xuống dòng không mong muốn */
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .coupon-list-table td span {
                display: block; /* Đảm bảo không bị tràn do inline */
            }

            .coupon-list-table th:nth-child(1),
            .coupon-list-table td:nth-child(1) {
                width: 10%; /* Điều chỉnh độ rộng cột */
            }

            .coupon-list-table th:nth-child(2),
            .coupon-list-table td:nth-child(2) {
                width: 10%;
            }

            .coupon-list-table th:nth-child(10),
            .coupon-list-table td:nth-child(10) {
                width: 12%; /* Đảm bảo cột Action không bị chồng lên */
            }

            .ri-eye-line {
                color: #747dc6;
            }

            .ri-pencil-line {
                color: #4aa4d9;
            }

            .ri-delete-bin-line {
                color: #6c757d; /* Màu xám */
            }

        </style>

    </head>

    <body>
        <%@include file="/includes/admin.jsp" %>

        <!-- page-wrapper Start -->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <!-- Container-fluid starts-->
                <!-- Coupon list table starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <c:set var="product_name" value="${requestScope.product_name}"/>
                                            <h5>Giảm giá sản phẩm:
                                                <span style="color: red">
                                                    ${product_name}
                                                </span>
                                            </h5>
                                            <div style="display: flex; gap: 10px;">
                                                <a class="btn btn-solid" href="createcouponproduct?product_id=${requestScope.product_id}">
                                                    Tạo giảm giá sản phẩm
                                                </a>

                                                <a class="btn btn-solid" href="/Gr1_Warehouse/couponproductlist">View All Discount Product</a>
                                            </div>

                                        </div>
                                        <div>
                                            <div class="table-responsive">
                                                <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>% giảm giá</th>
                                                            <th>Số lượng tối thiểu</th>
                                                            <th>Cập nhật lần cuối</th>
                                                            <th>Trạng thái</th>
                                                            <th>Hành động</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:set var="num" value="0"/>
                                                        <c:forEach items="${requestScope.listDiscountProduct}" var="ldp">
                                                            <tr>
                                                                <td class="theme-color">${num+1}</td>
                                                                <c:set var="num" value="${num+1}"/>
                                                                <td class="theme-color"><fmt:formatNumber value="${ldp.discount_percentage}" type="number" pattern="#,#0.0"/>%</td>
                                                                <td class="theme-color">${ldp.min_quantity}</td>
                                                                <fmt:parseDate value="${ldp.created_at}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreateDate" />
                                                                <td class="menu-status">
                                                                    <span class="success">
                                                                        <fmt:formatDate value="${parsedCreateDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>
                                                                <td class="<c:choose>
                                                                        <c:when test='${ldp.status == "Active"}'>text-success</c:when>
                                                                        <c:otherwise>text-danger</c:otherwise>
                                                                    </c:choose>">
                                                                    ${ldp.status}
                                                                </td>
                                                                <td>
                                                                    <ul>
                                                                        <li>
                                                                            <form action="discountproductdetail" method="POST" style="display: inline;">
                                                                                <input type="hidden" name="product_discount_id" value="${ldp.product_discount_id}" />
                                                                                <input type="hidden" name="product_id" value="${ldp.product.productId}" />
                                                                                <input type="hidden" name="action" value="view" />
                                                                                <button type="submit" class="view-discount-history" style="border: none; background: none;">
                                                                                    <i class="ri-eye-line"></i>
                                                                                </button>
                                                                            </form>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:void(0)" 
                                                                               class="edit-discount-product-btn"
                                                                               data-product-discount-id="${ldp.product_discount_id}" 
                                                                               data-percentage="${ldp.discount_percentage}"  
                                                                               data-quantity="${ldp.min_quantity}"  
                                                                               data-status="${ldp.status}">
                                                                                <i class="ri-pencil-line"></i>
                                                                            </a>
                                                                        </li>
                                                                    </ul>

                                                                    <!-- Modal Form -->
                                                                    <div class="modal fade theme-modal" id="edit-discount-product">
                                                                        <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit Product Discount</h5>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <form action="discountproductdetail" method="POST">
                                                                                        <input type="hidden" name="product_discount_id" value="" />
                                                                                        <input type="hidden" name="product_id" value="${ldp.product.productId}" />
                                                                                        <input type="hidden" name="action" value="edit" />

                                                                                        <div class="form-floating mb-3">
                                                                                            <input type="number" 
                                                                                                   class="form-control" 
                                                                                                   id="discount_percentage" 
                                                                                                   name="discount_percentage" 
                                                                                                   min="0.1" 
                                                                                                   max="99.9" 
                                                                                                   step="0.1" 
                                                                                                   value="" 
                                                                                                   required/>
                                                                                            <label for="discount_percentage">Discount (%)</label>
                                                                                        </div>  

                                                                                        <div class="form-floating mb-3">
                                                                                            <input type="number" class="form-control" id="min_quantity" name="min_quantity" value="" required />
                                                                                            <label for="max_uses">Quantity</label>
                                                                                        </div>

                                                                                        <div class="mb-3">
                                                                                            <select id="status" name="status" class="form-select">
                                                                                                <option value="Active">Active</option>
                                                                                                <option value="Inactive">Inactive</option>
                                                                                            </select>
                                                                                        </div>

                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Pagination End -->
                                </div>

                                <c:set var="message" value="${requestScope.message}" />
                                <c:set var="messageType" value="${requestScope.messageType}" />
                                <!-- Display message if exists -->
                                <c:if test="${not empty message}">
                                    <div class="alert alert-${messageType == 'success' ? 'success' : 'danger'} alert-dismissible fade show" 
                                         style="background-color: ${messageType == 'success' ? '#28a745' : '#dc3545'};" 
                                         role="alert">
                                        ${message}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="title-header option-title">
                                            <h5>Discount Product List Detail</h5>
                                        </div>
                                        <div>
                                            <div class="table-responsive">
                                                <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>Ngày thay đổi</th>
                                                            <th>% Giảm cũ</th>
                                                            <th>% Giảm mới</th>
                                                            <th>Số lượng cũ</th>
                                                            <th>Số lượng mới</th>
                                                            <th>Trạng thái cũ</th>
                                                            <th>Trạng thái mới</th>
                                                            <th>Người thay đổi</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${requestScope.listDiscountProductHistory}" var="ldph">
                                                            <tr>
                                                                <fmt:parseDate value="${ldph.change_date}" pattern="yyyy-MM-dd'T'HH:mm" var="changeDate" />
                                                                <td id="detail_change_date">
                                                                    <fmt:formatDate value="${changeDate}" pattern="dd/MM/yyyy"/>
                                                                </td>
                                                                <td class="theme-color">${ldph.old_discount_percentage}</td>
                                                                <td class="theme-color">${ldph.new_discount_percentage}</td>
                                                                <td class="theme-color">${ldph.old_min_quantity}</td>
                                                                <td class="theme-color">${ldph.new_min_quantity}</td>
                                                                <td class=" <c:choose>
                                                                        <c:when test='${ldph.old_status == "Active"}'>text-success</c:when>
                                                                        <c:otherwise>text-danger</c:otherwise>
                                                                    </c:choose>">${ldph.old_status}</td>

                                                                <td class=" <c:choose>
                                                                        <c:when test='${ldph.new_status == "Active"}'>text-success</c:when>
                                                                        <c:otherwise>text-danger</c:otherwise>
                                                                    </c:choose>">${ldph.new_status}</td>
                                                                <td class="theme-color">${ldph.changed_by}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Pagination End -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                </div>
            </div>

        </div>
        <!-- page-wrapper End -->

        <!-- Edit Product Discount Modal -->
        <div class="modal fade theme-modal" id="edit-discount-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Product Discount</h5>
                    </div>
                    <div class="modal-body">
                        <form action="discountproductdetail" method="POST">
                            <input type="hidden" name="product_discount_id" value="" />
                            <input type="hidden" name="action" value="edit" />
                            <!-- Discount % -->
                            <div class="form-floating mb-3">
                                <input type="number" 
                                       class="form-control" 
                                       id="discount_percentage" 
                                       name="discount_percentage" 
                                       min="0.1" 
                                       max="99.9" 
                                       step="0.1" 
                                       value="" 
                                       required/>
                                <label for="discount_percentage">Discount (%)</label>
                            </div>  

                            <!-- Quantity -->
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="min_quantity" name="min_quantity" value="" required />
                                <label for="max_uses">Quantity</label>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select id="status" name="status" class="form-select">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Profile Modal End -->


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

        <!-- customizer js -->
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

        <!-- Sidebar js -->
        <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

        <!-- Plugins JS -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--        <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

        <!-- Data table js -->
<!--            <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>-->

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <script>
            $(document).on("click", ".edit-discount-product-btn", function () {
                // Lấy các giá trị từ data attributes
                var productDiscountId = $(this).data("product-discount-id");
                var percentage = $(this).data("percentage");
                var quantity = $(this).data("quantity");
                var status = $(this).data("status");

                // Đặt các giá trị vào form modal
                $("#edit-discount-product input[name='product_discount_id']").val(productDiscountId);

                // Kiểm tra và format percentage
                if (percentage !== undefined && !isNaN(percentage)) {
                    $("#edit-discount-product input[name='discount_percentage']").val(parseFloat(percentage).toFixed(1));
                } else {
                    $("#edit-discount-product input[name='discount_percentage']").val("");
                }

                // Đặt quantity và status
                $("#edit-discount-product input[name='min_quantity']").val(quantity);
                $("#edit-discount-product select[name='status']").val(status);

                // Mở modal
                $("#edit-discount-product").modal("show");
            });

        </script>


    </body>

</html>