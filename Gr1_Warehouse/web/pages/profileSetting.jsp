<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Fastkart" />
        <meta name="keywords" content="Fastkart" />
        <meta name="author" content="Fastkart" />
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/1.png" type="image/x-icon" />
        <title>User Dashboard</title>

        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

        <!-- bootstrap css -->
        <link id="rtl-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/bootstrap.css" />

        <!-- font-awesome css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/font-awesome.css" />

        <!-- feather icon css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/feather-icon.css" />

        <!-- slick css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/vendors/slick/slick-theme.css" />

        <!-- Iconly css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bulk-style.css" />

        <!-- Template css -->
        <link id="color-link" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />


    <body>
        <%@include file="/includes/header.jsp" %> <!-- Nhúng header -->

        <!-- User Dashboard Section Start -->
        <section class="user-dashboard-section section-b-space">
            <div class="container-fluid-lg">
                <div class="row">
                    <div class="col-xxl-3 col-lg-4">
                        <div class="dashboard-left-sidebar">
                            <div class="close-button d-flex d-lg-none">
                                <button class="close-sidebar">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>
                            <div class="profile-box">
                                <div class="cover-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/inner-page/cover-img.jpg" class="img-fluid blur-up lazyload" alt="" />
                                </div>

                                <div class="profile-contain">
                                    <div class="profile-name">
                                        <h3>${sessionScope.acc.fullname}</h3> 
                                        <h6 class="text-content">${sessionScope.acc.email}</h6>
                                    </div>
                                </div>
                            </div>

                            <ul class="nav nav-pills user-nav-pills" id="pills-tab" role="tablist">

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-dashboard-tab" data-bs-toggle="pill" data-bs-target="#pills-dashboard" type="button" role="tab" aria-controls="pills-dashboard" aria-selected="false"><i data-feather="home">                                        
                                        </i> DashBoard</button>

                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-order-tab" data-bs-toggle="pill" data-bs-target="#pills-order"
                                            type="button" role="tab" aria-controls="pills-order" aria-selected="true"
                                            onclick="loadOrders()">
                                        <i data-feather="shopping-bag"></i> Order
                                    </button>
                                </li>



                                <li class="nav-item" role="presentation"><button class="nav-link" id="pills-card-tab" data-bs-toggle="pill" data-bs-target="#pills-card" type="button" role="tab" aria-controls="pills-card" aria-selected="false"><i data-feather="credit-card">
                                        </i> Saved Card</button>
                                </li>
                                <li class="nav-item active" role="presentation"><button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false"><i data-feather="user">
                                        </i> Profile</button>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-xxl-9 col-lg-8">
                        <div class="dashboard-right-sidebar">
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade" id="pills-dashboard" role="tabpanel" aria-labelledby="pills-dashboard-tab">
                                    <div class="dashboard-home">
                                        <div class="title">
                                            <h2>My User Dashboard</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div class="dashboard-user-name">
                                            <h6 class="text-content">
                                                Hello, <b class="text-title">....................</b>
                                            </h6>
                                            <p class="text-content"> From your My User Dashboard you have the ability to view a snapshot of your recent account activity and update your account information. Select a link below to view or edit information.</p>
                                        </div>

                                        <div class="total-box">
                                            <div class="row g-sm-4 g-3">
                                                <div class="col-xxl-6 col-lg-6 col-md-4 col-sm-6">
                                                    <div class="totle-contain">
                                                        <img src="${pageContext.request.contextPath}/assets/images/svg/order.svg" class="blur-up lazyload" alt="" />
                                                        <div class="totle-detail">
                                                            <h5>Total Order</h5>
                                                            <h3>3658</h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xxl-6 col-lg-6 col-md-4 col-sm-6">
                                                    <div class="totle-contain">
                                                        <img src="${pageContext.request.contextPath}/assets/images/svg/pending.svg" class="blur-up lazyload" alt="" />
                                                        <div class="totle-detail">
                                                            <h5>Total Pending Order</h5>
                                                            <h3>254</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="tab-pane fade show" id="pills-order" role="tabpanel" aria-labelledby="pills-order-tab">
                                    <div class="dashboard-order">
                                        <div class="title">
                                            <h2 style="margin-bottom: 20px;">My Orders History</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="${pageContext.request.contextPath}/assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div id="pills-order-content">
                                            <!-- Dữ liệu đơn hàng sẽ được hiển thị ở đây -->
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="tab-pane fade show"
                                    id="pills-card"
                                    role="tabpanel"
                                    aria-labelledby="pills-card-tab"
                                    >
                                    <div class="dashboard-card">
                                        <div class="title title-flex">
                                            <div>
                                                <h2>My Card Details</h2>
                                                <span class="title-leaf">
                                                    <svg class="icon-width bg-gray">
                                                    <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                                    </svg>
                                                </span>
                                            </div>

                                            <button
                                                class="btn theme-bg-color text-white btn-sm fw-bold mt-lg-0 mt-3"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editCard"
                                                >
                                                <i data-feather="plus" class="me-2"></i> Add New Card
                                            </button>
                                        </div>

                                        <div class="row g-4">
                                            <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                                <div class="payment-card-detail">
                                                    <div class="card-details">
                                                        <div class="card-number">
                                                            <h4>XXXX - XXXX - XXXX - 2548</h4>
                                                        </div>

                                                        <div class="valid-detail">
                                                            <div class="title">
                                                                <span>valid</span>
                                                                <span>thru</span>
                                                            </div>
                                                            <div class="date">
                                                                <h3>08/05</h3>
                                                            </div>
                                                            <div class="primary">
                                                                <span class="badge bg-pill badge-light"
                                                                      >primary</span
                                                                >
                                                            </div>
                                                        </div>

                                                        <div class="name-detail">
                                                            <div class="name">
                                                                <h5>Audrey Carol</h5>
                                                            </div>
                                                            <div class="card-img">
                                                                <img
                                                                    src="../assets/images/payment-icon/1.jpg"
                                                                    class="img-fluid blur-up lazyloaded"
                                                                    alt=""
                                                                    />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="edit-card">
                                                        <a
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#editCard"
                                                            href="javascript:void(0)"
                                                            ><i class="far fa-edit"></i> edit</a
                                                        >
                                                        <a
                                                            href="javascript:void(0)"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#removeProfile"
                                                            ><i class="far fa-minus-square"></i> delete</a
                                                        >
                                                    </div>
                                                </div>

                                                <div class="edit-card-mobile">
                                                    <a
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#editCard"
                                                        href="javascript:void(0)"
                                                        ><i class="far fa-edit"></i> edit</a
                                                    >
                                                    <a href="javascript:void(0)"
                                                       ><i class="far fa-minus-square"></i> delete</a
                                                    >
                                                </div>
                                            </div>

                                            <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                                <div class="payment-card-detail">
                                                    <div class="card-details card-visa">
                                                        <div class="card-number">
                                                            <h4>XXXX - XXXX - XXXX - 1536</h4>
                                                        </div>

                                                        <div class="valid-detail">
                                                            <div class="title">
                                                                <span>valid</span>
                                                                <span>thru</span>
                                                            </div>
                                                            <div class="date">
                                                                <h3>12/23</h3>
                                                            </div>
                                                            <div class="primary">
                                                                <span class="badge bg-pill badge-light"
                                                                      >primary</span
                                                                >
                                                            </div>
                                                        </div>

                                                        <div class="name-detail">
                                                            <div class="name">
                                                                <h5>Leah Heather</h5>
                                                            </div>
                                                            <div class="card-img">
                                                                <img
                                                                    src="../assets/images/payment-icon/2.jpg"
                                                                    class="img-fluid blur-up lazyloaded"
                                                                    alt=""
                                                                    />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="edit-card">
                                                        <a
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#editCard"
                                                            href="javascript:void(0)"
                                                            ><i class="far fa-edit"></i> edit</a
                                                        >
                                                        <a
                                                            href="javascript:void(0)"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#removeProfile"
                                                            ><i class="far fa-minus-square"></i> delete</a
                                                        >
                                                    </div>
                                                </div>

                                                <div class="edit-card-mobile">
                                                    <a
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#editCard"
                                                        href="javascript:void(0)"
                                                        ><i class="far fa-edit"></i> edit</a
                                                    >
                                                    <a href="javascript:void(0)"
                                                       ><i class="far fa-minus-square"></i> delete</a
                                                    >
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-6 col-lg-12 col-sm-6">
                                                <div class="payment-card-detail">
                                                    <div class="card-details dabit-card">
                                                        <div class="card-number">
                                                            <h4>XXXX - XXXX - XXXX - 1366</h4>
                                                        </div>

                                                        <div class="valid-detail">
                                                            <div class="title">
                                                                <span>valid</span>
                                                                <span>thru</span>
                                                            </div>
                                                            <div class="date">
                                                                <h3>05/21</h3>
                                                            </div>
                                                            <div class="primary">
                                                                <span class="badge bg-pill badge-light"
                                                                      >primary</span
                                                                >
                                                            </div>
                                                        </div>

                                                        <div class="name-detail">
                                                            <div class="name">
                                                                <h5>mark jecno</h5>
                                                            </div>
                                                            <div class="card-img">
                                                                <img
                                                                    src="../assets/images/payment-icon/3.jpg"
                                                                    class="img-fluid blur-up lazyloaded"
                                                                    alt=""
                                                                    />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="edit-card">
                                                        <a
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#editCard"
                                                            href="javascript:void(0)"
                                                            ><i class="far fa-edit"></i> edit</a
                                                        >
                                                        <a
                                                            href="javascript:void(0)"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#removeProfile"
                                                            ><i class="far fa-minus-square"></i> delete</a
                                                        >
                                                    </div>
                                                </div>

                                                <div class="edit-card-mobile">
                                                    <a
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#editCard"
                                                        href="javascript:void(0)"
                                                        ><i class="far fa-edit"></i> edit</a
                                                    >
                                                    <a href="javascript:void(0)"
                                                       ><i class="far fa-minus-square"></i> delete</a
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="tab-pane fade show active"
                                    id="pills-profile"
                                    role="tabpanel"
                                    aria-labelledby="pills-profile-tab"
                                    >
                                    <div class="dashboard-profile">
                                        <div class="title">
                                            <h2>My Profile</h2>
                                            <span class="title-leaf">
                                                <svg class="icon-width bg-gray">
                                                <use xlink:href="../assets/svg/leaf.svg#leaf"></use>
                                                </svg>
                                            </span>
                                        </div>

                                        <div class="profile-detail dashboard-bg-box">
                                            <div class="dashboard-title">
                                                <h3>Profile Name</h3>
                                            </div>
                                            <div class="profile-name-detail">
                                                <div class="d-sm-flex align-items-center d-block">

                                                    <h3>${sessionScope.acc.fullname}</h3>

                                                </div>
                                            </div>

                                            <div class="location-profile">
                                                <ul>
                                                    <li>
                                                        <div class="location-box">
                                                            <i data-feather="mail"></i>
                                                            <h6>${sessionScope.acc.email}</h6>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="profile-about dashboard-bg-box">
                                            <div class="row">
                                                <div class="col-xxl-7">
                                                    <div class="dashboard-title mb-3">
                                                        <h3>Profile About</h3>
                                                    </div>

                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>UserName :</td>
                                                                    <td>${sessionScope.acc.username}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>FullName :</td>
                                                                    <td>${sessionScope.acc.fullname}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Phone Number :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            ${sessionScope.acc.phone}</a
                                                                        >
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Address :</td>
                                                                    <td>${sessionScope.acc.address}</td>
                                                                </tr>
                                                                <tr>

                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            <span data-bs-toggle="modal" data-bs-target="#edit-profile">Edit Profile</span>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <c:if test="${not empty requestScope.successprofile}">
                                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                                ${requestScope.successprofile}
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                            </div>
                                                        </c:if>
                                                    </div>



                                                    <div class="dashboard-title mb-3">
                                                        <h3>Login Details</h3>
                                                    </div>

                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Email :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">${sessionScope.acc.email}</a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Password :</td>
                                                                    <td>
                                                                        <a href="javascript:void(0)">
                                                                            ****** 
                                                                            <span data-bs-toggle="modal" data-bs-target="#edit-password">Edit</span>
                                                                        </a>
                                                                    </td>

                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <!-- Edit Password Modal Start -->
                                                <div class="modal fade theme-modal" id="edit-password" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="changepassword" method="POST">
                                                                    <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />

                                                                    <!-- Old Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="currentpassword" name="currentpassword" placeholder="Enter Current Password" required />
                                                                        <label for="oldpass">Old Password</label>
                                                                    </div>

                                                                    <!-- New Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Enter New Password" required />
                                                                        <label for="newpass">New Password</label>
                                                                    </div>

                                                                    <!-- Confirm New Password -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm New Password" required />
                                                                        <label for="confirmpass">Confirm New Password</label>
                                                                    </div>
                                                                    <%
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
                                                                    %>

                                                                    <% if (error != null) { %>
                                                                    <div class="alert alert-danger" role="alert">
                                                                        <%= error %>
                                                                    </div>
                                                                    <% } %>

                                                                    <% if (success != null) { %>
                                                                    <div class="alert alert-success" role="alert">
                                                                        <%= success %>
                                                                    </div>
                                                                    <% } %>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn theme-bg-color btn-md text-white">Save changes</button>
                                                                    </div>
                                                                </form>



                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Edit Password Modal End -->

                                                <!-- Edit Profile Modal Start -->
                                                <div class="modal fade theme-modal" id="edit-profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Change Profile</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <i class="fa-solid fa-xmark"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="changeprofile" method="POST">
                                                                    <input type="hidden" name="userId" value="${sessionScope.acc.userId}" />

                                                                    <!-- FullName -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter FullName" value="${sessionScope.acc.fullname}" required />
                                                                        <label for="fullname">FullName</label>
                                                                    </div>

                                                                    <!-- PhoneNumber -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="number" class="form-control" id="phone" name="phone" placeholder="Enter Phone" value="${sessionScope.acc.phone}" required />
                                                                        <label for="phone">Phone</label>
                                                                    </div>

                                                                    <!-- Address -->
                                                                    <div class="form-floating mb-4 theme-form-floating">
                                                                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter address" value="${sessionScope.acc.address}" required />
                                                                        <label for="address">Address</label>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary btn-md" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn theme-bg-color btn-md text-white">Save changes</button>
                                                                    </div>

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Edit Profile Modal End -->

                                                <div class="col-xxl-5">
                                                    <div class="profile-image">
                                                        <img
                                                            src="${pageContext.request.contextPath}/assets/images/inner-page/dashboard-profile.png"
                                                            class="img-fluid blur-up lazyload"
                                                            alt=""
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- User Dashboard Section End -->

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

        <!-- Add address modal box start -->
        <div
            class="modal fade theme-modal"
            id="add-address"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            Add a new address
                        </h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            >
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-floating mb-4 theme-form-floating">
                                <input
                                    type="text"
                                    class="form-control"
                                    id="fname"
                                    placeholder="Enter First Name"
                                    />
                                <label for="fname">First Name</label>
                            </div>
                        </form>

                        <form>
                            <div class="form-floating mb-4 theme-form-floating">
                                <input
                                    type="text"
                                    class="form-control"
                                    id="lname"
                                    placeholder="Enter Last Name"
                                    />
                                <label for="lname">Last Name</label>
                            </div>
                        </form>

                        <form>
                            <div class="form-floating mb-4 theme-form-floating">
                                <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    placeholder="Enter Email Address"
                                    />
                                <label for="email">Email Address</label>
                            </div>
                        </form>

                        <form>
                            <div class="form-floating mb-4 theme-form-floating">
                                <textarea
                                    class="form-control"
                                    placeholder="Leave a comment here"
                                    id="address"
                                    style="height: 100px"
                                    ></textarea>
                                <label for="address">Enter Address</label>
                            </div>
                        </form>

                        <form>
                            <div class="form-floating mb-4 theme-form-floating">
                                <input
                                    type="email"
                                    class="form-control"
                                    id="pin"
                                    placeholder="Enter Pin Code"
                                    />
                                <label for="pin">Pin Code</label>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary btn-md"
                            data-bs-dismiss="modal"
                            >
                            Close
                        </button>
                        <button
                            type="button"
                            class="btn theme-bg-color btn-md text-white"
                            data-bs-dismiss="modal"
                            >
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add address modal box end -->

        <!-- Location Modal Start -->
        <div
            class="modal location-modal fade theme-modal"
            id="locationModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">
                            Choose your Delivery Location
                        </h5>
                        <p class="mt-1 text-content">
                            Enter your address and we will specify the offer for your area.
                        </p>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            >
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="location-list">
                            <div class="search-input">
                                <input
                                    type="search"
                                    class="form-control"
                                    placeholder="Search Your Area"
                                    />
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

        <!-- Edit Profile Start -->
        <div class="modal fade theme-modal" id="editProfile" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">

            <div class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Edit Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-4">
                            <div class="col-xxl-12">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="pname" value="Jack Jennas" />
                                        <label for="pname">Full Name</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-6">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input
                                            type="email"
                                            class="form-control"
                                            id="email1"
                                            value="vicki.pope@gmail.com"
                                            />
                                        <label for="email1">Email address</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-6">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input class="form-control" type="tel" value="4567891234" name="mobile" id="mobile" maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                        <label for="mobile">Email address</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-12">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="address1" value="8424 James Lane South San Francisco" />
                                        <label for="address1">Add Address</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-12">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input type="text" class="form-control" id="address2" value="CA 94080" />
                                        <label for="address2">Add Address 2</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-4">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <select
                                            class="form-select"
                                            id="floatingSelect1"
                                            aria-label="Floating label select example"
                                            >
                                            <option selected>Choose Your Country</option>
                                            <option value="kindom">United Kingdom</option>
                                            <option value="states">United States</option>
                                            <option value="fra">France</option>
                                            <option value="china">China</option>
                                            <option value="spain">Spain</option>
                                            <option value="italy">Italy</option>
                                            <option value="turkey">Turkey</option>
                                            <option value="germany">Germany</option>
                                            <option value="russian">Russian Federation</option>
                                            <option value="malay">Malaysia</option>
                                            <option value="mexico">Mexico</option>
                                            <option value="austria">Austria</option>
                                            <option value="hong">Hong Kong SAR, China</option>
                                            <option value="ukraine">Ukraine</option>
                                            <option value="thailand">Thailand</option>
                                            <option value="saudi">Saudi Arabia</option>
                                            <option value="canada">Canada</option>
                                            <option value="singa">Singapore</option>
                                        </select>
                                        <label for="floatingSelect">Country</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-4">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <select class="form-select" id="floatingSelect">
                                            <option selected>Choose Your City</option>
                                            <option value="kindom">India</option>
                                            <option value="states">Canada</option>
                                            <option value="fra">Dubai</option>
                                            <option value="china">Los Angeles</option>
                                            <option value="spain">Thailand</option>
                                        </select>
                                        <label for="floatingSelect">City</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-4">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="address3"
                                            value="94080"
                                            />
                                        <label for="address3">Pin Code</label>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-animation btn-md fw-bold"
                            data-bs-dismiss="modal"
                            >
                            Close
                        </button>
                        <button
                            type="button"
                            data-bs-dismiss="modal"
                            class="btn theme-bg-color btn-md fw-bold text-light"
                            >
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Edit Profile End -->

        <!-- Edit Card Start -->
        <div
            class="modal fade theme-modal"
            id="editCard"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div
                class="modal-dialog modal-lg modal-dialog-centered modal-fullscreen-sm-down"
                >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel8">Edit Card</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-4">
                            <div class="col-xxl-6">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="finame"
                                            value="Mark"
                                            />
                                        <label for="finame">First Name</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-6">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="laname"
                                            value="Jecno"
                                            />
                                        <label for="laname">Last Name</label>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xxl-4">
                                <form>
                                    <div class="form-floating theme-form-floating">
                                        <select
                                            class="form-select"
                                            id="floatingSelect12"
                                            aria-label="Floating label select example"
                                            >
                                            <option selected>Card Type</option>
                                            <option value="kindom">Visa Card</option>
                                            <option value="states">MasterCard Card</option>
                                            <option value="fra">RuPay Card</option>
                                            <option value="china">Contactless Card</option>
                                            <option value="spain">Maestro Card</option>
                                        </select>
                                        <label for="floatingSelect12">Card Type</label>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-animation btn-md fw-bold"
                            data-bs-dismiss="modal"
                            >
                            Cancel
                        </button>
                        <button
                            type="button"
                            class="btn theme-bg-color btn-md fw-bold text-light"
                            >
                            Update Card
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Edit Card End -->
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

        <!-- Wizard js -->
        <script src="${pageContext.request.contextPath}/assets/js/wizard.js"></script>

        <!-- Slick js-->
        <script src="${pageContext.request.contextPath}/assets/js/slick/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick/custom_slick.js"></script>

        <!-- Quantity js -->
        <script src="${pageContext.request.contextPath}/assets/js/quantity-2.js"></script>

        <!-- Nav & tab upside js -->
        <script src="${pageContext.request.contextPath}/assets/js/nav-tab.js"></script>

        <!-- script js -->
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
        <style>
            .order-contain {
                margin-bottom: 30px; /* Tạo khoảng cách giữa các đơn hàng */
            }

            .order-box {
                width: 100%;
                max-width: 1200px; /* Giới hạn chiều rộng để không bị quá lớn */
                padding: 20px;
                border-radius: 10px;
                background-color: #f8f9fa;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .order-container {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .order-icon i {
                font-size: 40px;
                color: #ff8c00;
            }

            .order-detail {
                flex-grow: 1;
            }

            .order-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
            }

            .order-footer h5 {
                font-size: 18px;
                color: #333;
            }

            .btn-primary {
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
            }
        </style>


        <script>
                                                function loadOrders() {
                                                    console.log("📌 Fetching order data...");
                                                    fetch('/Gr1_Warehouse/customer-order')
                                                            .then(function (response) {
                                                                if (!response.ok) {
                                                                    throw new Error("Server returned " + response.status);
                                                                }
                                                                return response.json(); // ✅ Chuyển đổi phản hồi thành JSON
                                                            })
                                                            .then(function (orderList) {
                                                                console.log("✅ Orders received:", orderList);

                                                                // Sắp xếp đơn hàng theo ngày (mới nhất lên đầu)
                                                                orderList.sort(function (a, b) {
                                                                    var dateA = new Date(a.order.orderDate);
                                                                    var dateB = new Date(b.order.orderDate);
                                                                    return dateB - dateA; // Sắp xếp giảm dần
                                                                });
                                                                
                                                                var orderHTML = "";
                                                                if (orderList.length === 0) {
                                                                    orderHTML = "<p class='text-danger'>🚨 Bạn chưa có đơn hàng nào!</p>";
                                                                } else {
                                                                    orderList.forEach(function (orderDetail) {
                                                                        var order = orderDetail.order;

                                                                        // ✅ Chuyển đổi timestamp thành ngày tháng chuẩn
                                                                        var formattedDate = new Date(order.orderDate).toLocaleString('vi-VN', {
                                                                            day: '2-digit', month: '2-digit', year: 'numeric',
                                                                            hour: '2-digit', minute: '2-digit'
                                                                        });

                                                                        // ✅ Nối chuỗi bằng cách sử dụng dấu `+`
                                                                        orderHTML += "<div class='order-contain'>" +
                                                                                "<div class='order-box dashboard-bg-box'>" +
                                                                                "<div class='order-container'>" +
                                                                                "<div class='order-icon'><i data-feather='box'></i></div>" +
                                                                                "<div class='order-detail'>" +
                                                                                "<h4>Order ID: <span>#" + order.orderId + "</span></h4>" +
                                                                                "<h6 class='text-content'>Date: " + formattedDate + "</h6>" +
                                                                                "<h6 class='text-content'>Status: <span class='badge bg-warning'>" + order.status + "</span></h6>" +
                                                                                "<h6 class='text-content'>Total: " + order.totalAmount.toLocaleString('vi-VN') + " VND</h6>" +
                                                                                "</div>" +
                                                                                "</div>" +
                                                                                "<div class='order-footer d-flex justify-content-end'>" +
                                                                                "<a href='customerOrderDetail?orderId=" + order.orderId + "' class='btn btn-primary'>View Details</a>" +
                                                                                "</div>" +
                                                                                "</div>" +
                                                                                "</div>";
                                                                    });
                                                                }
                                                                document.getElementById('pills-order-content').innerHTML = orderHTML;
                                                            })
                                                            .catch(function (error) {
                                                                console.error("❌ Error loading orders:", error);
                                                            });
                                                }

        </script>

        <script>
            // Kiểm tra xem có thông báo error hoặc success không
            <% if (error != null || success != null) { %>
            // Tự động mở modal edit-password
            $(document).ready(function () {
                $('#edit-password').modal('show');
            });
            <% } %>
        </script>

        <%@ include file="/includes/footer.jsp" %> <!-- Nhúng footer -->
    </body>
