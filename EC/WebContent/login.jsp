<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<jsp:include page="/baselayout/head.html" />
<%
	String loginErrorMessage = (String) request.getAttribute("loginErrorMessage");
	String inputLoginId = (String) request.getAttribute("inputLoginId");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="section"></div>
			<div class="col s6 offset-s3">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="LoginResult" method="POST">
							<div class="row">
								<%
									if (loginErrorMessage != null) {
								%>
								<p class="red-text center-align"><%=loginErrorMessage%></p>
								<br>
								<%
									}
								%>
								<div class="input-field col s8 offset-s2">
									<input type="text" name="login_id" value="<%=inputLoginId%>" required> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s8 offset-s2">
									<input type="password" name="password" required> <label>パスワード</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<p class="center-align">
										<button class="btn btn-large waves-effect waves-light  col s8 offset-s2" type="submit" name="action">ログイン</button>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col s8 offset-s2">
									<p class="right-align">
										<a href="Regist">新規登録</a>
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