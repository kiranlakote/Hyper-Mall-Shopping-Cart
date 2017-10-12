<HTML>
<body bgcolor>

<%@page import="java.sql.*, dbean.DBCon"%>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%	
	try
	{
        Connection con;
       // DBCon dbconn=new DBCon();
	con = dcon.getCon();
	Statement st=con.createStatement();
	String pcode=request.getParameter("T1");
	//String pname=request.getParameter("T2").toString();
	String npcode=request.getParameter("T6");
	//float pprice=Float.parseFloat(request.getParameter("T3"));
	//int pmin=Integer.parseInt(request.getParameter("T4"));
   // int present=Integer.parseInt(request.getParameter("T5"));
        
	ResultSet rs=st.executeQuery("select p_code from prod_det where p_code like '"+pcode+"'");
	

	if(rs.next())
	{	

       try
       {
       int i= st.executeUpdate("UPDATE prod_det SET p_code='"+npcode+"' WHERE p_code='"+pcode+"'");
	   if(i==1)        
	    out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Id Changed successfully <h1></font><center>");
         
    
     out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms' size='3' color=#99CC00>Back To Administrative Services</font></pre></a></center>");                                                                                 
     }
     catch(Exception ee)
     {
        out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>The item with that Id is exist. <h1></font><center>");
         out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms' size='3' color=#99CC00>Back To Administrative Services</font></pre></a></center>");                                                                                 
   
   
     }
   }
	}
	catch(Exception e)
	{
	  //out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Unable TO Change<h1><center></font>");
	  // out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms' size='3' color=#99CC00>Back To Administrative Services</font></pre></a></center>");                                                                                 
    
      
	   
	System.out.println("Error ...Error");
	}
	
	%>
  
</body>
</html>