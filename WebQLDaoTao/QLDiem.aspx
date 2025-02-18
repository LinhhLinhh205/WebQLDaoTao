<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLDiem.aspx.cs" Inherits="WebQLDaoTao.QLDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Chọn môn học</label>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlMonHoc" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="ods_Monhoc" DataTextField="TenMH" DataValueField="MaMH">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <hr />
    <asp:GridView ID="gvKetQua" ShowFooter="true" DataKeyNames="Id" runat="server" DataSourceID="ods_KetQua"
        AutoGenerateColumns="false" CssClass="table table-bordered" Width="100%">
        <Columns>
            <asp:BoundField DataField="masv" HeaderText="Mã sinh viên" />
            <asp:BoundField DataField="hotensv" HeaderText="Họ tên sinh viên" />
            <asp:TemplateField HeaderText="Điểm">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("diem") %>' CssClass="form-control"></asp:TextBox>                    
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" OnClick="btLuu_Click" CssClass="btn btn-success" />
                </FooterTemplate>
            </asp:TemplateField>          
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
</asp:Content>
