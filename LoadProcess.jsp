<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DTO Dto = new DTO();
request.setCharacterEncoding("UTF-8");
String userID = (String)session.getAttribute("userID");
String pass = (String)session.getAttribute("pass");

DAO dao = new DAO(application);
DTO dto = dao.LoadProgress(userID, pass);
dao.close();

if (dto.getCheck() != null) {
	session.setAttribute("ContentText", dto.getContentText());
	session.setAttribute("keyword", dto.getKeyword());
	session.setAttribute("branchKey", dto.getBranchKey());
	session.setAttribute("Load", "불러오기 완료");
	response.sendRedirect("Join.jsp");
} else {
	session.setAttribute("Load", "다시 시도해주세요");
	request.getRequestDispatcher("Join.jsp").forward(request, response);
}
%>