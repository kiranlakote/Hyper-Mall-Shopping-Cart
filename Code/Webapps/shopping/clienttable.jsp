<HTML>
<BODY BGCOLOR>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String user; %>
<%	
	Connection con;
	// DBCon dbconn=new DBCon();
	// con=dbconn.getCon();
	con=dcon.getCon();
	user=request.getParameter("usr");
	System.out.println("ctable "+user);
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select tname from tab where tname='"+user+"'");
	if(rs1.next())
	{
		System.out.println("table exists");
		application.getRequestDispatcher("/clientpurchases.jsp?usr="+user).forward(request,response);		
	}
	else
	{
		int i=st.executeUpdate("create table "+user+"(pcode varchar2(5),pname varchar2(15),pqty number(5),price number(10,2),totprice number(12,2))");
		System.out.println(i);
		if(i==-1)
		{
		System.out.println("table created---"+user);
		application.getRequestDispatcher("/clientpurchases.jsp?usr="+user).forward(request,response);	
		}
		else
		{
		application.getRequestDispatcher("/clientservices.jsp?usr="+user).forward(request,response);
		}
	}
	// st.close();
	// st1.close();
	// rs1.close();
%>
  
</BODY>
</HTML>
