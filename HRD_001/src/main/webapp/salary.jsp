<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;
				background-color:lightgray;">
		<h2 style="text-align:center">회원매출조회</h2>
		<form style="display:flex;align-items:center;justify-content:center;
					text-align:center">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명 </td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
				<%
					String grade = "";
					try{
						Connection con = Util.getConnection();
						Statement stmt = con.createStatement();
						String sql = "SELECT me.custno, me.custname, me.grade, SUM(mo.price) AS total_price " +
					             "FROM member_tbl_02 me, money_tbl_02 mo " +
					             "WHERE me.custno = mo.custno " +
					             "GROUP BY me.custno, me.custname, me.grade " +
					             "ORDER BY total_price DESC";
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
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=grade %></td>
						<td><%=rs.getString(4) %></td>
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