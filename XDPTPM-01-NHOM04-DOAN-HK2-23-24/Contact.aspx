<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <link href="styles/Contact.css" rel="stylesheet" />
    <div class="banner">
        <img src="./datas/images/bannerContact.png" alt="Banner" class="bannerImg" />
    </div>
    <main class="container">
        <section class="content grid">
            <div class="contact_info">
                <h2 class="page_title">Liên hệ với chúng tôi</h2>
                <hr />
                <h3 class="contact_title">Thông tin liên hệ: Ban Công tác chính trị & Công tác sinh viên</h3>
                <address class="address">
                    <i class="fa fa-map-marker address_icon"></i>
                    <div>
                        <strong>Địa chỉ:</strong>
                        Phòng 101-104, Khu làm việc của các Khoa, Viện, Trung tâm - Học viện Nông nghiệp Việt Nam – Trâu Quỳ - Gia Lâm – Hà Nội.
                    </div>
                </address>
                <address class="address">
                    <i class="fa fa-phone address_icon"></i>
                    <div>
                        <strong>Điện thoại:</strong><br />
                        024.6261.7528 - 0243 6762915; 0989 296 922
                    </div>                 
                </address>
                <address class="address">
                    <i class="fa fa-envelope address_icon"></i>
                    <div>
                        <strong>Email:</strong><br />
                        <a href="mailto:ctsv@vnua.edu.vn"> ctsv@vnua.edu.vn</a><br />
                    </div>               
                </address>
            </div>
            <div class="gg_map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1316.8830970366816!2d105.93306563531485!3d21.00434406532411!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135a8cd8b29feb5%3A0x4cb431613aad74e2!2zS8OtIHTDumMgeMOhIEEy!5e0!3m2!1svi!2s!4v1719658248180!5m2!1svi!2s"
                    style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                    class="ggMap"></iframe>
            </div>
        </section>
           
    </main>
</asp:Content>
