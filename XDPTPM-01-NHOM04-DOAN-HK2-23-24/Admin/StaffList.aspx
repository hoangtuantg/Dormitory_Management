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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-3 rounded">
                        <h5 class="text-success">Thông tin chi tiết</h5>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="text-success" ID="lbStaffID" Visible="false" Text="Mã cán bộ" />
                            <input type="text" class="form-control-plaintext" id="staffID" visible="False" readonly runat="server" />
                            <asp:Label runat="server" ID="msgValidStaffID" CssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="name" class="text-success">Họ tên</label>
                            <input type="text" class="form-control-plaintext" id="staffName" runat="server" visible="False" readonly>
                            <input type="text" class="form-control" id="box_staffName" runat="server">
                            <asp:Label runat="server" ID="msgValidStaffName" CssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="gender" class="text-success">Giới tính</label>
                            <asp:DropDownList runat="server" ID="gender" CssClass="form-control">
                                <asp:ListItem Value="0">--Chọn giới tính--</asp:ListItem>
                                <asp:ListItem Value="1">Nam</asp:ListItem>
                                <asp:ListItem Value="2">Nữ</asp:ListItem>
                            </asp:DropDownList>
                            <input type="text" class="form-control-plaintext" id="box_gender" runat="server" visible="False" readonly>
                            <asp:Label runat="server" ID="msgValidGender" CssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="" class="text-success">Ngày sinh</label>
                            <input type="text" class="form-control-plaintext" id="birth" runat="server" visible="False" readonly>
                            <input type="date" class="form-control" id="box_birth" runat="server" placeholder="dd/mm/yyyy">
                            <asp:Label runat="server" ID="msgValidBirth" CssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="name" class="text-success">Công việc</label>
                            <input type="text" class="form-control-plaintext" id="job" runat="server" visible="False" readonly>
                            <input type="text" class="form-control" id="box_job" runat="server">
                            <asp:Label runat="server" ID="msgValidJob" CssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="" class="text-success">Tòa làm việc</label>
                            <input type="text" class="form-control-plaintext" id="buildingId" runat="server" visible="False" readonly>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="box_buildingId">
                            </asp:DropDownList>
                            <asp:Label runat="server" ID="msgValidBuild" CssClass="text-danger" />
                        </div>
                        <asp:Button Text="Thêm cán bộ" CssClass="btn btn-outline-success" ID="btnAdd" runat="server" OnClick="btnAdd_Click" />
                        <asp:Button Text="Cập nhật" CssClass="btn btn-outline-primary" ID="btnUpdate" runat="server" Visible="False" OnClick="btnUpdate_Click" />
                        <asp:Button Text="làm lại" CssClass="btn btn-outline-secondary" ID="btnReset" runat="server" OnClick="btnReset_Click" />
                        <asp:Button Text="Sửa" CssClass="btn btn-outline-warning" ID="btnEdit" runat="server" OnClick="editBtn_Click" Visible="false" />
                        <asp:Button Text="Hủy" CssClass="btn btn-outline-warning" ID="btnCancel" runat="server" Visible="false" OnClick="btnCancel_Click" />
                        <asp:Button Text="Xóa" CssClass="btn btn-outline-danger" ID="btnDelete" runat="server" OnClick="btnDelete_Click" OnClientClick="javascript:confirm('Bạn có thực sự muốn xóa không?');" Visible="false" />
                        <asp:Label runat="server" ID="MsgErr" CssClass="text-danger d-block" />
                    </div>
                    <div class="col-lg-9">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Nhập mã hoặc tên cán bộ" id="searchID" aria-describedby="button-addon2" runat="server">
                            <div class="input-group-append">
                                <asp:Button runat="server" CssClass="btn btn-outline-success" type="button" ID="searchStaffBtn" Text="tìm kiếm" OnClick="searchStaffBtn_Click" />
                            </div>
                        </div>
                        <asp:Label runat="server" ID="msgSearch" CssClass="alert alert-danger" Visible="false" />
                            <asp:Label runat="server" CssClass="text-success" ID="MsgSucc" />
                        <asp:GridView runat="server" ID="employeeList" AutoGenerateColumns="false" CssClass="table" OnSelectedIndexChanged="employeeList_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField HeaderText="Mã cán bộ" DataField="employeeId" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Họ Tên" DataField="employeeName" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Giới tính" DataField="gender" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Ngày sinh" DataField="dateOfBirth" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField HeaderText="Công việc" DataField="job" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Tòa làm việc" DataField="buildingName" ItemStyle-HorizontalAlign="Center" />
                                <asp:ButtonField CommandName="Select" Text="Xem" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
