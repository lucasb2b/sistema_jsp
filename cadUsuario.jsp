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
-->
</style>
</head>

<body>
<h1 style="color: red; text-align:center">Cadastro de Usu&aacute;rios</h1>

<% if(request.getParameter("acao") == null) { %>

    <form id="frmInserirUsuario" name="frmInserirUsuario" method="post" action="cadUsuario.jsp?acao=gravar">
      <label>Código.:
      <input name="codigo" type="text" id="codigo" size="10" maxlength="10" />
      </label>
      <p>
        <label>Nome Usuário.:
        <input type="text" name="usuario" id="usuario" />
        </label>
        <label>Senha.:
        <input type="password" name="senha" id="senha" />
        </label>
      </p>
      <p>
        <label>Nível Acesso.:
        <input name="nivelacesso" type="text" id="nivelacesso" size="3" maxlength="1" />
        </label>
      </p>
      <p>
        <label>
        <input type="submit" name="gravar" id="gravar" value="Gravar" />
        </label>
        <label>
        <input type="reset" name="limpar" id="limpar" value="Limpar" />
        </label>
      </p>
    </form>
<% } else{
		try{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/aula_neri", "postgres", "admin");
			
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(ClassNotFoundException erroClass){
			out.println("Classe Driver JDBC não foi localizado, erro = " + erroClass);
		} catch(SQLException erroSQL) {
			out.println("Erro de conexão com o banco de dados, erro = " + erroSQL);
		}
} %>
</body>
</html>
