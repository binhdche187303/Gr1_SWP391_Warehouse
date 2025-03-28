<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon/8.png" type="image/x-icon">
        <title>Thêm ảnh sản phẩm</title>

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

        <%@include file="/includes/admin.jsp" %>
        <div class="page-wrapper compact-wrapper" id="pageWrapper">
            <!-- Page Body Start -->
            <div class="page-body-wrapper">
                <!-- Container-fluid starts-->
                <div class="page-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div>
                                <div>
                                    <h2 class="mb-0 text-success">Bước 2</h2>
                                </div>
                            </div>
                            <div class="progress" style="height: 20px;">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="title-header option-title">
                                                    <h5>Tạo sản phẩm mới</h5>
                                                </div>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                                        <form class="theme-form theme-form-2 mega-form" action="createproductimg" method="post" id="editImageForm">
                                                            <div class="row">
                                                                <!-- Hiển thị danh sách ảnh hiện có - sẽ ẩn khi chưa có ảnh -->
                                                                <div class="mb-3 existing-images-section" style="display: none;">
                                                                    <label class="form-label">Ảnh hiện có</label>
                                                                    <div class="row" id="imageContainer">
                                                                        <!-- Ảnh sẽ được thêm vào đây bằng JavaScript -->
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
                                                                         style="max-width: 30%; display: none; border: 1px solid #ccc; padding: 5px;">
                                                                </div>
                                                                <button type="submit" class="btn btn-primary">Gửi</button>
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
        <!--<script src="${pageContext.request.contextPath}/assets2/js/customizer.js"></script>-->

        <!-- ratio js -->
        <script src="${pageContext.request.contextPath}/assets2/js/ratio.js"></script>

        <!-- sidebar effect -->
        <!--<script src="${pageContext.request.contextPath}/assets2/js/sidebareffect.js"></script>-->

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
// Start edit Image
// Định nghĩa cấu trúc dữ liệu để lưu trữ danh sách ảnh
                                                                        let imageList = []; // Mảng lưu danh sách ảnh hiện tại
                                                                        let deletedImageIds = []; // Mảng lưu ID ảnh cần xóa
                                                                        const BASE_IMAGE_PATH = 'assets/images/img_products/'; // Đường dẫn gốc cho ảnh sản phẩm

// Khởi tạo dữ liệu ban đầu từ danh sách ảnh hiện có
                                                                        function initializeImageList() {
                                                                            const imageContainer = document.getElementById('imageContainer');

                                                                            // Nếu không có imageContainer, có thể đây là trường hợp tạo mới, không cần tiếp tục
                                                                            if (!imageContainer)
                                                                                return;

                                                                            const existingImages = imageContainer.querySelectorAll('.image-item');

                                                                            // Reset mảng
                                                                            imageList = [];

                                                                            // Kiểm tra xem có ảnh hiện có không
                                                                            if (existingImages.length === 0 || (existingImages.length === 1 && !existingImages[0].getAttribute('data-id'))) {
                                                                                // Nếu không có ảnh hoặc chỉ có ảnh mẫu trống, ẩn phần hiển thị ảnh hiện có
                                                                                const existingImagesSection = document.querySelector('.existing-images-section');
                                                                                if (existingImagesSection) {
                                                                                    existingImagesSection.style.display = 'none';
                                                                                }
                                                                                return;
                                                                            }

                                                                            // Thêm các ảnh hiện có vào mảng
                                                                            existingImages.forEach(imageItem => {
                                                                                const imageId = imageItem.getAttribute('data-id');
                                                                                // Nếu không có ID hoặc ID trống, bỏ qua
                                                                                if (!imageId)
                                                                                    return;

                                                                                const imgElement = imageItem.querySelector('img');
                                                                                const imageSrc = imgElement.getAttribute('src');

                                                                                // Nếu không có source hoặc source trống, bỏ qua
                                                                                if (!imageSrc)
                                                                                    return;

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

                                                                                // Hiển thị phần danh sách ảnh nếu trước đó đang ẩn
                                                                                const existingImagesSection = document.querySelector('.existing-images-section');
                                                                                if (existingImagesSection) {
                                                                                    existingImagesSection.style.display = 'block';
                                                                                }
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

                                                                                // Nếu không còn ảnh nào, ẩn phần danh sách ảnh
                                                                                if (imageList.length === 0) {
                                                                                    const existingImagesSection = document.querySelector('.existing-images-section');
                                                                                    if (existingImagesSection) {
                                                                                        existingImagesSection.style.display = 'none';
                                                                                    }
                                                                                }
                                                                            }
                                                                        }

// Hiển thị danh sách ảnh lên giao diện
                                                                        function renderImageList() {
                                                                            const imageContainer = document.getElementById('imageContainer');
                                                                            if (!imageContainer)
                                                                                return;

                                                                            imageContainer.innerHTML = ''; // Xóa nội dung hiện tại

                                                                            // Thêm các ảnh vào container
                                                                            imageList.forEach(image => {
                                                                                const imageItem = document.createElement('div');
                                                                                imageItem.className = 'col-md-2 text-center image-item'; // Giảm từ col-md-3 xuống col-md-2
                                                                                imageItem.setAttribute('data-id', image.id);

                                                                                // Sử dụng URL hiển thị phù hợp cho từng loại ảnh
                                                                                const displayUrl = image.isNew ? image.url : image.url;

                                                                                // Tạo HTML cho mỗi ảnh không sử dụng template literal
                                                                                imageItem.innerHTML =
                                                                                        '<img src="' + displayUrl + '" alt="Ảnh sản phẩm" class="img-thumbnail existing-image mb-2" style="width: 100%; height: 120px; object-fit: contain;">' +
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

                                                                                // Xử lý tất cả ảnh trong danh sách (cả cũ và mới)
                                                                                for (const img of imageList) {
                                                                                    imagesList.push({
                                                                                        // Chỉ gửi thông tin cần thiết - bỏ product_id
                                                                                        image_id: img.isNew ? "new" : img.id,
                                                                                        image_url: img.fileName
                                                                                    });
                                                                                    console.log("Adding image to list:", img.fileName);
                                                                                }

                                                                                // Log để debug
                                                                                console.log("Image list to be sent:", JSON.stringify(imagesList));

                                                                                // Thêm input ẩn chứa danh sách ảnh
                                                                                let hiddenInput = document.querySelector('input[name="imagesList"]');
                                                                                if (!hiddenInput) {
                                                                                    hiddenInput = document.createElement('input');
                                                                                    hiddenInput.type = 'hidden';
                                                                                    hiddenInput.name = 'imagesList';
                                                                                    this.appendChild(hiddenInput);
                                                                                }
                                                                                hiddenInput.value = JSON.stringify(imagesList);
                                                                                console.log("Hidden input value:", hiddenInput.value);
                                                                            });
                                                                        }

// Khởi tạo khi trang được tải
                                                                        document.addEventListener('DOMContentLoaded', function () {
                                                                            initializeImageList();
                                                                            addAddImageButton();
                                                                            setupFormSubmission();
                                                                        });
        </script>

    </body>

</html>