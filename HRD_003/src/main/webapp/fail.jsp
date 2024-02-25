<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fail</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed;top:60px;width:100%;height:100%;left:0px;background-color:lightgray">
		<h2 style="text-align:center">좌석예매 정보가 존재하지 않습니다.</h2>
		<p style="text-align:center">
			<input type="button" value="돌아기기" onclick="window.location='list.jsp';">
		</p>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>