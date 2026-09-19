USE graphql_db
GO

INSERT INTO Categories (name, icon)
VALUES
(N'Điện thoại', N'uploads\category\smartphones.png'),
(N'Laptop', N'uploads\category\laptops.png'),
(N'Phụ kiện', N'uploads\category\accessories.png');
GO

INSERT INTO Products
    (name, description, price, quantity, image, cate_id)
VALUES

-- Laptop
(N'HP Pavilion 14',
 N'Laptop HP Pavilion 14 phù hợp học tập và làm việc.',
 15490000, 11, NULL, 2),

(N'Acer Aspire 5',
 N'Laptop Acer Aspire 5 hiệu năng tốt trong tầm giá.',
 12990000, 13, NULL, 2),

-- Phụ kiện
(N'Chuột Logitech G102',
 N'Chuột gaming Logitech G102 có độ chính xác cao.',
 399000, 50, NULL, 3),

(N'Bàn phím cơ AKKO 5075B',
 N'Bàn phím cơ AKKO 5075B kết nối không dây.',
 1890000, 25, NULL, 3),

(N'Tai nghe Sony WH-1000XM5',
 N'Tai nghe chống ồn Sony WH-1000XM5.',
 7490000, 8, NULL, 3),

(N'Loa JBL Charge 5',
 N'Loa Bluetooth JBL Charge 5 chống nước.',
 3290000, 20, NULL, 3),

(N'Webcam Logitech C920',
 N'Webcam Logitech C920 Full HD.',
 1690000, 22, NULL, 3),

(N'USB Kingston 64GB',
 N'USB Kingston dung lượng 64GB.',
 189000, 60, N'uploads\product\USBKingston64GB.png', 3),

-- Điện thoại
(N'iPhone 15',
 N'Điện thoại Apple iPhone 15 chính hãng.',
 18990000, 20, N'uploads/product/iPhone15.png', 1),

(N'Samsung Galaxy S24',
 N'Điện thoại Samsung Galaxy S24 với hiệu năng mạnh mẽ.',
 17990000, 15, N'uploads/product/SamsungGalaxyS24.png', 1),

(N'Xiaomi Redmi Note 13',
 N'Điện thoại Xiaomi Redmi Note 13 màn hình AMOLED.',
 6990000, 30, N'uploads/product/XiaomiRedmiNote13.png', 1),

(N'OPPO Reno 11',
 N'Điện thoại OPPO Reno 11 thiết kế hiện đại.',
 9990000, 18, N'uploads/product/OPPOReno11.png', 1),

(N'Google Pixel 9',
 N'Điện thoại Google Pixel 9 với camera chất lượng cao.',
 19990000, 10, N'uploads/product/GooglePixel9.png', 1),

(N'iPhone 16',
 N'Điện thoại Apple iPhone 16 thế hệ mới.',
 21990000, 12, N'uploads/product/iPhone16.png', 1),

-- Laptop
(N'MacBook Air M2',
 N'Laptop Apple MacBook Air M2 13 inch.',
 24990000, 10, N'uploads/product/MacBookAirM2.png', 2),

(N'Dell Inspiron 15',
 N'Laptop Dell Inspiron 15 dành cho học tập và văn phòng.',
 15990000, 12, N'uploads/product/DellInspiron15.png', 2),

(N'ASUS Vivobook 15',
 N'Laptop ASUS Vivobook 15 hiệu năng ổn định.',
 13990000, 16, N'uploads/product/ASUSVivobook15.png', 2);
GO