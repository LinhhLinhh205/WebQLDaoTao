<%@ Page Title="Trang quản trị môn học" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>QUẢN LÝ MÔN HỌC</h2>
    <hr />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
                <!-- Modal -->
                <div class="modal fade" id="modalOpenAddButton" role="dialog">
                    <div class="modal-dialog">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">THÊM MỚI MÔN HỌC</h4>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <div class="form-group">
                                        <label>Mã môn</label>
                                        <asp:TextBox ID="txtMamh" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Tên môn</label>
                                        <asp:TextBox ID="txtTenmh" CssClass="form-control" runat="server" ControlToValidate="txtTenmh"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Số tiết</label>
                                        <asp:TextBox ID="txtsotiet" CssClass="form-control" runat="server" ControlToValidate="txtsotiet"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="btThem" class="btn btn-success" OnClick="btThem_Click" runat="server" Text="Thêm" />
                                    </div>
                                </div>
                            </div>
                            <asp:ValidationSummary ID="vsKq" runat="server" ForeColor="#FF3300" Font-Size="Medium" />
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-8">
                    <h4>DANH SÁCH MÔN HỌC</h4>
                    <asp:GridView CssClass="table table-bordered"
                        ID="gvMonhoc" runat="server" AutoGenerateColumns="false" DataKeyNames="MaMH" AllowPaging="true" PageSize="5" OnSelectedIndexChanged="gvMonhoc_SelectedIndexChanged" OnPageIndexChanging="gvMonhoc_PageIndexChanging" OnRowCancelingEdit="gvMonhoc_RowCancelingEdit" OnRowDeleting="gvMonhoc_RowDeleting" OnRowUpdating="gvMonhoc_RowUpdating" OnRowEditing="gvMonhoc_RowEditing">
                        <Columns>
                            <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" />
                            <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                            <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                            <asp:CommandField ButtonType="Button" HeaderText="Chọn tác vụ" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Wrap="false" />
                        </Columns>
                        <HeaderStyle BackColor="#003399" ForeColor="#ffffff" />
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
