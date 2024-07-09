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
            <input type="text" class="form-control" placeholder="Nhập mã cán bộ" id="searchID" aria-describedby="button-addon2" runat="server">
            <div class="input-group-append">
                <asp:button runat="server" CssClass="btn btn-outline-success" type="button" id="searchStaffBtn" Text="tìm kiếm" OnClick="searchStaffBtn_Click"/>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <asp:Panel ID="alertSucc" CssClass="alert alert-success" role="alert" runat="server" Visible="False">
                    <asp:Label runat="server" ID="MsgSucc" />
                </asp:Panel>
                <asp:GridView runat="server" ID="employeeList" AutoGenerateColumns="false" CssClass="table" OnSelectedIndexChanged="employeeList_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Mã cán bộ" DataField="employeeId" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="Họ Tên" DataField="employeeName" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="Giới tính" DataField="gender" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="Ngày sinh" DataField="dateOfBirth" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField HeaderText="Quản lí tòa" DataField="buildingName" ItemStyle-HorizontalAlign="Center" />
                        <asp:ButtonField CommandName="Select" Text="Xem" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-lg-4 rounded">
                <asp:Panel CssClass="container-fluid pb-3 pt-2 rounded" id="cardInfo" runat="server" Visible="False">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="staffID" class="text-success">Mã cán bộ</label>
                            <input type="text" class="form-control-plaintext" id="staffID" readonly runat="server">
                        </div>
                        <div class="form-group">
                            <label for="name" class="text-success">Họ tên</label>
                            <input type="text" class="form-control-plaintext" id="staffName" runat="server" readonly>
                            <input type="text" class="form-control" id="box_staffName" runat="server" visible="False">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="gender" class="text-success">Giới tính</label>
                            <asp:DropDownList runat="server" id="gender" CssClass="form-control" Visible="false">
                                <asp:ListItem>Nam</asp:ListItem>
                                <asp:ListItem>Nữ</asp:ListItem>
                            </asp:DropDownList>
                            <input type="text" class="form-control-plaintext" id="box_gender" runat="server" readonly>
                        </div>
                        <div class="form-group">
                            <label for="" class="text-success">Ngày sinh</label>
                            <input type="text" class="form-control-plaintext" id="birth" runat="server" readonly>
                            <input type="date" class="form-control" id="box_birth" runat="server" visible="False" placeholder="dd/mm/yyyy">
                        </div>
                        <div class="form-group">
                            <label for="" class="text-success">Tòa quản lý</label>
                            <input type="text" class="form-control-plaintext" id="buildingId" runat="server" readonly>
                            <asp:DropDownList runat="server" CssClass="form-control" Visible="false" ID="box_buildingId">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:button Text="Cập nhật" CssClass="btn btn-primary" id="btnUpdate" runat="server" Visible="False" OnClick="btnUpdate_Click"/>
                    <asp:button Text="Sửa" CssClass="btn btn-warning" id="btnEdit" runat="server" onclick="editBtn_Click"/>
                    <asp:button Text="Hủy" CssClass="btn btn-warning" id="btnCancel" runat="server" Visible="false" OnClick="btnCancel_Click"/>
                    <asp:button Text="Xóa" CssClass="btn btn-danger" id="btnDelete" runat="server" OnClick="btnDelete_Click" OnClientClick="javascript:confirm('Bạn có thực sự muốn xóa không?');"/>
                </asp:Panel>
                <asp:Panel ID="alertErr" CssClass="alert alert-danger" role="alert" runat="server" Visible="False">
                    <asp:Label runat="server" ID="MsgErr" />
                </asp:Panel>
            </div>
        </div>     
    </div>

</asp:Content>
