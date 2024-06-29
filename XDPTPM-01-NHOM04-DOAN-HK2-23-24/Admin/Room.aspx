<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Quản lý Phòng Ký Túc Xá</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="" class="form-label text-success">Tên phòng</label>
                    <input type="text" placeholder="Phòng ..." autocomplete="off" class="form-control" runat="server" id="BName"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Người quản lý</label>
                    <input type="text" placeholder="Quản lý ..." autocomplete="off" class="form-control" runat="server" id="BAuthor"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Tòa</label>
                    <input type="text" placeholder="Tòa ..." autocomplete="off" class="form-control" runat="server" id="BType"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Số lượng người ở tối đa</label>
                    <input type="text" placeholder="Số lượng tối đa ..." autocomplete="off" class="form-control" runat="server" id="BPrice"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Số lượng người ở hiện tại</label>
                    <input type="text" placeholder="Số lượng hiện tại ..." autocomplete="off" class="form-control" runat="server" id="BQuantity"/>
                </div>

                <div class="row">
                    <div class="col d-grid">
                        <asp:Button Text="Sửa" runat="server" id="UpdateBtn" class="btn-outline-primary btn-block btn" />
                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Thêm mới" runat="server" id="AddBtn" class="btn-outline-success btn-block btn" />

                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Xóa" runat="server" id="DeleteBtn" class="btn-outline-danger btn-block btn" />

                    </div>

                    <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                </div>
            </div>
            <div class="col-md-8">
                <div class="mb-3">
                    <label for="txtSearchBook" class="form-label text-success">Tìm kiếm sách</label>
                    <input type="text" placeholder="Tìm kiếm phòng ..." autocomplete="off" class="form-control" runat="server" id="txtSearchBook" />
                </div>

                <asp:Button Text="Tìm kiếm" runat="server" ID="SearchBookBtn"  class="btn-outline-info btn-block btn" width="100"/> </br>

                <asp:GridView ID="RoomList" runat="server" class="table table-bordered" AutoGenerateSelectButton="True"  AllowPaging="True" PageSize="5">
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333"/>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>