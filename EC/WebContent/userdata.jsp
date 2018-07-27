<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="beans.BuyDataBeans"%>
<%@ page import="beans.UserDataBeans"%>
<%@ page import=" java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報</title>
<jsp:include page="/baselayout/head.html" />
<%
	String validationMessage = (String) request.getAttribute("validationMessage");
	UserDataBeans udb = (UserDataBeans) request.getAttribute("udb");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">ユーザー情報</h5>
		</div>
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="UserDataUpdateConfirm" method="POST">
							<%
								if (validationMessage != null) {
							%>
							<p class="red-text center-align"><%=validationMessage%></p>
							<%
								}
							%>
							<br> <br>
							<div class="row">
								<div class="input-field col s6">
									<input type="text" name="user_name" value="<%=udb.getName()%>">
									<label>名前</label>
								</div>
								<div class="input-field col s6">
									<input type="text" name="login_id"
										value="<%=udb.getLoginId()%>"> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input type="text" name="user_address"
										value="<%=udb.getAddress()%>"> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<button class="btn  waves-effect waves-light  col s4 offset-s4"
										type="submit" name="action">更新</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--  購入履歴 -->
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th style="width: 10%"></th>
									<th class="center">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center">購入金額</th>
								</tr>
							</thead>
							<c:forEach var="bdb" items="${bdb}">
								<tbody>
									<tr>
										<td class="center"><a
											href="UserBuyHistoryDetail?Id=${bdb.id}"
											class="btn-floating btn waves-effect waves-light "> <i
												class="material-icons">details</i></a></td>
										<td class="center">${bdb.formatDate}</td>
										<td class="center">${bdb.deliveryMethodName}</td>
										<td class="center">${bdb.totalPrice}円</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>