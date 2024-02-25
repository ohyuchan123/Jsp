<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;background-color:lightgray">
		<h2 style="text-align:center;">근무좌석예약</h2>
		<form method="post" action="i_action.jsp" name="frm" style="display:flex;align-items:center;justify-content:center">
			<table border="1">
				<tr>
					<td>예약번호</td>
					<td><input type="text" name="resvno">예) 20210001</td>
				</tr>
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="empno">예) 1001</td>
				</tr>
				<tr>
					<td>근무일자</td>
					<td><input type="text" name="resvdate">예) 20211231</td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td><input type="text" name="seatno">예) S001 ~ S009</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="등록" onclick="addCheck()"> &nbsp;&nbsp;
						<input type="button" value="다시쓰기" onclick="res()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>