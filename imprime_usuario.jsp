<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style4 {color: #FF0000; font-weight: bold; }
.style5 {
	color: #000000
}
.style7 {color: #000000; font-weight: bold; }
.style8 {color: #000000; font-weight: bold; font-size: 24px; }
.style9 {font-size: 24px}
-->
</style>
</head>

<body>

<p align="center" class="style8">Relat&oacute;rio de usu&aacute;rios</p>
<table width="414" border="1" align="center">
  <tr>
    <td width="58" bgcolor="#CCCCCC"><div align="center" class="style4 style5">C&oacute;digo</div></td>
    <td width="147" bgcolor="#CCCCCC"><div align="center" class="style7">Nome do Usu&aacute;rio</div></td>
    <td width="77" bgcolor="#CCCCCC"><div align="center" class="style7">Senha</div></td>
    <td width="104" bgcolor="#CCCCCC"><div align="center" class="style7">N&iacute;vel</div></td>
  </tr>
  <% 
	try
	{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/aula_neri", "postgres", "admin");
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			if (request.getParameter("acao") != null){
				st.executeUpdate("DELETE FROM login WHERE log_codigo = " + request.getParameter("codigo"));
			
			}
			
			ResultSet rs = null;
			
			if(request.getParameter("ordenacao") == null){
				String sql = "SELECT * FROM login ORDER BY log_usuario";
				rs = st.executeQuery(sql);
			} else if(request.getParameter("ordenacao").equals("crescente")) {
				String sql = "SELECT * FROM login";
				rs = st.executeQuery(sql);
			} else if(request.getParameter("ordenacao").equals("alfabetica")) {
				String sql = "SELECT * FROM login ORDER BY log_usuario";
				rs = st.executeQuery(sql);
			}
			
			
			while(rs.next())
			{%>
            
              <tr>
                <td bgcolor="#FFFFFF"><div align="center"><%= rs.getString("log_codigo") %></div></td>
                <td bgcolor="#FFFFFF"><%= rs.getString("log_usuario") %></td>
                <td bgcolor="#FFFFFF"><div align="center"><%= rs.getString("log_senha") %></div></td>
                <td bgcolor="#FFFFFF"><div align="center"><%= rs.getString("log_nivelacesso") %></div></td>
              </tr>
<%  			}}
			catch(ClassNotFoundException erroClass)
			{
				out.println("Classe Driver JDBC não foi localizado, erro: " + erroClass);
			}
			catch(SQLException erroSQL)
			{
				out.println("Erro de conexão com o Banco de Dados, erro: " + erroSQL);
			}
%>
</table>
<p align="center" class="style9"><strong>Feito por: Lucas Brito de Lima - www.devlucas.xyz</strong></p>
<p align="center" class="style9"><strong>E-mail: lucasbritocientista@gmail.com - Hardware e Afins</strong></p>
<center><input type="button" name="imprimir" id="imprimir" value="Imprimir" onclick="window.print();"/></center>
</body>

</html>
