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
<h1 style="color: red; text-align:center">Altera&ccedil;&atilde;o de Usu&aacute;rios</h1>

<% if(request.getParameter("acao") == null) { %>

    <form id="frmInserirUsuario" name="frmInserirUsuario" method="post" action="alteraUsuario.jsp?acao=alterar">
      <label>Código.:
      <input name="tf_codigo" type="text" id="tf_codigo" size="10" maxlength="6" style="cursor:not-allowed" value="<%= request.getParameter("codigo") %>"/>
      </label>
      <p>
        <label>Nome Usuário.:
        <input name="tf_usuario" type="text" id="tf_usuario" value="<%= request.getParameter("usuario") %>" size="15" maxlength="10" />
        </label>
        <label>Senha.:
        <input name="tf_senha" type="password" id="tf_senha" value="<%= request.getParameter("senha") %>" size="15" maxlength="10" />
        </label>
      </p>
      <p>
        <label>Nível Acesso.:
        <input name="tf_nivelacesso" type="text" id="tf_nivelacesso" value="<%= request.getParameter("nivelacesso") %>" size="3" maxlength="1" />
        </label>
      </p>
      <p>
        <label>
        <input type="submit" name="gravar" id="gravar" value="Confirmar Altera&ccedil;&atilde;o" />
        </label>
        <label>
        <input type="reset" name="limpar" id="limpar" value="Limpar" />
        </label>
      </p>
    </form>
<% } else{
		
		if((request.getParameter("tf_usuario").length() <= 0) || (request.getParameter("tf_senha").length() <= 0) || (request.getParameter("tf_nivelacesso").length() <= 0)){
			out.println("Atenção, você deve digitar o nome do usuário");
			response.sendRedirect("cadUsuario.jsp");
		}else{

			try{
				Class.forName("org.postgresql.Driver");
				Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/aula_neri", "postgres", "admin");
				
				
				int codigo = Integer.parseInt(request.getParameter("tf_codigo"));
				String usuario = request.getParameter("tf_usuario");
				String senha = request.getParameter("tf_senha");
				int nivelAcesso = Integer.parseInt(request.getParameter("tf_nivelacesso"));
				
				PreparedStatement pstmt = con.prepareStatement("UPDATE login SET log_usuario=?, log_senha=?, log_nivelacesso=? WHERE log_codigo=?");
							
				pstmt.setString(1, usuario);
				pstmt.setString(2, senha);
				pstmt.setInt(3, nivelAcesso);
				pstmt.setInt(4, codigo);
				
				pstmt.execute();
				pstmt.close();
				
				response.sendRedirect("usuario.jsp");
				
			} catch(ClassNotFoundException erroClass){
				out.println("Classe Driver JDBC não foi localizado, erro = " + erroClass);
			} catch(SQLException erroSQL) {
				out.println("Erro de conexão com o banco de dados, erro = " + erroSQL);
			}
		}
} %>
</body>
</html>
