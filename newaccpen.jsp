<%@ page import="java.sql.*"%>
<%@ page import ="p1.*" %>
<HTML>
<HEAD>
<TITLE> Pending Account </TITLE>
</HEAD>
<jsp:include page="bheader.jsp"/>
<BODY><center><BR><BR><BR><BR><h2><u>List Of Pending Accounts</u></h2><BR><BR><BR> 
 <table align=center cellpadding="0" border=1 width="60%" cellspacing="0">
<colgroup span=4 align=center width="10%">
<tr>
	<td align=center><b>A/C Number </td>
		<td align=center><b> A/C Name </td>
			<td align=center ><b>Customer ID</td>
	<td align=center><b>Name of Bank</td> <td align=center><b>Amount</td>  <td align=center colspan=2><b>Operation</td> 
				</tr>
<%
 
String bn=request.getParameter("bname");
 String id="";
int in=0;
try
{
 Connection con = DB.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from customer where status=0 and bname='"+bn+"'");
while(rs.next())
{  id=rs.getString(1);
	System.out.println("id: "+id);
	 %>
<tr>
	<td align=center><%=rs.getString(4)%> </td>
	<td align=center><%=rs.getString(5)%> </td>
	 
		<td align=center><%=id%> </td>
				<td align=center><%=rs.getString(7)%> </td>
		<td align=center><%=rs.getFloat(8)%> </td>
		<td align=center colspan="2"><a href="comp.jsp?id=<%=id%>">Grant</a> </td> 
		
		</tr>
		<%
			in++;
}
if(in==0)
response.sendRedirect("norec1.jsp");
session.setAttribute("id",id);
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</table><BR><BR>
 </BODY>
</HTML>
