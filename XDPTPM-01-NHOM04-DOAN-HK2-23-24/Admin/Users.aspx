<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Thông tin cá nhân</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <img src="https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745" alt="" width ="250px"/>
            </div>
            <div class="col-lg-6 rounded">
                <div class="container-fluid pb-3 pt-2 bg-forestgreen rounded">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fullname">Tên cán bộ</label>
                            <input type="text" class="form-control" id="fullname">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="username">Tài khoản</label>
                            <input type="text" class="form-control" id="username">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="oldPass">Mật khẩu cũ</label>
                            <input type="text" class="form-control" id="oldPass">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="newPass">Mật khẩu mới</label>
                            <input type="text" class="form-control" id="newPass">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <button type="submit" class="btn btn-warning">Sửa</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </div>     
    </div>

</asp:Content>
