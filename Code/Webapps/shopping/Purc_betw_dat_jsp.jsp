

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
try{
Connection con;
DBCon dbconn=new DBCon();
    Statement st;
    ResultSet rs;





        
	con=dbconn.getCon();
	st=con.createStatement();
	String day1=request.getParameter("list1");
	String mon1=request.getParameter("list2");
	String yr1=request.getParameter("list3");
	String day2=request.getParameter("list4");
	String mon2=request.getParameter("list5");
	String yr2=request.getParameter("list6");

	String date1=day1+"-"+mon1+"-"+yr1;
	String date2=day2+"-"+mon2+"-"+yr2;

        rs=st.executeQuery("select  p_code,p_name,p_qty,p_price,pursc_date from purchase_det where pursc_date between to_date('"+date1+"','DD-MON-YY') and to_date('"+date2+"','DD-MON-YY')");
         %> 
   


 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases Between <%= date1 %> and <%= date2 %><hr color=#99CC00></center></font></head> 
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
   +rs.getString(5)+"</td>");            
             
     
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
