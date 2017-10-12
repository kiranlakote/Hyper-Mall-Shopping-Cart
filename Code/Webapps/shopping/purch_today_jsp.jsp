<html>
<body>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<% 
try
{

    Connection con;
    Statement st;
    ResultSet rs; 
    con=dcon.getCon();
     System.out.println("con is");  
	st=con.createStatement();
	
	 rs=st.executeQuery("select p_code,p_name,p_qty,p_price,pursc_date from purchase_det where pursc_date like sysdate");
    
       %> 
    
  



 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases For Today<hr color=#99CC00></center></font></head> 
  </body> 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product Code</th><th bgcolor=#999900>Name</th><th bgcolor=#999900>Quantity</th><th bgcolor=#999900>Price</th><th bgcolor=#999900>Date</th>

                          
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
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(4)+"</td>");            
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color:' align=center>"
   +rs.getString(5).toUpperCase()+"</td>");            
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   out.println("</table>");
   out.println("");  
     st.close();
 rs.close();
   
 }
 catch(Exception e)
 {
 }
%>
<pre>
     <a href="Reports.html"><font face="comic sans ms">Back To Reports</font></a>

</pre>
