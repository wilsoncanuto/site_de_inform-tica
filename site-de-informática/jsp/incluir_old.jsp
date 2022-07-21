<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

  
<html>
<head>
<meta charset='utf-8'>
</head>
<body>
  <%
   // response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
    String nome=request.getParameter("txtNome");
    String cargo=request.getParameter("txtCargo");
    String salario=request.getParameter("txtSalario");
	String dtaniv=request.getParameter("txtDtAniv");
	double sal=Double.parseDouble(salario);
	

String aniv="to_date('" + dtaniv + "','yyyy/mm/dd')";

 try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con=DriverManager.getConnection(  
      "jdbc:oracle:thin:@localhost:1521:xe","system","123");   
String Q="insert into func(nome,cargo,dtaniv,salario) values('" + nome + "','" + cargo + "'," + aniv + "," +sal+ ")";
//String Q="insert into func(nome,cargo,salario) values('" + nome + "','" + cargo + "'," +sal+ ")";

	Statement st=con.createStatement();
	st.executeUpdate(Q);
//	out.println("OK");
	st.close();
	con.close();
    //response.sendRedirect("http://localhost:8090/curjp/index.html");
	response.sendRedirect("index.html");
  }

catch (SQLException e){
	out.println(e.getMessage());
}


catch (ClassNotFoundException e){
	out.println(e.getMessage());
}

catch (Exception e){
	out.println(e.getMessage());
}

 
%> 
  </body>
</html>

