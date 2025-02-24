<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>TRANG QUẢN TRỊ KHOA </h2>
    <hr />
    <asp:ObjectDataSource ID="ods_Khoa" runat="server" DataObjectTypeName="WebQLDaoTao.Models.Khoa" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDAO" UpdateMethod="Update"></asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px; width: 153px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
                <!-- Modal -->
                <div class="modal fade" id="modalOpenAddButton" role="dialog">
                    <div class="modal-dialog">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4>THÊM MỚI KHOA</h4>
                                <hr>
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">Mã khoa:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">Tên khoa</label>
                                        <div class="col-sm-10">

                                            <asp:TextBox ID="txtTenKH" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" CssClass="btn btn-info" />
                                        </div>
                                    </div>

                                    <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server"
                                        Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:GridView ID="gvKhoa" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="ods_Khoa">
                <Columns>
                    <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" ReadOnly="true" />
                    <asp:BoundField DataField="TenKH" HeaderText="TenKH" SortExpression="TenKH" />
                    <asp:CommandField ButtonType="Button" HeaderText="Chọn tác vụ" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
