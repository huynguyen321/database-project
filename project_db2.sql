create database quan_ly_web_truyen_tranh; 
use quan_ly_web_truyen_tranh;
-- create table
create table danhSachTacGia
(
id_tacGia int unsigned auto_increment primary key,
ten_TacGia varchar(100) not null
);

create table thongTinTruyen(
id_truyen int unsigned auto_increment primary key,
ten_truyen varchar(100) not null,
id_tacGia int unsigned,
tomTat varchar(1000),
namXuatBan int not null,
luotXem dec(10,0) not null default 0,
luotTheoDoi dec(10,0) not null default 0,
foreign key (id_tacGia) references danhSachTacGia(id_tacGia),
unique(id_truyen,id_tacGia)
);

create table tinhTrang
(
id_tinhTrang int primary key,
ten_tinhTrang varchar(15) not null
);

create table theLoai
(
id_theLoai int unsigned auto_increment primary key,
ten_theLoai varchar(15) not null
);

create table tinhTrangTruyen
(
id_truyen int unsigned primary key,
tongSoChuong int not null default 0,
ngay_capNhat date ,
ngay_hoanThanh date default null,
id_tinhTrang int,
foreign key (id_truyen) references thongTinTruyen(id_truyen),
foreign key (id_tinhTrang) references tinhTrang(id_tinhTrang)
);

create table danhsachChuongTruyen(
id_truyen int unsigned not null,
soChuong int not null default 0,
ngay_capNhat datetime,
luotXem dec(8,0) not null default 0,
foreign key (id_truyen) references thongTinTruyen(id_truyen)
);

create table phanTruyenTheoTheLoai
(
id_truyen int unsigned,
id_theLoai int unsigned,
foreign key (id_truyen) references thongTinTruyen(id_truyen),
foreign key (id_theLoai) references theLoai(id_theLoai),
unique (id_truyen,id_theloai)
);

create table nhomDich
(
id_nhom int unsigned auto_increment primary key,
ten_nhom varchar(30),
ngay_thanhLap datetime,
so_thanhVien int default 0
);

create table TaiKhoanNguoiDung
(
id_nguoiDung int unsigned auto_increment primary key,
ten_dangNhap varchar(20) not null unique,
matKhau varchar(100),
ten_hienThi varchar(50) unique,
email varchar(60) not null unique,
soDienThoai varchar(11) default null
);

create table thanhVienNhomDich(
id_nguoiDung int unsigned not null,
id_nhom int unsigned not null,
foreign key (id_nguoiDung) references TaiKhoanNguoiDung(id_nguoiDung),
foreign key (id_nhom) references nhomDich(id_nhom),
unique(id_nhom,id_nguoiDung)
);

create table bookMarkCuaNguoiDung(
id_nguoiDung int unsigned not null,
id_truyen int unsigned not null,
foreign key (id_nguoiDung) references TaiKhoanNguoiDung(id_nguoiDung),
foreign key (id_truyen) references thongTinTruyen(id_truyen),
unique(id_nguoiDung,id_truyen)
);

create table du_an
(
id_nhom int unsigned not null,
id_truyen int unsigned not null,
foreign key (id_nhom) references nhomDich(id_nhom),
foreign key (id_truyen) references thongTinTruyen(id_truyen)
);

-- bang luu lich su cac hoat dong nhu them tai khoan, dang truyen
create table historyActivity(
id_history int unsigned primary key auto_increment,
history varchar(250) not null
);

-- chen du lieu vao bang

-- 1.bang danhSachTacGia
INSERT INTO danhSachTacGia (ten_TacGia) VALUES ('Thien Tam Tho Dau'), 
('Mitsuki Miko'),
('Tsutsui Taishi'),
('Tabata Yuuki'),
('Akamatsu Ken'),
('Inoue Kenji');

select * from danhSachTacGia;

-- 2.bang thongTinTruyen
INSERT INTO thongTinTruyen(ten_truyen,id_tacGia,tomTat,namXuatBan) VALUES ('Đấu phá thương khung', '1', 'Đấu Phá Thương Khung là một câu chuyện huyền huyễn đặc sắc kể về Tiêu Viêm, một thiên chi kiêu tử với thiên phú tu luyện mà ai ai cũng hâm mộ, bỗng một ngày người mẹ mất đi đễ lại di vật là một chiếc giới chỉ màu đen nhưng từ khi đó Tiêu Viêm đã mất đi thiên phú tu luyện của mình', '2008'),
('Võ động càn khôn', '1', 'Con đường tu luyện, chính là trộm đi âm dương, đoạt lấy tạo hóa, chuyển đổi Niết Bàn, nắm giữ sinh tử, chưởng quản Luân Hồi.', '2010'),
('Đại chúa tể', '1', 'Đại thế giới, vị diện giao hội, vạn tộc mọc lên san sát như rừng, quần hùng tập trung, một vị từ tương lai Hạ vị diện đích Thiên chi Chí tôn, tại đây Vô Tận Thế Giới, diễn lại làm cho người hướng tới Truyền Kỳ, truy cầu lấy cái kia chúa tể chi lộ.Vô tận hỏa vực, Viêm Đế chấp chưởng, Vạn Hỏa đốt Thương Khung.Võ Cảnh ở trong, Vũ tổ chi uy, chấn nhiếp Càn Khôn.Tây Thiên chi điện, bách chiến chi hoàng, chiến uy không thể địch.Bắc Hoang chi khâu, Vạn Mộ chi địa, Bất Tử chi chủ trấn Thiên địa.', '2013'),
('Nguyên tôn', '1', 'Một tác phẩm mới của Thiên Tằm Thổ Đậu Ta có một ngụm Huyền Hoàng Khí, có thể nuốt thiên địa nhật nguyệt tinh. ......... Lúc đó đường về, đã là một con đường vận mệnh treo ngược. Ngày xưa vinh hoa, như thay đổi khôn lường, một giấc ác mộng dài. Thiếu niên chấp bút, Long Xà bay động. Là vì một vòng quang mang bổ ra dáng vẻ nặng nề chi loạn thế, vấn đỉnh điện ngọc thương khung. Đường báo thù, cùng ta đồng hành. Một ngụm Huyền Hoàng chân khí nhất định nuốt thiên địa nhật nguyệt tinh thần, hùng thị cỏ cây thương sinh. Thiết họa tịch chiếu, vụ ải ngân câu, bút tẩu du long xông Cửu Châu. Hoành tư thiên hạ, mực vẩy thanh sơn, thôn tính biển hồ nạp trăm sông.', '2015'),
('Ma thú kiếm thánh', '1', 'Dạ Lan đại lục, thế giới của kiếm và ma pháp. Cá lớn nuốt cá bé, cường giả vi tôn. Bất luận địa vị cao thượng như thế nào, đều được thiết lập dựa trên thực lực.Sức mạnh quyết định tất cả. ', '2019'),
('\"Aishiteru\", Uso dakedo', '2', 'Anh ta là một kẻ nói dối. Anh ta là một player. Anh ta là tồi tệ nhất. Thậm chí tôi biết điều đó ... Nhưng tại sao tôi lại rơi vào tình yêu với anh ta?', '2016'),
('Virgin Blood - Hiiro No Bansan', '2', 'Chuyện tình giữa một Vampire và một con người - thứ mà mọi Vampire khát máu đều xem là thức ăn', '2016'),

('We can\'t study!(Bokutachi Wa Benkyou Ga Dekinai)', '3', 'Sẽ ra sao nếu bạn phải làm gia sư văn học cho một thiên tài toán và toán cho một đứa thiên tài văn học. Hãy trải nghiệm cùng với nhân vật chính của chúng ta, một học sinh tuy chẳng phải thiên tài nhưng phải nhận trách nhiệm gian lao này.',2016),
('Magical Patissier Kosaki-chan', '3', 'TSUTSUI TAISHI lấy cảm hứng từ NISEKOI của KOMI NAOSHI (một thời gây mưa làm gió trên Weekly Shonen Jump) để mà sáng tác ra manga này.Một manga rất hay và không nên bỏ qua nếu bạn từng là FAN của NISEKOI',2014),

('Black Clover', '4', 'Aster và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi sô chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực.',2015),

('Bậc Thầy Ma Pháp(Mahou Sensei Negima!)', '5', 'Negi Springfield, một cậu bé 10 tuổi, vừa hoàn thành khóa học Pháp sư (Mage) tại một nơi nào đó thuộc xứ Wales. Trong tấm bằng tốt nghiệp của mình, Negi nhận nhiệm vụ cho cuộc tập huấn, tiến tới một bước cao hơn là trở thành một Magister Magi.',2013),
('UQ Holder(Mahou Sensei Negima!2)', '5', 'Câu truyện là phần tiếp theo nối tiếp bộ truyện đình đám một thời Mahou Sensei Negima! với anh Main chính là cháu nội của Negima Sensei chứ không đâu xa.',2015),

('Grand Blue', '6', 'Câu chuyện xoay quanh Kitahara Iori được bắt đầu một cuộc sống mới tại một trường đại học gần biển ở thành phố Izu. ở đó cậu gặp được một cô gái thích lặn và tiếp theo đó sẽ diễn biến thế nào đọc rồi sẽ rõ',2019);

select * from thongTinTruyen;

-- 3.bang tinhTrang
INSERT INTO tinhTrang VALUES (1,'Đang tiến hành'),(2,'Tạm ngưng'),(3,'Ngưng'),(4,'Đã hoàn thành');

select * from tinhTrang;

-- 4.bang theLoai
INSERT INTO theLoai(ten_theloai) VALUES ('Action'),('Adventure'),
('Chuyển sinh'),('Comedy'),('Drama'),('Fantasy'),('Harem'),('Isekai'),
('Shoujo'),('Shounen'),('School of life'),('Sci-fi'),('Manga'),('Manhua'),('Hài hước');

select * from theLoai;

-- 5.bang phanTruyenTheoTheLoai

insert into phanTruyenTheoTheLoai values (1,1),(1,2), (1,4), (1,5), (1,6),(1,7),(1,8), (1,10), (1,14);
insert into phanTruyenTheoTheLoai values (2,1),(2,2), (2,4), (2,5), (2,6),(2,7),(2,8), (2,10), (2,14);
insert into phanTruyenTheoTheLoai values (3,1),(3,2), (3,4), (3,5), (3,6),(3,7),(3,8), (3,10), (3,14);
insert into phanTruyenTheoTheLoai values (4,1),(4,2), (4,4), (4,5), (4,6),(4,7),(4,8), (4,10), (4,14);
insert into phanTruyenTheoTheLoai values (5,1),(5,2), (5,4), (5,6),(5,7),(5,8), (5,9), (5,14);

insert into phanTruyenTheoTheLoai values (6,4),(6,9),(6,13);
insert into phanTruyenTheoTheLoai values (7,4),(7,9),(7,11),(7,13),(7,15);

insert into phanTruyenTheoTheLoai values (8,4),(8,5),(8,7),(8,9),(8,10),(8,11),(8,13),(8,15);
insert into phanTruyenTheoTheLoai values (9,2),(9,4),(9,5),(9,6),(9,7),(9,9),(9,11),(9,13),(9,15);

insert into phanTruyenTheoTheLoai values (10,1),(10,2),(10,4), (10,5), (10,6),(10,8), (10,10),(10,11), (10,13);

insert into phanTruyenTheoTheLoai values (11,1),(11,2),(11,4), (11,5), (11,6),(11,7),(11,8),(11,9), (11,10),(11,11),(11,12), (11,13),(11,15);
insert into phanTruyenTheoTheLoai values (12,1),(12,2),(12,4), (12,5), (12,6),(12,7),(12,8),(12,10),(12,11),(12,12), (12,13),(12,15);

insert into phanTruyenTheoTheLoai values (13,2),(13,4),(13,7),(13,9),(13,10),(13,11),(13,13),(13,15);

select * from phanTruyenTheoTheLoai;

-- 6.bang tinhTrangTruyen
INSERT INTO tinhTrangTruyen (`id_truyen`, `tongSoChuong`, `ngay_capNhat`, `ngay_hoanThanh`, `id_tinhTrang`)
 VALUES ('1', '280', '2020-04-25', null, '2'),
 (2, '103', '2020-06-05', null, '1'),
(3, '193', '2020-07-05', null, '1'),
(4, '206', '2020-04-04',null, '1'),
(5, '76', '2020-07-05', null, '1'),
(6, '1', '2016-09-25', '2016-09-25', '4'),
(7, '8', '2015-03-17', null, '3'),
(8, '164', '2020-07-01',null, '1'),
(9, '27', '2018-09-05', null, '3'),
(10, '254', '2020-06-29', null, '1'),
(11, '355', '2015-09-20', '2015-09-20', '4'),
(12, '172', '2020-05-05', null, '2'),
(13,'61','2020-09-01',null,'1');

select * from tinhTrangTruyen;

-- 7.bang danhSachChuongTruyen
INSERT INTO danhSachChuongTruyen VALUES ('1', '240', '2016-12-25 00:00:00', '2458'),
('1', '241', '2017-01-25 00:00:00', '2468'),('1', '242', '2017-02-25 00:00:00', '2479'),('1', '243', '2017-03-25 00:00:00', '2489'),
('1', '244', '2017-04-25 00:00:00', '2499'),('1', '245', '2017-05-25 00:00:00', '2509'),('1', '246', '2017-06-25 00:00:00', '2520'),
('1', '247', '2017-07-25 00:00:00', '2530'),('1', '248', '2017-08-25 00:00:00', '2540'),('1', '249', '2017-09-25 00:00:00', '2550'),
('1', '250', '2017-10-25 00:00:00', '2561'),('1', '251', '2017-11-25 00:00:00', '2571'),('1', '252', '2017-12-25 00:00:00', '2581'),
('1', '253', '2018-01-25 00:00:00', '2591'),('1', '254', '2018-02-25 00:00:00', '2602'),('1', '255', '2018-03-25 00:00:00', '2612'),
('1', '256', '2018-04-25 00:00:00', '2622'),('1', '257', '2018-05-25 00:00:00', '2632'),('1', '258', '2018-06-25 00:00:00', '2643'),
('1', '259', '2018-07-25 00:00:00', '2653'),('1', '260', '2018-08-25 00:00:00', '2663'),('1', '261', '2018-09-25 00:00:00', '2673'),
('1', '262', '2018-10-25 00:00:00', '2684'),('1', '263', '2018-11-25 00:00:00', '2694'),('1', '264', '2018-12-25 00:00:00', '2704'),
('1', '265', '2019-01-25 00:00:00', '2714'),('1', '266', '2019-02-25 00:00:00', '2724'),('1', '267', '2019-03-25 00:00:00', '2735'),
('1', '268', '2019-04-25 00:00:00', '2745'),('1', '269', '2019-05-25 00:00:00', '2755'),('1', '270', '2019-06-25 00:00:00', '2765'),
('1', '271', '2019-07-25 00:00:00', '2776'),('1', '272', '2019-08-25 00:00:00', '2786'),('1', '273', '2019-09-25 00:00:00', '2796'),
('1', '274', '2019-10-25 00:00:00', '2806'),('1', '275', '2019-11-25 00:00:00', '2817'),('1', '276', '2019-12-25 00:00:00', '2827'),
('1', '277', '2020-01-25 00:00:00', '2837'),('1', '278', '2020-02-25 00:00:00', '2847'),('1', '279', '2020-03-25 00:00:00', '2858'),
('1', '280', '2020-04-25 00:00:00', '2868'),('2', '83', '2018-10-05 00:00:00', '833'),('2', '84', '2018-11-05 00:00:00', '843'),
('2', '85', '2018-12-05 00:00:00', '853'),('2', '86', '2019-01-05 00:00:00', '863'),('2', '87', '2019-02-05 00:00:00', '873'),
('2', '88', '2019-03-05 00:00:00', '883'),('2', '89', '2019-04-05 00:00:00', '894'),('2', '90', '2019-05-05 00:00:00', '904'),
('2', '91', '2019-06-05 00:00:00', '914'),('2', '92', '2019-07-05 00:00:00', '924'),('2', '93', '2019-08-05 00:00:00', '934'),
('2', '94', '2019-09-05 00:00:00', '944'),('2', '95', '2019-10-05 00:00:00', '954'),('2', '96', '2019-11-05 00:00:00', '964'),
('2', '97', '2019-12-05 00:00:00', '974'),('2', '98', '2020-01-05 00:00:00', '984'),('2', '99', '2020-02-05 00:00:00', '994'),
('2', '100', '2020-03-05 00:00:00', '1004'),('2', '101', '2020-04-05 00:00:00', '1014'),('2', '102', '2020-05-05 00:00:00', '1024'),
('2', '103', '2020-06-05 00:00:00', '1034'),('3', '173', '2018-11-05 00:00:00', '1737'),('3', '174', '2018-12-05 00:00:00', '1747'),
('3', '175', '2019-01-05 00:00:00', '1757'),('3', '176', '2019-02-05 00:00:00', '1767'),('3', '177', '2019-03-05 00:00:00', '1777'),
('3', '178', '2019-04-05 00:00:00', '1787'),('3', '179', '2019-05-05 00:00:00', '1797'),('3', '180', '2019-06-05 00:00:00', '1807'),
('3', '181', '2019-07-05 00:00:00', '1817'),
('3', '182', '2019-08-05 00:00:00', '1827'),('3', '183', '2019-09-05 00:00:00', '1837'),('3', '184', '2019-10-05 00:00:00', '1847'),
('3', '185', '2019-11-05 00:00:00', '1857'),('3', '186', '2019-12-05 00:00:00', '1867'),('3', '187', '2020-01-05 00:00:00', '1877'),
('3', '188', '2020-02-05 00:00:00', '1887'),('3', '189', '2020-03-05 00:00:00', '1897'),('3', '190', '2020-04-05 00:00:00', '1908'),
('3', '191', '2020-05-05 00:00:00', '1918'),('3', '192', '2020-06-05 00:00:00', '1928'),('3', '193', '2020-07-05 00:00:00', '1938'),
('4', '196', '2019-06-04 00:00:00', '1968'),('4', '197', '2019-07-04 00:00:00', '1978'),('4', '198', '2019-08-04 00:00:00', '1988'),
('4', '199', '2019-09-04 00:00:00', '1998'),('4', '200', '2019-10-04 00:00:00', '2008'),('4', '201', '2019-11-04 00:00:00', '2018'),
('4', '202', '2019-12-04 00:00:00', '2028'),('4', '203', '2020-01-04 00:00:00', '2038'),('4', '204', '2020-02-04 00:00:00', '2048'),
('4', '205', '2020-03-04 00:00:00', '2058'),('4', '206', '2020-04-04 00:00:00', '2068'),('5', '66', '2019-09-05 00:00:00', '663'),
('5', '67', '2019-10-05 00:00:00', '673'),('5', '68', '2019-11-05 00:00:00', '683'),('5', '69', '2019-12-05 00:00:00', '693'),
('5', '70', '2020-01-05 00:00:00', '703'),('5', '71', '2020-02-05 00:00:00', '713'),('5', '72', '2020-03-05 00:00:00', '723'),
('5', '73', '2020-04-05 00:00:00', '733'),('5', '74', '2020-05-05 00:00:00', '743'),('5', '75', '2020-06-05 00:00:00', '753'),
('5', '76', '2020-07-05 00:00:00', '763'),('6', '1', '2016-09-25 00:00:00', '72188'),('7', '1', '2014-08-17 00:00:00', '2100'),
('7', '2', '2014-09-17 00:00:00', '2500'),('7', '3', '2014-10-17 00:00:00', '2420'),('7', '4', '2014-11-17 00:00:00', '1923'),
('7', '5', '2014-12-17 00:00:00', '2502'),('7', '6', '2015-01-17 00:00:00', '2180'),('7', '7', '2015-02-17 00:00:00', '2800'),
('7', '8', '2015-03-17 00:00:00', '2680'),('8', '149', '2019-04-01 00:00:00', '2980'),('8', '150', '2019-05-01 00:00:00', '1506'),
('8', '151', '2019-06-01 00:00:00', '1516'),('8', '152', '2019-07-01 00:00:00', '1526'),('8', '153', '2019-08-01 00:00:00', '1536'),
('8', '154', '2019-09-01 00:00:00', '1546'),('8', '155', '2019-10-01 00:00:00', '1556'),('8', '156', '2019-11-01 00:00:00', '1566'),
('8', '157', '2019-12-01 00:00:00', '1576'),('8', '158', '2020-01-01 00:00:00', '1586'),('8', '159', '2020-02-01 00:00:00', '1596'),
('8', '160', '2020-03-01 00:00:00', '1606'),('8', '161', '2020-04-01 00:00:00', '1616'),('8', '162', '2020-05-01 00:00:00', '1626'),
('8', '163', '2020-06-01 00:00:00', '1636'),('8', '164', '2020-07-01 00:00:00', '1646'),('9', '1', '2016-07-05 00:00:00', '2574'),
('9', '2', '2016-08-05 00:00:00', '2772'),('9', '3', '2016-09-05 00:00:00', '2970'),('9', '4', '2016-10-05 00:00:00', '3168'),
('9', '5', '2016-11-05 00:00:00', '3366'),('9', '6', '2016-12-05 00:00:00', '3564'),('9', '7', '2017-01-05 00:00:00', '3762'),
('9', '8', '2017-02-05 00:00:00', '3960'),('9', '9', '2017-03-05 00:00:00', '4158'),('9', '10', '2017-04-05 00:00:00', '4356'),
('9', '11', '2017-05-05 00:00:00', '4554'),('9', '12', '2017-06-05 00:00:00', '4752'),('9', '13', '2017-07-05 00:00:00', '1976'),
('9', '14', '2017-08-05 00:00:00', '2128'),('9', '15', '2017-09-05 00:00:00', '2280'),('9', '16', '2017-10-05 00:00:00', '2432'),
('9', '17', '2017-11-05 00:00:00', '2584'),('9', '18', '2017-12-05 00:00:00', '2736'),('9', '19', '2018-01-05 00:00:00', '2888'),
('9', '20', '2018-02-05 00:00:00', '3040'),('9', '21', '2018-03-05 00:00:00', '3192'),('9', '22', '2018-04-05 00:00:00', '3344'),
('9', '23', '2018-05-05 00:00:00', '3496'),('9', '24', '2018-06-05 00:00:00', '3648'),('9', '25', '2018-07-05 00:00:00', '3800'),
('9', '26', '2018-08-05 00:00:00', '3952'),('9', '27', '2018-09-05 00:00:00', '4104'),('10', '240', '2020-06-15 00:00:00', '2410'),
('10', '241', '2020-06-16 00:00:00', '2420'),('10', '242', '2020-06-17 00:00:00', '2430'),('10', '243', '2020-06-18 00:00:00', '2440'),
('10', '244', '2020-06-19 00:00:00', '2450'),('10', '245', '2020-06-20 00:00:00', '2460'),('10', '246', '2020-06-21 00:00:00', '2470'),
('10', '247', '2020-06-22 00:00:00', '2480'),('10', '248', '2020-06-23 00:00:00', '2490'),('10', '249', '2020-06-24 00:00:00', '2500'),
('10', '250', '2020-06-25 00:00:00', '2510'),('10', '251', '2020-06-26 00:00:00', '2520'),('10', '252', '2020-06-27 00:00:00', '2530'),
('10', '253', '2020-06-28 00:00:00', '2540'),('10', '254', '2020-06-29 00:00:00', '2550'),('11', '342', '2014-08-20 00:00:00', '3434'),
('11', '343', '2014-09-20 00:00:00', '3444'),('11', '344', '2014-10-20 00:00:00', '3454'),('11', '345', '2014-11-20 00:00:00', '3464'),
('11', '346', '2014-12-20 00:00:00', '3474'),('11', '347', '2015-01-20 00:00:00', '3484'),('11', '348', '2015-02-20 00:00:00', '3494'),
('11', '349', '2015-03-20 00:00:00', '3504'),('11', '350', '2015-04-20 00:00:00', '3514'),('11', '351', '2015-05-20 00:00:00', '3524'),
('11', '352', '2015-06-20 00:00:00', '3534'),('11', '353', '2015-07-20 00:00:00', '3544'),('11', '354', '2015-08-20 00:00:00', '3554'),
('11', '355', '2015-09-20 00:00:00', '3564'),('12', '163', '2019-08-05 00:00:00', '1636'),('12', '164', '2019-09-05 00:00:00', '1646'),
('12', '165', '2019-10-05 00:00:00', '1657'),('12', '166', '2019-11-05 00:00:00', '1667'),('12', '167', '2019-12-05 00:00:00', '1677'),
('12', '168', '2020-01-05 00:00:00', '1687'),('12', '169', '2020-02-05 00:00:00', '1697'),('12', '170', '2020-03-05 00:00:00', '1707'),
('12', '171', '2020-04-05 00:00:00', '1717'),('12', '172', '2020-05-05 00:00:00', '1727'),('13', '51', '2019-11-01 00:00:00', '2069'),
('13', '52', '2019-12-01 00:00:00', '2109'),('13', '53', '2020-01-01 00:00:00', '2150'),('13', '54', '2020-02-01 00:00:00', '2190'),
('13', '55', '2020-03-01 00:00:00', '2231'),('13', '56', '2020-04-01 00:00:00', '2271'),('13', '57', '2020-05-01 00:00:00', '2312'),
('13', '58', '2020-06-01 00:00:00', '2352'),('13', '59', '2020-07-01 00:00:00', '2393'),('13', '60', '2020-08-01 00:00:00', '2434'),
('13', '61', '2020-09-01 00:00:00', '2474');

select * from danhSachChuongTruyen;

-- 8.bang taiKhoanNguoiDung
INSERT INTO taiKhoanNguoiDung VALUES ('1', 'account_101', '123456789', 'hoa_dang', 'hoa_dang1605@gmail.com', '01834306599');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES
 ('2', 'account_102', '123456789', 'mai_ngoc', 'mai_ngoc395@gmail.com'),
 ('3', 'account_103', '123456789', 'manh_meme', 'manh_meme977@gmail.com');
 
INSERT INTO taiKhoanNguoiDung  VALUES 
('4', 'account_104', '123456789', 'huan_vippro123', 'huan_vippro123516@gmail.com', '05427667610'),
('5', 'account_105', '123456789', 'nam_cute', 'nam_cute1771@gmail.com', '03825446098');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`)
 VALUES 
 ('6', 'account_106', '123456789', 'duong_nguyen', 'duong_nguyen1030@gmail.com'),
 ('7', 'account_107', '123456789', 'hoa_olala', 'hoa_olala841@gmail.com'),
 ('8', 'account_108', '123456789', 'mai_vippro123', 'mai_vippro1232002@gmail.com');
 
INSERT INTO taiKhoanNguoiDung VALUES ('9', 'account_109', '123456789', 'nam_olala', 'nam_olala463@gmail.com', '05400624217');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) 
VALUES 
('10', 'account_110', '123456789', 'sy_cute', 'sy_cute1930@gmail.com'),
('11', 'account_111', '123456789', 'manh_vippro123', 'manh_vippro1231617@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES 
('12', 'account_112', '123456789', 'thu_dang', 'thu_dang2008@gmail.com', '06621558441'),
('13', 'account_113', '123456789', 'nam_nguyen', 'nam_nguyen1559@gmail.com', '07948500385'),
('14', 'account_114', '123456789', 'linh_lala', 'linh_lala1900@gmail.com', '07289180725');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES 
('15', 'account_115', '123456789', 'long_mega', 'long_mega538@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES ('16', 'account_116', '123456789', 'quan_vippro123', 'quan_vippro123913@gmail.com', '03445684328');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES
 ('17', 'account_117', '123456789', 'tuan_meme', 'tuan_meme1198@gmail.com'),
('18', 'account_118', '123456789', 'huan_dang', 'huan_dang49@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES ('19', 'account_119', '123456789', 'nam_meme', 'nam_meme867@gmail.com', '03489903833');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES 
('20', 'account_120', '123456789', 'ha_olala', 'ha_olala1658@gmail.com'),
('21', 'account_121', '123456789', 'duong_olala', 'duong_olala1040@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES ('22', 'account_122', '123456789', 'vi_123', 'vi_1231584@gmail.com', '07590467871');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES 
('23', 'account_123', '123456789', 'mai_dang', 'mai_dang1844@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES 
('24', 'account_124', '123456789', 'ha_cute', 'ha_cute1218@gmail.com', '07182971940'),
('25', 'account_125', '123456789', 'hoang_olala', 'hoang_olala346@gmail.com', '05332800366');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES 
('26', 'account_126', '123456789', 'linh_ngoc', 'linh_ngoc150@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES 
('27', 'account_127', '123456789', 'hoa_bui', 'hoa_bui799@gmail.com', '02558484990'),
('28', 'account_128', '123456789', 'linh_olala', 'linh_olala1053@gmail.com', '04160685991');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES 
('29', 'account_129', '123456789', 'sang_meme', 'sang_meme1606@gmail.com'),
('30', 'account_130', '123456789', 'tuan_dang', 'tuan_dang1587@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES 
('31', 'account_131', '123456789', 'tuan_cute', 'tuan_cute1950@gmail.com', '03816535784'),
('32', 'account_132', '123456789', 'phat_lala', 'phat_lala1186@gmail.com', '02577661505');

INSERT INTO taiKhoanNguoiDung (`id_nguoiDung`, `ten_dangNhap`, `matKhau`, `ten_hienThi`, `email`) VALUES ('33', 'account_133', '123456789', 'mai_le', 'mai_le1701@gmail.com');

INSERT INTO taiKhoanNguoiDung VALUES
('34', 'account_134', '123456789', 'vuong_lala', 'vuong_lala285@gmail.com', '02009787415'),
('35', 'account_135', '123456789', 'huy_dang', 'huy_dang923@gmail.com', '08201670849');

select * from taiKhoanNguoiDung;

-- 9.Bang nhomDich
INSERT INTO nhomDich(ten_nhom,ngay_thanhLap) values
('[S]ky [G]arden [Group]','2016-2-24'),
('Eden','2017-5-21'),
('Vui team','2018-9-2'),
('T.K Translation Team ','2018-10-4');

select * from nhomDich;

-- 10.Bang thanh vien nhom
INSERT INTO thanhVienNhomDich values
(1,1),(3,1),(5,1),(7,1),(2,2),(8,2),(10,2),(30,3),(9,4),(18,4);

select * from thanhVienNhomDich;

-- 11.Bang Du_an
INSERT INTO du_an values
(1,1),(1,2),(1,3),(1,4),(1,13),
(2,5),(2,7),(2,8),(2,9),
(3,6),
(4,10),(4,11),(4,12);

select * from du_an;

-- 12.Bang bookmark cua nguoi dung
INSERT INTO bookmarkCuaNguoiDung VALUES 
('1', '1'),('1', '2'),('1', '3'),('1', '4'),('1', '5'),('1', '6'),('1', '7'),
('1', '8'),('1', '9'),('1', '10'),('1', '11'),('1', '12'),('1', '13'),
('2', '1'),('2', '2'),('2', '3'),('2', '4'),('2', '5'),('2', '6'),('2', '7'),
('2', '8'),('2', '9'),('2', '10'),('2', '11'),('2', '12'),('2', '13'),
('3', '1'),('3', '2'),('3', '3'),('3', '4'),('3', '5'),('3', '6'),('3', '7'),
('3', '8'),('3', '9'),('3', '10'),('3', '11'),('3', '12'),('3', '13'),('4', '1'),
('4', '2'),('4', '3'),('4', '4'),('4', '5'),('4', '6'),('4', '7'),('4', '8'),('4', '9'),
('4', '10'),('4', '11'),('4', '12'),('5', '1'),('5', '2'),('5', '3'),('5', '4'),('5', '5'),
('5', '6'),('5', '7'),('5', '8'),('5', '9'),('5', '10'),('5', '11'),('5', '12'),('5', '13'),
('6', '1'),('6', '2'),('6', '3'),('6', '4'),('6', '5'),('7', '1'),('7', '2'),('7', '3'),('7', '4'),
('7', '5'),('7', '6'),('7', '7'),('7', '8'),('7', '9'),('7', '10'),('7', '11'),('9', '1'),('9', '2'),
('9', '3'),('9', '4'),('9', '5'),('9', '6'),('9', '7'),('9', '8'),('9', '9'),('9', '10'),('9', '11'),
('9', '12'),('9', '13'),('10', '1'),('10', '2'),('10', '3'),('10', '4'),('10', '5'),('10', '6'),
('10', '7'),('10', '8'),('10', '9'),('11', '1'),('11', '2'),('11', '3'),('11', '4'),('11', '5'),
('11', '6'),('11', '7'),('11', '8'),('11', '9'),('11', '10'),('11', '11'),('11', '12'),('11', '13'),
('12', '1'),('12', '2'),('12', '3'),('12', '4'),('12', '5'),('12', '6'),('12', '7'),('12', '8'),
('12', '9'),('12', '10'),('12', '11'),('13', '1'),('13', '2'),('13', '3'),('13', '4'),('13', '5'),
('13', '6'),('13', '7'),('14', '1'),('14', '2'),('14', '3'),('14', '4'),('14', '5'),('14', '6'),
('14', '7'),('14', '8'),('14', '9'),('14', '10'),('14', '11'),('14', '12'),('14', '13'),
('15', '1'),('15', '2'),('15', '3'),('15', '4'),('15', '5'),('15', '6'),
('15', '7'),('15', '8'),('15', '9'),('15', '10'),
('16', '1'),('16', '2'),('16', '3'),('16', '4'),('16', '5'),('16', '6'),
('16', '7'),('16', '8'),('17', '1'),('17', '2'),('17', '3'),('17', '4'),
('17', '5'),('17', '6'),('17', '7'),('17', '8'),('17', '9'),('17', '10'),
('18', '1'),('18', '2'),('18', '3'),('18', '4'),('18', '5'),('18', '6'),
('18', '7'),('18', '8'),('18', '9'),('18', '10'),('19', '1'),('19', '2'),
('19', '3'),('19', '4'),('19', '5'),('19', '6'),('19', '7'),('20', '1'),
('20', '2'),('20', '3'),('20', '4'),('20', '5'),('20', '6'),('20', '7'),
('20', '8'),('21', '1'),('21', '2'),('21', '3'),('21', '4'),('21', '5'),
('22', '1'),('22', '2'),('22', '3'),('22', '4'),('22', '5'),('22', '6'),
('22', '7'),('23', '1'),('23', '2'),('23', '3'),('23', '4'),('23', '5'),
('23', '6'),('24', '1'),('24', '2'),('24', '3'),('24', '4'),('24', '5'),
('24', '6'),('24', '7'),('24', '8'),('25', '1'),('25', '2'),('25', '3'),
('25', '4'),('25', '5'),('25', '6'),('25', '7'),('25', '8'),('26', '1'),
('26', '2'),('26', '3'),('26', '4'),('26', '5'),('26', '6'),('26', '7'),
('26', '8'),('26', '9'),('26', '10'),('26', '11'),('26', '12'),('27', '1'),
('27', '2'),('27', '3'),('27', '4'),('27', '5'),('27', '6'),('27', '7'),
('27', '8'),('27', '9'),('27', '10'),('28', '1'),('28', '2'),('28', '3'),
('28', '4'),('28', '5'),('28', '6'),('28', '7'),('28', '8'),('28', '9'),
('29', '1'),('29', '2'),('29', '3'),('29', '4'),('29', '5'),('29', '6'),
('30', '7'),('30', '8'),('30', '9'),('30', '10'),('30', '11'),('30', '12'),
('30', '13'),('31', '1'),('31', '2'),('31', '3'),('31', '4'),('31', '5'),
('31', '6'),('31', '7'),('31', '8'),('31', '9'),('31', '10'),('31', '11'),
('32', '1'),('32', '2'),('32', '3'),('32', '4'),('32', '5'),('32', '6'),
('32', '7'),('33', '1'),('33', '2'),('33', '3'),('33', '4'),('33', '5'),
('33', '6'),('33', '7'),('33', '8'),('33', '9'),('33', '10'),('33', '11'),
('33', '12'),('33', '13'),('34', '1'),('34', '2'),('34', '3'),('34', '4'),
('34', '5'),('34', '6'),('34', '7'),('34', '8'),('35', '1'),('35', '2'),
('35', '3'),('35', '4'),('35', '5'),('35', '6'),('35', '7'),('35', '8'),
('35', '9');

select * from bookmarkCuaNguoiDung;

-- tong hop cac bang

use quan_ly_web_truyen_tranh;
select * from tinhTrang; -- 1
select * from tinhTrangTruyen; -- 2
select * from thongTinTruyen; -- 3
select * from theLoai; -- 4
select * from phanTruyenTheoTheLoai; -- 5
select * from danhSachChuongTruyen; -- 6

select * from danhSachTacGia; -- 7

select * from nhomDich; -- 8
select * from thanhVienNhomDich; -- 9
select * from taiKhoanNguoiDung; -- 10
select * from bookmarkCuaNguoiDung; -- 11

select * from du_an; -- 12

select * from  historyActivity; -- 13

-- các chức năng trong cho web
-- Phần Trigger
show triggers from quan_ly_web_truyen_tranh;

-- trigger 1
delimiter //
create trigger after_insert_thanhVienNhomDich_update_so_thanhVien
after insert on thanhVienNhomDich for each row
begin
update nhomDich  set so_thanhVien = so_thanhVien + 1 where id_nhom = new.id_nhom;
end //
delimiter ;
-- test trigger 1


-- triger2
delimiter // 
create trigger after_insert_bookmarkCuaNguoiDung_update_luotTheoDoi
after insert on bookmarkCuaNguoiDung for each row
begin
update thongTinTruyen set luotTheoDoi = luotTheoDoi + 1 where id_truyen = new.id_truyen;
end //
delimiter ;
-- test trigger 2



-- trigger 3
delimiter // 
create trigger after_insert_danhSachChuongTruyen_insert_historyActivity
after insert on danhSachChuongTruyen for each row
begin
declare lich_su varchar(250);
set lich_su = concat('Truyện ',
(select ten_truyen
from thongTinTruyen
where id_truyen = new.id_truyen),
 ' vừa được thêm chương thứ ',
 new.soChuong ,' vào lúc ', current_date());
INSERT INTO historyActivity(history) values (lich_su);
end //
delimiter ;
-- test trigger 3
insert into danhSachChuongTruyen values (1,281,current_timestamp,2900);
select * from  historyActivity;



-- trigger 4
delimiter //
create trigger after_insert_danhSachChuongTruyen_update_tinhTrangTruyen
after insert on danhSachChuongTruyen for each row
follows after_insert_danhSachChuongTruyen_insert_historyActivity
begin
update tinhTrangTruyen set tongSoChuong = tongSoChuong + 1,
 ngay_capNhat = current_date()
 where id_truyen = new.id_truyen;
end //
delimiter ;
-- test trigger 4
select* from tinhTrangTruyen;
-- procedure

-- procedure 1
delimiter //
drop procedure if exists xem_chi_tiet_cac_chuong //
create procedure xem_chi_tiet_cac_chuong(in id int)
begin
select concat('Chapter ',soChuong) as `Số chương`,
 date(ngay_capNhat) as `Cập nhật`,luotXem as `Lượt xem`
 from danhsachchuongtruyen
	where id_truyen= id order by soChuong desc;
end //
delimiter ;
-- test procedure 1
call xem_chi_tiet_cac_chuong(1);

-- procedure 2 kien ket voi event 1
delimiter //
drop procedure if exists update_luot_xem_trong_thongTinTruyen //
create procedure update_luot_xem_trong_thongTinTruyen()
begin
declare sum int default 0;
declare finished,id int default 0;
declare curView cursor for
	select id_truyen,sum(luotXem)
    from danhSachChuongTruyen group by id_truyen;
declare continue handler for not found set finished = 1;
open curView;
viewLabel: loop
 fetch curView into id,sum;
 if finished = 1 then
	leave viewLabel;
 end if;
 update thongTinTruyen set luotXem = sum where id_truyen = id;
 end loop viewLabel;
close curView;
end //
delimiter ;
-- test procedure 2
call update_luot_xem_trong_thongTinTruyen;
select * from danhSachChuongTruyen;
select * from thongTinTruyen;

-- procedure 3
delimiter //
drop procedure if exists xem_top_truyen_co_luot_xem_cao_nhat //
create procedure xem_top_truyen_co_luot_xem_cao_nhat()
begin
select th.id_truyen as `ID Truyện`, th.ten_truyen as `Tên truyện`,
 th.luotXem as `Lượt xem`,ti.tongSoChuong as `Chương mới nhất`
 from tinhTrangTruyen ti, thongTinTruyen th 
  where ti.id_truyen = th.id_truyen limit 3;
end //
delimiter ;
-- test procedure 3
call xem_top_truyen_co_luot_xem_cao_nhat;
-- function

-- function 1(lien lien ket voi view 1 va 2)
delimiter //
drop function if exists noi_the_loai_truyen //
create function noi_the_loai_truyen(id int )
returns varchar(300)
deterministic
begin
declare the_loai varchar(300) default '';
declare id_theLoai_temp int;
declare id_truyen_temp int;
declare finished int default 0;
declare kt int default 0;
declare curTheLoai cursor for 
	select id_truyen,id_theLoai from phanTruyenTheoTheLoai;
declare continue handler for not found set finished = 1;
open curTheLoai;
concatType: loop
	fetch curTheLoai into id_truyen_temp,id_theLoai_temp;
    if finished = 1 then
		leave concatType;
	end if;
    if id_truyen_temp = id then
	if kt = 0 then
		set the_loai = concat(the_loai,(select ten_theLoai from theLoai where id_theloai = id_theLoai_temp));
        set kt = 1;
	else
	set the_loai = concat(the_loai,' - ',(select ten_theLoai from theLoai where id_theloai = id_theLoai_temp));
	end if;
    end if;        
end loop concatType;
close curTheLoai;
return the_loai;
end //
delimiter ;
-- test function 1
select noi_the_loai_truyen(1);
select * from phantruyentheotheloai;

-- function 2 (lien ket voi view 3)
delimiter //
drop function if exists thong_tin_chi_tiet_ve_nhom_dich //
create function thong_tin_chi_tiet_ve_nhom_dich(id int)
returns varchar(300)
deterministic
begin
declare id_n, id_tv int;
declare thanh_vien varchar(500) default '';
declare finished int default 0;
declare kt int default 0;
declare curMember cursor for
	select id_nguoiDung, id_nhom from thanhVienNhomDich;
declare continue handler for not found set finished = 1;
open curMember;
getMenber: loop
	fetch curMember into id_tv, id_n;
    if finished = 1 then
		leave getMenber;
	end if;
    
    if id_n = id then
		if kt = 0 then
		set thanh_vien = concat(thanh_vien,
		(select ten_hienThi from taiKhoanNguoiDung
			where id_nguoiDung = id_tv));
            set kt = 1;
		else set thanh_vien = concat(thanh_vien,', ',
		(select ten_hienThi from taiKhoanNguoiDung
			where id_nguoiDung = id_tv));
		end if;
	end if;
end loop getMenber;
close curMember;
return thanh_vien;
end //
delimiter ; 
-- test function 2
select thong_tin_chi_tiet_ve_nhom_dich(1);

-- function 3
delimiter //
drop function if exists xem_thong_tin_ve_du_an_cua_nhom_dich //
create function xem_thong_tin_ve_du_an_cua_nhom_dich(id_nhom_tmp int)
returns varchar(400)
begin
declare ten_du_an varchar(400) default "";
declare finished,id_t int default 0;
declare curPj cursor for
	select  id_truyen from du_an where id_nhom = id_nhom_tmp;
declare continue handler for not found set finished = 1;
open curPj;
PjLabel: loop
 fetch curPj into id_t;
 if finished = 1 then
	leave PjLabel;
 end if;
	set ten_du_an = concat(ten_du_an,(select ten_truyen from thongTinTruyen where id_truyen = id_t),", ");
 end loop PjLabel;
close curPj;
return ten_du_an ;
end //
delimiter ;
-- test function 3
select xem_thong_tin_ve_du_an_cua_nhom_dich(1);

-- Phần view

-- view 1 xem thong tin co ban cua truyen

create or replace
algorithm = merge 
view xem_thong_tin_co_ban_truyen(`ID`, `Tên truyện`, `Tác giả`,`Thể loại`)
as select t.id_truyen, t.ten_truyen,tg.ten_TacGia, noi_the_loai_truyen(t.id_truyen)
from thongTinTruyen t, danhSachTacGia tg
where tg.id_tacGia = t.id_tacGia;
-- test view 1
select * from xem_thong_tin_co_ban_truyen;

-- view 2 xem thong tin chi tiet truyen
create or replace
algorithm = merge 
view xem_thong_tin_chi_tiet_truyen(`Tên truyện`, `Tác giả`,`Thể loại`,`Lượt xem`,`Theo dõi`,`Tóm tắt nội dung`)
as select t.ten_truyen,tg.ten_TacGia, noi_the_loai_truyen(t.id_truyen), t.luotXem, t.luotTheoDoi, t.tomTat
from thongTinTruyen t, danhSachTacGia tg
where tg.id_tacGia = t.id_tacGia;
-- test view 2
select * from xem_thong_tin_chi_tiet_truyen;

-- view 3 xem thong tin chi tiet cac nhom dich
create or replace
algorithm = merge 
view xem_chi_tiet_nhom_dich(`ID nhóm`, `Tên nhóm`,`Số thành viên`,`Thành Viên`,`Ngày thành lập`,`Các truyện đang đảm nhận`)
as select id_nhom,ten_nhom,so_thanhVien,thong_tin_chi_tiet_ve_nhom_dich(id_nhom),
		ngay_thanhLap,xem_thong_tin_ve_du_an_cua_nhom_dich(id_nhom)
from nhomDich;
-- test view 3
select * from xem_chi_tiet_nhom_dich;
select * from nhomDich;

-- view 4
create or replace
	view view_top_nhom_dich(`Tên nhóm đứng top`,`Truyện đứng top`,`Lượt xem`)
    as select n.ten_nhom, t.ten_truyen, t.luotXem
		from thongTinTruyen t, nhomDich n, du_an d
		where n.id_nhom = d.id_nhom and d.id_truyen = t.id_truyen
        group by d.id_nhom order by t.luotXem desc limit 3;
-- test view 4
select* from view_top_nhom_dich;

-- event
show events from quan_ly_web_truyen_tranh;
-- event 1
delimiter //
create event auto_update_luotXem_ThongTinTruyen
on schedule every 12 hour
do
call update_luot_xem_trong_thongTinTruyen //
delimiter ;
SET GLOBAL event_scheduler = ON;

-- event 2
delimiter //
create event update_historyActivity_tong_so_truyen
on schedule every 12 hour
do
begin
insert historyActivity(history) values
(concat("Tổng số truyện hiện có trên website là ",(select count(*) from thongTinTruyen),", kiểm tra vào lúc ", current_timestamp));
end //
delimiter ;
-- test event 2
select * from historyActivity;

-- index and full text search
-- fulltext 1
create fulltext index tim_tac_gia
	on danhSachTacGia(ten_TacGia);
select id_tacGia as`ID tác giả`,ten_TacGia as `Tên tác giả` from danhSachTacGia
	where match(ten_TacGia)
    against('thien' in natural language mode);

-- fulltext 2
create fulltext index tim_truyen
	on thongTinTruyen(ten_truyen);
    
select * from xem_thong_tin_chi_tiet_truyen 
	where `Tên truyện` 
		in(select ten_truyen from thongTinTruyen
			where match(ten_truyen)
			against('Đ* V*' in boolean mode));
            
-- fulltext 3
create fulltext index tim_nhom_dich
 on nhomDich(ten_nhom);
 
 select * from xem_chi_tiet_nhom_dich 
	where `Tên nhóm` 
		in(select ten_nhom from nhomDich
			where match(ten_nhom)
			against('t*' in boolean mode));  
            
 select * from xem_chi_tiet_nhom_dich 
	where `Tên nhóm` 
		in(select ten_nhom from nhomDich
			where match(ten_nhom)
			against('+t* -v*' in boolean mode)); 