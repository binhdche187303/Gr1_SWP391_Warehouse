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
                                            <h5>Coupon List</h5>
                                            <div class="right-options">
                                                <ul>
                                                    <li>
                                                        <a class="btn btn-solid" href="/Gr1_Warehouse/createcoupon">Add Coupon</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="">
                                                <table class="table all-package coupon-list-table table-hover theme-table"
                                                       id="table_id">
                                                    <thead>
                                                        <tr>
                                                            <th>Code</th>
                                                            <th>Discount</th>
                                                            <th>Start Date</th>
                                                            <th>End Date</th>
                                                            <th>Quantity</th>
                                                            <th>Last Updated</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${requestScope.listDiscounts}" var="ld">
                                                            <tr>
                                                                <td class="theme-color">${ld.discount_code}</td>
                                                                <td class="theme-color"><fmt:formatNumber value="${ld.discount_percentage}" type="number" pattern="0"/>%</td>

                                                                <fmt:parseDate value="${ld.start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStartDate" />
                                                                <fmt:parseDate value="${ld.end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEndDate" />

                                                                <td class="menu-status">
                                                                    <span class="success">
                                                                        <fmt:formatDate value="${parsedStartDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>
                                                                <td class="menu-status">
                                                                    <span class="danger">
                                                                        <fmt:formatDate value="${parsedEndDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>

                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${ld.max_uses == null}">
                                                                            Infinity
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${ld.max_uses}
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>

                                                                <fmt:parseDate value="${ld.created_at}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreateDate" />
                                                                <td class="menu-status">
                                                                    <span class="danger">
                                                                        <fmt:formatDate value="${parsedCreateDate}" pattern="dd/MM/yyyy"/>
                                                                    </span>
                                                                </td>
                                                                <td class="<c:choose>
                                                                        <c:when test='${ld.status == "Active"}'>text-success</c:when>
                                                                        <c:otherwise>text-danger</c:otherwise>
                                                                    </c:choose>">
                                                                    ${ld.status}
                                                                </td>

                                                                <td>
                                                                    <ul>
                                                                        <a href="javascript:void(0)" 
                                                                           class="view-discount-history" 
                                                                           data-id="${ld.discount_id}">
                                                                            <i class="ri-eye-line"></i>
                                                                        </a>


                                                                        <li>
                                                                            <a href="javascript:void(0)" 
                                                                               class="edit-discount-btn"
                                                                               data-id="${ld.discount_id}" 
                                                                               data-code="${ld.discount_code}" 
                                                                               data-percentage="${ld.discount_percentage}" 
                                                                               data-start="${ld.start_date}" 
                                                                               data-end="${ld.end_date}" 
                                                                               data-status="${ld.status}" 
                                                                               data-max-uses="${ld.max_uses}">
                                                                                <i class="ri-pencil-line"></i>
                                                                            </a>

                                                                        </li>
                                                                    </ul>
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
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                </div>
            </div>

        </div>
        <!-- page-wrapper End -->

        <!-- Detail Discount Modal -->
        <div class="modal fade theme-modal" id="detailDiscount" tabindex="-1" aria-labelledby="detailDiscountLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-sm-down">
                <div class="modal-content" style="width: 120%">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailDiscountLabel">Discount Details</h5>
                    </div>
                    <div class="modal-body">
                        <!-- Discount Details Table -->
                        <div class="">
                            <table class="table table-bordered" style="min-width: 1200px;">
                                <thead>
                                    <tr>
                                        <th style="min-width: 150px;">Ngày thay đổi</th>
                                        <th style="min-width: 120px;">% Giảm cũ</th>
                                        <th style="min-width: 120px;">% Giảm mới</th>
                                        <th style="min-width: 150px;">Trạng thái cũ</th>
                                        <th style="min-width: 150px;">Trạng thái mới</th>
                                        <th style="min-width: 130px;">Max Uses cũ</th>
                                        <th style="min-width: 130px;">Max Uses mới</th>
                                        <th style="min-width: 130px;">Người thay đổi</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listDistcountHistory}" var="ldh">

                                        <tr>
                                            <fmt:parseDate value="${ldh.change_date}" pattern="yyyy-MM-dd'T'HH:mm" var="changeDate" />
                                            <td id="detail_change_date">
                                                <fmt:formatDate value="${changeDate}" pattern="dd/MM/yyyy"/>
                                            </td>
                                            <td id="detail_old_discount">${ldh.old_discount_percentage}</td>
                                            <td id="detail_new_discount">${ldh.new_discount_percentage}</td>
                                            <td id="detail_old_status">${ldh.old_status}</td>
                                            <td id="detail_new_status">${ldh.new_status}</td>
                                            <td id="detail_old_max_uses">${ldh.old_max_uses}</td>
                                            <td id="detail_new_max_uses">${ldh.new_max_uses}</td>
                                            <td id="detail_changed_by">${ldh.changed_by}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- Modal Footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Detail Profile Modal End -->


        <!-- Edit Discount Modal -->
        <div class="modal fade theme-modal" id="edit-discount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Discount</h5>
                    </div>
                    <div class="modal-body">
                        <form action="couponlist" method="POST">
                            <input type="hidden" name="discount_id" value="" />

                            <!-- Discount Code -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="discount_code" name="discount_code" value="" readonly />
                                <label for="discount_code">Coupon Code</label>
                            </div>

                            <!-- Discount % -->
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="discount_percentage" name="discount_percentage" min="1" max="99" value="" required/>
                                <label for="discount_percentage">Discount (%)</label>
                            </div>   

                            <!-- Start Date & End Date cùng hàng -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="start_date" name="start_date" value="" required readonly />
                                        <label for="start_date">Start Date</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" id="end_date" name="end_date" value="" required readonly />
                                        <label for="end_date">End Date</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Quantity -->
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="max_uses" name="max_uses" value="" required />
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
        <script src="${pageContext.request.contextPath}/assets2/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/js/custom-data-table.js"></script>

        <!-- all checkbox select js -->
        <script src="${pageContext.request.contextPath}/assets2/js/checkbox-all-check.js"></script>

        <!-- sidebar effect -->
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>

        <script>
            $(document).ready(function () {
                $(".edit-discount-btn").click(function () {
                    var id = $(this).data("id");
                    var code = $(this).data("code");
                    var percentage = $(this).data("percentage");
                    var start = $(this).data("start");
                    var end = $(this).data("end");
                    var maxUses = $(this).data("max-uses");
                    var status = $(this).data("status");
                    // Hàm định dạng ngày để không bị lệch múi giờ
                    function formatDate(dateString) {
                        if (!dateString)
                            return "";
                        var date = new Date(dateString);
                        if (isNaN(date))
                            return "";
                        return date.getFullYear() + "-" +
                                String(date.getMonth() + 1).padStart(2, '0') + "-" +
                                String(date.getDate()).padStart(2, '0');
                    }

                    $("#edit-discount input[name='discount_id']").val(id);
                    $("#edit-discount input[name='discount_code']").val(code);
                    $("#edit-discount input[name='discount_percentage']").val(Math.round(percentage)); // Hiển thị số nguyên
                    $("#edit-discount input[name='start_date']").val(formatDate(start));
                    $("#edit-discount input[name='end_date']").val(formatDate(end));
                    $("#edit-discount input[name='max_uses']").val(maxUses);
                    $("#edit-discount select[name='status']").val(status);
                    $("#edit-discount input[name='max_uses']").attr("min", maxUses);

                    $("#edit-discount").modal("show");
                });
            });


            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".view-discount-history").forEach(item => {
                    item.addEventListener("click", function () {
                        let discountId = this.getAttribute("data-id");

                        if (discountId) {
                            let xhr = new XMLHttpRequest();
                            xhr.open("GET", "/Gr1_Warehouse/listdiscounthistory?discount_id=" + discountId, true);

                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4 && xhr.status === 200) {
                                    // Parse response HTML
                                    let parser = new DOMParser();
                                    let doc = parser.parseFromString(xhr.responseText, "text/html");

                                    // Lấy dữ liệu mới từ response
                                    let newListHistory = doc.querySelectorAll("#detailDiscount tbody tr");

                                    // Cập nhật tbody trong modal hiện tại
                                    let modalTbody = document.querySelector("#detailDiscount tbody");
                                    modalTbody.innerHTML = ''; // Xóa dữ liệu cũ

                                    // Thêm dữ liệu mới
                                    newListHistory.forEach(row => {
                                        modalTbody.appendChild(row.cloneNode(true));
                                    });

                                    // Hiển thị modal
                                    let detailModal = new bootstrap.Modal(document.getElementById("detailDiscount"));
                                    detailModal.show();
                                }
                            };

                            xhr.onerror = function () {
                                console.error("An error occurred during the request");
                            };

                            xhr.send();
                        }
                    });
                });
            });

        </script>



    </body>

</html>