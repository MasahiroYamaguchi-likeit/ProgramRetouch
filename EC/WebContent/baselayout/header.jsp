<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="red darken-4" role="navigation">
	<div class="nav-wrapper container">
		<a id="logo-container" href="Index" class="brand-logo">EC</a>
		<ul class="right">
			<% boolean isLogin = session.getAttribute("isLogin")!=null?(boolean) session.getAttribute("isLogin"):false; %>

			<%if(isLogin){ %>
			<li><a href="UserData"><i class="material-icons">account_circle</i></a></li>
			<%}else{ %>
			<li><a href="Regist"><i class="material-icons">add</i></a></li>
			<%} %>

			<li><a href="Cart"><i class="material-icons">shopping_cart</i></a></li>

			<%if(isLogin){ %>
			<li><a href="Logout"><i class="material-icons">exit_to_app</i></a></li>
			<%}else{ %>
			<li><a href="Login"><i class="material-icons">vpn_key</i></a></li>
			<%} %>
		</ul>
	</div>
</nav>