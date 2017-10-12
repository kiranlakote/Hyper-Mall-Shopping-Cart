<HTML>
<body bgcolor>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  
      
    try
    {     
        Connection con;
        DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	
	String pcode=request.getParameter("T1");
	String pname=request.getParameter("T2");
	float price=Float.parseFloat(request.getParameter("T3"));
	int pmin=Integer.parseInt(request.getParameter("T4"));
    int present=Integer.parseInt(request.getParameter("T5"));    
	
	ResultSet rs=st.executeQuery("select p_code from prod_det where p_code ='"+pcode+"'");
	if(!rs.next())
	{
        int i=st.executeUpdate("insert into prod_det values('"+pcode+"','"+pname+"',"+price+","+pmin+","+present+")");
	   if(i==1)
        {
    	out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>"+i+" Record successfully Added<h1></font><center>");
        }
	else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Added<h1><center></font>");
        }
        out.println("<center><a href='Add_prod.jsp'><font face='comic sans ms'  size='4' COLOR='#99CC00'>Add New</font</a></center>");
	out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Back To Administrative Services</font></pre></a></center>");                                                                                 
	}
	else
	{
	out.println("<center><br><br><br><font face='comic sans ms' size='4' COLOR='#006600'>Duplicate Records</font><center><pre><font face='verdana' size='3'><a href='Add_prod.jsp'>Back</a></font></pre>");
	}
	// st.close();
	// rs.close();
	}
	catch(Exception e)
	{
	 out.println("<center><br><br><br><font face='comic sans ms' size='4' COLOR='#006600'>Invalid Data</font><center><pre><font face='verdana' size='3'><a href='Add_prod.jsp'>Back</a></font></pre>");
	 
	}
%>
  
</body>
</html>