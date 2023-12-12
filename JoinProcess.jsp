<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String join = request.getParameter("join");
String joinPass = request.getParameter("joinPass");

DAO dao = new DAO(application);
DTO dto = dao.insertUser(join, joinPass);
dao.close();

if (dto.getUserID() != null) {
	session.setAttribute("userID", dto.getUserID());
	session.setAttribute("pass", dto.getPass());
	response.sendRedirect("Join.jsp");
} else {
	request.setAttribute("JoinErr", "다른 아이디로 시도해주세요");
	request.getRequestDispatcher("Join.jsp").forward(request, response);
}
%>