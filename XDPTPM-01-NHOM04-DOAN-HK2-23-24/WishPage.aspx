<%@ Page Title="Đăng kí nguyện vọng" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="WishPage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.WishPage" %>

<asp:Content ID="NguyenVong" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles/WishPage.css" rel="stylesheet" type="text/css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <main class="container">
        
            <h2 class="page_title">Đăng Ký Nguyện Vọng Ở Ký Túc Xá</h2>
            <div class="form-row">
                <label for="ma_sv">
                    Mã Sinh Viên
                        <span style="color: red; font-size: 12px">(nếu có)</span>
                </label>
                <input runat="server" type="text" id="studentCode" name="ma_sv" class="form-control" >
            </div>
            <div class="form-row">
                <label for="ma_sv">Số căn cước công dân</label>
                <input runat="server" type="text" id="numIdentify" name="so_cc" class="form-control" required>
            </div>
            <div class="form-row">
                <label for="ho_ten">Họ và tên</label>
                <input runat="server" type="text" id="studentName" name="ho_ten" class="form-control" required>
            </div>
            <div class="form-row">
                <label for="lop">Khoa</label>
                <input runat="server" type="text" id="major" name="khoa" class="form-control" required>
            </div>
            <div class="form-row">
                <label for="lop">Lớp</label>
                <input runat="server" type="text" id="Class" name="lop" class="form-control" required>
            </div>
            <div class="form-row">
                <label for="ly_do">Lý do muốn đăng ký ở ký túc xá</label>
                <textarea runat="server" id="reason" name="ly_do" rows="4" required></textarea>
            </div>
            <div>
                <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
            </div>
            <div class="form-row d-flex justify-content-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Đăng ký" type="button" CssClass="btnsubmit" OnClick="btnSubmit_Click" />
            </div>
      
    </main>
</asp:Content>


