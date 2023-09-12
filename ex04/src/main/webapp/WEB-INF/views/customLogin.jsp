<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<body>
<h1>로그인 폼~~~~~ </h1>
<h2>${error}</h2>
<h2>${logout}</h2>

<form method="post" action="/login">
	ID: &nbsp;&nbsp;<input type="text" name="username" /> <br>
	PW: <input type="password" name="password" />
	<button>눌러</button>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
</body>
</html>