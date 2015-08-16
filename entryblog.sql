-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2015 at 06:13 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `date`, `entry_id`) VALUES
(14, 'Tester', 'Hay và ý nghĩa lắm.', '2015-08-13 19:27:42', 4),
(15, 'Mimi', 'Thật đau lòng! :(', '2015-08-14 11:45:38', 4),
(16, 'Traitor', 'WTH??!!', '2015-08-14 16:24:20', 5),
(17, 'Người sao hỏa', 'Hay quá senpai ơi!', '2015-08-14 23:03:23', 1),
(18, 'Ngẫm', 'Con người sinh ra là để thương nhau vậy mà...', '2015-08-14 23:31:22', 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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
