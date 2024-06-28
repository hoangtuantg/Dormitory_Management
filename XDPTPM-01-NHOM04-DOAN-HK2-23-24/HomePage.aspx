<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ký Túc Xá Học Viện Nông Nghiệp Việt Nam</title>
	<link href="styles/HomePage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" EnablePageMethods="true" runat="server"/>
        <header>
            <img src="datas/images/bannerHomePage.png" alt="ảnh bìa">
			<title>Login Text</title>
			<div class="login-text">
				<a href="LoginPage.aspx">Đăng nhập</a>
			</div>
			<nav>
				<div class="container">	
					<ul>
					<li><a href=""></a><input type="text" placeholder="Tìm kiếm nhanh...."><button>Tìm Kiếm</button></li>
					<li><a href="WishPage.aspx">Nguyện Vọng</a></li>
					<li><a href="">Đăng Ký Ký Túc Xá</a></li>
					<li><a href="">Lịch Sử Tìm Kiếm</a></li>
					</ul>
				</div>
			</nav>
			<section class="menu-bar">
				<div class="container">
					<div class="menu-bar-container">
						<ul>
							<li><a href="">Trang Chủ</a></li>
							<li><a href="">Tin Tức</a></li>
							<li><a href="">Các Loại Phòng</a>
								<div class="submenu">
									<ul>
										<li><a href="">Phòng 6 Người</a></li>
										<li><a href="">Phòng 8 Người</a></li>
										<li><a href="">Phòng 10 Người</a></li>
									</ul>
								</div>
							</li>
							<li><a href="">Tra Cứu Hồ Sơ</a></li>
							<li><a href="">Sơ Đồ Phòng</a></li>
							<li><a href="">Liên Hệ</a></li>
						</ul>
					</div>
				</div>
			</section>
			<section class="slideshow">
        <div class="slideshow-container">

            <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="img11.jpg" style="width:70%">
            <div class="text"></div>
            </div>
            
            <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="img2.jpg" style="width:70%">
            <div class="text"></div>
            </div>
            
            <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="img3.jpg" style="width:70%">
            <div class="text"></div>
            </div>
			
			<div class="mySlides fade">
				<div class="numbertext"></div>
				<img src="img4.jpg" style="width:70%">
				<div class="text"></div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext"></div>
					<img src="img5.jpg" style="width:70%">
					<div class="text"></div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext"></div>
						<img src="img6.jpg" style="width:70%">
						<div class="text"></div>
						</div>

						<div class="mySlides fade">
							<div class="numbertext"></div>
							<img src="img7.jpg" style="width:70%">
							<div class="text"></div>
							</div>
            
							<div class="mySlides fade">
								<div class="numbertext"></div>
								<img src="img8.jpg" style="width:70%">
								<div class="text"></div>
								</div>

								<div class="mySlides fade">
									<div class="numbertext"></div>
									<img src="img9.jpg" style="width:70%">
									<div class="text"></div>
									</div>

									<div class="mySlides fade">
										<div class="numbertext"></div>
										<img src="img10.jpg" style="width:70%">
										<div class="text"></div>
										</div>
            <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span> 
            <span class="dot" onclick="currentSlide(2)"></span> 
            <span class="dot" onclick="currentSlide(3)"></span>
			<span class="dot" onclick="currentSlide(4)"></span> 
            <span class="dot" onclick="currentSlide(5)"></span> 
            <span class="dot" onclick="currentSlide(6)"></span>  
			<span class="dot" onclick="currentSlide(7)"></span> 
            <span class="dot" onclick="currentSlide(8)"></span> 
            <span class="dot" onclick="currentSlide(9)"></span> 
            </div>
    </section>
	<section class="">
		<div class="post">
			<img src="img10.jpg" style="width:10%">
			  <h2>Ký Túc Xá </h2>
			  <p>Giới Thiệu Về Ký Túc Xá Học Viện Nông Nghiệp</p>
			  <a href="#" class="read-more">Xem thêm</a>
			  <div class="full-content"></div>
			</div>
			<div class="post">
			  <img src="img11.jpg" style="width:10%">
			  <h2>Ký Túc Xá A2</h2>
			  <p>Giới thiệu ký túc xá A2</p>
			  <a href="#" class="read-more">Xem thêm</a>
			  <div class="full-content"></div>
			</div>
	</section>
	<script src="HomePage.js"></script>
        </header>
    </form>
	<footer>
		<p>&copy; 2024 Ký túc xá Học viện Nông nghiệp Việt Nam. All rights reserved.</p>
	</footer>
</body>
</html>
