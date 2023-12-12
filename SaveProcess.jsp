<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DTO Dto = new DTO();
request.setCharacterEncoding("UTF-8");
String userID = (String)session.getAttribute("userID");
String pass = (String)session.getAttribute("pass");
String contentText = (String)session.getAttribute("ContentText");
String keyword = (String)session.getAttribute("keyword");
String branchKey = (String)session.getAttribute("branchKey");
if(keyword == null) {
	session.setAttribute("Save", "게임 시작 후 시도해 주세요");
	request.getRequestDispatcher("Join.jsp").forward(request, response);
}else {
DAO dao = new DAO(application);
DTO dto = dao.SaveProgress(userID, pass, contentText, keyword, branchKey);
dao.close();

if (dto.getText() != null) {
	session.setAttribute("Save", "저장 완료");
	response.sendRedirect("Join.jsp");
} else {
	session.setAttribute("Save", "다시 시도해주세요");
	request.getRequestDispatcher("Join.jsp").forward(request, response);
}
}
%>