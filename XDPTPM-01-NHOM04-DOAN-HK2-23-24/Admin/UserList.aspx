<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
    <div class="row">
        <div class="col mt-4 mb-4 title rounded">
            <h3 class="text-center">Danh sách người dùng</h3>
        </div>
    </div>
<asp:ScriptManager ID="ScriptManager4" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel4" runat="server">
<ContentTemplate>
    <div class="row">
        <div class="col-md-3">
            <div class="mb-3">
                <label for="" class="form-label text-success">Tên người dùng</label>
                <input type="text" placeholder="Tên người dùng ..." autocomplete="off" class="form-control" runat="server" id="FName"/>
            </div>

            <div class="mb-3">
                <label for="" class="form-label text-success">Ngày sinh</label>
                <asp:TextBox ID="UDOB" runat="server" CssClass="form-control" TextMode="Date" placeholder="dd/mm/yyyy"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="" class="form-label text-success">Giới tính</label>
                <asp:DropDownList  runat="server" CssClass="form-control" id="gender">
                    <asp:ListItem>Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:DropDownList>
            </div>


            <div class="mb-3">
                <label for="" class="form-label text-success">Tài khoản</label>
                <input type="text" placeholder="Tài khoản ..." autocomplete="off" class="form-control" runat="server" id="UName"/>
            </div>
            <div class="mb-3">
                <label for="" class="form-label text-success">Mật khẩu</label>
                <input type="text" placeholder="Mật khẩu ..." autocomplete="off" class="form-control" runat="server" id="Pass"/>
            </div>
            <div class="mb-3">
                <label for="" class="form-label text-success">Admin</label>
                    <asp:DropDownList  runat="server" CssClass="form-control" id="admin">
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:DropDownList>
            </div>

            <div class="row">
                <div class="col d-grid">
                    <asp:Button Text="Thêm" runat="server" id="AddBtn" width="65px"  class="btn-outline-success btn-block btn" OnClick="AddBtn_Click"  />

                </div>

                <div class="col d-grid">
                    <asp:Button Text="Sửa" runat="server" id="UpdateBtn" class="btn-outline-primary btn-block btn" OnClick="UpdateBtn_Click"  />
                </div>

                <div class="col d-grid">
                    <asp:Button Text="Xóa" runat="server" id="DeleteBtn" class="btn-outline-danger btn-block btn" OnClick="DeleteBtn_Click"  />

                </div>

                <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
            </div>
        </div>
        <div class="col-md-8">
            <div class="mb-3">
                <label for="txtSearchUser" class="form-label text-success">Tìm kiếm người dùng</label>
                <input type="text" placeholder="Tìm kiếm người dùng ..." autocomplete="off" class="form-control" runat="server" id="txtSearchUser" />
            </div>

            <asp:Button Text="Tìm kiếm" runat="server" ID="SearchUserBtn"  class="btn-outline-info btn-block btn" width="100px" OnClick="SearchUserBtn_Click"/> 
            
            <br>
            <asp:GridView ID="UsersList" runat="server" AllowPaging="True" AutoGenerateColumns="false" AutoGenerateSelectButton="True" class="table table-bordered" PageSize="4" OnSelectedIndexChanged="UsersList_SelectedIndexChanged1"  OnPageIndexChanging="UsersList_PageIndexChanging">
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="userId" HeaderText="ID" />
                    <asp:BoundField DataField="fullName" HeaderText="Tên cán bộ" />
                    <asp:BoundField DataField="gender" HeaderText="Giới tính" />
                    <asp:BoundField DataField="dateOfBirth" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />
                    <asp:BoundField DataField="userName" HeaderText="Tên tài khoản" />
                    <asp:BoundField DataField="password" HeaderText="Mật khẩu" />
                    <asp:BoundField DataField="UserRole" HeaderText="Quyền" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>
