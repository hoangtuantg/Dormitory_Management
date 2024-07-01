<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.HomePage" %>

<asp:Content ID="dfd" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="sm" EnablePageMethods="true" runat="server" />
    <header class="">
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
        <script src="Scripts/WebForms/HomePage.js"></script>
    </header>
    
</asp:Content>



