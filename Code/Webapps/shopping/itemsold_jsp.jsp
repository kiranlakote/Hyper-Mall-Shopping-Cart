<html>
<body>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

 <%
        Connection con;
        DBCon dbconn=new DBCon(); 
	con=dbconn.getCon();
	Statement st=con.createStatement();
	String pcode=request.getParameter("list");
	String day1=request.getParameter("list1");
	String mon1=request.getParameter("list2");
	String yr1=request.getParameter("list3");
	String day2=request.getParameter("list4");
	String mon2=request.getParameter("list5");
	String yr2=request.getParameter("list6");
 
	String date1=day1+"-"+mon1+"-"+yr1;
	String date2=day2+"-"+mon2+"-"+yr2;

      ResultSet rs=st.executeQuery("select p_code,p_name,sum(p_qty) sum from prod_det where p_code='"+pcode+"' and s_date between '"+date1+"' and '"+date2+"' group by p_code,p_name");

%>

 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Sold Between <%= date1 %> And <%=date2 %><hr color=#99CC00></center></font></head> 

<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product code</th><th bgcolor=#999900>Product Name</th><th bgcolor=#999900>Number Of Items</th>

                          
<% 
    while(rs.next())
        {
           
           out.println("  <tr  >");
           out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
           out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString("sum")+"</td>");
            
     
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