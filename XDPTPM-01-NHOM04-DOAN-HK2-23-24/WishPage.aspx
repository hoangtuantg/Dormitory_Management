<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WishPage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.WishPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Ký Nguyện Vọng Ở Ký Túc Xá</title>
    <link href="styles/WishPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <form action="submit.php" method="POST">
                <h2>Đăng Ký Nguyện Vọng Ở Ký Túc Xá</h2>
                <div class="form-row">
                    <label for="ma_sv">Mã Sinh Viên</label>
                    <input type="text" id="ma_sv" name="ma_sv" required>
                </div>
                <div class="form-row">
                    <label for="ho_ten">Họ và Tên</label>
                    <input type="text" id="ho_ten" name="ho_ten" required>
                </div>
                <div class="form-row">
                    <label for="lop">Lớp</label>
                    <input type="text" id="lop" name="lop" required>
                </div>
                <div class="form-row">
                    <label for="ly_do">Lý Do Muốn Vào Ở Ký Túc Xá</label>
                    <textarea id="ly_do" name="ly_do" rows="4" required></textarea>
                </div>
                <div class="form-row">
                    <label for="mong_muon_ktx">Mong Muốn Ở Ký Túc Xá Nào</label>
                    <select id="mong_muon_ktx" name="mong_muon_ktx" required>
                        <option value="ktx1">Ký Túc Xá 1</option>
                        <option value="ktx2">Ký Túc Xá 2</option>
                        <option value="ktx3">Ký Túc Xá 3</option>
                    </select>
                </div>
                <button type="submit">Gửi Đăng Ký</button>
            </form>
        </div>
    </form>
</body>
</html>
