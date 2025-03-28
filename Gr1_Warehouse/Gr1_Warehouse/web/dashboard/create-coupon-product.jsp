<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Tạo giảm giá sản phẩm</title>

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

        <!-- Feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/feather-icon.css">

        <!-- Plugins css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/animate.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/vendors/bootstrap.css">

        <!-- App css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets2/css/style.css">
    </head>

    <body>
        <%@include file="/includes/admin.jsp" %>

        <!-- page-wrapper Start-->
        <div class="page-wrapper compact-wrapper" id="pageWrapper">

            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <!-- Create Coupon Table start -->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Tạo mã giảm giá sản phẩm của :
                                                        <span style="color: red"> ${requestScope.product_name}</span>
                                                    </h5>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form" action="createcouponproduct" method="post">
                                                            <input type="hidden" name="product_id" value="${requestScope.product_id}">
                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Số lượng tối thiểu</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="number" name="min_quantity" required value="${requestScope.min_quantity}" min="0">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Phần trăm giảm giá</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="number" name="discount_percentage" min="0.1" max="99.9" step="0.1" 
                                                                               value="${requestScope.discount_percentage}" required>
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label class="col-sm-2 col-form-label form-label-title">Trạng thái
                                                                    </label>
                                                                    <div class="col-sm-10">
                                                                        <select name="status">
                                                                            <option value="Active" ${requestScope.status == 'Active' ? 'selected' : ''}>Active</option>
                                                                            <option value="Inactive" ${requestScope.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                </br>
                                                                </br>
                                                                </br>

                                                                <div class="col-lg-2 col-md-3 mb-4"></div>
                                                                <div class="col-md-9 col-lg-10">
                                                                    <button type="submit" class="btn btn-primary">Gửi</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <c:if test="${not empty requestScope.error}">
                                                            <div class="alert alert-dismissible fade show" 
                                                                 role="alert" 
                                                                 style="margin-top: 10px; background-color: red; color: white; border: 1px solid darkred; font-weight: bold;">
                                                                ${requestScope.error}
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="filter: invert(1);"></button>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table all-package coupon-list-table table-hover theme-table" id="table_id">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>% giảm giá</th>
                                    <th>Số lượng tối thiểu</th>
                                    <th>Cập nhật lần cuối</th>
                                    <th>Trạng thái</th>
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Create Coupon Table End -->


            </div>
        </div>
    </div>
    <!-- page-wrapper end-->


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
    <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->

    <!-- Sidebar js -->
    <script src="${pageContext.request.contextPath}/assets2/js/config.js"></script>

    <!-- Plugins JS -->
    <script src="${pageContext.request.contextPath}/assets2/js/sidebar-menu.js"></script>
<!--    <script src="${pageContext.request.contextPath}/assets2/js/notify/bootstrap-notify.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/notify/index.js"></script>-->

    <!--Dropzon js -->
    <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/dropzone/dropzone-script.js"></script>

    <!-- select 2 js -->
    <script src="${pageContext.request.contextPath}/assets2/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/js/select2-custom.js"></script>

    <!-- sidebar effect -->
    <!--<script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>-->

    <!-- Theme js -->
    <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
</body>

</html>