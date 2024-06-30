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
                <img src="https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745" alt="" width ="300px"/>
            </div>
            <div class="col-lg-6 rounded">
                <div class="container-fluid pb-3 pt-2 bg-forestgreen rounded">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="staff_id">Mã cán bộ</label>
                            <input type="text" class="form-control" id="staff_id">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Họ tên</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="student_id">Tòa quản lý</label>
                            <input type="text" class="form-control" id="student_id">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="gender">Giới tính</label>
                            <input type="text" class="form-control" id="gender">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="gender">ABC</label>
                            <input type="text" class="form-control" id="gender">
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
