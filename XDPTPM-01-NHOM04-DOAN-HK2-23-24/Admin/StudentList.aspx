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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

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
                    <label for="" class="form-label text-success">Ngày sinh</label>
                    <asp:TextBox ID="SDOB" runat="server" CssClass="form-control" TextMode="Date" placeholder="dd/mm/yyyy"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label text-success">Phòng</label>
                    <input type="text" placeholder="Phòng ..." autocomplete="off" class="form-control" runat="server" id="SRoom"/>
                </div>

                <div class="row">
                    <div class="col d-grid">
                        <asp:Button Text="Thêm" runat="server" id="AddBtn" width="65px"  class="btn-outline-success btn-block btn" OnClick="AddBtn_Click" />

                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Sửa" runat="server" id="UpdateBtn" class="btn-outline-primary btn-block btn" OnClick="UpdateBtn_Click" />
                    </div>

                    <div class="col d-grid">
                        <asp:Button Text="Xóa" runat="server" id="DeleteBtn" class="btn-outline-danger btn-block btn" OnClick="DeleteBtn_Click" />

                    </div>

                    <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                </div>
            </div>
            <div class="col-md-9 col-lg-9">
                <div class="mb-3">
                    <label for="txtSearchStudent" class="form-label text-success">Tìm kiếm sinh viên</label>
                    <input type="text" placeholder="Nhập tên sinh viên, CCCD hoặc mã sinh viên ..." autocomplete="off" class="form-control" runat="server" id="txtSearchStudent" />
                </div>
                <div class="d-flex justify-content-between">
                     <asp:Button Text="Tìm kiếm" runat="server" ID="SearchStudentBtn"  class="btn-outline-info btn-block btn" width="100px" OnClick="SearchStudentBtn_Click"/> 
                     <asp:Button ID="ExitSearchStudentBtn" runat="server" class="btn-outline-info btn-block btn" OnClick="ExitSearchStudentBtn_Click" Text="Hủy tìm" Width="100" />
                </div>
                <br />
                <asp:GridView ID="StudentLists" runat="server" AllowPaging="True" AutoGenerateColumns="false" AutoGenerateSelectButton="false" class="table table-bordered" OnPageIndexChanging="StudentLists_PageIndexChanging" OnSelectedIndexChanged="StudentLists_SelectedIndexChanged" PageSize="3">
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" ItemStyle-HorizontalAlign="Center" Text="Chọn" />
                        <asp:BoundField DataField="studentID" HeaderText="ID" />
                        <asp:BoundField DataField="studentName" HeaderText="Tên SV" />
                        <asp:BoundField DataField="createAt" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày thêm" />
                        <asp:BoundField DataField="gender" HeaderText="Giới tính" />
                        <asp:BoundField DataField="StudentCode" HeaderText="MSV" />
                        <asp:BoundField DataField="numIdentify" HeaderText="CCCD" />
                        <asp:BoundField DataField="dateOfBirth" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />
                        <asp:BoundField DataField="roomName" HeaderText="Phòng" />
                    </Columns>
                </asp:GridView>
                </br>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
