--CREATE DATABASE SWPV1
--GO

--USE SWPV1
--GO

--USE master;
--GO
--ALTER DATABASE SWPV1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--GO



--drop database SWPV1
--go





-- Bảng Roles (Vai trò người dùng)
CREATE TABLE Roles (
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name NVARCHAR(255) NOT NULL
);

-- Bảng Users (Người dùng)
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    fullname NVARCHAR(255),
    phone NVARCHAR(11),
    email NVARCHAR(255),
    role_id INT NOT NULL,
    address NVARCHAR(255),
    status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Deactive')),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

-- Bảng Brands (Thương hiệu)
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    brand_name NVARCHAR(255) NOT NULL
);

-- Bảng Sizes (Kích thước sản phẩm)
CREATE TABLE Sizes (
    size_id INT PRIMARY KEY IDENTITY(1,1),
    size_name NVARCHAR(50) NOT NULL
);

-- Bảng Categories (Danh mục sản phẩm)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(255) NOT NULL
);

-- Bảng Products (Sản phẩm)
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name NVARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    origin NVARCHAR(255),
    category_id INT,
    description NVARCHAR(MAX),
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Bảng ProductVariants (Phân loại sản phẩm)
CREATE TABLE ProductVariants (
    variant_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    sku NVARCHAR(255) NOT NULL UNIQUE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (size_id) REFERENCES Sizes(size_id)
);

-- Bảng Images (Hình ảnh sản phẩm)
CREATE TABLE Images (
    image_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL,
    image_url NVARCHAR(2083) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Bảng Suppliers (Nhà cung cấp)
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY IDENTITY(1,1),
    supplier_name NVARCHAR(255) NOT NULL,
    supplier_code NVARCHAR(10) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    email NVARCHAR(255),
    address NVARCHAR(255),
    status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Deactive'))
);

CREATE TABLE Discounts (
    discount_id INT IDENTITY(1,1) PRIMARY KEY,  -- Mã giảm giá
	 discount_code NVARCHAR(50) UNIQUE NOT NULL,
    min_quantity INT,  -- Số lượng tối thiểu để áp dụng giảm giá
    min_order_value INT, -- Giá trị tối thiểu của đơn hàng (VND) để áp dụng giảm giá
    discount_percentage DECIMAL(5, 2),  -- Tỷ lệ giảm giá (ví dụ: 7% là 7.00)
    start_date DATETIME,  -- Ngày bắt đầu áp dụng
    end_date DATETIME,  -- Ngày kết thúc áp dụng (nếu có)
	max_uses INT NULL CHECK (max_uses > 0),
    created_at DATETIME DEFAULT GETDATE(),
	status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE DiscountHistory (
    discount_history_id INT IDENTITY(1,1) PRIMARY KEY,
    discount_id INT NOT NULL,
    old_discount_percentage DECIMAL(5,2) NULL CHECK (old_discount_percentage > 0 AND old_discount_percentage < 100),
    new_discount_percentage DECIMAL(5,2) NOT NULL CHECK (new_discount_percentage > 0 AND new_discount_percentage < 100),
    old_status NVARCHAR(10) CHECK (old_status IN ('Active', 'Inactive')),
    new_status NVARCHAR(10) CHECK (new_status IN ('Active', 'Inactive')),
    old_max_uses INT NULL CHECK (old_max_uses > 0),
    new_max_uses INT NULL CHECK (new_max_uses > 0),
    change_date DATETIME DEFAULT GETDATE() NOT NULL,
    changed_by INT DEFAULT 1,
    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id) ON DELETE CASCADE,
    FOREIGN KEY (changed_by) REFERENCES Users(user_id) ON DELETE SET NULL
);

-- Bảng Cart (Giỏ hàng)
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (size_id) REFERENCES Sizes(size_id)
);

-- Bảng Orders (Đơn hàng)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT GETDATE(),
    total_amount DECIMAL(18, 2) NOT NULL,
    status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
	customer_name NVARCHAR(255) NULL,
    phone_number NVARCHAR(15) NULL,
    email NVARCHAR(255) NULL,
    shipping_address NVARCHAR(MAX) NULL,
    notes NVARCHAR(MAX) NULL
);

-- Bảng OrderDetails (Chi tiết đơn hàng)
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (size_id) REFERENCES Sizes(size_id)
);

-- Bảng Payment (Thanh toán)
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    payment_method NVARCHAR(255) NOT NULL,
    payment_date DATETIME NOT NULL DEFAULT GETDATE(),
    payment_status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Bảng Warehouses (Kho)
CREATE TABLE Warehouses (
    warehouse_id INT PRIMARY KEY IDENTITY(1,1),
    warehouse_name NVARCHAR(255) NOT NULL,
    phone NVARCHAR(20),
    address NVARCHAR(255) NOT NULL,
    status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Deactive'))
);

CREATE TABLE TokenForgetPassword (
    id INT PRIMARY KEY IDENTITY(1,1),       -- ID tự động tăng
    token NVARCHAR(255) NOT NULL UNIQUE,          -- Token để reset mật khẩu
    expireTime DATETIME NOT NULL,          -- Thời gian hết hạn token
    isUsed BIT NOT NULL DEFAULT 0,         -- Trạng thái sử dụng token (0: chưa sử dụng, 1: đã sử dụng)
    user_id INT NOT NULL,                  -- Liên kết tới bảng Users
    FOREIGN KEY (user_id) REFERENCES Users(user_id) -- Khóa ngoại liên kết bảng Users
);



CREATE TABLE InventoryBatches (
    batch_id INT PRIMARY KEY IDENTITY(1,1),   
    sku NVARCHAR(255) NOT NULL,
    quantity INT NOT NULL,                    
    unit_price DECIMAL(18,0) NOT NULL,        
    expiration_date DATE,                     
    received_date DATETIME NOT NULL,          
    warehouse_id INT NOT NULL,                
    status NVARCHAR(20) NOT NULL DEFAULT 'In Stock' 
        CHECK (status IN ('In Stock', 'Sold Out', 'Expired')),  
    FOREIGN KEY (sku) REFERENCES ProductVariants(sku),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);



--Bảng PurchaseOrder (Phiếu nhập hàng)
CREATE TABLE PurchaseOrder (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    order_date DATETIME NOT NULL,
    supplier_id INT NOT NULL,
    total_amount DECIMAL(18,0) NOT NULL,
	bill_img_url VARCHAR(255) NULL,
    status NVARCHAR(50) DEFAULT N'Chờ nhập kho' CHECK (status IN (N'Chờ nhập kho', N'Đã nhập kho', N'Đã hủy')),
    notes NVARCHAR(MAX),
    warehouse_id INT NOT NULL,
    user_id INT NOT NULL,
	reference_code NVARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
--Bảng PurchaseDetails (Phiếu nhập hàng chi tiết)
CREATE TABLE PurchaseDetails (
    detail_id INT PRIMARY KEY IDENTITY(1,1),  -- ID chi tiết nhập hàng
    order_id INT NOT NULL,                     -- ID phiếu nhập hàng
    variant_id INT NOT NULL,          
    quantity INT NOT NULL,                     -- Số lượng nhập
    unit_price DECIMAL(18,0) NOT NULL,          -- Giá nhập mỗi đơn vị
    total_price AS (quantity * unit_price),    -- Tổng tiền (tự tính)
    expiration_date DATE,                      -- Ngày hết hạn (nếu có)
    warehouse_id INT NOT NULL,                 -- Kho lưu trữ
    batch_id INT,                             -- ID lô hàng (nếu đã có)
    FOREIGN KEY (order_id) REFERENCES PurchaseOrder(order_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (batch_id) REFERENCES InventoryBatches(batch_id),
	FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
);



--Bảng InventoryCheck (Phiếu kiểm kho)
CREATE TABLE InventoryCheck (
    check_id INT PRIMARY KEY IDENTITY(1,1),
    check_date DATETIME NOT NULL,
    warehouse_id INT NOT NULL,
    status NVARCHAR(50) DEFAULT 'Pending' CHECK (status IN ('Pending', 'Completed', 'Approved', 'Cancelled')),
    created_by INT NOT NULL,
    reviewed_by INT,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    FOREIGN KEY (created_by) REFERENCES Users(user_id),
    FOREIGN KEY (reviewed_by) REFERENCES Users(user_id)
);

--Bảng InventoryCheckDetails (Phiếu kiểm kho chi tiết)
CREATE TABLE InventoryCheckDetails (
    check_detail_id INT PRIMARY KEY IDENTITY(1,1),  -- ID chi tiết kiểm kho
    check_id INT NOT NULL,                          -- ID phiếu kiểm kho
    batch_id INT NOT NULL,                          -- ID lô hàng được kiểm
    variant_id INT NOT NULL,                        -- ID biến thể sản phẩm
    sku NVARCHAR(50) NOT NULL,                       -- Mã SKU
    expected_quantity INT NOT NULL,                 -- Số lượng hệ thống ghi nhận
    actual_quantity INT NOT NULL,                   -- Số lượng thực tế kiểm được
    discrepancy AS (actual_quantity - expected_quantity), -- Chênh lệch
	discrepancy_status VARCHAR(20) DEFAULT 'Unresolved'	CHECK (discrepancy_status IN ('Unresolved', 'Resolved', 'Approved', 'Cancelled')),
    reason TEXT,                                   -- Lý do chênh lệch (hỏng, mất, hết hạn, v.v.)
    FOREIGN KEY (check_id) REFERENCES InventoryCheck(check_id),
    FOREIGN KEY (batch_id) REFERENCES InventoryBatches(batch_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
);

--Bảng InventoryAdjustments (Điều chỉnh tồn kho)
CREATE TABLE InventoryAdjustments (
    adjustment_id INT PRIMARY KEY IDENTITY(1,1),  -- ID điều chỉnh tồn kho
    check_detail_id INT NOT NULL,                  -- ID chi tiết kiểm kho
    batch_id INT NOT NULL,                         -- ID lô hàng cần điều chỉnh
    variant_id INT NOT NULL,                       -- ID biến thể sản phẩm
    adjustment_quantity INT NOT NULL,              -- Số lượng điều chỉnh
    adjustment_reason TEXT NOT NULL,               -- Lý do điều chỉnh
    adjusted_by INT NOT NULL,                      -- Người thực hiện điều chỉnh
    adjustment_date DATETIME NOT NULL,              -- Ngày điều chỉnh
    FOREIGN KEY (check_detail_id) REFERENCES InventoryCheckDetails(check_detail_id),
    FOREIGN KEY (batch_id) REFERENCES InventoryBatches(batch_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id),
    FOREIGN KEY (adjusted_by) REFERENCES Users(user_id)
);


CREATE TABLE SupplierBrand (
    id INT IDENTITY(1,1) PRIMARY KEY,
    supplier_id INT NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

CREATE TABLE OrderDiscounts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    discount_id INT NOT NULL,
    applied_discount_percentage DECIMAL(5,2) NOT NULL,
    applied_amount DECIMAL(18,2) NOT NULL,
    applied_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id)
);

CREATE TABLE OrderPayments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    deposit_amount DECIMAL(18,2) NOT NULL, -- Số tiền đặt cọc (50%)
    remaining_amount DECIMAL(18,2) NOT NULL, -- Số tiền còn lại phải thanh toán (50%)
    payment_status NVARCHAR(50) DEFAULT 'Đã thanh toán 50%', -- Trạng thái thanh toán
    created_at DATETIME DEFAULT GETDATE(), -- Ngày tạo giao dịch
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


CREATE TABLE PackingDetails (
    packing_id INT IDENTITY(1,1) PRIMARY KEY, -- Mã đóng gói
    order_id INT NOT NULL, -- Mã đơn hàng
    staff_id INT NOT NULL, -- Nhân viên đóng gói
    status NVARCHAR(50) DEFAULT 'Chờ xử lý', -- Trạng thái đóng gói
    packed_at DATETIME DEFAULT GETDATE(), -- Thời gian đóng gói
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (staff_id) REFERENCES Users(user_id)
);


CREATE TRIGGER trg_AfterDiscountUpdate
ON Discounts
AFTER UPDATE, INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lưu lịch sử khi có sự thay đổi discount_percentage, status hoặc max_uses
    INSERT INTO DiscountHistory (discount_id, old_discount_percentage, new_discount_percentage, old_status, new_status, old_max_uses, new_max_uses, changed_by, change_date)
    SELECT
        i.discount_id,
        d.discount_percentage,  -- Giá trị cũ của discount_percentage
        i.discount_percentage,  -- Giá trị mới của discount_percentage
        d.status,  -- Trạng thái cũ
        i.status,  -- Trạng thái mới
        d.max_uses,  -- Giá trị cũ của max_uses
        i.max_uses,  -- Giá trị mới của max_uses
        1,  -- changed_by mặc định
        GETDATE()
    FROM inserted i
    LEFT JOIN deleted d ON i.discount_id = d.discount_id
    WHERE
        -- Nếu là INSERT hoặc discount_percentage thay đổi
        d.discount_percentage IS NULL
        OR i.discount_percentage <> d.discount_percentage
        -- Nếu status thay đổi
        OR i.status <> d.status
        -- Nếu max_uses thay đổi
        OR i.max_uses <> d.max_uses;

    -- Cập nhật created_at thành ngày hiện tại cho các bản ghi bị cập nhật
    UPDATE Discounts
    SET created_at = GETDATE()
    FROM Discounts
    JOIN inserted ON Discounts.discount_id = inserted.discount_id;
END;
INSERT INTO dbo.Roles(role_name)
VALUES
(N'Admin system'),
(N'Customer'),
(N'Warehouse manager'),
(N'Warehouse staffs'),
(N'Packing staffs');

INSERT INTO dbo.Brands(brand_name)
VALUES
(N'Orion'),
(N'Phạm Nguyên'),
(N'Pepsico'),
(N'Kinh Đô')

INSERT INTO Sizes (size_name)
VALUES
(N'20 Hộp x 6 cái'),
(N'20 Hộp x 12 cái'),
(N'20 Hộp x 10 cái'),
(N'20 Hộp x 5 cái'),
(N'20 Hộp x 4 cái'),
(N'20 Hộp x 8 cái'),
(N'20 Hộp x 35g'),
(N'50 Gói'),
(N'20 Hộp x 14 cái'),
(N'8 Bịch x 20 cái')

INSERT INTO dbo.Categories (category_name)
VALUES
(N'Kẹo'),
(N'Snack'),
(N'Bánh mì'),
(N'Bánh quy'),
(N'Bánh bông lan'),
(N'Bánh ngọt'),
(N'Bánh gạo'),
(N'Nước uống có ga'),
(N'Nước uống đóng chai'),
(N'Nước uống trái cây'),
(N'Nước tăng lực'),
(N'Nước bù điện giải'),
(N'Trà và cà phê'),
(N'Sữa và sản phẩm từ sữa');

INSERT INTO Products (product_name, brand_id, origin, category_id, description)
VALUES

------------------------------------------------ BRAND_ID : 1 : ORION - TUẤN ------------------------------------------------
--Banh ChocoPie(3)
(   N'[1 THÙNG] Bánh ChocoPie Truyền Thống',1,
    N'Việt Nam', 6,
    N'Chiếc bánh tròn màu nâu sôcôla thật ngon miệng. Cắn một miếng đầu tiên, bạn sẽ cảm nhận được sự mềm mịn, bông xốp của hai lớp bánh. Kế đến là cấu trúc khó lẫn của nhân marshmallow dẻo dẻo dai dai. Và đọng lại cuối cùng là vị sôcôla đặc trưng, thơm ngon đến nao lòngTình như ChocoPie, Orion ChocoPie là sự lựa chọn hàng đầu của các bà mẹ.'
),
(   N'[1 THÙNG] Bánh ChocoPie Đậm',1,
    N'Việt Nam', 6,
    N'Orion ChocoPie Đậm với hàm lượng cacao vượt trội lên tới 70%, hương cacao phủ ngập đầu lưỡi, cực nồng nàn và đậm đà. Sản phẩm dành riêng cho các fan cuồng sôcôla, đặc biệt là giới trẻ thích hương vị bùng nổ mạnh mẽ của cacao. Thêm chút đắng cho tình thêm đậm sâu.'
),
(   N'[1 THÙNG] Bánh ChocoPie vị Dưa hấu',1,
    N'Việt Nam', 6,
    N'Bánh ChocoPie Vị Dưa Hấu - Phiên bản Tết đặc biệt với vị dưa hấu thanh mát kết hợp sô cô la ngọt ngào, mang đến một biểu tượng Tết đặc trưng, cầu chúc cho một năm mới đoàn viên, sung túc.'
),
--Banh Bong lan(10)
(   N'[1 THÙNG] Bánh Bông Lan Mứt trái cây Là Fruit',1,
    N'Việt Nam', 5,
    N'Lần đầu tiên trên thị trường, Orion cho ra mắt sản phẩm bánh bông lan mứt trái cây thật với hương vị bùng nổ. Lớp kem cheese bồng bềnh nhẹ tênh giúp tôn lên vị chua ngọt tự nhiên của nhân của mứt đào sần sật. Với các tín đồ yêu thích trái cây tự nhiên và trải nghiệm "thật" mới mẻ, Là Fruit chắc chắn là sự lựa chọn không thể bỏ qua'
),
(   N'[1 THÙNG] Bánh bông lan cao cấp kiểu Âu Opéra vị Socola',1,
    N'Việt Nam', 5,
    N'Chiếc bánh Opéra - Một sự kết hợp giữa lớp bánh bông lan mềm mịn và lớp kem béo mềm, đi kèm là lớp sô cô la phủ bên ngoài mang đến cảm giác sang trọng, thanh lịch và hiện đại, một cảm giác thật "Âu". Với nhiều tầng hương vị hòa quyện, Opéra mong muốn khách hàng được thưởng thức một chiếc bánh tiệm trong tầm tay, thăng hạng cảm xúc cùng trải nghiệm cao cấp.'
),
(   N'[1 THÙNG] Bánh Bông Lan Custas nhân Kem Trứng',1,
    N'Việt Nam', 5,
    N'Bánh Custas kem trứng rất được yêu thích bởi hương vị thơm ngon từ vỏ bánh, đến lớp kem trứng ngọt ngào, sánh mịn được làm từ trứng tươi. Từng chiếc bánh to tròn, được chăm chút từ chọn lọc nguyên liệu, đến khâu nướng bánh và đóng gói cẩn thận, mang đến cho bạn chiếc bánh tròn vị dinh dưỡng.'
),
(   N'[1 THÙNG] Bánh Bông Lan Custas Kem Cốm Hà Nội',1,
    N'Việt Nam', 5,
    N'Custas - dòng bánh bông lan với lớp kem trứng ngọt gắn với bao nhiêu thế hệ trẻ thơ Việt Nam nay có thêm hương vị cốm xanh, thỏa lòng những người ưa thích hương vị cốm Hà thành xưa. Với hương vị cốm Hà Nội thơm ngon, lớp ngoài mềm xốp cùng nhân kem béo mịn, một chiếc bánh custas cốm sẽ là sự lựa chọn tuyệt vời những bữa nhẹ trong một ngày năng động, cung cấp đủ dinh dưỡng và năng lượng đủ để đem lại sự hứng khởi mới.'
),
(   N'[1 THÙNG] Bánh ăn sáng Cest Bon Sandwich Sốt Bơ Phô Mai Chà Bông',1,
    N'Việt Nam',  5,
    N'Một bữa ăn sáng hoàn hảo không chỉ là một bữa ăn có đầy đủ dinh dưỡng mà còn phải thật thơm ngon, mang lại cảm giác tràn đầy năng lượng tươi mới để bắt đầu một ngày làm việc, học tập. Cest Bon Sandwich Sốt Bơ Phô Mai Chà Bông được làm từ lớp bánh bông lan mềm ẩm, sốt phô mai thơm ngậy, cùng chà bông gà dai dai mằn mặn là sự kết hợp hoàn hảo không chỉ giúp xoa dịu cơn đói tức thì mà còn bổ sung thêm Canxi.'
),
(   N'[1 THÙNG] Bánh Ăn Sáng Cest Bon Sợi Thịt Gà',1,
    N'Việt Nam', 5,
    N'Bánh ăn sáng Cest Bon là sự kết hợp hòa quyện giữa bánh bông lan thơm mềm, cùng sợi thịt gà dai dai, mằn mặn. Vị mặn của chà bông gà được tẩm ướp kỹ càng, với hương thơm béo của trứng, mang đến cho bạn chiếc bánh mặn ngọt hòa quyện, thơm ngon, ngất ngây.'
),
(   N'[1 THÙNG] Bánh Ăn Sáng Cest Bon Sợi Thịt Gà Sốt Kem Phô Mai',1,
    N'Việt Nam', 5,
    N'Cest Bon now has a creamy cheese sauce inside, combined with the chewy chicken sponge cake. The C’est Bon Lava Cheese is nutritious, provides 20% more calcium for the body daily needs.'
),
(   N'[1 THÙNG] Bánh Ăn Sáng Cest Bon Sợi Thịt Gà Sốt Kem Trứng Lava',1,
    N'Việt Nam', 5,
    N'Bánh ăn sáng Cest Bon nay có thêm sốt kem lava trứng muối thơm ngon, thịnh hành, hòa quyện cùng bánh bông lan sợi thịt gà, dai dai, mằn mặn. Chiếc bánh sợi thịt gà sốt kem hot trên thị trường, tròn dinh dưỡng, còn cung cấp thêm 20% lượng canxi cho nhu cầu hằng ngày của cơ thể.'
),
(   N'[1 THÙNG] Bánh Custas Tiramisu',1,
    N'Việt Nam', 5,
    N'Trải qua quá trình hoàn thiện đầy chỉn chu và tỉ mỉ, bánh Custas Tiramisu là sự hòa quyện hoàn hảo giữa lớp nhân kem phô mai mềm mại, bồng bềnh với lớp vỏ bánh vị cacao, thơm nhẹ mùi cà phê. Lấy cảm hứng từ món tráng miệng trứ danh của nước Ý, bánh Custas Tiramisu hứa hẹn sẽ là sự lựa chọn ngọt ngào cho mỗi khoảnh khắc gặp gỡ, chuyện trò thêm đậm đà, thú vị.'
),
(   N'[1 THÙNG] Bánh con cá Bống bang',1,
    N'Việt Nam', 5,
    N'Sản phẩm bánh bông lan hình con cá vui nhộn đầu tiên trên thị trường với thiết kế bắt mắt, tươi sáng. Không chỉ độc đáo bởi hình dáng, bánh con cá Bống Bang còn rất đặc biệt khi có đến 4 lớp (bông lan mềm dai, bông lan mềm ẩm, mochi dẻo dẻo và nhân kem sô cô la đậu đỏ thơm bùi). Bổ sung chất Sắt và nguồn nguyên liệu đậu đỏ tốt lành. Bánh con cá Bống Bang không chỉ vui mà còn dinh dưỡng.'
),
--Banh Quy(10)
(   N'[1 THÙNG] Bánh mì nướng kiểu Ý Cest Bon Baguette vị bơ tỏi đút lò',1,
    N'Việt Nam', 3,
    N'Lấy cảm hứng từ những chiếc bánh mì châu Âu thời thượng và bắt mắt, Cest Bon Baguette ra đời với 3 shape bánh mì mini độc nhất cùng vị bơ tỏi đút lò ngon khó cưỡng. Bánh mang đến cho bạn nguồn dinh dưỡng và năng lượng dồi dào để bắt đầu một ngày mới. Hơn thế nữa, Cest Bon Baguette khi đi kèm với các loại thức uống không chỉ tạo nên một bữa sáng cân bằng dinh dưỡng mà còn nâng tầm cảm xúc của bạn khi trải nghiệm phong cách "Ăn phải đi kèm với uống" của Ý'
),
(   N'[1 THÙNG] Bánh quy Gouté Mè Giòn Tan',1,
    N'Việt Nam', 4,
    N' ‘Gouté’ trong tiếng Pháp có nghĩa là ngon miệng và cũng thể hiện gu tinh tế của người dùng khi trải nghiệm bánh. Với sự hòa quyện tuyệt vời giữa vị mặn và ngọt, độ mỏng giòn tan kèm với hương thơm của mè rang đặc trưng, Gouté tạo cảm giác lưu luyến vị giác khi bạn cắn thử.'
),
(   N'[1 THÙNG] Bánh quy Gouté Hạt Dinh Dưỡng',1,
    N'Việt Nam', 4,
    N'Bánh Gouté Hạt bổ sung 5 loại hạt thiết yếu: hạt diêm mạch, hạt mè trắng, hạt mè đen, hạt chia và yến mạch nhằm mang lại giá trị dinh dưỡng cao cho mọi người. Đặc biệt, bánh vẫn giữ được độ mỏng giòn tan kèm vị mằn mặn dễ ăn, đảm bảo chiều lòng được khẩu vị của mọi lứa tuổi.'
),
(   N'[1 THÙNG] Bánh Khoai Tây Nướng Tok vị Phô mai',1,
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp Phô Mai thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'[1 THÙNG] Bánh Khoai Tây Nướng Tok vị Rong biển',1,
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp muối tảo biển thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'[1 THÙNG] Bánh Khoai Tây Nướng Tok vị Bò BBQ',1,
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp gia vị BBQ thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'[1 THÙNG] Bánh quy Toonies Miz vị Socola',1,
    N'Việt Nam', 4,
    N'Bánh quy ăn sáng Toonies Miz vị sô cô la đươc làm từ Chips Socola trắng với nguồn năng lượng dồi dào, bổ sung canxi, sắt, kẽm cho giai đoạn phát triển và lớn khôn của trẻ. Miz có nhiều hình dạng thú vị cùng bao bì bắt mắt với hình ảnh chú bé thổ dân Toonies tinh nghịch, giúp kích thích trẻ ăn ngon.'
),
(   N'[1 THÙNG] Bánh quy Sữa tươi Orion deMarie',1,
    N'Việt Nam', 4,
    N'Bánh quy Marie lần đầu tiên xuất hiện tại London năm 1874, với tên gọi là Queen of Biscuit trong lễ cưới hoàng gia giữa công nương Maria và công tước Duke. Lấy cảm hứng từ Công thức Hoàng gia cùng với sự kết hợp hoàn hảo giữa lúa mì và sữa tươi, Orion cho ra mắt Bánh quy Sữa tươi Orion deMarie thơm ngon hảo hạng và dinh dưỡng cho cả gia đình thưởng thức theo phong cách hoàng gia.'
),
(   N'[1 THÙNG] Bánh quy hoa bơ tự nhiên Marika',1,
    N'Việt Nam', 4,
    N'Hương thơm béo đến từ bơ Anchor trứ danh kết hợp cùng vị đắng nhẹ của Chocolate thượng hạng hoà quyện trong những chiếc bánh hình bông hoa xinh đẹp của xứ sở New Zealand.'
),
(   N'[1 THÙNG] Bánh quy ăn sáng Miz x Doraemon vị sô cô la',1,
    N'Việt Nam', 4,
    N'Tiện lợi cho mẹ: bánh ăn sáng gói nhỏ tiện lợi đem lại dinh dưỡng cho trẻ từ 100% chips socola trắng và được bổ sung thêm Canxi, Sắt, Kẽm. Vui vẻ cho bé: kết hợp với nhân vật truyện tranh nổi tiếng Doraemon và tạo tương tác, niềm vui cho trẻ thông qua 1 loạt các trò chơi (Tô màu + Thẻ học tiếng anh + Bộ sưu tầm lịch để bàn có 102) bên trong mỗi hộp bánh.'
),
--SnackToonie(4)
(   N'[1 THÙNG] Bánh Snack Toonies vị Ớt đỏ cay nồng',1,
    N'Việt Nam', 2,
    N'Snack Toonies Vị Ớt Đỏ Cay Nồng với hình que đặc biệt, ngộ nghĩnh được làm từ bột bắp. Từng que snack giòn rụm được phủ một lớp vẩy ớt thật cay nồng. Ăn một miếng snack Toonies Vị Ớt Đỏ Cay Nồng, cảm nhận vị cay trong miệng, kích thích mọi giác quan. Nay có thêm que snack cay cấp độ 2, 2 vị cay trong cùng một gói bánh, ngại gì mà không thử bạn ơi!'
),
(   N'[1 THÙNG] Bánh Snack Toonies vị Gà rán giòn tan',1,
    N'Việt Nam', 2,
    N'Là sự kết hợp hoàn hảo giữa những que snack bắp vàng ươm và hương vị gà rán giòn rụm, thơm phức, tuyệt hảo. Snack Toonies Vị Gà rán giòn tan với lớp gia vị đậm đà, là bạn đồng hành tuyệt vời cho mọi khoảnh khắc tươi vui của bạn.'
),
(   N'[1 THÙNG] Bánh Snack Toonies vị Phô mai bùng nổ',1,
    N'Việt Nam', 2,
    N'Que snack giòn tan, thơm thơm vị bắp, kết hợp cùng phô mai ngọt ngào, mặn mặn chắc chắn sẽ làm đắm chìm mọi tín đồ của phô mai. Cắn một miếng Snack Toonies Vị Phô Mai bùng nổ, ngon lành như đưa bạn lạc vào thế giới diệu kỳ đầy niềm vui. Nay có thêm viên snack phô mai béo ngậy, ngon khó cưỡng. Ăn đã hơn, bùng nổ hơn!'
),
(   N'[1 THÙNG] Bánh Snack Toonies Choco vị Socola',1,
    N'Việt Nam', 2,
    N'Snack Toonies Vị Sô Cô La được kết hợp từ bánh bắp giòn tan đặc biệt, sữa hòa quyện cùng bột cacao cao cấp, nay càng ngọt ngào đáng yêu hơn cùng những Thổ dân Choco tinh nghịch, siêu dễ thương. Tất cả nguyên liệu được kết hợp hoàn hảo, giòn bên ngoài, xốp bên trong, chắc chắn sẽ mang lại một trải nghiệm ngọt ngào đầy diệu kỳ cho bạn.'
),
--Snack Cornchip(2)
(   N'[1 THÙNG] Bánh Snack Cornchip vị Bắp Nướng Bơ',1,
    N'Việt Nam', 2,
    N'Cảm nhận vị "bắp nướng" và "bơ tươi" hòa quyện thơm lừng ngay khi mở gói. Miếng bánh thanh mỏng vừa phải, cắn vào giòn tan, ăn hoài không ngán. Hương vị hấp dẫn khó cưỡng cho cuộc vui trọn vẹn!'
),
(   N'[1 THÙNG] Bánh Snack Cornchip vị Bắp Nướng Ngọt & Cay',1,
    N'Việt Nam', 2,
    N'Vị bắp thơm lừng hòa quyện thêm chút "cay nhẹ" cho khẩu vị đậm đà. Miếng bánh thanh mỏng vừa phải, cắn vào giòn tan, ăn hoài không ngán. Hương vị hấp dẫn khó cưỡng cho cuộc vui trọn vẹn!'
),
--Ca King(3)
(   N'[1 THÙNG] Bánh Cá King Marine Boy',1,
    N'Việt Nam', 2,
    N'Bánh Cá King Marine Boy với phiên bản bánh to và giòn hơn cùng với hương vị tảo biển Nori đậm đà ngon tuyệt. Hình ảnh cá voi Walee trưởng thành và chứng chạc - là vua biển cả thống lĩnh đại dương đầy quyền lực được các bé vô cùng yêu thích.'
),
(   N'[1 THÙNG] Bánh Cá Marine Boy vị Rong Biển Tuyết Xanh',1,
    N'Việt Nam', 2,
    N'Bánh Cá Marine Boy với hình dạng độc đáo 16 sinh vật biển với câu chuyện thú vị bên trong để các bé vừa ăn, vừa học, vừa chơi! Bánh nướng không chiên, sản phẩm dinh dưỡng, bổ sung canxi với nhiều chương trình khuyến mãi hấp dẫn. Thưởng thức ngay bánh cá vị Rong Biển Tuyết Xanh đậm đà, giòn giòn với câu chuyện phiêu lưu hấp dẫn, vui nhộn!'
),
(   N'[1 THÙNG] Bánh Cá Marine Boy vị Tôm Nướng Môi Đỏ',1,
    N'Việt Nam', 2,
    N'Bánh Cá Marine Boy với hình dạng độc đáo 16 sinh vật biển với câu chuyện thú vị bên trong để các bé vừa ăn, vừa học, vừa chơi! Bánh nướng không chiên, sản phẩm dinh dưỡng, bổ sung canxi với nhiều chương trình khuyến mãi hấp dẫn. Thưởng thức ngay bánh cá vị Tôm Nướng Môi Đỏ đậm đà, giòn giòn với câu chuyện phiêu lưu hấp dẫn, vui nhộn!'
),
--Jungle(3)
(   N'[1 THÙNG] Bánh Jungle Boy Lắk phô mai',1,
    N'Việt Nam', 2,
    N'Junge Boy được các bé vô cùng yêu thích nay đã cho ra hương vị trendy mới cùng cách ăn điệu nghệ - lắc cùng bột phô mai béo ngậy đầy vui nhộn. Không những thế, sản phẩm được tăng cường canxi bổ sung cho bé, vừa vui lại thêm dinh dưỡng đúng không nào?'
),
(   N'[1 THÙNG] Bánh Jungle Boy vị Sườn bò sốt cam',1,
    N'Việt Nam', 2,
    N'Nối tiếp sự thành công của Marine Boy, Orion cho ra mắt bánh khủng long Jungle Boy-vị sườn bò sốt cam. Nhờ hương vị bò thơm ngon, đậm đà, mặn ngọt cùng sự giòn tan ở mỗi chiếc bánh, không chỉ tạo ra cảm giác ngon miệng cho các bé mà còn cung cấp nhiều chất dinh dưỡng, bổ sung canxi cho xương chắc khoẻ. Đặc biệt, bên trong mỗi gói bánh có quả trứng khủng long socola vừa thú vị, vừa thơm ngon, giòn rụm, giúp bé ăn thật ngon và chơi thật vui!'
),
(   N'[1 THÙNG] Bánh Jungle Boy vị Socola Lúa Mạch',1,
    N'Việt Nam', 2,
    N'Jungle Boy càng thêm dinh dưỡng với vị Socola Lúa Mạch mới! Những chiếc bánh mang hình thù khủng long ngộ nghĩnh ẩn chứa những phần quà bất ngờ, dễ thương, giúp cho bé ăn thật ngon, chơi thật vui.'
),
--Ostar(5)
(   N'[1 THÙNG] Bánh Snack O’Star vị Tự Nhiên',1,
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị khoai tây tự nhiên - giữ lại hương vị nguyên bản. Một lát khoai tây chiên vàng giòn không tẩm ướp gia vị sẽ có vị thơm bùi đặc trưng. Là một người đơn giản, khi đã thử qua nhiều vị của snack khoai tây, chắc hẳn bạn sẽ muốn quay về những điều cơ bản nhất, như snack khoai tây O’Star vị khoai tây tự nhiên.'
),
(   N'[1 THÙNG] Bánh Snack O’Star vị Kim Chi Hàn Quốc',1,
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị kim chi - đậm đà chuẩn vị Hàn Quốc. Chỉ những củ khoai tây căng tròn, láng mịn và vàng óng mới được chọn lọc để mang vào giai đoạn cắt gọt, tẩm ướp, chiên giòn. Vị chua chua, cay nồng đặc trưng của kim chi len lỏi trong từng lát khoai tây. Tất cả tạo nên một sự kết hợp hoàn hảo cho những tín đồ sành ẩm thực Hàn Quốc.'
),
(   N'[1 THÙNG] Bánh Snack O’Star vị Tảo Biển',1,
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị tảo biển - tinh túy trong từng lát bánh thanh mặn. Chỉ những củ khoai tây căng tròn, láng mịn và vàng óng mới được chọn lọc để mang vào giai đoạn cắt gọt, tẩm ướp, chiên giòn. Từng lát tảo biển giòn tan, thanh mặn được nghiền mịn, hòa quyện cùng vị khoai thơm bùi. Tất cả tạo nên một hương vị hài hòa, nhẹ nhàng đặc trưng của O’Star vị tảo biển.'
),
(   N'[1 THÙNG] Bánh Snack O’Star vị Phô Mai Trứng Muối',1,
    N'Việt Nam', 2,
    N'Vị mặn bùi bùi của trứng muối cùng vị thơm béo của phô mai hòa quyện trong từng lát bánh khoai tây tươi ngon giòn rụm, chắc chắn sẽ làm hài lòng các tín đồ sành ăn nhất. Snack khoai tây O’Star vị phô mai trứng muối - thơm ngon đến khó cưỡng.'
),
(   N'[1 THÙNG] Bánh Snack O’star K-POP vị xốt Mayo kiểu Hàn Quốc',1,
    N'Việt Nam', 2,
    N'Lát khoai phẳng đặc trưng của O’Star nay được cắt dày hơn với 1.6mm, đậm vị khoai tây tươi ngon, hòa quyện tuyệt hảo cùng hương vị xốt mayo béo ngậy, mặn ngọt với hương thơm đặc trưng kiểu Hàn Quốc một cách vô cùng tinh tế.'
),
--Swing(3)
(   N'[1 THÙNG] Bánh Snack Khoai Tây Swing vị Bíttết Kiểu New York',1,
    N'Việt Nam', 2,
    N'Khoai Tây, Vị Tây. Snack Orion Swing là sự khiêu vũ của từng lát khoai tây tươi hình gợn sóng thấm đẫm lớp gia vị Bò Bít Tết New York đậm đà, đem đến những niềm vui bất tận như điệu Swing mang lại.'
),
(   N'[1 THÙNG] Bánh Snack Khoai Tây Swing vị Gà Teriyaki Osaka',1,
    N'Việt Nam', 2,
    N'Khoai Tây, Vị Nhật. Snack Orion Swing là sự khiêu vũ của từng lát khoai tây tươi hình gợn sóng thấm đẫm lớp gia vị Gà Teriyaki đậm đà, đem đến những niềm vui bất tận như điệu Swing mang lại.'
),
(   N'[1 THÙNG] Bánh Snack Khoai Tây Swing vị Phô Mai 2 Lớp',1,
    N'Việt Nam', 2,
    N'Bánh Snack Khoai Tây Swing Double Cheese - Cú chạm gợn sóng giữa 2 loại phô mai nổi tiếng thế giới. Swing Phô mai Chee-Z với sự kết hợp độc nhất của phô mai Cheddar trứ danh của đất nước Anh Quốc cùng với phô mai Mozzarella từ nước Ý, đủ sức làm điên đảo tín đồ ẩm thực với mùi sữa thơm và cấu trúc kéo sợi độc đáo.'
),
--Keo ngam(3)
(   N'[1 THÙNG] Kẹo ngậm Họng vị Quất Mật Ong',1,
    N'Việt Nam', 1,
    N'Kẹo ngậm hương quất và mật ong thơm mát. Vị ngọt ngọt của mật ong và chua chua của quất tạo nên hương thơm hấp dẫn. Kẹo có tác dụng trong việc trị ho, thư giãn cổ họng, giảm ngứa rát và ho khan. Kẹo Orion chất lượng, ngọt thanh được nhiều người lựa chọn và tin dùng.'
),
(   N'[1 THÙNG] Kẹo ngậm Họng vị Gừng Mật Ong',1,
    N'Việt Nam', 1,
    N'Kẹo ngậm hương gừng và mật ong thơm mát. Vị ngọt ngọt của mật ong và cay thanh của gừng tạo nên hương thơm hấp dẫn. Kẹo có tác dụng trong việc trị ho, thư giãn cổ họng, giảm ngứa rát và ho khan. Kẹo Orion chất lượng, ngọt thanh được nhiều người lựa chọn và tin dùng.'
),
(   N'[1 THÙNG] Kẹo ngậm Họng vị bạc hà thảo mộc',1,
    N'Việt Nam', 1,
    N'Kẹo Họng Vị Bạc Hà Thảo Mộc Orion là một loại kẹo có hương vị thơm ngon ngọt thanh của bạc hà và thảo mộc hoà quyện trong viên kẹo hoà quyện trong viên kẹo. Là một loại kẹo họng phổ biến, được biết đến với hương vị tươi mát của bạc hà kết hợp với hương thảo mộc tự nhiên. Viên kẹo nhỏ gọn này chứa đựng sự cân bằng hoàn hảo giữa vị ngọt dịu và vị bạc hà mát lạnh, mang lại cảm giác sảng khoái tức thì cho cổ họng. Kẹo Họng Vị Bạc Hà Thảo Mộc không chỉ giúp làm dịu cổ họng khô rát, mà còn mang lại hương thơm dễ chịu cho hơi thở.'
),
--Keo deo(7)
(   N'[1 THÙNG] Kẹo dẻo BOOM hương chanh dây',1,
    N'Việt Nam', 1,
    N'Kẹo Boom Jelly Thạch chanh dây là sản phẩm tiên phong trong dòng kẹo dẻo có nhân. Kẹo được tăng cường 50% nước trái cây thật, kết hợp chanh dây cùng hạt chia vô cùng hấp dẫn. Bên cạnh đó, cấu trúc 2 lớp kẹo lột độc đáo cũng sẽ mang lại trải nghiệm đầy mới mẻ cho các bé.'
),
(   N'[1 THÙNG] Kẹo dẻo BOOM vị xoài lắc muối ớt',1,
    N'Việt Nam', 1,
    N'Đam mê xoài lắc nhưng lại là tín đồ của kẹo dẻo? Boom Jelly Xoài Lắk muối ớt chắc chắn là dành cho bạn. Kẹo dẻo Boom Jelly Lắk được làm từ 30% nước trái cây thật với vị chua chua ngọt ngọt đúng kiểu xoài non. Shape kẹo hình xoài đáng yêu cùng với cách ăn mới mẻ khi kết hợp lắc cùng gói muối ớt sẽ khiến ai ai cũng thích mê. '
),
(   N'[1 THÙNG] Kẹo dẻo BOOM hương Đào',1,
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'[1 THÙNG] Kẹo dẻo BOOM hương Nho',1,
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'[1 THÙNG] Kẹo dẻo BOOM hương Dâu',1,
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'[1 THÙNG] Kẹo dẻo BOOM vị me lắc xí muội Thái Lan',1,
    N'Việt Nam', 1,
    N'Kẹo Dẻo Boom Jelly Lắk Orion Vị Me Lắc Xí Muội có nguồn gốc từ những quả me Thái chất lượng cao được chọn lọc kỹ càng. Điều này đã mang đến vị chua chua ngọt ngọt cho từng viên kẹo dẻo hình quả me xinh xắn. Khi thưởng thức sản phẩm, bạn sẽ dễ dàng cảm nhận được sự thanh mát ấn tượng mà sản phẩm mang đến như làn gió sảng khoái trong mùa hè nóng nực. Kết cấu dai mềm khi nhai cùng vị trái cây hấp dẫn đã được cân bằng hoàn hảo, tạo nên trải nghiệm vị giác vui nhộn cho người thưởng thức. Những quả me đến từ xứ sở Chùa Vàng với vị ngọt thanh kèm theo chút chua nhẹ là món ăn vặt ưa thích của rất nhiều bạn trẻ.  '
),
(   N'[1 THÙNG] Kẹo dẻo BOOM Mix vị hỗn hợp',1,
    N'Việt Nam', 1,
    N'Kẹo dẻo boom Jelly mix vị hỗn hợp Orion phù hợp với khẩu vị của trẻ em bởi hương thơm lừng của nho, táo, đào cộng lại đi kèm với độ ngọt ngọt, dai dai. Thành phần an toàn, chất lượng nên các mẹ yên tâm cho bé thưởng thức.'
),
--Banh gao(6)
(   N'[1 THÙNG] Bánh gạo nướng An chà bông',1,
    N'Việt Nam', 7,
    N'Một lựa chọn bữa phụ mới mẻ đầy chất lượng dành cho các mẹ đã chính thức được Orion trình làng. Chiếc bánh gạo An giòn rụm nay được cải tiến to và dày hơn, không những thế còn được bổ sung ruốc thịt thật đậm đà đầy dinh dưỡng khiến cả gia đình thích mê.'
),
(   N'[1 THÙNG] Bánh Gạo Nướng An Vừng',1,
    N'Việt Nam', 7,
    N'Lấy cảm hứng từ LÀNG NGHỀ BÁNH ĐA truyền thống, Bánh gạo An Vừng truyền tải nét đẹp ẩm thực và văn hóa quê hương Việt Nam thông qua hai loại nông sản thân thuộc bậc nhất với làng quê người Việt: gạo & vừng. Chiếc bánh có hương thơm lừng của vừng rang, khi ăn sẽ cảm nhận được vị béo bùi của Vừng, ngọt thanh của gạo và đặc biệt là sự GIÒN TAN trên từng chiếc bánh cực kỳ hấp dẫn khiến bạn liên tưởng đến chiếc BÁNH ĐA tuổi thơ.'
),
(   N'[1 THÙNG] Bánh Gạo Nướng An Vị Khoai Tây Phô Mai',1,
    N'Việt Nam', 7,
    N'Bánh gạo An Khoai Tây Phô Mai Nướng là sự kết hợp của khoai tây thơm ngon giàu năng lượng cùng phô mai Cheddar nướng thượng hạng, đem đến cho cả gia đình những bữa nhẹ dinh dưỡng thơm ngon. Hương vị lôi cuốn từ những miếng cắn giòn tan đầu tiên, vị béo hòa cùng hương thơm của khoai tây phô mai nướng quyện trên đầu lưỡi, mang đến cảm giác thích thú và ngon miệng khi thưởng thức.'
),
(   N'[1 THÙNG] Bánh Gạo Nướng An Vị Tảo Biển',1,
    N'Việt Nam',7,
    N'Bánh Gạo Nướng An Vị Tảo Biển - Thanh Mặn Dịu Nhẹ Lấp Đầy Chiếc Bụng Đói. Từng lát tảo biển thơm ngon hòa quyện cùng gạo giống Nhật Japonica, qua công nghệ nướng đa chiều hiện đại tạo thành những miếng bánh giòn tan lôi cuốn. Mằn mặn ngọt nhẹ thanh thanh ngon nức nở.'
),
(   N'[1 THÙNG] Bánh Gạo Nướng An Vị Tự Nhiên',1,
    N'Việt Nam', 7,
    N'Bánh gạo Nướng An Vị Tự Nhiên - Bánh gạo nướng từ 100% gạo giống Nhật Japonica. Chiếc bánh được làm dưới sự chăm chút từng công đoạn, người nông dân chọn lọc những hạt gạo mới nhất để đưa vào chế biến. Trải qua quy trình nghiêm ngặt, khép kín - ngâm gạo - vo gạo - nghiền gạo - chần nước sôi 2 lần - và bắt đầu tạo thành những hình dáng đáng yêu (tròn/dài). Sau đó bánh được đi qua dây chuyến nướng khép kín, tạo nên độ giòn tan, thơm lừng mùi gạo mới.'
),
(   N'[1 THÙNG] Bánh gạo nướng An Cốm sen',1,
    N'Việt Nam', 7,
    N'Bánh gạo nướng An nay có thêm hương vị mới với sự kết hợp có cốm Hà Thành thơm ngon và lá sen mang đến những chiếc bánh gạo chất lượng, thơm lừng và toát lên nét đẹp văn hoá độc đáo.'
),

------------------------------------------------ BRAND_ID : 2 :  - BÌNH ------------------------------------------------

-- Bánh mì ( 5 sp ) : 60 - 65
	-- Bánh mì tươi Otto : 60
(   N'[1 THÙNG] Bánh Mì Hoa Cúc Mini Otto',2,
    N'Việt Nam', 3,
    N'Bánh mì Hoa cúc Otto DẠNG GÓI TIỆN LỢI với HƯƠNG VỊ CHUẨN PHÁP TRỨ DANH được thiết kế vừa đủ cho một bữa ăn sáng thơm ngon và đầy đủ chất dinh dưỡng Protein, Canxi, Chất xơ từ bơ New Zealand thương hạng, lúa mì miền Bắc nước Mỹ và công nghệ hiện đại tái tạo bàn tay người thợ lành nghề làm nên bề mặt bánh thắt bím đẹp mắt, tạo thớ bánh sợi dai dai cho những người bận rộn trải nghiệm bữa sáng nhanh gọn nhưng vẫn dinh dưỡng.'
),

	-- Bánh Mì Khoai Tây Otto : 61
(   N'[1 THÙNG] Bánh Mì Khoai Tây Otto',2,
    N'Việt Nam', 3,
    N'Bánh mì khoai tây Otto là sụ pha trộn tinh tế giữa vị thơm ngon của khoai tây và độ mềm của bánh, tạo nên trải nghiệm ẩm thực độc đáo và hấp dẫn.Bánh mì khoai tây Otto dẫn đầu xu hướng dinh dưỡng hiện nay với hàm lượng protein, canxi, sắt, vitamin B6 và vitamin C…. là lựa chọn lý tưởng để có một bữa sáng ngon, lành mạnh và đầy đủ dưỡng chất cho cả gia đình.'
),

	-- Bánh Mì Lưới Ruốc Xốt Mayonnaise – Otto : 62
(   N'[1 THÙNG] Bánh Mì Lưới Ruốc Xốt Mayonnaise Otto',2,
    N'Việt Nam', 3,
    N'Sản phẩm Bánh mì tươi Otto là món ăn vặt hoàn hảo cho cả gia đình. Chiếc bánh được làm với các nguyên liệu cơ bản , của bơ, trứng, sữa cách điệu thêm mặt lưới khác biệt. Thành phần nhân mặn, ngòn ngọt thơm ngon của ruốc và mayonaise trải điều khắp mặt bánh, cho bạn tận hưởng trọn miếng bánh với miếng đầu tiên'
),

	--Bánh Mì Thịt Xốt – Otto : 63
(   N'[1 THÙNG] Bánh Mì Thịt Xốt Otto',2,
    N'Việt Nam', 3,
    N'Sản phẩm Bánh mì tươi Otto là món ăn vặt hoàn hảo cho cả gia đình.Từ sự chăm chút kỹ lưỡng, đầy tâm huyết trong từng khâu lựa chọn nguyên liệu và chế biến, bánh mì thịt Otto xốt Mayonnaise cay tươi ngon, béo thơm, làm bừng tỉnh mọi giác quan khi cắn vào từng thớ thịt thấm vị đậm đà.Bánh mì thịt Otto xốt Mayonnaise – Ngon khác biệt, vị đậm đàLoại Bánh Mì Thịt Xốt Mayonnaise – Otto.'
),

	--Sandwich Tươi Có Xốt – Otto : 64

(   N'[1 THÙNG] Sandwich Tươi Có Xốt Otto',2,
    N'Việt Nam', 3,
    N'Được chế biến từ giống lúa mì Hạt đỏ từ thảo nguyên miền Bắc nước Mỹ, với hàm lượng protein cao là bí quyết tạo nên lát bánh mềm mịn khác biệt & Sử dụng công nghệ trộn và ủ “3-zone” hiện đại nhất từ Đức, giúp bột thở và thư giãn tạo ra kết cấu bánh mềm tan khó cưỡng. Kết hợp hương vị đậm đà của cá hồi rong biển xốt mayonnaise caybéo thơm, làm bừng tỉnh mọi giác quan ngay từ lát cắn đầu tiên.'
),

	--Sandwich Tươi Lạt – Otto 65
(   N'[1 THÙNG] Sandwich Tươi Lạt Otto',2,
    N'Việt Nam', 3,
    N'Otto Sandwich tươi được chế biến từ giống lúa mì hạt đỏ thường được thu hoạch vào mùa xuân từ thảo nguyên miền Bắc nước Mỹ, nổi tiếng về lúa mì với độ ẩm cao là bí quyết tạo nên nguyên liệu bột mềm mịn khác biệt.'
),


-- Bánh phủ Sôcôla Choco PN ( 5 sản phẩm ) 66 - 70

	-- Bánh Phủ Sôcôla – Choco PN
(   N'[1 THÙNG] Bánh Phủ Sôcôla – Choco PN',2,
    N'Việt Nam', 6,
    N'Nhãn hiệu được lựa chọn số 1 với 3 lợi ích hấp dẫn: nguyên liệu 100% cacao nhập khẩu từ Indonesia cùng nhân marshmallow dẻo mịn. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động . Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon.'
),
	--Bánh Phủ Sôcôla Chip Kem Marshmallow – Choco PN
(   N'[1 THÙNG] Bánh Phủ Sôcôla Chip Kem Marshmallow – Choco PN',2,
    N'Việt Nam', 6,
    N'Nhãn hiệu được lựa chọn số 1 với 3 lợi ích hấp dẫn: 100% cacao nhập khẩu từ Indonesia, kết hợp socola chip và nhân marshmallow mát lạnh. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon.'
),
	--Bánh Phủ Sôcôla Kem Kaya Singapore – Choco PN
(   N'[1 THÙNG] Bánh Phủ Sôcôla Kem Kaya Singapore – Choco PN',2,
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Nhân kem Kaya là sự kết hợp giữa nước cốt dừa, trứng hòa quyện với hương lá dứa thơm lừng. Lớp bánh bông lan mềm ngon đặc trưng với hơn 16% từ trứng gà tươi, mang đến trải nghiệm mới lạ.Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động'
),
	--Bánh Phủ Sôcôla Vị Dưa Hấu – Choco PN
(   N'[1 THÙNG] Bánh Phủ Sôcôla Vị Dưa Hấu – Choco PN',2,
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động.Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon, thanh mát từ ngoài vào trong, lớp bánh bông lan thơm phức mùi dưa, nhân Marshmallow vị dưa ngọt mát tự nhiên.'
),

	--Bánh Sôcôla Kem Marshmallow Và Mứt Dâu – Choco PN
(   N'[1 THÙNG] Bánh Sôcôla Kem Marshmallow Và Mứt Dâu – Choco PN',2,
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động.Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon, lớp marshmallow vị dâu thơm ngon đặc biệt'
),


-- Kẹo Sôcôla Sữa Popit( 4 sản phẩm ) : 71 - 74
	--Kẹo Dẻo Thiên Thạch Mix Vị Popit
(   N'[1 THÙNG] Kẹo Dẻo Thiên Thạch Mix Vị Popit',2,
    N'Việt Nam', 1,
    N'Kẹo dẻo thiên thạch POPIT mang cấu trúc độc đáo, mới lạ là sự kết hợp hạt kẹo giòn tan cùng với nhân kẹo dẻo từ nước ép trái cây tạo cảm giác dai giòn thật thích thú khi ăn.Kẹo dẻo thiên thạch POPIT – Ngon nhất quả đất.'
),
	--Kẹo Dẻo Thiên Thạch Popit
(   N'[1 THÙNG] Kẹo Dẻo Thiên Thạch Popit',2,
    N'Việt Nam', 1,
    N'Kẹo dẻo thiên thạch POPIT mang cấu trúc độc đáo, mới lạ là sự kết hợp hạt kẹo giòn tan cùng với nhân kẹo dẻo từ nước ép trái cây tạo cảm giác dai giòn thật thích thú khi ăn.Kẹo dẻo thiên thạch POPIT – Ngon nhất quả đất.'
),
	--Kẹo Ống Sôcôla Popit Doreamon – Popit
(   N'[1 THÙNG] Kẹo Ống Sôcôla Popit Doreamon – Popit',2,
    N'Việt Nam', 1,
    N'Kẹo Sôcôla sữa Popit Doraemon được sản xuất trên dây chuyền công nghệ cao, mang đến những viên kẹo chất lượng nhất. Kẹo Sôcôla sữa Popit Doraemon có chứa các chất chống oxy hóa, probiotics, vitamins không những cung cấp nguồn năng lượng, giảm stress mà còn hỗ trợ cho sự phát triển của trẻ em.'
),
	--Kẹo Sôcôla Sữa Popit Doraemon
(   N'[1 THÙNG] Kẹo Sôcôla Sữa Popit Doraemon',2,
    N'Việt Nam', 1,
    N'Kẹo Sôcôla sữa Popit Doraemon được sản xuất trên dây chuyền công nghệ cao, mang đến những viên kẹo chất lượng nhất. Kẹo Sôcôla sữa Popit Doraemon có chứa các chất chống oxy hóa, probiotics, vitamins không những cung cấp nguồn năng lượng, giảm stress mà còn hỗ trợ cho sự phát triển của trẻ em. Với những viên kẹo nhiều màu sắc và đặc biệt là hình ảnh các nhân vật trong truyện tranh Doraemon đáng yêu trên bao bì, được cấp phép sử dụng bản quyền hình ảnh chính thức.'
),


-- Bánh giòn Limo ( 3 sản phẩm ) : 75 - 77
	-- Bánh Giòn Mè Đen – Limo
(   N'[1 THÙNG] Bánh Giòn Mè Đen – Limo',2,
    N'Việt Nam', 6,
    N'Chứa đến 7% mè, là sự kết hợp độc đáo giữa vị ngọt của bột bánh, mùi thơm của mè, và vị mặn nhẹ đặc trưng của sản phẩm. Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ.Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
),
	--Bánh Giòn Mè Dừa – Limo
(   N'[1 THÙNG] Bánh Giòn Mè Dừa – Limo',2,
    N'Việt Nam', 6,
    N'Chứa đến 7% mè, là sự kết hợp độc đáo giữa vị ngọt của bột bánh, mùi thơm của mè, và vị mặn nhẹ đặc trưng của sản phẩm.Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ.Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
),

	--Bánh Giòn Vị Cà Phê – Limo
(   N'[1 THÙNG] Bánh Giòn Vị Cà Phê – Limo',2,
    N'Việt Nam', 6,
    N'Là sự kết hợp độc đáo giữa vị ngọt của bột bánh, vị mặn nhẹ đặc trưng của sản phẩm và đậm đà hương vị cà phê truyền thống.Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ. Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
),

-- Bánh bông lan Solo (4 sản phẩm ) : 78 -81
	--Bánh Bông Lan Kem Bơ Sữa – Solo
(   N'[1 THÙNG] Bánh Bông Lan Kem Bơ Sữa – Solo',2,
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
),
	--Bánh Bông Lan Kem Dâu – Solo
(   N'[1 THÙNG] Bánh Bông Lan Kem Dâu – Solo',2,
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
),
	--Bánh Bông Lan Kem Dứa – Solo
(   N'[1 THÙNG] Bánh Bông Lan Kem Dứa – Solo',2,
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
),
	--Bánh Bông Lan Kem Lá Dứa – Solo
(   N'[1 THÙNG] Bánh Bông Lan Kem Lá Dứa – Solo',2,
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
),

------------------------------------------------ BRAND_ID : 3_Pepsico  - BÌNH ------------------------------------------------
---------------ĐỒ UỐNG CÓ GA-------------------
--Pepsi : 82 - 85
	--Nước ngọt Pepsi không calo vị chanh
(   N'[1 THÙNG] Nước ngọt Pepsi không calo vị chanh ',3,
    N'Việt Nam', 8,
    N'Sự kết hợp hài hòa của vị chanh thanh mát, giải nhiệt và mang lại cảm giác sảng khoái và tốt cho sức khỏe. Nước ngọt Pepsi không calo vị chanh cực kỳ thích hợp cho những người thích uống nước ngọt nhưng vẫn muốn giữ lối sống ăn thanh đạm, ít đường. Sản phẩm chất lượng từ nước ngọt Pepsi'
),

	--Nước ngọt Pepsi Cola Sleek
(   N'[1 THÙNG] Nước ngọt Pepsi Cola Sleek',3,
    N'Việt Nam', 8,
    N'Nước ngọt của thương hiệu Pepsi an toàn, chất lượng được nhà nhà lựa chọn tin dùng. Nước ngọt Pepsi Cola Sleek mang hương vị đặc trưng, thơm ngon hấp dẫn giúp bạn xua tan đi cơn khát ngay tức khắc. Nước ngọt Pepsi được chế biến theo công nghệ hiện đại, an toàn cho sức khỏe người dùng. '
),
	--Nước ngọt Pepsi không calo lon
(   N'[1 THÙNG] Nước ngọt Pepsi không calo',3,
    N'Việt Nam',8,
    N'Là loại nước ngọt được nhiều người yêu thích đến từ thương hiệu nước ngọt Pepsi nổi tiếng thế giới với hương vị thơm ngon, sảng khoái. Nước ngọt Pepsi không calo với lượng gas lớn sẽ giúp bạn xua tan mọi cảm giác mệt mỏi, căng thẳng, sản phẩm không calo lành mạnh, tốt cho sức khỏe'
),

	--Nước ngọt Pepsi Cola chai
(   N'[1 THÙNG] Nước ngọt Pepsi Cola',3,
    N'Việt Nam',  8,
    N'Từ thương hiệu nước ngọt Pepsi nổi tiếng toàn cầu với mùi vị thơm ngon với hỗn hợp hương tự nhiên cùng chất tạo ngọt tổng hợp, giúp xua tan cơn khát và cảm giác mệt mỏi.  Nước ngọt Pepsi Cola 390ml bổ sung năng lượng làm việc mỗi ngày. Cam kết nước ngọt chính hãng, chất lượng và an toàn'
),

--7up : 86 - 88
	--Nước ngọt soda chanh 7 Up
(   N'[1 THÙNG] Nước ngọt soda chanh 7 Up',3,
    N'Việt Nam', 8,
    N'Nước ngọt chính hãng thương hiệu nước ngọt 7Up uy tín được nhiều người ưa chuộng. Nước ngọt soda chanh 7 Up lon chứa nước ép chanh thật, không đường không calo, cung cấp vitamin C và mang đến cảm giác sảng khoái, tràn đầy sức sống'
),

	--Nước ngọt 7 Up vị chanh lon
(   N'[1 THÙNG] Nước ngọt 7 Up vị chanh lon',3,
    N'Việt Nam',  8,
    N'Từ thương hiệu nước ngọt uy tín được ưa chuộng.Nước ngọt 7 Up hương chanh lon 320ml chính hãng nước ngọt 7Up có vị ngọt vừa phải và hương vị gas the mát, giúp bạn xua tan nhanh chóng cơn khát, giảm cảm giác ngấy, kích thích vị giác giúp ăn ngon hơn, cung cấp năng lượng'
),

	--Nước ngọt 7 Up vị chanh chai
(   N'[1 THÙNG] Nước ngọt 7 Up vị chanh chai',3,
    N'Việt Nam', 8,
    N'Nước ngọt chính hãng nước ngọt 7Up uy tín được nhiều người ưa chuộng. Nước ngọt 7 Up hương chanh 1.5 lít có vị ngọt vừa phải và hương vị gas the mát, giúp bạn xua tan nhanh chóng cơn khát, giảm cảm giác ngấy, kích thích vị giác giúp ăn ngon hơn, cung cấp năng lượng cho tinh thần tươi vui mỗi ngày'
),

--Mirinda : 89 - 91
	--Nước ngọt Mirinda hương cam lon
(   N'[1 THÙNG] Nước ngọt Mirinda hương cam lon',3,
    N'Việt Nam', 8,
    N'Nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng. Nước ngọt Mirinda cam lon 320ml với hương vị cam đặc trưng, không chỉ giải khát, mà còn bổ sung thêm vitamin C giúp lấy lại năng lượng cho hoạt động hàng ngày. Cam kết chính hãng và an toàn'
),

	--Nước ngọt Mirinda vị soda kem
(   N'[1 THÙNG] Nước ngọt Mirinda vị soda kem',3,
    N'Việt Nam', 8,
    N'Sản phẩm nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng với hương vị độc đáo hấp dẫn. Nước ngọt Mirinda vị Soda kem lon 320ml có vị ngọt dịu, nước ngọt không chỉ giúp xua tan cơn khát tức thì mà còn giúp kích thích vị giác, cho bữa ăn thêm ngon miệng'
),
	--Nước ngọt Mirinda hương xá xị lon
(   N'[1 THÙNG] Nước ngọt Mirinda hương xá xị lon',3,
    N'Việt Nam', 8,
    N'Nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng với hương và vị hấp dẫn. Nước ngọt Mirinda hương xá xị lon 320ml có hương xá xị tự nhiên, độc đáo giúp bạn giải nhanh cơn khát,  với vị gas nhẹ là thức uống giải khát tuyệt vời dành cho mọi lứa tuổi.'
),
--Trung
--Bánh quy AFC
(N'[1 THÙNG] Bánh quy giòn AFC vị rau', 4, N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị Caramel Flan', 4,  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị cốm non', 4,   N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị lúa mì', 4,N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị tảo biển', 4,N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị bò bít tết', 4, N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'[1 THÙNG] Bánh quy giòn AFC vị chân gà xả tắc', 4,  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
--Bánh quy Cosy
(N'[1 THÙNG] Bánh quy Cosy Hạt bơ và điều', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'[1 THÙNG] Bánh quy Cosy Mè', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'[1 THÙNG] Bánh quy Cosy Marie', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'[1 THÙNG] Bánh quy Cosy nhân mứt hương táo', 4,  N'Việt Nam', 4, N'Bánh quy Cosy nhân mứt táo được chọn lọc từ những nguyên liệu chất lượng, tươi mới mang đến cho người tiêu dùng những chiếc bánh quy thơm ngon, độc đáo với nhân mứt táo mới lại cho bạn một ngày dài năng động.'),
(N'[1 THÙNG] Bánh quy hạt chocolate yến mạch Cosy Original', 4,  N'Việt Nam', 4, N'Bánh quy hạt socola yến mạch Cosy Original là sự kết hợp giữa hai nguyên liệu thơm ngon là yến mạch và socola. Bánh có hình dạng tròn, kích thước nhỏ nhắn, vừa ăn. Vỏ bánh màu nâu vàng, giòn rụm, thơm ngon, khi ăn mang đến vị ngọt ngào, đậm đà, hòa quyện với vị socola thơm béo và yến mạch bùi bùi.'),
(N'[1 THÙNG] Bánh quế Cosy Chocolate', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'[1 THÙNG] Bánh quế Cosy Dâu', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'[1 THÙNG] Bánh quế Cosy Xoài xí muội', 4,   N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
--Bánh Solite
(N'[1 THÙNG] Bánh Solite Kinh Đô - vị bơ sữa', 4,   N'Việt Nam', 5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'[1 THÙNG] Bánh Solite Kinh Đô - vị lá dứa', 4,   N'Việt Nam',  5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'[1 THÙNG] Bánh Solite Kinh Đô - vị dâu', 4,   N'Việt Nam',  5,  N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'[1 THÙNG] Bánh Solite Kinh Đô - vị socola', 4,   N'Việt Nam',  5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
--Snack khoai tây
(N'[1 THÙNG] Snack khoai tây Slide vị gà nướng', 4,   N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'[1 THÙNG] Snack khoai tây Slide vị phô mai', 4,   N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'[1 THÙNG] Snack khoai tây Slide vị kem hành', 4,   N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'[1 THÙNG] Snack khoai tây Slide vị thịt nướng', 4,   N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'[1 THÙNG] Snack khoai tây Slide vị thơm cay', 4,   N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'[1 THÙNG] Snack khoai tây Slide vị tự nhiên', 4,  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
--Bánh mì tươi
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Sừng bò', 4,  N'Việt Nam', 3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Bò sốt Bulgogi', 4,   N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Gà sốt chua cay', 4,   N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Pizza Xúc Xích', 4,   N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Chà Bông', 4,   N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Burger bò', 4,  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Burger gà', 4,  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Socola', 4, N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Bơ sữa', 4, N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Lá dứa', 4, N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'[1 THÙNG] Bánh mì tươi Kinh Đô - Bơ đậu phộng', 4, N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
--Bánh Oreo
(N'[1 THÙNG] Bánh quy Oreo - Việt Quất', 4, N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'[1 THÙNG] Bánh quy Oreo - Dâu', 4,  N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'[1 THÙNG] Bánh quy Oreo - Socola', 4,  N'Việt Nam',4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'[1 THÙNG] Bánh quy Oreo - Vanilla', 4, N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…')

INSERT INTO dbo.ProductVariants
( product_id, size_id, price, sku)
VALUES
(1,1,4140000, 'OR00001'),
(1,2,13440000, 'OR00002'),
(2,1,4416000, 'OR00003'),
(2,2,13920000, 'OR00004'),
(3,2,13920000, 'OR00005'),
(4,2,11040000, 'OR00006'),
(5,1,4020000, 'OR00007'),
(5,3,11520000, 'OR00008'),
(6,1,4260000, 'OR00009'),
(6,2,9248000, 'OR00010'),
(7,1,4560000, 'OR00011'),
(7,2,9152000, 'OR00012'),
(8,1,4200000, 'OR00013'),
(9,1,2700000, 'OR00014'),
(10,1,2700000, 'OR00015'),
(11,1,27000000, 'OR00016'),
(12,2,13488000, 'OR00017'),
(13,1,3564000, 'OR00018'),
(14,4,2592000, 'OR00019'),
(15,5,2560000, 'OR00020'),
(15,6,42800000, 'OR00021'),
(16,5,2560000, 'OR00022'),
(16,6,4280000, 'OR00023'),
(17,3,2768000, 'OR00024'),
(18,3,2768000, 'OR00025'),
(19,3,2768000, 'OR00026'),
(20,3,1152000, 'OR00027'),
(21,2,12648000, 'OR00028'),
(22,6,10472000, 'OR00029'),
(23,3,1008000, 'OR00030'),
(24,3,640000, 'OR00031'),
(25,3,640000, 'OR00032'),
(26,3,640000, 'OR00033'),
(27,3,640000, 'OR00034'),
(28,3,480000, 'OR00035'),
(29,3,480000, 'OR00036'),
(30,3,880000, 'OR00037'),
(31,7,220000, 'OR00038'),
(32,7,220000, 'OR00039'),
(33,7,260000, 'OR00040'),
(34,7,260000, 'OR00041'),
(35,7,260000, 'OR00042'),
(36,3,480000, 'OR00043'),
(37,3,480000, 'OR00044'),
(38,3,480000, 'OR00045'),
(39,3,480000, 'OR00046'),
(40,3,480000, 'OR00047'),
(41,3,480000, 'OR00048'),
(42,3,480000, 'OR00049'),
(43,3,480000, 'OR00050'),
(44,8,950000, 'OR00051'),
(45,8,950000, 'OR00052'),
(46,8,950000, 'OR00053'),
(47,8,620000, 'OR00054'),
(48,8,620000, 'OR00055'),
(49,8,620000, 'OR00056'),
(50,8,620000, 'OR00057'),
(51,8,620000, 'OR00058'),
(52,8,620000, 'OR00059'),

(60, 10, 3500000, 'PN00001'),
(61, 10, 2500000, 'PN00002'),
(62, 10, 1900000, 'PN00003'),
(63, 10, 3000000, 'PN00004'),
(64, 10, 2200000, 'PN00005'),
(65, 10, 2800000, 'PN00006'),
(66, 1, 6240000, 'PN00007'),
(66, 2, 14160000, 'PN00008'),
(67, 1, 6000000, 'PN00009'),
(67, 2, 14400000, 'PN00010'),
(68, 1, 6120000, 'PN00011'),
(68, 2, 12240000, 'PN00012'),
(69, 1, 6000000, 'PN00013'),
(70, 8, 13000000, 'PN00014'),
(71, 8, 5000000, 'PN00015'),
(72, 8, 3400000, 'PN00016'),
(73, 8, 3600000, 'PN00017'),
(74, 8, 3200000, 'PN00018'),
(75, 1, 6000000, 'PN00019'),
(75, 2, 12000000, 'PN00020'),
(76, 1, 6600000, 'PN00021'),
(76, 2, 13200000, 'PN00022'),
(77, 1, 6600000, 'PN00023'),
(77, 2, 13200000, 'PN00024'),
(78, 1, 6600000, 'PN00025'),
(78, 2, 13200000, 'PN00026'),
(79, 1, 6600000, 'PN00027'),
(79, 2, 15600000, 'PN00028'),
(80, 1, 7200000, 'PN00029'),
(80, 2, 14400000, 'PN00030'),
(81, 1, 50000,'PN00031'),
(81, 2, 50000,'PN00032'),

(82, 1, 34500, 'PS00001'),
(82, 2, 56000, 'PS00002'),
(83, 1, 36800, 'PS00003'),
(83, 2, 58000, 'PS00004'),
(84, 2, 58000, 'PS00005'),
(85, 1, 46000, 'PS00006'),
(86, 1, 33500, 'PS00007'),
(87, 1, 34500, 'PS00008'),
(88, 2, 58000, 'PS00009'),
(89, 1, 36800, 'PS00010'),
(90, 2, 58000, 'PS00011'),
(91, 1, 46000, 'PS00012'),

--Trung
(92, 1, 368000, 'KD00001'),
(93, 1, 368000, 'KD00002'),
(94, 1, 368000, 'KD00003'),
(95, 1, 368000, 'KD00004'),
(96, 1, 368000, 'KD00005'),
(97, 1, 368000, 'KD00006'),
(98, 1, 368000, 'KD00007'),
(99, 1, 416000, 'KD00008'),
(100, 1, 416000, 'KD00009'),
(101, 1, 416000, 'KD00010'),
(102, 2, 560000, 'KD00011'),
(103, 1, 416000, 'KD00012'),
(104, 1, 416000, 'KD00013'),
(105, 1, 416000, 'KD00014'),
(106, 1, 416000, 'KD00015'),
(107, 1, 459600, 'KD00016'),
(108, 1, 459600, 'KD00017'),
(109, 1, 459600, 'KD00018'),
(110, 1, 459600, 'KD00019'),
(111, 1, 371000, 'KD00020'),
(112, 1, 371000, 'KD00021'),
(113, 1, 371000, 'KD00022'),
(114, 1, 371000, 'KD00023'),
(115, 1, 371000, 'KD00024'),
(116, 1, 371000, 'KD00025'),
(117, 1, 435000, 'KD00026'),
(118, 1, 435000, 'KD00027'),
(119, 1, 435000, 'KD00028'),
(120, 1, 435000, 'KD00029'),
(121, 1, 435000, 'KD00030'),
(122, 1, 435000, 'KD00031'),
(123, 1, 435000, 'KD00032'),
(124, 1, 435000, 'KD00033'),
(125, 1, 435000, 'KD00034'),
(126, 1, 435000, 'KD00035'),
(127, 1, 435000, 'KD00036'),
(128, 1, 319200, 'KD00037'),
(129, 1, 319200, 'KD00038'),
(130, 1, 319200, 'KD00039'),
(131, 1, 319200, 'KD00040');

INSERT INTO dbo.Images
(product_id,image_url)
VALUES
-- Tuấn
(1, N'assets/images/img_products/1_1.png'),
(1, N'assets/images/img_products/1_2.png'),
(1, N'assets/images/img_products/1_3.png'),
(2, N'assets/images/img_products/2_1.png'),
(2, N'assets/images/img_products/2_2.png'),
(2, N'assets/images/img_products/2_3.png'),
(3, N'assets/images/img_products/3_1.png'),
(3, N'assets/images/img_products/3_2.png'),
(4, N'assets/images/img_products/4_1.png'),
(5, N'assets/images/img_products/5_1.png'),
(5, N'assets/images/img_products/5_2.png'),
(6, N'assets/images/img_products/6_1.png'),
(6, N'assets/images/img_products/6_2.png'),
(7, N'assets/images/img_products/7_1.png'),
(7, N'assets/images/img_products/7_2.png'),
(8, N'assets/images/img_products/8_1.png'),
(8, N'assets/images/img_products/8_2.png'),
(9, N'assets/images/img_products/9_1.png'),
(9, N'assets/images/img_products/9_2.png'),
(10, N'assets/images/img_products/10_1.png'),
(11, N'assets/images/img_products/11_1.png'),
(12, N'assets/images/img_products/12_1.png'),
(12, N'assets/images/img_products/12_2.png'),
(12, N'assets/images/img_products/12_3.png'),
(13, N'assets/images/img_products/13_1.png'),
(14, N'assets/images/img_products/14_1.png'),
(14, N'assets/images/img_products/14_2.png'),
(14, N'assets/images/img_products/14_3.png'),
(15, N'assets/images/img_products/15_1.png'),
(15, N'assets/images/img_products/15_2.png'),
(15, N'assets/images/img_products/15_3.png'),
(15, N'assets/images/img_products/15_4.png'),
(16, N'assets/images/img_products/16_1.png'),
(16, N'assets/images/img_products/16_2.png'),
(16, N'../assets/images/img_products/16_3.png'),
(17, N'assets/images/img_products/17_1.png'),
(17, N'assets/images/img_products/17_2.png'),
(18, N'assets/images/img_products/18_1.png'),
(18, N'assets/images/img_products/18_2.png'),
(19, N'assets/images/img_products/19_1.png'),
(19, N'assets/images/img_products/19_2.png'),
(20, N'assets/images/img_products/20_1.png'),
(20, N'assets/images/img_products/20_2.png'),
(21, N'assets/images/img_products/21_1.png'),
(21, N'assets/images/img_products/21_2.png'),
(22, N'assets/images/img_products/22_1.png'),
(23, N'assets/images/img_products/23_1.png'),
(23, N'assets/images/img_products/23_2.png'),
(23, N'assets/images/img_products/23_3.png'),
(24, N'assets/images/img_products/24_1.png'),
(25, N'assets/images/img_products/25_1.png'),
(26, N'assets/images/img_products/26_1.png'),
(27, N'assets/images/img_products/27_1.png'),
(28, N'assets/images/img_products/28_1.png'),
(29, N'assets/images/img_products/29_1.png'),
(30, N'assets/images/img_products/30_1.png'),
(31, N'assets/images/img_products/31_1.png'),
(32, N'assets/images/img_products/32_1.png'),
(33, N'assets/images/img_products/33_1.png'),
(33, N'assets/images/img_products/33_2.png'),
(34, N'assets/images/img_products/34_1.png'),
(34, N'assets/images/img_products/34_2.png'),
(34, N'assets/images/img_products/34_3.png'),
(35, N'assets/images/img_products/35_1.png'),
(35, N'assets/images/img_products/35_2.png'),
(35, N'assets/images/img_products/35_3.png'),
(36, N'assets/images/img_products/36_1.png'),
(37, N'assets/images/img_products/37_1.png'),
(38, N'assets/images/img_products/38_1.png'),
(39, N'assets/images/img_products/39_1.png'),
(40, N'assets/images/img_products/40_1.png'),
(41, N'assets/images/img_products/41_1.png'),
(42, N'assets/images/img_products/42_1.png'),
(43, N'assets/images/img_products/43_1.png'),
(44, N'assets/images/img_products/44_1.png'),
(45, N'assets/images/img_products/45_1.png'),
(46, N'assets/images/img_products/46_1.png'),
(46, N'assets/images/img_products/46_2.png'),
(47, N'assets/images/img_products/47_1.png'),
(48, N'assets/images/img_products/48_1.png'),
(49, N'assets/images/img_products/49_1.png'),
(50, N'assets/images/img_products/50_1.png'),
(51, N'assets/images/img_products/51_1.png'),
(52, N'assets/images/img_products/52_1.png'),
(53, N'assets/images/img_products/53_1.png'),
(54, N'assets/images/img_products/54_1.png'),
(55, N'assets/images/img_products/55_1.png'),
(56, N'assets/images/img_products/56_1.png'),
(56, N'assets/images/img_products/56_2.png'),
(57, N'assets/images/img_products/57_1.png'),
(58, N'assets/images/img_products/58_1.png'),
(58, N'assets/images/img_products/58_2.png'),
(58, N'assets/images/img_products/58_3.png'),
(59, N'assets/images/img_products/59_1.png'),

-- Bình
(60, N'assets/images/img_products/60_1.jpg'),
(60, N'assets/images/img_products/60_2.jpg'),
(60, N'assets/images/img_products/60_3.jpg'),
(60, N'assets/images/img_products/60_4.jpg'),
(60, N'assets/images/img_products/60_5.jpg'),
(61, N'assets/images/img_products/61_1.jpg'),
(61, N'assets/images/img_products/61_2.jpg'),
(61, N'assets/images/img_products/61_3.jpg'),
(62, N'assets/images/img_products/62_3.jpg'),
(63, N'assets/images/img_products/63_1.jpg'),
(63, N'assets/images/img_products/63_2.jpg'),
(63, N'assets/images/img_products/63_3.jpg'),
(64, N'assets/images/img_products/64_1.jpg'),
(64, N'assets/images/img_products/64_2.jpg'),
(64, N'assets/images/img_products/64_3.jpg'),
(65, N'assets/images/img_products/65_1.jpg'),
(65, N'assets/images/img_products/65_2.jpg'),
(65, N'assets/images/img_products/65_3.jpg'),
(66, N'assets/images/img_products/66_1.jpg'),
(66, N'assets/images/img_products/66_2.jpg'),
(66, N'assets/images/img_products/66_3.jpg'),
(67, N'assets/images/img_products/67_1.jpg'),
(67, N'assets/images/img_products/67_2.jpg'),
(67, N'assets/images/img_products/67_3.jpg'),
(67, N'assets/images/img_products/67_4.jpg'),
(67, N'assets/images/img_products/67_5.jpg'),
(68, N'assets/images/img_products/68_1.jpg'),
(68, N'assets/images/img_products/68_2.jpg'),
(68, N'assets/images/img_products/68_3.jpg'),
(68, N'assets/images/img_products/68_4.jpg'),
(68, N'assets/images/img_products/68_5.jpg'),
(69, N'assets/images/img_products/69_1.jpg'),
(69, N'assets/images/img_products/69_2.jpg'),
(69, N'assets/images/img_products/69_3.jpg'),
(70, N'assets/images/img_products/70_1.jpg'),
(70, N'assets/images/img_products/70_2.jpg'),
(71, N'assets/images/img_products/71_1.jpg'),
(71, N'assets/images/img_products/71_2.jpg'),
(71, N'assets/images/img_products/71_3.jpg'),
(72, N'assets/images/img_products/72_1.jpg'),
(72, N'assets/images/img_products/72_2.jpg'),
(72, N'assets/images/img_products/72_3.jpg'),
(73, N'assets/images/img_products/73_1.jpg'),
(73, N'assets/images/img_products/73_2.jpg'),
(73, N'assets/images/img_products/73_3.jpg'),
(74, N'assets/images/img_products/74_1.jpg'),
(74, N'assets/images/img_products/74_2.jpg'),
(74, N'assets/images/img_products/74_3.jpg'),
(74, N'assets/images/img_products/74_4.jpg'),
(75, N'assets/images/img_products/75_1.jpg'),
(75, N'assets/images/img_products/75_2.jpg'),
(75, N'assets/images/img_products/75_3.jpg'),
(75, N'assets/images/img_products/75_4.jpg'),
(76, N'assets/images/img_products/76_1.jpg'),
(76, N'assets/images/img_products/76_2.jpg'),
(76, N'assets/images/img_products/76_3.jpg'),
(77, N'assets/images/img_products/77_1.jpg'),
(77, N'assets/images/img_products/77_2.jpg'),
(77, N'assets/images/img_products/77_3.jpg'),
(77, N'assets/images/img_products/77_4.jpg'),
(78, N'assets/images/img_products/78_1.jpg'),
(78, N'assets/images/img_products/78_2.jpg'),
(78, N'assets/images/img_products/78_3.jpg'),
(78, N'assets/images/img_products/78_4.jpg'),
(79, N'assets/images/img_products/79_1.jpg'),
(79, N'assets/images/img_products/79_2.jpg'),
(79, N'assets/images/img_products/79_3.jpg'),
(79, N'assets/images/img_products/79_4.jpg'),
(80, N'assets/images/img_products/80_1.jpg'),
(80, N'assets/images/img_products/80_2.jpg'),
(80, N'assets/images/img_products/80_3.jpg'),
(80, N'assets/images/img_products/80_4.jpg'),
(81, N'assets/images/img_products/81_1.jpg'),
(81, N'assets/images/img_products/81_2.jpg'),
(81, N'assets/images/img_products/81_3.jpg'),
(81, N'assets/images/img_products/81_4.jpg'),
(82, N'assets/images/img_products/82_1.jpg'),
(82, N'assets/images/img_products/82_2.jpg'),
(82, N'assets/images/img_products/82_3.jpg'),
(83, N'assets/images/img_products/83_1.jpg'),
(83, N'assets/images/img_products/83_2.jpg'),
(83, N'assets/images/img_products/83_3.jpg'),
(84, N'assets/images/img_products/84_1.jpg'),
(84, N'assets/images/img_products/84_2.jpg'),
(84, N'assets/images/img_products/84_3.jpg'),
(85, N'assets/images/img_products/85_1.jpg'),
(85, N'assets/images/img_products/85_2.jpg'),
(85, N'assets/images/img_products/85_3.jpg'),
(86, N'assets/images/img_products/86_1.jpg'),
(86, N'assets/images/img_products/86_2.jpg'),
(86, N'assets/images/img_products/86_3.jpg'),
(87, N'assets/images/img_products/87_1.jpg'),
(87, N'assets/images/img_products/87_2.jpg'),
(87, N'assets/images/img_products/87_3.jpg'),
(87, N'assets/images/img_products/87_4.jpg'),
(88, N'assets/images/img_products/88_1.jpg'),
(89, N'assets/images/img_products/89_1.jpg'),
(89, N'assets/images/img_products/89_2.jpg'),
(89, N'assets/images/img_products/89_3.jpg'),
(90, N'assets/images/img_products/90_1.jpg'),
(90, N'assets/images/img_products/90_2.jpg'),
(90, N'assets/images/img_products/90_3.jpg'),
(90, N'assets/images/img_products/90_4.jpg'),
(91, N'assets/images/img_products/91_1.jpg'),
(91, N'assets/images/img_products/91_2.jpg'),
(91, N'assets/images/img_products/91_3.jpg'),


--Trung
(92, N'assets/images/img_products/92_1.png'),
(93, N'assets/images/img_products/93_1.png'),
(94, N'assets/images/img_products/94_1.png'),
(95, N'assets/images/img_products/95_1.png'),
(96, N'assets/images/img_products/96_1.png'),
(97, N'assets/images/img_products/97_1.png'),
(98, N'assets/images/img_products/98_1.png'),
(99, N'assets/images/img_products/99_1.png'),
(100, N'assets/images/img_products/100_1.png'),
(101, N'assets/images/img_products/101_1.png'),
(102, N'assets/images/img_products/102_1.png'),
(103, N'assets/images/img_products/103_1.png'),
(104, N'assets/images/img_products/104_1.png'),
(105, N'assets/images/img_products/105_1.png'),
(106, N'assets/images/img_products/106_1.png'),
(107, N'assets/images/img_products/107_1.png'),
(108, N'assets/images/img_products/108_1.png'),
(109, N'assets/images/img_products/109_1.png'),
(110, N'assets/images/img_products/110_1.png'),
(111, N'assets/images/img_products/111_1.png'),
(112, N'assets/images/img_products/112_1.png'),
(113, N'assets/images/img_products/113_1.png'),
(114, N'assets/images/img_products/114_1.png'),
(115, N'assets/images/img_products/115_1.png'),
(116, N'assets/images/img_products/116_1.png'),
(117, N'assets/images/img_products/117_1.png'),
(118, N'assets/images/img_products/118_1.png'),
(119, N'assets/images/img_products/119_1.png'),
(120, N'assets/images/img_products/120_1.png'),
(121, N'assets/images/img_products/121_1.png'),
(122, N'assets/images/img_products/122_1.png'),
(123, N'assets/images/img_products/123_1.png'),
(124, N'assets/images/img_products/124_1.png'),
(125, N'assets/images/img_products/125_1.png'),
(126, N'assets/images/img_products/126_1.png'),
(127, N'assets/images/img_products/127_1.png'),
(128, N'assets/images/img_products/128_1.png'),
(129, N'assets/images/img_products/129_1.png'),
(130, N'assets/images/img_products/130_1.png'),
(131, N'assets/images/img_products/131_1.png');

INSERT INTO Warehouses (warehouse_name, phone, address, status)
VALUES (N'Kho Hà Nội', N'0987654321', N'Hà Nội', N'Active');

INSERT INTO InventoryBatches (variant_id, quantity, unit_price, expiration_date, received_date, warehouse_id, status)
SELECT
    variant_id,
    FLOOR(RAND() * 91) + 10 AS quantity,
    FLOOR(price * (0.5 + (RAND() * 0.3))) AS unit_price, -- Lấy giá từ 50% đến 80% của price
    DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 180), GETDATE()) AS expiration_date,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 30), GETDATE()) AS received_date,
    1 AS warehouse_id,
    'In Stock' AS status
FROM ProductVariants
WHERE variant_id between 1 and 143;


SELECT
    pv.variant_id,
    p.product_name,
    s.size_name,
    ib.batch_id,
    ib.quantity AS stock,
    ib.status,
    ib.expiration_date,
    w.warehouse_name
FROM ProductVariants pv
JOIN Products p ON pv.product_id = p.product_id
JOIN Sizes s ON pv.size_id = s.size_id
JOIN InventoryBatches ib ON pv.variant_id = ib.variant_id
JOIN Warehouses w ON ib.warehouse_id = w.warehouse_id
WHERE ib.status = 'In Stock';


CREATE TABLE ProductQuantityDiscounts (
    product_discount_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    min_quantity INT NOT NULL CHECK (min_quantity > 0), -- Đảm bảo số lượng tối thiểu > 0
    discount_percentage DECIMAL(5,2) NOT NULL CHECK (discount_percentage > 0), -- Đảm bảo phần trăm giảm giá > 0
    created_at DATETIME DEFAULT GETDATE(),
    status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive')), -- Chỉ cho phép Active/Inctive
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    CONSTRAINT UQ_Product_MinQuantity UNIQUE (product_id, min_quantity) -- Tránh trùng min_quantity trên cùng một sản phẩm
);

CREATE TABLE ProductQuantityDiscountHistory (
    product_discount_history_id INT IDENTITY(1,1) PRIMARY KEY, -- Mã lịch sử thay đổi
    product_discount_id INT NOT NULL, -- Mã giảm giá sản phẩm
    old_min_quantity INT, -- Số lượng tối thiểu trước khi thay đổi
    new_min_quantity INT, -- Số lượng tối thiểu sau khi thay đổi
    old_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá trước khi thay đổi
    new_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá sau khi thay đổi
    old_status NVARCHAR(10), -- Trạng thái cũ
    new_status NVARCHAR(10), -- Trạng thái mới
    change_date DATETIME DEFAULT GETDATE(), -- Thời điểm thay đổi
    changed_by INT NULL, -- ID người thay đổi (nếu cần theo dõi ai thực hiện)
    FOREIGN KEY (product_discount_id) REFERENCES ProductQuantityDiscounts(product_discount_id),
    FOREIGN KEY (changed_by) REFERENCES Users(user_id) -- Liên kết với Users để theo dõi ai thay đổi
);

CREATE TRIGGER trg_AfterInsertOrUpdateProductQuantityDiscount
ON ProductQuantityDiscounts
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật created_at khi có UPDATE
    UPDATE p
    SET created_at = GETDATE()
    FROM ProductQuantityDiscounts p
    INNER JOIN inserted i ON p.product_discount_id = i.product_discount_id
    INNER JOIN deleted d ON i.product_discount_id = d.product_discount_id;

    -- Chèn lịch sử thay đổi vào ProductQuantityDiscountHistory
    INSERT INTO ProductQuantityDiscountHistory (
        product_discount_id,
        old_min_quantity,
        new_min_quantity,
        old_discount_percentage,
        new_discount_percentage,
        old_status,
        new_status,
        change_date,
        changed_by
    )
    SELECT
        i.product_discount_id,
        CASE WHEN d.product_discount_id IS NULL THEN NULL ELSE d.min_quantity END,  -- NULL nếu là INSERT
        i.min_quantity,
        CASE WHEN d.product_discount_id IS NULL THEN NULL ELSE d.discount_percentage END,
        i.discount_percentage,
        CASE WHEN d.product_discount_id IS NULL THEN NULL ELSE d.status END,
        i.status,
        GETDATE(),
        1  -- changed_by mặc định (có thể thay bằng ID người dùng thực hiện)
    FROM inserted i
    LEFT JOIN deleted d ON i.product_discount_id = d.product_discount_id
    WHERE
        d.product_discount_id IS NULL  -- Nếu là INSERT, lưu lịch sử
        OR i.min_quantity <> d.min_quantity
        OR i.discount_percentage <> d.discount_percentage
        OR i.status <> d.status;
END;

INSERT INTO dbo.ProductQuantityDiscounts
(product_id, min_quantity,discount_percentage,created_at,status)
VALUES
(1,50,5,DEFAULT,DEFAULT),
(1,100,10,DEFAULT,DEFAULT),
(1,150,15,DEFAULT,DEFAULT),
(2,50,5,DEFAULT,DEFAULT),
(2,100,10,DEFAULT,DEFAULT),
(2,150,15,DEFAULT,DEFAULT),
(3,50,5,DEFAULT,DEFAULT),
(3,100,10,DEFAULT,DEFAULT),
(3,150,15,DEFAULT,DEFAULT),
(4,50,5,DEFAULT,DEFAULT),
(4,100,10,DEFAULT,DEFAULT),
(4,150,15,DEFAULT,DEFAULT),
(5,50,5,DEFAULT,DEFAULT),
(5,100,10,DEFAULT,DEFAULT),
(5,150,15,DEFAULT,DEFAULT),
(6,50,5,DEFAULT,DEFAULT),
(6,100,10,DEFAULT,DEFAULT),
(6,150,15,DEFAULT,DEFAULT),
(7,50,5,DEFAULT,DEFAULT),
(7,100,10,DEFAULT,DEFAULT),
(7,150,15,DEFAULT,DEFAULT),
(8,50,5,DEFAULT,DEFAULT),
(8,100,10,DEFAULT,DEFAULT),
(8,150,15,DEFAULT,DEFAULT),
(9,50,5,DEFAULT,DEFAULT),
(9,100,10,DEFAULT,DEFAULT),
(9,150,15,DEFAULT,DEFAULT),

(10,50,5,DEFAULT,DEFAULT),
(10,100,10,DEFAULT,DEFAULT),
(10,150,15,DEFAULT,DEFAULT),

(11,50,5,DEFAULT,DEFAULT),
(11,100,10,DEFAULT,DEFAULT),
(11,150,15,DEFAULT,DEFAULT),

(12,50,5,DEFAULT,DEFAULT),
(12,100,10,DEFAULT,DEFAULT),
(12,150,15,DEFAULT,DEFAULT),

(13,50,5,DEFAULT,DEFAULT),
(13,100,10,DEFAULT,DEFAULT),
(13,150,15,DEFAULT,DEFAULT),

(14,50,5,DEFAULT,DEFAULT),
(14,100,10,DEFAULT,DEFAULT),
(14,150,15,DEFAULT,DEFAULT),

(15,50,5,DEFAULT,DEFAULT),
(15,100,10,DEFAULT,DEFAULT),
(15,150,15,DEFAULT,DEFAULT),

(16,50,5,DEFAULT,DEFAULT),
(16,100,10,DEFAULT,DEFAULT),
(16,150,15,DEFAULT,DEFAULT),

(17, 50, 5, DEFAULT, DEFAULT),
(17, 100, 10, DEFAULT, DEFAULT),
(17, 150, 15, DEFAULT, DEFAULT),

(18, 50, 5, DEFAULT, DEFAULT),
(18, 100, 10, DEFAULT, DEFAULT),
(18, 150, 15, DEFAULT, DEFAULT),

(19, 50, 5, DEFAULT, DEFAULT),
(19, 100, 10, DEFAULT, DEFAULT),
(19, 150, 15, DEFAULT, DEFAULT),

(20, 50, 5, DEFAULT, DEFAULT),
(20, 100, 10, DEFAULT, DEFAULT),
(20, 150, 15, DEFAULT, DEFAULT),

(21, 50, 5, DEFAULT, DEFAULT),
(21, 100, 10, DEFAULT, DEFAULT),
(21, 150, 15, DEFAULT, DEFAULT),

(22, 50, 5, DEFAULT, DEFAULT),
(22, 100, 10, DEFAULT, DEFAULT),
(22, 150, 15, DEFAULT, DEFAULT),

(23, 50, 5, DEFAULT, DEFAULT),
(23, 100, 10, DEFAULT, DEFAULT),
(23, 150, 15, DEFAULT, DEFAULT),

(24, 50, 5, DEFAULT, DEFAULT),
(24, 100, 10, DEFAULT, DEFAULT),
(24, 150, 15, DEFAULT, DEFAULT),

(25, 50, 5, DEFAULT, DEFAULT),
(25, 100, 10, DEFAULT, DEFAULT),
(25, 150, 15, DEFAULT, DEFAULT),

(26, 50, 5, DEFAULT, DEFAULT),
(26, 100, 10, DEFAULT, DEFAULT),
(26, 150, 15, DEFAULT, DEFAULT),

(27, 50, 5, DEFAULT, DEFAULT),
(27, 100, 10, DEFAULT, DEFAULT),
(27, 150, 15, DEFAULT, DEFAULT),

(28, 50, 5, DEFAULT, DEFAULT),
(28, 100, 10, DEFAULT, DEFAULT),
(28, 150, 15, DEFAULT, DEFAULT),

(29, 50, 5, DEFAULT, DEFAULT),
(29, 100, 10, DEFAULT, DEFAULT),
(29, 150, 15, DEFAULT, DEFAULT),

(30, 50, 5, DEFAULT, DEFAULT),
(30, 100, 10, DEFAULT, DEFAULT),
(30, 150, 15, DEFAULT, DEFAULT),

(31, 50, 5, DEFAULT, DEFAULT),
(31, 100, 10, DEFAULT, DEFAULT),
(31, 150, 15, DEFAULT, DEFAULT),

(32, 50, 5, DEFAULT, DEFAULT),
(32, 100, 10, DEFAULT, DEFAULT),
(32, 150, 15, DEFAULT, DEFAULT),

(33, 50, 5, DEFAULT, DEFAULT),
(33, 100, 10, DEFAULT, DEFAULT),
(33, 150, 15, DEFAULT, DEFAULT),

(34, 50, 5, DEFAULT, DEFAULT),
(34, 100, 10, DEFAULT, DEFAULT),
(34, 150, 15, DEFAULT, DEFAULT),

(35, 50, 5, DEFAULT, DEFAULT),
(35, 100, 10, DEFAULT, DEFAULT),
(35, 150, 15, DEFAULT, DEFAULT),

(36, 50, 5, DEFAULT, DEFAULT),
(36, 100, 10, DEFAULT, DEFAULT),
(36, 150, 15, DEFAULT, DEFAULT),

(37, 50, 5, DEFAULT, DEFAULT),
(37, 100, 10, DEFAULT, DEFAULT),
(37, 150, 15, DEFAULT, DEFAULT),

(38, 50, 5, DEFAULT, DEFAULT),
(38, 100, 10, DEFAULT, DEFAULT),
(38, 150, 15, DEFAULT, DEFAULT),

(39, 50, 5, DEFAULT, DEFAULT),
(39, 100, 10, DEFAULT, DEFAULT),
(39, 150, 15, DEFAULT, DEFAULT),

(40, 50, 5, DEFAULT, DEFAULT),
(40, 100, 10, DEFAULT, DEFAULT),
(40, 150, 15, DEFAULT, DEFAULT),

(41, 50, 5, DEFAULT, DEFAULT),
(41, 100, 10, DEFAULT, DEFAULT),
(41, 150, 15, DEFAULT, DEFAULT),

(42, 50, 5, DEFAULT, DEFAULT),
(42, 100, 10, DEFAULT, DEFAULT),
(42, 150, 15, DEFAULT, DEFAULT),

(43, 50, 5, DEFAULT, DEFAULT),
(43, 100, 10, DEFAULT, DEFAULT),
(43, 150, 15, DEFAULT, DEFAULT),

(44, 50, 5, DEFAULT, DEFAULT),
(44, 100, 10, DEFAULT, DEFAULT),
(44, 150, 15, DEFAULT, DEFAULT),

(45, 50, 5, DEFAULT, DEFAULT),
(45, 100, 10, DEFAULT, DEFAULT),
(45, 150, 15, DEFAULT, DEFAULT),

(46, 50, 5, DEFAULT, DEFAULT),
(46, 100, 10, DEFAULT, DEFAULT),
(46, 150, 15, DEFAULT, DEFAULT),

(47, 50, 5, DEFAULT, DEFAULT),
(47, 100, 10, DEFAULT, DEFAULT),
(47, 150, 15, DEFAULT, DEFAULT),

(48, 50, 5, DEFAULT, DEFAULT),
(48, 100, 10, DEFAULT, DEFAULT),
(48, 150, 15, DEFAULT, DEFAULT),

(49, 50, 5, DEFAULT, DEFAULT),
(49, 100, 10, DEFAULT, DEFAULT),
(49, 150, 15, DEFAULT, DEFAULT),

(50, 50, 5, DEFAULT, DEFAULT),
(50, 100, 10, DEFAULT, DEFAULT),
(50, 150, 15, DEFAULT, DEFAULT),

(51, 50, 5, DEFAULT, DEFAULT),
(51, 100, 10, DEFAULT, DEFAULT),
(51, 150, 15, DEFAULT, DEFAULT),

(52, 50, 5, DEFAULT, DEFAULT),
(52, 100, 10, DEFAULT, DEFAULT),
(52, 150, 15, DEFAULT, DEFAULT),

(53, 50, 5, DEFAULT, DEFAULT),
(53, 100, 10, DEFAULT, DEFAULT),
(53, 150, 15, DEFAULT, DEFAULT),

(54, 50, 5, DEFAULT, DEFAULT),
(54, 100, 10, DEFAULT, DEFAULT),
(54, 150, 15, DEFAULT, DEFAULT),

(55, 50, 5, DEFAULT, DEFAULT),
(55, 100, 10, DEFAULT, DEFAULT),
(55, 150, 15, DEFAULT, DEFAULT),

(56, 50, 5, DEFAULT, DEFAULT),
(56, 100, 10, DEFAULT, DEFAULT),
(56, 150, 15, DEFAULT, DEFAULT),

(57, 50, 5, DEFAULT, DEFAULT),
(57, 100, 10, DEFAULT, DEFAULT),
(57, 150, 15, DEFAULT, DEFAULT),

(58, 50, 5, DEFAULT, DEFAULT),
(58, 100, 10, DEFAULT, DEFAULT),
(58, 150, 15, DEFAULT, DEFAULT),

(59, 50, 5, DEFAULT, DEFAULT),
(59, 100, 10, DEFAULT, DEFAULT),
(59, 150, 15, DEFAULT, DEFAULT),

(60, 50, 5, DEFAULT, DEFAULT),
(60, 100, 10, DEFAULT, DEFAULT),
(60, 150, 15, DEFAULT, DEFAULT),

(61, 50, 5, DEFAULT, DEFAULT),
(61, 100, 10, DEFAULT, DEFAULT),
(61, 150, 15, DEFAULT, DEFAULT),

(62, 50, 5, DEFAULT, DEFAULT),
(62, 100, 10, DEFAULT, DEFAULT),
(62, 150, 15, DEFAULT, DEFAULT),

(63, 50, 5, DEFAULT, DEFAULT),
(63, 100, 10, DEFAULT, DEFAULT),
(63, 150, 15, DEFAULT, DEFAULT),

(64, 50, 5, DEFAULT, DEFAULT),
(64, 100, 10, DEFAULT, DEFAULT),
(64, 150, 15, DEFAULT, DEFAULT),

(65, 50, 5, DEFAULT, DEFAULT),
(65, 100, 10, DEFAULT, DEFAULT),
(65, 150, 15, DEFAULT, DEFAULT),

(66, 50, 5, DEFAULT, DEFAULT),
(66, 100, 10, DEFAULT, DEFAULT),
(66, 150, 15, DEFAULT, DEFAULT),

(67, 50, 5, DEFAULT, DEFAULT),
(67, 100, 10, DEFAULT, DEFAULT),
(67, 150, 15, DEFAULT, DEFAULT),

(68, 50, 5, DEFAULT, DEFAULT),
(68, 100, 10, DEFAULT, DEFAULT),
(68, 150, 15, DEFAULT, DEFAULT),

(69, 50, 5, DEFAULT, DEFAULT),
(69, 100, 10, DEFAULT, DEFAULT),
(69, 150, 15, DEFAULT, DEFAULT),

(70, 50, 5, DEFAULT, DEFAULT),
(70, 100, 10, DEFAULT, DEFAULT),
(70, 150, 15, DEFAULT, DEFAULT),

(71, 50, 5, DEFAULT, DEFAULT),
(71, 100, 10, DEFAULT, DEFAULT),
(71, 150, 15, DEFAULT, DEFAULT),

(72, 50, 5, DEFAULT, DEFAULT),
(72, 100, 10, DEFAULT, DEFAULT),
(72, 150, 15, DEFAULT, DEFAULT),

(73, 50, 5, DEFAULT, DEFAULT),
(73, 100, 10, DEFAULT, DEFAULT),
(73, 150, 15, DEFAULT, DEFAULT),

(74, 50, 5, DEFAULT, DEFAULT),
(74, 100, 10, DEFAULT, DEFAULT),
(74, 150, 15, DEFAULT, DEFAULT),

(75, 50, 5, DEFAULT, DEFAULT),
(75, 100, 10, DEFAULT, DEFAULT),
(75, 150, 15, DEFAULT, DEFAULT),

(76, 50, 5, DEFAULT, DEFAULT),
(76, 100, 10, DEFAULT, DEFAULT),
(76, 150, 15, DEFAULT, DEFAULT),

(77, 50, 5, DEFAULT, DEFAULT),
(77, 100, 10, DEFAULT, DEFAULT),
(77, 150, 15, DEFAULT, DEFAULT),

(78, 50, 5, DEFAULT, DEFAULT),
(78, 100, 10, DEFAULT, DEFAULT),
(78, 150, 15, DEFAULT, DEFAULT),

(79, 50, 5, DEFAULT, DEFAULT),
(79, 100, 10, DEFAULT, DEFAULT),
(79, 150, 15, DEFAULT, DEFAULT),

(80, 50, 5, DEFAULT, DEFAULT),
(80, 100, 10, DEFAULT, DEFAULT),
(80, 150, 15, DEFAULT, DEFAULT),

(81, 50, 5, DEFAULT, DEFAULT),
(81, 100, 10, DEFAULT, DEFAULT),
(81, 150, 15, DEFAULT, DEFAULT),

(82, 50, 5, DEFAULT, DEFAULT),
(82, 100, 10, DEFAULT, DEFAULT),
(82, 150, 15, DEFAULT, DEFAULT),

(83, 50, 5, DEFAULT, DEFAULT),
(83, 100, 10, DEFAULT, DEFAULT),
(83, 150, 15, DEFAULT, DEFAULT),

(84, 50, 5, DEFAULT, DEFAULT),
(84, 100, 10, DEFAULT, DEFAULT),
(84, 150, 15, DEFAULT, DEFAULT),

(85, 50, 5, DEFAULT, DEFAULT),
(85, 100, 10, DEFAULT, DEFAULT),
(85, 150, 15, DEFAULT, DEFAULT),

(86, 50, 5, DEFAULT, DEFAULT),
(86, 100, 10, DEFAULT, DEFAULT),
(86, 150, 15, DEFAULT, DEFAULT),

(87, 50, 5, DEFAULT, DEFAULT),
(87, 100, 10, DEFAULT, DEFAULT),
(87, 150, 15, DEFAULT, DEFAULT),

(88, 50, 5, DEFAULT, DEFAULT),
(88, 100, 10, DEFAULT, DEFAULT),
(88, 150, 15, DEFAULT, DEFAULT),

(89, 50, 5, DEFAULT, DEFAULT),
(89, 100, 10, DEFAULT, DEFAULT),
(89, 150, 15, DEFAULT, DEFAULT),

(90, 50, 5, DEFAULT, DEFAULT),
(90, 100, 10, DEFAULT, DEFAULT),
(90, 150, 15, DEFAULT, DEFAULT),

(91, 50, 5, DEFAULT, DEFAULT),
(91, 100, 10, DEFAULT, DEFAULT),
(91, 150, 15, DEFAULT, DEFAULT),

(92, 50, 5, DEFAULT, DEFAULT),
(92, 100, 10, DEFAULT, DEFAULT),
(92, 150, 15, DEFAULT, DEFAULT),

(93, 50, 5, DEFAULT, DEFAULT),
(93, 100, 10, DEFAULT, DEFAULT),
(93, 150, 15, DEFAULT, DEFAULT),

(94, 50, 5, DEFAULT, DEFAULT),
(94, 100, 10, DEFAULT, DEFAULT),
(94, 150, 15, DEFAULT, DEFAULT),

(95, 50, 5, DEFAULT, DEFAULT),
(95, 100, 10, DEFAULT, DEFAULT),
(95, 150, 15, DEFAULT, DEFAULT),

(96, 50, 5, DEFAULT, DEFAULT),
(96, 100, 10, DEFAULT, DEFAULT),
(96, 150, 15, DEFAULT, DEFAULT),

(97, 50, 5, DEFAULT, DEFAULT),
(97, 100, 10, DEFAULT, DEFAULT),
(97, 150, 15, DEFAULT, DEFAULT),

(98, 50, 5, DEFAULT, DEFAULT),
(98, 100, 10, DEFAULT, DEFAULT),
(98, 150, 15, DEFAULT, DEFAULT),

(99, 50, 5, DEFAULT, DEFAULT),
(99, 100, 10, DEFAULT, DEFAULT),
(99, 150, 15, DEFAULT, DEFAULT),

(100, 50, 5, DEFAULT, DEFAULT),
(100, 100, 10, DEFAULT, DEFAULT),
(100, 150, 15, DEFAULT, DEFAULT),

(101, 50, 5, DEFAULT, DEFAULT),
(101, 100, 10, DEFAULT, DEFAULT),
(101, 150, 15, DEFAULT, DEFAULT),

(102, 50, 5, DEFAULT, DEFAULT),
(102, 100, 10, DEFAULT, DEFAULT),
(102, 150, 15, DEFAULT, DEFAULT),

(103, 50, 5, DEFAULT, DEFAULT),
(103, 100, 10, DEFAULT, DEFAULT),
(103, 150, 15, DEFAULT, DEFAULT),

(104, 50, 5, DEFAULT, DEFAULT),
(104, 100, 10, DEFAULT, DEFAULT),
(104, 150, 15, DEFAULT, DEFAULT),

(105, 50, 5, DEFAULT, DEFAULT),
(105, 100, 10, DEFAULT, DEFAULT),
(105, 150, 15, DEFAULT, DEFAULT),

(106, 50, 5, DEFAULT, DEFAULT),
(106, 100, 10, DEFAULT, DEFAULT),
(106, 150, 15, DEFAULT, DEFAULT),

(107, 50, 5, DEFAULT, DEFAULT),
(107, 100, 10, DEFAULT, DEFAULT),
(107, 150, 15, DEFAULT, DEFAULT),

(108, 50, 5, DEFAULT, DEFAULT),
(108, 100, 10, DEFAULT, DEFAULT),
(108, 150, 15, DEFAULT, DEFAULT),

(109, 50, 5, DEFAULT, DEFAULT),
(109, 100, 10, DEFAULT, DEFAULT),
(109, 150, 15, DEFAULT, DEFAULT),

(110, 50, 5, DEFAULT, DEFAULT),
(110, 100, 10, DEFAULT, DEFAULT),
(110, 150, 15, DEFAULT, DEFAULT),

(111, 50, 5, DEFAULT, DEFAULT),
(111, 100, 10, DEFAULT, DEFAULT),
(111, 150, 15, DEFAULT, DEFAULT),

(112, 50, 5, DEFAULT, DEFAULT),
(112, 100, 10, DEFAULT, DEFAULT),
(112, 150, 15, DEFAULT, DEFAULT),

(113, 50, 5, DEFAULT, DEFAULT),
(113, 100, 10, DEFAULT, DEFAULT),
(113, 150, 15, DEFAULT, DEFAULT),

(114, 50, 5, DEFAULT, DEFAULT),
(114, 100, 10, DEFAULT, DEFAULT),
(114, 150, 15, DEFAULT, DEFAULT),

(115, 50, 5, DEFAULT, DEFAULT),
(115, 100, 10, DEFAULT, DEFAULT),
(115, 150, 15, DEFAULT, DEFAULT),

(116, 50, 5, DEFAULT, DEFAULT),
(116, 100, 10, DEFAULT, DEFAULT),
(116, 150, 15, DEFAULT, DEFAULT),

(117, 50, 5, DEFAULT, DEFAULT),
(117, 100, 10, DEFAULT, DEFAULT),
(117, 150, 15, DEFAULT, DEFAULT),

(118, 50, 5, DEFAULT, DEFAULT),
(118, 100, 10, DEFAULT, DEFAULT),
(118, 150, 15, DEFAULT, DEFAULT),

(119, 50, 5, DEFAULT, DEFAULT),
(119, 100, 10, DEFAULT, DEFAULT),
(119, 150, 15, DEFAULT, DEFAULT),

(120, 50, 5, DEFAULT, DEFAULT),
(120, 100, 10, DEFAULT, DEFAULT),
(120, 150, 15, DEFAULT, DEFAULT),

(121, 50, 5, DEFAULT, DEFAULT),
(121, 100, 10, DEFAULT, DEFAULT),
(121, 150, 15, DEFAULT, DEFAULT),

(122, 50, 5, DEFAULT, DEFAULT),
(122, 100, 10, DEFAULT, DEFAULT),
(122, 150, 15, DEFAULT, DEFAULT),

(123, 50, 5, DEFAULT, DEFAULT),
(123, 100, 10, DEFAULT, DEFAULT),
(123, 150, 15, DEFAULT, DEFAULT),

(124, 50, 5, DEFAULT, DEFAULT),
(124, 100, 10, DEFAULT, DEFAULT),
(124, 150, 15, DEFAULT, DEFAULT),

(125, 50, 5, DEFAULT, DEFAULT),
(125, 100, 10, DEFAULT, DEFAULT),
(125, 150, 15, DEFAULT, DEFAULT),

(126, 50, 5, DEFAULT, DEFAULT),
(126, 100, 10, DEFAULT, DEFAULT),
(126, 150, 15, DEFAULT, DEFAULT),

(127, 50, 5, DEFAULT, DEFAULT),
(127, 100, 10, DEFAULT, DEFAULT),
(127, 150, 15, DEFAULT, DEFAULT),

(128, 50, 5, DEFAULT, DEFAULT),
(128, 100, 10, DEFAULT, DEFAULT),
(128, 150, 15, DEFAULT, DEFAULT),

(129, 50, 5, DEFAULT, DEFAULT),
(129, 100, 10, DEFAULT, DEFAULT),
(129, 150, 15, DEFAULT, DEFAULT),

(130, 50, 5, DEFAULT, DEFAULT),
(130, 100, 10, DEFAULT, DEFAULT),
(130, 150, 15, DEFAULT, DEFAULT),

(131, 50, 5, DEFAULT, DEFAULT),
(131, 100, 10, DEFAULT, DEFAULT),
(131, 150, 15, DEFAULT, DEFAULT);


INSERT INTO Suppliers (supplier_name, supplier_code, phone, email, address, status)
VALUES 
(N'CÔNG TY TNHH ORION', N'A', N'0919838786', N'banhkinhdo@gmail.com', N'Phường 13, Quận Bình Thạnh, TP.HCM', N'Active'),
(N'NHÀ PHÂN PHỐI BÁNH PHẠM NGUYÊN', N'B', N'0283765797', N'phamnguyen@gmai.com', N'Phường Đa Kao, Quận 1, TP. HCM', N'Active'),
(N'NHÀ PHÂN PHỐI PEPSICO', N'C', N'0652258115', N'pepsico@gmai.com', N'Hà Nội , Việt Nam', N'Active'),
(N'NHÀ PHÂN PHỐI BÁNH KINH ĐÔ', N'D', N'0283512342', N'orion@gmail.com', N'Phường 25, Quận Bình Thạnh, TP.HCM', N'Active');

-- Chèn dữ liệu liên kết giữa nhà cung cấp và thương hiệu
INSERT INTO SupplierBrand (supplier_id, brand_id) 
VALUES	(1, 1), -- Nhà phân phối Kinh Đô bán thương hiệu Kinh Đô
		(2, 2), -- Nhà phân phối Phạm Nguyên bán thương hiệu Phạm Nguyên
		(3, 3), -- Nhà phân phối Pepsico bán thương hiệu Pepsico
		(4, 4); -- Công ty TNHH Orion bán thương hiệu Orion

