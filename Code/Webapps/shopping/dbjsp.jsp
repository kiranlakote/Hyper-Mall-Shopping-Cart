<HTML>
<HEAD>
<TITLE> E-Store </TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<%@ page import="java.sql.*,dbean.DBCon" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  Connection con;
DBCon dbconn=new DBCon();
  con = dbconn.getCon();

  out.println("Connection Created :"+con);
  %>

</BODY>
</HTML>
