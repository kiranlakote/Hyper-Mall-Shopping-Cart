<HTML>
<body>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1,st2;
	String pname;
	float price,tot;
	int pstock; 
%>
<%  
//DBCon dbconn=new DBCon();
	con = dcon.getCon(); 
	st=con.createStatement();
	
	String pcode=request.getParameter("list");
	int qty=Integer.parseInt(request.getParameter("T1"));
	String tname1=request.getParameter("T2");
	System.out.println("_jsp"+tname1);
	st1=con.createStatement();
	st2=con.createStatement();
	rs1=st1.executeQuery("select * from prod_det where p_code='"+pcode+"'");
	if(rs1.next())
	{
		pcode=rs1.getString(1);
		pname=rs1.getString(2);
		price=rs1.getFloat(3);
		pstock=rs1.getInt(5);
	}
	
	if(qty>pstock)
	{
	
%>		
	<br><br><br><br><br><br><br>
	<center><font face='comic sans ms'  size='4' COLOR='#FF0000'>Required Quantity Not Available</font></center>
	<br><br><br>
	 <center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font></a></center>


<%
	}
	else
	{
		tot=price*qty;

		int i=st.executeUpdate("insert into "+tname1+" values('"+pcode+"','"+pname+"',"+qty+","+price+","+tot+")");
		System.out.println(i);
		if(i==1)
		{
		rs=st.executeQuery("select * from "+tname1+"");
		}
		else
		{ 
		out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Added To Your List<h1><center></font>");
		}
		st1.executeUpdate("update prod_det set present_stock=present_stock - "+qty+" where p_code='"+pcode+"'");
	
		
			
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
   /*st.close();
    st1.close();
    st2.close();
    rs1.close();
    rs.close();*/
   out.println("</table>");
   out.println("");  

%>


        <center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font></a></center>

	<center><a href='deleteclientitem.jsp?usr=<%=tname1%>'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Delete an item from the list</font></pre></a></center> 
	<input type=hidden name="tname" value=<%=tname1%>>
	<center><input type=submit value="Make Bill"></center>
<% } 
%>
</form> 
</body>
</html>