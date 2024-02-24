<%@page import="java.text.*"%>
<%@page import="org.apache.tomcat.websocket.Transformation"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<script type="text/javascript" src="check.js"></script>
		
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;
				background-color:lightgray;">
		<h2 style="text-align:center">홈쇼핑 회원 정보 수정</h2>
		<form method="post" action="action.jsp" style="display:flex;align-items:center;justify-content:center;
					text-align:center">
			<input type="hidden" name="mode" value="modify">
			<table border="1">
				<%
					String mod_custno = request.getParameter("mod_custno");
					String custname="";
					String phone="";
					String address="";
					Date joindate;
					String grade="";
					String city="";
					String joindateStr ="";
					try{
						Connection con = Util.getConnection();
						Statement stmt = con.createStatement();
						String sql = "select * from member_tbl_02 where custno= "+ mod_custno ;
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						mod_custno = rs.getString(1);
						custname = rs.getString(2);
						phone = rs.getString(3);
						address = rs.getString(4);
						joindate = rs.getDate(5);
						grade = rs.getString(6);
						city = rs.getString(7);
						
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
						joindateStr = transFormat.format(joindate);
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%=mod_custno%>"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=custname%>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=phone%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=joindateStr%>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" value="<%=grade%>"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=city%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" onclick="modify()">
						<input type="button" value="조회" onclick="search()">
					</td>
				</tr>
			</table>
		</form>
	</section>	
</body>
</html>