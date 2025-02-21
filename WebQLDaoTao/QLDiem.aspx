<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLDiem.aspx.cs" Inherits="WebQLDaoTao.QLDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />
    <asp:ObjectDataSource ID="ods_KetQua" runat="server" SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_MonHoc" runat="server" TypeName="WebQLDaoTao.Models.MonHocDAO" SelectMethod="getAll"></asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-3">Chọn môn học</label>
                    <div class="col-md-2" style="padding: 10px;">
                        <asp:DropDownList ID="ddlMonHoc" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="ods_MonHoc" DataTextField="TenMH" DataValueField="MaMH">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <hr />
            <asp:GridView ID="gvKetQua" ShowFooter="true" DataKeyNames="Id" runat="server" DataSourceID="ods_KetQua"
                AutoGenerateColumns="false" CssClass="table table-bordered" Width="100%">
                <Columns>
                    <asp:BoundField DataField="masv" HeaderText="Mã sinh viên" SortExpression="MaSV" />
                    <asp:BoundField DataField="hotensv" HeaderText="Họ tên sinh viên" />
                    <asp:TemplateField HeaderText="Điểm">
                        <ItemTemplate>
                            <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("diem") %>' CssClass="form-control"></asp:TextBox>
                        </ItemTemplate>

                        <FooterTemplate>
                            <br />
                            <asp:Button ID="btLuu" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btLuu_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkChon" runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" Text="Chọn tất cả" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                            <br />
                            <asp:Button ID="btnXoa" runat="server" Text="Xoá" CssClass="btn btn-danger" OnClientClick="return confirm('Bạn chắc chắn muốn xoá?')" OnClick="btnXoa_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-warning">
                        Không có sinh viên nào!
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
