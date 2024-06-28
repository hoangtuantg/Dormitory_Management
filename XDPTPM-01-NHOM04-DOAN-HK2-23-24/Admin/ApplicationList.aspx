<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ApplicationList.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.BookType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="col mt-4 mb-4 room-title rounded">
            <h3 class="text-center">Danh sách đơn đăng ký</h3>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Nhập mã sinh viên" aria-describedby="button-addon3" />
            <div class="input-group-append">
                <button class="btn btn-outline-success" type="button" id="searchStudent">Tìm kiếm</button>
            </div>
        </div>
        <div class="sort row">
            <div class="col-sm-5">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelecter">Họ tên</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect02">
                        <option value="selected">từ A->Z</option>
                        <option value="decrise">từ Z->A</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Mã sinh viên</th>
                            <th scope="col">Họ tên</th>
                            <th scope="col">Lớp</th>
                            <th scope="col">Lý Do Muốn Vào Ở Ký Túc Xá</th>
                            <th scope="col">Mong Muốn Ở Ký Túc Xá Nào</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>670113</td>
                            <td>Nguyễn Văn A</td>
                            <td>K67CNSHA</td>
                            <td>Tiết kiệm chi phí</td>
                            <td>Kí túc xá A2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-6">
                <div class="container-fluid pb-3 pt-2 bg-forestgreen">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputName">Họ tên</label>
                            <input type="text" autocomplete="off" class="form-control" id="inputName">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="student_id">Mã sinh viên</label>
                            <input type="text" autocomplete="off" class="form-control" id="student_id">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="_class">Lớp</label>
                            <input type="text" autocomplete="off" class="form-control" id="_class">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="">Lý Do Muốn Vào Ở Ký Túc Xá </label>
                            <input type="text" autocomplete="off" class="form-control" id="_reason">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">Mong muốn ở kí túc xá nào</label>
                            <input type="text" autocomplete="off" class="form-control" id="_desire">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Chấp nhận đơn đăng ký</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

