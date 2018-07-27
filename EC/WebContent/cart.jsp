<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.ItemDataBeans"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート確認</title>
<jsp:include page="/baselayout/head.html" />
<%
	ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");
	String cartActionMessage = (String) request.getAttribute("cartActionMessage");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<%=cartActionMessage%>
			<h5 class=" col s12 light">買い物かご</h5>
		</div>
		<div class="section">
			<form action="ItemDelete" method="POST">
				<div class="row">
					<div class="col s12">
						<div class="col s6 center-align">
							<button class="btn waves-effect waves-light col s6 offset-s3 " type="submit" name="action">
								削除<i class="material-icons right">delete</i>
							</button>
						</div>
						<div class="col s6 center-align">
							<a href="Buy" class="btn  waves-effect waves-light col s6 offset-s3">レジに進む<i class="material-icons right">attach_money</i></a>
						</div>
					</div>
				</div>
				<div class="row">
					<%
						int i = 0;
						for (ItemDataBeans item : cart) {
							i++;
					%>
					<div class="col s12 m3">
						<div class="card">
							<div class="card-image">
								<a href="Item?item_id=<%=item.getId()%>"><img src="<%="img/" + item.getFileName()%>"> </a>
							</div>
							<div class="card-content">
								<span class="card-title"><%=item.getName()%></span>
								<p><%=item.getPrice()%>円
								</p>
								<p>
									<input type="checkbox" id="<%=i%>" name="delete_item_id_list" value="<%=item.getId()%>" /> <label for=<%=i%>>削除</label>
								</p>
							</div>
						</div>
					</div>
					<%
						if (i % 4 == 0) {
					%>
				</div>
				<div class="row">
					<%
						}
					%>
					<%
						}
					%>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>