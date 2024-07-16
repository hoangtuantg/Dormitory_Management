<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Wish.aspx.cs" Inherits="XDPTPM_01_NHOM04_DOAN_HK2_23_24.Admin.BookType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4 mb-4 title rounded">
                <h3 class="text-center">Danh sách đơn đăng ký</h3>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Nhập mã hoặc tên sinh viên" runat="server" aria-describedby="button-addon3" id="txtSearchWish"/>
                    <div class="input-group-append">
                        <asp:Button Text="Tìm kiếm" CssClass="btn btn-outline-success" runat="server" ID="SearchBookBtn" OnClick="SearchBookBtn_Click"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="sort row">
                            <div class="col-sm-5">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelecter">Ngày đăng ký</label>
                                    </div>
                                    <asp:DropDownList ID="ddlSortByDate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortByDate_SelectedIndexChanged">
                                        <asp:ListItem Text="Ngày đăng ký mới nhất" Value="newest"></asp:ListItem>
                                        <asp:ListItem Text="Ngày đăng ký cũ nhất" Value="oldest"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblResult" ForeColor="YellowGreen" runat="server"></asp:Label>
                        </div>
                        <asp:GridView ID="WishList" runat="server" AutoGenerateColumns="false" CssClass="table" AutoGenerateSelectButton="False" AllowPaging="True" PageSize="10" 
                            DataKeyNames="wishId" OnRowUpdating="WishList_RowUpdating" OnRowDataBound="WishList_RowDataBound" OnRowEditing="WishList_RowEditing" OnSelectedIndexChanged="WishList_SelectedIndexChanged" OnRowCancelingEdit="WishList_RowCancelingEdit" style="font-size: 14px">
                            <EditRowStyle BackColor="#C5BBAF" Font-Bold="true" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField HeaderText="Họ tên sinh viên" DataField="studentName" ReadOnly="true" ItemStyle-HorizontalAlign="center"></asp:BoundField>
                                <asp:BoundField HeaderText="Số căn cước" DataField="numIdentify" ReadOnly="true" ItemStyle-HorizontalAlign="center"></asp:BoundField>
                                <asp:BoundField HeaderText="Ngày đăng ký" DataField="createAt" ReadOnly="true" ItemStyle-HorizontalAlign="center" DataFormatString="{0:dd/MM/yyyy HH:mm}"></asp:BoundField>
                                <asp:BoundField HeaderText="Mã SV" DataField="studentCode" ReadOnly="true" ItemStyle-HorizontalAlign="center"></asp:BoundField>
                                <asp:BoundField HeaderText="Khoa" DataField="major" ReadOnly="true" ItemStyle-HorizontalAlign="center"></asp:BoundField>
                                <asp:BoundField HeaderText="Lý do muốn đăng ký" DataField="reason" ReadOnly="true" ItemStyle-HorizontalAlign="NotSet"></asp:BoundField>
                                <asp:BoundField HeaderText="Trạng thái" DataField="status" ReadOnly="true" ItemStyle-HorizontalAlign="center"></asp:BoundField>                                
                                <asp:TemplateField HeaderText="Lý do từ chối">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="AcceptButton" runat="server" Text="Duyệt" CommandName="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="SelectButton" runat="server" Text="Từ chối" CommandName="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="UpdateButton" runat="server" Text="Lưu" CommandName="Update"></asp:LinkButton>
                                        <asp:LinkButton ID="CancelButton" runat="server" Text="Hủy" CommandName="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

