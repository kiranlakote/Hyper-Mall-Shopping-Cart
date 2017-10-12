<HTML>
<HEAD>
<FONT face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>New Product Addition<hr color=#99CC00> </center></FONT>
</HEAD>


<script language="javascript">
   function use()
   {
      frm1.T1.focus();
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
<form method="POST" action="Add_prod_jsp.jsp" name=frm1 onSubmit="return check()">
<%@page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String pcode; %>
<%
/*	 	 	 
	try
	{
	Connection con;
	con=dcon.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(p_code) from prod_det");
	  if(rs.next())
	  {
	     pcode=rs.getString(1);
	   
	     }
	     
	   x=Integer.parseInt(pcode);
	  x=x+1;
	  
          }
	  catch(Exception e)
	  {
	  e.printStackTrace();
	  } */
%>
	     <font face="comic sans ms" color=#006600 size=2> 

	  <p>Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="T1" size=20 ></p>
	 <p>Product Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T2" size=20 maxlenght=20>  </p>
	<p>Product Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T3" size=20 maxlenght=10></p>
	<p>Minimum Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T4" size=20 maxlenght=5></p>
	<p>Present Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T5" size=20 maxlenght=5></p>
   
  
               <pre><input type="submit" value="  Add  " >  <input type="Reset"  value=" Reset " >
</pre>
</font>
</form>
	<left><a href="Products_det.html"><font face="comic sans ms"  size="3" COLOR="#006600">Back</font></a></left>                                                                                 

</body>
</HTML>
