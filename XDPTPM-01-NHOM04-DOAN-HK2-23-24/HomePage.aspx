<%@ Page Title="Ký túc xá VNUA" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.HomePage" %>

<asp:Content ID="dfd" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="sm" EnablePageMethods="true" runat="server" />
    <link href="styles/HomePage.css" rel="stylesheet" type="text/css" />
    <main class="content_page" id="homepage-content">
        <section class="slideshow">
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img11.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img2.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img3.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img4.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img5.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img6.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img7.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img8.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img9.jpg"/>
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext"></div>
                    <img src="./datas/images/img10.jpg"/>
                    <div class="text"></div>
                </div>
                <div style="text-align: center">
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
            </div>
        </section>

            <div class="conter">
    <div class="page_title">
        <h1>Ký túc xá Học viện Nông nghiệp Việt Nam</h1>
        <p>Tác giả: THM</p>
    </div>
    <section class="main_content">
            <div>
                <h2>Giới thiệu chung</h2>
                <p>Ký túc xá Học viện Nông nghiệp Việt Nam là nơi cung cấp chỗ ở cho hàng ngàn sinh viên đến từ khắp mọi miền đất nước. Nằm trong khuôn viên xanh mát và rộng lớn của Học viện, ký túc xá không chỉ là nơi ở mà còn là môi trường học tập, rèn luyện và phát triển toàn diện cho sinh viên.</p>
            </div>
            <div>
                <h2>Cơ sở vật chất</h2>
                <p>Ký túc xá được trang bị đầy đủ các tiện nghi hiện đại, bao gồm:</p>
                <ul >
                    <li >Phòng ở thoáng mát, sạch sẽ với các loại phòng phòng tập thể như phòng 4 ngươi, phòng 6 người và phòng 8 người.</li>
                    <li >Wifi miễn phí phủ sóng toàn khu vực ký túc xá.</li>
                    <li >Hệ thống an ninh 24/7 đảm bảo an toàn cho sinh viên.</li>
                    <li >Các khu vực sinh hoạt chung như phòng học, phòng thể dục, sân bóng đá, bóng chuyền, phòng tập gym.</li>
                </ul>
                <div class="image-container">
                    <img src="./datas/images/img9.jpg" alt="Ký túc xá Học viện Nông nghiệp Việt Nam">
                    <p class="image-caption"> Khuôn viên ký túc xá Học viện Nông nghiệp Việt Nam</p>
                </div>
            </div>
            <div>
                <h2>Hoạt động và dịch vụ</h2>
                <p>Ký túc xá Học viện Nông nghiệp Việt Nam thường xuyên tổ chức các hoạt động văn hóa, thể thao, giúp sinh viên thư giãn sau những giờ học căng thẳng. Ngoài ra, các dịch vụ hỗ trợ sinh viên như nhà ăn, giặt là, cửa hàng tiện lợi cũng được cung cấp đầy đủ.</p>
                <div class="image-container">
                    <img src="./datas/images/img10.jpg" alt="Hoạt động thể thao tại ký túc xá">
                    <p class="image-caption">Hoạt động thể thao tại ký túc xá</p>
                </div>
            </div>
            <div>
                <h2>Liên hệ</h2>
                <p>Để biết thêm thông tin chi tiết về ký túc xá Học viện Nông nghiệp Việt Nam, bạn có thể liên hệ theo thông tin:</p>
                <a href="Contact.aspx">Tại đây</a>
            </div>
    </section>
            </div>
        <script src="Scripts/WebForms/HomePage.js"></script>
    </main>
    
</asp:Content>



