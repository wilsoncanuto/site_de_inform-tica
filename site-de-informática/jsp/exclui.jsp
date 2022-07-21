<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

  
<html>
<body>
  <%
    request.setCharacterEncoding("UTF-8");
    String ra= request.getParameter("txtRA").trim();
    int matric = Integer.parseInt(ra);
 
 try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con=DriverManager.getConnection(  
      "jdbc:oracle:thin:@localhost:1521:xe","system","123");   

String sql="delete from func where ra=" + ra;
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

