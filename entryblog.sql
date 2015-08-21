-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2015 at 08:31 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `entryblog`
--
CREATE DATABASE IF NOT EXISTS `entryblog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `entryblog`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`) VALUES
('admin', '3ce1279c226cae4656b08bcf999ded9b');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booked_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(15) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_of_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

CREATE TABLE IF NOT EXISTS `bill_details` (
  `bill_id` int(10) unsigned NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '1',
  KEY `fk_details_of_bill` (`bill_id`),
  KEY `fk_book_booked` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` float NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `price`, `image`, `description`) VALUES
(6, 'Tony Buổi Sáng - Trên Đường Băng', 56000, 'tony-buoi-sang.jpg', '<p><em>"Khi còn trẻ, hãy ra ngoài nhiều hơn ở nhà. Hãy nhào vô xin người khác “bóc hết, lột sạch” khả năng của mình. Chỉ sợ bất tài nộp hồ sơ “xin việc”, mà chả ai thèm cho, chả ai thèm bóc lột. Khi đã được bóc và lột hết, dù sau này đi đâu, làm gì, bạn đều cực kỳ thành công. Vì năng lực được trui rèn trong quá trình làm cho người khác. Sự chăm chỉ, tính kỷ luật, quen tay quen chân, quen ngáp, quen lười… cũng từ công việc mà ra. Mọi ông chủ vĩ đại đều từng là những người làm công ở vị trí thấp nhất. Họ đều rẽ trái trong khi mọi người rẽ phải. Họ có những quyết định không theo đám đông, không cam chịu sống một cuộc đời tầm thường, nhạt nhòa… rồi chết.</em></p><p><em>Còn những bạn thu nhập 6 triệu cũng túng thiếu, 20 triệu cũng đi vay mượn để tiêu dùng, thì thôi, cuộc đời họ chấm dứt giấc mơ lớn. Tiền nong cá nhân quản lý không được, thì làm sao mà quản trị tài chính một cơ nghiệp lớn?”. Tư duy thế nào thì nó ra số phận thế đó."</em></p><p><strong>(Tony buổi sáng)</strong></p>'),
(8, 'Tủ Sách Gõ Cửa Tương Lai - Nhật Bản Có Điều Kỳ Diệu', 56000, 'official-cover.jpg', '<p>Sau cuốn đặc san&nbsp;<strong>Nước Mỹ Trong Tầm Tay</strong>&nbsp;“phá đảo” hầu hết các bảng xếp hạng sách bán chạy, in nối bản ngay trong tuần đầu tiên ra mắt, được Thứ trưởng Bộ GD&amp;ĐT gửi lời khen tặng cũng như nhận rất nhiều phản hồi tích cực từ phụ huynh và teen, xin giới thiệu đến bạn đọc một hành trình mới cho chuyến cất cánh đến Nhật Bản - cuốn đặc san&nbsp;<strong>Nhật Bản có điều kỳ diệu</strong>&nbsp;- thuộc Tủ sách giáo dục “Gõ cửa tương lai”.</p><p><strong>Điểm đến lý tưởng tại châu Á</strong></p>'),
(9, 'Khu Vườn Bí Mật (Coloring Book)', 66000, 'khu-vuon-bi-mat_2.jpg', '<p>Có một cơn sốt đang lan rộng trên khắp thế giới, cơn sốt mang tên Coloring Book (sách tô màu). Trào lưu này được phát triển mạnh mẽ nhờ sự đóng góp của nữ họa sĩ xinh đẹp<strong>Johanna Basford</strong>&nbsp;với hai bộ sách được vẽ bằng tay là&nbsp;<strong>Khu vườn bí mật</strong>&nbsp;và&nbsp;<strong>Khu rừng bị phù phép</strong>.&nbsp;Bộ sách đã làm dậy sóng ngành xuất bản tại Anh, Mỹ, Pháp, Trung Quốc, Hàn Quốc, Nhật Bản, thậm chí cả Thái Lan và Đài Loan, chiếm lĩnh vị trí số 1 trên Amazon trong nhiều tháng, đồng thời được New York Times bình chọn là bestseller của năm. Cộng đồng mạng trên Facebook, Instagram và cả Youtube cũng đang chia sẻ liên tục về hai cuốn sách này.</p>'),
(10, 'Nhà Giả Kim', 47000, 'nha_gia_kim_2_1.jpg', '<p><strong>Nguyễn Minh Trí&nbsp;viết</strong></p><p>Vâng đây là một cuốn sách rất đáng ghét vì nó đã làm tôi khóc rất nhiều lần. Cuốn sách này chỉ dành cho những ai sẵn sàng mở lòng mình ra để đón nhận, dành cho những người luôn khát khao nhưng còn sợ hãi nhiều điều, nhất là sợ thất bại.</p>'),
(13, 'Người Cũ Còn Thương (Phiên Bản Tri Ân)', 59000, 'nguoicutaibanfull2807_1_.jpg', '<p><em>"Như một tri ân, như một kỷ niệm đã cho chúng ta gặp nhau trong ngày mưa hôm đó</em></p><p><em>Từ Thạch với tất cả yêu thương!"</em></p><p>"Sau lần ra mắt đầu tiên thành công của<strong>&nbsp;Người Cũ Còn Thương</strong>&nbsp;cũng như đêm giao lưu tràn đầy cảm xúc cùng các bạn độc giả gần xa, Thạch quyết định ra mắt phiên bản tri ân như một lời cảm ơn chân thành nhất gởi đến mọi người.</p>'),
(15, 'Khi Phụ Nữ Uống Trà, Đàn Ông Nên Cẩn Thận', 51000, 'khi_phu_nu_uong_tra-01.jpg', '<p><strong>"Phụ nữ trước ngưỡng 30 là một giỏ hoa nhiều sắc&nbsp;mà sắc nào cũng đượm một chút tiếc nuối".</strong></p><p>Làm gì để tuổi ba mươi tới mà trái tim không hoảng hốt, không chênh vênh, để an nhiên đón ba mươi của mình và nhận ra quãng nào trong đời cũng luôn có những vẻ đẹp rất riêng của tuổi?</p><p>Hãy bình tâm ngồi xuống, nhấm tách trà tự pha với hương vị yêu thích nhất và đi qua ba mươi cùng&nbsp;<strong>Ý Yên</strong>&nbsp;khi lật giở từng trang sách<strong>&nbsp;Khi Phụ Nữ Uống Trà, Đàn Ông Nên Cẩn Thận</strong>, bạn sẽ nhận thấy mình chưa bao giờ đơn độc trên con đường bước thêm một bước tới trưởng thành và yêu thương.</p>'),
(16, 'Mỉm Cười Cho Qua', 52000, 'bia_mim_cuoi_cho_qua-02_2.jpg', '<p>Một trong những cặp đôi trẻ mỗi lần kết hợp lại mang về những tác phẩm giàu cảm xúc,&nbsp;<strong>Hamlet Trương - Iris Cao</strong>, đã trở lại cùng&nbsp;<strong>Mỉm cười cho qua</strong>. Một chút nữ tính và yếu đuối trong tình yêu của&nbsp;<strong>Iris Cao</strong>&nbsp;hòa với sự trải nghiệm cuộc sống qua triết lý nhẹ nhàng nhưng sâu sắc của&nbsp;<strong>Hamlet Trương</strong>&nbsp;đã giúp những tác phẩm của họ trở thành "sách gối đầu giường" của thế hệ bạn đọc trẻ những năm gần đây. Tác phẩm của họ liên tục gây "sốt" trên thị trường với số lượng tiêu thụ đáng kinh ngạc lên đến hàng trăm ngàn bản sách, khởi đầu cho thời đại mới của những cây bút trẻ được yêu thích nhiệt thành.</p>'),
(17, 'Chào Mừng Đến Với N.H.K!', 60000, 'n.h.k_2.jpg', '<p>Ném bừa một hòn đá ra đường có khi cũng trúng một hikikomori…&nbsp;Dĩ nhiên điều này khó lòng xảy ra, vì hikikomori có ra đường đâu.</p><p>Bước sang thế kỷ 21, hiện tượng hikikomori bất ngờ bùng nổ ở Nhật Bản. Hikikomori là những người chỉ sống quanh quẩn trong phòng, không làm việc, không giao tiếp xã hội, cứ mãi mê man với cuộc sống ảo trên mạng, từ đó dẫn đến những mục ruỗng tâm hồn.</p><p>Sato là một thanh niên 22 tuổi nhưng hết bốn năm trong cuộc đời cậu đã sống như một kẻ khép kín, không giao tiếp, kỳ thị đời sống cộng đồng. Lối sống đó đáng ra sẽ tù đọng trôi đi mãi như thế trong căn phòng trọ bừa bộn nếu một ngày kia cậu không gặp một cô gái lạ lùng - xuất hiện trong trắng như thiên thần nhưng toàn thốt ra những lời kỳ quặc. Cô tự nhận có thể chữa chứng hikikomori cho cậu, miễn là cậu bằng lòng ký vào một hợp đồng do cô thảo.</p>'),
(18, 'Những Người Không Biết Yêu Xa', 60000, 'img548_6.jpg', '<p><strong>Những Người Không Biết Yêu Xa</strong>&nbsp;là tập truyện ngắn của&nbsp;<strong>Nguyễn Đăng Vĩnh Trung</strong>, cây bút không còn xa lạ với độc giả. Những sáng tác của<strong>&nbsp;Vĩnh Trung</strong>&nbsp;nổi bật ở tính sáng tạo trong cách thức thể hiện nội dung với mạch truyện thông suốt, mạch lạc, thông điệp truyền tải gắn liền với tâm lí người trẻ nên được bạn đọc vô cùng yêu thích. Chính vì những lí do đó, năm 2012,<strong>&nbsp;Nguyễn Đăng Vĩnh Trung</strong>&nbsp;đã đoạt giải Ba cuộc thi Sáng tác văn chương trẻ do tạp chí 2! và mạng xã hội Tầm tay tổ chức.</p><p>Trong&nbsp;<strong>Những người không biết yêu xa</strong>,&nbsp;<strong>Vĩnh Trung</strong>&nbsp;tiếp tục thể hiện được khả năng sáng tạo của mình qua 27 truyện ngắn về tình yêu, cuộc sống của người trẻ. Những truyện ngắn ấy lại được liên kết chặt chẽ với nhau bằng một tác phẩm xuyên suốt là một sáng tác mới nhất rất đáng trông đợi.<strong>&nbsp;Vĩnh Trung</strong>&nbsp;đã rất khéo léo sử dụng câu chuyện ấy như một chiếc chìa khóa vạn năng để mở tung cánh cửa của 27 câu chuyện khác trong đó, khiến cho người đọc không thể rời mắt một khi đã lật giở trang đầu tiên.</p>'),
(19, 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh (Nguyễn Nhật Ánh)', 62000, 'toi_thay_hoa_vang.jpg', '<p>Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Hoa Vàng Trên Cỏ Xanh có chút này chút kia, để ai soi vào cũng thấy mình trong đó, kiểu như lá thư tình đầu đời của cu Thiều chẳng hạn... ngây ngô và khờ khạo.</p><p>Nhưng Tôi Thấy Hoa Vàng Trên Cỏ Xanh hình như không còn trong trẻo, thuần khiết trọn vẹn của một thế giới tuổi thơ nữa. Cuốn sách nhỏ nhắn vẫn hồn hậu, dí dỏm, ngọt ngào nhưng lại phảng phất nỗi buồn, về một người cha bệnh tật trốn nhà vì không muốn làm khổ vợ con, về một người cha khác giả làm vua bởi đứa con tâm thầm của ông luôn nghĩ mình là công chúa,... Những bài học về luân lý, về tình người trở đi trở lại trong day dứt và tiếc nuối.</p><p>Tôi Thấy Hoa Vàng Trên Cỏ Xanh lắng đọng nhẹ nhàng trong tâm tưởng để rồi ai đã lỡ đọc rồi mà muốn quên đi thì thật khó.</p>'),
(20, 'Chuyện Con Mèo Dạy Hải Âu Bay (Tái Bản 2014)', 28000, 'chuyen-con-meo-day-hai-au-bay.jpg', '<p>Có tồn tại không tình thương yêu giữa mèo và hải âu?<br />Thế giới này đầy những nghịch lý và khác biệt, nhưng bỏ qua những khác biệt đó để hướng đến tình yêu thương thì cuộc sống sẽ tốt đẹp hơn.“Chuyện con mèo dạy hải âu bay” của nhà văn Chi Lê nổi tiếng Luis SéPulveda là một câu chuyện thấm đẫm tình mèo, tình người như thế.</p><p>Câu chuyện là cuộc hành trình dài đi thực hiện ba lời hứa của chú mèo mập Zorba: “sẽ không ăn quả trứng”, sẽ “chăm lo cho quả trứng đến khi chú chim non ra đời”, và điều cuối dường như không tưởng là “dạy nó bay”. Những rắc rối liên tiếp ập đến, liệu một bà má rất “xịn” như Zorba có thực hiện đúng được ba lời hứa?</p><p>Tình thương giúp thay đổi định kiến.</p>'),
(21, 'Thỏ Bảy Màu', 63000, 'tho-bay-mau_1_2.jpg', '<p>Cuốn sách mà bạn đang xem chính là “Facebook trên giấy” của một nhân vật hư cấu đáng yêu thùy mị nết na không ai sánh bằng, đã thu hút gạch đá của hơn 400.000 thành viên bất hảo từ khắp mọi nơi trên Facebook, mà ai ai cũng biết chỉ trừ những người không biết: Thỏ Bảy Màu!</p><p><strong>Thỏ Bảy Màu&nbsp;</strong>- Timeline Của Tui Có Gì bao gồm những câu chuyện xảy ra xung quanh cuộc sống ảo diệu của Thỏ, đương nhiên có đi kèm với những bức hình minh họa vô cùng chân thực. Cuốn sách được chia làm 4 phần.</p>'),
(22, 'Đắc Nhân Tâm (Tái Bản)', 51000, 'dac_nhan_tam_1_1.jpg', '<p><strong>Đắc Nhân Tâm&nbsp;</strong>- Được lòng người, là cuốn sách đưa ra các lời khuyên về cách thức cư xử, ứng xử và giao tiếp với mọi người để đạt được thành công trong cuộc sống. Gần 80 năm kể từ khi ra đời, Đắc Nhân Tâm là cuốn sách gối đầu giường của nhiều thế hệ luôn muốn hoàn thiện chính mình để vươn tới một cuộc sống tốt đẹp và thành công.</p><p><strong>Đắc Nhân Tâm</strong>&nbsp;cụ thể và chi tiết với những chỉ dẫn để dẫn đạo người, để gây thiện cảm và dẫn dắt người khác,... những hướng dẫn ấy, qua thời gian, có thể không còn thích hợp trong cuộc sống hiện đại nhưng nếu người đọc có thể cảm và hiểu được những thông điệp tác giả muốn truyền đạt thì việc áp dụng nó vào cuộc sống trở nên dễ dàng và hiệu quả.</p><p>Đắc Nhân Tâm, từ một cuốn sách, hôm nay đã trở thành một danh từ để chỉ một lối sống mà ở đó con người ta cư xử linh hoạt và thấu tình đạt lý. Lý thuyết muôn thuở vẫn là những quy tắc chết, nhưng Nhân Tâm là sống, là biến đổi. Bạn hãy thử đọc&nbsp;<strong>"Đắc Nhân tâm"&nbsp;</strong>và tự mình chiêm nghiệm những cái đang diễn ra trong đời thực hiện hữu, chắc chắn bạn sẽ có những bài học cho riêng mình.</p>'),
(23, 'Ngọn Lửa Tăm Tối', 82000, 'ngon-lua.jpg', '<p>Ever và Damen là hai người bất tử, đã cùng nhau phiêu bạt qua nhiều kiếp luân hồi, trải qua vô số thử thách nhưng tình yêu lãng mạn họ dành cho nhau vẫn sắt son, bền chặt. Tuy bất tử, nhưng họ vẫn có nhiều kẻ thù - và hình phạt nặng nề nhất cho một người bất tử nếu chẳng may bị tiêu diệt là rơi vào vùng đất không có linh hồn - nơi họ mãi lơ lửng trong mênh mông cô quạnh không lối thoát.</p><p>Trong bộ tiểu thuyết Bất Tử say đắm và tăm tối của Alyson Noel, Ever đấu tranh để làm chủ cơ thể, tâm hồn mình và tình yêu đích thực vượt quá cả quy tắc thời gian mà cô đã theo đuổi hàng thế kỷ.</p>'),
(24, 'Sao Đêm', 84000, 'sao-dem.jpg', '<p>Tập 5 tiếp tục một cuộc phiêu lưu mới của Ever và Damen, hai người bất tử yêu nhau tha thiết nhưng luôn bị thử thách bởi vô số kẻ thù cũng mang dòng máu bất tử như họ.Ở tập 5, Ever phải gánh chịu hậu quả cho một quyết định sai lầm của mình - là biến cô bạn thân Haven thành người bất tử. Haven qua giây phút choáng ngợp vì trở thành người nổi bật lại căm thù Ever khi người tình bất tử xấu xa Roman chết đi. Còn Ever cũng vật lộn với một vấn đề hóc búa - là tìm thuốc giải cho Damen, và mối quan hệ phức tạp với Jude… Những lợi ích không gặp nhau khiến tình bạn trở thành tình thù, với những cuộc đối đầu nghẹt thở.</p>'),
(25, 'Linh Hồn Bất Diệt', 92000, 'linh-hon.jpg', '<p>Cuối cùng thì đôi tình nhân bất tử Ever và Damen cũng cởi bỏ được những lời nguyền độc ác và chung sống hạnh phúc - như điều họ đã mong muốn mấy trăm năm qua. Truyện là bản tình ca ngọt ngào và lãng mạn, cùng những chi tiết tưởng tượng có thể làm mê mẩn các độc giả của thể loại fantasy. Có thể nói, đây là một câu chuyện mê hoặc về sự hối hận, tình yêu, sự hi sinh của lứa tuổi vị thành niên với rất nhiều sức lôi cuốn. Kết thúc đầy ngạc nhiên nhưng cũng rất mỹ mãn cho thấy Noel biết cách làm thế nào níu độc giả của cô lại. Cuộc đấu tranh trước siêu nhiên của Ever là một phép ẩn dụ quyến rũ cho nỗi sợ hãi của lứa tuổi vị thành niên về tình yêu, những mối quan hệ và sự trưởng thành.</p>'),
(26, 'Cuốn Sách Bạc Của Những Truyện Cổ Tích (Tái Bản 2015)', 29000, 'img284_12.jpg', '<p>Những câu chuyện cổ tích được tập hợp trong&nbsp;<strong>Cuốn Sách Bạc Của Những Truyện Cổ Tích</strong>&nbsp;là những truyện đã nổi tiếng khắp thế giới như: Halivơ ở xứ sở những người tí hon, Quốc vương Vẹt, Lỗi lầm của Hươu, Nữ hoàng Khỉ…<br /><br />Với phong cách kể chuyện lôi cuốn, thú vị và cách trình bày đẹp mắt từ bìa sách đến những tranh vẽ minh họa sinh động, hấp dẫn trong từng câu chuyện, cuốn sách sẽ khiến các bé thêm say mê, hứng thú với những câu chuyện cổ tích.</p>'),
(27, 'Cuốn Sách Vàng Của Những Truyện Cổ Tích (Tái Bản 2015)', 29000, 'img283_9.jpg', '<p><strong>Cuốn Sách Vàng Của Những Truyện Cổ Tích</strong>&nbsp;chọn lọc những câu chuyện cổ tích nổi tiếng thế giới, được nhiều người yêu thích. Với phong cách kể chuyện lôi cuốn, thú vị và cách trình bày đẹp mắt từ bìa sách đến những tranh vẽ minh họa sinh động, hấp dẫn trong từng câu chuyện, cuốn sách sẽ khiến các bé thêm say mê, hứng thú với những câu chuyện cổ tích....<br /><br />"Mùa xuân băng tan làm nước lũ chảy xiết. Nước đã tràn khắp các bờ xung quanh, vì vậy mà các cư dân của rừng xanh phải trú tạm trên các cây cao. Hải ly và sóc không biết kiếm được ở đâu một chiếc ô cũ nên đã dựng trên cành cây dư to một nơi trú ẩn thật thuận lợi. Chuột con cũng ngồi trên cành cây, đung đưa chân. Trôi ngang qua đó là những chiếc bánh xe đạp, những chai lọ, vỏ đồ hộp, bình và thậm chí có cả thùng gỗ tròn. Sau đó lại trôi đến một chiếc giày, trông giống như một con tàu khổng lồ."<br /><br /><strong>(Trích Chiếc giày cũ)</strong></p>'),
(28, 'Đánh Bại Phố Wall (Tái Bản 2015)', 104000, 'img886_1_4.jpg', '<p>Với 13 năm kinh nghiệm quản lý thành công quỹ đầu tư Fidelity Magellan và lựa chọn hàng nghìn cổ phiếu, Lynch đã đúc kết thành 21 nguyên tắc hài hước mà ông gọi là “Những nguyên tắc của Peter”.<br />Chìa khóa để đầu tư thành công, theo Lynch, là phải ghi nhớ rằng cổ phiếu không giống như tấm vé số; luôn có một công ty đằng sau mỗi cổ phiếu và một nguyên nhân lý giải cho cách thức vận hành của các công ty - và cổ phiếu của chúng. Lynch chỉ ra làm cách nào chúng ta có thể tìm hiểu tối đa về công ty mục tiêu và xây dựng một danh mục đầu tư sinh lợi dựa trên chính kinh nghiệm, hiểu biết và kết quả nghiên cứu của bản thân. Không có bất kỳ lý do nào cản trở một nhà đầu tư cá nhân tự trở thành chuyên gia, và cuốn sách này sẽ chỉ ra cách thực hiện điều đó.</p>'),
(29, 'Những Ngày Thơ Ấu (Tái Bản 2015)', 23000, 'img022_16.jpg', '<p>"Những ngày thơ ấu có thể coi là một phẩm xuất sắc. Đây là tập hồi ký về tuổi thơ ghi lại những rung động cực điểm của một linh hồn trẻ dại" &nbsp;-&nbsp;<strong>Thạch Lam</strong></p><p>"Một nghệ sĩ đã thực hiện hết mình, đã mang được vào sự nghiệp sáng tác hết tất cả những cái đáng giá nhất mà mình muốn nói với người đời, là một người sung sướng nhất… Nguyên Hồng là nhà văn đã có cái hạnh phúc tuyệt vời ấy" -&nbsp;<strong>Như Phong</strong></p><p><strong>Trích đoạn</strong></p><p>Thầy tôi đã lạnh lùng đứng dậy, đi vào nhà trong mặc bà tôi ngồi kể lể. Tôi nhìn nét mặt thầy tôi thấy sao mà dữ, mà sợ. Chờ thầy tôi khuất hẳn, tôi vội trèo lên giường bà tôi, lay vai bà tôi, rơm rớm nước mắt nói:</p><p>- Bà! Bà đừng khóc nữa. Cậu bán nhà này của bà đi rồi cậu làm nhà khác mà.</p><p>Một giọng mếu máo đáp:</p><p>- Có làm thêm mấy cái đèn bàn nữa đấy! Bố mẹ mày giết tao...Hồng ơi!...</p><p>Tôi càng lay mạnh vai bà tôi:</p><p>- Cậu con không làm được thì lớn lên con đi học con làm cho bà. Bà nín đi...</p>');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entry_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_of_entry` (`entry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `date`, `entry_id`) VALUES
(14, 'Tester', 'Hay và ý nghĩa lắm.', '2015-08-13 19:27:42', 4),
(15, 'Mimi', 'Thật đau lòng! :(', '2015-08-14 11:45:38', 4),
(16, 'Traitor', 'WTH??!!', '2015-08-14 16:24:20', 5),
(17, 'Người sao hỏa', 'Hay quá senpai ơi!', '2015-08-14 23:03:23', 1),
(18, 'Ngẫm', 'Con người sinh ra là để thương nhau vậy mà...', '2015-08-14 23:31:22', 5),
(19, 'Huhu', 'Khóc rùi! T___T', '2015-08-19 17:01:14', 4);

-- --------------------------------------------------------

--
-- Table structure for table `entrys`
--

CREATE TABLE IF NOT EXISTS `entrys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `posted_day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entry_of_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `entrys`
--

INSERT INTO `entrys` (`id`, `title`, `content`, `posted_day`, `user_id`) VALUES
(1, 'Tôi đã mơ thấy chuyến đi của mình', '<p>Càng sống nhiều ta càng thấy cái chết dễ dàng đến với bất cứ một ai. Chết quá dễ mà sống thì quá khó. Hôm qua gặp nhau đấy, ngày mai lại mất nhau. Sống thì có hẹn hò hôm nay hôm mai. Chết thì chẳng bao giờ có một cuộc hẹn hò nào trước.</p><p>Một buổi sáng cách đây bốn năm, lúc tôi đang ngồi uống rượu với bạn, mẹ tôi bảo: “Mạ đi chơi chút nghe”. Thế rồi một giờ sau tôi được điện thoại báo tin mẹ tôi đã mất tại nhà người bạn. Nhạc sĩ Xuân Hồng cũng đã từ biệt chúng tôi như thế. Không kịp nói một lời, không kịp đưa tay vẫy chào bạn bè, vẫy chào cuộc sống.</p><p>Thế kỷ 21 thế mà cũng khó đến được dù chỉ còn mấy năm. Càng yêu ta càng thấy: có tình yêu thì khó mà mất tình thì quá dễ. Hôm qua mới yêu nhau đấy, hôm nay đã mất rồi. Mất sạch như người đi buôn mất hết vốn liếng. Cứ tự an ủi mình khi nghĩ rằng mình đau khổ thì có một kẻ khác đang hạnh phúc. Và biết đâu cái thời gian mình được yêu thì một người khác cũng đang đau khổ vô cùng. Nghĩ thế thì thấy cuộc đời bỗng nhẹ nhàng hơn và cũng dễ tha thứ cho nhau. Sống mà giữ mãi trong lòng những hờn oán thì cũng nặng nề.</p><p>Có người bỏ cuộc đời mà đi như một giấc ngủ quên. Có người bỏ cuộc tình mà đi như người đãng trí. Dù sao cũng đã lãng quên một nơi này để đi về một chốn khác. Phụ đời và phụ người hình như cũng vậy mà thôi. Người ở lại bao giờ cũng nhớ thương một hình bóng mình đã mất. Khó mà quên nhanh, khó mà xóa đi trong lòng một nỗi ngậm ngùi. Tưởng rằng có thể quên dễ dàng một cuộc tình nhưng hóa ra chẳng bao giờ quên được. Mượn cuộc tình này để xóa cuộc tình kia chỉ là một sự vá víu cho tâm hồn. Những mảnh vá ấy chỉ đủ để làm phẳng lặng bên ngoài mà thôi.</p><p>Mỗi một con người vì ngại chết mà muốn sống. Mỗi một con người vì sợ mất tình mà giữ mãi một lòng nhớ nhung. Cuối cùng thì lòng yêu thương cuộc sống cũng không giữ lại đời người. Cuối cùng thì tình yêu không giữ được người mình yêu…</p><p><strong>Trịnh Công Sơn (1996)</strong></p>', '2015-08-13 06:32:43', 1),
(2, 'Món quà giáng sinh', '<p>Một đồng tám mươi bảy xu ,đúng như vậy. Hàng ngày, cô cố gắng tiêu thật ít tiền khi đi chợ. Cô đi loanh quanh tìm mua thứ thịt và rau rẻ nhất cho bữa ăn hàng ngày,ngay cả lúc cảm thấy hết sức mệt mỏi cô vẫn cố tìm kiếm. Tiết kiệm được đồng nào hay đồng đó. Della đếm lại số tiền ít ỏi một lần nữa. Không hề có sự nhằm lẫn,chỉ có một đồng tám mươi bảy xu ,và ngày mai sẽ là lễ giáng sinh. Cô sẽ không thể làm gì hơn, chỉ còn cách ngồi xuống và khóc mà thôi.ở đó, trong một căn phòng nhỏ, tồi tàn, cô đang nức nở. Della sống trong căn phòng nhỏ nghèo nàn này với chồng của cô, James Dillingham Young, ở thành phố NEW YORK. Họ có một phòng ngủ, một phòng tắm và một nhà bếp. James Dillingham Young may mắn hơn cô vì anh ấy có việc làm. Tuy vậy đó không phải là một công việc kiếm được nhiều tiền. Tiền thuê căn phòng này chiếm gần hết lương của anh ấy. Della đã cố gắng rất nhiều để tìm một công việc nhưng vận may đã không mỉm cười với cô. Tuy nhiên, cô rất hạnh phúc khi ôm ‘Jim’, James Dillingham Young, trong tay mỗi khi anh trở về. Della đã ngừng khóc. Cô lau khô mặt rồi đứng nhìn một chú mèo xám trên bức tường đồng màu với nó bên cạnh con đường tối ngoài cửa sổ. Ngày mai là Noel và cô chỉ còn một đồng tám mươi bảy xu để mua cho Jim, Jim của cô, một món qùa.Cô muốn mua một món quà thật sự có ý nghĩa ,một thứ có thể biểu hiện được tất cả tình yêu cô dành cho anh. Della chợt xoay người chạy đến bên chiếc gương treo trên tuờng. Mắt cô sáng lên. Cho đến bây giờ, gia đình James Dillingham Young chỉ có hai vật quí giá nhất.Một thứ là chiếc đồng hồ vàng của Jim. Chiếc đồng hồ này trước đây thuộc sở hữu của cha anh ta và trước nữa là ông nội anh ta. Thứ còn lại là mái tóc của Della. Della thả nhanh mái tóc dài óng mượt xuống lưng. Thật tuyệt đẹp, không khác nào như một chiếc áo khoác đang choàng qua người cô. Della cuộn tóc lên lại. Cô đứng lặng đi rồi thút thít một lát. Della buớc chậm rãi qua các cửa hàng dọc hai bên đường rồi dừng lại trước bảng hiệu ‘Madame Eloise’. Tiếp cô là một phụ nữ mập mạp, bà ta chẳng có một chút vẻ ‘Eloise’ nào cả. Della cất tiếng hỏi: ‘bà mua tóc tôi không?’ ‘Tôi chuyên mua tóc mà’, bà ta đáp và bảo: ‘hãy bỏ nón ra cho tôi xem tóc của cô đi’ Suối tóc nâu đẹp tụyệt vời buông xuống. ‘Hai mươi đồng’ bà ta định giá, bàn tay nâng niu mái tóc óng ả. ‘Hãy cắt nhanh đi! và đưa tiền cho tôi’ Della nói. Hai giờ tiếp theo trôi qua nhanh chóng. Cô tìm mua quà cho Jim trong các cửa hiệu trong niềm vui khôn tả. Cuối cùng cô cũng chọn được một thứ. Đó là môt sợi dây đồng hồ bằng vàng. Jim rất quí chiếc đồng hồ của mình nhưng rất tiếc là nó không có dây. Khi Della trông thấy sợi dây này cô biết rằng nó phải là của anh và cô phải mua nó. Cô trả hai mươi mốt đồng để mua và vội vã trở về nhà với tám mươi bảy xu còn lại. Đến nhà, Della ngắm mái tóc cực ngắn của mình trong gương và nghĩ thầm: ‘mình có thể làm gì với nó đây?’. Nửa giờ tiếp theo cô nhanh chóng chuẩn bị mọi thứ. Xong Della lại ngắm nghía mình trong gương lần nữa. Tóc của cô bây giờ tòan những sợi quăn quăn khắp đầu. ‘Chúa ơi, mình trông như một con bé nữ sinh ấy!’. Cô tự nhủ :’Jim sẽ nói gì khi thấy mình như thế này?’ Bảy giờ tối, bữa ăn đuợc chuẩn bị gần xong. Della hồi hộp chờ đợi, hy vọng rằng mình vẫn còn xinh đẹp trong mắt Jim. Thế rồi cửa mở, Jim bước vào. Anh ấy trông rất gầy và cần có một cát áo khoác mới.Jim nhìn chằm chằm vào Della. Cô không thể hiểu được anh đang nghĩ gì, cô sợ. Anh ta không giận dữ, cũng chẳng ngạc nhiên.Anh đứng đó, nhìn cô với ánh mắt kỳ lạ. Della chạy đến bên Jim òa khóc: ‘Đừng nhìn em như thế ,anh yêu. Em bán tóc chỉ để mua cho anh một món quà. Tóc sẽ dài ra mà. Em phải bán nó thôi, Jim à. Hãy nói ‘giáng sinh vui vẻ’, em có một món quà rất hay cho anh này!’ ‘Em đã cắt mất tóc rồi à?’ Jim hỏi ‘Đúng thế, em đã cắt và bán rồi, vì vậy mà anh không còn yêu em nữa ư? em vẫn là em mà!’ Della nói. Jim nhìn quanh rồi hỏi lại như một kẻ ngớ ngẩn: ’em nói là em đã bán tóc à?’ ‘Đúng, em đã nói vậy, vì em yêu anh! Chúng ta có thể ăn tối được chưa, Jim?’ Chợt Jim vòng tay ôm lấy Della và rút từ túi áo ra một vật gì đấy đặt lên bàn. Anh nói: ‘anh yêu em, Della, dù cho tóc em ngắn hay dài. Hãy mở cái này ra em, sẽ hiểu tại sao khi nãy anh sững sờ đến vậy.’ Della xé bỏ lớp giấy bọc ngoài và kêu lên sung suớng, liền sau đó những giọt nước mắt hạnh phúc rơi xuống.Trong đó là một bộ kẹp tóc, những chiếc kẹp dành cho mái tóc óng ả của Della. Cô đã mơ ước có đuợc nó khi trông thấy lần đầu tiên qua cửa kính một gian hàng. Những cái kẹp rất đẹp và rất đắt tiền. Bây giờ chúng đã thuộc về cô nhưng tóc cô thì không còn đủ dài để kẹp nữa! Della nâng niu món quà ,mắt tràn đầy hạnh phúc. ‘Tóc em sẽ chóng dài ra thôi Jim’, nói xong cô chợt nhớ đến dây đồng hồ vàng định tặng cho Jim và chạy đi lấy. ‘Đẹp không anh? em đã tìm kiếm khắp nơi đấy, giờ thì anh sẽ phải thích thú nhìn ngắm nó hàng trăm lần mỗi ngày thôi. Nhanh lên, đưa nó cho em, Jim, hãy nhìn nó với sợi dây mới này’ Nhưng Jim không làm theo lời Della.Anh ngồi xuống vòng tay ra sau đầu mỉm cuời nói:’Della,hãy cất những món quà này đi. Chúng thật đáng yêu.Em biết không, anh đã bán chiếc đồng hồ để mua kẹp cho em. Giờ thì chúng ta có thể bắt đầu bữa tối được rồi em yêu’ …đó là một câu chuyện cảm động về tình yêu của hai bạn trẻ đã hết lòng yêu nhau.</p><p><strong>– O’ Henry</strong></p>', '2015-08-13 07:17:37', 1),
(3, 'Nói dối', 'Ngày đó nhà nghèo cha mất, mẹ tần tảo nhưng không đủ ăn. Để con có bữa ngon, mẹ gởi con về giỗ họ. Giữa đám cúng đông vui, chẳng ai đoái hoài, con bơ vơ lạc lõng… Về nhà mẹ hỏi con né tránh: “Dạ, vui! Cô bác mừng con…!!!”.\r\nLớn lên, con đi làm xa, tạm gọi là thành đạt. Ngày giỗ họ con về cùng con trẻ, mọi người vui gặp gỡ, chăm sóc đủ điều, từ miếng ăn, chiếc bánh…\r\nVề nhà nhìn ảnh mẹ con thấy lòng rưng rưng…', '2015-08-13 07:19:44', 2),
(4, 'Bà lão bán rau', '<p>- Ăn rau không chú ơi ?</p><p>Một giọng khàn khàn, run run làm gã giật mình. Trước mắt gã, một bà cụ già yếu, lưng còng cố ngước lên nhìn gã, bên cạnh là mẹt rau chỉ có vài mớ rau muống xấu mà có lẽ có cho cũng không ai thèm lấy. – Ăn hộ tôi mớ rau…! Giọng bà cụ vẫn khẩn khoản. Bà cụ nhìn gã ánh mắt gần như van lơn. Gã cụp mắt, rồi liếc xuống nhìn lại bộ đồ công sở đang khoác trên người, vừa mới buổi sáng sớm. Bần thần một lát rồi gã chợt quay đi, đáp nhanh: Dạ cháu không bà ạ! Gã nhấn ga phóng nhanh như kẻ chạy trốn. Gã chợt cảm thấy có lỗi, nhưng rồi cái cảm giác ấy gã quên rất nhanh. “Mình thương người thì ai thương mình” cái suy nghĩ ích kỷ ấy lại nhen lên trong đầu gã. – Ăn hộ tôi mớ rau cô ơi! Tiếng bà cụ yếu ớt. – Rau thế này mà bán cho người ăn à? Bà mang về mà cho lợn! Tiếng chan chát của một cô gái đáp lại lời bà cụ. Gã ngoái lại, một cô gái cũng tầm tuổi gã. Cau mày đợi cô gái đi khuất, gã đi đến nói với bà: – Rau này bà bán bao nhiêu? – Hai nghìn một mớ. Bà cụ mừng rỡ. Gã rút tờ mười nghìn đưa cho bà cụ. – Sao chú mua nhiều thế? – Con mua cho cả bạn con. Bây giờ con phải đi làm, bà cho con gửi đến chiều con về qua con lấy! Rồi gã cũng nhấn ga lao vút đi như sợ sệt ai nhìn thấy hành động vừa rồi của gã. Nhưng lần này có khác, gã cảm thấy vui vui. Chiều hôm ấy mưa to, mưa xối xả. Gã đứng trong phòng làm việc ngắm nhìn những hạt mưa lăn qua ô cửa kính và theo đuổi nhưng suy nghĩ mông lung. Gã thích ngắm mưa, gã thích ngắm những tia chớp xé ngang trời, gã thích thả trí tưởng tượng theo những hình thù kỳ quái ấy. Chợt gã nhìn xuống hàng cây đang oằn mình trong gió, gã nghĩ đến những phận người, gã nghĩ đến bà cụ… – Nghĩ thế đủ rồi đấy! Giọng người trưởng phòng làm gián đoạn dòng suy tưởng của gã. Gã ngồi xuống, dán mắt vào màn hình máy tính, gã bắt đầu di chuột và quên hẳn bà cụ. Mấy tuần liền gã không thấy bà cụ, gã cũng không để ý lắm. Gã đang bận với những bản thiết kế chưa hoàn thiện, gã đang cuống cuồng lo công trình của gã chậm tiến độ. Gã quên hẳn bà cụ. Chiều chủ nhật gã xách xe máy chạy loanh quanh, gã vẫn thường làm như vậy và có lẽ gã cũng thích thế. Gã ghé qua quán trà đá ven đường, nơi có mấy bà rỗi việc đang buôn chuyện. Chưa kịp châm điếu thuốc, gã chợt giật mình bởi giọng oang oang của một bà béo: – Bà bán rau chết rồi. – Bà cụ hay đi qua đây hả chị? Chị bán nước khẽ hỏi. – Tội nghiệp bà cụ! một giọng người đàn bà khác. – Cách đây mấy tuần bà cụ giở chứng cứ ngồi dưới mưa bên mấy mớ rau. Có người thấy thương hỏi mua giúp nhưng nhất quyết không bán, rồi nghe đâu bà cụ bị cảm lạnh. Nghe đến đây mắt gã chợt nhòa đi, điếu thuốc chợt rơi khỏi môi. Bên tai gã vẫn ù ù giọng người đàn bà béo kia. Gã không ngờ!</p><p><strong>– Sưu tầm –</strong></p>', '2015-08-13 07:20:12', 1),
(5, 'Bát cơm đáng giá mấy đồng?', '<p>Cô bé rón rén lại gần quầy bán cơm.</p><p>– Cô ơi cô cho con xin 1 chén cơm được không? Bữa nay mẹ con bệnh, không đi làm được, con không có tiền mua cơm…</p><p>– Không có tiền thì biến đi!</p><p>Ngày hôm sau cô bé lại tới, gương mặt rạng rỡ hơn hẳn</p><p>&nbsp;– Cô ơi cô bán cho con 3 ngàn cơm nha!</p><p>– Có mỗi 3 ngàn thì biến đi, ai bán 3 ngàn cơm cho mày! Cô bé nấc nghẹn, bàn tay cùng mấy tờ bạc lẻ run run…</p><p>– Dạ con tưởng… chỉ cần có tiền là sẽ mua được cơm…</p><p>Thế mới biết, thứ lạnh nhất trên thế gian này không phải là băng tuyết. Mà chính là trái tim con người… Nếu bạn đọc được thông điệp, thì làm ơn đừng hành xử như thế.</p><p><strong>– Sưu tầm –</strong></p>', '2015-08-14 12:26:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `phone`, `address`) VALUES
(1, 'daisy_only2005@yahoo.com.vn', '32aac12270d73c8c8d9171dd7a7f8b52', 'Huynh Truc Quyen', NULL, NULL),
(2, 'tester01@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tester', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_bill_of_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `fk_book_booked` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_details_of_bill` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_of_entry` FOREIGN KEY (`entry_id`) REFERENCES `entrys` (`id`);

--
-- Constraints for table `entrys`
--
ALTER TABLE `entrys`
  ADD CONSTRAINT `fk_entry_of_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
