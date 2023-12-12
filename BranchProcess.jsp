<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String branchKey = request.getParameter("BranchKeyInput");

DAO dao = new DAO(application);
DTO dto = dao.updateBranchKey(branchKey);
dao.close();

if (dto.getBranchKey() != null) {
	session.setAttribute("branchKey", dto.getBranchKey());
	response.sendRedirect("GameMain.jsp");
}else {
	request.setAttribute("BranchErr", "분기 코드가 틀렸습니다");
	request.getRequestDispatcher("GameMain.jsp").forward(request,response);
}
%>