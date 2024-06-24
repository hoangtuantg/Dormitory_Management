<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <h3 class="text-center mt-4 mb-4">Danh sách sinh viên</h3>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Nhập mã sinh viên" aria-label="StudentID" aria-describedby="button-addon2">
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
            <div class="input-group mb-3 col-sm-6">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect02">Phòng</label>
                </div>
                <select class="custom-select" id="inputGroupSelect02">
                    <option value="" selected>từ nhỏ -> lớn</option>
                    <option value="decrise">từ lớn -> nhỏ</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">MSV</th>
                            <th scope="col">Họ tên</th>
                            <th scope="col">Phòng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Nguyễn Văn A</td>
                            <td>101</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-6">
                <div class="container-fluid pb-3 pt-2 bg-forestgreen">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="name">Họ tên</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="student_id">Mã sinh viên</label>
                            <input type="text" class="form-control" id="student_id">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="gender">Giới tính</label>
                            <input type="text" class="form-control" id="gender">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="room_id">Số phòng</label>
                            <input type="text" class="form-control" id="room_id">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="cohort">Khóa</label>
                            <input type="text" class="form-control" id="cohort">
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
