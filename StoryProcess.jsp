<%@page import="escape.DTO"%>
<%@page import="escape.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String keyword = request.getParameter("StoryKeyInput");

DAO dao = new DAO(application);

DTO Dto = dao.SaveKeyword(keyword);
keyword = Dto.getKeyword();

	if (keyword == null){ //저장이나 불러오기
	keyword = request.getParameter("StoryKeyInput");
		if(keyword.equals("저장") || keyword.equals("불러오기")) response.sendRedirect("Join.jsp");
		else {
			%>
			<script>history.back()</script>
			<%
		}
	}else { //저장, 불러오기가 아니라면
		String branchKey = (String) session.getAttribute("branchKey");
		session.setAttribute("keyword", keyword);
		DTO dto = dao.getGameContent(branchKey, keyword);
		dao.close();
		if (dto.getContentText() != null) {
			session.setAttribute("ContentText", dto.getContentText());
			response.sendRedirect("GameMain.jsp");
		} else {
			request.setAttribute("StoryErr", "키워드가 틀렸습니다");
			request.getRequestDispatcher("GameMain.jsp").forward(request, response);
		}
	}

%>