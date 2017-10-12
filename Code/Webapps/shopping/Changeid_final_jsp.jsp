<html>
<Head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Change Product Id <hr color=#99CC00></CENTER></font> </head>

<script language="javascript">
   function use()
   {
      frm1.T1.focus();
   }

   function check()
   {
   a=frm1.T6.value.length; 
   b=frm1.T2.value.length;
  	if((a<=0 ) || (b<=0))
        {
		alert('Values Left Empty');
		return false; 
         }
         else
         if(a>=5)
         {
          alert('Product code is max 5');
          return false;
          }
          else
          if(b>=11)
          {
          alert('Product name is max 10');
          return false;
          }
	else
	 {
		 return true;
	
         }
    }
  </script>

<body bgcolor onload="use()">
<form method="POST" action="ChangedId_final_jsp.jsp" name="frm1" onsubmit="return check()">

<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String pcode,pname; %>
<%! int pmin,present,pprice; 
    Connection con;
    Statement st;
    ResultSet rs;
    
%>

<%  try
       {
	//DBCon dbconn=new DBCon();
	con = dcon.getCon();
	st=con.createStatement();
	String str=request.getParameter("list");
	rs=st.executeQuery("select p_code,p_name,p_price,min_stock,present_stock from prod_det where p_code='"+str+"'");
	     if(rs.next())
	     {
		 
		  pcode=rs.getString(1).toUpperCase();
		  pname=rs.getString(2).toUpperCase();
		  pprice=rs.getInt(3);
		  pmin=rs.getInt(4);
		  present=rs.getInt(5);
		  
	     } 

        
	}    
       catch(Exception e)
       { 
          e.printStackTrace();
        }
	// st.close();
	// rs.close();
	
%>
<font face="comic sans ms" color=#006600 size=2 >
	  <p>Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="T1" size="20" readonly value= <%=pcode %>></p>
      <p>New Product Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="T6" size="20"  value= ""></p>
	  
	  <p>Product Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T2" size="20" readonly value= <%=pname %>>  </p>
	  <p>Product Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="text" name="T3" size="20"  value= <%=pprice %>></p>
	  <p>Minimum Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T4" size="20" readonly value= <%=pmin %>></p>
	  <p>Present Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <input type="text" name="T5" size="20" readonly value= <%=present %>></p>
   
 

		  <input type="submit" value="  Change Id  ">
</font>
</form>
</body>
</HTML>