﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModificarCliente.aspx.cs" Inherits="TP3_LACIOPPA.ModificarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

<form>
    <center>
        <h2>MODIFICAR CLIENTE</h2>
    </center>
    
     <div class="form-row">
    <div class="form-group col-md-6">
         <asp:TextBox ID="txtID" runat="server" class="form-control" type="text" Width="150px" Visible="false"></asp:TextBox>
        <asp:Label Text="Buscar cliente (solo dni)" runat="server" />
        <asp:TextBox ID="txtBuscarMod" runat="server" class="form-control" Width="150px"></asp:TextBox>  
        <asp:Button ID="btnBuscarClienteMod" runat="server" Text="Buscar" class="btn btn-primary" OnClick="btnBuscarClienteMod_Click"/>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="txtnombre" runat="server" class="form-control" type="text" Width="150px"></asp:TextBox>
            <asp:Label Text="Apellido" runat="server" />
            <asp:TextBox ID="txtApellido" runat="server" class="form-control" type="text" Width="150px"></asp:TextBox>
            <asp:Label Text="DNI" runat="server" />
            <asp:TextBox ID="txtDNI" runat="server" class="form-control" type="text" Width="150px"></asp:TextBox>
    </div>
  </div>
  <div class="form-group">
    <asp:Label Text="Direccion" runat="server" />
            <asp:TextBox ID="txtDireccion" runat="server" class="form-control" type="text" Width="250px"></asp:TextBox>
            <asp:Label Text="Localidad" runat="server" />
            <asp:TextBox ID="txtLocalidad" runat="server" class="form-control" type="text" Width="250px"></asp:TextBox>
            <asp:Label Text="Telefono" runat="server" />
            <asp:TextBox ID="txtTelefono" runat="server" class="form-control" type="text" Width="150px"></asp:TextBox>
            <asp:Label Text="Mail" runat="server" />
            <asp:TextBox ID="txtMail" runat="server" class="form-control" type="text" Width="300px"></asp:TextBox>
  </div>
    <asp:Button ID="btnAtras" runat="server" class="btn btn-warning" Text="ATRAS" OnClick="btnAtras_Click" />
  <asp:Button ID="btnModificarCliente" runat="server" Text="Modificar" class="btn btn-warning" OnClick="btnModificarCliente_Click1"/>
</form>

    </div>
</asp:Content>
