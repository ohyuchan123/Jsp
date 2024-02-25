<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>count</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;background-color:lightgray">
		<h2 style="text-align:center;">부서별근무일수집계</h2>
		<form style="display:flex;align-items:center;justify-content:center;text-align:center">
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>부서명</td>
					<td>근무일수</td>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					try{
						Connection con = Util.getConnection();
						String sql = "select re.empno, empname, deptcode, count(resvno) "+
									"from tbl_emp_202108 em, tbl_resv_202108 re "+
									"where em.empno=re.empno "+
									"group by re.empno, empname, deptcode "+
									"order by deptcode";
						PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()){
							String dept = rs.getString(3);
							switch(dept){
							case "10":
								dept="영업팀";
								break;
							case "20":
								dept="총무팀";
								break;
							case "30":
								dept="구매팀";
								break;
							}
							%>
								<tr>
									<td><%=rs.getString(1) %></td>
									<td><%=rs.getString(2) %></td>
									<td><%=dept %></td>
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
</body>
</html>