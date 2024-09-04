<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 24px;
}
.style2 {
	font-size: 14px;
	color: #0000FF;
}
.style4 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>

<body>

<p align="center" class="style1">Manuten&ccedil;&atilde;o de Usu&aacute;rios</p>
<p align="center" class="style1"><img src="imagens/cadastrar.jpg" width="128" height="34" />  <img src="imagens/print.png" width="32" height="32" /></p>
<p align="center" class="style1"><span class="style2">Ordena&ccedil;&atilde;o: <a href="usuario.jsp?ordenacao=crescente">Crescente</a> - Decrescente</span></p>
<table width="561" border="1" align="center">
  <tr>
    <td width="58" bgcolor="#FFFF00"><div align="center" class="style4">C&oacute;digo</div></td>
    <td width="147" bgcolor="#FFFF00"><div align="center" class="style4">Nome do Usu&aacute;rio</div></td>
    <td width="77" bgcolor="#FFFF00"><div align="center" class="style4">Senha</div></td>
    <td width="104" bgcolor="#FFFF00"><div align="center" class="style4">N&iacute;vel</div></td>
    <td width="60" bgcolor="#FFFF00"><div align="center" class="style4">Alterar</div></td>
    <td width="75" bgcolor="#FFFF00"><div align="center" class="style4">Excluir</div></td>
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
				String sql = "SELECT * FROM login";
				rs = st.executeQuery(sql);
			} else if(request.getParameter("ordenacao").equals("crescente")) {
				String sql = "SELECT * FROM login ORDER BY log_usuario";
				rs = st.executeQuery(sql);
			}
			
			
			while(rs.next())
			{%>
            
              <tr>
                <td bgcolor="#CCFFCC"><div align="center"><%= rs.getString("log_codigo") %></div></td>
                <td bgcolor="#CCFFCC"><%= rs.getString("log_usuario") %></td>
                <td bgcolor="#CCFFCC"><div align="center"><%= rs.getString("log_senha") %></div></td>
                <td bgcolor="#CCFFCC"><div align="center"><%= rs.getString("log_nivelacesso") %></div></td>
                <td bgcolor="#CCFFCC"><div align="center"><img src="imagens/edit.png" width="24" height="24" /></div></td>
                <td bgcolor="#CCFFCC"><div align="center"><a href="usuario.jsp?acao=excluir&amp;codigo=<%= rs.getString("log_codigo") %>"><img src="imagens/delete.png" width="24" height="24" /></a></div></td>
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
<p>&nbsp;</p>
</body>

</html>
