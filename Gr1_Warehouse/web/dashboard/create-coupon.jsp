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
        <title>Fastkart - Create Coupon</title>

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
                                                    <h5>Create Coupon</h5>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form">
                                                            <div class="row">
                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="form-label-title col-lg-2 col-md-3 mb-0">Coupon
                                                                        Title</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="text">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Coupon
                                                                        Code</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="number">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Start
                                                                        Date</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="date">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">End
                                                                        Date</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="date">
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="form-label-title col-lg-2 col-md-3 mb-0">Free
                                                                        Shipping</label>
                                                                    <div class="col-md-9">
                                                                        <div class="form-check user-checkbox ps-0">
                                                                            <input class="checkbox_animated check-it"
                                                                                   type="checkbox" value=""
                                                                                   id="flexCheckDefault">
                                                                            <label
                                                                                class="form-label-title col-md-2 mb-0">Allow
                                                                                Free Shipping</label>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 row align-items-center">
                                                                    <label
                                                                        class="col-lg-2 col-md-3 col-form-label form-label-title">Quantity</label>
                                                                    <div class="col-md-9 col-lg-10">
                                                                        <input class="form-control" type="number">
                                                                    </div>
                                                                </div>

                                                                <div class="row align-items-center">
                                                                    <label
                                                                        class="form-label-title col-lg-2 col-md-3 mb-0">Status</label>
                                                                    <div class="col-md-9">
                                                                        <div class="form-check user-checkbox ps-0">
                                                                            <input class="checkbox_animated check-it"
                                                                                   type="checkbox" value=""
                                                                                   id="flexCheckDefault1">
                                                                            <label class="form-label-title col-md-2 mb-0">
                                                                                Enable the Coupon</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                </br>
                                                                </br>
                                                                </br>

                                                                <div class="col-lg-2 col-md-3 mb-4"></div>
                                                                <div class="col-md-9 col-lg-10">
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </div>
                                                            </div>

                                                        </form>
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
                <!-- Create Coupon Table End -->
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
        <script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>

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
        <script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>

        <!-- Theme js -->
        <script src="${pageContext.request.contextPath}/assets2/js/script.js"></script>
    </body>

</html>