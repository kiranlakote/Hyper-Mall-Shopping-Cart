<html>
<body>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! Connection con;
DBCon dbconn=new DBCon();
    Statement st;
    ResultSet rs;
%>
 
 <%
 
   try
  {
      con=dbconn.getCon();
	st=con.createStatement();
        rs=st.executeQuery("select p_code,p_name,p_price from sales_det minus select p_code,p_name,p_price from  sales_det where trunc(sysdate-sales_date) between 0 and 31");
      %> 
   <html>
   <body >    
 


 <head><center><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Non-Sold Items<hr color=#99CC00></center></font></head> 

<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product Code</th><th bgcolor=#999900>Product Name</th><th bgcolor=#999900>Price</th>

                          
<% 
        
    while(rs.next())
        {
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
                     
          
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   
   out.println("</table>");
  
   out.println("");  
   // st.close();
   // rs.close();
   }
   catch(Exception e)
   {
   out.println("Please try again");
   }


%>
<pre>
                                                 <a href="Reports.html"><font face="comic sans ms">Back To Reports</font></a>

</pre>
</body>
</html>