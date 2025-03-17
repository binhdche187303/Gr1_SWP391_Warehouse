<%-- 
    Document   : paging
    Created on : Feb 11, 2025, 6:02:21 PM
    Author     : Huy Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .pagination {
                display: flex;
                justify-content: center; /* Canh giữa thanh pagination */
                margin: 20px 0; /* Cách trên dưới 20px, không cách 2 bên */
            }

            .pagination ul {
                list-style-type: none;
                display: flex;
                padding: 0;
            }

            .pagination ul li {
                margin: 0 10px; /* Tăng khoảng cách giữa các nút */
                display: flex;
                justify-content: center; /* Đảm bảo các trang được căn giữa */
                align-items: center; /* Căn giữa các nội dung trong thẻ li */
            }

            .pagination ul li a {
                text-decoration: none;
                color: #333;
                font-size: 18px; /* Kích thước chữ */
                padding: 12px 20px; /* Tăng khoảng cách padding */
                border-radius: 5px; /* Bo tròn các nút */
                transition: background-color 0.3s ease; /* Hiệu ứng khi hover */
                display: flex;
                justify-content: center; /* Căn giữa chữ trong mỗi nút */
                align-items: center;
            }

            .pagination ul li .active {
                font-weight: bold;
                color: #fff;
                background-color: #333; /* Màu nền cho nút active */
                padding: 12px 20px; /* Giữ padding như các nút khác */
                border-radius: 5px; /* Bo tròn các nút active */
            }

            .pagination ul li .active a {
                color: #fff; /* Đổi màu chữ khi active */
            }

            .pagination ul li a:hover {
                background-color: #f1f1f1; /* Màu nền khi hover */
            }

        </style>
    </head>
    <body>
        <div class="pagination">
            <ul>
                <!-- Previous Page -->
                <c:if test="${currentPage > 1}">
                    <li>
                        <c:url var="prevPageUrl" value="shop">
                            <c:param name="page" value="${currentPage - 1}" />
                            <c:if test="${not empty paramValues.category_id}">
                                <c:forEach var="catId" items="${paramValues.category_id}">
                                    <c:param name="category_id" value="${catId}" />
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty paramValues.brand_id}">
                                <c:forEach var="brandId" items="${paramValues.brand_id}">
                                    <c:param name="brand_id" value="${brandId}" />
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty param.price_range}">
                                <c:param name="price_range" value="${param.price_range}" />
                            </c:if>
                            <c:if test="${not empty param.sortOrder}">
                                <c:param name="sortOrder" value="${param.sortOrder}" />
                            </c:if>
                            <c:if test="${not empty param.subName}">
                                <c:param name="subName" value="${param.subName}" />
                            </c:if>
                        </c:url>
                        <a href="${prevPageUrl}">«</a>
                    </li>
                </c:if>

                <!-- Page Numbers -->
                <c:forEach var="page" items="${paginationPages}">
                    <c:choose>
                        <c:when test="${page == -1}">
                            <li><span>...</span></li>
                            </c:when>
                            <c:when test="${page == currentPage}">
                            <li><span class="active">${page}</span></li>
                            </c:when>
                            <c:otherwise>
                            <li>
                                <c:url var="pageUrl" value="shop">
                                    <c:param name="page" value="${page}" />
                                    <c:if test="${not empty paramValues.category_id}">
                                        <c:forEach var="catId" items="${paramValues.category_id}">
                                            <c:param name="category_id" value="${catId}" />
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty paramValues.brand_id}">
                                        <c:forEach var="brandId" items="${paramValues.brand_id}">
                                            <c:param name="brand_id" value="${brandId}" />
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty param.price_range}">
                                        <c:param name="price_range" value="${param.price_range}" />
                                    </c:if>
                                    <c:if test="${not empty param.sortOrder}">
                                        <c:param name="sortOrder" value="${param.sortOrder}" />
                                    </c:if>
                                    <c:if test="${not empty param.subName}">
                                        <c:param name="subName" value="${param.subName}" />
                                    </c:if>
                                </c:url>
                                <a href="${pageUrl}">${page}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- Next Page -->
                <c:if test="${currentPage < maxPage}">
                    <li>
                        <c:url var="nextPageUrl" value="shop">
                            <c:param name="page" value="${currentPage + 1}" />
                            <c:if test="${not empty paramValues.category_id}">
                                <c:forEach var="catId" items="${paramValues.category_id}">
                                    <c:param name="category_id" value="${catId}" />
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty paramValues.brand_id}">
                                <c:forEach var="brandId" items="${paramValues.brand_id}">
                                    <c:param name="brand_id" value="${brandId}" />
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty param.price_range}">
                                <c:param name="price_range" value="${param.price_range}" />
                            </c:if>
                            <c:if test="${not empty param.sortOrder}">
                                <c:param name="sortOrder" value="${param.sortOrder}" />
                            </c:if>
                            <c:if test="${not empty param.subName}">
                                <c:param name="subName" value="${param.subName}" />
                            </c:if>
                        </c:url>
                        <a href="${nextPageUrl}">»</a>
                    </li>
                </c:if>
            </ul>
        </div>



    </body>
</html>
