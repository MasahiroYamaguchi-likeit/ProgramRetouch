<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.UserDataBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報/更新確認</title>
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
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="UserDataUpdateResult" method="POST">
							<div class="row">
								<div class="input-field col s6">
									<input type="text" name="user_name_update" value="<%=udb.getName()%>" readonly> <label>名前</label>
								</div>
								<div class="input-field col s6">
									<input type="text" name="login_id_update" value="<%=udb.getLoginId()%>" readonly> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input type="text" name="user_address_update" value="<%=udb.getAddress()%>" readonly> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<p class="center-align">上記内容で更新してよろしいでしょうか?</p>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<div class="col s6 center-align">
										<button class="btn  waves-effect waves-light  col s6 offset-s3" type="submit" name="confirmButton" value="cancel">戻る</button>
									</div>

									<div class="col s6 center-align">
										<button class="btn  waves-effect waves-light  col s6 offset-s3" type="submit" name="confirmButton" value="update">更新</button>
									</div>
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