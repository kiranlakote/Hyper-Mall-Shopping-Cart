<HTML>
<HEAD>
<TITLE> e-shopping </TITLE>
</HEAD>

<BODY BGCOLOR>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! 
	Connection con;
	Statement st;
	ResultSet rs;
%>

<%  
        try
	{
	//DBCon dbconn=new DBCon();
	con = dcon.getCon();
	st=con.createStatement();

	String eno=request.getParameter("T1");
	String pwd=request.getParameter("T2");
		
	rs=st.executeQuery("select *from emp_det where eno='"+eno+"' and pwd='"+pwd+"'");
	
	if(rs.next())
	{
%>
		<jsp:forward page="Adminservices.html" />
<%
 
	}
	else
	{
%>
		 <jsp:forward page="Admlogfail.html" />
<%
	}
	}
	catch(Exception e)
	{
	%>
	    <jsp:forward page="Admlogfail.html" />

<%		System.out.println("ERROR>>>>>Database Not Availble");
		e.printStackTrace();
	}
	
	
%>

</BODY>
</HTML>
