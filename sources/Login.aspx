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
    <style>
    .container {
        max-width: 400px;
        margin-top: 50px;
        padding: 30px;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-group label {
        font-weight: bold;
        font-size: 14px;
        color: #555;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ccc;
        padding: 10px;
        font-size: 14px;
        width: 100%;
        margin-bottom: 15px;
    }

    .form-control:focus {
        border-color: #4caf50;
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
    }

    .btn {
        padding: 10px 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        border: none;
    }

    .btn-primary {
        background-color: #4caf50;
        color: white;
    }

    .btn-primary:hover {
        background-color: #45a049;
        cursor: pointer;
    }

    .text-danger {
        font-size: 14px;
        color: #f44336;
    }

    .text-center {
        text-align: center;
    }
</style>
</body>
</html>

