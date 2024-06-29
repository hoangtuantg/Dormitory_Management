<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="StaffList.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.StaffList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Danh sách cán bộ</h3>
            </div>
        </div>

        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Nhập mã cán bộ" aria-label="StudentID" aria-describedby="button-addon2">
            <div class="input-group-append">
                <button class="btn btn-outline-success" type="button" id="searchStudentBtn">tìm kiếm</button>
            </div>
        </div>
        <div class="sort row">
            <div class="input-group mb-3 col-sm-6">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Họ tên</label>
                </div>
                <select class="custom-select" id="inputGroupSelect01">
                    <option value="" selected>từ A -> Z</option>
                    <option value="decrise">từ Z -> A</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Mã cán bộ</th>
                            <th scope="col">Họ tên</th>
                            <th scope="col">Tòa quản lý</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Nguyễn Văn A</td>
                            <td>A1</td>
                        </tr>
                    </tbody>
                </table>
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
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="gender">Giới tính</label>
                            <input type="text" class="form-control" id="gender">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="room_id">Tòa quản lý</label>
                            <input type="text" class="form-control" id="room_id">
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
