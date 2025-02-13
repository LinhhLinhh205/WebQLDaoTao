<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>THÔNG TIN SINH VIÊN</h2>
    <hr />
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
                                <label class="control-label col-md-2">Mã sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Họ sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">Tên sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Giới tính</label>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                                        GroupName="GT" />
                                    <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Ngày sinh</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                                </div>
                                <label class="control-label col-md-2">Nơi sinh</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Địa chỉ</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Chọn khoa</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlMaKhoa" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-4">
                                    <asp:Button ID="btThem" runat="server" Text="Thêm Mới" OnClick="btThem_Click" CssClass="btn btn-success" />
                                </div>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    </div>
                </div>
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
    <asp:GridView ID="gvSinhVien" runat="server" CssClass="table table-bordered table-hover" EmptyDataRowStyle-Wrap="true" AutoGenerateColumns="False" DataSourceID="ods_SinhVien">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" ReadOnly="true" />
            <asp:BoundField DataField="HoSV" HeaderText="HoSV" SortExpression="HoSV" />
            <asp:BoundField DataField="TenSV" HeaderText="TenSV" SortExpression="TenSV" />
            <asp:CheckBoxField DataField="GioiTinh" HeaderText="GioiTinh" SortExpression="GioiTinh" />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
            <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />
            <asp:CommandField ButtonType="Button" HeaderText="Chọn tác vụ" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Wrap="false" />
        </Columns>
    </asp:GridView>
        </asp:Panel>
    <asp:ObjectDataSource ID="ods_SinhVien" runat="server"  DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO">
        <DeleteParameters>
            <asp:Parameter Name="masv" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="masv" Type="String" />
            <asp:Parameter Name="hosv" Type="String" />
            <asp:Parameter Name="tensv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="Boolean" />
            <asp:Parameter Name="ngaysinh" Type="DateTime" />
            <asp:Parameter Name="noisinh" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="makh" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
