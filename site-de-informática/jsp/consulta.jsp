<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

<html>
<head>
<meta charset='utf-8'>

<link rel='stylesheet' href='estilos/cadastro.css'>
</head>

<body>
  <%
    request.setCharacterEncoding("UTF-8");
    
	String sql="";
	int matric=0;
	String nome="", cargo="";
	Date dtnasc = new Date();
	double salario=0;
	
	String opcao=request.getParameter("opt");

	if (opcao.equals("M")){
		String RA=request.getParameter("txtRA").trim();
		if(RA==""){
		RA="0";
	}
	   	matric=Integer.parseInt(RA);
	   sql="select RA,nome,cargo,dtaniv,salario from func where ra="+ra;	
	}
	else if(opcao.equals("N")){
	   nome=request.getParameter("txtNome");
	   sql="select ra,nome,cargo,dtaniv,salario from func where nome='" + nome + "'";	
	}
	
//	out.println(sql+"<br>");
	
    try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
      Connection con=DriverManager.getConnection(  
      "jdbc:oracle:thin:@localhost:1521:xe","system","123");   
      Statement st=con.createStatement();

      ResultSet rs=st.executeQuery(sql);
	  
	if(!rs.next()){
		 con.close();
		 %>
		 <script>alert("Nome não Cadastrado");window.location.href='index.html';</script>";
		 <%
	}
	else{	
	    matric=rs.getInt("ra");
		nome=rs.getString("nome");
		cargo=rs.getString("cargo");
		dtnasc = rs.getDate("dtaniv");
		salario=rs.getDouble("salario");
		con.close();
		}
%>	

<center><h1>acessórios para informática</h1></center>

<form method='post' name='form'>
<div>
<label>RA</label>
<input class='entrada' type='text' name='txtRA' size='40' maxlength='40' readonly value ="<%=RA%>">
</div>


<div>
<label>Nome</label>
<input class='entrada' type='text' name='txtNome' size='40' maxlength='40' autofocus required onkeyup="maiuscula(this);" value ="<%=nome%>">
</div>

<div>
<label>Cargo</label>
<input class='entrada' type='text' name='txtCargo' size='30' maxlength='30' required value ="<%=cargo%>">
</div>

<div>
<label> Dt. Nascimento</label>
<input class='entrada' type='date' name='txtDtAniv' value ="<%=dtnasc%>">
</div>

<div>
<label>Salario</label>
<input class='entrada' type='number' name='txtSalario' size='12' maxlength='12' value ="<%=salario%>">
</div>


<input type="button" class='btn' value="Alterar" onClick="altera()">
<input type="button" class='btn' value="Excluir" onClick="exclui()">
<input type="button" class='btn' Value ="Menu" onclick=location.href="index.html">
</form>

<%	
   }
  
	 catch (SQLException e){
		out.println(e.getMessage());
	}

   catch (Exception e){
		out.println(e.getMessage());
	}
	
%> 

<script>
function maiuscula(z){
 v = z.value.toUpperCase();
 z.value = v;
    }
	
function exclui(){

   if (confirm("Confirma a exclusão")) {
   document.form.action="exclui.jsp"
   document.form.submit()
   }
}

 function altera() {

    if (confirm("Confirma a alteração")) {
    document.form.action="altera.jsp"
    document.form.submit()
    }
}
	
</script>

  </body>
</html>

