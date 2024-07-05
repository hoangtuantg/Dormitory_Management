<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Quản lý Phòng Ký Túc Xá</h3>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label for="" class="form-label text-success">Tên phòng</label>
                            <input type="text" placeholder="Phòng ..." autocomplete="off" class="form-control" runat="server" id="RoomName" />
                        </div>

                        <div class="mb-3">
                            <label for="" class="form-label text-success">Sinh viên tối đa</label>
                            <input type="text" placeholder="Quản lý ..." autocomplete="off" class="form-control" runat="server" id="MaxStudent" />
                        </div>

                        <div class="mb-3">
                            <label for="" class="form-label text-success">Tòa</label>
                            <input type="text" placeholder="Tòa ..." autocomplete="off" class="form-control" runat="server" id="Building" />
                        </div>

                        <div class="row">
                            <div class="col d-grid">
                                <asp:Button Text="Sửa" runat="server" ID="UpdateBtn" class="btn-outline-primary btn-block btn" />
                            </div>

                            <div class="col d-grid">
                                <asp:Button Text="Thêm mới" runat="server" ID="AddBtn" class="btn-outline-success btn-block btn" />

                            </div>

                            <div class="col d-grid">
                                <asp:Button Text="Xóa" runat="server" ID="DeleteBtn" class="btn-outline-danger btn-block btn" />

                            </div>

                            <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="mb-3">
                            <label for="txtSearchBook" class="form-label text-success">Tìm kiếm phòng</label>
                            <input type="text" placeholder="Nhập tên phòng ..." autocomplete="off" class="form-control" runat="server" id="txtSearchBook" />
                        </div>

                        <asp:Button Text="Tìm kiếm" runat="server" ID="SearchBookBtn" class="btn-outline-info btn-block btn" Width="100" />
                        <br>

                        <asp:GridView ID="RoomList" runat="server" class="table table-bordered" AutoGenerateSelectButton="False" AllowPaging="True" PageSize="1" AutoGenerateColumns="false" OnSelectedIndexChanged="RoomList_SelectedIndexChanged" OnPageIndexChanging="RoomList_PageIndexChanging">
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField HeaderText="Mã phòng" DataField="roomId" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%" ItemStyle-Font-Size="Smaller"></asp:BoundField>
                                <asp:BoundField HeaderText="Tên phòng" DataField="roomName" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="center" SortExpression="roomId"></asp:BoundField>
                                <asp:BoundField HeaderText="Ngày thêm" DataField="createAt" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="center" SortExpression="roomId" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                <asp:BoundField HeaderText="Sinh viên tối đa" DataField="maxStudent" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="center" SortExpression="roomId"></asp:BoundField>
                                <asp:BoundField HeaderText="Sinh viên hiện tại" DataField="currentStudent" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="center" SortExpression="roomId"></asp:BoundField>
                                <asp:BoundField HeaderText="Tòa" DataField="buildingName" HeaderStyle-Height="25" ItemStyle-HorizontalAlign="center" SortExpression="roomId"></asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="SelectButton" runat="server" Text="Chọn" CommandName="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
