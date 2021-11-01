<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}"></fmt:setLocale>
<fmt:setBundle basename="${bundle}"></fmt:setBundle>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<html>

<head>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script></head>

<title>Users</title>
</head>
<body>
<c:import url="components/header.jsp"/>
<div class="container">

    <h2><fmt:message key="users.header"/></h2>
    <form action="admin-users" method="post" id="userForm" role ="form">
        <input type="hidden" id ="userId" name ="userId">
        <input type="hidden" id ="action" name ="action">

        <table class="table">
            <thead>
            <tr>
                <td><fmt:message key="users.#"/></td>
                <td><fmt:message key="users.name"/></td>
                <td><fmt:message key="users.email"/></td>
                <td><fmt:message key="users.sex"/></td>
                <td><fmt:message key="users.phone"/></td>
                <td><fmt:message key="users.role"/></td>
                <td><fmt:message key="users.banlist"/></td>
                <td><fmt:message key="users.password"/></td>
                <td></td>
            </tr>
            </thead>

    <c:forEach items="${users}" var="user">

        <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.sex}</td>
        <td>${user.phone}</td>
        <td>${user.role}</td>
        <td>${user.banList}</td>
        <td>${user.password}</td>
        <td><a href="#" id="remove"
        onclick="document.getElementById('action').value = 'delete';
        document.getElementById('userId').value = '${user.id}';
        document.getElementById('userForm').submit();">
        delete
        </a>
        </td>
        </tr>
    </c:forEach>
        </table>

    </form>
    <a href="admin-add-user" class="btn btn-primary btn-md">new user</a>
</div>
<c:import url="components/footer.jsp"/>
</body>
</html>