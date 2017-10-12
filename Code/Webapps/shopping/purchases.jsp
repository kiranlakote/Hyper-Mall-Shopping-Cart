<HTML>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases<hr color=#99CC00></CENTER></font></head>


<script language="javascript">
   
   function use()
   {
      frm1.T3.focus();
   }

   function check()
   {
   
   b=frm1.T2.value.length;
   c=frm1.T3.value.length;
   d=frm1.T4.value.length;
   e=frm1.T5.value.length;
	 
	if( ( b<=0)||( c<=0)||(d<=0)||(e<=0))
        {
		alert('Incomplete Information');
		return false; 
         }
	else
	 {
		 return true;
         }
     }
  </script>

<body bgcolor onload="use()">
<form method="POST" action="Purchases_jsp.jsp" name=frm1 onSubmit="return check()" >
	     <font face="comic sans ms" color=#006600 size=2> 

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String pcode,pname; %>
<%! int pprice; %>
<%
	 
	 
	
	Connection con;
	DBCon dbconn=new DBCon();
	con=dbconn.getCon();
	Statement st=con.createStatement();
	String str=request.getParameter("list");

	ResultSet rs=st.executeQuery("select  p_code,p_name,p_price from prod_det where p_code='"+str+"'");
	while(rs.next())
	{
	pcode=rs.getString(1).toUpperCase();
	pname=rs.getString(2).toUpperCase();
	pprice=rs.getInt(3);
	}
	//st.close();
	//rs.close();


%>
	
	<p>Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type=text name="T1" size="20" readonly value=<%=pcode %>></p>
	
	<p>Product Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="T2" size="20" readonly value=<%=pname %>></p>

	<p>Quantity :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T3" size="20" ></p>
	<p>Product Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T4" size="20" readonly value=<%=pprice %> ></p>
	
	<p>Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T5" size="20" ><font color="red">(dd-mm-yy)</font></p>
	  

                  <input type="submit" value="Add To Purchases">
                  <input type="Reset"  value=" Reset ">

</form>
	<a href="Products_det.html"><font face="comic sans ms"  size="3" COLOR="#006600"><left>Back</left></font></a>                                                                                

</body>
</HTML>
