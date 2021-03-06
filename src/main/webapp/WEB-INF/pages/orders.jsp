<%--
  Created by IntelliJ IDEA.
  User: dmytro
  Date: 10/23/21
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${locale}"></fmt:setLocale>
<fmt:setBundle basename="${bundle}"></fmt:setBundle>
<html>

<head>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script></head>

<title>Orders</title>
</head>
<body>
<c:import url="components/header.jsp"/>
<div class="container">

<h2><fmt:message key="orders.orders"/></h2>
</br>
</br>

    <table class="table">
        <thead>
        <tr>
            <td><fmt:message key="orders.#"/></td>
            <td><fmt:message key="books.book.name"/></td>
            <td><fmt:message key="orders.book.spot"/></td>
            <td><fmt:message key="orders.status"/></td>
            <td><fmt:message key="orders.return.date"/></td>
            <td><fmt:message key="orders.penalty"/></td>
        </tr>
        </thead>

    <c:forEach items="${allOrders}" var="order" varStatus="loop">
        <tr>
        <td>${loop.count}</td>
        <td>${order.bookData.bookName}</td>
        <td>
            <c:if test="${order.bookSpot eq 'abonement'}">
            <fmt:message key="abonement"/>
        </c:if>
            <c:if test="${order.bookSpot eq 'library hall'}">
                <fmt:message key="library.hall"/>
            </c:if>
</td>
        <td>
            <c:if test="${order.status eq 'expected'}">
                <fmt:message key="expected"/>
            </c:if>
            <c:if test="${order.status eq 'checked out'}">
                <fmt:message key="checked.out"/>
            </c:if>
            <c:if test="${order.status eq 'returned'}">
                <fmt:message key="returned"/>
            </c:if>
        </td>
        <td>${order.returnDate}</td>
           <c:if test="${not empty order.penaltyData}">
               <td>${order.penaltyData.penaltyCost}</td>
           </c:if>

        </tr>
        </c:forEach>
    </table>


</div>
<c:import url="components/footer.jsp"/>
</body>
</html>
