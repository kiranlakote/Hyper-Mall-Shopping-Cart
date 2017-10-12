<html>
<Head> <FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00> Product Modification Form<hr color=#99CC00></CENTER></font> </head>

<script language="javascript">
   function use()
   {
      frm1.T2.focus();
   }

   function check()
   {
   a=frm1.T1.value.length; 
   b=frm1.T2.value.length;
   c=frm1.T3.value.length;
   d=frm1.T4.value.length;
   e=frm1.T5.value.length;
	if( (a<=0 )||( b<=0)||( c<=0)||(d<=0)||(e<=0))
        {
		alert('Incomplete Information');
		return false;
       }
       else
       if(a>=6)
       {
         alert('Product code max size is 5');
         return false;
        }
        else
        if(b>=11)
        {
        alert('Product name max size is 10');
        return false;
        }
	else
	    {   
          return true;
         }
     }
     
  </script>

<body bgcolor onload="use()">

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String pcode,pname; %>
<%! int pmin,present;float pprice; %>
<%  try
       {
	Connection con,conins;
	DBCon dbconn=new DBCon();
	con = dbconn.getCon();
	Statement st=con.createStatement();
	String str=request.getParameter("list");
	System.out.println(str);
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
<form method="POST" action="Modified_prod_jsp.jsp" name=frm1 onsubmit="return check()">
<font face="comic sans ms" color=#006600 size=2 >
	  <p>Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="T1" size="20" readonly value= <%=pcode %>></p>
	 <p>Product Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T2" size="20" value= <%=pname %>>  </p>
	<p>Product Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T3" size="20" value= <%=pprice %>></p>
	<p>Minimum Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T4" size="20" value= <%=pmin %>></p>
	<p>Present Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T5" size="20" value= <%=present %>></p>
   
 

		  <input type="submit" value="  Modify  ">
</font>
</form>
</body>
</HTML>