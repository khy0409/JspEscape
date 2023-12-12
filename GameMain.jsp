<%@page import="java.util.ArrayList"%>
<%@page import="escape.DAO"%>
<%@page import="escape.DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escape Game</title>
<link rel="stylesheet" href="../CSS/GameMain.css">
<script>
/* function item(ele) {
	if (window.event.keyCode == 13) {
    	location.href="ItemSaveProcess.jsp";
    }
} */

</script>
<%
DTO dto = new DTO();
String branchKey = (String)session.getAttribute("branchKey");
if (session.getAttribute("ContentText") == null)
	session.setAttribute("ContentText", "(시작)");
%>
</head>
<body>
	<div id="Story">
		<h2>Story</h2>
		<form method="post" name="StoryForm" action="StoryProcess.jsp">
			<table border="1" id="StoryTab">
				<tr>
					<td colspan="4" class="head">Story</td>
				</tr>
				<tr>
					<td colspan="4"><%=request.getAttribute("StoryErr") == null ? session.getAttribute("ContentText")
		: request.getAttribute("StoryErr")%></td>
				</tr>
				<tr>
					<td rowspan="2" class="head">KeyWord</td>
					<td><input type="text" name="StoryKeyInput"
						placeholder="키워드를 입력하세요" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="Item">
		<h2>Inventory</h2>
		<form method="post" name="InventoryForm" action="ItemProcess.jsp">
			<table border="1" id="InventoryTab">
				<tr>
					<td class="head">Item</td>
					<td><input type="text" name="ItemKeyInput"
						placeholder="아이템 코드를 입력하세요" /></td>
				</tr>
			</table>
		</form>
		<form method="post" name="ItemForm" action="ItemSaveProcess.jsp">
			<table border="1" id="ItemTab">
				<tr>
					<td><input type="text" name="ItemInput" placeholder="아이템 코드"
					onkeyup="item()"/></td>
					<td rowspan="6" id ="ItemText">Story</td>
				</tr>
				<tr>
					<td><input type="text" name="ItemInput" placeholder="아이템 코드" 
					onkeyup="item()"/></td>
				</tr>
				<tr>
					<td><input type="text" name="ItemInput" placeholder="아이템 코드" 
					onkeyup="item()"/></td>
				</tr>
				<tr>
					<td><input type="text" name="ItemInput" placeholder="아이템 코드" 
					onkeyup="item()"/></td>
				</tr>
				<tr>
					<td><input type="text" name="ItemInput" placeholder="아이템 코드" 
					onkeyup="item()"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="Branch">
		<h2>Branch</h2>
		<form method="post" name="BranchKeyForm" action="BranchProcess.jsp">
			<table border="1" id="BranchTab">
				<tr>
					<td rowspan="2" class="head">Branch</td>
					<td><input type="text" name="BranchKeyInput"
						placeholder="분기점 코드를 입력하세요" /></td>
				</tr>
				<tr>
					<td><%=request.getAttribute("BranchErr") == null ? session.getAttribute("branchKey")
		: request.getAttribute("BranchErr")%></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>