<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Acesso ao sistema</title>
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFF66">
<p>
  <% 
	try
	{
		if(request.getParameter("usuario") != null){
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/aula_neri", "postgres", "admin");
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sql = "SELECT * FROM login WHERE log_usuario ='" + request.getParameter("usuario")+"' and log_senha = '" + request.getParameter("senha")+"'";
			ResultSet rs = st.executeQuery(sql);
		
				if(rs.next()){
					response.sendRedirect("index.jsp");

				}else{
					out.println("Você não tem acesso ao sistema!");
				}
		}
		
			}
			catch(ClassNotFoundException erroClass)
			{
				out.println("Classe Driver JDBC não foi localizado, erro: " + erroClass);
			}
			catch(SQLException erroSQL)
			{
				out.println("Erro de conexão com o Banco de Dados, erro: " + erroSQL);
			}


%>
</p>
<p align="center"><img src="imagens/logo_info.jpg" width="484" height="150" /></p>
<form id="form1" name="form1" method="post" action="">
  <table width="208" border="1" align="center">
    <tr>
      <td colspan="2"><div align="center" class="style1">ACESSO AO SISTEMA</div></td>
    </tr>
    <tr>
      <td>Usuário</td>
      <td><label>
        <div align="center">
          <input name="usuario" type="text" id="usuario" size="8" />
          </div>
      </label></td>
    </tr>
    <tr>
      <td>Senha</td>
      <td><label>
        <div align="center">
          <input name="senha" type="password" id="senha" size="10" />
          </div>
      </label></td>
    </tr>
    <tr>
      <td><label>
        <div align="center">
          <input type="reset" name="limpar" id="limpar" value="Limpar" />
          </div>
      </label></td>
      <td><label>
        <div align="center">
          <input type="submit" name="acesso" id="acesso" value="Acessar" />
          </div>
      </label></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
