<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Infrastructure.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.Infrastructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Cơ sở vật chất</h3>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <input type="text" runat="server" id="infrastructure" visible="false" />
                <div class="row">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label for="" class="form-label text-success">Phòng</label>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="roomName">
                            </asp:DropDownList>

                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label text-success">Số lượng tủ quần áo</label>
                            <input type="text" placeholder="Số lượng tủ quần áo ..." autocomplete="off" class="form-control" runat="server" id="IWardrobe" />
                        </div>

                        <div class="mb-3">
                            <label for="" class="form-label text-success">Số lượng điều hòa</label>
                            <input type="text" placeholder="Số lượng điều hòa ..." autocomplete="off" class="form-control" runat="server" id="IAircondition" />
                        </div>

                        <div class="mb-3">
                            <label for="" class="form-label text-success">Số lượng giường</label>
                            <input type="text" placeholder="Số lượng giường ..." autocomplete="off" class="form-control" runat="server" id="IBed" />
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label text-success">Diện tích phòng(m2)</label>
                            <input type="text" placeholder="Diện tích phòng(m2) ..." autocomplete="off" class="form-control" runat="server" id="IAcreage" />
                        </div>

                        <div class="row">
                            <div class="col d-grid">
                                <asp:Button Text="Thêm" runat="server" ID="AddBtn" Width="65px" class="btn-outline-success btn-block btn" OnClick="AddBtn_Click" />

                            </div>

                            <div class="col d-grid">
                                <asp:Button Text="Sửa" runat="server" ID="UpdateBtn" class="btn-outline-primary btn-block btn" OnClick="UpdateBtn_Click" />
                            </div>

                            <div class="col d-grid">
                                <asp:Button Text="Xóa" runat="server" ID="DeleteBtn" class="btn-outline-danger btn-block btn" OnClick="DeleteBtn_Click" />

                            </div>

                            <asp:Label runat="server" ID="ErrMsg" class="text-danger"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="mb-3">
                            <label for="txtSearchRoomName" class="form-label text-success">Tìm kiếm phòng</label>
                            <input type="text" placeholder="Nhập tên phòng ..." autocomplete="off" class="form-control" runat="server" id="txtSearchRoomName" />
                        </div>
                    <div class="d-flex justify-content-between">
                        <asp:Button Text="Tìm kiếm" runat="server" ID="SearchRoomNameBtn" class="btn-outline-info btn-block btn" Width="100px" OnClick="SearchRoomNameBtn_Click" />                      
                        <asp:Button ID="ExitSearchBtn" runat="server" class="btn-outline-info btn-block btn" OnClick="ExitSearchBtn_Click" Text="Hủy tìm" Width="100" />
                    </div>
                    <br />


        <asp:GridView ID="InfrastructureLists" runat="server" AutoGenerateColumns="false" class="table table-bordered" AutoGenerateSelectButton="false" AllowPaging="True" PageSize="5" OnPageIndexChanging="InfrastructureLists_PageIndexChanging" OnSelectedIndexChanged="InfrastructureLists_SelectedIndexChanged">
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333" />
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Chọn" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="infrastructureID" HeaderText="ID" />
                <asp:BoundField DataField="roomName" HeaderText="Tên Phòng" />
                <asp:BoundField DataField="wardrobe_quantity" HeaderText="Số lượng tủ quần áo" />
                <asp:BoundField DataField="aircondition_quantity" HeaderText="Số lượng điều hòa" />
                <asp:BoundField DataField="bed_quantity" HeaderText="Số lượng giường" />
                <asp:BoundField DataField="room_acreage" HeaderText="Diện tích phòng(m2)" />
                <asp:BoundField DataField="createAt" HeaderText="Ngày thêm" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="updateAt" HeaderText="Ngày cập nhật" DataFormatString="{0:dd/MM/yyyy}" />                
            </Columns>
        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

