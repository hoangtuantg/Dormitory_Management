<%@ Page Title="Đăng kí nguyện vọng" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="WishPage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.WishPage" %>

<asp:Content ID="NguyenVong" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles/WishPage.css" rel="stylesheet" type="text/css" />
        <div class="container">
            <form action="submit.php" method="POST">
                <h2>Đăng Ký Nguyện Vọng Ở Ký Túc Xá</h2>
                <div class="form-row">
                    <label for="ma_sv">Mã Sinh Viên
                        <span style="color:red; font-size: 12px">(nếu có)</span>
                    </label>
                    <input type="text" id="ma_sv" name="ma_sv" required>
                </div>
                <div class="form-row">
                    <label for="ma_sv">Số căn cước công dân</label>
                    <input type="text" id="so_cc" name="so_cc" required>
                </div>
                <div class="form-row">
                    <label for="ho_ten">Họ và tên</label>
                    <input type="text" id="ho_ten" name="ho_ten" required>
                </div>
                <div class="form-row">
                    <label for="lop">Khoa</label>
                    <input type="text" id="khoa" name="khoa" required>
                </div>
                <div class="form-row">
                    <label for="lop">Lớp</label>
                    <input type="text" id="lop" name="lop" required>
                </div>
                <div class="form-row">
                    <label for="ly_do">Lý do muốn đăng ký ở ký túc xá</label>
                    <textarea id="ly_do" name="ly_do" rows="4" required></textarea>
                </div>
                <div class="form-row">
                    <label for="mong_muon_ktx">Ký túc xá mong muốn</label>
                    <select id="mong_muon_ktx" name="mong_muon_ktx" required>
                        <option value="ktx1">Ký Túc Xá A2</option>
                        <option value="ktx2">Ký Túc Xá B3</option>
                        <option value="ktx3">Ký Túc Xá B4</option>
                    </select>
                </div>
                <div class="form-row d-flex justify-content-center">
                    <button class="col-6" type="submit">Đăng Ký</button>
                </div>
            </form>
        </div>
</asp:Content>

    
