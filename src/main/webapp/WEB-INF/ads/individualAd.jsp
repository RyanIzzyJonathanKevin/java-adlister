<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="View Current Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="card text-center">
        <div class="card-header display-4">${ad.title}</div>

        <div class="card-body">
            <p class="card-text">${ad.description}</p>

            <c:forEach var="cat" items="${ad.categories}">
                <span class="badge badge-light mb-1">${cat}</span>
            </c:forEach>
            <hr>
            <c:if test="${user.id == ad.userId}">
                <button type="button" class="btn btn-primary">Edit</button>
                <a href="/ad/delete?id=${ad.id}" class="btn btn-danger">Delete</a>
            </c:if>

        </div>
<%--        <div class="card-footer text-muted">--%>
<%--            ${ad.time}--%>
<%--        </div>--%>
    </div>
</div>







</body>
</html>
