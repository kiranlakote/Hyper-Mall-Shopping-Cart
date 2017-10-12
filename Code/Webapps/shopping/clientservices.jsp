<HTML>
<Head><FONT face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Client Services<hr color=#99CC00></CENTER></font></head>
<BODY BGCOLOR>

<!--   <form method="post" > -->
<% String user;%>
<%

	user=request.getParameter("usr");
	System.out.println("cservice"+user);
%>
<font face="comic sans ms" size=3 COLOR=#006600><center>Welcome <%=user.toLowerCase()%></center></font>
<UL>
<pre>

<a href="./view_jsp.jsp?usr=<%=user%>"><FONT  face="comic sans ms" size=2 COLOR=#006600><LI>View Items</LI></a>



<a href="./clienttable.jsp?usr=<%=user%>"><FONT  face="comic sans ms" size=2 COLOR=#006600><LI>Purchase Items</LI></font></a>


</pre>
</UL>
<p align="center"><FONT  face="comic sans ms" size=3 COLOR=#006600><a href="main.html" target="_top"><font color="#C6BB6C" size="3" face="comic sans ms">Logout</font></a> 
  </font> </p>
<!--  </form> -->

</BODY>
</HTML>
