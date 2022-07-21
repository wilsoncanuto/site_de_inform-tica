<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

  
<html>
<head>
<meta charset='utf-8'>
</head>
<body>
  <%
    request.setCharacterEncoding("UTF-8");
    String ra= request.getParameter("txtRA").trim();
    int ra = Integer.parseInt(ra);
    String nome=request.getParameter("txtNome");
    String cargo=request.getParameter("txtCargo");
    String salario=request.getParameter("txtSalario");
	String dtaniv=request.getParameter("txtDtAniv");
	double sal=Double.parseDouble(salario);
	
    String aniv="to_date('" + dtaniv + "','yyyy/mm/dd')";
	out.println(cargo);
	
 try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con=DriverManager.getConnection(  
      "jdbc:oracle:thin:@localhost:1521:xe","system","123");   

String sql="update func set nome='" + nome + "', cargo='" + cargo + "',dtaniv="+aniv+",salario="+sal+ " where ra=" + ra;
	Statement st=con.createStatement();
    st.executeUpdate(sql);
	out.println("OK");
	st.close();
	con.close();
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

