<HTML>
<body bgcolor>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  
        Connection con;
        DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	
	String name=request.getParameter("T1");
	String phone=request.getParameter("T2");
	String id=request.getParameter("id");
	String address=request.getParameter("T3");
	String advice=request.getParameter("S1");
	
	int i=st.executeUpdate("insert into suggest values('"+name+"','"+phone+"','"+id+"','"+address+"','"+advice+"')");
	if(i==1)
        {
	
        out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Thanks For Your Suggestions<h1></font><center>");
        }
	else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Accepted<h1><center></font>");
        }
        out.println("<center><a href='suggestions.html'><font face='comic sans ms'  size='4' COLOR='#99CC00'>More Suggestions</font</a></center>");
	out.println("<center><a href='main.html' target=_top> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Home</font></pre></a></center>");                                                                                 
	// st.close();
	
%>
  
</body>
</html>