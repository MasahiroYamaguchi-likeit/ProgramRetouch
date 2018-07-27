<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.UserDataBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報更新完了</title>
<jsp:include page="/baselayout/head.html" />
<%
	UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">更新完了</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row">
							<div class="input-field col s6">
								<input type="text" value="<%=udb.getName()%>" readonly> <label>名前</label>
							</div>
							<div class="input-field col s6">
								<input type="text" value="<%=udb.getLoginId()%>" readonly> <label>ログインID</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input type="text" value="<%=udb.getAddress()%>" readonly> <label>住所</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">上記内容で更新しました</p>
							</div>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">
									<a href="UserData" class="btn waves-effect waves-light  col s4 offset-s4">ユーザー情報へ</a>
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