<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.UserDataBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<jsp:include page="/baselayout/head.html" />
<%
	String validationMessage = (String) request.getAttribute("validationMessage");
	UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">新規登録</h5>
			<%if(validationMessage != null){ %>
			<P class="red-text"><%=validationMessage%></P>
			<%} %>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s6 offset-s3">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="RegistConfirm" method="POST">
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="<%=udb.getName()%>" name="user_name" type="text" required> <label>名前</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="<%=udb.getAddress()%>" name="user_address" type="text" required> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input value="<%=udb.getLoginId()%>" name="login_id" type="text" required> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input  name="password" type="password" required> <label>パスワード</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1">
									<input name="confirm_password" type="password" required> <label>パスワード（確認用）</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<p class="center-align">
										<button class="btn btn-large waves-effect waves-light  col s8 offset-s2" type="submit" name="action">確認</button>
									</p>
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