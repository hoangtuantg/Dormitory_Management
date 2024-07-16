<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.SearchPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles/WishPage.css" rel="stylesheet" type="text/css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="container search-page" style="height: 65vh">
            <h2 class="text-center">Tra cứu tình trạng đơn đăng ký ký túc xá</h2>
            <div class="search-container m-4" style="margin-bottom: 50px; display: flex">
                <input type="text" runat="server" id="txtSearchWish" placeholder="Nhập mã sinh viên hoặc số CCCD">
                <asp:Button Text="Tra cứu" runat="server" CssClass="btn-search" OnClick="btnSearch_Click" style="padding: 5px 10px; margin-left: 10px; border-color: white; background-color: green; color: white; border-radius: 5px"/>
              
            </div>
            <!-- Khung thông tin -->
            <asp:Panel ID="pnlUserInfo" runat="server" CssClass="user-info" Visible="false">
                <p><strong style="font-size: 14px">Tên:</strong> <asp:Label ID="lblName" Font-Size="15px" runat="server"></asp:Label></p>
                <p><strong style="font-size: 14px">Số căn cước:</strong> <asp:Label ID="lblIDNumber" Font-Size="15px" runat="server"></asp:Label></p>
                <p><strong style="font-size: 14px">Trạng thái:</strong> <asp:Label ID="lblStatus" Font-Size="15px" runat="server"></asp:Label></p>
            </asp:Panel>

            <div class="instructions" style="margin-top: 40px">
                <h5>Hướng dẫn:</h5>
                <p>- Nhập mã sinh viên hoặc số CCCD của bạn vào ô tìm kiếm và nhấn "Tra cứu".</p>
                <p>- Trạng thái đơn: Chờ xử lý, Đã duyệt, Từ chối.</p>
                <p>- Nếu không tìm thấy thông tin, vui lòng kiểm tra lại mã sinh viên/CCCD hoặc liên hệ quản lý ký túc xá.</p>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
