<html>
<body bgcolor>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%!
	Connection con;
	DBCon dbconn=new DBCon();
	Statement st;
%>

<%  
        con = dbconn.getCon();
	st=con.createStatement();
	String pcode=request.getParameter("T1");
	System.out.println(pcode);	
	int i=st.executeUpdate("delete from prod_det where p_code='"+pcode+"'");
 	
	if(i==1)
        {
		out.println("<br><br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR=#006600>"+i+" Record  successfully Deleted<h1></font><center>");
        }
	else
	{ 
		out.println("<br><br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR=#006600>Can Not Be Deleted<h1><center></font>");
        }
		out.println("<center><a href='Delete_prod.jsp'><font face='comic sans ms' size='3' COLOR=#99CC00>Delete Another Record</font></a></center>");
		out.println("<a href='Adminservices.html'> <pre><font face='comic sans ms' size='2' COLOR=#99CC00>Back To Administrative Services</font></pre>  </a>");                                                                                 
	
	
st.close();	
%>

</body>
</html>
