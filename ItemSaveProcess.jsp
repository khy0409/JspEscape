<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String item = request.getParameter("ItemInput");
String branchKey = (String)session.getAttribute("branchKey");

DAO dao = new DAO(application);
DTO dto = dao.SelectItem(item, branchKey);
dao.close();
	if (dto.getItem() != null) {
		session.setAttribute(dto.getInventoryID(), dto.getItem());
		response.sendRedirect("GameMain.jsp");
	}else {
		request.setAttribute("ItemErr", "아이템 코드가 틀렸습니다");
		request.getRequestDispatcher("GameMain.jsp").forward(request,response);
	}
%>