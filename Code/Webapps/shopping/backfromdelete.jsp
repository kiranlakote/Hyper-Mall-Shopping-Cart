

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%! 
	Connection con;
	ResultSet rs;
	Statement st;
	String pcode,pname;
	float price,tot; 
%>
<%  
     //DBCon dbconn=new DBCon();
	con = dcon.getCon();
	st=con.createStatement();
	
	String tname1=request.getParameter("usr");
	System.out.println("back:"+tname1);
	rs = st.executeQuery("select * from "+tname1+"");
		
	
%>
       
   <html> 
   <body >    

<form method="post" action="makebill.jsp" >

 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Your List Of Purchases<hr color=#99CC00></center></font></head> 
  </body> 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 0.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product code</th><th bgcolor=#999900> Name</th><th bgcolor=#999900>Quantity</th><th bgcolor=#999900>Unit Price</th><th bgcolor=#999900>Total Price</th>

                          
<% 
    while(rs.next())
        {
           
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style:; background-color:' align=center>"
   +rs.getString(1)+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color:' align=center>"
   +rs.getString(4)+"</td>");            
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color:' align=center>"
   +rs.getString(5)+"</td>"); 
             
   
           out.print("</tr>");
            
   }
    //st.close();
    //rs.close();
   out.println("</table>");
   out.println("");  
   	

%>


        <center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font></a></center>

	<center><a href='deleteclientitem.jsp?usr=<%=tname1%>'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Delete an item from the list</font></pre></a></center> 
	<input type=hidden name="tname" value=<%=tname1%>>
	<center><input type=submit value="Make Bill"></center>

 </form> 
</body>
</html>