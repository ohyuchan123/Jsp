<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<script type="text/javascript" src="check.js"></script>
	
	<%	
		request.setCharacterEncoding("UTF-8");	
		Connection con = null;
		Statement stmt = null;
		String custno="";
		try{
			con = Util.getConnection();
			stmt = con.createStatement();
			String sql = "select max(custno)+1 custno from member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString("custno");
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;
				background-color:lightgray;">
		<h2 style="text-align:center">회원등록 </h2>
		
		<form method="post" action="action.jsp" name="frm" style="display:flex;align-items:center;justify-content:center;
				text-align:center">
			 <input type="hidden" name="mode" value="insert">
			<table border="1">
				<tr>
					<td>회원번호(자동발생) </td>
					<td><input type="text" name="custno" readonly value="<%=custno %>"></td>
				</tr>
				<tr>
					<td>회원성명 </td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화  </td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소  </td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자  </td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급 [A : VIP, B : 일반, C : 직원 ] </td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드  </td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="joinCheck()">
						<input type="button" value="조회" onclick="search()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>