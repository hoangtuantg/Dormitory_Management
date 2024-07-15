<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="login" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link href="styles/LoginPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Đăng nhập</h2>
                <div class="form-group">
                    <label for="username">Tên đăng nhập:</label>
                    <asp:TextBox ID="username" runat="server" CssClass="form-control form-control-lg" placeholder="Nhập username..." required></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <asp:TextBox ID="password" runat="server" CssClass="form-control form-control-lg" TextMode="Password" placeholder="Nhập password" required></asp:TextBox>
                </div>
                <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="text-danger" style="color:red; font-size:small"></asp:Label>
                <asp:Button ID="btnSubmit" runat="server" Text="Đăng nhập" type="submit" CssClass="btnsubmit" style="background-color:dodgerblue; color:aliceblue; border-color:dodgerblue" OnClick="btnSubmit_Click"/>
        </div>
    </form>
</body>
</html>
