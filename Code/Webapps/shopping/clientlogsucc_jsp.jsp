<HTML>
<HEAD>
<TITLE> e-shopping </TITLE>
</HEAD>

<BODY BGCOLOR>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! 
    Connection con;
    Statement st,st1;
    ResultSet rs,rs1;
%>
<%! String usr; boolean flag;%>
<%  
        try
	{
	// DBCon dbconn=new DBCon();
	//con = dbconn.getCon();
	con = dcon.getCon();
	st=con.createStatement();
	st1=con.createStatement();
	String user=request.getParameter("T1");
	String pwd=request.getParameter("T2");
	System.out.println(user);
	System.out.println(pwd);	
	rs=st.executeQuery("select * from user_det where uname='"+user+"' and pwd='"+pwd+"'");
	usr=user.toUpperCase();
	
	System.out.println("logsucc "+usr);

	if(rs.next())
	{
	flag=true; //st.executeUpdate("drop table "+usr);
	}
	else
	{
	flag=false;
	}
    
	/*
	st.close();
	st1.close();
	rs.close();
	rs1.close();
	*/

	if(flag)
	{
	application.getRequestDispatcher("/clientservices.jsp?usr="+usr).forward(request,response);		
	}
	else
	{	
%>
		 <jsp:forward page="clientlogfail.html" />
<%
	}
    }
	catch(Exception e)
	{
		System.out.println(e);
		e.printStackTrace();
	}
%>

</BODY>
</HTML>
