<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.ItemDataBeans"%>
<%@page import=" java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
<jsp:include page="/baselayout/head.html" />
<%
	ArrayList<ItemDataBeans> itemList = (ArrayList<ItemDataBeans>) request.getAttribute("itemList");
	String searchWord = (String) session.getAttribute("searchWord");
	int pageMax = (int) request.getAttribute("pageMax");
	int pageNum = (int) request.getAttribute("pageNum");
	int itemCount = (int) request.getAttribute("itemCount");
%>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<div class="row center">
				<div class="input-field col s8 offset-s2 ">
					<form action="ItemSearchResult">
						<i class="material-icons prefix">search</i> <input type="text" name="search_word" value="<%=searchWord%>">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">検索結果</h5>
			<p>
				検索結果<%=itemCount%>件
			</p>
		</div>
		<div class="section">
			<!--   商品情報   -->
			<div class="row">
				<%
					int i = 0;
					for (ItemDataBeans item : itemList) {
						i++;
				%>
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="Item?item_id=<%=item.getId()%>&page_num=<%=pageNum%>"><img src="<%="img/" + item.getFileName()%>"></a>
						</div>
						<div class="card-content">
							<span class="card-title"><%=item.getName()%></span>
							<p><%=item.getPrice()%>円
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
		</div>
		<div class="row center">
			<ul class="pagination">
				<!-- １ページ戻るボタン  -->
				<%
					if (pageNum == 1) {
				%>
				<li class="disabled"><a><i class="material-icons">chevron_left</i></a></li>
				<%
					} else {
				%>
				<li class="waves-effect"><a href="<%="ItemSearchResult?search_word=" + searchWord + "&page_num=" + (pageNum - 1)%>"><i class="material-icons">chevron_left</i></a></li>
				<%
					}
				%>
				<!-- ページインデックス -->
				<%
					for (int j = pageNum - 5; j <= pageNum + 5; j++) {
				%>
				<!-- マイナスページが生成されないように -->
				<%
					if (j <= 0) {
							j = 1;
						}
				%>
				<li <%if (pageNum == j) {%> class="active" <%}%>><a href="<%="ItemSearchResult?search_word=" + searchWord + "&page_num=" + j%>"><%=j%></a></li>
				<!-- MAXを越さないように -->
				<%
					if (pageMax <= j) {
							break;
						}
				%>
				<%
					}
				%>
				<!-- 1ページ送るボタン -->
				<%
					if (pageNum == pageMax || pageMax == 0) {
				%>
				<li class="disabled"><a><i class="material-icons">chevron_right</i></a></li>
				<%
					} else {
				%>
				<li class="waves-effect"><a href="<%="ItemSearchResult?search_word=" + searchWord + "&page_num=" + (pageNum + 1)%>"><i class="material-icons">chevron_right</i></a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>