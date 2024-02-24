<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;
				background-color:lightgray;">
		<h2 style="text-align:center">회원목록조회/수정  </h2>
		<form style="display:flex;align-items:center;justify-content:center;text-align:center">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
				<%
					String grade="";
					try{
						Connection con = Util.getConnection();
						Statement stmt = con.createStatement();
						String sql = "select * from member_tbl_02";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							grade = rs.getString("grade");
							switch(grade){
							case "A":
								grade = "VIP";
								break;
							case "B":
								grade = "일반";
								break;
							case "C":
								grade = "직원";
								break;
							}
						%>
						<tr>
							<td><a href="modify.jsp?mod_custno=<%=rs.getString(1)%> "><%=rs.getString(1) %></a></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getDate(5) %></td>
							<td><%=grade %></td>
							<td><%=rs.getString(7) %></td>
						</tr>
						<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
			</table>
		</form>
		</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>