<html>
<body>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

 <%
        Connection con;
        DBCon dbconn=new DBCon(); 
	con=dbconn.getCon();
	Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from prod_det where present_stock<=min_stock");
        ResultSetMetaData rd=rs.getMetaData();
        int  count=rd.getColumnCount();
         %> 
   <html>
   <body >    




 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Items To Be Purchased<hr color=#99CC00></center></font></head> 
 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product code</th><th bgcolor=#999900> Name</th><th bgcolor=#999900>Price</th><th bgcolor=#999900>Minimum Stock </th><th bgcolor=#999900>Present Stock </th>
 
                          
<% 
    while(rs.next())
        {
           
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color:' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color:' align=center>"
   +rs.getString(4)+"</td>");            
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color:' align=center>"
   +rs.getString(5)+"</td>"); 
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   out.println("</table>");
   out.println("");  

%>
<pre>
                                                 <a href="Reports.html"><font face="comic sans ms">Back To Reports</font></a>

 </pre>
</body>
</html>