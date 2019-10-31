<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>

        <c:if test="${user.id == ad.userId}">
            <c:forEach var="ad" items="${ads}">
                <div class="card text-center my-3" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">${ad.title}</h5>
                        <c:forEach var="cat" items="${ad.categories}">
                            <span class="badge badge-light mb-1">${cat}</span>
                        </c:forEach>
                        <hr>
                        <p class="card-text">${ad.description}</p>
                        <a href="/ad?id=${ad.id}" class="btn btn-primary">Go to Ad</a>
                    </div>
                </div>
            </c:forEach>
        </c:if>

    </div>

</body>
</html>
