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
    <asp:GridView ID="gvSinhVien" DataKeyNames="Masv"  runat="server" CssClass="table table-bordered table-hover" EmptyDataRowStyle-Wrap="true" AutoGenerateColumns="False" DataSourceID="ods_SinhVien" OnPageIndexChanging="gvSinhVien_PageIndexChanging" AllowPaging="true" PageSize="10">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ReadOnly="true" />
            <asp:BoundField DataField="HoSV" HeaderText="Họ SV" SortExpression="HoSV" ControlStyle-Width="150px" >
            <ControlStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="TenSV" HeaderText="Tên SV" SortExpression="TenSV" />
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:CheckBox ID="gioitinh" runat="server" Checked='<% Bind("gioitinh") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <%# (bool)Eval("gioitinh")?"Nam":"Nu" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" SortExpression="NgaySinh" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="Đại chỉ" SortExpression="DiaChi" />
            <asp:TemplateField HeaderText="Khoa">
                <EditItemTemplate>
                    <asp:DropDownList ID="makh" runat="server" DataSourceID="ods_Khoa" DataTextField="TenKH" DataValueField="MaKH" SelectedValue='<%# Bind("MaKH") %>'>

                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>                    
                    <%# Eval("Makh") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" HeaderText="Chọn tác vụ" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Wrap="false" >
            <ItemStyle Wrap="False" />
            </asp:CommandField>
        </Columns>
        <EmptyDataRowStyle Wrap="True" />
    </asp:GridView>
        </asp:Panel>
    <asp:ObjectDataSource ID="ods_SinhVien" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO"  runat="server"></asp:ObjectDataSource>
</asp:Content>
