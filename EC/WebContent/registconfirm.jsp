<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.UserDataBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録/入力内容確認</title>
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
			<h5 class=" col s12 light">入力内容確認</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s6 offset-s3">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="RegistResult" method="POST">
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input type="text" name="user_name" value="<%=udb.getName()%>" readonly> <label>名前</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input type="text" name="user_address" value="<%=udb.getAddress()%>" readonly> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input type="text" name="login_id" value="<%=udb.getLoginId()%>" readonly> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input type="password" name="password" value="<%=udb.getPassword()%>" readonly> <label>パスワード</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<p class="center-align">上記内容で登録してよろしいでしょうか?</p>
								</div>
							</div>
							<div class="row">
								<div class="col s6 center-align">
									<button class="btn  waves-effect waves-light" type="submit" name="confirm_button" value="cancel">修正</button>
								</div>
								<div class="col s6 center-align">
									<button class="btn  waves-effect waves-light" type="submit" name="confirm_button" value="regist">登録</button>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>