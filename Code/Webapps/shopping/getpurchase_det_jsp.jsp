<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases<hr color=#99CC00></CENTER></font></head>

<BODY BGCOLOR>

<form method=post action="purchases.jsp">
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
	 
	 
	
	Connection con;
	DBCon dbconn=new DBCon();
	con=dbconn.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_code,p_name from prod_det order by p_code");
	
	out.println("<br><br><br><FONT  face='comic sans ms' size=2 COLOR=#006600>Product Code & Name:</font><select name='list' style='width:150'><br><br><br><br>"); 
		 while(rs.next())
		  { 
		  String pcode=rs.getString(1);
		  String pname=rs.getString(2);
		  
		 %>
		<option value="<%=pcode%>"> <%=pcode.toUpperCase()%> --- <%=pname.toUpperCase()%></option>
		<%	  
		  }
        
%>
    


<br><br><br><br><br><br><br><br><input type="submit" value="  Get  "><br>

</form>
</BODY>
</HTML>
