<%@page import="ec.Buy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.ItemDataBeans"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.BuyDataBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認</title>
<jsp:include page="/baselayout/head.html" />
<%
	ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");
	BuyDataBeans bdb = (BuyDataBeans) session.getAttribute("bdb");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">購入</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row">
							<table class="bordered">
								<thead>
									<tr>
										<th class="center">商品名</th>
										<th class="center">単価</th>
										<th class="center">小計</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (ItemDataBeans cartInItem : cart) {
									%>
									<tr>
										<td class="center"><%=cartInItem.getName()%></td>
										<td class="center"><%=cartInItem.getPrice()%>円</td>
										<td class="center"><%=cartInItem.getPrice()%>円</td>
									</tr>
									<%
										}
									%>
									<tr>

										<td class="center"><%=bdb.getDeliveryMethodName()%></td>
										<td class="center"></td>
										<td class="center"><%=bdb.getDeliveryMethodPrice()%>円</td>
									</tr>
									<tr>
										<td class="center"></td>
										<td class="center">合計</td>
										<td class="center"><%=bdb.getTotalPrice()%>円</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col s12">
								<form action="BuyResult" method="post">
									<button class="btn  waves-effect waves-light  col s4 offset-s4" type="submit">購入</button>
								</form>
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