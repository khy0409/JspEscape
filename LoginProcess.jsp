<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String login = request.getParameter("login");
String loginPass = request.getParameter("loginPass");

DAO dao = new DAO(application);
DTO dto = dao.loginUser(login, loginPass);
dao.close();

if (dto.getUserID() != null) {
	session.setAttribute("userID", dto.getUserID());
	session.setAttribute("pass", dto.getPass());
	response.sendRedirect("Join.jsp");
} else {
	request.setAttribute("LoginErr", "다시 시도해주세요");
	request.getRequestDispatcher("Join.jsp").forward(request, response);
}
%>