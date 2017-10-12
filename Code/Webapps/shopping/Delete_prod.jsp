<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00> Choose The Product Code To Be Deleted<hr color=#99CC00></CENTER> </font></head>
<body bgcolor >
<form method="POST" action="Delete_prod_jsp.jsp" >
<pre>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
	 
	Connection con,conins;
	DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_code,p_name from prod_det order by p_code");
%>	
	<br><br><br><FONT  face='comic sans ms' size=2 COLOR=#006600>Product Code & Name:</font>
	<select name='list' style='width:150'><br><br><br><br>
<%	
		 while(rs.next())
		  { 
		  String pcode=rs.getString(1);
%>
		<option value=<%=pcode%>><%=pcode.toUpperCase()%>---<%=rs.getString(2).toUpperCase()%></option>
<%	  
		  }
        
%>
         </select>
						  
    <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Get Record  ">       
</pre>
</form>

</body>
</HTML>
