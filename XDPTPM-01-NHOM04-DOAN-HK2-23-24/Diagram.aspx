<%@ Page Title="Sơ đồ" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Diagram.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Diagram" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles/Diagram.css" rel="stylesheet" />
    <main class="container main_container">
        <h2 class="page_title">Sơ đồ KTX</h2>
        <div class="select_gr">
            <select>
                <option value="0">---Chọn ký túc xá---</option>
                <option value="1">KTX A1</option>
                <option value="2">KTX A2</option>
                <option value="3">KTX B2</option>
                <option value="4">KTX B3</option>
                <option value="5">KTX B4</option>
                <option value="6">KTX C1</option>
                <option value="7">KTX C2</option>
                <option value="8">KTX C3</option>
                <option value="9">KTX C4</option>
                <option value="10">KTX C5</option>
            </select>
            <button>Xem</button>
        </div>
        <p>Tổng Học viện hiện có 10 khu ký túc xá bao gồm các khu nhà : A1, A2, B2, B3, B4, C1, C2, C3, C4, C5</p>
        <a href="https://banqlcsvc.vnua.edu.vn/ky-tuc-xa/">Xem thống kê</a>
    </main>
</asp:Content>