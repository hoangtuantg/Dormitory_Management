<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Danh sách sinh viên</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <div class="mb-3">
                    <label for="" class="form-label text-success">Tên sinh viên</label>
                    <input type="text" placeholder="Tên sinh viên ..." autocomplete="off" class="form-control" runat="server" id="SName"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Giới tính</label>
                    <asp:DropDownList  runat="server" CssClass="form-control" id="gender">
                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nữ</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Mã sinh viên</label>
                    <input type="text" placeholder="Mã sinh viên ..." autocomplete="off" class="form-control" runat="server" id="MSV"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">CCCD</label>
                    <input type="text" placeholder="CCCD ..." autocomplete="off" class="form-control" runat="server" id="CCCD"/>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label text-success">Ngày tháng năm sinh</label>
                    <input type="text" placeholder="Ngày tháng năm sinh ..." autocomplete="off" class="form-control" runat="server" id="Dob"/>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label text-success">Phòng</label>
                    <input type="text" placeholder="Phòng ..." autocomplete="off" class="form-control" runat="server" id="SRoom"/>
                </div>

                <div class="row">
                    <div class="col d-grid">
                        <asp:Button Text="Thêm" runat="server" id="AddBtn" width="65px"  class="btn-outline-success btn-block btn" />

                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Sửa" runat="server" id="UpdateBtn" class="btn-outline-primary btn-block btn" />
                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Xóa" runat="server" id="DeleteBtn" class="btn-outline-danger btn-block btn" />

                    </div>

                    <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                </div>
            </div>
            <div class="col-md-8">
                <div class="mb-3">
                    <label for="txtSearchStudent" class="form-label text-success">Tìm kiếm sinh viên</label>
                    <input type="text" placeholder="Tìm kiếm sinh viên ..." autocomplete="off" class="form-control" runat="server" id="txtSearchStudent" />
                </div>

                <asp:Button Text="Tìm kiếm" runat="server" ID="SearchStudentBtn"  class="btn-outline-info btn-block btn" width="100px" OnClick="SearchStudentBtn_Click"/> </br>

                <asp:GridView ID="StudentLists" runat="server" AutoGenerateColumns="false" class="table table-bordered" AutoGenerateSelectButton="True"  AllowPaging="True" PageSize="3"  OnPageIndexChanging="StudentLists_PageIndexChanging" OnSelectedIndexChanged="StudentLists_SelectedIndexChanged">
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333"/>
                    <Columns>
                        <asp:BoundField DataField="studentID" HeaderText="ID" />
                        <asp:BoundField DataField="studentName" HeaderText="Tên SV" />
                        <asp:BoundField DataField="createAt" HeaderText="Ngày thêm" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="gender" HeaderText="Giới tính" />
                        <asp:BoundField DataField="StudentCode" HeaderText="MSV" />
                        <asp:BoundField DataField="numIdentify" HeaderText="CCCD"/>
                        <asp:BoundField DataField="dateOfBirth" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="roomId" HeaderText="Phòng" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
