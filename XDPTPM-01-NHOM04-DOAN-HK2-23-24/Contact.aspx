<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <link href="styles/Contact.css" rel="stylesheet" />
    <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1316.8830970366816!2d105.93306563531485!3d21.00434406532411!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135a8cd8b29feb5%3A0x4cb431613aad74e2!2zS8OtIHTDumMgeMOhIEEy!5e0!3m2!1svi!2s!4v1719658248180!5m2!1svi!2s"
        style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
        class="ggMap"></iframe>
    <main class="container">
        <div class="row content">
                 <div class="row content-icon-container">
                    <img src="./datas/images/Facebook.jpg" style="width: 5%" style="height: 5%" alt="Icon 1" class="row content-icon-container-icon">
                    <img src="./datas/images/YouTube.jpg" style="width: 5%" style="height: 5%" alt="Icon 2" class="row content-icon-container-icon">
                    <img src="./datas/images/Instagram.jpg" style="width: 5%" style="height: 5%" alt="Icon 3" class="row content-icon-container-icon">
                    <img src="./datas/images/Google.jpg" style="width: 5%" style="height: 5%" alt="Icon 4" class="row content-icon-container-icon">
                    <img src="./datas/images/Map.jpg" style="width: 5%" style="height: 5%" alt="Icon 4" class="row content-icon-container-icon">
                 </div>
            <div class="col-5">
                <h3>Địa chỉ liên hệ</h3>
                <address>
                    Ban Công tác chính trị & Công tác sinh viên<br />
                    Địa chỉ: Phòng 101-106, Nhà hành chính, Học viện Nông nghiệp Việt Nam<br />
                    <abbr title="Phone">Điện thoại:</abbr>
                    024.6261.7528
                </address>

                <address>
                    <strong>Email:</strong> <a href="mailto:ctsv@vnua.edu.vn">ctsv@vnua.edu.vn</a><br />
                </address>
            </div>
        </div>
    </main>
</asp:Content>
