<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.*,java.text.*" %>



<html>
<head>
<meta charset='utf-8'>
</head>
<style>
*{
	 box-sizing: border-box;
}
.mostra{
	display:flex;
	width:59%;
	margin:10px 22%;
	overflow-y: auto;
	font-family:verdana;
	font-size:0.8em;
	position:relative;
	top:90px;
			}
			
.mostra:nth-child(odd){background-color: lightblue;}
.mostra:nth-child(even){background-color: lightgrey;}			

.col1{
width:15%;
margin-left:20px;
}

.col1::before {
   content:"\261E";
}	

.col2{
width:29%;
margin-left:25px;

}	

.col3{
width:20%;
margin-left:25px;
}

.col4{
	width:10%;
	margin-left:35px;
}

.col5{
	width:15%;
	margin-left:55px;
}

	
a{
	text-decoration:none;
}

a:link {
   color:  #000000;
}

/* link que foi visitado */
a:visited {
    color: #000000;
}

/* mouse over */
a:hover {
    color: #000000;
}

/* link selecionado */
a:active {
    color:  #000000;
}

.btn{
width:60px;
padding:3px;
border-radius:5px;
border:2px solid black;
background-color:blue;
color:white;
position:absolute;
top:50px;
right:-260px;
	}

#cabec{
position:fixed;
top:6px;
left:36%;
	}
</style>

<body>
<div id='cabec'>
<h1>acessórios para informática</h1>
<button class='btn' onclick=location.href="index.html">Menu</button>
</div>

 
<%
    request.setCharacterEncoding("UTF-8");
	int matric=0;
	String nome="", cargo="";
	Date dtnasc = new Date();
	double salario=0;
	String sql="select ra,nome,cargo,dtaniv,salario from func order by nome";
	SimpleDateFormat formatoDesejado = new SimpleDateFormat("dd/MM/yyyy");
    String dataFormatada = null;
	String salarioFormatado=null;
   
	
 try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
      Connection con=DriverManager.getConnection(  
      "jdbc:oracle:thin:@localhost:1521:xe","system","123");   
      Statement st=con.createStatement();

      ResultSet rs=st.executeQuery(sql);
	  
	   while (rs.next()){
        ra=rs.getInt("ra");
		nome=rs.getString("nome");
		cargo=rs.getString("cargo");
		dtnasc = rs.getDate("dtaniv");
		salario=rs.getDouble("salario");
		//salarioFormatado=NumberFormat.getCurrencyInstance().format(salario);
		DecimalFormat df = new DecimalFormat("#,###.00");
        String dx = df.format(salario);
	    dataFormatada = formatoDesejado.format(dtnasc);
	 %>    
      <div class= 'mostra'>
	  
	  <div class='col1'>&nbsp;<a href="consulta.jsp?opt=M&txtRA=<%=ra%>"><strong><%=ra%></strong></a></div>
	  <div class='col2'><%=nome %> </div>
	  <div class='col3'><%=cargo %> </div>
	  <div class='col4'> <%=dataFormatada%></div>
	  <div class='col5'> <%=dx %></div>
	  </div>
	  	
<%	
	   } 
	   con.close();
	 	}

   
	catch (SQLException e){
		out.println(e.getMessage());
	}

   catch (Exception e){
		out.println(e.getMessage());
	}
	
	
	
%> 	

	
</body>
</html>	