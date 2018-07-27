<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>システムエラー</title>
<jsp:include page="/baselayout/head.html" />
<%
	String errorMessage = (String) request.getAttribute("errorMessage");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="section"></div>
			<div class="col s8 offset-s2">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row center">
							<h4 class="red-text">システムエラーが発生しました</h4>
							<h5 class="red-text"><%=errorMessage%></h5>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">
									<a href="Index" class="btn btn-large waves-effect waves-light  col s8 offset-s2">TOPページへ</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>