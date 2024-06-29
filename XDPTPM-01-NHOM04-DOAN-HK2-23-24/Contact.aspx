<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles/Contact.css" rel="stylesheet" />
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1316.8830970366816!2d105.93306563531485!3d21.00434406532411!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135a8cd8b29feb5%3A0x4cb431613aad74e2!2zS8OtIHTDumMgeMOhIEEy!5e0!3m2!1svi!2s!4v1719658248180!5m2!1svi!2s" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="ggMap"></iframe>
    <div class="row py-4">
        <div class="col-lg-5">
            <h2 class="title">Liên hệ</h2>
            <span class="subTitle">Hãy nhập mẫu dưới đây để liên hệ với chúng tôi!</span>
            <form class="contactForm" id="contactForm" action="/" method="post">
                <div class="form-group">
                    <label for="fullName">Họ tên</label>
                    <input type="text" name="fullName" value="" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" value="" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" name="phone" value="" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Nội dung liên hệ:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-success">Gửi</button>
            </form>
        </div>
        <div class="col-lg-7">
            <h3>Địa chỉ liên hệ</h3>
            <address>
                Kí túc xá học viện nông nghiệp<br />
                <abbr title="Phone">SĐT:</abbr>
                123 456 789
            </address>

            <address>
                <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
            </address>
        </div>
    </div>
    <main aria-labelledby="title">
        
    </main>
</asp:Content>
