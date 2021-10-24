<%--
  Created by IntelliJ IDEA.
  User: dmytro
  Date: 10/12/21
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<html>

<head><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <title>Registration</title>
</head>
<body>
<c:import url="components/header.jsp"/>
<div class="container">

<h2>Registration form</h2>
</br>
</br>
<form action="registration" method="post" >
    Name:
    <input type = "text" name="name" required >
    </br>
    Email:
    <input type = "text" name="email" required >
    </br>
    Password:
    <input type = "text" name="password" required >
    </br>
    </br>
    Confirm Password:
    <input type = "text" name="confirm_password" required >
    </br>
    Phone:
    <input type = "text" name="phone" required >
    </br>
    Sex:
    <input type = "text" name="sex" required >
    </br>

    <button type = "submit">Register</button>
</form>
</div>
<c:import url="components/footer.jsp"/>
</body>
</html>
