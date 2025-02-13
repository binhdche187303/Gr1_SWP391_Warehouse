--CREATE DATABASE SWP
--GO
--USE SWP
--GO


--USE master;  
--GO  
--ALTER DATABASE SWP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  
--GO  


--drop database SWP
--go


-- Bảng Roles (Vai trò người dùng)
CREATE TABLE Roles (
    role_id INT PRIMARY KEY IDENTITY(1,1), 
    role_name VARCHAR(255) NOT NULL  -- Tên vai trò
);

INSERT INTO dbo.Roles(role_name)
VALUES
(N'Admin system'),
(N'Customer'),
(N'Warehouse manager'),
(N'Warehouse staffs'),
(N'Packing staffs')



-- Bảng Users (Người dùng)
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),  
    username VARCHAR(255) NOT NULL,  
    password VARCHAR(255) NOT NULL,  
    fullname NVARCHAR(255),
    phone NVARCHAR(11),
    email VARCHAR(255),  
    role_id INT NOT NULL,  
	address NVARCHAR(255),
	status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Deactive')) 
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)  
);

INSERT INTO dbo.Users(username, password, fullname, phone, email, role_id, status)
VALUES
(N'cus1', 'pass1', N'Customer 1', '0123456789', 'customer1@gmail.com', 2, 'Active'),
(N'ad1', 'pass1', N'Admin 1', '0987654321', 'admin1@gmail.com', 1, 'Active')


-- Bảng Brands (Thương hiệu)
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    brand_name NVARCHAR(255) NOT NULL -- Tên thương hiệu
);
--SELECT * FROM dbo.Brands
INSERT INTO dbo.Brands(brand_name)
VALUES
(N'Orion'),
(N'Phạm Nguyên'),
(N'Pepsico'),
(N'Kinh Đô')

-- Bảng Sizes (Kích thước sản phẩm)
CREATE TABLE Sizes (
    size_id INT PRIMARY KEY IDENTITY(1,1),
    size_name NVARCHAR(50) NOT NULL -- Tên kích thước (vd: Small, Medium, Large)
);
--SELECT * FROM dbo.Sizes
INSERT INTO Sizes (size_name)
VALUES
(N'Nhỏ'),
(N'Vừa'), 
(N'Lớn')

-- Bảng Categories (Danh mục sản phẩm)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(255) NOT NULL,
);


INSERT INTO dbo.Categories (category_name)
VALUES
(N'Kẹo'),
(N'Snack'),
(N'Bánh mì'),	--before 6 --> 3	
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

-- Bảng Products (Sản phẩm)
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name NVARCHAR(255) NOT NULL, 
    brand_id INT NOT NULL, 
	SKU NVARCHAR(255) NOT NULL,
    origin NVARCHAR(255), 
	category_id INT,
    --manufactured_date DATE, 
    --expired_date DATE, 
    description NVARCHAR(MAX), 
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
	FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products (product_name, brand_id, SKU, origin, category_id, description)
VALUES

------------------------------------------------ BRAND_ID : 1 : ORION - TUẤN ------------------------------------------------
--Banh ChocoPie(3)
(   N'Bánh ChocoPie Truyền Thống',1, 
	'B00001',
    N'Việt Nam', 6,
    N'Chiếc bánh tròn màu nâu sôcôla thật ngon miệng. Cắn một miếng đầu tiên, bạn sẽ cảm nhận được sự mềm mịn, bông xốp của hai lớp bánh. Kế đến là cấu trúc khó lẫn của nhân marshmallow dẻo dẻo dai dai. Và đọng lại cuối cùng là vị sôcôla đặc trưng, thơm ngon đến nao lòngTình như ChocoPie, Orion ChocoPie là sự lựa chọn hàng đầu của các bà mẹ.'
),
(   N'Bánh ChocoPie Đậm',1, 
	'B00002',
    N'Việt Nam', 6,
    N'Orion ChocoPie Đậm với hàm lượng cacao vượt trội lên tới 70%, hương cacao phủ ngập đầu lưỡi, cực nồng nàn và đậm đà. Sản phẩm dành riêng cho các fan cuồng sôcôla, đặc biệt là giới trẻ thích hương vị bùng nổ mạnh mẽ của cacao. Thêm chút đắng cho tình thêm đậm sâu.'
),
(   N'Bánh ChocoPie vị Dưa hấu',1, 
	'B00003',
    N'Việt Nam', 6,
    N'Bánh ChocoPie Vị Dưa Hấu - Phiên bản Tết đặc biệt với vị dưa hấu thanh mát kết hợp sô cô la ngọt ngào, mang đến một biểu tượng Tết đặc trưng, cầu chúc cho một năm mới đoàn viên, sung túc.'
),
--Banh Bong lan(10)
(   N'Bánh Bông Lan Mứt trái cây Là Fruit',1, 
	'B00004', 
    N'Việt Nam', 5,
    N'Lần đầu tiên trên thị trường, Orion cho ra mắt sản phẩm bánh bông lan mứt trái cây thật với hương vị bùng nổ. Lớp kem cheese bồng bềnh nhẹ tênh giúp tôn lên vị chua ngọt tự nhiên của nhân của mứt đào sần sật. Với các tín đồ yêu thích trái cây tự nhiên và trải nghiệm "thật" mới mẻ, Là Fruit chắc chắn là sự lựa chọn không thể bỏ qua'
),
(   N'Bánh bông lan cao cấp kiểu Âu Opéra vị Socola',1, 
	'B00005',
    N'Việt Nam', 5,
    N'Chiếc bánh Opéra - Một sự kết hợp giữa lớp bánh bông lan mềm mịn và lớp kem béo mềm, đi kèm là lớp sô cô la phủ bên ngoài mang đến cảm giác sang trọng, thanh lịch và hiện đại, một cảm giác thật "Âu". Với nhiều tầng hương vị hòa quyện, Opéra mong muốn khách hàng được thưởng thức một chiếc bánh tiệm trong tầm tay, thăng hạng cảm xúc cùng trải nghiệm cao cấp.'
),
(   N'Bánh Bông Lan Custas nhân Kem Trứng',1, 
	'B00006',
    N'Việt Nam', 5,
    N'Bánh Custas kem trứng rất được yêu thích bởi hương vị thơm ngon từ vỏ bánh, đến lớp kem trứng ngọt ngào, sánh mịn được làm từ trứng tươi. Từng chiếc bánh to tròn, được chăm chút từ chọn lọc nguyên liệu, đến khâu nướng bánh và đóng gói cẩn thận, mang đến cho bạn chiếc bánh tròn vị dinh dưỡng.'
),
(   N'Bánh Bông Lan Custas Kem Cốm Hà Nội',1, 
	'B00007',
    N'Việt Nam', 5,
    N'Custas - dòng bánh bông lan với lớp kem trứng ngọt gắn với bao nhiêu thế hệ trẻ thơ Việt Nam nay có thêm hương vị cốm xanh, thỏa lòng những người ưa thích hương vị cốm Hà thành xưa. Với hương vị cốm Hà Nội thơm ngon, lớp ngoài mềm xốp cùng nhân kem béo mịn, một chiếc bánh custas cốm sẽ là sự lựa chọn tuyệt vời những bữa nhẹ trong một ngày năng động, cung cấp đủ dinh dưỡng và năng lượng đủ để đem lại sự hứng khởi mới.'
),
(   N'Bánh ăn sáng Cest Bon Sandwich Sốt Bơ Phô Mai Chà Bông',1, 
	'B00008',
    N'Việt Nam',  5,
    N'Một bữa ăn sáng hoàn hảo không chỉ là một bữa ăn có đầy đủ dinh dưỡng mà còn phải thật thơm ngon, mang lại cảm giác tràn đầy năng lượng tươi mới để bắt đầu một ngày làm việc, học tập. Cest Bon Sandwich Sốt Bơ Phô Mai Chà Bông được làm từ lớp bánh bông lan mềm ẩm, sốt phô mai thơm ngậy, cùng chà bông gà dai dai mằn mặn là sự kết hợp hoàn hảo không chỉ giúp xoa dịu cơn đói tức thì mà còn bổ sung thêm Canxi.'
),
(   N'Bánh Ăn Sáng Cest Bon Sợi Thịt Gà',1, 
	'B00009',
    N'Việt Nam', 5,
    N'Bánh ăn sáng Cest Bon là sự kết hợp hòa quyện giữa bánh bông lan thơm mềm, cùng sợi thịt gà dai dai, mằn mặn. Vị mặn của chà bông gà được tẩm ướp kỹ càng, với hương thơm béo của trứng, mang đến cho bạn chiếc bánh mặn ngọt hòa quyện, thơm ngon, ngất ngây.'
),
(   N'Bánh Ăn Sáng Cest Bon Sợi Thịt Gà Sốt Kem Phô Mai',1,
	'B00010',
    N'Việt Nam', 5,
    N'Cest Bon now has a creamy cheese sauce inside, combined with the chewy chicken sponge cake. The C’est Bon Lava Cheese is nutritious, provides 20% more calcium for the body daily needs.'
),
(   N'Bánh Ăn Sáng Cest Bon Sợi Thịt Gà Sốt Kem Trứng Lava',1, 
	'B00011',
    N'Việt Nam', 5,
    N'Bánh ăn sáng Cest Bon nay có thêm sốt kem lava trứng muối thơm ngon, thịnh hành, hòa quyện cùng bánh bông lan sợi thịt gà, dai dai, mằn mặn. Chiếc bánh sợi thịt gà sốt kem hot trên thị trường, tròn dinh dưỡng, còn cung cấp thêm 20% lượng canxi cho nhu cầu hằng ngày của cơ thể.'
),
(   N'Bánh Custas Tiramisu',1, 
	'B00012', 
    N'Việt Nam', 5,
    N'Trải qua quá trình hoàn thiện đầy chỉn chu và tỉ mỉ, bánh Custas Tiramisu là sự hòa quyện hoàn hảo giữa lớp nhân kem phô mai mềm mại, bồng bềnh với lớp vỏ bánh vị cacao, thơm nhẹ mùi cà phê. Lấy cảm hứng từ món tráng miệng trứ danh của nước Ý, bánh Custas Tiramisu hứa hẹn sẽ là sự lựa chọn ngọt ngào cho mỗi khoảnh khắc gặp gỡ, chuyện trò thêm đậm đà, thú vị.'
),
(   N'Bánh con cá Bống bang',1, 
	'B00013',
    N'Việt Nam', 5,
    N'Sản phẩm bánh bông lan hình con cá vui nhộn đầu tiên trên thị trường với thiết kế bắt mắt, tươi sáng. Không chỉ độc đáo bởi hình dáng, bánh con cá Bống Bang còn rất đặc biệt khi có đến 4 lớp (bông lan mềm dai, bông lan mềm ẩm, mochi dẻo dẻo và nhân kem sô cô la đậu đỏ thơm bùi). Bổ sung chất Sắt và nguồn nguyên liệu đậu đỏ tốt lành. Bánh con cá Bống Bang không chỉ vui mà còn dinh dưỡng.'
),
--Banh Quy(10)
(   N'Bánh mì nướng kiểu Ý Cest Bon Baguette vị bơ tỏi đút lò',1, 
	'B00014',
    N'Việt Nam', 3,
    N'Lấy cảm hứng từ những chiếc bánh mì châu Âu thời thượng và bắt mắt, Cest Bon Baguette ra đời với 3 shape bánh mì mini độc nhất cùng vị bơ tỏi đút lò ngon khó cưỡng. Bánh mang đến cho bạn nguồn dinh dưỡng và năng lượng dồi dào để bắt đầu một ngày mới. Hơn thế nữa, Cest Bon Baguette khi đi kèm với các loại thức uống không chỉ tạo nên một bữa sáng cân bằng dinh dưỡng mà còn nâng tầm cảm xúc của bạn khi trải nghiệm phong cách "Ăn phải đi kèm với uống" của Ý'
),
(   N'Bánh quy Gouté Mè Giòn Tan',1, 
	'B00015',
    N'Việt Nam', 4,
    N' ‘Gouté’ trong tiếng Pháp có nghĩa là ngon miệng và cũng thể hiện gu tinh tế của người dùng khi trải nghiệm bánh. Với sự hòa quyện tuyệt vời giữa vị mặn và ngọt, độ mỏng giòn tan kèm với hương thơm của mè rang đặc trưng, Gouté tạo cảm giác lưu luyến vị giác khi bạn cắn thử.'
),
(   N'Bánh quy Gouté Hạt Dinh Dưỡng',1, 
	'B00016',
    N'Việt Nam', 4,
    N'Bánh Gouté Hạt bổ sung 5 loại hạt thiết yếu: hạt diêm mạch, hạt mè trắng, hạt mè đen, hạt chia và yến mạch nhằm mang lại giá trị dinh dưỡng cao cho mọi người. Đặc biệt, bánh vẫn giữ được độ mỏng giòn tan kèm vị mằn mặn dễ ăn, đảm bảo chiều lòng được khẩu vị của mọi lứa tuổi.'
),
(   N'Bánh Khoai Tây Nướng Tok vị Phô mai',1, 
	'B00017',
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp Phô Mai thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'Bánh Khoai Tây Nướng Tok vị Rong biển',1, 
	'B00018',
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp muối tảo biển thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'Bánh Khoai Tây Nướng Tok vị Bò BBQ',1, 
	'B00019',
    N'Việt Nam', 4,
    N'Từng chiếc bánh nhỏ xinh được làm từ khoai tây rồi nướng lên vàng rụm, áo đều lớp gia vị BBQ thơm lừng. Tok là tiếng bánh giòn vang trong miệng với tạo hình dạng cây tiện dụng và bao bì mới cá tính. Hãy quét mã QR để tham gia trò chơi Tok Gather - Get Challenge siêu vui nhộn. Hội họp cùng bạn bè, đừng quên Tok!'
),
(   N'Bánh quy Toonies Miz vị Socola',1, 
	'B00020',
    N'Việt Nam', 4,
    N'Bánh quy ăn sáng Toonies Miz vị sô cô la đươc làm từ Chips Socola trắng với nguồn năng lượng dồi dào, bổ sung canxi, sắt, kẽm cho giai đoạn phát triển và lớn khôn của trẻ. Miz có nhiều hình dạng thú vị cùng bao bì bắt mắt với hình ảnh chú bé thổ dân Toonies tinh nghịch, giúp kích thích trẻ ăn ngon.'
),
(   N'Bánh quy Sữa tươi Orion deMarie',1, 
	'B00021',
    N'Việt Nam', 4,
    N'Bánh quy Marie lần đầu tiên xuất hiện tại London năm 1874, với tên gọi là Queen of Biscuit trong lễ cưới hoàng gia giữa công nương Maria và công tước Duke. Lấy cảm hứng từ Công thức Hoàng gia cùng với sự kết hợp hoàn hảo giữa lúa mì và sữa tươi, Orion cho ra mắt Bánh quy Sữa tươi Orion deMarie thơm ngon hảo hạng và dinh dưỡng cho cả gia đình thưởng thức theo phong cách hoàng gia.'
),
(   N'Bánh quy hoa bơ tự nhiên Marika',1, 
	'B00022',
    N'Việt Nam', 4,
    N'Hương thơm béo đến từ bơ Anchor trứ danh kết hợp cùng vị đắng nhẹ của Chocolate thượng hạng hoà quyện trong những chiếc bánh hình bông hoa xinh đẹp của xứ sở New Zealand.'
),
(   N'Bánh quy ăn sáng Miz x Doraemon vị sô cô la',1, 
	'B00023',
    N'Việt Nam', 4,
    N'Tiện lợi cho mẹ: bánh ăn sáng gói nhỏ tiện lợi đem lại dinh dưỡng cho trẻ từ 100% chips socola trắng và được bổ sung thêm Canxi, Sắt, Kẽm. Vui vẻ cho bé: kết hợp với nhân vật truyện tranh nổi tiếng Doraemon và tạo tương tác, niềm vui cho trẻ thông qua 1 loạt các trò chơi (Tô màu + Thẻ học tiếng anh + Bộ sưu tầm lịch để bàn có 102) bên trong mỗi hộp bánh.'
),
--SnackToonie(4)
(   N'Bánh Snack Toonies vị Ớt đỏ cay nồng',1, 
	'S00001', 
    N'Việt Nam', 2,
    N'Snack Toonies Vị Ớt Đỏ Cay Nồng với hình que đặc biệt, ngộ nghĩnh được làm từ bột bắp. Từng que snack giòn rụm được phủ một lớp vẩy ớt thật cay nồng. Ăn một miếng snack Toonies Vị Ớt Đỏ Cay Nồng, cảm nhận vị cay trong miệng, kích thích mọi giác quan. Nay có thêm que snack cay cấp độ 2, 2 vị cay trong cùng một gói bánh, ngại gì mà không thử bạn ơi!'
),
(   N'Bánh Snack Toonies vị Gà rán giòn tan',1,  
	'S00002', 
    N'Việt Nam', 2,
    N'Là sự kết hợp hoàn hảo giữa những que snack bắp vàng ươm và hương vị gà rán giòn rụm, thơm phức, tuyệt hảo. Snack Toonies Vị Gà rán giòn tan với lớp gia vị đậm đà, là bạn đồng hành tuyệt vời cho mọi khoảnh khắc tươi vui của bạn.'
),
(   N'Bánh Snack Toonies vị Phô mai bùng nổ',1,  
	'S00003', 
    N'Việt Nam', 2,
    N'Que snack giòn tan, thơm thơm vị bắp, kết hợp cùng phô mai ngọt ngào, mặn mặn chắc chắn sẽ làm đắm chìm mọi tín đồ của phô mai. Cắn một miếng Snack Toonies Vị Phô Mai bùng nổ, ngon lành như đưa bạn lạc vào thế giới diệu kỳ đầy niềm vui. Nay có thêm viên snack phô mai béo ngậy, ngon khó cưỡng. Ăn đã hơn, bùng nổ hơn!'
),
(   N'Bánh Snack Toonies Choco vị Socola',1,   
	'S00004', 
    N'Việt Nam', 2,
    N'Snack Toonies Vị Sô Cô La được kết hợp từ bánh bắp giòn tan đặc biệt, sữa hòa quyện cùng bột cacao cao cấp, nay càng ngọt ngào đáng yêu hơn cùng những Thổ dân Choco tinh nghịch, siêu dễ thương. Tất cả nguyên liệu được kết hợp hoàn hảo, giòn bên ngoài, xốp bên trong, chắc chắn sẽ mang lại một trải nghiệm ngọt ngào đầy diệu kỳ cho bạn.'
),
--Snack Cornchip(2)
(   N'Bánh Snack Cornchip vị Bắp Nướng Bơ',1,  
	'S00005', 
    N'Việt Nam', 2,
    N'Cảm nhận vị "bắp nướng" và "bơ tươi" hòa quyện thơm lừng ngay khi mở gói. Miếng bánh thanh mỏng vừa phải, cắn vào giòn tan, ăn hoài không ngán. Hương vị hấp dẫn khó cưỡng cho cuộc vui trọn vẹn!'
),
(   N'Bánh Snack Cornchip vị Bắp Nướng Ngọt & Cay',1,  
	'S00006',  
    N'Việt Nam', 2,
    N'Vị bắp thơm lừng hòa quyện thêm chút "cay nhẹ" cho khẩu vị đậm đà. Miếng bánh thanh mỏng vừa phải, cắn vào giòn tan, ăn hoài không ngán. Hương vị hấp dẫn khó cưỡng cho cuộc vui trọn vẹn!'
),
--Ca King(3)
(   N'Bánh Cá King Marine Boy',1,  
	'S00007', 
    N'Việt Nam', 2,
    N'Bánh Cá King Marine Boy với phiên bản bánh to và giòn hơn cùng với hương vị tảo biển Nori đậm đà ngon tuyệt. Hình ảnh cá voi Walee trưởng thành và chứng chạc - là vua biển cả thống lĩnh đại dương đầy quyền lực được các bé vô cùng yêu thích.'
),
(   N'Bánh Cá Marine Boy vị Rong Biển Tuyết Xanh',1,  
	'S00008', 
    N'Việt Nam', 2,
    N'Bánh Cá Marine Boy với hình dạng độc đáo 16 sinh vật biển với câu chuyện thú vị bên trong để các bé vừa ăn, vừa học, vừa chơi! Bánh nướng không chiên, sản phẩm dinh dưỡng, bổ sung canxi với nhiều chương trình khuyến mãi hấp dẫn. Thưởng thức ngay bánh cá vị Rong Biển Tuyết Xanh đậm đà, giòn giòn với câu chuyện phiêu lưu hấp dẫn, vui nhộn!'
),
(   N'Bánh Cá Marine Boy vị Tôm Nướng Môi Đỏ',1,  
	'S00009', 
    N'Việt Nam', 2,
    N'Bánh Cá Marine Boy với hình dạng độc đáo 16 sinh vật biển với câu chuyện thú vị bên trong để các bé vừa ăn, vừa học, vừa chơi! Bánh nướng không chiên, sản phẩm dinh dưỡng, bổ sung canxi với nhiều chương trình khuyến mãi hấp dẫn. Thưởng thức ngay bánh cá vị Tôm Nướng Môi Đỏ đậm đà, giòn giòn với câu chuyện phiêu lưu hấp dẫn, vui nhộn!'
),
--Jungle(3)
(   N'Bánh Jungle Boy Lắk phô mai',1,  
	'S00010', 
    N'Việt Nam', 2,
    N'Junge Boy được các bé vô cùng yêu thích nay đã cho ra hương vị trendy mới cùng cách ăn điệu nghệ - lắc cùng bột phô mai béo ngậy đầy vui nhộn. Không những thế, sản phẩm được tăng cường canxi bổ sung cho bé, vừa vui lại thêm dinh dưỡng đúng không nào?'
),
(   N'Bánh Jungle Boy vị Sườn bò sốt cam',1,  
	'S00011', 
    N'Việt Nam', 2,
    N'Nối tiếp sự thành công của Marine Boy, Orion cho ra mắt bánh khủng long Jungle Boy-vị sườn bò sốt cam. Nhờ hương vị bò thơm ngon, đậm đà, mặn ngọt cùng sự giòn tan ở mỗi chiếc bánh, không chỉ tạo ra cảm giác ngon miệng cho các bé mà còn cung cấp nhiều chất dinh dưỡng, bổ sung canxi cho xương chắc khoẻ. Đặc biệt, bên trong mỗi gói bánh có quả trứng khủng long socola vừa thú vị, vừa thơm ngon, giòn rụm, giúp bé ăn thật ngon và chơi thật vui!'
),
(   N'Bánh Jungle Boy vị Socola Lúa Mạch',1,  
	'S00012',  
    N'Việt Nam', 2,
    N'Jungle Boy càng thêm dinh dưỡng với vị Socola Lúa Mạch mới! Những chiếc bánh mang hình thù khủng long ngộ nghĩnh ẩn chứa những phần quà bất ngờ, dễ thương, giúp cho bé ăn thật ngon, chơi thật vui.'
),
--Ostar(5)
(   N'Bánh Snack O’Star vị Tự Nhiên',1,  
	'S00013',  
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị khoai tây tự nhiên - giữ lại hương vị nguyên bản. Một lát khoai tây chiên vàng giòn không tẩm ướp gia vị sẽ có vị thơm bùi đặc trưng. Là một người đơn giản, khi đã thử qua nhiều vị của snack khoai tây, chắc hẳn bạn sẽ muốn quay về những điều cơ bản nhất, như snack khoai tây O’Star vị khoai tây tự nhiên.'
),
(   N'Bánh Snack O’Star vị Kim Chi Hàn Quốc',1,  
	'S00014', 
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị kim chi - đậm đà chuẩn vị Hàn Quốc. Chỉ những củ khoai tây căng tròn, láng mịn và vàng óng mới được chọn lọc để mang vào giai đoạn cắt gọt, tẩm ướp, chiên giòn. Vị chua chua, cay nồng đặc trưng của kim chi len lỏi trong từng lát khoai tây. Tất cả tạo nên một sự kết hợp hoàn hảo cho những tín đồ sành ẩm thực Hàn Quốc.'
),
(   N'Bánh Snack O’Star vị Tảo Biển',1,  
	'S00015', 
    N'Việt Nam', 2,
    N'Snack khoai tây O’Star vị tảo biển - tinh túy trong từng lát bánh thanh mặn. Chỉ những củ khoai tây căng tròn, láng mịn và vàng óng mới được chọn lọc để mang vào giai đoạn cắt gọt, tẩm ướp, chiên giòn. Từng lát tảo biển giòn tan, thanh mặn được nghiền mịn, hòa quyện cùng vị khoai thơm bùi. Tất cả tạo nên một hương vị hài hòa, nhẹ nhàng đặc trưng của O’Star vị tảo biển.'
),
(   N'Bánh Snack O’Star vị Phô Mai Trứng Muối',1,  
	'S00016', 
    N'Việt Nam', 2,
    N'Vị mặn bùi bùi của trứng muối cùng vị thơm béo của phô mai hòa quyện trong từng lát bánh khoai tây tươi ngon giòn rụm, chắc chắn sẽ làm hài lòng các tín đồ sành ăn nhất. Snack khoai tây O’Star vị phô mai trứng muối - thơm ngon đến khó cưỡng.'
),
(   N'Bánh Snack O’star K-POP vị xốt Mayo kiểu Hàn Quốc',1,  
	'S00017', 
    N'Việt Nam', 2,
    N'Lát khoai phẳng đặc trưng của O’Star nay được cắt dày hơn với 1.6mm, đậm vị khoai tây tươi ngon, hòa quyện tuyệt hảo cùng hương vị xốt mayo béo ngậy, mặn ngọt với hương thơm đặc trưng kiểu Hàn Quốc một cách vô cùng tinh tế.'
),
--Swing(3)
(   N'Bánh Snack Khoai Tây Swing vị Bíttết Kiểu New York',1,  
	'S00018', 
    N'Việt Nam', 2,
    N'Khoai Tây, Vị Tây. Snack Orion Swing là sự khiêu vũ của từng lát khoai tây tươi hình gợn sóng thấm đẫm lớp gia vị Bò Bít Tết New York đậm đà, đem đến những niềm vui bất tận như điệu Swing mang lại.'
),
(   N'Bánh Snack Khoai Tây Swing vị Gà Teriyaki Osaka',1,  
	'S00019', 
    N'Việt Nam', 2,
    N'Khoai Tây, Vị Nhật. Snack Orion Swing là sự khiêu vũ của từng lát khoai tây tươi hình gợn sóng thấm đẫm lớp gia vị Gà Teriyaki đậm đà, đem đến những niềm vui bất tận như điệu Swing mang lại.'
),
(   N'Bánh Snack Khoai Tây Swing vị Phô Mai 2 Lớp',1,  
	'S00020', 
    N'Việt Nam', 2,
    N'Bánh Snack Khoai Tây Swing Double Cheese - Cú chạm gợn sóng giữa 2 loại phô mai nổi tiếng thế giới. Swing Phô mai Chee-Z với sự kết hợp độc nhất của phô mai Cheddar trứ danh của đất nước Anh Quốc cùng với phô mai Mozzarella từ nước Ý, đủ sức làm điên đảo tín đồ ẩm thực với mùi sữa thơm và cấu trúc kéo sợi độc đáo.'
),
--Keo ngam(3)
(   N'Kẹo ngậm Họng vị Quất Mật Ong',1, 
	'K00001',
    N'Việt Nam', 1,
    N'Kẹo ngậm hương quất và mật ong thơm mát. Vị ngọt ngọt của mật ong và chua chua của quất tạo nên hương thơm hấp dẫn. Kẹo có tác dụng trong việc trị ho, thư giãn cổ họng, giảm ngứa rát và ho khan. Kẹo Orion chất lượng, ngọt thanh được nhiều người lựa chọn và tin dùng.'
),
(   N'Kẹo ngậm Họng vị Gừng Mật Ong',1,  
	'K00002', 
    N'Việt Nam', 1,
    N'Kẹo ngậm hương gừng và mật ong thơm mát. Vị ngọt ngọt của mật ong và cay thanh của gừng tạo nên hương thơm hấp dẫn. Kẹo có tác dụng trong việc trị ho, thư giãn cổ họng, giảm ngứa rát và ho khan. Kẹo Orion chất lượng, ngọt thanh được nhiều người lựa chọn và tin dùng.'
),
(   N'Kẹo ngậm Họng vị bạc hà thảo mộc',1,  
	'K00003',
    N'Việt Nam', 1,
    N'Kẹo Họng Vị Bạc Hà Thảo Mộc Orion là một loại kẹo có hương vị thơm ngon ngọt thanh của bạc hà và thảo mộc hoà quyện trong viên kẹo hoà quyện trong viên kẹo. Là một loại kẹo họng phổ biến, được biết đến với hương vị tươi mát của bạc hà kết hợp với hương thảo mộc tự nhiên. Viên kẹo nhỏ gọn này chứa đựng sự cân bằng hoàn hảo giữa vị ngọt dịu và vị bạc hà mát lạnh, mang lại cảm giác sảng khoái tức thì cho cổ họng. Kẹo Họng Vị Bạc Hà Thảo Mộc không chỉ giúp làm dịu cổ họng khô rát, mà còn mang lại hương thơm dễ chịu cho hơi thở.'
),
--Keo deo(7)
(   N'Kẹo dẻo BOOM hương chanh dây',1,  
	'K00004',
    N'Việt Nam', 1,
    N'Kẹo Boom Jelly Thạch chanh dây là sản phẩm tiên phong trong dòng kẹo dẻo có nhân. Kẹo được tăng cường 50% nước trái cây thật, kết hợp chanh dây cùng hạt chia vô cùng hấp dẫn. Bên cạnh đó, cấu trúc 2 lớp kẹo lột độc đáo cũng sẽ mang lại trải nghiệm đầy mới mẻ cho các bé.'
),
(   N'Kẹo dẻo BOOM vị xoài lắc muối ớt',1,  
	'K00005', 
    N'Việt Nam', 1,
    N'Đam mê xoài lắc nhưng lại là tín đồ của kẹo dẻo? Boom Jelly Xoài Lắk muối ớt chắc chắn là dành cho bạn. Kẹo dẻo Boom Jelly Lắk được làm từ 30% nước trái cây thật với vị chua chua ngọt ngọt đúng kiểu xoài non. Shape kẹo hình xoài đáng yêu cùng với cách ăn mới mẻ khi kết hợp lắc cùng gói muối ớt sẽ khiến ai ai cũng thích mê. '
),
(   N'Kẹo dẻo BOOM hương Đào',1,  
	'K00006',
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'Kẹo dẻo BOOM hương Nho',1,  
	'K00007',
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'Kẹo dẻo BOOM hương Dâu',1,  
	'K00008',
    N'Việt Nam', 1,
    N'Là dòng kẹo đầu tiên của Orion được sản xuất tại Việt Nam. Kẹo dẻo BOOM được làm từ 30% trái cây thật, vị chua chua ngọt ngọt, hình dáng đào, dâu, nho đáng yêu, ngộ nghĩnh, được đánh giá là kẹo dẻo dai dai mềm mềm đúng ý thích của trẻ con Việt Nam.'
),
(   N'Kẹo dẻo BOOM vị me lắc xí muội Thái Lan',1,  
	'K00009',
    N'Việt Nam', 1,
    N'Kẹo Dẻo Boom Jelly Lắk Orion Vị Me Lắc Xí Muội có nguồn gốc từ những quả me Thái chất lượng cao được chọn lọc kỹ càng. Điều này đã mang đến vị chua chua ngọt ngọt cho từng viên kẹo dẻo hình quả me xinh xắn. Khi thưởng thức sản phẩm, bạn sẽ dễ dàng cảm nhận được sự thanh mát ấn tượng mà sản phẩm mang đến như làn gió sảng khoái trong mùa hè nóng nực. Kết cấu dai mềm khi nhai cùng vị trái cây hấp dẫn đã được cân bằng hoàn hảo, tạo nên trải nghiệm vị giác vui nhộn cho người thưởng thức. Những quả me đến từ xứ sở Chùa Vàng với vị ngọt thanh kèm theo chút chua nhẹ là món ăn vặt ưa thích của rất nhiều bạn trẻ.  '
),
(   N'Kẹo dẻo BOOM Mix vị hỗn hợp',1,  
	'K00010',
    N'Việt Nam', 1,
    N'Kẹo dẻo boom Jelly mix vị hỗn hợp Orion phù hợp với khẩu vị của trẻ em bởi hương thơm lừng của nho, táo, đào cộng lại đi kèm với độ ngọt ngọt, dai dai. Thành phần an toàn, chất lượng nên các mẹ yên tâm cho bé thưởng thức.'
),
--Banh gao(6)
(   N'Bánh gạo nướng An chà bông',1, 
	'B00024',
    N'Việt Nam', 7,
    N'Một lựa chọn bữa phụ mới mẻ đầy chất lượng dành cho các mẹ đã chính thức được Orion trình làng. Chiếc bánh gạo An giòn rụm nay được cải tiến to và dày hơn, không những thế còn được bổ sung ruốc thịt thật đậm đà đầy dinh dưỡng khiến cả gia đình thích mê.'
),
(   N'Bánh Gạo Nướng An Vừng',1, 
	'B00025',
    N'Việt Nam', 7,
    N'Lấy cảm hứng từ LÀNG NGHỀ BÁNH ĐA truyền thống, Bánh gạo An Vừng truyền tải nét đẹp ẩm thực và văn hóa quê hương Việt Nam thông qua hai loại nông sản thân thuộc bậc nhất với làng quê người Việt: gạo & vừng. Chiếc bánh có hương thơm lừng của vừng rang, khi ăn sẽ cảm nhận được vị béo bùi của Vừng, ngọt thanh của gạo và đặc biệt là sự GIÒN TAN trên từng chiếc bánh cực kỳ hấp dẫn khiến bạn liên tưởng đến chiếc BÁNH ĐA tuổi thơ.'
),
(   N'Bánh Gạo Nướng An Vị Khoai Tây Phô Mai',1, 
	'B00026', 
    N'Việt Nam', 7,
    N'Bánh gạo An Khoai Tây Phô Mai Nướng là sự kết hợp của khoai tây thơm ngon giàu năng lượng cùng phô mai Cheddar nướng thượng hạng, đem đến cho cả gia đình những bữa nhẹ dinh dưỡng thơm ngon. Hương vị lôi cuốn từ những miếng cắn giòn tan đầu tiên, vị béo hòa cùng hương thơm của khoai tây phô mai nướng quyện trên đầu lưỡi, mang đến cảm giác thích thú và ngon miệng khi thưởng thức.'
),
(   N'Bánh Gạo Nướng An Vị Tảo Biển',1, 
	'B00027',
    N'Việt Nam',7,
    N'Bánh Gạo Nướng An Vị Tảo Biển - Thanh Mặn Dịu Nhẹ Lấp Đầy Chiếc Bụng Đói. Từng lát tảo biển thơm ngon hòa quyện cùng gạo giống Nhật Japonica, qua công nghệ nướng đa chiều hiện đại tạo thành những miếng bánh giòn tan lôi cuốn. Mằn mặn ngọt nhẹ thanh thanh ngon nức nở.'
),
(   N'Bánh Gạo Nướng An Vị Tự Nhiên',1, 
	'B00028',
    N'Việt Nam', 7,
    N'Bánh gạo Nướng An Vị Tự Nhiên - Bánh gạo nướng từ 100% gạo giống Nhật Japonica. Chiếc bánh được làm dưới sự chăm chút từng công đoạn, người nông dân chọn lọc những hạt gạo mới nhất để đưa vào chế biến. Trải qua quy trình nghiêm ngặt, khép kín - ngâm gạo - vo gạo - nghiền gạo - chần nước sôi 2 lần - và bắt đầu tạo thành những hình dáng đáng yêu (tròn/dài). Sau đó bánh được đi qua dây chuyến nướng khép kín, tạo nên độ giòn tan, thơm lừng mùi gạo mới.'
),
(   N'Bánh gạo nướng An Cốm sen',1, 
	'B00029',
    N'Việt Nam', 7,
    N'Bánh gạo nướng An nay có thêm hương vị mới với sự kết hợp có cốm Hà Thành thơm ngon và lá sen mang đến những chiếc bánh gạo chất lượng, thơm lừng và toát lên nét đẹp văn hoá độc đáo.'
),

------------------------------------------------ BRAND_ID : 2 :  - BÌNH ------------------------------------------------

-- Bánh mì ( 5 sp ) : 60 - 65
	-- Bánh mì tươi Otto : 60
(   N'Bánh Mì Hoa Cúc Mini Otto',2, 
	'B00030',
    N'Việt Nam', 3,
    N'Bánh mì Hoa cúc Otto DẠNG GÓI TIỆN LỢI với HƯƠNG VỊ CHUẨN PHÁP TRỨ DANH được thiết kế vừa đủ cho một bữa ăn sáng thơm ngon và đầy đủ chất dinh dưỡng Protein, Canxi, Chất xơ từ bơ New Zealand thương hạng, lúa mì miền Bắc nước Mỹ và công nghệ hiện đại tái tạo bàn tay người thợ lành nghề làm nên bề mặt bánh thắt bím đẹp mắt, tạo thớ bánh sợi dai dai cho những người bận rộn trải nghiệm bữa sáng nhanh gọn nhưng vẫn dinh dưỡng.'
),

	-- Bánh Mì Khoai Tây Otto : 61 
(   N'Bánh Mì Khoai Tây Otto',2, 
	'B00031',
    N'Việt Nam', 3,
    N'Bánh mì khoai tây Otto là sụ pha trộn tinh tế giữa vị thơm ngon của khoai tây và độ mềm của bánh, tạo nên trải nghiệm ẩm thực độc đáo và hấp dẫn.Bánh mì khoai tây Otto dẫn đầu xu hướng dinh dưỡng hiện nay với hàm lượng protein, canxi, sắt, vitamin B6 và vitamin C…. là lựa chọn lý tưởng để có một bữa sáng ngon, lành mạnh và đầy đủ dưỡng chất cho cả gia đình.'
),

	-- Bánh Mì Lưới Ruốc Xốt Mayonnaise – Otto : 62
(   N'Bánh Mì Lưới Ruốc Xốt Mayonnaise Otto',2, 
	'B00032',
    N'Việt Nam', 3,
    N'Sản phẩm Bánh mì tươi Otto là món ăn vặt hoàn hảo cho cả gia đình. Chiếc bánh được làm với các nguyên liệu cơ bản , của bơ, trứng, sữa cách điệu thêm mặt lưới khác biệt. Thành phần nhân mặn, ngòn ngọt thơm ngon của ruốc và mayonaise trải điều khắp mặt bánh, cho bạn tận hưởng trọn miếng bánh với miếng đầu tiên'
),

	--Bánh Mì Thịt Xốt – Otto : 63
(   N'Bánh Mì Thịt Xốt Otto',2, 
	'B00033',
    N'Việt Nam', 3,
    N'Sản phẩm Bánh mì tươi Otto là món ăn vặt hoàn hảo cho cả gia đình.Từ sự chăm chút kỹ lưỡng, đầy tâm huyết trong từng khâu lựa chọn nguyên liệu và chế biến, bánh mì thịt Otto xốt Mayonnaise cay tươi ngon, béo thơm, làm bừng tỉnh mọi giác quan khi cắn vào từng thớ thịt thấm vị đậm đà.Bánh mì thịt Otto xốt Mayonnaise – Ngon khác biệt, vị đậm đàLoại Bánh Mì Thịt Xốt Mayonnaise – Otto.'
),

	--Sandwich Tươi Có Xốt – Otto : 64

(   N'Sandwich Tươi Có Xốt Otto',2, 
	'B00034',
    N'Việt Nam', 3,
    N'Được chế biến từ giống lúa mì Hạt đỏ từ thảo nguyên miền Bắc nước Mỹ, với hàm lượng protein cao là bí quyết tạo nên lát bánh mềm mịn khác biệt & Sử dụng công nghệ trộn và ủ “3-zone” hiện đại nhất từ Đức, giúp bột thở và thư giãn tạo ra kết cấu bánh mềm tan khó cưỡng. Kết hợp hương vị đậm đà của cá hồi rong biển xốt mayonnaise caybéo thơm, làm bừng tỉnh mọi giác quan ngay từ lát cắn đầu tiên.'
),

	--Sandwich Tươi Lạt – Otto 65
(   N'Sandwich Tươi Lạt Otto',2, 
	'B00035',
    N'Việt Nam', 3,
    N'Otto Sandwich tươi được chế biến từ giống lúa mì hạt đỏ thường được thu hoạch vào mùa xuân từ thảo nguyên miền Bắc nước Mỹ, nổi tiếng về lúa mì với độ ẩm cao là bí quyết tạo nên nguyên liệu bột mềm mịn khác biệt.'
),


-- Bánh phủ Sôcôla Choco PN ( 5 sản phẩm ) 66 - 70

	-- Bánh Phủ Sôcôla – Choco PN 
(   N'Bánh Phủ Sôcôla – Choco PN',2, 
	'B00036',
    N'Việt Nam', 6,
    N'Nhãn hiệu được lựa chọn số 1 với 3 lợi ích hấp dẫn: nguyên liệu 100% cacao nhập khẩu từ Indonesia cùng nhân marshmallow dẻo mịn. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động . Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon.'
),
	--Bánh Phủ Sôcôla Chip Kem Marshmallow – Choco PN 
(   N'Bánh Phủ Sôcôla Chip Kem Marshmallow – Choco PN',2, 
	'B00037',
    N'Việt Nam', 6,
    N'Nhãn hiệu được lựa chọn số 1 với 3 lợi ích hấp dẫn: 100% cacao nhập khẩu từ Indonesia, kết hợp socola chip và nhân marshmallow mát lạnh. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon.'
),
	--Bánh Phủ Sôcôla Kem Kaya Singapore – Choco PN
(   N'Bánh Phủ Sôcôla Kem Kaya Singapore – Choco PN',2, 
	'B00038',
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Nhân kem Kaya là sự kết hợp giữa nước cốt dừa, trứng hòa quyện với hương lá dứa thơm lừng. Lớp bánh bông lan mềm ngon đặc trưng với hơn 16% từ trứng gà tươi, mang đến trải nghiệm mới lạ.Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động'
),
	--Bánh Phủ Sôcôla Vị Dưa Hấu – Choco PN 
(   N'Bánh Phủ Sôcôla Vị Dưa Hấu – Choco PN',2, 
	'B00039',
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động.Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon, thanh mát từ ngoài vào trong, lớp bánh bông lan thơm phức mùi dưa, nhân Marshmallow vị dưa ngọt mát tự nhiên.'
),

	--Bánh Sôcôla Kem Marshmallow Và Mứt Dâu – Choco PN 
(   N'Bánh Sôcôla Kem Marshmallow Và Mứt Dâu – Choco PN',2, 
	'B00040',
    N'Việt Nam', 6,
    N'100% cacao nhập khẩu từ Indonesia. Có chứa Canxi & Sắt giúp xương và răng chắc khỏe, đồng thời duy trì năng lượng cơ thể, giúp bạn khỏe mạnh và luôn năng động.Công thức mới giúp bánh ít ngọt mà vẫn thơm ngon, lớp marshmallow vị dâu thơm ngon đặc biệt'
),


-- Kẹo Sôcôla Sữa Popit( 4 sản phẩm ) : 71 - 74 
	--Kẹo Dẻo Thiên Thạch Mix Vị Popit
(   N'Kẹo Dẻo Thiên Thạch Mix Vị Popit',2, 
	'K00011',
    N'Việt Nam', 1,
    N'Kẹo dẻo thiên thạch POPIT mang cấu trúc độc đáo, mới lạ là sự kết hợp hạt kẹo giòn tan cùng với nhân kẹo dẻo từ nước ép trái cây tạo cảm giác dai giòn thật thích thú khi ăn.Kẹo dẻo thiên thạch POPIT – Ngon nhất quả đất.'
), 
	--Kẹo Dẻo Thiên Thạch Popit
(   N'Kẹo Dẻo Thiên Thạch Popit',2, 
	'K00012',
    N'Việt Nam', 1,
    N'Kẹo dẻo thiên thạch POPIT mang cấu trúc độc đáo, mới lạ là sự kết hợp hạt kẹo giòn tan cùng với nhân kẹo dẻo từ nước ép trái cây tạo cảm giác dai giòn thật thích thú khi ăn.Kẹo dẻo thiên thạch POPIT – Ngon nhất quả đất.'
), 
	--Kẹo Ống Sôcôla Popit Doreamon – Popit
(   N'Kẹo Ống Sôcôla Popit Doreamon – Popit',2, 
	'K00013',
    N'Việt Nam', 1,
    N'Kẹo Sôcôla sữa Popit Doraemon được sản xuất trên dây chuyền công nghệ cao, mang đến những viên kẹo chất lượng nhất. Kẹo Sôcôla sữa Popit Doraemon có chứa các chất chống oxy hóa, probiotics, vitamins không những cung cấp nguồn năng lượng, giảm stress mà còn hỗ trợ cho sự phát triển của trẻ em.'
), 
	--Kẹo Sôcôla Sữa Popit Doraemon
(   N'Kẹo Sôcôla Sữa Popit Doraemon',2, 
	'K00014',
    N'Việt Nam', 1,
    N'Kẹo Sôcôla sữa Popit Doraemon được sản xuất trên dây chuyền công nghệ cao, mang đến những viên kẹo chất lượng nhất. Kẹo Sôcôla sữa Popit Doraemon có chứa các chất chống oxy hóa, probiotics, vitamins không những cung cấp nguồn năng lượng, giảm stress mà còn hỗ trợ cho sự phát triển của trẻ em. Với những viên kẹo nhiều màu sắc và đặc biệt là hình ảnh các nhân vật trong truyện tranh Doraemon đáng yêu trên bao bì, được cấp phép sử dụng bản quyền hình ảnh chính thức.'
), 


-- Bánh giòn Limo ( 3 sản phẩm ) : 75 - 77
	-- Bánh Giòn Mè Đen – Limo
(   N'Bánh Giòn Mè Đen – Limo',2, 
	'B00041',
    N'Việt Nam', 6,
    N'Chứa đến 7% mè, là sự kết hợp độc đáo giữa vị ngọt của bột bánh, mùi thơm của mè, và vị mặn nhẹ đặc trưng của sản phẩm. Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ.Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
), 
	--Bánh Giòn Mè Dừa – Limo
(   N'Bánh Giòn Mè Dừa – Limo',2, 
	'B00042',
    N'Việt Nam', 6,
    N'Chứa đến 7% mè, là sự kết hợp độc đáo giữa vị ngọt của bột bánh, mùi thơm của mè, và vị mặn nhẹ đặc trưng của sản phẩm.Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ.Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
), 

	--Bánh Giòn Vị Cà Phê – Limo
(   N'Bánh Giòn Vị Cà Phê – Limo',2, 
	'B00043',
    N'Việt Nam', 6,
    N'Là sự kết hợp độc đáo giữa vị ngọt của bột bánh, vị mặn nhẹ đặc trưng của sản phẩm và đậm đà hương vị cà phê truyền thống.Cung cấp vitamin & khoáng chất giúp cơ thể luôn khỏe mạnh và tươi trẻ. Sản phẩm với thiết kế đóng hộp đẹp mắt có thể dùng để tặng quà cho người thân, bạn bè. Bánh không chất bảo quản, an toàn với người sử dụng.'
),

-- Bánh bông lan Solo (4 sản phẩm ) : 78 -81
	--Bánh Bông Lan Kem Bơ Sữa – Solo
(   N'Bánh Bông Lan Kem Bơ Sữa – Solo',2, 
	'B00044',
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
), 
	--Bánh Bông Lan Kem Dâu – Solo
(   N'Bánh Bông Lan Kem Dâu – Solo',2, 
	'B00045',
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
), 
	--Bánh Bông Lan Kem Dứa – Solo
(   N'Bánh Bông Lan Kem Dứa – Solo',2, 
	'B00046',
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
), 
	--Bánh Bông Lan Kem Lá Dứa – Solo
(   N'Bánh Bông Lan Kem Lá Dứa – Solo',2, 
	'B00047',
    N'Việt Nam', 5,
    N'Chắt chiu từ các nguồn nguyên liệu tươi ngon, dinh dưỡng như trứng gà & sữa tươi.Dưới bàn tay của các bậc thầy làm bánh nhiều năm kinh nghiệm và dây chuyền sản xuất hiện đại từ Châu Âu mang đến chiếc bánh bông lan Solo thơm ngon tuyệt hảo với vỏ bánh mềm mịn, nhân kem lá dứa thơm phức, đồng thời bánh có chứa Canxi cung cấp thêm dinh dưỡng trong từng miếng bánh.​'
),

------------------------------------------------ BRAND_ID : 3_Pepsico  - BÌNH ------------------------------------------------
---------------ĐỒ UỐNG CÓ GA-------------------
--Pepsi : 82 - 85 
	--Nước ngọt Pepsi không calo vị chanh
(   N'Nước ngọt Pepsi không calo vị chanh ',3, 	
	'D00001',
    N'Việt Nam', 8,
    N'Sự kết hợp hài hòa của vị chanh thanh mát, giải nhiệt và mang lại cảm giác sảng khoái và tốt cho sức khỏe. Nước ngọt Pepsi không calo vị chanh cực kỳ thích hợp cho những người thích uống nước ngọt nhưng vẫn muốn giữ lối sống ăn thanh đạm, ít đường. Sản phẩm chất lượng từ nước ngọt Pepsi'
),

	--Nước ngọt Pepsi Cola Sleek 
(   N'Nước ngọt Pepsi Cola Sleek',3, 	
	'D00002',
    N'Việt Nam', 8,
    N'Nước ngọt của thương hiệu Pepsi an toàn, chất lượng được nhà nhà lựa chọn tin dùng. Nước ngọt Pepsi Cola Sleek mang hương vị đặc trưng, thơm ngon hấp dẫn giúp bạn xua tan đi cơn khát ngay tức khắc. Nước ngọt Pepsi được chế biến theo công nghệ hiện đại, an toàn cho sức khỏe người dùng. '
),
	--Nước ngọt Pepsi không calo lon 
(   N'Nước ngọt Pepsi không calo',3, 	
	'D00003',
    N'Việt Nam',8,
    N'Là loại nước ngọt được nhiều người yêu thích đến từ thương hiệu nước ngọt Pepsi nổi tiếng thế giới với hương vị thơm ngon, sảng khoái. Nước ngọt Pepsi không calo với lượng gas lớn sẽ giúp bạn xua tan mọi cảm giác mệt mỏi, căng thẳng, sản phẩm không calo lành mạnh, tốt cho sức khỏe'
),

	--Nước ngọt Pepsi Cola chai
(   N'Nước ngọt Pepsi Cola',3, 	
	'D00004',
    N'Việt Nam',  8,
    N'Từ thương hiệu nước ngọt Pepsi nổi tiếng toàn cầu với mùi vị thơm ngon với hỗn hợp hương tự nhiên cùng chất tạo ngọt tổng hợp, giúp xua tan cơn khát và cảm giác mệt mỏi.  Nước ngọt Pepsi Cola 390ml bổ sung năng lượng làm việc mỗi ngày. Cam kết nước ngọt chính hãng, chất lượng và an toàn'
),

--7up : 86 - 88
	--Nước ngọt soda chanh 7 Up
(   N'Nước ngọt soda chanh 7 Up',3, 	
	'D00005',
    N'Việt Nam', 8,
    N'Nước ngọt chính hãng thương hiệu nước ngọt 7Up uy tín được nhiều người ưa chuộng. Nước ngọt soda chanh 7 Up lon chứa nước ép chanh thật, không đường không calo, cung cấp vitamin C và mang đến cảm giác sảng khoái, tràn đầy sức sống'
),

	--Nước ngọt 7 Up vị chanh lon
(   N'Nước ngọt 7 Up vị chanh lon',3, 	
	'D00006',
    N'Việt Nam',  8,
    N'Từ thương hiệu nước ngọt uy tín được ưa chuộng.Nước ngọt 7 Up hương chanh lon 320ml chính hãng nước ngọt 7Up có vị ngọt vừa phải và hương vị gas the mát, giúp bạn xua tan nhanh chóng cơn khát, giảm cảm giác ngấy, kích thích vị giác giúp ăn ngon hơn, cung cấp năng lượng'
),

	--Nước ngọt 7 Up vị chanh chai
(   N'Nước ngọt 7 Up vị chanh chai',3, 	
	'D00007',
    N'Việt Nam', 8,
    N'Nước ngọt chính hãng nước ngọt 7Up uy tín được nhiều người ưa chuộng. Nước ngọt 7 Up hương chanh 1.5 lít có vị ngọt vừa phải và hương vị gas the mát, giúp bạn xua tan nhanh chóng cơn khát, giảm cảm giác ngấy, kích thích vị giác giúp ăn ngon hơn, cung cấp năng lượng cho tinh thần tươi vui mỗi ngày'
),

--Mirinda : 89 - 91
	--Nước ngọt Mirinda hương cam lon 
(   N'Nước ngọt Mirinda hương cam lon',3, 	
	'D00008',
    N'Việt Nam', 8,
    N'Nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng. Nước ngọt Mirinda cam lon 320ml với hương vị cam đặc trưng, không chỉ giải khát, mà còn bổ sung thêm vitamin C giúp lấy lại năng lượng cho hoạt động hàng ngày. Cam kết chính hãng và an toàn'
),

	--Nước ngọt Mirinda vị soda kem
(   N'Nước ngọt Mirinda vị soda kem',3, 	
	'D00009',
    N'Việt Nam', 8,
    N'Sản phẩm nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng với hương vị độc đáo hấp dẫn. Nước ngọt Mirinda vị Soda kem lon 320ml có vị ngọt dịu, nước ngọt không chỉ giúp xua tan cơn khát tức thì mà còn giúp kích thích vị giác, cho bữa ăn thêm ngon miệng'
),
	--Nước ngọt Mirinda hương xá xị lon
(   N'Nước ngọt Mirinda hương xá xị lon',3, 	
	'D00010',
    N'Việt Nam', 8,
    N'Nước ngọt giải khát từ thương hiệu nước ngọt Mirinda nổi tiếng được nhiều người ưa chuộng với hương và vị hấp dẫn. Nước ngọt Mirinda hương xá xị lon 320ml có hương xá xị tự nhiên, độc đáo giúp bạn giải nhanh cơn khát,  với vị gas nhẹ là thức uống giải khát tuyệt vời dành cho mọi lứa tuổi.'
),
--Trung
--Bánh quy AFC
(N'Bánh quy giòn AFC vị rau', 4, 'B00048', N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị Caramel Flan', 4, 'B00049',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị cốm non', 4, 'B00050',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị lúa mì', 4, 'B00051',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị tảo biển', 4, 'B00052',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị bò bít tết', 4, 'B00053',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
(N'Bánh quy giòn AFC vị chân gà xả tắc', 4, 'B00054',  N'Việt Nam', 4, N'Bánh quy giòn AFC không chỉ có hương vị thơm ngon mà còn phù hợp với chế độ ăn uống cân bằng và khỏe mạnh'),
--Bánh quy Cosy
(N'Bánh quy Cosy Hạt bơ và điều', 4, 'B00055',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'Bánh quy Cosy Mè', 4, 'B00056',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'Bánh quy Cosy Marie', 4, 'B00057',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'Bánh quy Cosy nhân mứt hương táo', 4, 'B00058',  N'Việt Nam', 4, N'Bánh quy Cosy nhân mứt táo được chọn lọc từ những nguyên liệu chất lượng, tươi mới mang đến cho người tiêu dùng những chiếc bánh quy thơm ngon, độc đáo với nhân mứt táo mới lại cho bạn một ngày dài năng động.'),
(N'Bánh quy hạt chocolate yến mạch Cosy Original', 4, 'B00059',  N'Việt Nam', 4, N'Bánh quy hạt socola yến mạch Cosy Original là sự kết hợp giữa hai nguyên liệu thơm ngon là yến mạch và socola. Bánh có hình dạng tròn, kích thước nhỏ nhắn, vừa ăn. Vỏ bánh màu nâu vàng, giòn rụm, thơm ngon, khi ăn mang đến vị ngọt ngào, đậm đà, hòa quyện với vị socola thơm béo và yến mạch bùi bùi.'),
(N'Bánh quế Cosy Chocolate', 4, 'B00060',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'Bánh quế Cosy Dâu', 4, 'B00061',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
(N'Bánh quế Cosy Xoài xí muội', 4, 'B00062',  N'Việt Nam', 4, N'Sản phẩm này được làm từ các thành phần như: bột mì, dầu cọ, muối, đường, canxi, natri, carbohydrate,… có tác dụng làm dịu cơn đói nhanh chóng và bổ sung nhiều chất dinh dưỡng cần thiết cho cơ thể.'),
--Bánh Solite
(N'Bánh Solite Kinh Đô - vị bơ sữa', 4, 'B00063',  N'Việt Nam', 5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'Bánh Solite Kinh Đô - vị lá dứa', 4, 'B00064',  N'Việt Nam',  5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'Bánh Solite Kinh Đô - vị dâu', 4, 'B00065',  N'Việt Nam',  5,  N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
(N'Bánh Solite Kinh Đô - vị socola', 4, 'B00066',  N'Việt Nam',  5, N'Bánh bông lan Solite được làm từ các thành phần tự nhiên như trứng gà, bột mì, đường, dầu nành, dầu cọ,… nên hương vị phù hợp với đa dạng khẩu vị của người dùng.'),
--Snack khoai tây
(N'Snack khoai tây Slide vị gà nướng', 4, 'S00021',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'Snack khoai tây Slide vị phô mai', 4, 'S00022',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'Snack khoai tây Slide vị kem hành', 4, 'S00023',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'Snack khoai tây Slide vị thịt nướng', 4, 'S00024',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'Snack khoai tây Slide vị thơm cay', 4, 'S00025',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
(N'Snack khoai tây Slide vị tự nhiên', 4, 'S00026',  N'Việt Nam', 2, N'Snack khoai tây Slide được sản xuất theo quy trình khép kín, hiện đại để khoai tây vẫn giữ được những dưỡng chất như ban đầu.'),
--Bánh mì tươi
(N'Bánh mì tươi Kinh Đô - Sừng bò', 4, 'B00067',  N'Việt Nam', 3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Bò sốt Bulgogi', 4, 'B00068',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Gà sốt chua cay', 4, 'B00069',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Pizza Xúc Xích', 4, 'B00070',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Chà Bông', 4, 'B00071',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Burger bò', 4, 'B00072',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Burger gà', 4, 'B00073',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Socola', 4, 'B00074',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Bơ sữa', 4, 'B00075',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Lá dứa', 4, 'B00076',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
(N'Bánh mì tươi Kinh Đô - Bơ đậu phộng', 4, 'B00077',  N'Việt Nam',  3, N'Những chiếc bánh mì tươi Kinh Đô vừa thơm ngon vừa có đầy đủ vị ngọt và mặn.'),
--Bánh Oreo
(N'Bánh quy Oreo - Việt Quất', 4, 'B00078',  N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'Bánh quy Oreo - Dâu', 4, 'B00079',  N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'Bánh quy Oreo - Socola', 4, 'B00080',  N'Việt Nam',4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…'),
(N'Bánh quy Oreo - Vanilla', 4, 'B00081',  N'Việt Nam', 4, N'Bánh Oreo có hương vị thơm ngon, giòn, béo và ngọt dịu với đa dạng nhân kem như: socola, dâu, vani,…')



-- Bảng ProductPrices (Giá sản phẩm theo kích thước)
CREATE TABLE ProductVariants (
    variant_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL, 
    size_id INT NOT NULL, 
    price DECIMAL(18, 2) NOT NULL, 
	stock INT NOT NULL,
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

<<<<<<< HEAD
=======
--Bảng filter
CREATE TABLE Filters (
    filter_id INT PRIMARY KEY IDENTITY(1,1),
    filter_name VARCHAR(255) NOT NULL UNIQUE  -- Tên tiêu chí lọc (Category, Brand, Price Range)
);

INSERT INTO Filters(filter_name) 
VALUES 
	 ('Category'),
	 ('Brand'),
	 ('Price Range')

CREATE TABLE FilterOptions (
    option_id INT PRIMARY KEY IDENTITY(1,1),
    filter_id INT,
    option_value VARCHAR(255) NOT NULL UNIQUE,  -- Giá trị của tiêu chí lọc
    FOREIGN KEY (filter_id) REFERENCES Filters(filter_id)
);

CREATE TABLE ProductFilters (
    product_id INT,
    variant_id INT,  
    option_id INT,
    PRIMARY KEY (product_id, variant_id, option_id),  
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id),  
    FOREIGN KEY (option_id) REFERENCES FilterOptions(option_id)
);

--SELECT p.product_id, p.product_name, pv.variant_id, pv.price, pv.stock
--FROM Products p
--JOIN ProductVariants pv ON p.product_id = pv.product_id
--JOIN ProductFilters pf ON pv.variant_id = pf.variant_id
--JOIN FilterOptions fo ON pf.option_id = fo.option_id
--JOIN Filters f ON fo.filter_id = f.filter_id
--WHERE f.filter_name = 'Price Range'
--AND pv.price BETWEEN 50000 AND 300000;


--select * from Filters
--select * from FilterOptions
--select * from ProductFilters


ALTER TABLE Filters ADD min_value DECIMAL(10,2), max_value DECIMAL(10,2);
UPDATE Filters 
SET min_value = 0, max_value = 500000 
WHERE filter_name = 'Price Range';


DECLARE @CategoryFilterId INT, @BrandFilterId INT;

SELECT @CategoryFilterId = filter_id FROM Filters WHERE filter_name = 'Category';
SELECT @BrandFilterId = filter_id FROM Filters WHERE filter_name = 'Brand';

-- Thêm các tùy chọn cho Category (Danh mục sản phẩm)
INSERT INTO FilterOptions (filter_id, option_value)
VALUES
(@CategoryFilterId,N'Kẹo'),
(@CategoryFilterId,N'Snack'),
(@CategoryFilterId,N'Bánh mì'),
(@CategoryFilterId,N'Bánh quy'),		 
(@CategoryFilterId,N'Bánh bông lan'),	 
(@CategoryFilterId,N'Bánh ngọt'),		 
(@CategoryFilterId,N'Bánh gạo'),		 
(@CategoryFilterId,N'Nước uống có ga'),
(@CategoryFilterId,N'Nước uống đóng chai'),
(@CategoryFilterId,N'Nước uống trái cây'),
(@CategoryFilterId,N'Nước tăng lực'),
(@CategoryFilterId,N'Nước bù điện giải'),
(@CategoryFilterId,N'Trà và cà phê'),
(@CategoryFilterId,N'Sữa và sản phẩm từ sữa');

INSERT INTO FilterOptions (filter_id, option_value)
VALUES
(@BrandFilterId, N'Orion'),
(@BrandFilterId, N'Phạm Nguyên'),
(@BrandFilterId, N'Pepsico'),
(@BrandFilterId, N'Kinh Đô');
>>>>>>> origin/minhphuong

-- Bảng Suppliers (Nhà cung cấp)
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY IDENTITY(1,1),
    supplier_name NVARCHAR(255) NOT NULL, 
    supplier_code NVARCHAR(10) NOT NULL UNIQUE, -- Mã nhà cung cấp (VD: A, B, C)
    phone NVARCHAR(20), 
    email NVARCHAR(255), 
    address NVARCHAR(255)
<<<<<<< HEAD
	status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Deactive')) 
);

CREATE TABLE Discounts (
    discount_id INT IDENTITY(1,1) PRIMARY KEY,  -- Mã giảm giá
	 discount_code VARCHAR(50) UNIQUE NOT NULL,
    min_quantity INT,  -- Số lượng tối thiểu để áp dụng giảm giá
    min_order_value INT, -- Giá trị tối thiểu của đơn hàng (VND) để áp dụng giảm giá
    discount_percentage DECIMAL(5, 2),  -- Tỷ lệ giảm giá (ví dụ: 7% là 7.00)
    start_date DATETIME,  -- Ngày bắt đầu áp dụng
    end_date DATETIME,  -- Ngày kết thúc áp dụng (nếu có)
	max_uses INT NULL CHECK (max_uses > 0), 
    created_at DATETIME DEFAULT GETDATE(),
	status NVARCHAR(10) NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
=======
);


CREATE TABLE Discounts (
    discount_id INT IDENTITY(1,1) PRIMARY KEY,  -- Mã giảm giá
    min_quantity INT,  -- Số lượng tối thiểu để áp dụng giảm giá
    discount_percentage DECIMAL(5, 2),  -- Tỷ lệ giảm giá (ví dụ: 7% là 7.00)
    start_date DATETIME,  -- Ngày bắt đầu áp dụng
    end_date DATETIME,  -- Ngày kết thúc áp dụng (nếu có)
    created_at DATETIME DEFAULT GETDATE()
    
>>>>>>> origin/minhphuong
);

CREATE TABLE DiscountHistory (
    discount_history_id INT IDENTITY(1,1) PRIMARY KEY, -- Mã lịch sử thay đổi
    discount_id INT, -- Mã giảm giá
    old_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá trước khi thay đổi
    new_discount_percentage DECIMAL(5, 2), -- Tỷ lệ giảm giá sau khi thay đổi
    change_date DATETIME DEFAULT GETDATE(), -- Thời gian thay đổi
    changed_by INT, -- ID người thay đổi (nếu cần quản lý người thực hiện)
    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id),
    FOREIGN KEY (changed_by) REFERENCES Users(user_id) -- Nếu bạn muốn theo dõi ai đã thay đổi
);

CREATE TABLE BatchEntries (
    batch_entry_id INT PRIMARY KEY IDENTITY(1,1), 
    supplier_id INT NOT NULL,                      -- Mã nhà cung cấp
    entry_date DATETIME DEFAULT GETDATE(),         -- Ngày nhập
    batch_code NVARCHAR(50) NULL,                  -- Mã lô hàng (VD: A-123)
    created_at DATETIME DEFAULT GETDATE(),         -- Thời gian tạo
    updated_at DATETIME DEFAULT GETDATE(),         -- Thời gian cập nhật
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
);

CREATE TABLE BatchEntryDetails (
    entry_detail_id INT PRIMARY KEY IDENTITY(1,1),
    batch_entry_id INT NOT NULL,              -- Mã lô nhập kho
    variant_id INT NOT NULL,                  -- Mã phiên bản sản phẩm
    quantity INT NOT NULL,                    -- Số lượng nhập
    price DECIMAL(18, 2) NOT NULL,            -- Giá nhập
    manufactured_date DATE,                   -- Ngày sản xuất
    expiration_date DATE,                     -- Hạn sử dụng
	location NVARCHAR(255) NULL,
    FOREIGN KEY (batch_entry_id) REFERENCES BatchEntries(batch_entry_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
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
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
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

-- Bảng InventoryLog (Nhật ký quản lý nhập/xuất kho)
CREATE TABLE InventoryLog (
    log_id INT PRIMARY KEY IDENTITY(1,1),
--    warehouse_id INT NOT NULL, 
    product_id INT NOT NULL, 
    size_id INT NOT NULL, 
    quantity_change INT NOT NULL, 
    change_type NVARCHAR(50) NOT NULL, 
    change_reason NVARCHAR(255), 
    change_date DATETIME NOT NULL DEFAULT GETDATE(), 
--    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
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

-- Bảng Warehouses (Quản lý kho theo từng sản phẩm và kích thước)
--CREATE TABLE Warehouses (
--    warehouse_id INT PRIMARY KEY IDENTITY(1,1),
--    row_label CHAR(1) NOT NULL, 
--    product_id INT NOT NULL, 
--    size_id INT NOT NULL, 
--    quantity INT NOT NULL, 
--    FOREIGN KEY (product_id) REFERENCES Products(product_id),
--    FOREIGN KEY (size_id) REFERENCES Sizes(size_id)
--);


INSERT INTO dbo.ProductVariants
( product_id, size_id,price,stock)
VALUES
(1,1,34500,219),
(1,2,56000,300),
(2,1,36800,287),
(2,2,58000,155),
(3,2,58000,666),
(4,1,46000,148),
(5,1,33500,166),
(5,2,57600,246),
(6,1,35500,315),
(6,2,57800,215),
(7,1,38000,200),
(7,2,57200,321),
(8,1,35000,214),
(9,1,22500,176),
(10,1,22500,221),
(11,1,225000,244),
(12,2,56200,205),
(13,1,29700,156),
(14,2,32400,189),
(15,1,32000,167),
(15,2,535000,124),
(16,1,32000,154),
(16,2,53500,221),
(17,1,34600,112),
(18,1,34600,124),
(19,1,34600,221),
(20,1,14400,124),
(21,2,52700,95),
(22,3,130900,53),
(23,1,12600,124),
(24,1,8000,542),
(25,1,8000,531),
(26,1,8000,424),
(27,1,8000,531),
(28,1,6000,432),
(29,1,6000,435),
(30,1,11000,435),
(31,1,11000,322),
(32,1,11000,312),
(33,1,13000,312),
(34,1,13000,215),
(35,1,13000,321),
(36,1,6000,454),
(37,1,6000,412),
(38,1,6000,541),
(39,1,6000,531),
(40,1,6000,412),
(41,1,6000,542),
(42,1,6000,421),
(43,1,6000,541),
(44,1,19000,245),
(45,1,19000,412),
(46,1,19000,124),
(47,1,12400,214),
(48,1,12400,153),
(49,1,12400,85),
(50,1,12400,125),
(51,1,12400,318),
(52,1,12400,299),
(53,1,12400,312),
(54,2,37000,124),
(55,1,21000,251),
(56,1,24000,429),
(57,1,23000,252),
(58,2,23000,152),
(59,2,32000,499),
(60, 1, 35000, 312),
(60, 2, 45000, 320),
(61, 1, 25000, 245),
(61, 2, 35000, 250),
(62, 1, 19000, 401),
(62, 2, 25000, 311),
(63, 1, 30000, 376),
(64, 1, 22000, 199),
(65, 1, 28000, 450),
(66, 1, 52000, 214),
(66, 2, 59000, 200),
(67, 1, 50000, 365),
(67, 2, 60000, 351),
(68, 1, 51000, 410),
(69, 1, 50000, 198),
(70, 1, 55000, 275),
(70, 1, 65000, 215),
(71, 1, 15000, 322),
(71, 2, 25000, 222),
(72, 1, 17000, 410),
(73, 1, 18000, 155),
(74, 1, 16000, 478),
(75, 2, 50000, 236),
(76, 2, 55000, 319),
(77, 2, 55000, 402),
(78, 2, 55000, 278),
(79, 2, 65000, 153),
(80, 2, 60000, 495),
(81, 2, 50000, 189),
(82, 1, 34500, 219),
(82, 2, 56000, 300),
(83, 1, 36800, 287),
(83, 2, 58000, 155),
(84, 2, 58000, 666),
(85, 1, 46000, 148),
(86, 1, 33500, 166),
(87, 1, 34500, 230),
(88, 2, 58000, 270),
(89, 1, 36800, 200),
(90, 2, 58000, 210),
(91, 1, 46000, 180),
--Trung
(92,1,368000,100),
(93,1,368000,127),
(94,1,368000,126),
(95,1,368000,148),
(96,1,368000,166),
(97,1,368000,115),
(98,1,368000,100),
(99,1,416000,176),
(100,1,416000,121),
(101,1,416000,112),
(102,2,560000,105),
(103,1,416000,156),
(104,1,416000,189),
(105,1,416000,167),
(106,1,416000,154),
(107,1,459600,112),
(108,1,459600,124),
(109,1,459600,121),
(110, 1,459600,124),
(111,1,371000,95),
(112,1,371000,53),
(113,1,371000,124),
(114,1,371000,142),
(115,1,371000,131),
(116,1,371000,124),
(117,1,435000,131),
(118,1,435000,132),
(119,1,435000,135),
(120,1,435000,135),
(121,1,435000,122),
(122,1,435000,112),
(123,1,435000,112),
(124,1,435000,115),
(125,1,435000,121),
(126,1,435000,154),
(127,1,435000,112),
(128,1,319200,141),
(129,1,319200,131),
(130,1,319200,112),
(131,1,319200,142)



select* from Images	 i join Products p on i.product_id = p.product_id
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


-- Bảng TokenForgetPassword
CREATE TABLE TokenForgetPassword (
    id INT PRIMARY KEY IDENTITY(1,1),       -- ID tự động tăng
    token NVARCHAR(255) NOT NULL,          -- Token để reset mật khẩu
    expireTime DATETIME NOT NULL,          -- Thời gian hết hạn token
    isUsed BIT NOT NULL DEFAULT 0,         -- Trạng thái sử dụng token (0: chưa sử dụng, 1: đã sử dụng)
    user_id INT NOT NULL,                  -- Liên kết tới bảng Users
    FOREIGN KEY (user_id) REFERENCES Users(user_id) -- Khóa ngoại liên kết bảng Users
);
<<<<<<< HEAD
 

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
=======
DECLARE @category_id INT = NULL;  
DECLARE @brand_id INT = NULL;  
DECLARE @min_price DECIMAL(18,2) = 100000;  
DECLARE @max_price DECIMAL(18,2) = 200000;  

SELECT DISTINCT p.product_id, p.product_name, pv.price, pv.stock, b.brand_name, c.category_name
FROM Products p
JOIN Brands b ON p.brand_id = b.brand_id
JOIN Categories c ON p.category_id = c.category_id
JOIN ProductVariants pv ON p.product_id = pv.product_id
WHERE 
    (@category_id IS NULL OR p.category_id = @category_id) 
    AND (@brand_id IS NULL OR p.brand_id = @brand_id)
    AND (pv.price BETWEEN @min_price AND @max_price);
>>>>>>> origin/minhphuong
