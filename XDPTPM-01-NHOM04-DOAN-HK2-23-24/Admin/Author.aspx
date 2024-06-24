<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.Author" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col mt-4 mb-4 room-title rounded">
                <h3 class="text-center">Cơ sở vật chất</h3>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Nhập mã phòng" aria-describedby="button-addon3" />
        <div class="input-group-append">
            <button class="btn btn-outline-success" type="button" id="searchStudent">Tìm kiếm</button>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Tòa</th>
                        <th scope="col">Mã phòng</th>
                        <th scope="col">Tủ Đồ</th>
                        <th scope="col">Điều hòa</th>
                        <th scope="col">Diện tích phòng(m2)</th>
                        <th scope="col">Số lượng giường</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>KTX A2</td>
                        <td>01</td>
                        <td>1</td>
                        <td>1</td>
                        <td>34</td>
                        <td>5</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-sm-6">
            <div class="container-fluid pb-3 pt-2 bg-forestgreen">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Tòa</label>
                        <input type="text" autocomplete="off" class="form-control" id="building_id">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputName">Mã phòng</label>
                        <input type="text" autocomplete="off" class="form-control" id="room_id">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="student_id">Tủ đồ</label>
                        <input type="text" autocomplete="off" class="form-control" id="wardrobe">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="_class">Điều hòa</label>
                        <input type="text" autocomplete="off" class="form-control" id="airConditioner">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Diện tích phòng(m2)</label>
                        <input type="text" autocomplete="off" class="form-control" id="roomArea">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="">Số lượng giường</label>
                        <input type="text" autocomplete="off" class="form-control" id="numBeds">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Thêm</button>
                <button type="submit" class="btn btn-danger">Sửa</button>
                <button type="submit" class="btn btn-success">Xóa</button>
            </div>
        </div>
    </div>
</asp:Content>

