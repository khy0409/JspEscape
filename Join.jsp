<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login,Join</title>
<link rel="stylesheet" href="../CSS/Join.css">
</head>
<body>
	<%
	String JoinErr = (String) request.getAttribute("JoinErr");
	String LoginErr = (String) request.getAttribute("LoginErr");
	String Save = (String) session.getAttribute("Save");
	String Load = (String) session.getAttribute("Load");
	if (session.getAttribute("userID") == null) {
	%>
	<script>
	function JoinForm(form) {
		if (!form.join.value) {
			alert("아이디를 입력하세요");
			return false;
		}
		if (form.joinPass.value =="") {
			alert("패스워드를 입력하세요");
			return false;
		}
	}
	</script>
	<div class="container right-panel-active">
		<div class="container__form container--signup">
			<form action="JoinProcess.jsp" method="post" name="joinForm"
				onsubmit="return JoinForm(this);">
				<div class="form" id="form1">
					<h2 class="form__title">회원가입</h2>

					<input type="text" placeholder="아이디" class="input" name="join" /> <input
						type="password" placeholder="비밀번호" class="input" name="joinPass" />

					<a href="GameMain.jsp" class="BeforeA">돌아가기</a>

					<%=JoinErr == null ? "" : request.getAttribute("JoinErr")%>
					<br /> <input type="submit" class="btn" placeholder="제출">
				</div>
			</form>
		</div>
		<script>
	function LoginForm(form) {
		if (!form.login.value) {
			alert("아이디를 입력하세요");
			return false;
		}
		if (form.loginPass.value =="") {
			alert("패스워드를 입력하세요");
			return false;
		}
	}
	</script>
		<div class="container__form container--signin">
			<form action="LoginProcess.jsp" method="post" name="loginForm"
				onsubmit="return LoginForm(this);">
				<div class="form" id="form2">

					<h2 class="form__title">로그인</h2>

					<input type="text" placeholder="아이디" class="input" name="login" />
					<input type="password" placeholder="비밀번호" class="input"
						name="loginPass" /> <a href="GameMain.jsp" class="BeforeA">돌아가기</a>

					<%=LoginErr == null ? "" : request.getAttribute("LoginErr")%>
					<br /> <input type="submit" class="btn" placeholder="제출">
				</div>
			</form>
		</div>

		<div class="container__overlay">
			<div class="overlay">
				<div class="overlay__panel overlay--left">
					<button class="btn" id="signIn">로그인</button>
				</div>
				<div class="overlay__panel overlay--right">
					<button class="btn" id="signUp">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="after">
		<p class="LoginAfter"><%=session.getAttribute("userID")%>회원님, 로그인되셨습니다.</p>
	<hr>
		<a href="LoadProcess.jsp" class="AfterA"> 불러오기 </a>	
		<p class="ALoad"><%=Load == null ? "" : session.getAttribute("Load")%></p> 
		
		<a href="SaveProcess.jsp" class="AfterB"> 저장하기 </a> <br />	
		<p class="BSave"><%=Save == null ? "" : session.getAttribute("Save")%></p>
	</div>
	<%
	}
	%>
	<a href="GameMain.jsp" class="AfterC">돌아가기</a>
	<script>
const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

fistForm.addEventListener("submit", (e) => e.preventDefault());
secondForm.addEventListener("submit", (e) => e.preventDefault());
</script>
</body>
</html>