<html>
<body>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  
        Connection con;
        DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();
	String pcode=request.getParameter("list");
	String usr=request.getParameter("T2");
	int qty=0;
	ResultSet rs=st1.executeQuery("select pqty from "+usr+" where pcode='"+pcode+"'");
	while(rs.next())
	{
		qty=rs.getInt(1);
	}

// this is to update sales and prod_det after deletion from client purchases

	st2.executeUpdate("update prod_det set present_stock=present_stock + "+qty+" where trim(p_code)='"+pcode+"'");
	
	int i=st.executeUpdate("delete "+usr+" where pcode='"+pcode+"'");
	if(i>=1)
        {
		out.println("<br><br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR=#006600>"+i+" Removed  From Your List<h1></font><center>");
        }
	else
	{ 
		out.println("<br><br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR=#006600>Can Not Be Removed<h1><center></font>");
        }st.close();
	 //st1.close();
	// st2.close();
	// rs.close();
	
	
	
%>
        <center><a href='backfromdelete.jsp?usr=<%=usr%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>Back</font></a></center>

</body>
</html>
