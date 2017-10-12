<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchase Items<hr color=#99CC00></CENTER></font></head>
<script language="javascript">
var isIE = document.all?true:false;

	function check()
	{
		a=frm.T1.value.length;
		if(a<=0)
		{
		alert("quantity not mentioned");
		return false;
		}
		else 
		{
		return true;
		}
		
	}
	function Ints()
	{
	var _ret=true;
	if (isIE)
	{
	if (window.event.keyCode < 46 || window.event.keyCode > 57) 
	{
	window.event.keyCode = 0;
	_ret = false;
	}
	}
	
	}
</script>

<BODY BGCOLOR>

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%!
	Connection con;
	Statement st,st1;
	ResultSet rs;


%>

<%	
	DBCon dbconn=new DBCon();
	con=dbconn.getCon();
	String user=request.getParameter("usr");
	System.out.println("cpurchase1 "+user); 
	st=con.createStatement();
	st1=con.createStatement();
	rs=st.executeQuery("select p_code,p_name from prod_det order by p_code"); 
%>
<br><br><br>
<form method="post" action="clientpurchases_jsp.jsp" name="frm" onsubmit="return check()">
	<FONT  face="comic sans ms" size=2 COLOR=#006600>Product Code & Name:</font><select name="list" style='width:150'><br><br><br>
	<%
		 while(rs.next())
		  { 
		  String pcode=rs.getString(1);
		  String pname=rs.getString(2);
	 %>
		<option value=<%=pcode%>><%=pcode.toUpperCase()%> --- <%=pname.toUpperCase()%></option>
	<%	  
		  }
		  // st.close();
		  // st1.close();
		  // rs.close();
	%>
		
 
  </select>
  <br><br>
  <FONT  face="comic sans ms" size=2 COLOR=#006600>Number Of Units:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
  <input type=text name="T1" onkeypress="Ints()">
  <input type=hidden name="T2" value=<%=user%>>
  <br><input type="submit" value="Purchase">
  </form>
  
</BODY>
</HTML>
