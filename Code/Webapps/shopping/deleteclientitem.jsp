<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00> Choose The Item To Be Removed<hr color=#99CC00></CENTER> </font></head>
<body bgcolor >
<form method="POST" action="Deletedclientitem.jsp" >
<pre>
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
	 
	Connection con,conins;
	DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	String tname=request.getParameter("usr");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select pcode,pname from "+tname+"");
%>	
	<br><br><br><FONT  face='comic sans ms' size=2 COLOR=#006600>Product Code & Name:</font><select name='list' style='width:150'><br><br><br><br>
<%	
		 while(rs.next())
		  { 
      String pcode=rs.getString(1);
       String pname=rs.getString(2);
%>
		<option value=<%=pcode%>><%=pcode.toUpperCase()%>---<%=pname.toUpperCase()%></option>
<%	  
		  }
        
%>
         </select>
	<input type=hidden name="T2" value=<%=tname%>>					  
    <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Remove Item">       
</pre>
</form>

</body>
</HTML>
