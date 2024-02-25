<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String resvno = request.getParameter("resvno");
		String empno = request.getParameter("empno");
		String resvdate = request.getParameter("resvdate");
		String seatno = request.getParameter("seatno");
		try{
			Connection con = Util.getConnection();
			String sql="insert into tbl_resv_202108 values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, resvno);
			pstmt.setString(2, empno);
			pstmt.setString(3, resvdate);
			pstmt.setString(4, seatno);
			
			pstmt.executeUpdate();
			%>
				<jsp:forward page="insert.jsp"></jsp:forward>
			<%
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>