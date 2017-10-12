<HTML>
<Head><body bgcolor="#CC33FF"><FONT  face="comic sans ms" size=3 COLOR="#FF0033"><center>
  <form name="form1" method="post" action="./credit.jsp">
    <center>
      <hr color=#99CC00>
      <font color="#006600" size="3" face="comic sans ms">Bill</font>
      <hr color=#99CC00>
    </CENTER>
    <%@ page import="java.sql.*,java.lang.Math,dbean.DBCon" %>
    <jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
    <%	
		
	String usr;
	float grandtot=0;
	double ids;
%>
    <%
    try
    {
	Connection con=dcon.getCon();
	Statement st=con.createStatement();
	
	Connection con1=dcon.getCon();
	Statement st1=con1.createStatement();
	Connection con2=dcon.getCon();
	Statement st2=con2.createStatement();
	
	usr=request.getParameter("tname");
	ids=Math.random()*10;
	String id1="ES"+ids;
	String id=id1.substring(0,10);
	System.out.println(id);
	

    
   	ResultSet rs2=st2.executeQuery("select * from "+usr);
   	
 	while(rs2.next())
	{     
		st1.executeUpdate("insert into sales_det values('"+rs2.getString(1)+"','"+rs2.getString(2)+"','"+rs2.getInt(3)+"','"+rs2.getFloat(4)+"',sysdate)");
	}
 
	out.println("Sorry, Please try again");
   	
	
	ResultSet rs=st.executeQuery("select sum(totprice)from "+usr+"");
	
	
	if(rs.next())
	{
		grandtot=rs.getFloat(1);
		System.out.println("your price"+grandtot);
	}
	rs.close();
	rs=null;
	
	

	
	st1.executeUpdate("drop table "+usr+"");	




%>
    <br>
    <br>
    <center>
      <font color="#FF6600" size="5" face="comic sans ms">Your order has been 
      placed.<br>
      <br>
      Your order number is<u> <%=id%></u> and your total amount is <%=grandtot%></font>
<%	  	session.setAttribute("ID",id);
       String tot=Float.toString(grandtot);
	session.setAttribute("TOTAL",tot);
	st.close();
st1.close();
rs.close();

}
catch(Exception e)
{

e.printStackTrace();
}
	%>

    </center>
    <br>
    <br>
    <font color="#FF6600" size="5" face="comic sans ms">ENTER UR CREDIT CARD NUMBER</font> 
    <input type="text" name="cno">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
      <input type="submit" name="Submit" value="Submit">
    </p>
    <center>
      <a href="main.html" target="_top"><font color=""#FF6600"" size="3" face="comic sans ms"></font><font color="#C6BB6C" size="3" face="comic sans ms">Logout</font></a> 
    </center>
    <p>&nbsp;</p>
  </form>
</CENTER>
</font><br>
<font color="#0066FF"></font> <br>
<br>
<a href="main.html" target=_top><font face="comic sans ms" size=3 COLOR="#FF6600"><center>
</center>
</font></a>
</BODY>
</HTMl>