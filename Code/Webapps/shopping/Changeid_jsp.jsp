<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Change An Id<hr color=#99CC00></CENTER></font></head>

<BODY BGCOLOR>
<form method=post action="Changeid_final_jsp.jsp">
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%!
	Connection con;
	Statement st;
	ResultSet rs;

%>
<%	
	//DBCon dbconn=new DBCon();
	con=dcon.getCon();
	st=con.createStatement();
	rs=st.executeQuery("select p_code,p_name from prod_det order by p_code"); %>
	<br><br><br>
	<center><FONT  face="comic sans ms" size=2 COLOR=#006600>Product Code & Name:</font><select name="list" style='width:150'><br><br><br><br>
	<%
		 while(rs.next())
		  {
		  String pc=rs.getString(1); 
		 %>
		<option value=<%=pc%>><%=pc.toUpperCase()%> --- <%=rs.getString(2).toUpperCase()%></option>
		<%	  
		  }
	// st.close();
	// rs.close();
		
  %>
  </select></center>
  <br>
<center><input type="submit" value=" Get "></center>

</form>
</BODY>
</HTML>
