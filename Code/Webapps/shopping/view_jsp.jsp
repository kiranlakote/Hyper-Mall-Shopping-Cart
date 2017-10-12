<html>
<body>    

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String usr; 
    Connection con;
    // DBCon dbconn;
    Statement st;
    ResultSet rs;

%>
<FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Availability Of Stock<hr color=#99CC00></center></font>
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <tr><th bgcolor=#A9F1A5>Product code</th><th bgcolor=#A9F1A5> Name</th><th bgcolor=#A9F1A5>Price</th><th bgcolor=#A9F1A5>Stock Available</th></tr>

 <%
    // dbconn=new DBCon();
	// con=dbconn.getCon();
	con=dcon.getCon();
	st=con.createStatement();
	usr=request.getParameter("usr");
    rs=st.executeQuery("select * from prod_det order by p_code");
    System.out.println(rs);                      

    while(rs.next())
        {          
        out.println("<tr>");
     out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color:' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color:' align=center>"
   +rs.getString(5)+"</td>");    
           out.print("</tr>");
    
   }
   out.println("</table>");
   // st.close();
   // rs.close();
%>

<pre>
                                                <a href="clientservices.jsp?usr=<%= usr %>"><font face="comic sans ms" color=#66FF99>Back </font></a>
</pre>
</body>
</html>
