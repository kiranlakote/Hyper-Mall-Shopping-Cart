 <%@ page import="java.sql.*,java.lang.Math ,dbean.DBCon"%>
     <jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<html>
<head>
<title>Untitled Document</title>
</head>
<%
System.out.println("enter into the credit.jsp");
try
{
Connection con;
	DBCon dbconn=new DBCon();
	con=dbconn.getCon();
	
	PreparedStatement st1=con.prepareStatement("insert into credit2 values(?,?,?)");

    String id=(String)session.getAttribute("ID");
	String tot=(String)session.getAttribute("TOTAL");
	 float totamt=Float.parseFloat(tot);
	System.out.println("id is"+id);
	System.out.println("breka");
	System.out.println("total is"+tot);
	int cno=Integer.parseInt(request.getParameter("cno"));
	System.out.println("credite card no is"+cno);
		
	%>
	
	<%
	System.out.println("in the p"); 
	st1.setString(1,"id");
	   st1.setFloat(2,totamt);
	   st1.setInt(3,cno);
	    st1.execute();
	out.println("<center><font color='#0066FF' size='6' face='comic sans ms'>ur transaction is ok</center>");
	st1.close();
	con.close();
	}
	catch(Exception e)
	{
	}
	
	%>
	
<body bgcolor="#CCCCFF">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center"><FONT  face="comic sans ms" size=3 COLOR=#006600><a href="main.html" target="_top"><font color="#C6BB6C" size="3" face="comic sans ms">Logout</font></a> 
  </font> </p>
</body>
</html>
