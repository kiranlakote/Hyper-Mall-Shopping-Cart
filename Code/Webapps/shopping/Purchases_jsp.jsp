<HTML>
<body >

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  
       try{
        Connection con;
        DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	String pcode=request.getParameter("T1");
	String pname=request.getParameter("T2");
	String pqty=request.getParameter("T3");
	String pprice=request.getParameter("T4");
        String pdate=request.getParameter("T5");    
	
        int i=st.executeUpdate("insert into purchase_det values('"+pcode+"','"+pname+"',"+Integer.parseInt(pqty)+","+Double.parseDouble(pprice)+",to_date('"+pdate+"','dd-mm-yy'))");
	st.executeUpdate("update prod_det set present_stock=+"+Integer.parseInt(pqty)+" where p_code='"+pcode+"'");
	if(i==1)
        {
	       
	
	out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Successfully Added<h1></font><center>");
        }
	else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Added<h1><center></font>");
        }
        out.println("<center><a href='getpurchase_det_jsp.jsp'><font face='comic sans ms'  size='4' COLOR='#99CC00'>New Purchases</font</a></center>");
	out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Back To Administrative Services</font></pre></a></center>");                                                                                 
	
	}
	catch(Exception e)
	{
	out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Invalid Data<h1></font><center>");
	out.println("<center><a href='getpurchase_det_jsp.jsp'><font face='comic sans ms'  size='4' COLOR='#99CC00'>New Purchases</font</a></center>");
	out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Back To Administrative Services</font></pre></a></center>");                                                                                 
	
    
	System.out.println("ERROR..ERROR");
	}
	

	%>
  
</body>
</html>