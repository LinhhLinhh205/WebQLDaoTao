<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-group">
                <label>Tên đăng nhập </label>
                <asp:TextBox ID="txtTenDN" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Mật khẩu </label>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btLogin" runat="server" Text="Đăng nhập" OnClick="btLogin_Click" />
            <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="text-danger"></asp:Label>
        </div>
    </form>
</body>
</html>

