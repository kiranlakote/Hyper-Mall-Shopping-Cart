<html>
<body>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Product Deletion Form<hr color=#99CC00></CENTER></font> </head>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String pcode,pname; %>
<%! int pmin,present;float pprice; %>
<%  try
       { 
      
	Connection con,conins; 
	con = dcon.getCon();
	Statement st=con.createStatement();
	String str=request.getParameter("list");
	ResultSet rs=st.executeQuery("select * from prod_det where p_code='"+str+"'");
	      if(rs.next())
	     {
		  
		  pcode=rs.getString(1).toUpperCase();
		  pname=rs.getString(2).toUpperCase();
		  pprice=rs.getFloat(3);
		  pmin=rs.getInt(4);
		  present=rs.getInt(5);
	     }	 

	   else 
	    {
%>
          <jsp:forward page="No_p_code.html" />
<%
	    } 
	}    
       catch(Exception e)
       { 
          e.printStackTrace();
        }
%>
<form method="POST" action="Deleted_prod_jsp.jsp">
<font face="comic sans ms" color=#006600 size=2>

	  <p>Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="T1" size="20" readonly value= <%=pcode %>></p>
	 <p>Product Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T2" size="20" readonly value= <%=pname %>>  </p>
	<p>Quantity Purchased:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T3" size="20" readonly value= <%=pprice %>></p>
	<p>Product Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T4" size="20" readonly value= <%=pmin %>></p>
	<p>Date Of Purchase:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T5" size="20" readonly value= <%=present %>></p>
                  <input type="submit" value="Delete">
</font>
</form>
</body>
</HTML>