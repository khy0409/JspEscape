<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/GameGuide.css">
<title>Game Guide</title>
<%
if (session.getAttribute("branchKey") == null) session.setAttribute("branchKey", "start");
%>
</head>
<body>
	<header id="header">
		<h1 title="도제 개인 프로젝트">JSP escape</h1>
		<p>"잃어버린 기억"</p>
	</header>
	
	<div>
	<h2>게임 방법</h2>
			<p>게임을 진행하려면, 스토리에 나오는 키워드를 키워드 창에 입력해야 합니다</p>
			<br />
			<p> 키워드는 한 개일 수도 있고, 여러개일 수도 있습니다</p>
			<br />
			<p>키워드는 (시작)처럼 드러나있기도하지만, (?)처럼 숨겨져 있어서 찾아내야 하는 것도 있습니다</p>
			<br />
			<p>숨겨진 키워드는 게임을 진행하며 스토리내에서 찾아내야 합니다</p>
			<br />
			<p>(저장/불러오기) 키워드를 통해 현재의 진행상황을 저장하거나 불러올 수 있습니다</p>
			<br />
			<p>(저장)은 게임 진행중 언제나 할 수 있으므로 키워드를 기억해주세요</p>
			<br />
			<p>(시작/저장/불러오기)</p>
		<form method="post" name="StoryForm" action="StoryProcess.jsp">
			<input type="text" name="StoryKeyInput" placeholder="키워드를 입력하세요" spellcheck="false"/>
		</form>
	</div>

</body>
</html>